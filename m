Return-Path: <linux-arm-msm+bounces-94552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKChEUoXomnFzAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 23:14:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D9A1BE952
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 23:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BB7F30E32D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 22:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5E847A0DC;
	Fri, 27 Feb 2026 22:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WgbcI9S2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E2D47AF4B
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 22:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772230131; cv=none; b=tNBZSOdiP+cc3Bql5rGu+BLVNNG68yyJ6fXs5Tj+E4yXHwuuc5o13jvnNKWZ1jl5NZeGGLexICuLbekhwTcQqvVSOWgKmkwIQlwgjRhE9BxCxMkoQRSY271Cd6eNGREiuImma5T1nlS4kTI5u00kQ7MIP9I/Ij3X5Hx/TLToEnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772230131; c=relaxed/simple;
	bh=iNSxSIh+ll79sf4TNG2hK58H2dS4Xk6YssNMKaMP+fY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cB9BTHBL8xeX9oIk5ghY8jb5JuvJU8gpL1m/3PSE7Cxkog4ZqqG6IzKxiqzkyUcOoRQUTlN6fIEhmTOiuVo75NnQRPwsoHUBuNy92uU2kzmeGkH8dF/zORPBSkaRNCUf6zkMxvV+owwpOFoE3UtAiLgxM1AYGdp9oef1o0UIu3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WgbcI9S2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso21248125e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772230129; x=1772834929; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5jgh0ia5KAYwXdV6WzubAimlSgIWZXu7hr9crI9YEOI=;
        b=WgbcI9S2wbLLbpaGOETf5fJaqkGxJ04SN2tQQinMal6ImkiaKMD0ac8IDGENgh3/Is
         +CotPYn7+GkPGqz3ZouuCG1zhhnH77+Yk7wyAKdNpDxzK1aDpJlTBcZmesUnz5217uR4
         wc7mSb9DbJb74t7UHVA20HIlNwSmS3Y5rmqTZRPSbYfnsVQhow0T/HjKpBA3tg7QbAMd
         8vEyJjIm2EEryPXKg4ERpue180FrTr62Mn5k11pqDlQQ9S40Z9UJRDu0rWyZPy7vedE8
         aSQhBwb4mWQYXOrOhbuUouln0/nezPL5niRj0NErSwoD9kcpfBGJ33rVu/Ui9PFL5ABb
         p+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772230129; x=1772834929;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jgh0ia5KAYwXdV6WzubAimlSgIWZXu7hr9crI9YEOI=;
        b=ZdBwW8ik+vq8gFYhFQMf1I3bItk+RvqCtEUXCedIw7C+wtHm0tioC968+bdB+SZhYS
         75y4OaMIjZ2FOt9B2XL5W7AXJCpVlo5haINZ47yESG00EAV6qs5Nz4UhLWLOKlMWnu7U
         LrVvJfm7q78dDOtY+t71nVCU3R4/ESXJaf7mwkDPUwMlgOLbnXdseOJoMM3VvoF1/EqN
         K7wWSUYpQ/wh/Sw9HkjQWvRmpIAKDXs3kin1fLqpvm9rrk1pkHVloPnheOP9BZrtzyHh
         wj30wesfG2LJajCRVqTMpzQlNLcCtrDYP66WpaTNxvKFecB6QR02Q7O1c/O+X+v3PPka
         FEKA==
X-Gm-Message-State: AOJu0YwzCWyew+yrXkUL7awfxDHOogv++E4aVybWif1YeWxsVl0SgLKH
	GArjQKp7ZztogQadDQgwSq/135ZD/gwUDiOe/u4eUyTzz8B2jNF2DLd+qtYj1sCoboI=
X-Gm-Gg: ATEYQzxa6Sd9b8fR6rZSwvh4MgloTbDN0IFR03AWQWa8DC4AP6STuYOKI6y5u/absqD
	/g6ppP/3prcqEzwGWYe7n5a2vGvEx7lh1gONYnB99jkATqflL/HF7Nw2S0oObuoTlkEaPOqjJSR
	SSqicucQjd6/Cxd0lZzmTy6bOXhTkyzVxiBTeETilIVsFhpM5/bHlmKmIyaVZociIvW9rdfK1cb
	SVnSdha3DkbU+DLB9eMKTtQpP0Xe9zSeSASdURlmRT9kYqskWyesrSP5D+u63F832cWCV5jfgku
	a2y3Ywe38Fp+yO6B8521Qtjj4KKWxkXHtlL5q2lTQkW/QsQiYqd7IYFG5wc9GZVDgxePZ279qf+
	hFoNvqdwyPQbQ2dmY1u+AtTxhVhPXv2iY35iyr/gL21Vn6mVYf/wIbltAvGSFpW2XmXu+clbGWY
	bBRWzof9alkae+ZQF06vKOvtzQn3SzYbQCaLPl4IB+Qx1hQsQep44vg47CbAS9jJpzw9d93b9K7
	AzeRrYUCagSvokJnkKxcimm
X-Received: by 2002:a05:600c:4fc8:b0:480:4a90:1b00 with SMTP id 5b1f17b1804b1-483c9bead27mr64166715e9.20.1772230128544;
        Fri, 27 Feb 2026 14:08:48 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb987b0sm66574165e9.13.2026.02.27.14.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:08:48 -0800 (PST)
Message-ID: <2932da190f788d2a11f6743bd87b6ff4a61938ca.camel@linaro.org>
Subject: Re: [PATCH v8 17/18] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add ov02c10 RGB sensor on CSIPHY4
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
Date: Fri, 27 Feb 2026 22:08:47 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-17-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-17-95517393bcb2@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94552-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.36:email,0.0.0.3:email,linaro.org:mid,linaro.org:dkim,linaro.org:email,0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 93D9A1BE952
X-Rspamd-Action: no action

Hi Bryan,

On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> Add in the RGB sensor on CSIPHY4.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

>  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 77 ++++++++++++++++=
++++++
>  1 file changed, 77 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/a=
rch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index f10dff1da7f8e..f3f4841ad2c83 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -7,6 +7,7 @@
> =20
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> =20
>  #include "hamoa.dtsi"
> @@ -856,6 +857,66 @@ &gpu_zap_shader {
>  	firmware-name =3D "qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn";
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
> +				data-lanes =3D <0 1>;
> +				remote-endpoint =3D <&ov02c10_ep>;
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
> +		compatible =3D "ovti,ov02c10";
> +		reg =3D <0x36>;
> +
> +		reset-gpios =3D <&tlmm 237 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&cam_rgb_default>;
> +
> +		clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clock-rates =3D <19200000>;
> +
> +		orientation =3D <0>; /* front facing */
> +
> +		avdd-supply =3D <&vreg_l7m_2p8>;
> +		dvdd-supply =3D <&vreg_l2m_1p2>;
> +		dovdd-supply =3D <&vreg_l4m_1p8>;
> +
> +		port {
> +			ov02c10_ep: endpoint {
> +				data-lanes =3D <1 2>;
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
> @@ -1403,6 +1464,22 @@ &tlmm {
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

