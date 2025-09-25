Return-Path: <linux-arm-msm+bounces-75001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6FAB9DF82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29CCE189A62C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD5B266568;
	Thu, 25 Sep 2025 08:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="otiaoNTI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B538C244670
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758787597; cv=none; b=VsQ4CA6EAjM9gvYRwKLYxAKITD1tHn6M4pX6Itd6ZdQOdV1YdV/U7SaCtpPQ/7zNnoCa4o2VJnp5lo0ooTdsrp21Y+2OrqA/PeLQ6PbUwJLTEdbCF2/cajr51wrnbD1QmFz/TmFGdNV+lClA6pcXavekGZkHP+yEzeGQe1YILYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758787597; c=relaxed/simple;
	bh=wIUpwcxZIeZ1aDFyn/xGONSivq82OQbzEQN8fhdtf44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLuYYrhYG2GSxXZvIroaumz4krBXCai3lmVRAN1+xV7GKBR2EWCUplo/6EhtqPjk3wf8n84qH46KpLhY6LbCvAACYaHUkYEpj/1fK6g66qGyomjMSNC0/9x26wlyNl286UVM6vQHhrOjjSyf1v0SEtMfVPbqVLI1rVUAozfc9i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=otiaoNTI; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ee1381b835so687295f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758787594; x=1759392394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1F2KFXx2QCTmJtkVij/dwh3zwds+jV+Sj9PH66pCWDs=;
        b=otiaoNTI1DbqjnG9USXPKmcopfLYnueODjpKwi9abe3qVj6K8leNcTCliLa+S7piTl
         wC7MCCwW8BcVa5VC6ugnCqW8sh61FUdcregZbU0TuBscoq/QvkR9Fzbb/8a+wGGH8h/G
         mW0JAVpNKBW8hbqgnwN0+mJSUDFas2ZPYfCaQZaFKhEjZA5gQvlKPLqKGxNHj2KmkXkU
         HVEo5zPXOBr9bKi+2Q366B7p92yKR4Ka6rN6feIwuLbqqX91jqJhuu3+SL7r+KUxWTtq
         quJGp9flP98MEkYJia6+M4QG115/K27UA1qu4NgPvBEHLk6WjW8iYVki8u0ooIABel5W
         DIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758787594; x=1759392394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1F2KFXx2QCTmJtkVij/dwh3zwds+jV+Sj9PH66pCWDs=;
        b=BD0VucQqJvTTF+Sa05uKcqzOuyOaDxzcrp/+15hpdlkk8DtO6H6M5citjA+M/8LOO9
         phChVzK1jUrDHXXGmBPt1lUK1MWVOC0BCP1PNOLMS6kJyCI0rfzEJPB8E7xr7KdPTFtR
         t9oLlvJMJGP+NuxoqSI7o+s/xZLDNwZCW+/dr8T80wURxGvhVLY3KIUhqSwJi82LuG0d
         sMMKxF1Ynjv/kCrSZzgfmhvvkZiCMzwXrU14w+4fpYpOQSF/nx7ag3bIh69Z3L+5Bj6+
         wsJgLx34aeJzwJlMTeKbfMht+jMOqu339e3wZZstwNq96hxFVKDpqq4KP9GtWNzUqEJ6
         OlsA==
X-Forwarded-Encrypted: i=1; AJvYcCVOnMnSGZ5guOhBslM17pX2wnkZQk5eiywqovNBIN54Flqjwr2xyr382k9Eo0SKzh9LGDHBlmjOubAvmi7c@vger.kernel.org
X-Gm-Message-State: AOJu0YyNtdTDeqO4Son98yS6x2Da/RIlEMzRZ612eoLIYUGymml8Uyr3
	rF0TAkHupCgx1Z5x028pESiT/J0NZVrmeExnWIn29yVCSDyEDtvFOdonYnRbcyenToKHO/Olwur
	UUZ31
X-Gm-Gg: ASbGncsCWJ4ihaZcmL01bVWxFtL1QRmL0+bfywvmipGE35wtGjxcnwEMNO1FzDloxPg
	gUoht8mYNB+2DnuT6846Lap3WDA9+j9MpKBRBUkdgt1kotSm1u2N6rubOYArMO1yWuHiHEg1MmI
	KPOF6u/qv4sHmPqYkeyHD0QcEjQvpRfi+0b7HBdMm5nIs5CW7IBCZUNiohiz6/tExf3dU7DGc6z
	Zyqe5zsRqpIJ0el17cnoKyy2feZgUqTUpRRHlMg9qNvIhG3DbZCxUtYNKPVxjDqCqv6a2W6EOhv
	ojL4OxZ/LZWvx89GjLH5I7CW6+Z3Mi1Zr2yEVm02u/FXKokcbhl8lRb09OSxANyw2YamxiO34V4
	GmIaAd+3/Zl/kDzN0KK/nRA==
X-Google-Smtp-Source: AGHT+IHICrMoE4g1EPf1gi1U6G1AnaxAKikasIGU7lM5VMp3j9Yet+MUTclXE5ZQ7g2e91yVvhiz6w==
X-Received: by 2002:a05:6000:3105:b0:402:5708:629c with SMTP id ffacd0b85a97d-40e4bb2f6cfmr2156088f8f.41.1758787593926;
        Thu, 25 Sep 2025 01:06:33 -0700 (PDT)
Received: from linaro.org ([86.121.170.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab31bdesm64208525e9.11.2025.09.25.01.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 01:06:33 -0700 (PDT)
Date: Thu, 25 Sep 2025 11:06:31 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH v2 23/24] arm64: dts: qcom: glymur: Add USB support
Message-ID: <uqcmm7qjqtvkhncyp76dgu2cm2ovjfxowwtrawqxjuychbjf4w@3rfvptbmsvo2>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v2-23-8e1533a58d2d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-v3_glymur_introduction-v2-23-8e1533a58d2d@oss.qualcomm.com>

On 25-09-25 11:58:29, Pankaj Patil wrote:
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
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 03aacdb1dd7e2354fe31e63183519e53fa022829..100519aa5a7cd905285d3aa41ebe5f63ae00aeef 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -99,10 +99,74 @@ ports {
>  
>  				port@0 {
>  					reg = <0>;
> +
> +					pmic_glink_hs_in: endpoint {
> +						remote-endpoint = <&usb_0_dwc3_hs>;

usb_1_ss0_dwc3_hs

have a look at x1e80100.dtsi, please.

> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss_in: endpoint {
> +						remote-endpoint = <&usb_dp_qmpphy_out>;

usb_1_ss0_qmpphy_out

> +					};
> +				};
> +			};
> +		};
> +

[...]

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 8a563d55bdd4902222039946dd75eaf4d3a4895b..c48d3a70820e551822c5322761528159da127ca6 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi

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
> +
> +			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
> +				 <&gcc GCC_USB3PHY_PHY_PRIM_BCR>;
> +
> +			reset-names = "phy",
> +				      "common";
> +
> +			power-domains = <&gcc GCC_USB_0_PHY_GDSC>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <1>;
> +
> +			orientation-switch;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_dp_qmpphy_out: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					usb_1_ss0_qmpphy_usb_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_ss0>;

usb_1_ss0_dwc3_ss

and so on...

Again, have a look at x1e80100.dtsi, as an example

Thanks for your patch!

There are quite a few things to improve though.

