Return-Path: <linux-arm-msm+bounces-80138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BB5C2CD3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 16:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A861A189D81D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 15:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC50321442;
	Mon,  3 Nov 2025 15:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="thBus7QG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C812F320CCD
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 15:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762183587; cv=none; b=AoAV0oQ6FNoeSucAxpErryWlldrYuDtF9rGVaBE8PHLTFRjBprTILBEtG7JqB5g+B6bRyPlC5x/JYIHCAH3ogOxRMudhHV7JszO+H0J3uXbN0cOlYZ0Bh1NZ9JcGmdpjcDKxoSz4dfeTfULwuf/tfdkfbmdERX+Lu03DFwDrz3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762183587; c=relaxed/simple;
	bh=LNcKl9NMpb4FaNICRc4QFad97f639UCgC3oeB4HPq7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHcA4JZnvjItiQ4qLiFspJoFI6I2WaYPspOzDfjV9Fmavy1XUZ60YnQpXszi5wuQgu9xhao7pE8b1OxTLAkHKaX4zL5JPw4UjYYwlt6JoDgYeReOAsTe4uATUe3cIEFNOZAFthUceJjvinyjcLpCK5OiwQhA86gTA8kV2FJQEZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=thBus7QG; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-429c19b5de4so2545173f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 07:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762183584; x=1762788384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kYMdtutpV/rdxaTZKfb/5sBHxK0huqnQvLXOA377vu4=;
        b=thBus7QGWoMS26HD0Q9lZ4QqksHuk/xtNOEVaV5cVLTc7IVQ9kuaimGY47EX5XlHpu
         LlpQnp62WoRnlQG2E8twVuHlQ0PVsxvdDLfivZWO7LvGtuoFhhd5dtnhMRo38oi5umuS
         3SiYP0YDSXooU5DoOD4B8cZNh4SH0IZbTrHYwDVCggOb5qo24aXBtcFxTGiL4neVdRa9
         64aYm7mmdtjFEeJ753Dslrp9OGrZAi2rx91AWrcbJeC6yG7M8qNWvPRclduuEuaJWllD
         N+6Los/UHUaPdMe22jrpeqcpwlZtS2kPo4e97UYf5Pf2gS910LeqAUv6Nkbovb9d/RT+
         RS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762183584; x=1762788384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYMdtutpV/rdxaTZKfb/5sBHxK0huqnQvLXOA377vu4=;
        b=VArPdM0f0If2lKTO2Fr8tnj9FCjy0IrAiaYP+3EWirSfX4yaU1Xjo1m3ql7BonDGLf
         niNmwnN7Ou6ZSi+6hahbmyslwc17HhE82+gVZIi7rEUUaIRXvuvpC0bJ8hAbihsS2m+g
         vgMscp0jH0BiLudhKjpjfJp6dSe702cvVUQcsV+OMdV1MReKBuh6urxuirDiIE4RXM87
         OvqCUdlrmWrt8VHsCa6+XhGAmiaMZzDlgLkLl5HE+VtpQf69H/OSVomqpFE2kJxRaIsa
         OBZ2e+wd/c7ZqN/lKkoyjCaw8K2JyEmFtyUozRJ7tc4ZqODrQkOnZjxOsC9KI2DoARAS
         kJ6A==
X-Forwarded-Encrypted: i=1; AJvYcCUVY8jPWhHZEXVQYoAuCNBZbENRLfg/Fo9stEmj/yP7E9Ly/9gsTgLkqZovduYY9Pg1JVS5eephztq2homy@vger.kernel.org
X-Gm-Message-State: AOJu0YypUUKO1aINzVm/gLrlCQuoJRt4skZB4fgH3DVnuXEa07KO8POc
	ngp5V8ELh3pmLjPugW6EYawGQdKg6jyi7ig33Zc/59X0/KDsz7z6YZcuFJnDhaMUFoo7BBbi+oG
	xIXC1
X-Gm-Gg: ASbGncumA32LjjIIFtMtJ1VYiGHZ2Tij2qUKoNOflGCedmnHaNOeFoDMa5BPM/p/HxT
	j7nk1a6aCJ11MuiQtOVkOgtgw/1JbugOebXhgUFE4KZiCyecsgzpPWX0Cw8K7ZM1dGmywfXw1pb
	wFYzXyuOI9mUHD/X9v+989F/MlbzFc+f5QyGfAG/rvl3kiQuVdER+iOVw3cbjwT3sbnbyJ0TDyl
	34UrGc577w3RM8QHPN8nvH7PrzCGWLw/nV9GJnHIzlHo9HEP/CGl1Ng4UEA+AcVwvzBM2ITJ16h
	YiLOsD8z40oV7cYJhAr6miFs9WIXC+Mn4BG7Es0ic71FeouuJMmQIM+XO7PO+GzMQLCOPDMhFEi
	jSlh450F7BbhoZDG1+DPiCxJ3oNMyqeXf7gjtPgUYX2+N6d4gTMLa1GJw7kBrU6Q0Hz265akK2B
	uprUoqE+A=
X-Google-Smtp-Source: AGHT+IEsr5m6w2R6Za9p2OQEXMw3u7Wecd+dJbxadgAKBtNus+iiq1UhdwMqQGyKnH5KHjwevdv2EA==
X-Received: by 2002:a05:6000:1849:b0:425:7406:d298 with SMTP id ffacd0b85a97d-429bd67a03bmr13016773f8f.5.1762183583944;
        Mon, 03 Nov 2025 07:26:23 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c85ad08esm15786597f8f.19.2025.11.03.07.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 07:26:23 -0800 (PST)
Date: Mon, 3 Nov 2025 17:26:21 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH 23/24] arm64: dts: qcom: glymur: Add USB support
Message-ID: <nlhzhepkkyhvpf6flms3xafvfpepi42ojiopf2vqiau37tv5f6@e3udg2rdglgm>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-23-24b601bbecc0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-v3_glymur_introduction-v1-23-24b601bbecc0@oss.qualcomm.com>

On 25-09-25 12:02:31, Pankaj Patil wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> The Glymur USB system contains 3 USB type C ports, and 1 USB multiport
> controller.  This encompasses 5 SS USB QMP PHYs (3 combo and 2 uni) and 5
> M31 eUSB2 PHYs.  The controllers are SNPS DWC3 based, and will use the
> flattened DWC3 QCOM design.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 243 ++++++++++++++
>  arch/arm64/boot/dts/qcom/glymur.dtsi    | 569 ++++++++++++++++++++++++++++++++
>  2 files changed, 812 insertions(+)
> 

[...]

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 8a563d55bdd4902222039946dd75eaf4d3a4895b..c48d3a70820e551822c5322761528159da127ca6 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -2417,6 +2417,231 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
>  			};
>  		};
>  

[...]

> +
> +		usb_1_ss0_qmpphy: phy@fd5000 {
> +			compatible = "qcom,glymur-qmp-usb3-dp-phy";
> +			reg = <0 0x00fd5000 0 0x8000>;
> +
> +			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> +			clock-names = "aux",
> +				      "ref",
> +				      "com_aux",
> +				      "usb3_pipe";

This one doesn't have a clkref. Why?

I just went through debugging an issue related to this clkref missing
on hamoa (my xps13, to be exact).

It seems whenever I drop the clk_disable_unused, I get a phy init
failure on usb_1_ss1_qmpphy, but never on the usb_1_ss0_qmpphy.
Traced it to the TCSR_USB4_1_CLKREF_EN which has no consumer.

Then came back to this patch and found that ss1 and ss2 have this
clkref and it is exactly as I found out on hamoa. So I guess we need
to fix hamoa.

Still, my question above remains...

