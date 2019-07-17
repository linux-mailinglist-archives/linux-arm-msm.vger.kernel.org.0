Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAE46C2EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2019 00:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbfGQWBN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jul 2019 18:01:13 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38415 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbfGQWBM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jul 2019 18:01:12 -0400
Received: by mail-ed1-f66.google.com with SMTP id r12so27797250edo.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2019 15:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FFb+F89wb7hJSMQiJHwk7hej5OffexidUMya9XbA7hk=;
        b=oOO4HCySfdifrLOFYEtyfSEuKfjxMIFRyMI8fT/5OdTEpF7FBFdmqAO/U14jAVGyJs
         ol/8VhuynlOXcSYginVwm/AA1KPANThLMlWhsK5gYQEAxxnx1WsksfASUevRzWFLTPqS
         dgg6ztBunGG4vHcdj/eQJvwHWeXjb0FqcZo2i81Dmldi5r59CLwsWZJ8bf1UhOzY1ORL
         xC+WVbLsPeRxgAmYpvH2ObpmymYkF43iV/SpQBz5PujA885rxkpK7Mtjt4ub9TKi0SHw
         jhUnuIO1cu+8D9DhSuzh8dTVE7srb0lu1aPo9wgtiIhfF0F3kdcQWf8cmpZf37FJ44Hi
         Q2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FFb+F89wb7hJSMQiJHwk7hej5OffexidUMya9XbA7hk=;
        b=b4wS6hVEwY1HmSzD0807fknEBTmAucDVJhckJwEJbt3C+1sT2VCPYzZff5qedLyg8a
         opayyYYETH97stDtc+044Q9qacvMJMkrOqVNSiikAD08se1VAf68AyC2hhUYVX0PR5k6
         QAFBp6KiKB1Jgmk425rLYXVbuiL/lfzcEdRjonchp5lD2bfQbz0xvcG07/Pk1hpn0EeB
         1+oaSb8AjwQGaJibPgQX3LjhjEt865jYrK4PlIImMkQ5Ojv8uWYTThmtuTmRxNhoVnw3
         xRH6AwePyIQDogAObR3kCZ5NFxMbsklz2OPmSEMQZPfKCUnMMSl2s4ne+bXz/WKGdjCh
         lvRw==
X-Gm-Message-State: APjAAAVa3UPGziujpNEPbP/R1IPhBZBvDLblxxjAWJWIHpUoyfBBQJiU
        It7wf5eJ0dfk6jGc7B1+M52oNDNv2Ag/egUd0C8=
X-Google-Smtp-Source: APXvYqxOAb62gP6sqSSMuNm8xnIBPbG9G8d5bXEYaqpixv6l9xNpJqCvvczP1b0HDVKm9l8TsPv/yUL7Iez4jU/cNLw=
X-Received: by 2002:a50:a544:: with SMTP id z4mr36784507edb.71.1563400871020;
 Wed, 17 Jul 2019 15:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <5d2f063c.1c69fb81.69fe8.9d45@mx.google.com> <20190717121002.GD4459@sirena.org.uk>
In-Reply-To: <20190717121002.GD4459@sirena.org.uk>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 17 Jul 2019 15:00:59 -0700
Message-ID: <CAF6AEGv0xjUD17-4=EHe=xOnMnkQgmtp94g473tTr2fDH0aa0A@mail.gmail.com>
Subject: Re: next/master boot: 265 boots: 17 failed, 243 passed with 4
 offline, 1 conflict (next-20190717)
To:     Mark Brown <broonie@kernel.org>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        kernel-build-reports@lists.linaro.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Jordan Crouse <jcrouse@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 17, 2019 at 5:10 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Jul 17, 2019 at 04:27:56AM -0700, kernelci.org bot wrote:
>
> Today's -next fails to boot on a couple of apq8064 boards:
>
> > arm:
> >     qcom_defconfig:
> >         gcc-8:
> >             qcom-apq8064-cm-qs600: 1 failed lab
> >             qcom-apq8064-ifc6410: 1 failed lab
>
> In both cases it looks like the error handling when we fail to get the
> firmware for the GPU is broken, we get a crash in the initialization
> code shortly after failing to load some firmware:
>
> [    4.608279] msm 5100000.mdp: Direct firmware load for qcom/a300_pm4.fw failed with error -2
> [    4.614916] msm 5100000.mdp: [drm:adreno_request_fw] *ERROR* failed to load a300_pm4.fw
> [    4.623229] 8<--- cut here ---
> [    4.631111] Unable to handle kernel NULL pointer dereference at virtual address 00000088
>
> ...
>
> [    4.665947] Workqueue: events deferred_probe_work_func
> [    4.670532] PC is at msm_open+0x64/0x90
> [    4.675656] LR is at _raw_write_unlock+0x20/0x4c
>
> ...
>
> [    4.949553] [] (msm_open) from [] (drm_file_alloc+0x134/0x21c)
> [    4.957703] [] (drm_file_alloc) from [] (drm_client_init+0xa8/0x124)
> [    4.965162] [] (drm_client_init) from [] (drm_fb_helper_init.part.0+0x30/0x3c)
> [    4.973411] [] (drm_fb_helper_init.part.0) from [] (msm_fbdev_init+0x50/0xb4)
> [    4.982173] [] (msm_fbdev_init) from [] (msm_drm_bind+0x560/0x638)
>
> Full details (including full boot logs) at:
>
>         https://kernelci.org/boot/id/5d2ede2359b514a54b49e91b/
>         https://kernelci.org/boot/id/5d2ede2759b514a54749e91d/


jfyi, Jordan tracked this down to needing:
https://patchwork.freedesktop.org/patch/314397/

BR,
-R
