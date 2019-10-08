Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF983D03CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 01:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbfJHXIS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Oct 2019 19:08:18 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39221 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfJHXIS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Oct 2019 19:08:18 -0400
Received: by mail-ed1-f68.google.com with SMTP id a15so305386edt.6;
        Tue, 08 Oct 2019 16:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m05pDGZbsmhzbNGDVdoCCzYWm/2mMB34A9buFwlNp74=;
        b=PCGM6guQKhDbaOQdYY6yu/4FRo9KFErdzinvSJkD/xR34bkT83TUTqzx86ts6dUBIY
         Nqgf5WKWb6yQO9x3LUq1zENOssXQWqFYeZZ03ylWwN0vqyoMBrZc0SiDhE1mNMGGtRn2
         imNB6637YBRg/Jsw9usqT2MgtBeR2EJ9w2vPMz+4uljvly8BPXW8nt16RFhBVw78KneW
         4fkCuNLxd5BuDStS2/Y0N96jHHXmgOucs0AEs2P+XFkXUnf3qbhdNaTCgCY4q2prPFnO
         7+32tqKT9otZjZTB0S5GtWQ52BaI4a1D22bvIh2vk6mcDz0hcARptsXrqvCo12AZqb/Y
         aAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m05pDGZbsmhzbNGDVdoCCzYWm/2mMB34A9buFwlNp74=;
        b=Hh7ip/aKJSigiN+Su3WqrXioJtHyzO2DSyXPM2oH3xexZdd3CgJTKeneDUcFC25tYL
         0tl8qyWd/a5m+BMc5QJVPhAigWuxU7BTqWWoBubxSQFMrLsDNDtUb7/lfhjWLSjirHB6
         0r/FIeCNCFsqJfwbNcgGQRlqorEL6A52KSprad31J3jcLZXSfwbe+YjBKEbZKdNCvcMT
         YfM4ZmEuEkrmKYDSmZQkyByhGJZ1eDynVlFrXqew9cn5FgmtxI+fSdUYsBTH+5ZBPNN5
         YZv3OOAjZbvpT8UKeEIyRm9OBue/aRRmNj8zvbufFObKLHUiLlT/f69Y3cUd+TmaiXzJ
         yG1A==
X-Gm-Message-State: APjAAAVjkbKQXmYufREFWSDaFr3sm20U5Bj9KAmerW2dm7LzLwahc2Yl
        mOK4EH0sSQMuLu8ZmDAaVMpfLSXwIIQABt5vBlk=
X-Google-Smtp-Source: APXvYqzfJEUClDx5VkmVpottFYGdPrGDGEyJc9nTTMrE1y2oto+PY6SOncAVBcyPn5xQTMvrJXn8EaSZxX2RzN0PHDc=
X-Received: by 2002:a05:6402:557:: with SMTP id i23mr399826edx.71.1570576096925;
 Tue, 08 Oct 2019 16:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190904171723.2956-1-robdclark@gmail.com> <CAOMZO5DgnB0kuSTxg1=ngJYiRvbq6bqBC4K-R5nQMzEinBYq7A@mail.gmail.com>
In-Reply-To: <CAOMZO5DgnB0kuSTxg1=ngJYiRvbq6bqBC4K-R5nQMzEinBYq7A@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 8 Oct 2019 16:08:05 -0700
Message-ID: <CAF6AEGtTt4Em=7GJiuqhAdvJ-cB8hp=iOuT7egoVr3vW=VMN5w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Use the correct dma_sync calls harder
To:     Fabio Estevam <festevam@gmail.com>
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

On Tue, Oct 8, 2019 at 9:11 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Rob,
>
> On Wed, Sep 4, 2019 at 2:19 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Looks like the dma_sync calls don't do what we want on armv7 either.
> > Fixes:
> >
> >   Unable to handle kernel paging request at virtual address 50001000
> >   pgd = (ptrval)
> >   [50001000] *pgd=00000000
> >   Internal error: Oops: 805 [#1] SMP ARM
> >   Modules linked in:
> >   CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.3.0-rc6-00271-g9f159ae07f07 #4
> >   Hardware name: Freescale i.MX53 (Device Tree Support)
> >   PC is at v7_dma_clean_range+0x20/0x38
> >   LR is at __dma_page_cpu_to_dev+0x28/0x90
> >   pc : [<c011c76c>]    lr : [<c01181c4>]    psr: 20000013
> >   sp : d80b5a88  ip : de96c000  fp : d840ce6c
> >   r10: 00000000  r9 : 00000001  r8 : d843e010
> >   r7 : 00000000  r6 : 00008000  r5 : ddb6c000  r4 : 00000000
> >   r3 : 0000003f  r2 : 00000040  r1 : 50008000  r0 : 50001000
> >   Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> >   Control: 10c5387d  Table: 70004019  DAC: 00000051
> >   Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Fixes: 3de433c5b38a ("drm/msm: Use the correct dma_sync calls in msm_gem")
> > Tested-by: Fabio Estevam <festevam@gmail.com>
>
> I see this one got applied in linux-next already.
> Could it be sent to 5.4-rc, please?

afaict this should be at least in v5.4-rc2.. am I missing something?

BR,
-R

>
> mx53 boards cannot boot in mainline because of this.
>
> Thanks
