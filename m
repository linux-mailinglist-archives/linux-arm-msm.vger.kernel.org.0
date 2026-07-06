Return-Path: <linux-arm-msm+bounces-116674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pqQACNpdS2rVQAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:48:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A93670DC3C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:48:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b="2vF/aRvD";
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116674-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116674-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8781B31C15A5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BAFD38E113;
	Mon,  6 Jul 2026 07:19:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034F832B13C
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 07:19:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783322363; cv=none; b=rotgMGUh99RST9MfbxIoCDTv6+NxHoI8okGJUCtDKdbkgTNZJWC/G9a0TYI+zodkvWuecwl7ICXz+NKMM7oEmdbtR0pZpFsKMuM4rypsGWOmlH1SGhG6uDItqGW/2Y62W5Tt38f8E5GujSBL0TnixSKySGlkn6hLr8+Xp/zP2i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783322363; c=relaxed/simple;
	bh=BlUcClODoiV9G+AltRK0o9+/KQRHJksrWH+RzUGWiKs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SWWWqIxZbU/A33VEjp+Lgv48k4R4C3NNnVqx3OuJr7WHGKdlaP9MLTdsD7UZi6vPqyS9w4McQii+ap8SvKpzwYFinEOywp/mZ93cDKAfTpkU7JfmC4ZfU8FhnPL9c5Vn6sP/p+EbtdilLrXhTz0Sln63Wmk42Sz3R/LhskeW+5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2vF/aRvD; arc=none smtp.client-ip=209.85.218.52
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c12629c937eso306713266b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 00:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783322352; x=1783927152; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LmUXCOCPEQve7uQszqWLNxUchTVaCM6v+Ik51kX/11I=;
        b=2vF/aRvDo8KRuhYiyLQCjpiRY1qAB+5FRDz38i2lQy/fjorPUIVt3fcJLe7wFPc41a
         9uxk8zNGFlQqWiABYx79Ep2pLZju3EkhEaRJBKZdXBq74KSbnGyJDLOdBJuPP7RowDsR
         3nS6jO0uec9GaD/XXLu4cHDzRn2naDofBymW5CWtP2fvpV4AXcA/yoBV8xUT4g7StHld
         du+/iDdn1wTwG7+4b9v/seNXKuaGdu9q8wmFtNYMTLHQaaY6G86lD4WPbsx8+qdTa6aD
         JdHWtMXiUXrxCv+kzOtArnLE4m9EiX4pJSgEtvhvCtLTmX55KniwLh4peSjeBS58yLW/
         iFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783322352; x=1783927152;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LmUXCOCPEQve7uQszqWLNxUchTVaCM6v+Ik51kX/11I=;
        b=XqdY5Sz2AhClEf0860w54YgNQy8xwvfpvZSz09halpO5P8OxVzCiPJot8r8lu0wNb1
         BhZjDPMlpJjXFOwGE2+qapkmF7RZ4qHYZ7MW89bTrgnW1Q2Sk8MQjXhZtycfzezrTRt9
         KENMmMKsinYf3OpXa3XOiyxujmRJic/Gixp3w+4XjwztfxHVwIa4X6G2MwAovw2If76i
         pVv9yTb/QlVOgUvNz3lMqmWg6+w4G5cX6djPKq4djCAwl+4r7uvVCaLzA2jOoXQjzoJr
         tXcHk4+uvAPrXu7XcbI7mPD/N5sPTnygK2+j6fGMzHx9r9vPfPS4KZOBp9gXFzJlIhjf
         /uaQ==
X-Gm-Message-State: AOJu0YyIwihPMrgJMj16WQOasw+xg3RrOabriJasMqbx5Xb3TgagB9kQ
	PuZbpnHYu/Oj6grMdCW1jVtVRWbZZ7VwsfulxbR7hNOg1R129ehHuUWQBoXn7k7txN8=
X-Gm-Gg: AfdE7ckg8sq9uUm9Twly2RznpkLKwcvUYEgLo8J07Ddr/htvnarvc02oBPZ3dg8qN9m
	AjNwhyOlr4oKbBFGuZAxN9dyRrhFmfxdps3MOIV/95VnYud97gfZ/TKEyOKlUo8kEYnMwcl3LiO
	UOQrwqsZDSH+6Z6PeHrf2+JyVoxp0XnFzgVPjwprboMUNPhd/qO83xgN16mjm/NJqgrwJGcyDeJ
	DQxuiAtQxFlxT/MtqLt/i60/Mca/oPYBzDrgSqOphBKJYOf/Kt4DapS8mB/xmj4/poJGU3+InyF
	5u1lt9bWaxEyWNnZ+9TMyaOpTwfVGHM08ukHEyNQzwPhSbCIHojfYIE8Lp72YOPluYC0E3fFgVz
	6mUG3eNqDuzXA0106E4uH/+nbS3xCOPpzo6yC+Pm47AJtXO7aSxKWe+EhUOBiseKIr6HZtuQYS5
	tTf0oakFeS0VuGnMHqPl03jCU8N/PNV9flCizhbYPcvh9XjlQULzB/edFNkQ==
X-Received: by 2002:a17:907:3f9b:b0:c12:34ed:e0fe with SMTP id a640c23a62f3a-c12e6c0c080mr308164266b.60.1783322352134;
        Mon, 06 Jul 2026 00:19:12 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628d65dsm679184166b.35.2026.07.06.00.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 00:19:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 09:19:11 +0200
Message-Id: <DJRB0IFM6VRY.1H62MF66GWTN1@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Use hyphen in node names
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com> <20260706-dts-qcom-style-checker-v1-1-16ce82a2bcfd@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v1-1-16ce82a2bcfd@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116674-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fairphone.com:from_mime,fairphone.com:dkim,fairphone.com:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A93670DC3C

On Mon Jul 6, 2026 at 9:03 AM CEST, Krzysztof Kozlowski wrote:
> DTS coding style prefers hyphens instead of underscores in the node
> names.  Change should be safe, because node names are not considered an
> ABI.

Until Qualcomm decides they are ABI :(

>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi             | 2 +-
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi                  | 2 +-
>  arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts                 | 2 +-
>  arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso           | 2 +-
>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi          | 4 ++--
>  arch/arm64/boot/dts/qcom/lemans.dtsi                      | 2 +-
>  arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts      | 2 +-
>  arch/arm64/boot/dts/qcom/monaco.dtsi                      | 2 +-
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 8 ++++----
>  9 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi b/arch/arm/boo=
t/dts/qcom/qcom-apq8064-pins.dtsi
> index e53de709e9d1..e95da761234b 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
> @@ -87,7 +87,7 @@ gsbi7_uart_2pins: gsbi7-uart-2pins-state {
>  		function =3D "gsbi7";
>  	};
> =20
> -	gsbi7_uart_4pins: gsbi7_uart_4pins-state {
> +	gsbi7_uart_4pins: gsbi7-uart-4pins-state {
>  		pins =3D "gpio82", "gpio83", "gpio84", "gpio85";
>  		function =3D "gsbi7";
>  	};
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts=
/qcom/qcom-msm8974.dtsi
> index 95be1d2e214f..06c0af0aa317 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> @@ -1866,7 +1866,7 @@ cci_i2c1_sleep: cci-i2c1-sleep-pins {
>  				};
>  			};
> =20
> -			spi8_default: spi8_default-state {
> +			spi8_default: spi8-default-state {
>  				mosi-pins {
>  					pins =3D "gpio45";
>  					function =3D "blsp_spi8";
> diff --git a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts b/arch/arm/boot/dt=
s/qcom/qcom-sdx65-mtp.dts
> index 07c10c84eefa..2c0590617ac4 100644
> --- a/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts
> @@ -55,7 +55,7 @@ vph_pwr: vph-pwr-regulator {
>  		regulator-max-microvolt =3D <3700000>;
>  	};
> =20
> -	vreg_bob_3p3: pmx65_bob {
> +	vreg_bob_3p3: pmx65-bob-regulator {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vreg_bob_3p3";
>  		regulator-min-microvolt =3D <3300000>;
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso b/arch/arm64=
/boot/dts/qcom/lemans-evk-camera.dtso
> index 4600d5441cce..a4c6d39cf777 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
> @@ -14,7 +14,7 @@
>  #include <dt-bindings/gpio/gpio.h>
> =20
>  &{/} {
> -	vreg_cam1_1p8: vreg_cam1_1p8 {
> +	vreg_cam1_1p8: cam1-1p8-regulator {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vreg_cam1_1p8";
>  		startup-delay-us =3D <10000>;
> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm6=
4/boot/dts/qcom/lemans-ride-common.dtsi
> index 40f88498999b..cefb8ff00806 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> @@ -63,7 +63,7 @@ vreg_3p3: vreg-3p3-regulator {
>  		regulator-max-microvolt =3D <3300000>;
>  	};
> =20
> -	vreg_conn_1p8: vreg_conn_1p8 {
> +	vreg_conn_1p8: vreg-conn-1p8-regulator {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vreg_conn_1p8";
>  		startup-delay-us =3D <4000>;
> @@ -71,7 +71,7 @@ vreg_conn_1p8: vreg_conn_1p8 {
>  		gpio =3D <&pmm8654au_1_gpios 4 GPIO_ACTIVE_HIGH>;
>  	};
> =20
> -	vreg_conn_pa: vreg_conn_pa {
> +	vreg_conn_pa: vreg-conn-pa-regulator {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vreg_conn_pa";
>  		startup-delay-us =3D <4000>;
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/q=
com/lemans.dtsi
> index 353a6e6fd3ac..e5a57a340cd8 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -1041,7 +1041,7 @@ qfprom: efuse@784000 {
>  			#address-cells =3D <1>;
>  			#size-cells =3D <1>;
> =20
> -			gpu_speed_bin: gpu_speed_bin@240c {
> +			gpu_speed_bin: gpu-speed-bin@240c {
>  				reg =3D <0x240c 0x1>;
>  				bits =3D <0 8>;
>  			};
> diff --git a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts b/arch/=
arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> index 7393978926e4..0796d9dbe158 100644
> --- a/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
> @@ -136,7 +136,7 @@ ramoops@81f20000 {
>  		 * ABL is powering down display and controller if this node is
>  		 * not named exactly "splash_region".
>  		 */
> -		splash_region@e3940000 {
> +		splash@e3940000 {

Please read the comment above, newer ABLs explicitly check for
"splash_region" being present.

Regards
Luca

>  			reg =3D <0x0 0xe3940000 0x0 0x2b00000>;
>  			no-map;
>  		};
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/q=
com/monaco.dtsi
> index a350a8ba48fa..c50ce1843703 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -2927,7 +2927,7 @@ ws-pins {
>  				};
>  			};
> =20
> -			lpi_i2s4_active: lpi_i2s4-active-state {
> +			lpi_i2s4_active: lpi-i2s4-active-state {
>  				data0-pins {
>  					pins =3D "gpio17";
>  					function =3D "i2s4_data";
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/=
arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
> index 7eecd9dc3028..70c130c5426c 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
> @@ -46,22 +46,22 @@ framebuffer {
>  	};
> =20
>  	reserved-memory {
> -		adsp_pil_mem: adsp_pil_mem@55300000 {
> +		adsp_pil_mem: adsp-pil-mem@55300000 {
>  			reg =3D <0x0 0x55300000 0x0 0x2200000>;
>  			no-map;
>  		};
> =20
> -		ipa_fw_mem: ipa_fw_mem@57500000 {
> +		ipa_fw_mem: ipa-fw-mem@57500000 {
>  			reg =3D <0x0 0x57500000 0x0 0x10000>;
>  			no-map;
>  		};
> =20
> -		ipa_gsi_mem: ipa_gsi_mem@57510000 {
> +		ipa_gsi_mem: ipa-gsi-mem@57510000 {
>  			reg =3D <0x0 0x57510000 0x0 0x5000>;
>  			no-map;
>  		};
> =20
> -		gpu_mem: gpu_mem@57515000 {
> +		gpu_mem: gpu-mem@57515000 {
>  			reg =3D <0x0 0x57515000 0x0 0x2000>;
>  			no-map;
>  		};


