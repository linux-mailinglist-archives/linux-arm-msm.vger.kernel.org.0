Return-Path: <linux-arm-msm+bounces-40822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 586F39E74F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 16:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 100DA1887447
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 15:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614D320B81D;
	Fri,  6 Dec 2024 15:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QhOry9qg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703FF1EC013
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 15:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733500548; cv=none; b=tD1c4SdVlBihE05SxF8kQ6MFVwyYqXREYi5N5fdZPxbYk5UvP9OcLN/wVlMzxVDCYFjt7jMZSKmlYzqyk/5dxKtyn7fNuKYvqKVwho1gOjHWZleiap3NBfRcAJ3ZCCF+ltcK1RZV6sIQs8zatioD6aKK1wRlO1AhiQk85P9JUf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733500548; c=relaxed/simple;
	bh=1yO6WKMg7Reae+Xm/8d6dxOzkvnym7CeZdHFGZWhpNY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=g/gTSJRzwga6W/eZ8b2xpOXghzSR6r3hGEegxRbIfumU05fVtw0FLWOiCPPIxGwnYz4Kg4O+lxOly1XNCZAVjD7eHp8lCFpheroYnwOoeOmoDXMIuxkFiUw3YftgAjQJKZyTZw1gAis/0xkTuePWkM0KIcgEPn/F09L9StCvS/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QhOry9qg; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385f07cd1a4so1592840f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 07:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1733500544; x=1734105344; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CfETEog9kNwm+ZEaU4iUILsAuYULWf3mToje1NA0XUs=;
        b=QhOry9qgOlNRdlW+MykgpdjdeSYk4BTQ9q4iXxQ5lcycMTITZ0T7ATYJ2UL91aLfah
         4k9Kis0MOD9lBgviO/sUbsp9zjhQsc/Z9qxScLpEDFpPJqanIWvi75iEKlT4w2S3faig
         /MbSo1ne1WrBxTFL3IaZ+SaLg3ujNAt/DQ3QJprmCVMIUGQnuwJhO0sYxMyCvnYbXALZ
         AxTBmJy0jhj/5O4jHeW/SkyQPmWeM+sfsl9i5LP20z+qMR+dLOeJKoKCZvSUI2iYu8if
         ZpsD1xJmhuBKi8foWaPcOwlRBtc7d2TxcbyHZaM2co6C989iLF8vxdv0iDuYJXQYF3Pm
         uAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733500544; x=1734105344;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CfETEog9kNwm+ZEaU4iUILsAuYULWf3mToje1NA0XUs=;
        b=dnTyvDgUo+lQ0PYil+z9l5VACLg6xCWUcV/Q/6c6hEpPJCTKoNJgiLArqRQTwetWT3
         AaNIXYypUjjUJs747l8b7hC/LcKMnsDjmF7n6rWB2TqBdHgn3w8i7TpmuXdSlSRdM/1J
         LTkpWJF83vua8NnBvdsAInEmNBUzNUyZ2OOEA3YvdaQ4QClNVmPbNHuvf+kzKYCAVv4G
         upe1YP77aHpTRBpsB0LQY8r70tOoTwLoY+Wg+kCF1x2QxkKuGvf9NjtcrQQIRrmSdxbV
         EzKtZEUgxvBCcphoQqkFojMSLk2J/Bl812zgQpSsy71V25AAS1UTjNfovNh139uD2nhC
         XAtw==
X-Gm-Message-State: AOJu0YyYBc3YxACGHu0txKt4FOckeOg/DDGacbz94BFvuy9G4TbKkSlW
	80aEv48mcEuJj07LKKh/qsve9V0Rykb8YheDmDOKaGhI8S9MO1kkjgMIbz1cM+c=
X-Gm-Gg: ASbGncuhOL0Gai5Uvc40u1B/fLhWFmK2Cpecz0wj5oJpbfyg7SMVIlJjWvEix0TopYU
	XQ5iw611kXvY2EO4fJxr2Pl5sx2KDBE73ceJycbiBK4yVR3GvFAqpLs0kb1FeqlupHIy5GE4OHi
	syMcwrxWCIVpccvT96XxUDOngYFvqbp5phNWd+ni5jUat8fcZ4S0x+uoSv6DZTQKoiBk+qkwoGD
	E6fQdxLNiQF8pICbS9F04n1mcZKUxBhhBDdedbQDNKw2JBYkou3vfviVD9vbSLOmjxCKEx/KHeu
	G1KSMKXnBEBnw/D/F+Kn3cLVHYwdq9y6E9d8AhvaJxhvBZGxlNNEAHl1Vj9rpA==
X-Google-Smtp-Source: AGHT+IGju/HpCMcyMpb2m3aBcogWdUR4ZrgWhZBrYlBGJa0J4A5vDrFJeCwRWq9jcVih3UR26XBMqg==
X-Received: by 2002:a05:6000:1f85:b0:385:ec8d:8ca9 with SMTP id ffacd0b85a97d-3862b3d09eamr2648760f8f.42.1733500543773;
        Fri, 06 Dec 2024 07:55:43 -0800 (PST)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862d7158c4sm1698774f8f.54.2024.12.06.07.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 07:55:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Dec 2024 16:55:42 +0100
Message-Id: <D64QNNAMVMJM.3NDC6J100E8ME@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Vinod Koul" <vkoul@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Abel Vesa" <abel.vesa@linaro.org>, "Sibi
 Sankar" <quic_sibis@quicinc.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH PATCH RFT 15/19] arm64: dts: qcom: sm6350: Fix ADSP
 memory length
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241206-dts-qcom-cdsp-mpss-base-address-v1-0-2f349e4d5a63@linaro.org> <20241206-dts-qcom-cdsp-mpss-base-address-v1-15-2f349e4d5a63@linaro.org>
In-Reply-To: <20241206-dts-qcom-cdsp-mpss-base-address-v1-15-2f349e4d5a63@linaro.org>

On Fri Dec 6, 2024 at 4:32 PM CET, Krzysztof Kozlowski wrote:
> The address space in ADSP (Peripheral Authentication Service) remoteproc
> node should point to the QDSP PUB address space (QDSP6...SS_PUB) which
> has a length of 0x10000.
>
> This should have no functional impact on Linux users, because PAS loader
> does not use this address space at all.

I can't verify this information, but with this change ADSP is still
starting up as expected:

Tested-by: Luca Weiss <luca.weiss@fairphone.com>

>
> Fixes: efc33c969f23 ("arm64: dts: qcom: sm6350: Add ADSP nodes")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/q=
com/sm6350.dtsi
> index 8d697280249fefcc62ab0848e949b5509deb32a6..3df506c2745ea27f956ef7d7a=
4b5fbaf6285c428 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -1283,7 +1283,7 @@ tcsr_mutex: hwlock@1f40000 {
> =20
>  		adsp: remoteproc@3000000 {
>  			compatible =3D "qcom,sm6350-adsp-pas";
> -			reg =3D <0 0x03000000 0 0x100>;
> +			reg =3D <0x0 0x03000000 0x0 0x10000>;
> =20
>  			interrupts-extended =3D <&pdc 6 IRQ_TYPE_EDGE_RISING>,
>  					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,


