Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67CC5CC91C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2019 11:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbfJEJct (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Oct 2019 05:32:49 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38514 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfJEJct (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Oct 2019 05:32:49 -0400
Received: by mail-wr1-f68.google.com with SMTP id w12so9832482wro.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Oct 2019 02:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pntu1CK1dS0lzxHUf7ofFrO+ckSUEFkqFaRN5hyK1jU=;
        b=HGgoSK/5GYJR0F3GhQO9EUDjvhWsWUTrsahMmDknizjIbjJmLjXRmbnisKdFDlw1tb
         Fw4MJLW8E2VlPwkt0nwPlxiBoKuW/zCsEPpThmchb3CrQ3EqAH++QFEoesimKCIWnVMD
         ofLDZFqsBr+ThbFkMO2EfB8ZESM7/7KgpNq7fsk9/g+RlViKrzfXbIdHT1Qhbu3lvIMx
         UtXgkQ9vuoDvl5oMsNJk8JnHyaxlk1f4aIVnAav3PF6OoByX1K6fCXrEjXLm1henmxoK
         f1Y2evRq/iKiWRz1owlmAHKpucSsklKC/tTRzPWTL/JTKLa3oXOkfuVKdQvl9A4NfQf2
         AmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pntu1CK1dS0lzxHUf7ofFrO+ckSUEFkqFaRN5hyK1jU=;
        b=mlFGzcC6/h5QGPqV2rM2M6EATtP9n8G6opoMlbfgLlhn+Snggx2sfXZB2dbxnXO1xT
         rCgIBbqsAQzcnwODKvQSpnWixf7IHSUjkUurtFlo1RVmPZsR95jWMXPMLIAcwag2cKQW
         4NxPloKFj+3R7sF6rMyNBo/VNYtU+mMZroyIhfEkPgJUi3ytjVXLFfrYkh9VSKy8UD31
         sgM1WlK9myQ47I5lXzNgReTs6akeVDgzE0fXTqbCi2o+tg2BES8jW10B1Tq83vhRoqgT
         z6Wg5YqUK+8Yy7VzMmE8s0MMmHmCFLOYoBh0EHBZQBl7Jpb0+tpCgLBUDx3uQQRTNfrA
         DtfQ==
X-Gm-Message-State: APjAAAWiy8n6pWvdiYNWttSq7BQr5lQihqPtW1X4SMUuOXxPczf3K6MI
        CHXVQd2qr8GFnCh+6O/m1URHx6zhus9G7PwyxT4=
X-Google-Smtp-Source: APXvYqxNtYBHk5Odq96y9vD4Gs9Bcv17kGdUpQoSlANLkRooaQClL7PwH5ECnkRRm/7MQgBARX7Ox4LIRBgsSh74Oz4=
X-Received: by 2002:a05:6000:1090:: with SMTP id y16mr14481615wrw.316.1570267966846;
 Sat, 05 Oct 2019 02:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20191001220205.6423-1-kholk11@gmail.com> <20191005045626.GE6390@tuxbook-pro>
In-Reply-To: <20191005045626.GE6390@tuxbook-pro>
From:   AngeloGioacchino Del Regno <kholk11@gmail.com>
Date:   Sat, 5 Oct 2019 11:32:35 +0200
Message-ID: <CAK7fi1ZkjV6vt=OeRYz2JGC9v4n4eb5Rupqc0TWQmnM1UdJ-mg@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Add support for QCOM IOMMU v2 and 500
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org, marijns95@gmail.com,
        agross@kernel.org, Rob Clark <robdclark@gmail.com>, joro@8bytes.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il giorno sab 5 ott 2019 alle ore 06:56 Bjorn Andersson
<bjorn.andersson@linaro.org> ha scritto:
>
> On Tue 01 Oct 15:01 PDT 2019, kholk11@gmail.com wrote:
>
> > From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> >
> > Some Qualcomm Family-B SoCs have got a different version of the QCOM
> > IOMMU, specifically v2 and 500, which perfectly adhere to the current
> > qcom_iommu driver, but need some variations due to slightly different
> > hypervisor behavior.
> >
>
> Do you think it's out of the question to get the arm-smmu driver to play
> nice with this platform?
>
>
> If not, would it be possible to change the DT binding so that we specify
> the SID and then read the SMR and S2CR registers to figure out the
> associated context bank?
>
> Regards,
> Bjorn
>
> > The personal aim is to upstream MSM8956 as much as possible.
> >
> > This code has been tested on two Sony phones featuring the Qualcomm
> > MSM8956 SoC.
> >
> > Changes in v2:
> > - Fixed optional properties placement in documentation
> >
> > Changes in v3:
> > - Rebased onto linux-next 01/10/2019
> > - Added missing SCM commit (required by the AArch64 PT switch support)
> >
> > Changes in v4:
> > - Removed rej files from the SCM patch (I'm truly sorry for the noise...)
> >
> > Angelo G. Del Regno (1):
> >   firmware: qcom: scm: Add function to set IOMMU pagetable addressing
> >
> > AngeloGioacchino Del Regno (6):
> >   iommu/qcom: Use the asid read from device-tree if specified
> >   iommu/qcom: Write TCR before TTBRs to fix ASID access behavior
> >   iommu/qcom: Properly reset the IOMMU context
> >   iommu/qcom: Add support for AArch64 IOMMU pagetables
> >   iommu/qcom: Index contexts by asid number to allow asid 0
> >   iommu/qcom: Add support for QCIOMMUv2 and QCIOMMU-500 secured contexts
> >
> >  .../devicetree/bindings/iommu/qcom,iommu.txt  |   5 +
> >  drivers/firmware/qcom_scm-32.c                |   6 +
> >  drivers/firmware/qcom_scm-64.c                |  15 ++
> >  drivers/firmware/qcom_scm.c                   |   7 +
> >  drivers/firmware/qcom_scm.h                   |   4 +
> >  drivers/iommu/qcom_iommu.c                    | 134 ++++++++++++++----
> >  include/linux/qcom_scm.h                      |   2 +
> >  7 files changed, 145 insertions(+), 28 deletions(-)
> >
> > --
> > 2.21.0
> >

In reality, when I started the IOMMU integration for this SoC, the
arm-smmu didn't even
have the new arm-smmu-impl stuff....
I tried multiple times to get the arm-smmu driver to play nice with
this IOMMU, but it's
really too much work to do there, (even with the new arm-smmu-impl
stuff) as we would
have to make a lot of changes in that driver just to support
this thing which, yes - it's standard-ish - but no, due to the
firmware configuration that
happens on this kind of platforms (the entire family, 8917, 8953,
8956, 8976 and others)
there is a lil percent of the arm-smmu code that would apply.

Shorter said, since it would be a complete mess to integrate the
support there, IMHO
it's really not a good idea.
In my trials for that I've ended up changing like 50% of the arm-smmu driver.

After all, the qcom_iommu driver is there to get IOMMUs with this kind
of firmware
configuration working and, even if it was originally done for
QCIOMMUv1, as I have
also explained in one of the patches here, 98-99% of the reasons why we have a
separate driver called qcom_iommu are applying to the implementation
that I've done.
