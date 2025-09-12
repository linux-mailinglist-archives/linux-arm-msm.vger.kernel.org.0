Return-Path: <linux-arm-msm+bounces-73231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAB1B543C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 09:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78C9D683DB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 07:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964CE2C0262;
	Fri, 12 Sep 2025 07:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="diB98gXK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E38E28726D
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 07:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757661874; cv=none; b=Z6ZatusVR1OtrndwBSBf82iBJ117WiJv/16uFjNNa0dj91J85u/ivvQKXX/b5AAXk0Aw72ABbb5/Wsb2bNy2A6gwdBZ4Mx8DVzQl3l5/+jx2GhNVc4IvI4m97OicWIK3ldFB45B9oW6xifxJgvdPM6Tg+1AvPpRtFqIyT10zz14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757661874; c=relaxed/simple;
	bh=ov0o+N7VlhjyhV78KxdzxA6UTh8zdhFtw9m5AFWO1II=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=rfyqmSYOZvWBdS8ZdYgydyrqp7nwJnS7D/3OyiXrSeilaGoKei4QGrb93sUOmvP/q8/X3aUiLvpfuSrDxyjV6+vF/Qo3ee8AJzSDxi9zA1aUkHBlHn09jf/ER0sxccmA/lh8Jf1/mT7DjQCJs9l0DLcQKH1Wiwi8Eh+3SuwLALM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=diB98gXK; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b046fc9f359so241044966b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 00:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1757661870; x=1758266670; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaHiq8VH1qzCN6aCnAst3zvDqtwjzvVk1OyYrGXolto=;
        b=diB98gXK4dZXzwzBGUPRLjJ3EBr/uT2s+OXXXAkMiFkwF4lgo6b2pvuj2z46iqVqRV
         N+CW3ztFuwjuq7r0/lpunEnGISP0ufh8TvG6Af7jvI8bx4YYp2lcYc9Ga6kSFcG54kzS
         CexscO4HTY9Gvo2NdIgj6M0AzwSD46bd0ZV4DP/uVOeOFKJ3V3r5XKbY6vq2jCfQt6xp
         KNEC7jzbjQDNDH9BlIprYnz38qiggic1/vwCmWvoShNyeTFiMlwn3otJYR8vpmKA2sYt
         jWIV6Ubhq2v0R+Qhc65V19p7ahp/iY9lrG+Jp6hkpnzzfeys7lF2shO6g9mfb1yUx7MK
         dO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757661870; x=1758266670;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uaHiq8VH1qzCN6aCnAst3zvDqtwjzvVk1OyYrGXolto=;
        b=sjZ7Jo9eNd71QY7CAFt55JA4Q7Wvyk7S261eayNT6J9cspWSi40AQxfIAqMN/GAYas
         p7zIIZuKjfF5ND3kdt8pR0VQSJgXpbHQoW06F02WhrAb3w+OzIU7opXiTAOpVG2194bB
         HtEA/FMtBdpgrZHai/qVm6A0cnphW08dsNHZBKNvuzmG5Nh+QVrCD/7hNz+h+gZcmGiO
         o+rxc/d5HstLtroLAaioa2Vp+Ip31Ig/cFwPuN1mtXEZTE19cLVccXuD9AuWl5aKjV4N
         iVC744Whd7hzNjAsD4BJyy8MtM+ysNKOfDcQD+8Bfvn1b7REfUtxNcvI4ek2x/NhXEGP
         kK3Q==
X-Gm-Message-State: AOJu0YxmVp60avdihUjSogIbiYRX28Hjz81FkNzAkH1OoTGC3pcVjJor
	c6ZZoU3o9GkzDpMHCwdb2IP79TSx4nPHgJMc+3vsBdqDSDphQychr3nZifqebvNLP2w=
X-Gm-Gg: ASbGncvQlM7paCYu9YxdWW59Lk4B5w+bX43LN3iiu7Pi/MGpB6iJqpkLWImDkm0X/8a
	ORMfgy3NYFRaeRyU2id8WLE8zQHtaJ3B22MLh2n59Z6VKkCokGBUEZ5xBUiv/XMuuLbNZsXkTb9
	63GJ32Np4yCI4+8TZCQhVA05+nLWvbq3IHL7D4H/3MXZZB84uLUfaNViTkYLssC8Ie+x/XQdWZA
	Epbj33BnwblUntljzb3ib8dN/RKNdKnqJNtdGPUF9NSnuy4z5f9XGhFo9a/J1QGEjrLB1Bem1S/
	s09Nm3a0oHamjxkuIK6zSee+6h3uQpXiscw4a+fHfi9EZHpvk9oI2v5Ure98Sq5Od15ks2Zy1gI
	8hcSZaY0NurU6pKzzTS5P6NAXiQX7Db7SuYCBMVrQTHCSXYXGTbPx1AQ5w24Rl5b9cwWiAvLPLX
	r/TRys7pdB2NqTjFZrBDeTl8aRO+CBKvDAthF1uYbANNs=
X-Google-Smtp-Source: AGHT+IElFju5c0ol0hw7nESeIjDDTstVEiLNQomQ5v8H5idD7G4pKPF7+MO6caJyGVA3MvvQLK7alQ==
X-Received: by 2002:a17:907:2d0c:b0:b04:1957:8e72 with SMTP id a640c23a62f3a-b07c3ad9ce3mr161741066b.65.1757661870248;
        Fri, 12 Sep 2025 00:24:30 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07c2d043desm139043466b.40.2025.09.12.00.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 00:24:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Sep 2025 09:24:29 +0200
Message-Id: <DCQN4RMOO9OV.8H4YABRJY4BV@fairphone.com>
To: "Tamura Dai" <kirinode0@gmail.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Joel Selvaraj"
 <joelselvaraj.oss@gmail.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-shift-axolotl: Fix typo of
 compatible
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <38c24430-16ce-4d9a-8641-3340cc9364cf@kernel.org>
 <20250912070145.54312-1-kirinode0@gmail.com>
In-Reply-To: <20250912070145.54312-1-kirinode0@gmail.com>

Hi Tamura,

On Fri Sep 12, 2025 at 9:01 AM CEST, Tamura Dai wrote:
> The bug is a typo in the compatible string for the touchscreen node.
> According to Documentation/devicetree/bindings/input/touchscreen/edt-ft5x=
06.yaml,
> the correct compatible is "focaltech,ft8719", but the device tree used
> "focaltech,fts8719".

+Joel

I don't think this patch is really correct, in the sdm845-mainline fork
there's a different commit which has some more changes to make the
touchscreen work:

https://gitlab.com/sdm845-mainline/linux/-/commit/2ca76ac2e046158814b043fd4=
e37949014930d70

Regards
Luca


>
> Fixes: 45882459159de (arm64: dts: qcom: sdm845: add device tree for SHIFT=
6mq)
> Cc: stable@vger.kernel.org
> Signed-off-by: Tamura Dai <kirinode0@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm=
64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 2cf7b5e1243c..a0b288d6162f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -432,7 +432,7 @@ &i2c5 {
>  	status =3D "okay";
> =20
>  	touchscreen@38 {
> -		compatible =3D "focaltech,fts8719";
> +		compatible =3D "focaltech,ft8719";
>  		reg =3D <0x38>;
>  		wakeup-source;
>  		interrupt-parent =3D <&tlmm>;


