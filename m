Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8DAD1F0872
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2020 22:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbgFFUBm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Jun 2020 16:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728229AbgFFUBm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Jun 2020 16:01:42 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FB6C03E96A;
        Sat,  6 Jun 2020 13:01:41 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id g1so10176158edv.6;
        Sat, 06 Jun 2020 13:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gfDYgYWWxAJkhuooZJo8FujLn97cONbso3rrCXc9f20=;
        b=bu5U9oAZ2jARjpmZA6hTFVFeLL7tj7VWCyExyfPooRuVwhvPZbFCNsNmAQsbYUR+RH
         hufagq6aobUco9EOjt6bNN3QWktKTMnigHMAVxR/uihFRfqb2JkYCMfs9Pj5QZpb+IR7
         NiVLOTBGkCGPVtiK7llT82HhjMAXBlqc2gpYTbEEbDrJ0VWf5DQaVSlk1LzWVm1E/Xez
         bMOOZ/Hh/jcq+qEuqwF08Qo2rGg95xROkA93XMrV32GPRvPu7Q015Nb+i4bZAu2xrGnU
         J2fRR9lfLHVX3Zr90OFGlSvw6sJKvaTK1/k94Pf/NB6zyqbT55A0P8IKdKgiw51j+nWu
         eN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gfDYgYWWxAJkhuooZJo8FujLn97cONbso3rrCXc9f20=;
        b=GpD5pplSM+w8yZ/tRr+zT9J2sQnkPO+RaKNgR+p2fLrGpabEs55yj4y5xLwyx1sUdd
         6GUiohjHLEHLT/bObIKm1/m8f2HMlImk1z1XZEg4DdndJ5XTlvwnxzNfVLwEMOWwKv9G
         Vqe1BAabWZVMsIHzErUroYLI1SwHpsdd32/FaUpNqb2IDVjoFVZYNJEkrOx5MQktfFs0
         4VV0yR5k/Sh7+xiDDTDoyHPf7lemIHCOzuSYXCNU1xQwTHEaZZLSUhgRMybkBHkRwKmV
         SE574CrEQ3Fm7gmHe76sjfI+y9o6EsHXxPE72nwa/WxTUkMq4ec6Z1/GMVa00r8Y+WmO
         1OUw==
X-Gm-Message-State: AOAM5321/8Tyt1swlenlGoD4rm7eXvwhn5LL0Q7VWEgysLyVCWoxID5L
        HgrrTBiSKaqXufioLDPiQowMEcyewrlG4pS2+nA=
X-Google-Smtp-Source: ABdhPJzuK37hwXZ07Js5fDY8Fkv33sx1ZVKV3+QYhH8xXee99VgutbGekCi2YmJBeYfXFRtNbl5FcVF45jO7Uu1jeU8=
X-Received: by 2002:a50:c017:: with SMTP id r23mr15868263edb.120.1591473700459;
 Sat, 06 Jun 2020 13:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <5a663096b489b86472fe3bfbd5138c411d669bad.camel@perches.com>
In-Reply-To: <5a663096b489b86472fe3bfbd5138c411d669bad.camel@perches.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 6 Jun 2020 13:02:05 -0700
Message-ID: <CAF6AEGsqoei_uDQgNFdRF2ZA47YzWEvV7noVmjxLaa=VB-QL5A@mail.gmail.com>
Subject: Re: [Possible PATCH] iommu/qcom: Change CONFIG_BIG_ENDIAN to CONFIG_CPU_BIG_ENDIAN
To:     Joe Perches <joe@perches.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jun 6, 2020 at 12:16 PM Joe Perches <joe@perches.com> wrote:
>
> CONFIG_BIG_ENDIAN does not exist as a Kconfig symbol.
>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>
> I don't have the hardware, so I can't tell if this is a
> correct change, but it is a logical one.

I'm not sure *anyone* has a working snapdragon big-endian setup these
days.. sboyd used to tinker with that ages ago.

But, SCTLR.E is the bit to set for big-endian, so this looks like the
right thing to do.

Reviewed-by: Rob Clark <robdclark@gmail.com>

> Found by a test script that looks for IS_ENABLED(FOO)
> where FOO must also exist in Kconfig files.
>
>  drivers/iommu/qcom_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index c3e1fbd1988c..69e113471ecb 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -304,7 +304,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
>                       ARM_SMMU_SCTLR_M | ARM_SMMU_SCTLR_S1_ASIDPNE |
>                       ARM_SMMU_SCTLR_CFCFG;
>
> -               if (IS_ENABLED(CONFIG_BIG_ENDIAN))
> +               if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
>                         reg |= ARM_SMMU_SCTLR_E;
>
>                 iommu_writel(ctx, ARM_SMMU_CB_SCTLR, reg);
>
