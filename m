Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3C0D2D8A1A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Dec 2020 22:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392132AbgLLVFt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Dec 2020 16:05:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbgLLVFs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Dec 2020 16:05:48 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A13ADC0613CF
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Dec 2020 13:05:08 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id j8so3048410oon.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Dec 2020 13:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XRv8Plx/7pDdPKDlBe6jPDL7gC3T0EbSicfemOr5zaU=;
        b=bNJ98gGpQtmF0ki3byZippufFHeIpx7vz9hOun9y+FkUhxTLXsa+AdWIr5zATVVtdF
         8qz3Ii1wk+4f43du6a6lOnmkyKQyRWW0SGpRLcAspale8orqdYf0cDx1oIx/94zuJHiy
         x6Yrmx+eEEGvAb3NX0sE5XitXTEMJDCd14F60pc1l1YoEe+2/No4SdBgneJCA/i/29wJ
         AYRZIs4dgnXEiwCaZFlIfMS2RAb7MhelIAoPYVxDfQWTWSO1R47SZo3qpQTixO2BkzGG
         5hJVWM69+L63sWAzXzyT+FNOzya4Sk+7rvJMdawQLUqGiUQQstiVLFhqK0AgElvAZkJK
         uf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XRv8Plx/7pDdPKDlBe6jPDL7gC3T0EbSicfemOr5zaU=;
        b=uMUsFQmVeNdYGDuDPlH5rbdyKlmegjxwhHtoW8EWIR5DGqcLQCPojf77ZS2RIvwR1u
         nZP4DDqWZb+Cs/5eb21fZZCfax7KbGUP0WAfUMcMBxTTg++0+eysAWNOZIEdvV8XjFR1
         eTbTvzDLJ8PGSBrXRAr+aGwH2h4+qcBxce3W8f3rPfQAObfb7HOn3tFUfnSgdX16Gsdr
         lPMI8vPyDhxbso91NIaSnGxUE4hZHSzFTub6m6GhGs99ZbgGvWN3AsLANxiXPNgfRZnC
         xKnKXiw1zdtr5HHmhrSwbtlo+GHIxkmXqQBmO/irvhGyMaIHXni4chmfD3CagbdVfz7Z
         XRJQ==
X-Gm-Message-State: AOAM530COmqcgos8KLo3UwuwGxGwlGGd4LTN28XwStYoSdNppc/gCa++
        b7LJPXicQI/kZGQZykDGj8gZHxgfI+wdXN29TalX4Q==
X-Google-Smtp-Source: ABdhPJwnzsnRieEaKt6HXl0i6LAYODZcatiuX8GWH0Ic+bVL94gUarVkzwnr6upUbsBSjcT8gQ0xXza5da/e3BdKU+g=
X-Received: by 2002:a4a:d126:: with SMTP id n6mr1638273oor.47.1607807104886;
 Sat, 12 Dec 2020 13:05:04 -0800 (PST)
MIME-Version: 1.0
References: <CAA8EJppRhRCVOrXT0=nxomCFonna3YHhNEv-YFLyjaQX4gRptw@mail.gmail.com>
 <878sa34ni7.fsf@codeaurora.org>
In-Reply-To: <878sa34ni7.fsf@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 13 Dec 2020 00:04:45 +0300
Message-ID: <CAA8EJppwnfy-Hi9pabGL-g9BgEcac6bs3jn8J1n=PPr9-y-d-A@mail.gmail.com>
Subject: Re: ath11k/mhi backtraces on shutdown with linux-next
To:     Kalle Valo <kvalo@codeaurora.org>
Cc:     ath11k@lists.infradead.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

On Sat, 12 Dec 2020 at 08:11, Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > Hello,
> >
> > I've noticed the following backtrace during shutdown stage when
> > rebooting RB5 board,
> > using linux-next/master:
> >
> > [   31.060483] ath11k_pci 0000:01:00.0: shutdown
> > [   31.067844] ------------[ cut here ]------------
> > [   31.073111] WARNING: CPU: 4 PID: 101 at
> > drivers/iommu/io-pgtable-arm.c:583 __arm_lpae_unmap+0x39c/0x550
>
> Do you have CONFIG_DMA_API_DEBUG disabled? There is one commit fixing a
> DMA API debug warning but that should be in linux-next already:
>
> cd6181ff7e93 ath11k: dp_rx: fix monitor status dma unmap direction

I have enabled CONFIG_DMA_API_DEBUG (and _SG too). Got no additional
traces during boot and the same trace during reboot.

-- 
With best wishes
Dmitry
