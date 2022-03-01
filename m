Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFD174C8DFE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 15:39:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbiCAOkM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 09:40:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234116AbiCAOkJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 09:40:09 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F167264B;
        Tue,  1 Mar 2022 06:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646145568; x=1677681568;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DRmNmAo5LxqGAA9xWA1po2CgEZAaq3Bwkeuu4aOIzQw=;
  b=XbY8LbEEIW8VeiKOzcnUaqrPstvw18WdbjWEQiEKBuSQpsZOrAC2+xsn
   ilZRSMeMtRQpE48AXfEl9BzE949h9UK/IyRAaMceDEvNyP49CmBNB+ldT
   bbyqLTP+qa9xv+7YWeZ4cn4nzD3HbDWFO3r+tJ053GKvKumCkWoDY27rj
   8qStFSKuK4fFW8+fvciduF/cs6lqdziRu8sQOfI2uatNdy6oz+XdFCqae
   EVc2z43RIiOKltdcHYycCT+loh0ZwE/cGb0fv0gnfQ3ktXyby8apDhuIn
   RXLhaiQxLtyVVK0zAOEVk/PE9PJL3J9p246mq1XhuaxRrbiyXR2qaAvSi
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="253333704"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="253333704"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 06:39:28 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="510532163"
Received: from ssahani-mobl.amr.corp.intel.com (HELO [10.212.127.177]) ([10.212.127.177])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 06:39:25 -0800
Message-ID: <559c9698-f182-fa93-d6a7-009aadfd8c66@linux.intel.com>
Date:   Tue, 1 Mar 2022 14:39:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] drm/msm: Expose client engine utilization via fdinfo
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20220225202614.225197-1-robdclark@gmail.com>
 <20220225202614.225197-3-robdclark@gmail.com>
 <CAF6AEGvXs9etrtBUP5fAx7z6pLMV76a-FEXrdk2gY8npDHrFnA@mail.gmail.com>
 <f460b115-6ff6-7f69-8b0d-174c4defc771@linux.intel.com>
 <CAF6AEGsNHkODt4oOgAhLdrik1Jt-cfcyjk+nGzDhSMNfFMEWsA@mail.gmail.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGsNHkODt4oOgAhLdrik1Jt-cfcyjk+nGzDhSMNfFMEWsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 28/02/2022 16:01, Rob Clark wrote:
> On Mon, Feb 28, 2022 at 6:33 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 25/02/2022 22:14, Rob Clark wrote:
>>> On Fri, Feb 25, 2022 at 12:25 PM Rob Clark <robdclark@gmail.com> wrote:
>>>>
>>>> From: Rob Clark <robdclark@chromium.org>
>>>>
>>>> Similar to AMD commit
>>>> 874442541133 ("drm/amdgpu: Add show_fdinfo() interface"), using the
>>>> infrastructure added in previous patches, we add basic client info
>>>> and GPU engine utilisation for msm.
>>>>
>>>> Example output:
>>>>
>>>>           # cat /proc/`pgrep glmark2`/fdinfo/6
>>>>           pos:    0
>>>>           flags:  02400002
>>>>           mnt_id: 21
>>>>           ino:    162
>>>>           drm-driver:     msm
>>>>           drm-client-id:  7
>>>>           drm-engine-gpu: 1734371319 ns
>>>>           drm-cycles-gpu: 1153645024
>>
>> Nice, so my vendor agnostic actually worked (with that single fixup of
>> accounting for the fact pdev tag is optional)?
>>
>>> Note that it might be useful to have a standardized way to report # of
>>> cycles and max freq, so userspace tool can derive %utilization in
>>> addition to just %busy
>>
>> How do you define %utilisation vs %busy - I don't exactly follow since I
>> see the two as same?
> 
> so, say you are running at 50% of max clk, and gpu is busy 70% of the
> time.  The utilization is only 35% because the gpu could scale up the
> clk to get more work done.

Got it, thanks. I don't think we have the equivalent on the i915 side 
(we do have global frequency reporting via perf/PMU). In general things 
like these I imagined would be defined as driver specific tags. If you 
look at the drm-usage-stats.rst in my series, there is a "Driver 
specific implementations" section in there which links to the i915 doc 
section.

I've also put a "big fat" comment into the i915 fdinfo fops vfunc 
pointing back to drm-usage-stats.rst which I think is useful when large 
teams work on a driver. Not sure if that applies to msm so just mentioning.

Since this all works for you, would you mind applying your ack against 
20220222140422.1121163-9-tvrtko.ursulin@linux.intel.com?

I need to get some updates r-b's for my series and then I submit it 
again to Dave and Daniel for final acks.

After that, for a 2nd/follow-up phase, I plan to re-surrect the amdgpu 
patch I had to make it compliant to common format, plus document the 
option of engine utilisation tag being in percentage units as exposed 
from that driver. And extending gputop to support that as well.

Regards,

Tvrtko

>> Looking at your patch I guess I don't understand the difference between
>> 'elapsed' and 'cycles' inside your retire_submit(). Both are scoped to a
>> single context and are not global? If 'elapsed' is time context has
>> spent on the GPU, cycles isn't the same just in a different unit?
> 
> Correct, we capture (from GPU cmdstream) two counters both before and
> after a submit (aka execbuf) runs, one is a fixed-rate counter, which
> gives us elapsed time.  The second is a counter that increments every
> clk cycle, which gives us the # of cycles.  With the two values, we
> can calculate GPU frequency.
> 
> BR,
> -R
> 
>> Regards,
>>
>> Tvrtko
>>
