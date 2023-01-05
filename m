Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE67665E334
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 04:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbjAEDCg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 22:02:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjAEDC1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 22:02:27 -0500
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE4219287
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 19:02:26 -0800 (PST)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-142b72a728fso41849773fac.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jan 2023 19:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5ElKMxfSAyixAXcd3wPukOzxndFz9L8vseWioTb5NIE=;
        b=V4MbaIvXPEJFmQPvebSBhlVUIfVp9OE0gzfictvYHkA5I/20EfRVBhja/OC9XRCAP9
         RdPZ3/z5lq77MPB6NLZTx2DNpYOO3zSXIIaSt0jAR7bo4zeY0qbEfyGksSTIpqIPP/Cb
         c3CgfUyeBILz7ZsmTfw7qaUDtTFlzK7OqVE7jLn6mSZn1GAcrMxCd7RbesLC/ph9oaMB
         iAWyeLN3RN9NrPx0HurNhWn3PExLIyxqFiiqMJ/WnmMLGxux0RwONRMzYGwRxGblvwPx
         NQjaFOCOWv/OSOAQTHlWJawzzy8i9WyYyqbDZkTy+x9QKGWriafpnjon0XeXkpC4BKai
         AXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ElKMxfSAyixAXcd3wPukOzxndFz9L8vseWioTb5NIE=;
        b=2PSbSUM6mygKD34dR8kohSWG0X/Dw3BSPrZ9r0kCaigE8skk8KYWd9G1oeM2r13+Mu
         YqYk1Xs/7O7zhZgQqI9gqgbm5mS3Y9FiR9gL4JWG4gB4e6l3vAnjdqILYAeCHLqrW5oK
         eIvI4v7DJND/3UgC1E9OzQlOkdbTMB0KJecZphPpjQyyWFK+Xx2EmMtNgcmjAKjnhKF4
         E1ByqCanoXTS8IjJxaYMN55eIMqggfYENbxBXbuwn4JdZqGSuhlNTFNgvLnMA5/Q+Dg0
         QKxbvjJOk84sNkYkZg5qRddl43bJzhz85aNKX2XoOrFia1b8ukNeInwRshNKG6cHbkhs
         KEpQ==
X-Gm-Message-State: AFqh2kq20YbUoGMhADS30f/Q7UPH1t2nAOwuGKJKyVJWWZKFrRJ3E0oR
        FtvPokXS6Wf7MB86OtPaxdc48ovm6r2KkbZr3s8=
X-Google-Smtp-Source: AMrXdXuLTv65sUbDD8aIyK6MQOMU6bqCeayrTxoQAErWUKPkxU5g8VIKcD1uuQwpQMFiP8TUMvE4e1rQxiptoLf4FPo=
X-Received: by 2002:a05:6870:4d14:b0:144:5f0d:9fcb with SMTP id
 pn20-20020a0568704d1400b001445f0d9fcbmr2726231oab.38.1672887745969; Wed, 04
 Jan 2023 19:02:25 -0800 (PST)
MIME-Version: 1.0
References: <20230105014743.1478110-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230105014743.1478110-1-dmitry.baryshkov@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 4 Jan 2023 19:02:20 -0800
Message-ID: <CAF6AEGsYct2-eGicM_=CrrUPR5KY4ZsVqgp5w_mW8gTxQOYonQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm: another fix for the headless Adreno GPU
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 4, 2023 at 5:47 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Fix another oops reproducible when rebooting the board with the Adreno
> GPU working in the headless mode (e.g. iMX platforms).
>
> Unable to handle kernel NULL pointer dereference at virtual address 00000000 when read
> [00000000] *pgd=74936831, *pte=00000000, *ppte=00000000
> Internal error: Oops: 17 [#1] ARM
> CPU: 0 PID: 51 Comm: reboot Not tainted 6.2.0-rc1-dirty #11
> Hardware name: Freescale i.MX53 (Device Tree Support)
> PC is at msm_atomic_commit_tail+0x50/0x970
> LR is at commit_tail+0x9c/0x188
> pc : [<c06aa430>]    lr : [<c067a214>]    psr: 600e0013
> sp : e0851d30  ip : ee4eb7eb  fp : 00090acc
> r10: 00000058  r9 : c2193014  r8 : c4310000
> r7 : c4759380  r6 : 07bef61d  r5 : 00000000  r4 : 00000000
> r3 : c44cc440  r2 : 00000000  r1 : 00000000  r0 : 00000000
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> Control: 10c5387d  Table: 74910019  DAC: 00000051
> Register r0 information: NULL pointer
> Register r1 information: NULL pointer
> Register r2 information: NULL pointer
> Register r3 information: slab kmalloc-1k start c44cc400 pointer offset 64 size 1024
> Register r4 information: NULL pointer
> Register r5 information: NULL pointer
> Register r6 information: non-paged memory
> Register r7 information: slab kmalloc-128 start c4759380 pointer offset 0 size 128
> Register r8 information: slab kmalloc-2k start c4310000 pointer offset 0 size 2048
> Register r9 information: non-slab/vmalloc memory
> Register r10 information: non-paged memory
> Register r11 information: non-paged memory
> Register r12 information: non-paged memory
> Process reboot (pid: 51, stack limit = 0xc80046d9)
> Stack: (0xe0851d30 to 0xe0852000)
> 1d20:                                     c4759380 fbd77200 000005ff 002b9c70
> 1d40: c4759380 c4759380 00000000 07bef61d 00000600 c0d6fe7c c2193014 00000058
> 1d60: 00090acc c067a214 00000000 c4759380 c4310000 00000000 c44cc854 c067a89c
> 1d80: 00000000 00000000 00000000 c4310468 00000000 c4759380 c4310000 c4310468
> 1da0: c4310470 c0643258 c4759380 00000000 00000000 c0c4ee24 00000000 c44cc810
> 1dc0: 00000000 c0c4ee24 00000000 c44cc810 00000000 0347d2a8 e0851e00 e0851e00
> 1de0: c4759380 c067ad20 c4310000 00000000 c44cc810 c27f8718 c44cc854 c067adb8
> 1e00: c4933000 00000002 00000001 00000000 00000000 c2130850 00000000 c2130854
> 1e20: c25fc488 00000000 c0ff162c 00000000 00000001 00000002 00000000 00000000
> 1e40: c43102c0 c43102c0 00000000 0347d2a8 c44cc810 c44cc814 c2133da8 c06d1a60
> 1e60: 00000000 00000000 00079028 c2012f24 fee1dead c4933000 00000058 c01431e4
> 1e80: 01234567 c0143a20 00000000 00000000 00000000 00000000 00000000 00000000
> 1ea0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 1ec0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 1ee0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 1f00: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 1f20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 1f40: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 1f60: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 1f80: 00000000 00000000 00000000 0347d2a8 00000002 00000004 00000078 00000058
> 1fa0: c010028c c0100060 00000002 00000004 fee1dead 28121969 01234567 00079028
> 1fc0: 00000002 00000004 00000078 00000058 0002fdc5 00000000 00000000 00090acc
> 1fe0: 00000058 becc9c64 b6e97e05 b6e0e5f6 600e0030 fee1dead 00000000 00000000
>  msm_atomic_commit_tail from commit_tail+0x9c/0x188
>  commit_tail from drm_atomic_helper_commit+0x160/0x188
>  drm_atomic_helper_commit from drm_atomic_commit+0xac/0xe0
>  drm_atomic_commit from drm_atomic_helper_disable_all+0x1b0/0x1c0
>  drm_atomic_helper_disable_all from drm_atomic_helper_shutdown+0x88/0x140
>  drm_atomic_helper_shutdown from device_shutdown+0x16c/0x240
>  device_shutdown from kernel_restart+0x38/0x90
>  kernel_restart from __do_sys_reboot+0x174/0x224
>  __do_sys_reboot from ret_fast_syscall+0x0/0x1c
> Exception stack(0xe0851fa8 to 0xe0851ff0)
> 1fa0:                   00000002 00000004 fee1dead 28121969 01234567 00079028
> 1fc0: 00000002 00000004 00000078 00000058 0002fdc5 00000000 00000000 00090acc
> 1fe0: 00000058 becc9c64 b6e97e05 b6e0e5f6
> Code: 15922088 1184421c e1500003 1afffff8 (e5953000)
> ---[ end trace 0000000000000000 ]---
>
> Fixes: 0a58d2ae572a ("drm/msm: Make .remove and .shutdown HW shutdown consistent")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

We generally want to not go down any kms related call paths as high up
the stack as possible, otherwise it is just going to be whack-a-mole
fixing the issues

BR,
-R

> ---
>
> Changes since v2:
> - Moved the condition check from msm_atomic_commit_tail() to msm_drv_shutdown()
>
> Changes since v1:
> - Moved setting of `async' before the call to trace to fix the
>   uninitialized variable warning
>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 8b0b0ac74a6f..45e81eb148a8 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1278,7 +1278,7 @@ void msm_drv_shutdown(struct platform_device *pdev)
>          * msm_drm_init, drm_dev->registered is used as an indicator that the
>          * shutdown will be successful.
>          */
> -       if (drm && drm->registered)
> +       if (drm && drm->registered && priv->kms)
>                 drm_atomic_helper_shutdown(drm);
>  }
>
> --
> 2.39.0
>
