Return-Path: <linux-arm-msm+bounces-78385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EFBBFD8E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 19:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65D553A751B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C8D2638B2;
	Wed, 22 Oct 2025 17:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KodlE0R1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B3D1B7F4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761152702; cv=none; b=Uyx2mIuwhsspfCXH8RdxoW83QsLXd04or91HTB8FII8A7LNGiqrU52GpHUyQMLeJcud/8I17U80ikDdORmKWniL0o657ahYQJeI9pvJh1mRhySAXDI5Y5MkOxxs0fJmcJb9r3xsd8aoktoykMTqnj5joll+8OCB3AautVnX1lgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761152702; c=relaxed/simple;
	bh=EgunH31eTnsVb/QLiEMMM1PyLJAVFDnbYWNUJS4Vl30=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nF284N9qY6XUqQWi/d/hBmVT0Z6QaWbCtbm9EpcP0eurzHWftd4LMkpm8mqhHwRHbqAShmtONU4KI5sJ4kWwQA7Y1Yj2ZHy3fmpNmiH0AQptB7J1qs4xdTYvA8QwtNi6Ll9qzEGIxdXf0gUiOdwTnErQvkP1e8kSkBCCeX2Vp3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KodlE0R1; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47117e75258so37131985e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 10:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761152699; x=1761757499; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32wWVCnxfPxXwYEHrPhplOIt/hFbj1bnM86HXOsRbI0=;
        b=KodlE0R1GQA9GEWGXTHyqDj9gLNV4yOVhDFiSFIqRGP61Ly1OBmp6THR4N9DTXfNZb
         0XIrPAaBaYGs1hIS/KF2RiAQ/Pzx/YW4n+bECj2aERB/icOn1HMHpY7mi6XybgwTS2Br
         qUQAgpK7KgkqKi1aojPfd9CuaS376aCNURdbmSU4ysueh37Axjn7wpdUHu4d9r6lbWhn
         qlL8JmRHbDxeAGMBLSJUw/TQtXEpkGMsqVqO2R9jgFAt3Nwa0Y7DORmPao4c5zV7LdL5
         1rKCEV514oz2lVEXb58JWqOQaJaPtY0UuVHSrV+zJz92D2cTHUlrKhVmkqu8XURdxsi9
         BRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761152699; x=1761757499;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=32wWVCnxfPxXwYEHrPhplOIt/hFbj1bnM86HXOsRbI0=;
        b=JolRVviVGU9amfMD5GMa4aLSxbSCJy8rb/xcZXyL4gjzZqV4tavpCFSSTYZeZdZtGg
         rfjKZethtzIf1Ovz2AAVMjU5enZQ2RuUaF0H6fe2HIVfsPs4ZoEKm/eGyqrpHZd14u1U
         NFhQtuf4VJiTX2hWaOS2cNw91U5yicxiYHRA4VTTjx3DHD1SWq48roznmD52gctLO3ub
         Nm+w2DJxl91jILlkPs5jPPVIWkY0CRcP2J1xiDiJ+K1ipEauUmH4g8jZqRb3+He6v+3I
         4LbxudN1SrECWDNt47msux0knXdccoLpQQkXIHiM0jzEikOj8JNYAvwDueGV4X3fE4AD
         qtoA==
X-Forwarded-Encrypted: i=1; AJvYcCVSaXnWwP0wlANa0OUv630/qwpI8x+B+qxhOpxT/RY7D5XMDO0oOpWPeS3EI1WsJDZT0XHy+3QBbboYV232@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2SeBEgIi5AN1zwibIW8cj7L9009yokBwPwniuq68r3jWeUvZS
	YP39T08iB7rF8L6rO3u69+t8SBhrHoXENAgG7UleDq4nTUWtBzc3N9P2vFtCqVsJqGw=
X-Gm-Gg: ASbGncsVLYN5Iu5VXJEVQF+QvoKxtyHobNnz1YzdHxv/+muKuYIjmTSpNKe0lwqxGOM
	AIp8RrwRDxZIkT9HeuY5zAF5ZLFHxZ5RIw1BJcFPabi7PZTzwJxhIPmfdGE91f7ooAdoB2b3Pqr
	m+FXCB2upB9xAxm6kaTQMkicZqBQh9qo0ief8HvyqmCWHSCeiXYAQRJsx+0zNUHlzF/mJ6Ab5sZ
	tEXPGlG5MnzWkAtE0ibGbrVfuKfWXyXkv7KlBix/woYBLU2DqhZhjZ5OwpLNEUTJRxEv/0cmhYI
	GSaoshYwjYbkp6pLhP61I3paWUbVPQoyx9QGUj7zKxv43MD0ubmZ6PAWUxDDy1WPy7itSXEfIif
	65XMUMU38GeYZff7hVZw6cg793P8YGfJusGhFR5Th+ZD9wetGZx3HnLNTYkS20hAGaSC3ktW5NV
	v9MTp9
X-Google-Smtp-Source: AGHT+IFmj2XqRZSV8uq6JK5/wuWcy7s7skNAC2uPqQiciaWffxUPCp6My9UDZBTNxMujaGi4I4wsdg==
X-Received: by 2002:a05:600c:3554:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-4711789e374mr126327145e9.13.1761152698935;
        Wed, 22 Oct 2025 10:04:58 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:11f4:2b3f:7c5a:5c10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-428567cd83csm3271205f8f.14.2025.10.22.10.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 10:04:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 18:04:57 +0100
Message-Id: <DDP0J063IX84.2MC5D16VHRFVR@linaro.org>
Cc: <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Sibi Sankar"
 <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345: Add
 Left/Right Speakers and Tweeter
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Abel Vesa" <abel.vesa@linaro.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251021-dell-xps13-9345-enable-audio-v1-0-6f3f6bbd977b@linaro.org> <20251021-dell-xps13-9345-enable-audio-v1-3-6f3f6bbd977b@linaro.org>
In-Reply-To: <20251021-dell-xps13-9345-enable-audio-v1-3-6f3f6bbd977b@linaro.org>

On Tue Oct 21, 2025 at 2:50 PM BST, Abel Vesa wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>
> Enable left and right speakers/tweeters on the X1E80100 Dell XPS13 9345.
>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 139 +++++++++++++++=
++++++
>  1 file changed, 139 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch=
/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> index 58f8caaa7258077d2c267048ca048279109ddb71..a05dfe2c51364b3ec04963590=
d9b02b9fda9f336 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> @@ -151,6 +151,50 @@ linux,cma {
>  		};
>  	};
> =20
> +	sound {
> +		compatible =3D "dell,xps13-9345-sndcard";
> +		model =3D "X1E80100-Dell-XPS-13-9345";
> +		audio-routing =3D "WooferLeft IN", "WSA WSA_SPK1 OUT",
> +				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
> +				"WooferRight IN", "WSA2 WSA_SPK1 OUT",
> +				"TweeterRight IN", "WSA2 WSA_SPK2 OUT";
> +
> +		wsa-dai-link {
> +			link-name =3D "WSA Playback";
> +
> +			cpu {
> +				sound-dai =3D <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {
> +				sound-dai =3D <&left_woofer>, <&left_tweeter>,
> +					    <&swr0 0>, <&lpass_wsamacro 0>,
> +					    <&right_woofer>, <&right_tweeter>,
> +					    <&swr3 0>, <&lpass_wsa2macro 0>;
> +			};
> +
> +			platform {
> +				sound-dai =3D <&q6apm>;
> +			};
> +		};
> +
> +		va-dai-link {
> +			link-name =3D "VA Capture";
> +
> +			cpu {
> +				sound-dai =3D <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			};
> +
> +			codec {
> +				sound-dai =3D <&lpass_vamacro 0>;
> +			};
> +
> +			platform {
> +				sound-dai =3D <&q6apm>;
> +			};
> +		};
> +	};
> +
>  	vreg_edp_3p3: regulator-edp-3p3 {
>  		compatible =3D "regulator-fixed";
> =20
> @@ -415,6 +459,13 @@ vreg_bob2: bob2 {
>  			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>  		};
> =20
> +		vreg_l1b_1p8: ldo1 {
> +			regulator-name =3D "vreg_l1b_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1800000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
>  		vreg_l2b_3p0: ldo2 {
>  			regulator-name =3D "vreg_l2b_3p0";
>  			regulator-min-microvolt =3D <3072000>;
> @@ -880,6 +931,32 @@ &iris {
>  	status =3D "okay";
>  };
> =20
> +&lpass_tlmm {
> +	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
> +		pins =3D "gpio12";
> +		function =3D "gpio";
> +		drive-strength =3D <16>;
> +		bias-disable;
> +		output-low;
> +	};
> +
> +	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
> +		pins =3D "gpio13";
> +		function =3D "gpio";
> +		drive-strength =3D <16>;
> +		bias-disable;
> +		output-low;
> +	};
> +};

Recently it was adviced to remove output properties for gpio and
non-gpio functions.
For instance here: https://lore.kernel.org/linux-arm-msm/39ebaf4e-e91f-4568=
-8de6-9fc1f805a1e4@oss.qualcomm.com/

These output-low should be removed.

After that:

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>


> +&lpass_vamacro {
> +	pinctrl-0 =3D <&dmic01_default>, <&dmic23_default>;
> +	pinctrl-names =3D "default";
> +
> +	vdd-micb-supply =3D <&vreg_l1b_1p8>;
> +	qcom,dmic-sample-rate =3D <4800000>;
> +};
> +
>  &mdss {
>  	status =3D "okay";
>  };
> @@ -1067,6 +1144,68 @@ &smb2360_1_eusb2_repeater {
>  	vdd3-supply =3D <&vreg_l14b_3p0>;
>  };
> =20
> +&swr0 {
> +	status =3D "okay";
> +
> +	pinctrl-0 =3D <&wsa_swr_active>, <&spkr_01_sd_n_active>;
> +	pinctrl-names =3D "default";
> +
> +	/* WSA8845, Left Woofer */
> +	left_woofer: speaker@0,0 {
> +		compatible =3D "sdw20217020400";
> +		reg =3D <0 0>;
> +		reset-gpios =3D <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "WooferLeft";
> +		vdd-1p8-supply =3D <&vreg_l15b_1p8>;
> +		vdd-io-supply =3D <&vreg_l12b_1p2>;
> +		qcom,port-mapping =3D <1 2 3 7 10 13>;
> +	};
> +
> +	/* WSA8845, Left Tweeter */
> +	left_tweeter: speaker@0,1 {
> +		compatible =3D "sdw20217020400";
> +		reg =3D <0 1>;
> +		reset-gpios =3D <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "TweeterLeft";
> +		vdd-1p8-supply =3D <&vreg_l15b_1p8>;
> +		vdd-io-supply =3D <&vreg_l12b_1p2>;
> +		qcom,port-mapping =3D <4 5 6 7 11 13>;
> +	};
> +};
> +
> +&swr3 {
> +	status =3D "okay";
> +
> +	pinctrl-0 =3D <&wsa2_swr_active>, <&spkr_23_sd_n_active>;
> +	pinctrl-names =3D "default";
> +
> +	/* WSA8845, Right Woofer */
> +	right_woofer: speaker@0,0 {
> +		compatible =3D "sdw20217020400";
> +		reg =3D <0 0>;
> +		reset-gpios =3D <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "WooferRight";
> +		vdd-1p8-supply =3D <&vreg_l15b_1p8>;
> +		vdd-io-supply =3D <&vreg_l12b_1p2>;
> +		qcom,port-mapping =3D <1 2 3 7 10 13>;
> +	};
> +
> +	/* WSA8845, Right Tweeter */
> +	right_tweeter: speaker@0,1 {
> +		compatible =3D "sdw20217020400";
> +		reg =3D <0 1>;
> +		reset-gpios =3D <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells =3D <0>;
> +		sound-name-prefix =3D "TweeterRight";
> +		vdd-1p8-supply =3D <&vreg_l15b_1p8>;
> +		vdd-io-supply =3D <&vreg_l12b_1p2>;
> +		qcom,port-mapping =3D <4 5 6 7 11 13>;
> +	};
> +};
> +
>  &tlmm {
>  	gpio-reserved-ranges =3D <44 4>,  /* SPI11 (TPM) */
>  			       <76 4>,  /* SPI19 (TZ Protected) */


