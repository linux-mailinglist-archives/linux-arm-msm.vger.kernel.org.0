Return-Path: <linux-arm-msm+bounces-94549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBirOI8WomnFzAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 23:11:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 476611BE8DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 23:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 780DE312F704
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 22:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322BA47A0D1;
	Fri, 27 Feb 2026 22:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jhCOfcDT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4985D4779B5
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 22:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772230011; cv=none; b=t3I9SWwrl6tGzN1a7sxhHJpi/z83BMZedhsCtwiEhBYpwMHpYyA4y//PGmvh1D6MvOKL1AgorS9xtv06cFLQsFakB0G8PB3siDsN7qnq/HyxwWAtOcO0AprgSbStbREN/ttthTFdzqpNdIjv8l4vNyV9XOBh8hc8fQ+Usi3xpKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772230011; c=relaxed/simple;
	bh=IIOCEw2t+0l72LMoF+mobRrMZmX5NBn1xnXPFaoBKs0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iaC8DeEALIR849L4jlIVkqEePM3vdZwB+1u7jpmFwWSA/S/MFaTLCcyQ8+eCvbUFEdiRBS/4LZQVbLWueRJIU5rLo2A5S9NznLXCxGmHnSibJt6WWZ/j/+YyYzAcIB8ky+a/49yjflxWVIf3YSMLND2RYzlFjnaxVBT6+DorhVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jhCOfcDT; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483703e4b08so22399605e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772230008; x=1772834808; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=89iRGH0zqziCtR4XYNUtyhFhnoYfn28eiRVuc9YsATM=;
        b=jhCOfcDTHshPuWlToF+gdN8VogLay6L6JIl4340gZZsqjn3RlKADwuZicfS3beBvlY
         9MXWozCmHar8Ft26xBD2NqTdUMm4IdOxwfrCCanYS4vj2AOkEDI24BIFkOQbrbSudCSj
         YfqR2eae5QP16kf6mFBVUgr1JF/sCH9jpKzmxZzn1byTj0tN40Rap6zt8sYfk8KC7GAZ
         zVilwSlA81FcqISPIMRBnDYGzfks717ObK/VsuaYE/IS5sFCRPMjDHBMOY1fV1SPt0D1
         BON/wHrI6JM4uoZRHa5ngE8C2Jm3dOZVAWW5uzaVfogbjh7r4ThKaGsambkiDNobshNl
         E8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772230008; x=1772834808;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=89iRGH0zqziCtR4XYNUtyhFhnoYfn28eiRVuc9YsATM=;
        b=dc49ZmEcuRT7XEHPPgQ8I64j8iUwTetqW7L16w8ab8pREp1xiFfRZB5CqYe0LSsflS
         ze8rE0BBzOd7KvXjmq4mRRLXdhAokhXx/UgeeME3Bh+A0wdQP3MdAvRHcjBBctQdOChE
         kV6XhvYZauocbLSwZuYu7WyVH9eYpZdnVuZkhiQSK9nrlCDKID3zTvEIY45rRxQXUvyd
         fFDX/vu9HnGnbh8R9DinvJEpiJJJ9sWLssJu9srDqKD1BejK486kPeFmpdF4BODsw9ZL
         q1398HB/W7BpAt6WR+ZgFcy5BqEgVgVn9fRFWX6BFulRpYeVxBB8HwXjLdyxCZt9/k2d
         8H/g==
X-Gm-Message-State: AOJu0YwfmRyBzScAHr2PGeewLjURevmnqm7Xl4RNA9n8zHlL1+93n5WG
	nU3BKfnA5Bp6Fji1v2iyKwkgZ06T52gPivbsK6W27R+7+44pwDCPXSeP9IFTnMIoSK4=
X-Gm-Gg: ATEYQzyWIrMeM6UV7p88/vQcDn0OgFpvlCS4XJ0cjezv2g9psOQr/xCIQzbaaJQSAjd
	eHDKQ+FDhH/C2oGFLkEYYu07w99rwc8poXUTQ4CXNI7nG9vfK5qULbXQdEpSQQiWR/NwGpJqir+
	5CG17A+THNqXxElkBXurZEy+wFFiDVZ7RpkR+WNe23gmEIow9glmJ3wfKNn/p88qEtEyguVztWE
	nyAB3G6T8mbkovL50sw94wGOOO+39DUFpCS+ONQkSlsfWeKVSgfocZV3ztpFEMZ5bltTZnEZVrq
	XdL9DGgWFjgmJ3BvbDrDckHenstes0pWKtQ3oN+NG7OQHhhhz+ZS0jhEYLEGQNokL41erPW9SG3
	nzmY4aZtmngENpsookmUl8zgudT0KAC0nHiQUEH1Z7w7I6CpRAX6g6sxlwafZf7DJAaKPqTjOq5
	fuI50uXw7ywR7pjYe97UharDWaR09isF2qEOHPTqGG6pddlYwkYkeBEJAljN9Sy2fG3Hp9aEXwl
	3nkRDb87WthTUSZMF6DFxvRXSMpdUgOimk=
X-Received: by 2002:a05:600c:608a:b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-483c9934dd3mr76689115e9.14.1772230007672;
        Fri, 27 Feb 2026 14:06:47 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df90sm246321165e9.14.2026.02.27.14.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:06:47 -0800 (PST)
Message-ID: <148be140e22947a1f3524f24d8f55218650d3f2e.camel@linaro.org>
Subject: Re: [PATCH v8 13/18] arm64: dts: qcom: x1e80100-crd: Add ov08x40
 RGB sensor on CSIPHY4
From: Christopher Obbard <christopher.obbard@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson	
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert
 Foss	 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Mauro Carvalho
 Chehab	 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue
 <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 27 Feb 2026 22:06:46 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-13-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-13-95517393bcb2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94549-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.36:email,linaro.org:mid,linaro.org:dkim,linaro.org:email,0.0.0.3:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email]
X-Rspamd-Queue-Id: 476611BE8DC
X-Rspamd-Action: no action

Hi Bryan,

On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
> connected to CSIPHY4 in four lane mode.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 76 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 76 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/q=
com/x1-crd.dtsi
> index c89f5ad0aed56..d47404c71b80b 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/gpio-keys.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> =20
> @@ -901,6 +902,65 @@ &gpu {
>  	status =3D "okay";
>  };
> =20
> +&camss {
> +	status =3D "okay";
> +
> +	ports {
> +		/*
> +		 * port0 =3D> csiphy0
> +		 * port1 =3D> csiphy1
> +		 * port2 =3D> csiphy2
> +		 * port3 =3D> csiphy4
> +		 */
> +		port@3 {
> +			camss_csiphy4_inep0: endpoint@0 {
> +				clock-lanes =3D <7>;
> +				data-lanes =3D <0 1 2 3>;
> +				remote-endpoint =3D <&ov08x40_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	status =3D "okay";
> +};
> +
> +&cci1_i2c1 {
> +	camera@36 {
> +		compatible =3D "ovti,ov08x40";
> +		reg =3D <0x36>;
> +
> +		reset-gpios =3D <&tlmm 237 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 =3D <&cam_rgb_default>;
> +		pinctrl-names =3D "default";
> +
> +		clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clock-rates =3D <19200000>;
> +
> +		orientation =3D <0>; /* front facing */
> +
> +		avdd-supply =3D <&vreg_l7b_2p8>;
> +		dovdd-supply =3D <&vreg_l3m_1p8>;
> +
> +		port {
> +			ov08x40_ep: endpoint {
> +				data-lanes =3D <1 2 3 4>;
> +				link-frequencies =3D /bits/ 64 <400000000>;
> +				remote-endpoint =3D <&camss_csiphy4_inep0>;
> +			};
> +		};
> +	};
> +};
> +
> +&csiphy4 {
> +	vdda-0p8-supply =3D <&vreg_l2c_0p8>;
> +	vdda-1p2-supply =3D <&vreg_l1c_1p2>;
> +
> +	status =3D "okay";
> +};
> +
>  &i2c0 {
>  	clock-frequency =3D <400000>;
> =20
> @@ -1515,6 +1575,22 @@ &tlmm {
>  			       <44 4>, /* SPI (TPM) */
>  			       <238 1>; /* UFS Reset */
> =20
> +	cam_rgb_default: cam-rgb-default-state {
> +		mclk-pins {
> +			pins =3D "gpio100";
> +			function =3D "cam_aon";
> +			drive-strength =3D <16>;
> +			bias-disable;
> +		};
> +
> +		reset-n-pins {
> +			pins =3D "gpio237";
> +			function =3D "gpio";
> +			drive-strength =3D <2>;
> +			bias-disable;
> +		};
> +	};
> +
>  	edp_reg_en: edp-reg-en-state {
>  		pins =3D "gpio70";
>  		function =3D "gpio";

