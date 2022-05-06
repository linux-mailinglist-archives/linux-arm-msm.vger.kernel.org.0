Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBBA51D679
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 May 2022 13:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343501AbiEFLUN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 07:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244042AbiEFLUM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 07:20:12 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B385DA36;
        Fri,  6 May 2022 04:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651835790; x=1683371790;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Ffv8NjpypTctGSjcYAJAG04MB4c0QqG3L0uxm5pUCHs=;
  b=AqEcMMxg4dcJxqjyswDOJZb32SkX5hEiCSErwZnKdJhLsWvY8vTXlky3
   /xhA7Z00ErdU8WMVLdUg/ucpV4IF4DPyH5xwnI+zdE38R3roCqdvE2FVB
   /Q/EH8QwA+ElyK4WstwVVyne2wybmxKDDyCA+Aym3mOUGrv0/INh4TMVl
   6mkgc5GtNayfewMg1eMVR71FeN5mbKPvgzRFVsd6XteEsTX8PEHJeCUMx
   HZoE2TtkS97rLxIRfY8UBjG5FJ5sa2floO4bbFjMUYloBm3kYIdmAOOi1
   v4ryZP8pM5vLgE6v9XViBUaOEN6NplPKqFxhGO1SN1fp8v6I6u0vRfaP0
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="354873953"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="354873953"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 04:16:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="695132735"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost) ([10.249.157.88])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 04:16:25 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Doug Anderson <dianders@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] drm/edid: drm_add_modes_noedid() should set lowest
 resolution as preferred
In-Reply-To: <CAD=FV=XViHtOoQH3fm4yoRcUAkLkf0Wf4zPXUH0Zq5_09tZmjw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220426132121.RFC.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
 <CAD=FV=XViHtOoQH3fm4yoRcUAkLkf0Wf4zPXUH0Zq5_09tZmjw@mail.gmail.com>
Date:   Fri, 06 May 2022 14:16:22 +0300
Message-ID: <874k22lxmh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 05 May 2022, Doug Anderson <dianders@chromium.org> wrote:
> Ville,
>
> On Tue, Apr 26, 2022 at 1:21 PM Douglas Anderson <dianders@chromium.org> wrote:
>>
>> If we're unable to read the EDID for a display because it's corrupt /
>> bogus / invalid then we'll add a set of standard modes for the
>> display. When userspace looks at these modes it doesn't really have a
>> good concept for which mode to pick and it'll likely pick the highest
>> resolution one by default. That's probably not ideal because the modes
>> were purely guesses on the part of the Linux kernel.
>>
>> Let's instead set 640x480 as the "preferred" mode when we have no EDID.
>>
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> ---
>>
>>  drivers/gpu/drm/drm_edid.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>
> Someone suggested that you might have an opinion on this patch and
> another one I posted recently [1]. Do you have any thoughts on it?
> Just to be clear: I'm hoping to land _both_ this patch and [1]. If you
> don't have an opinion, that's OK too.
>
> [1] https://lore.kernel.org/r/20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid

There are a number of drivers with combos:

	drm_add_modes_noedid()
	drm_set_preferred_mode()

which I think would be affected by the change. Perhaps you should just
call drm_set_preferred_mode() in your referenced patch?

Alternatively, perhaps drm_set_preferred_mode() should erase the
previous preferred mode(s) if it finds a matching new preferred mode.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
