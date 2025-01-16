Return-Path: <linux-arm-msm+bounces-45278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D489EA13C5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 15:36:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AA4E188D88A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 14:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7D522AE49;
	Thu, 16 Jan 2025 14:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bh5Qpd/F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC26A22A819;
	Thu, 16 Jan 2025 14:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737038185; cv=none; b=EgLG/J3KOoibiMnok9lMROSg8zzOxouumiOvD53FyEgoZ5ilRsFQroA0OCKRbbrJwdJb6p4jcy7vwkwuFnlyyVeN64V4Cf8GkjSPgU8q2lEyEstSBwaFh2uY3FVeFsUi3LYeMC/yyvgkQXNfJ/ekLP6zprNCc7c5rqJZDYGZKOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737038185; c=relaxed/simple;
	bh=FiiklmuVQ48wobf73XaFq2HgoMDJEKBkny1o2AN87mY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ttDqqY6VyOZeTsZZx7+SfUYqdtYahi9d1GUW9KCTrd2a5vLKK1eEim/xuflpqhnBj5Fe8es1DsG4dhGlv5YdNuvnSBlAbmkE6XR8Qr0HlcbZ/qd4kZzL0x8986y569tRvLP+aPyiZHVwC9g8E2Hlhm9pBmsXZsmQqW1svGi5KnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bh5Qpd/F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857AAC4AF0B;
	Thu, 16 Jan 2025 14:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737038185;
	bh=FiiklmuVQ48wobf73XaFq2HgoMDJEKBkny1o2AN87mY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bh5Qpd/FO/trwLTppndIl0ClqLOZKDupI0HfQqr/N+58vQ9Sc+Zq9OKEz1+kjG+ND
	 08BNvWhn6+QymLP7tgyGj5KlL9VOLB1ruyE1YEY19VC+fw+Ww7r99PTryI83DvFigc
	 RCswhnZ3SbczwBNodZ8wPdLOUPjljVY8AgG5HFkN94W6m4vnXn/oOJTGHOKq8zYd38
	 UkcVowwwVBSOsCq875wafqHbLeHVOCH6ETDDkLNviI2yyjxf1SLXKGgAXDtPDv7q2G
	 1eridOKCDIDoePONQsHmC8quhVEGhPYklEBxOczc65TwoMFL4q2tyrj8brwPKvwbV8
	 zpimYppYBtRRA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54024aa9febso1134910e87.1;
        Thu, 16 Jan 2025 06:36:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUaV10zX07ejzPUN6wgSsOQXbHF41s5TD7sIDCyGOPqDnJR54NKIg0QOSJ6bBvjb6MgMuECFr7IiP1ep5Ja@vger.kernel.org, AJvYcCUqZRxdOSxhWwRwZ6tuFAqvjQKZHIZaCtfevZFvhW+ZeF21sSi/rgMasH48Gm3lnOuLNTW/2+niAjzi9SoKJg==@vger.kernel.org, AJvYcCX/PB+7kyS1umR1/RKKKRw7vd5ECSlHQ125vkIdeOm6kyc0k7KVlxflgQCm6F7tfIgD1FjIPa4ZT0KK@vger.kernel.org, AJvYcCXPZECs2NR782MEyfRI3ZtMki3n4sfofGZ5C6TrOlBfuKfMd+rN20TuXM5vhR1Z+AjMgyN5JdT3zPFlKZ6Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqb9DJG9YYHUjiIEGbcD8icquQwOG/XQaJ0YgfX4f4F3f5vHxc
	Czx1iChM3yHZXp/tzpLuvw6OKkiKzGybQEgQmdgZ84OVi/pNbqYovU78yK3TLn/zigfeeYuqS8w
	KzP11qjHvSrxSdn/3vfq16gfNgw==
X-Google-Smtp-Source: AGHT+IEFzH2u5Nw9ZXYRK3qBr2cKgPlDigIbcDFb/MZh/WsuuT8v5gUM8CjDCoS/kXKFX5RJ7PzvY64JLC8o2O1CXCg=
X-Received: by 2002:a05:6512:104f:b0:542:9636:297e with SMTP id
 2adb3069b0e04-54296362a66mr5750572e87.25.1737038183921; Thu, 16 Jan 2025
 06:36:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017144500.3968797-1-quic_yrangana@quicinc.com> <20241017144500.3968797-3-quic_yrangana@quicinc.com>
In-Reply-To: <20241017144500.3968797-3-quic_yrangana@quicinc.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 16 Jan 2025 08:36:11 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJG_w9jyWjVR=QnPuJganG4uj9+9cEXZ__UAiCw2ZYZZA@mail.gmail.com>
X-Gm-Features: AbW1kvYzoDssOTmlGaP7OaxU7PUBm1fSMtQeaMIHjNtOTnwTDryLuMJ_SwVS4zw
Message-ID: <CAL_JsqJG_w9jyWjVR=QnPuJganG4uj9+9cEXZ__UAiCw2ZYZZA@mail.gmail.com>
Subject: Re: [PATCH V1 2/2] arm64: dts: qcom: sa8775p: add QCrypto nodes
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_sravank@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 9:45=E2=80=AFAM Yuvaraj Ranganathan
<quic_yrangana@quicinc.com> wrote:
>
> Add the QCE and Crypto BAM DMA nodes.
>
> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/=
qcom/sa8775p.dtsi
> index e8dbc8d820a6..c1c53f81a555 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -1912,6 +1912,28 @@ ice: crypto@1d88000 {
>                         clocks =3D <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
>                 };
>
> +               cryptobam: dma-controller@1dc4000 {
> +                       compatible =3D "qcom,bam-v1.7.4", "qcom,bam-v1.7.=
0";
> +                       reg =3D <0x0 0x01dc4000 0x0 0x28000>;
> +                       interrupts =3D <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +                       #dma-cells =3D <1>;
> +                       qcom,ee =3D <0>;
> +                       qcom,controlled-remotely;
> +                       iommus =3D <&apps_smmu 0x480 0x00>,
> +                                <&apps_smmu 0x481 0x00>;
> +               };
> +
> +               crypto: crypto@1dfa000 {
> +                       compatible =3D "qcom,sa8775p-qce", "qcom,qce";

This one also doesn't match the schema...

