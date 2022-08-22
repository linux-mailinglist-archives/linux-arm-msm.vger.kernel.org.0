Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 259BE59C66F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 20:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237548AbiHVSeI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 14:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237326AbiHVSdp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 14:33:45 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C090120A5
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 11:33:38 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id z20so11450113ljq.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 11:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=xPEThM+voZDV86XHw2ieneCB0y1qVMLkDtKoP7Y2Jt4=;
        b=rFwkarzxAseZgLgg/cI11bLRRWGARO/BnewzUo0tAQ8MNbQDPfJOjvoaZz1j+mBtNW
         JOF8fyavWDKwQrUT8bleo2ltgPJEc1R1G9LdLrBEt7IKAbXNnDittl6glibkX14NaAdw
         vCbrVRJ1EzLmw3wCSK7lTv9twk9+H745sHXJqnb2XbtcKNM585QAnYMrAWZzcMWgKSxu
         QgpylCBP/ZUyBQGJCxfBy/+NQnZt2XHON/h9GwmbAjdwdOMp0NSh6UeHetWIk+YMVKLN
         PZ2F++B4Zj5yiZK8vswFI5Q148yQjim1+ZRCVX0u7kPbkLxPOuyJGNqgtCKa9KpcWiNa
         4bEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=xPEThM+voZDV86XHw2ieneCB0y1qVMLkDtKoP7Y2Jt4=;
        b=0o4ZugQJTBJxvhyH0Vf8FcaOTUDBB3KLz3YD4KDOw2qs0ILf776Hz92yGDyvca2KQW
         3OzZv5nHy/wQcrSRlr/Oup/6te18pqLsXWIO8/akaFMqn5aHpzphr+H9h0oURyILX1ok
         W12inJKHmoyEp1ecoeoXhn+AgaQrqYZ0IwXtR4MzEC+L4UCC3RWKjpSAqOeyJs9i93C+
         zb/xFSnbsFwBaR6TJOSpvnGcRUyYeTrACvCgmcxK1IBu7lhhoaSiRXNwn+8UMm4WvwZp
         1DtA7y70xt+E7C4MVyg8v/XDt5yKb4lYrVXN0s5pDpvFoZWuJ8gv1v1+nx+Y45I3/Zfl
         uJEQ==
X-Gm-Message-State: ACgBeo24XEshJ3eXS49yZr7WEbpt9URIVrl5rVh9TWCtW2k8b4KJjuQa
        idVkdnwDltOUH7P1WSt1Fhrgpw==
X-Google-Smtp-Source: AA6agR6Ot4kr92MbagLAF+U3AjLjw9N6TXLxOqO6ux2vh8enPEa3LnqhmraZ913NIaS6vrL3aUmC8g==
X-Received: by 2002:a2e:712:0:b0:25e:c39b:45cf with SMTP id 18-20020a2e0712000000b0025ec39b45cfmr6527984ljh.511.1661193216666;
        Mon, 22 Aug 2022 11:33:36 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w12-20020a05651204cc00b0048b0696d0b1sm2042260lfq.90.2022.08.22.11.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 11:33:36 -0700 (PDT)
Message-ID: <bb153360-6567-c4d5-dc23-8586549df8c8@linaro.org>
Date:   Mon, 22 Aug 2022 21:33:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] drm/msm/dp: add atomic_check to bridge ops
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
References: <1660759314-28088-1-git-send-email-quic_khsieh@quicinc.com>
 <f211520a-cb9c-1202-0752-7bb200726ae8@linaro.org>
 <d4b3c303-fc20-537d-0e69-6e19826b6e59@quicinc.com>
 <266c0531-344e-5589-2143-02ab1fe9b276@linaro.org>
 <724d695d-0293-db81-7014-57cb96bd6d4b@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <724d695d-0293-db81-7014-57cb96bd6d4b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/08/2022 20:32, Abhinav Kumar wrote:
> 
> 
> On 8/22/2022 9:49 AM, Dmitry Baryshkov wrote:
>> On 22/08/2022 19:38, Abhinav Kumar wrote:
>>> Hi Dmitry
>>>
>>> On 8/22/2022 9:18 AM, Dmitry Baryshkov wrote:
>>>> On 17/08/2022 21:01, Kuogee Hsieh wrote:
>>>>> DRM commit_tails() will disable downstream crtc/encoder/bridge if
>>>>> both disable crtc is required and crtc->active is set before pushing
>>>>> a new frame downstream.
>>>>>
>>>>> There is a rare case that user space display manager issue an extra
>>>>> screen update immediately followed by close DRM device while down
>>>>> stream display interface is disabled. This extra screen update will
>>>>> timeout due to the downstream interface is disabled but will cause
>>>>> crtc->active be set. Hence the followed commit_tails() called by
>>>>> drm_release() will pass the disable downstream crtc/encoder/bridge
>>>>> conditions checking even downstream interface is disabled.
>>>>> This cause the crash to happen at dp_bridge_disable() due to it trying
>>>>> to access the main link register to push the idle pattern out while 
>>>>> main
>>>>> link clocks is disabled.
>>>>>
>>>>> This patch adds atomic_check to prevent the extra frame will not
>>>>> be pushed down if display interface is down so that crtc->active
>>>>> will not be set neither. This will fail the conditions checking
>>>>> of disabling down stream crtc/encoder/bridge which prevent
>>>>> drm_release() from calling dp_bridge_disable() so that crash
>>>>> at dp_bridge_disable() prevented.
>>>>
>>>> I must admit I had troubles parsing this description. However if I 
>>>> got you right, I think the check that the main link clock is running 
>>>> in the dp_bridge_disable() or dp_ctrl_push_idle() would be a better 
>>>> fix.
>>>
>>> Originally, thats what was posted 
>>> https://patchwork.freedesktop.org/patch/496984/.
>>
>> This patch is also not so correct from my POV. It checks for the hpd 
>> status, while in reality it should check for main link clocks being 
>> enabled.
>>
> 
> We can push another fix to check for the clk state instead of the hpd 
> status. But I must say we are again just masking something which the fwk 
> should have avoided isnt it?
> 
> As per the doc in the include/drm/drm_bridge.h it says,
> 
> "*
>   * The bridge can assume that the display pipe (i.e. clocks and timing
>   * signals) feeding it is still running when this callback is called.
>   *"

Yes, that's what I meant about this chunk begging to go to the core. In 
my opinion, if we are talking about the disconnected sinks, it is the 
framework who should disallow submitting the frames to the disconnected 
sinks.

> 
> By adding an extra layers of protection in the driver, we are just 
> avoiding another issue but the commit should not have been issued in the 
> first place.
> 
> So shouldnt we do both then? That is add protection to check if clock is 
> ON and also, reject commits when display is disconnected.
> 
>>>
>>> Then it seemed like we were just protecting against an issue in the 
>>> framework which was allowing the frames to be pushed even after the 
>>> display was disconnected. The DP driver did send out the disconnect 
>>> event correctly and as per the logs, this frame came down after that 
>>> and the DRM fwk did allow it.
>>>
>>> So after discussing on IRC with Rob, we came up with this approach that
>>> if the display is not connected, then atomic_check should fail. That 
>>> way the commit will not happen.
>>>
>>> Just seemed a bit cleaner instead of adding all our protections.
>>
>> The check to fail atomic_check if display is not connected seems out 
>> of place. In its current way it begs go to the upper layer, forbidding 
>> using disconnected sinks for all the drivers. There is nothing special 
>> in the MSM DP driver with respect to the HPD events processing and 
>> failing atomic_check() based on that.
>>
> 
> Why all the drivers? This is only for MSM DP bridge.

Yes, we change the MSM DRM driver. But the check is generic enough. I'm 
not actually insisting on pushing the check to the core, just trying to 
understand the real cause here.

> 
>>>
>>>>
>>>>>
>>>>> SError Interrupt on CPU7, code 0x00000000be000411 -- SError
>>>>> CPU: 7 PID: 3878 Comm: Xorg Not tainted 5.19.0-stb-cbq #19
>>>>> Hardware name: Google Lazor (rev3 - 8) (DT)
>>>>> pstate: a04000c9 (NzCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>>> pc : __cmpxchg_case_acq_32+0x14/0x2c
>>>>> lr : do_raw_spin_lock+0xa4/0xdc
>>>>> sp : ffffffc01092b6a0
>>>>> x29: ffffffc01092b6a0 x28: 0000000000000028 x27: 0000000000000038
>>>>> x26: 0000000000000004 x25: ffffffd2973dce48 x24: 0000000000000000
>>>>> x23: 00000000ffffffff x22: 00000000ffffffff x21: ffffffd2978d0008
>>>>> x20: ffffffd2978d0008 x19: ffffff80ff759fc0 x18: 0000000000000000
>>>>> x17: 004800a501260460 x16: 0441043b04600438 x15: 04380000089807d0
>>>>> x14: 07b0089807800780 x13: 0000000000000000 x12: 0000000000000000
>>>>> x11: 0000000000000438 x10: 00000000000007d0 x9 : ffffffd2973e09e4
>>>>> x8 : ffffff8092d53300 x7 : ffffff808902e8b8 x6 : 0000000000000001
>>>>> x5 : ffffff808902e880 x4 : 0000000000000000 x3 : ffffff80ff759fc0
>>>>> x2 : 0000000000000001 x1 : 0000000000000000 x0 : ffffff80ff759fc0
>>>>> Kernel panic - not syncing: Asynchronous SError Interrupt
>>>>> CPU: 7 PID: 3878 Comm: Xorg Not tainted 5.19.0-stb-cbq #19
>>>>> Hardware name: Google Lazor (rev3 - 8) (DT)
>>>>> Call trace:
>>>>>   dump_backtrace.part.0+0xbc/0xe4
>>>>>   show_stack+0x24/0x70
>>>>>   dump_stack_lvl+0x68/0x84
>>>>>   dump_stack+0x18/0x34
>>>>>   panic+0x14c/0x32c
>>>>>   nmi_panic+0x58/0x7c
>>>>>   arm64_serror_panic+0x78/0x84
>>>>>   do_serror+0x40/0x64
>>>>>   el1h_64_error_handler+0x30/0x48
>>>>>   el1h_64_error+0x68/0x6c
>>>>>   __cmpxchg_case_acq_32+0x14/0x2c
>>>>>   _raw_spin_lock_irqsave+0x38/0x4c

You know, after re-reading the trace, I could not help but notice that 
the issue seems to be related to completion/timer/spinlock memory 
becoming unavailable rather than disabling the main link clock.
See, the SError comes in the spin_lock path, not during register read.

Thus I think the commit message is a bit misleading.

Can we please get a trace checking which calls were actually made for 
the dp bridge and if the dp/dp->ctrl memory pointers are correct?

I do not see the dp_display_disable() being called. Maybe I just missed 
the call.


>>>>>   lock_timer_base+0x40/0x78
>>>>>   __mod_timer+0xf4/0x25c
>>>>>   schedule_timeout+0xd4/0xfc
>>>>>   __wait_for_common+0xac/0x140
>>>>>   wait_for_completion_timeout+0x2c/0x54
>>>>>   dp_ctrl_push_idle+0x40/0x88
>>>>>   dp_bridge_disable+0x24/0x30
>>>>>   drm_atomic_bridge_chain_disable+0x90/0xbc
>>>>>   drm_atomic_helper_commit_modeset_disables+0x198/0x444
>>>>>   msm_atomic_commit_tail+0x1d0/0x374
>>>>>   commit_tail+0x80/0x108
>>>>>   drm_atomic_helper_commit+0x118/0x11c
>>>>>   drm_atomic_commit+0xb4/0xe0
>>>>>   drm_client_modeset_commit_atomic+0x184/0x224
>>>>>   drm_client_modeset_commit_locked+0x58/0x160
>>>>>   drm_client_modeset_commit+0x3c/0x64
>>>>>   __drm_fb_helper_restore_fbdev_mode_unlocked+0x98/0xac
>>>>>   drm_fb_helper_set_par+0x74/0x80
>>>>>   drm_fb_helper_hotplug_event+0xdc/0xe0
>>>>>   __drm_fb_helper_restore_fbdev_mode_unlocked+0x7c/0xac
>>>>>   drm_fb_helper_restore_fbdev_mode_unlocked+0x20/0x2c
>>>>>   drm_fb_helper_lastclose+0x20/0x2c
>>>>>   drm_lastclose+0x44/0x6c
>>>>>   drm_release+0x88/0xd4
>>>>>   __fput+0x104/0x220
>>>>>   ____fput+0x1c/0x28
>>>>>   task_work_run+0x8c/0x100
>>>>>   do_exit+0x450/0x8d0
>>>>>   do_group_exit+0x40/0xac
>>>>>   __wake_up_parent+0x0/0x38
>>>>>   invoke_syscall+0x84/0x11c
>>>>>   el0_svc_common.constprop.0+0xb8/0xe4
>>>>>   do_el0_svc+0x8c/0xb8
>>>>>   el0_svc+0x2c/0x54
>>>>>   el0t_64_sync_handler+0x120/0x1c0
>>>>>   el0t_64_sync+0x190/0x194
>>>>> SMP: stopping secondary CPUs
>>>>> Kernel Offset: 0x128e800000 from 0xffffffc008000000
>>>>> PHYS_OFFSET: 0x80000000
>>>>> CPU features: 0x800,00c2a015,19801c82
>>>>> Memory Limit: none
>>>>>
>>>>> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for 
>>>>> display enable and disable")
>>>>> Reported-by: Leonard Lausen <leonard@lausen.nl>
>>>>> Suggested-by: Rob Clark <robdclark@gmail.com>
>>>>> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/17
>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/dp/dp_drm.c | 23 +++++++++++++++++++++++
>>>>>   1 file changed, 23 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c 
>>>>> b/drivers/gpu/drm/msm/dp/dp_drm.c
>>>>> index 6df25f7..c682588 100644
>>>>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
>>>>> @@ -31,6 +31,25 @@ static enum drm_connector_status 
>>>>> dp_bridge_detect(struct drm_bridge *bridge)
>>>>>                       connector_status_disconnected;
>>>>>   }
>>>>> +static int dp_bridge_atomic_check(struct drm_bridge *bridge,
>>>>> +                struct drm_bridge_state *bridge_state,
>>>>> +                struct drm_crtc_state *crtc_state,
>>>>> +                struct drm_connector_state *conn_state)
>>>>> +{
>>>>> +    struct msm_dp *dp;
>>>>> +
>>>>> +    dp = to_dp_bridge(bridge)->dp_display;
>>>>> +
>>>>> +    drm_dbg_dp(dp->drm_dev, "is_connected = %s\n",
>>>>> +        (dp->is_connected) ? "true" : "false");
>>>>> +
>>>>> +    if (bridge->ops & DRM_BRIDGE_OP_HPD)
>>>>> +        return (dp->is_connected) ? 0 : -ENOTCONN;
>>
>> This raises questions if this will work for the configurations when 
>> other bridge is used for HPD events.
>>
>> Let's not mix the levels of processing. If we should not disable the 
>> link because it is already disabled, let's just do so rather than 
>> failing the atomic_check().
>>
> 
> This is only for MSM DP's bridge. If we use another bridge which is 
> capable of handling its own HPD, then that time MSM DP's bridge shouldnt 
> set this flag.

Not quite. The bridges set the ops to describe the ops that they support 
themselves. Then the drm_bridge_connectors selects the bridge handling 
hpd, etc. So the DRM_BRIDGE_OP_HPD is always set for DP sources. But the 
question is quite the opposite: if we have the next bridge (e.g. the 
usb-c-connector or the display-connector), will the is_connected field 
be set correctly?

> 
> We can even replace this check with just checking if connector_type is 
> DP but that would again open the discussion of having DP/eDP specific 
> checks so we did it this way.
> 
> 
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +
>>>>>   /**
>>>>>    * dp_bridge_get_modes - callback to add drm modes via 
>>>>> drm_mode_probed_add()
>>>>>    * @bridge: Poiner to drm bridge
>>>>> @@ -61,6 +80,9 @@ static int dp_bridge_get_modes(struct drm_bridge 
>>>>> *bridge, struct drm_connector *
>>>>>   }
>>>>>   static const struct drm_bridge_funcs dp_bridge_ops = {
>>>>> +    .atomic_duplicate_state = 
>>>>> drm_atomic_helper_bridge_duplicate_state,
>>>>> +    .atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
>>>>> +    .atomic_reset           = drm_atomic_helper_bridge_reset,
>>>>>       .enable       = dp_bridge_enable,
>>>>>       .disable      = dp_bridge_disable,
>>>>>       .post_disable = dp_bridge_post_disable,
>>>>> @@ -68,6 +90,7 @@ static const struct drm_bridge_funcs 
>>>>> dp_bridge_ops = {
>>>>>       .mode_valid   = dp_bridge_mode_valid,
>>>>>       .get_modes    = dp_bridge_get_modes,
>>>>>       .detect       = dp_bridge_detect,
>>>>> +    .atomic_check = dp_bridge_atomic_check,
>>>>>   };
>>>>>   struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, 
>>>>> struct drm_device *dev,
>>>>
>>

-- 
With best wishes
Dmitry

