Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5108470E75
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Dec 2021 00:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344979AbhLJXT1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Dec 2021 18:19:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237592AbhLJXT0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Dec 2021 18:19:26 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F022C061746
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 15:15:51 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id d1-20020a4a3c01000000b002c2612c8e1eso2761541ooa.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 15:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=2E/HqmRHKH+zgE860lOcmO9kTAmvQuppX5PXoGMTC2I=;
        b=DuPabAfndZ1iQbASG8w8zzNXc/VBOj18R8H7SulSlHGCLczfzOA743vNLCE2/OL0Vt
         8ceCz81+JlHbpdyTqBw8vCbyBycL46FoKHtEUG0hBjLFRDukeT3BsTpGBK26YD9vIIKs
         gU6XK15LtvsxbLzba7s9XDq7NZSWmI4q81/BA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=2E/HqmRHKH+zgE860lOcmO9kTAmvQuppX5PXoGMTC2I=;
        b=iVntfKFDTGLHYbgWFIj/zC3eoeO2BoctdyOox5MED32pvDW9GrMFbaTdf/abPHJQFX
         k1Jh2hvmQmETTuoZPyKw9DByhr2Nhtw+rmCrUmwVgaK/sTLdlaaCn2m1mM3QWGDu0JTL
         cFbJy/9aV2s+t0lH8SvcOe3i/A/27mCTzLNSRR7AmjPOjM0CsWU17bTytaD3DvNoeRAY
         Kls4UzaHdFvMbCmk82gXo5aEF5AWaZDNoaKiq5BXHAeXpfXD7ezdsBE32dLjgwmiIVcY
         2HQG11ZtkYJezi/PhP8gpLWV6zWikVpvb+/vNQMfMKnk568B0KJYEncM44N+1VhhYTaW
         0Klw==
X-Gm-Message-State: AOAM530mxoARAkWPIGuhuwuP7pX1FxxRCNcw4XKN6MFgezZpUAEquE7a
        qHRkiabBp+FVOpzl9mPWvVBQPG18WrHB2i/NPvZRoQ==
X-Google-Smtp-Source: ABdhPJwPLhUm9uvRAgxsSfKFIIZg5Uii0nz0JiWg2h15zZUlIHrmEOqRL1qpXP9yg7RXJYbVtBujXg+mO7Go9x1zlpA=
X-Received: by 2002:a4a:acca:: with SMTP id c10mr10031474oon.1.1639178150426;
 Fri, 10 Dec 2021 15:15:50 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Dec 2021 15:15:50 -0800
MIME-Version: 1.0
In-Reply-To: <20211210051907.3870109-1-judyhsiao@chromium.org>
References: <20211210051907.3870109-1-judyhsiao@chromium.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 10 Dec 2021 15:15:49 -0800
Message-ID: <CAE-0n52z=wRS3rXM=zQzcy1yryvzwW6iGA75UYBiYSkR_5edTA@mail.gmail.com>
Subject: Re: [PATCH] SoC: qcom: Distinguish headset codec by codec_dai->name
To:     Judy Hsiao <judyhsiao@chromium.org>, broonie@kernel.org
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, dianders@chromium.org,
        cychiang@google.com, judyhsiao@google.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Judy Hsiao (2021-12-09 21:19:07)
> Distinguish which headset codec is on the board by codec_dai->name
> instead of card->name.

Yes that's what the patch does but why is it important?

>
> Fixes: 425c5fce8a03 ("ASoC: qcom: Add support for ALC5682I-VS codec")

It fixes something so what is it fixing? Can you add the call stack of
the failure and explain how this patch fixes it? We have that patch
backported to our chromeos 5.4 kernel tree but I assume this reproduces
upstream.

 Unable to handle kernel paging request at virtual address ffffffbfe7bba9ce
 Mem abort info:
   ESR = 0x96000005
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
 Data abort info:
   ISV = 0, ISS = 0x00000005
   CM = 0, WnR = 0
 swapper pgtable: 4k pages, 39-bit VAs, pgdp=000000008379a000
 [ffffffbfe7bba9ce] pgd=0000000000000000, pud=0000000000000000
 Internal error: Oops: 96000005 [#1] PREEMPT SMP
 Modules linked in: ip6table_nat fuse uvcvideo videobuf2_vmalloc [trimmed]
 CPU: 7 PID: 2168 Comm: cras Not tainted 5.4.163-lockdep-17364-gfe3d4f499cf1 #1
 Hardware name: Google Pompom (rev2) with LTE (DT)
 pstate: 00400009 (nzcv daif +PAN -UAO)
 pc : rt5682_set_component_pll+0xcc/0xb78 [snd_soc_rt5682]
 lr : rt5682_set_component_pll+0xbc/0xb78 [snd_soc_rt5682]
 sp : ffffff808ed7f320
 x29: ffffff808ed7f390 x28: dfffffd000000000
 x27: ffffff80b1409550 x26: 00000000aaaaaaaa
 x25: ffffff80d0a0b820 x24: ffffff80bc1f7098
 x23: ffffff809332a080 x22: 00000000aaaaaaaa
 x21: 1ffffff01783ee13 x20: 00000000aaaaaaaa
 x19: 00000000aaaaaaaa x18: 1ffffff011dafe18
 x17: 0000000000000000 x16: 0000000000000201
 x15: 0000000000000000 x14: 0000000062f77d15
 x13: dfffffd000000000 x12: ffffffd01302ed7c
 x11: 0000000000000000 x10: ffffff7f3ddd4e74
 x9 : 0000000000000000 x8 : 1fffffefe7bba9ce
 x7 : aaaaaaaaaaaaaaaa x6 : 0000000000000000
 x5 : 0000000000000000 x4 : 0000000000000008
 x3 : 0000000000000000 x2 : 0000000000000008
 x1 : 00000000000000aa x0 : ffffff808ed7f358
 Call trace:
  rt5682_set_component_pll+0xcc/0xb78 [snd_soc_rt5682]
  snd_soc_component_set_pll+0x90/0x154
  snd_soc_dai_set_pll+0xf4/0x1ac
  sc7180_snd_startup+0x268/0x3c0 [snd_soc_sc7180]
  snd_soc_link_startup+0xa4/0x180
  soc_pcm_open+0x35c/0x15c8
  snd_pcm_open_substream+0xa90/0x13b0
  snd_pcm_open+0x1a4/0x55c
  snd_pcm_capture_open+0x7c/0xe8
  snd_open+0x2b8/0x2e4
  chrdev_open+0x364/0x3d4
  do_dentry_open+0x66c/0xc58
  vfs_open+0x7c/0x8c
  path_openat+0x108c/0x2bbc
  do_filp_open+0x15c/0x258
  do_sys_open+0x278/0x62c
  __arm64_compat_sys_openat+0x9c/0xb0
  el0_svc_common+0x1c0/0x3dc
  el0_svc_compat_handler+0x88/0xd4
  el0_svc_compat+0x8/0x2c
 Code: 8b3acae8 910d310a d343fd48 a9012be8 (38fc6908)
