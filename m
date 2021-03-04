Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D351032CE68
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 09:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236698AbhCDI1l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 03:27:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235154AbhCDI1j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 03:27:39 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4437C061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 00:26:59 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id a24so15694430plm.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 00:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9OjnsnXekGCb91O4Y32fhlCgOOdbmOsbkWb6wlwIB9U=;
        b=VbGg6FtIPbMs/35ErnZu4S8aiQlT74IT2tHZNu5Su1ouw26d8fI6uAQmdgjwXWncfY
         4z6HAU8yh5AYQsQxIxFom3y8tVgGq9fm+Q45bjlKAOFWlRwEOXAjrfNA/dpRWtDz3CIx
         SVTf/D2T3sIM7MZdpqefak1nzd6XT0qvOPVAsoAifRi8+KgCxjYMJJ2F4v9aqGWiOo7n
         vSC2hjd4RWWs4QqEix3dR8zwMDxDFgmBuaKF0qETLaFc0ViiWWbB93vVzJLu6lyLsn3p
         5si5LqvMNuFn4ZLUPBITkhO/g5GHDkXUZj8lDGUCd0OLKhvaQf2VVncFTy9LKBAo82eM
         UmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9OjnsnXekGCb91O4Y32fhlCgOOdbmOsbkWb6wlwIB9U=;
        b=YeLcxRjc/lYy7uUquoaXBMtKewcgNqalC+Muusc2TT73OHFouY3ileLO55I/Kk1KP3
         wLH5gCJVmuYkD5xCzJKRRZkTT2um327G9WyCaJgx0EojNroRpKBhW2vfmKZkZNRxESSg
         NUMlGQ+Y8yxQugbb1+me/epd0yjdF+stBmsXowJAggqRp+LeCamTDlyzcheTY2T0vtv3
         YILJPF2VNFFJwMNP8zfHDPljzjhAEJDPrnya7nu0DSpw08Syr77XsC/szddBXD72ldY2
         YKle3GMK7e6nCOjBX+N/h9aalyCU6/YlgR3aDpeIsL5IdX7Vct/mOSWcSlD/HP0JF//c
         RcAw==
X-Gm-Message-State: AOAM533c5cQsVTWIMF7AezhPm7O3zy28OwckzaY7zm1ovHF4GSxpdWjE
        8Gp9yYPq6iTUFZrXtM3HpTYOMt923QrR6ZdJ9VnwTg==
X-Google-Smtp-Source: ABdhPJxASvHBLwOD6kFooFjWKmkaCFfiYSAzjgOgh6wzfUf+9cB9yt5Rz4aecnMxg1kC6k2YBgndeL30uLonfeIzwrs=
X-Received: by 2002:a17:902:8501:b029:e2:d953:212c with SMTP id
 bj1-20020a1709028501b02900e2d953212cmr3011474plb.49.1614846419157; Thu, 04
 Mar 2021 00:26:59 -0800 (PST)
MIME-Version: 1.0
References: <1614615911-18794-1-git-send-email-loic.poulain@linaro.org>
 <1614615911-18794-4-git-send-email-loic.poulain@linaro.org> <20210304064736.GD3363@thinkpad>
In-Reply-To: <20210304064736.GD3363@thinkpad>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 4 Mar 2021 09:34:38 +0100
Message-ID: <CAMZdPi_+sVnahTtQP+Osv_qrxz=dS=i4n5bdZp2ffT7nvBLB0A@mail.gmail.com>
Subject: Re: [PATCH 4/6] mhi: pci_generic: No-Op for device_wake operations
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 4 Mar 2021 at 07:47, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Mon, Mar 01, 2021 at 05:25:09PM +0100, Loic Poulain wrote:
> > The wake_db register presence is highly speculative and can fuze MHI
> > devices. Indeed, currently the wake_db register address is defined at
> > entry 127 of the 'Channel doorbell array', thus writing to this address
> > is equivalent to ringing the doorbell for channel 127, causing trouble
> > with some device that get an unexpected channel 127 doorbell interrupt.
> >
>
> what are those "some" devices?

I had this issue with SDX24 based modems. With SDX55, there is no
apparent issue but also no proof that it works as expected (device
never enters M1), so discarding this, for now, to avoid prevent any
trouble. At some point, we can add a kind of per-device QUIRK flag to
enable or disable this, but we need at least one 'working' device for
that.

>
> > This change fixes that issue by setting wake get/put as no-op for
> > pci_generic devices. The wake device sideband mechanism seems really
> > specific to each device, and is AFAIK no defined by the MHI spec.
> >
>
> s/no/not
>
> > It also removes zeroing initialization of wake_db register during MMIO
> > initialization, the register being set via wake_get/put accessors few
> > cycles later during M0 transition.
> >
>
> IIUC, the DEVICE_WAKE specified in the MHI spec corresponds to the wake doorbell
> register. But in some cases, this rather happens to be a #WAKE sideband GPIO as
> in PCIe.

Yes, this wake thing seems to depend on devices, and the 'wake
doorbell register' does not seem to have an 'official' offset/address.

>
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  drivers/bus/mhi/core/init.c   |  2 --
> >  drivers/bus/mhi/pci_generic.c | 18 ++++++++++++++++++
> >  2 files changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> > index 2159dbc..32eb90f 100644
> > --- a/drivers/bus/mhi/core/init.c
> > +++ b/drivers/bus/mhi/core/init.c
> > @@ -510,8 +510,6 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
> >
> >       /* Setup wake db */
> >       mhi_cntrl->wake_db = base + val + (8 * MHI_DEV_WAKE_DB);
> > -     mhi_write_reg(mhi_cntrl, mhi_cntrl->wake_db, 4, 0);
> > -     mhi_write_reg(mhi_cntrl, mhi_cntrl->wake_db, 0, 0);
>
> I need comment from Hemant/Bhaumik on this change since I don't exactly know if
> this is really required or not.

Sure.

Regards,
Loic
