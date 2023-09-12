Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C901E79D77E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 19:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234884AbjILRZa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Sep 2023 13:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234306AbjILRZ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Sep 2023 13:25:29 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99CB410E9
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 10:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694539525; x=1726075525;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=XfvAjdIQYlusp0KHziv9RUQYhTytJjRY97AWDKXS+5s=;
  b=cBhFvUZCELJmZ/au9+90Q1NZjm4F9yf8GzvPDCnZ7d6CDiyZL6ylhvkp
   sdLNc6NNII3BMsxICxa3p9q9YDNm/rYLIcFRCTZQIgstzXsJL6IhGG102
   gq81LCZTEiZEdbHTQMgbr6vpGomX9mn5x5GZc3dJQ9+cGujmLz+m3pqvb
   lOtb9lcbTqu4BBKB6DEWp6ciCwAV00QXSHw0ySgwMWphSXNwSRd99Tmmu
   NdzCjRKGUxhDV93185QUdv0yOoaOtNibVuS7tOIvl9YxMn2m0P2Kjxhwu
   VutKh0l7pZjiX+wLLe67kJ9ffdnJqcB+AoZaj6Qq44RVxyZIJ2hQs/WU0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="382252375"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="382252375"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 10:25:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="887014419"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="887014419"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.63.206])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 10:24:54 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: skip validity check for DP CTS
 EDID checksum
In-Reply-To: <36b5dd86-0532-882a-4220-33b38fab2a63@quicinc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230901142034.580802-1-jani.nikula@intel.com>
 <CAE-0n52T4VGVVKqZCJwhpxe=vLUb7WNi=J0hdsHFOqA95u-Ymg@mail.gmail.com>
 <877covy4bl.fsf@intel.com>
 <36b5dd86-0532-882a-4220-33b38fab2a63@quicinc.com>
Date:   Tue, 12 Sep 2023 20:25:19 +0300
Message-ID: <87y1hbwbgg.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 12 Sep 2023, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> Hi Jani
>
> On 9/12/2023 5:16 AM, Jani Nikula wrote:
>> On Thu, 07 Sep 2023, Stephen Boyd <swboyd@chromium.org> wrote:
>>> Quoting Jani Nikula (2023-09-01 07:20:34)
>>>> The DP CTS test for EDID last block checksum expects the checksum for
>>>> the last block, invalid or not. Skip the validity check.
>>>>
>>>> For the most part (*), the EDIDs returned by drm_get_edid() will be
>>>> valid anyway, and there's the CTS workaround to get the checksum for
>>>> completely invalid EDIDs. See commit 7948fe12d47a ("drm/msm/dp: return
>>>> correct edid checksum after corrupted edid checksum read").
>>>>
>>>> This lets us remove one user of drm_edid_block_valid() with hopes the
>>>> function can be removed altogether in the future.
>>>>
>>>> (*) drm_get_edid() ignores checksum errors on CTA extensions.
>>>>
>>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
>>>> Cc: Marijn Suijten <marijn.suijten@somainline.org>
>>>> Cc: Rob Clark <robdclark@gmail.com>
>>>> Cc: Sean Paul <sean@poorly.run>
>>>> Cc: Stephen Boyd <swboyd@chromium.org>
>>>> Cc: linux-arm-msm@vger.kernel.org
>>>> Cc: freedreno@lists.freedesktop.org
>>>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>>> ---
>>>
>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> 
>> Thanks; is that enough to merge? I can't claim I would have been able to
>> test this.
>> 
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> Change looks fine.
>
> We can pick this up in the MSM tree if you would like.

I'd appreciate that, thanks!

BR,
Jani.

>
> Dmitry, you can please pick this up along with my R-b and Kuogee's R-b 
> as well.
>
> I think his R-b got misformatted. I can ask him to add that again.
>
>>>
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>>>> index 42d52510ffd4..86a8e06c7a60 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>>>> @@ -289,26 +289,9 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
>>>>
>>>>   static u8 dp_panel_get_edid_checksum(struct edid *edid)
>>>
>>> It would be nice to make 'edid' const here in another patch.
>> 
>> Sure.
>> 
>> BR,
>> Jani.
>> 
>> 

-- 
Jani Nikula, Intel
