Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B99437E6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 21:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233906AbhJVTRT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Oct 2021 15:17:19 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:29155 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232476AbhJVTRT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Oct 2021 15:17:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634930101; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=7PLFWqeXbIw/FKPXXE0m5n+MeY5dORydeOsZzfigINM=; b=YgX3oBW9h5mfKhlZv9x3gxXWTf7EvA6tx8rAAKlCgHkb9k5TYoV744hhNAC5p8Edpt5rV2dG
 hkGSvHan7TZvlFL7Zq4k/ZDTRwdzsmGoN8JtY3bE/ZNfhWWKfVP5GiORJNY6H70n88OoAf0R
 ACu1SSXYp2JG8iiysKTZ8jDF/Bo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61730da8fd91319f0f490462 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 Oct 2021 19:14:48
 GMT
Sender: jesszhan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E9559C43460; Fri, 22 Oct 2021 19:14:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.0
Received: from [10.71.111.83] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jesszhan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 98E5DC4338F;
        Fri, 22 Oct 2021 19:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 98E5DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <d40ffca4-b7fd-1797-31b4-35b15e7a438b@codeaurora.org>
Date:   Fri, 22 Oct 2021 12:14:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 2/2] drm/msm/dpu: Remove dynamic allocation from atomic
 context
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Jessica Zhang <jesszhan@codeaurora.org>,
        Mark Yacoub <markyacoub@google.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20211022172053.3219597-1-robdclark@gmail.com>
 <20211022172053.3219597-2-robdclark@gmail.com>
From:   Jessica Zhang <jesszhan@codeaurora.org>
In-Reply-To: <20211022172053.3219597-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/22/2021 10:20 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> We know the upper bound on # of mixers (ie. two), so lets just allocate
> this on the stack.
>
> Fixes:
>
>     BUG: sleeping function called from invalid context at include/linux/sched/mm.h:201
>     in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 0, name: swapper/0
>     INFO: lockdep is turned off.
>     irq event stamp: 43642
>     hardirqs last  enabled at (43641): [<ffffffe24dd276bc>] cpuidle_enter_state+0x158/0x25c
>     hardirqs last disabled at (43642): [<ffffffe24dfff450>] enter_el1_irq_or_nmi+0x10/0x1c
>     softirqs last  enabled at (43620): [<ffffffe24d4103fc>] __do_softirq+0x1e4/0x464
>     softirqs last disabled at (43615): [<ffffffe24d48bd90>] __irq_exit_rcu+0x104/0x150
>     CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.15.0-rc3-debug+ #105
>     Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
>     Call trace:
>      dump_backtrace+0x0/0x18c
>      show_stack+0x24/0x30
>      dump_stack_lvl+0xa0/0xd4
>      dump_stack+0x18/0x34
>      ___might_sleep+0x1e0/0x1f0
>      __might_sleep+0x78/0x8c
>      slab_pre_alloc_hook.constprop.0+0x48/0x6c
>      __kmalloc+0xc8/0x21c
>      dpu_crtc_vblank_callback+0x158/0x1f8
>      dpu_encoder_vblank_callback+0x70/0xc4
>      dpu_encoder_phys_vid_vblank_irq+0x50/0x12c
>      dpu_core_irq+0x1bc/0x1d0
>      dpu_irq+0x1c/0x28
>      msm_irq+0x34/0x40
>      __handle_irq_event_percpu+0x15c/0x308
>      handle_irq_event_percpu+0x3c/0x90
>      handle_irq_event+0x54/0x98
>      handle_level_irq+0xa0/0xd0
>      handle_irq_desc+0x2c/0x44
>      generic_handle_domain_irq+0x28/0x34
>      dpu_mdss_irq+0x90/0xe8
>      handle_irq_desc+0x2c/0x44
>      handle_domain_irq+0x54/0x80
>      gic_handle_irq+0xd4/0x148
>      call_on_irq_stack+0x2c/0x54
>      do_interrupt_handler+0x4c/0x64
>      el1_interrupt+0x30/0xd0
>      el1h_64_irq_handler+0x18/0x24
>      el1h_64_irq+0x78/0x7c
>      arch_local_irq_enable+0xc/0x14
>      cpuidle_enter+0x44/0x5c
>      do_idle+0x248/0x268
>      cpu_startup_entry+0x30/0x48
>      rest_init+0x188/0x19c
>      arch_call_rest_init+0x1c/0x28
>      start_kernel+0x704/0x744
>      __primary_switched+0xc0/0xc8
>
> Fixes: 78d9b458cc21 ("drm/msm/dpu: Add CRC support for DPU")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 16 +++++-----------
>   1 file changed, 5 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 0ae397044310..80c0ae688734 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -182,21 +182,19 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>   {
>   	struct dpu_crtc_state *crtc_state;
>   	struct dpu_crtc_mixer *m;
> -	u32 *crcs;
> +	u32 crcs[CRTC_DUAL_MIXERS];
>   
>   	int i = 0;
>   	int rc = 0;
>   
>   	crtc_state = to_dpu_crtc_state(crtc->state);
> -	crcs = kcalloc(crtc_state->num_mixers, sizeof(*crcs), GFP_KERNEL);
>   
> -	if (!crcs)
> -		return -ENOMEM;
> +	static_assert(ARRAY_SIZE(crcs) == ARRAY_SIZE(crtc_state->mixers));
>   

Getting a C90 compiler warning for static_assert():

     In file included from ./include/linux/bits.h:22,
                     from ./include/linux/bitops.h:6,
                     from ./include/linux/kernel.h:12,
                     from ./include/linux/list.h:9,
                     from ./include/linux/wait.h:7,
                     from ./include/linux/wait_bit.h:8,
                     from ./include/linux/fs.h:6,
                     from ./include/linux/debugfs.h:15,
                     from drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:10:
     drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c: In function 
‘dpu_crtc_get_crc’:
     ./include/linux/build_bug.h:78:41: warning: ISO C90 forbids mixed 
declarations and code [-Wdeclaration-after-statement]
         78 | #define __static_assert(expr, msg, ...) 
_Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
     ./include/linux/build_bug.h:77:34: note: in expansion of macro 
‘__static_assert’
         77 | #define static_assert(expr, ...) __static_assert(expr, 
##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
     drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:192:2: note: in expansion 
of macro ‘static_assert’
     192 |  static_assert(ARRAY_SIZE(crcs) == 
ARRAY_SIZE(crtc_state->mixers));
         |  ^~~~~~~~~~~~~

Can be fixed by moving the static_assert() before `crtc_state = ...`

Thanks,

Jessica Zhang

>   	/* Skip first 2 frames in case of "uncooked" CRCs */
>   	if (crtc_state->crc_frame_skip_count < 2) {
>   		crtc_state->crc_frame_skip_count++;
> -		goto cleanup;
> +		return 0;
>   	}
>   
>   	for (i = 0; i < crtc_state->num_mixers; ++i) {
> @@ -210,16 +208,12 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>   
>   		if (rc) {
>   			DRM_DEBUG_DRIVER("MISR read failed\n");
> -			goto cleanup;
> +			return rc;
>   		}
>   	}
>   
> -	rc = drm_crtc_add_crc_entry(crtc, true,
> +	return drm_crtc_add_crc_entry(crtc, true,
>   			drm_crtc_accurate_vblank_count(crtc), crcs);
> -
> -cleanup:
> -	kfree(crcs);
> -	return rc;
>   }
>   
>   static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
