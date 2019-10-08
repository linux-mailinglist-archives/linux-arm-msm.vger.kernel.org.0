Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03E65CFE93
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2019 18:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725795AbfJHQLc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Oct 2019 12:11:32 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42080 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfJHQLb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Oct 2019 12:11:31 -0400
Received: by mail-lj1-f195.google.com with SMTP id y23so18171056lje.9;
        Tue, 08 Oct 2019 09:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AT+kDpEjrdBshsMqJBNVg8JsTs5Ln99yNIaxkRDtThA=;
        b=H6F4206g5t18kFz01VuQPieIxoQpVLKANGGFoXM6ePueTOX2VPQy9nC+c5TYLTnnzm
         cXmJh9QSTByOD5ZAOuYOjClZi5iBiCF0vNx1zq00dK7Wyi1H1+gZlfWIMVXePyHUeYca
         DY1z20zNcqEog30lb3AZ6JYZ1rz+7vvs4wfDZc0EOU+hH9z4Q1aohsLuA7I8reUzxSLw
         3K8n5XJvZDHvVgXXusNohBOFHHLJC86XiJ/xtyMX1XKyUSo2F2L+ZdP+p3GKZUX8WDMv
         B8EVK03VA/5XGiwYMQQnR7PVYVqDziUUOGQJqQZlwKxx2OrIIOUYImbDXX5TRgaykp2i
         qvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AT+kDpEjrdBshsMqJBNVg8JsTs5Ln99yNIaxkRDtThA=;
        b=ECJwNgmcDo/Shvz3vVGn9uI2XqEpooBCzy+1KaVHFJTHyjBkRgiOGBdz55f0FTPEDp
         Wd8H6t0e/6XXLYUMCi6fEgvd3XF2XxPguJBAUuHOSveIqF13aPsAsMKgaX9Lnk8yN8xL
         dRAXN/sgYdVIuf/eT1FcwiAegexdByDDNOY4ymxhV0L7zcWszjuDovWogPqXHybKr4FU
         NZ4NcYsiSGqDNpAcz47/N331bqzteFByo3X7mQk1k1Nt8bNCxixMjCctW5+vaqjoEONF
         26Q/gk4SMm8d51Eu75goNxmiTHYViqN1rjPwonoz+pD49Ph4ctkdPV1Ih0YR7ADRXG1X
         ij6g==
X-Gm-Message-State: APjAAAUxObYZw+iYflbK0k1zam7JImYFLEH8kWI3PnxXlUTsoiP00nov
        ZVibZ7eSKZOvxUEm1YMsKlA2sYC0cpSfTW6kRp4=
X-Google-Smtp-Source: APXvYqwn5DlZGijUmc7DgbkIfu62kvr3NLZ18Ba3IyP+/Ho1XmFOjIm2o1fNq5KIpNcvuRoaxSrAnDitq5DGjmcTndI=
X-Received: by 2002:a2e:7502:: with SMTP id q2mr23044246ljc.202.1570551089481;
 Tue, 08 Oct 2019 09:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190904171723.2956-1-robdclark@gmail.com>
In-Reply-To: <20190904171723.2956-1-robdclark@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 8 Oct 2019 13:11:19 -0300
Message-ID: <CAOMZO5DgnB0kuSTxg1=ngJYiRvbq6bqBC4K-R5nQMzEinBYq7A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Use the correct dma_sync calls harder
To:     Rob Clark <robdclark@gmail.com>
Cc:     DRI mailing list <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On Wed, Sep 4, 2019 at 2:19 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Looks like the dma_sync calls don't do what we want on armv7 either.
> Fixes:
>
>   Unable to handle kernel paging request at virtual address 50001000
>   pgd = (ptrval)
>   [50001000] *pgd=00000000
>   Internal error: Oops: 805 [#1] SMP ARM
>   Modules linked in:
>   CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.3.0-rc6-00271-g9f159ae07f07 #4
>   Hardware name: Freescale i.MX53 (Device Tree Support)
>   PC is at v7_dma_clean_range+0x20/0x38
>   LR is at __dma_page_cpu_to_dev+0x28/0x90
>   pc : [<c011c76c>]    lr : [<c01181c4>]    psr: 20000013
>   sp : d80b5a88  ip : de96c000  fp : d840ce6c
>   r10: 00000000  r9 : 00000001  r8 : d843e010
>   r7 : 00000000  r6 : 00008000  r5 : ddb6c000  r4 : 00000000
>   r3 : 0000003f  r2 : 00000040  r1 : 50008000  r0 : 50001000
>   Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
>   Control: 10c5387d  Table: 70004019  DAC: 00000051
>   Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Fixes: 3de433c5b38a ("drm/msm: Use the correct dma_sync calls in msm_gem")
> Tested-by: Fabio Estevam <festevam@gmail.com>

I see this one got applied in linux-next already.
Could it be sent to 5.4-rc, please?

mx53 boards cannot boot in mainline because of this.

Thanks
