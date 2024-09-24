Return-Path: <linux-arm-msm+bounces-32229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8128983DA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 09:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5893D1F23FFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 07:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79662145346;
	Tue, 24 Sep 2024 07:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jstRXiqJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FD0143725
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 07:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727162117; cv=none; b=A23aUGM1xT9JLuASc9QUO3CKqMvphknyHmxRsCA28wxOVqhuNO5iK9/XxiAj2zCnU6JAzHCnwAHh1jT+XCOp/ejJGhO7f/U2c4ahmebf5GRQMlfjmnKN96xr+R5nBNjf++m95EJjUS73t1SmQI1snx3OkEIC7HpDnaawdrZWr4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727162117; c=relaxed/simple;
	bh=dFHsUcuwdml9tPy/a9bwGm7XZBafs188fpXgCrVxH9c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=BHuMowWSglGhDyV3FcH6nDTm5rJ16GR5SDijEPi5XiMmNAmOquGBZxv9hADBUbwor2nLvPi7gu/WI3W5APxqiSD+3lRqktSSztPNiP1deHkl7wdIhqWR/q54IPk1ce1yxIPzUjv8ZiXsm47FuRXe0YFLKXkUhbQKVLlg7VQVEH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jstRXiqJ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c44e1cde53so6598673a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 00:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1727162114; x=1727766914; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cajhmBCXQZKSrLAVt9O9VA7lCZwJirG7AeVDIGrh7f8=;
        b=jstRXiqJ1wnBKtZn1QUTenz8LvoUrqmiizVkDpARYWWwyPAvnpkChkDys+rnhMZUjh
         Pxo4FlpGVy/H5m+9FWSPmgliaeqXqq7AKthpJ6qfoDwd/bDcL5FkmqAoM5dHD8weg7c5
         dwLre0B/J4Ad9ngM9Iw0LeOdJ7uIn/raUjPbjeAk4M4oJdPDC4y+S5WTrG0RtiwV7Xb3
         2KJHHU7JCBBGKMPBoiqEKCBzGiBmtKb4EX9bwPfDwhyqevYHDny72PUFeqEs2ZBKObnW
         TydhUntGkuGyamviNiVu2pi8DiKef/HSQdexhEMYwIKzvo/qOjp17jqbw0ekNWnF6VXm
         2QVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727162114; x=1727766914;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cajhmBCXQZKSrLAVt9O9VA7lCZwJirG7AeVDIGrh7f8=;
        b=IWXnMYCCDx7hoipwA2XKkkFU/ZNc4umhtA75gMcXt71dGc4WiZtwc5/TEx5gTRStE0
         sTffZlhFUcl3bQyqhUGfHDayaLQyN81IIjkKgDHG/v10YXrodAzSHK5LYuYGkk7LcM4S
         UvhqE5EJu0Nu0qLEft49ImjPfPdGUH6FsaFYwVm5MF7XAY047FLHd4MjUMAhCmH42/ck
         xwiL/KoeafvJ+riVh09Z//xyn87vNCyW88zOYHLeg+jzfEWXqZlpovWU1vE2szrHP+4D
         bAZxEVNfx0ZAPETP3DvJCW3SAOr0H9LGTsZRCFezIyuyWQBrl3OwaRkUQUUNfbCq3Z1l
         +erg==
X-Forwarded-Encrypted: i=1; AJvYcCXvhuq87Mld/rKkkAS50/usFZHmss/0IGLwd0WyYMyymjPdmY8UOoa+3FsEhaest5rNvwCfXhlAiXsi0Rgn@vger.kernel.org
X-Gm-Message-State: AOJu0YxfVH6bnjSfQJquIYTLv5Lmwg3YYO/bOsDY1YnxoMkoAsgtv0Kq
	mx6UQOXdXo/je+BsKit4RxIARtWAMrr8EEM8M5U3Yk5XeDrvlct1mMwV5Qh7WG8=
X-Google-Smtp-Source: AGHT+IGhzrOQvSNMdXNtOt+4i5dURer+xNowHaBG6b65R80TgOhirmqf/gL94bvXn9ou3bbm+OVdUQ==
X-Received: by 2002:a05:6402:34d1:b0:5c3:c548:ab3a with SMTP id 4fb4d7f45d1cf-5c4646640bfmr11854683a12.2.1727162113821;
        Tue, 24 Sep 2024 00:15:13 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf4d77d9sm445370a12.94.2024.09.24.00.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 00:15:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Sep 2024 09:15:12 +0200
Message-Id: <D4EBVCYB1A56.21TT1WFRGCYGN@fairphone.com>
Subject: Re: [PATCH RFC 07/11] arm64: dts: qcom: sm6350: Affirm IDR0.CCTW on
 apps_smmu
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konradybcio@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>
Cc: "Marijn Suijten" <marijn.suijten@somainline.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Konrad Dybcio" <quic_kdybcio@quicinc.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240919-topic-apps_smmu_coherent-v1-0-5b3a8662403d@quicinc.com> <20240919-topic-apps_smmu_coherent-v1-7-5b3a8662403d@quicinc.com>
In-Reply-To: <20240919-topic-apps_smmu_coherent-v1-7-5b3a8662403d@quicinc.com>

On Thu Sep 19, 2024 at 12:57 AM CEST, Konrad Dybcio wrote:
> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
>
> On RPMh-based SoCs, the APPS SMMU advertizes support for cache-coherent
> pagetable walk via the IDR0 register. This however is not respected by
> the arm-smmu driver unless dma-coherent is set.
>
> Mark the node as dma-coherent to ensure this (and other) implementations
> take this coherency into account.

Hi Konrad!

Similar to [0] everything seems to look fine on SM7225 Fairphone 4.

[    0.190433] arm-smmu 15000000.iommu: probing hardware configuration...
[    0.190459] arm-smmu 15000000.iommu: SMMUv2 with:
[    0.190499] arm-smmu 15000000.iommu:         stage 1 translation
[    0.190515] arm-smmu 15000000.iommu:         coherent table walk
[    0.190531] arm-smmu 15000000.iommu:         stream matching with 71 reg=
ister groups
[    0.190560] arm-smmu 15000000.iommu:         63 context banks (0 stage-2=
 only)
[    0.191097] arm-smmu 15000000.iommu:         Supported page sizes: 0x613=
11000
[    0.191114] arm-smmu 15000000.iommu:         Stage-1: 36-bit VA -> 36-bi=
t IPA
[    0.191299] arm-smmu 15000000.iommu:         preserved 0 boot mappings

The Adreno SMMU still has non-coherent table walk.

[    1.141215] arm-smmu 3d40000.iommu: probing hardware configuration...
[    1.141243] arm-smmu 3d40000.iommu: SMMUv2 with:
[    1.141270] arm-smmu 3d40000.iommu:  stage 1 translation
[    1.141279] arm-smmu 3d40000.iommu:  address translation ops
[    1.141288] arm-smmu 3d40000.iommu:  non-coherent table walk
[    1.141296] arm-smmu 3d40000.iommu:  (IDR0.CTTW overridden by FW configu=
ration)
[    1.141307] arm-smmu 3d40000.iommu:  stream matching with 5 register gro=
ups
[    1.141326] arm-smmu 3d40000.iommu:  5 context banks (0 stage-2 only)
[    1.141347] arm-smmu 3d40000.iommu:  Supported page sizes: 0x63315000
[    1.141356] arm-smmu 3d40000.iommu:  Stage-1: 48-bit VA -> 36-bit IPA
[    1.141568] arm-smmu 3d40000.iommu:  preserved 0 boot mappings


Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sm7225-fairphone-fp4

[0] https://lore.kernel.org/linux-arm-msm/CAD=3DFV=3DXrbe1NO+trk1SJ30gHm5jL=
Fjd0bAeG3H46gD+vNFZa1w@mail.gmail.com/

Regards
Luca

>
> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/q=
com/sm6350.dtsi
> index 7986ddb30f6e8ce6ceeb0f90772b0243aed6bffe..54cfe99006613f8ccc5bf6d83=
bcb4bf8e72f3cfe 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -2685,6 +2685,7 @@ apps_smmu: iommu@15000000 {
>  				     <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-coherent;
>  		};
> =20
>  		intc: interrupt-controller@17a00000 {


