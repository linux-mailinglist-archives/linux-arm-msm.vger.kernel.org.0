Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9D026FAD12
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 13:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235826AbjEHLae (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 07:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235812AbjEHLaS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 07:30:18 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3143E3C3EE
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 04:30:16 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f1fe1208a4so2026953e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 04:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683545414; x=1686137414;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zyrnKZ/HX+JXKuDag3fCxX5qi7Ihwr10zpgG360FNdA=;
        b=wPFQLQFwzlBetSYiU4eEhAq/M0YtV8x52fy0mRfwVfKWUE42PW/SpOqbeoMDEtgmk7
         +SfunC/0tVBSRKFvfvLbWsBaknefXgGLrN5RxqhUDyLIOu/i3OAPofdmTATzY0Q69HFY
         GYJXXPDByQ0E1KIBL6S9hJZjoWSs67IU1yqnEYcGCvw8Y3hqUb0SBf369g7YagL8aNw4
         1xI2EtuumW2O1UKV1aTryHlmmro79atBkX2pqAG1r63beClcKG2+8S4tHVIb7FSwdee1
         xeeuqCNmBFS/+1NXzRwFI2/bxIJegxSpz2kULIlxOYDlgXH+vAjlmB7HqRRzQ8QeAm0L
         CL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683545414; x=1686137414;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zyrnKZ/HX+JXKuDag3fCxX5qi7Ihwr10zpgG360FNdA=;
        b=Gb0LxfABgS0ZQ18Eflw355T2EYNNt9r6usdzX4nvyKsxCgXT8AxGoDTn/LQTRjcXnR
         T4hLqPJ+Vhkk0HZ7WD8mlBn+tPjzjJtlHi3o2EVg26umW5Ve/Yc98/7JTQpEmbGIMW4D
         jb7KtEj0nuFvoqejMe6UJeUdNuzcMh1Q+v0d4TzXj9XBDOzDVbiSRl4y8qa+5DBznF4C
         d2W1rRfOHlhv26qGFiUiRkRdSoIKpAvfRkQqX6ofiAF/XOOcaHbX6LpN4ElWE3IHxHIq
         1NB3eYX0sT89nz9cdsJC13llzWGHydMvFk98PrPERxR9ixW3wQC9Wt8zuW7bRcEdQvvV
         ZVQw==
X-Gm-Message-State: AC+VfDwBKXy8ksHom1i8bMgCKootu4z+U/4bTT/sods2dG1ref+8b0NB
        OWnNWQaKOC8j/9LyzHXykQof0g==
X-Google-Smtp-Source: ACHHUZ52SZmNEftC7+4DfGNrTm/3kIjlkiFZCNV8L9bJpezPLNKT4PP5FIIFrKf+7UAdKShAZToV/g==
X-Received: by 2002:a19:5504:0:b0:4ed:c286:7ab6 with SMTP id n4-20020a195504000000b004edc2867ab6mr2506335lfe.67.1683545414199;
        Mon, 08 May 2023 04:30:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id f8-20020a19ae08000000b004f14ecc03f1sm970114lfc.100.2023.05.08.04.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 04:30:13 -0700 (PDT)
Message-ID: <ad351c02-1c29-3601-53e8-f8cdeca2ac63@linaro.org>
Date:   Mon, 8 May 2023 14:30:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] Revert "drm/msm/dp: Remove INIT_SETUP delay"
Content-Language: en-GB
To:     Leonard Lausen <leonard@lausen.nl>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     regressions@lists.linux.dev,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
References: <b0cc40d5-6de1-91cc-e2cd-f47cc53551e4@quicinc.com>
 <ebbcd56ac883d3c3d3024d368fab63d26e02637a@lausen.nl>
 <20230508021536.txtamifw2vkfncnx@ripper>
 <3802269cd54ce105ef6dece03b1b9af575b4fa06@lausen.nl>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3802269cd54ce105ef6dece03b1b9af575b4fa06@lausen.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/05/2023 14:02, Leonard Lausen wrote:
> Abhinav Kumar <quic_abhinavk@quicinc.com> writes:
>> On 5/7/2023 7:15 PM, Bjorn Andersson wrote:
>>> When booting with the cable connected on my X13s, 100 is long enough for
>>> my display to time out and require me to disconnect and reconnect the
>>> cable again.
>>>
>>> Do we have any idea of why the reduction to 0 is causing an issue when
>>> using the internal HPD?
>>>
>>> Regards,
>>> Bjorn
>> Yes, we do know why this is causing an issue. The cleaner patch for this
>> will be posted this week.
> 
> Great!
> 
>> There is no need to add the 100ms delay back yet.
>>
>> thanks for posting this but NAK on this patch till we post the fix this
>> week.
>>
>> Appreciate a bit of patience till then.
> 
> This regression is already part of the 6.3 stable release series. Will
> the new patch qualify for inclusion in 6.3.y? Or will it be part of 6.4
> and this revert should go into 6.3.y?

This is a tough situation, as landing a revert will break x13s, as noted 
by Bjorn. Given that the workaround is known at this moment, I would 
like to wait for the patch from Abhinav to appear, then we can decide 
which of the fixes should go to the stable kernel.

> 
> Even with this revert, there are additional regressions in 6.3 causing
> dpu errors and blank external display upon suspending and resuming the
> system while an external display is connected. Will your new patch also
> fix these regressions?
> 
> [  275.025497] [drm:dpu_encoder_phys_vid_wait_for_commit_done:488] [dpu error]vblank timeout
> [  275.025514] [drm:dpu_kms_wait_for_commit_done:510] [dpu error]wait for commit done returned -110
> [  275.064141] [drm:dpu_encoder_frame_done_timeout:2382] [dpu error]enc33 frame done timeout
> 
> followed by a kernel panic if any modification to the display settings
> is done, such as disabling the external display:

Interesting crash, thank you for the report.

> 
> [  341.631287] Hardware name: Google Lazor (rev3 - 8) (DT)
> [  341.631290] pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  341.631296] pc : do_raw_spin_unlock+0xb8/0xc4
> [  341.631310] lr : do_raw_spin_unlock+0x78/0xc4
> [  341.631315] sp : ffffffc01100b880
> [  341.631317] x29: ffffffc01100b880 x28: 0000000000000028 x27: 0000000000000038
> [  341.631326] x26: ffffff808c89e180 x25: ffffffef33e39920 x24: 0000000000000000
> [  341.631333] x23: ffffffef33e3ca0c x22: 0000000000000002 x21: ffffff808345ded8
> [  341.631339] x20: ffffff808345ded0 x19: 000000000000001e x18: 0000000000000000
> [  341.631345] x17: 0048000000000460 x16: 0441043b04600438 x15: 04380000089807d0
> [  341.631351] x14: 07b0089807800780 x13: 0000000000000068 x12: 0000000000000001
> [  341.631357] x11: ffffffef3413bb76 x10: 0000000000000bb0 x9 : ffffffef33e3d6bc
> [  341.631363] x8 : ffffff808c89ed90 x7 : ffffff80b1c9f738 x6 : 0000000000000001
> [  341.631370] x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffffff808345def0
> [  341.631375] x2 : 00000000dead4ead x1 : 0000000000000003 x0 : 0000000000000000
> [  341.631383] Kernel panic - not syncing: Asynchronous SError Interrupt
> [  341.631386] CPU: 3 PID: 1520 Comm: kwin_wayland Not tainted 6.3.0-stb-cbq+ #2
> [  341.631390] Hardware name: Google Lazor (rev3 - 8) (DT)
> [  341.631393] Call trace:
> [  341.631395]  dump_backtrace+0xc8/0x104
> [  341.631402]  show_stack+0x20/0x30
> [  341.631407]  dump_stack_lvl+0x48/0x60
> [  341.631414]  dump_stack+0x18/0x24
> [  341.631419]  panic+0x130/0x2fc
> [  341.631425]  nmi_panic+0x54/0x78
> [  341.631428]  arm64_serror_panic+0x74/0x80
> [  341.631434]  arm64_is_fatal_ras_serror+0x6c/0x8c
> [  341.631439]  do_serror+0x48/0x60
> [  341.631444]  el1h_64_error_handler+0x30/0x48
> [  341.631450]  el1h_64_error+0x68/0x6c
> [  341.631455]  do_raw_spin_unlock+0xb8/0xc4
> [  341.631460]  _raw_spin_unlock_irq+0x18/0x38
> [  341.631466]  __wait_for_common+0xb8/0x154
> [  341.631472]  wait_for_completion_timeout+0x28/0x34
> [  341.631477]  dp_ctrl_push_idle+0x3c/0x88
> [  341.631483]  dp_bridge_disable+0x20/0x2c
> [  341.631488]  drm_atomic_bridge_chain_disable+0x8c/0xb8
> [  341.631495]  drm_atomic_helper_commit_modeset_disables+0x198/0x450
> [  341.631501]  msm_atomic_commit_tail+0x1c8/0x36c
> [  341.631507]  commit_tail+0x80/0x108
> [  341.631512]  drm_atomic_helper_commit+0x114/0x118
> [  341.631516]  drm_atomic_commit+0xb4/0xe0
> [  341.631522]  drm_mode_atomic_ioctl+0x6b0/0x890
> [  341.631527]  drm_ioctl_kernel+0xe4/0x164
> [  341.631534]  drm_ioctl+0x35c/0x3bc
> [  341.631539]  vfs_ioctl+0x30/0x50
> [  341.631547]  __arm64_sys_ioctl+0x80/0xb4
> [  341.631552]  invoke_syscall+0x84/0x11c
> [  341.631558]  el0_svc_common.constprop.0+0xc0/0xec
> [  341.631563]  do_el0_svc+0x94/0xa4
> [  341.631567]  el0_svc+0x2c/0x54
> [  341.631570]  el0t_64_sync_handler+0x94/0x100
> [  341.631575]  el0t_64_sync+0x194/0x198
> [  341.631580] SMP: stopping secondary CPUs
> [  341.831615] Kernel Offset: 0x2f2b200000 from 0xffffffc008000000
> [  341.831618] PHYS_OFFSET: 0x80000000
> [  341.831620] CPU features: 0x400000,61500506,3200720b
> [  341.831623] Memory Limit: none

-- 
With best wishes
Dmitry

