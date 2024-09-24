Return-Path: <linux-arm-msm+bounces-32232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C22983F3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 09:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7F431F23660
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 07:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E8A148318;
	Tue, 24 Sep 2024 07:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="q4QjoN/q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67061482F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 07:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727163425; cv=none; b=krOz/Ksg3X23VLdEvF/VfDBfb9XquFHmoZl4GTCjEy6GRuLZyegX+4CCkv0J4mc6aSTSkUtcXEqusxqYjDWcsmccB/4Mbrz907rF7tTN1BaJNzt9w+i41+0IcEmlHChq81O4oylGS+LK0oXAsFEq2IXD8XDTwqyfiJZbn9S2KH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727163425; c=relaxed/simple;
	bh=z8LfvfJtrZ1r93cSNJ3Z+VfCUZ8yTsfwCoDNDLygQ4Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=ODVcpzNRuoNpiwQ8UHvfFEqQuPrxhWznIrqrnRKu/0+P8zAkHxs9mgf5GXcxlxVa2eXMrd8jkaDSZuWiCtK4bBncucD+zz2beEpqdlB5mLQ37lTT7feg3aBlU1q3VTkLNv15wWY9qtB5rkfDixhSC/n+w87NFqRsUpJkj06lFP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=q4QjoN/q; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c40aea5c40so7961135a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 00:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1727163422; x=1727768222; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Uz+xx89fkl/W06ZQR0o2BcvVOxUxvsFcA4Ij/yTAAU=;
        b=q4QjoN/qegW5NUH5egbvzys10Su0VmW/pMDVpNqfmiiwSQi4foj47AnYVyWKGSQ7cN
         p2umqD9ujLOpyVSli62EcqAehZhzMEj9w3gImmSEwJTpFUA18f3fEStxh31BYjkkfjLL
         tBGVVsmhF/sIA6sIPfWC0p3boDmw4PEaWLlpKdSW/1QOzTmqaHARtM3a7K5wr7oaMmqB
         dTaIPNaQi8ixEvRvCSEfag9EKTerv36HpgiCeCe+Fpcllg3AlfxLRy68khHplrisjL2h
         pATzPr8VjpjYVVIlsAAqotZbLKSGVf3h4PVOodyMIe6OPvSoufB6Q/vo7eJuNW2kSEVB
         zFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727163422; x=1727768222;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Uz+xx89fkl/W06ZQR0o2BcvVOxUxvsFcA4Ij/yTAAU=;
        b=tix9ca5sUPahWkE1W/pBp6S5pirwndoFuDUitie6TMkTMd3+VFoowTmn6/rsrNjV3J
         nBa+INHpGGw+puCQdcAX+eAt6NzNfnyGMK0cMsXFkhydYP89hU3v9EWOLVKsCSJee9Qj
         uYyxkrctoZf63WTb9pCcKBgoXCbbB9iMA34VN5L4i1/Z5XeEXw5UEDbVB1Ug6POJQ5tk
         JmPkYH0N8KTrAPTVFD4bUksq0tHkUH/PEep17wigFAQmevxUB374io9fNye/774wkyFA
         7AeyYqf3BSOhZ8heqUAtWujll5PcYU7oTL3/huaBFINAtLpAoxYwBEyihD0joGML0v93
         T5jg==
X-Forwarded-Encrypted: i=1; AJvYcCVRuk77MaKNLP4aQl1LOvQRT1ic5vFAp51skbZZvO64V+3+EpzoYo4otrlhAabzcnyfHYo2get/3kVGB9ET@vger.kernel.org
X-Gm-Message-State: AOJu0Yz09JrQUbDcO5Kg+8RBr4Ux2VpSaJv/iwqKaakOUBPH5jAkt77z
	x+cS3WMzWBSabTE59UMvy7joI2s9MIK6Z1Bmj6cNpMgfTeXTWvXlrFvF7Umo93c=
X-Google-Smtp-Source: AGHT+IHBCTye5uGE8IjsvAkEbPjYaurpvXwGgj8RC+DFxFi8soKD8YSl7Tx2Na4Tu6ExG7xO92fKkQ==
X-Received: by 2002:a05:6402:380b:b0:5c4:178a:7162 with SMTP id 4fb4d7f45d1cf-5c5cdfd7cf2mr1901837a12.19.1727163422045;
        Tue, 24 Sep 2024 00:37:02 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf4973c5sm467420a12.35.2024.09.24.00.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 00:37:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Sep 2024 09:37:01 +0200
Message-Id: <D4ECC1Y7MLX2.2072IIRC7SJV3@fairphone.com>
Subject: Re: [PATCH RFC 07/11] arm64: dts: qcom: sm6350: Affirm IDR0.CCTW on
 apps_smmu
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>
Cc: "Marijn Suijten" <marijn.suijten@somainline.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Konrad Dybcio" <quic_kdybcio@quicinc.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240919-topic-apps_smmu_coherent-v1-0-5b3a8662403d@quicinc.com> <20240919-topic-apps_smmu_coherent-v1-7-5b3a8662403d@quicinc.com> <D4EBVCYB1A56.21TT1WFRGCYGN@fairphone.com>
In-Reply-To: <D4EBVCYB1A56.21TT1WFRGCYGN@fairphone.com>

On Tue Sep 24, 2024 at 9:15 AM CEST, Luca Weiss wrote:
> On Thu Sep 19, 2024 at 12:57 AM CEST, Konrad Dybcio wrote:
> > From: Konrad Dybcio <quic_kdybcio@quicinc.com>
> >
> > On RPMh-based SoCs, the APPS SMMU advertizes support for cache-coherent
> > pagetable walk via the IDR0 register. This however is not respected by
> > the arm-smmu driver unless dma-coherent is set.
> >
> > Mark the node as dma-coherent to ensure this (and other) implementation=
s
> > take this coherency into account.
>
> Hi Konrad!
>
> Similar to [0] everything seems to look fine on SM7225 Fairphone 4.
>
> [    0.190433] arm-smmu 15000000.iommu: probing hardware configuration...
> [    0.190459] arm-smmu 15000000.iommu: SMMUv2 with:
> [    0.190499] arm-smmu 15000000.iommu:         stage 1 translation
> [    0.190515] arm-smmu 15000000.iommu:         coherent table walk
> [    0.190531] arm-smmu 15000000.iommu:         stream matching with 71 r=
egister groups
> [    0.190560] arm-smmu 15000000.iommu:         63 context banks (0 stage=
-2 only)
> [    0.191097] arm-smmu 15000000.iommu:         Supported page sizes: 0x6=
1311000
> [    0.191114] arm-smmu 15000000.iommu:         Stage-1: 36-bit VA -> 36-=
bit IPA
> [    0.191299] arm-smmu 15000000.iommu:         preserved 0 boot mappings
>
> The Adreno SMMU still has non-coherent table walk.
>
> [    1.141215] arm-smmu 3d40000.iommu: probing hardware configuration...
> [    1.141243] arm-smmu 3d40000.iommu: SMMUv2 with:
> [    1.141270] arm-smmu 3d40000.iommu:  stage 1 translation
> [    1.141279] arm-smmu 3d40000.iommu:  address translation ops
> [    1.141288] arm-smmu 3d40000.iommu:  non-coherent table walk
> [    1.141296] arm-smmu 3d40000.iommu:  (IDR0.CTTW overridden by FW confi=
guration)
> [    1.141307] arm-smmu 3d40000.iommu:  stream matching with 5 register g=
roups
> [    1.141326] arm-smmu 3d40000.iommu:  5 context banks (0 stage-2 only)
> [    1.141347] arm-smmu 3d40000.iommu:  Supported page sizes: 0x63315000
> [    1.141356] arm-smmu 3d40000.iommu:  Stage-1: 48-bit VA -> 36-bit IPA
> [    1.141568] arm-smmu 3d40000.iommu:  preserved 0 boot mappings
>
>
> Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sm7225-fairphone-fp4
>
> [0] https://lore.kernel.org/linux-arm-msm/CAD=3DFV=3DXrbe1NO+trk1SJ30gHm5=
jLFjd0bAeG3H46gD+vNFZa1w@mail.gmail.com/

FWIW adding 'dma-coherent;' to &adreno_smmu also doesn't seem to
explode:

[    1.451965] arm-smmu 3d40000.iommu: probing hardware configuration...
[    1.455547] arm-smmu 3d40000.iommu: SMMUv2 with:
[    1.459041] arm-smmu 3d40000.iommu:  stage 1 translation
[    1.462446] arm-smmu 3d40000.iommu:  address translation ops
[    1.465843] arm-smmu 3d40000.iommu:  coherent table walk
[    1.469216] arm-smmu 3d40000.iommu:  stream matching with 5 register gro=
ups
[    1.472645] arm-smmu 3d40000.iommu:  5 context banks (0 stage-2 only)
[    1.476067] arm-smmu 3d40000.iommu:  Supported page sizes: 0x63315000
[    1.479458] arm-smmu 3d40000.iommu:  Stage-1: 48-bit VA -> 36-bit IPA
[    1.483152] arm-smmu 3d40000.iommu:  preserved 0 boot mappings

And kmscube still runs as expected.

Regards
Luca

>
> Regards
> Luca
>
> >
> > Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm6350.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts=
/qcom/sm6350.dtsi
> > index 7986ddb30f6e8ce6ceeb0f90772b0243aed6bffe..54cfe99006613f8ccc5bf6d=
83bcb4bf8e72f3cfe 100644
> > --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> > @@ -2685,6 +2685,7 @@ apps_smmu: iommu@15000000 {
> >  				     <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>,
> >  				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
> >  				     <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>;
> > +			dma-coherent;
> >  		};
> > =20
> >  		intc: interrupt-controller@17a00000 {


