Return-Path: <linux-arm-msm+bounces-52875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F08A765B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 14:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 763D83A9C1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 12:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB92D1E3769;
	Mon, 31 Mar 2025 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="wpi7o1UZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0E71E5207
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 12:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743423611; cv=none; b=k+EvyhsAbwgS5IyHVItt/IW3KwVpY03WMttVb/WJwQy+CIUpi84CK32SH9xWuF8yhUHj7PAfS3IoQ9SflNjTyxMQHrvclZj/UWR3YJyOq4jlsvrF/GheXgc8TGFHtB6H5fkoUz8Ucun3U902EqCxHps5q9F3crqtQUEFoKDjsg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743423611; c=relaxed/simple;
	bh=V+HIpf0XYtcXMdWG8h49zKmgGkavahAxXenAd7JQ9oo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=sR33syoaRQ5uuTyoPb/n1uXcEBTiHvgl45yEDHuUV1DPCczOlq3nwcgad4acRqXyiYCJ2krMDTuHMCWoIV7q/7aeGb/wBxSKOAYZ5YAlI0zWxwBYOgpYl1V0uh9kPo9nOq4wPZWsKMwRdyrCtm1JJiPtX97eE1pkgRLYN01e+vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=wpi7o1UZ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac298c8fa50so740958566b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 05:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1743423608; x=1744028408; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6UhGoeHcC4SZvbq63mZ678Tm+9OYBR5DKjiDwyXcqg=;
        b=wpi7o1UZcdhdWgMCCybT15uAxIqlic0xih88C4WGx7ZkKBwBnsRi+FNJlDJi8lcT8U
         k4wzdJJ1HvFBurnjCffwrmi16U4kaJgsggdQ7m/o4AjpskWLMKTlGerW57oQyo/TSPFp
         KTWNFwAH8FO2cLXmdyZa511Bjg/dV9LR3hbUR6TDuodXpD+0hbcJ9hIuI6T/+0rsvV84
         rGvjvzgVf2+Dx9ZFTAdqQrcU6QPe4INPEqP4aPUWJ3GOeU5hLL7+4sK55L44YtVEbd23
         LOAdTfSGBWGQwDsHHo1LUp0vGMwUZRiBmZ7bujwVzZvBShiGtjz+bW4SRckStfD6I0Vt
         fiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743423608; x=1744028408;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/6UhGoeHcC4SZvbq63mZ678Tm+9OYBR5DKjiDwyXcqg=;
        b=Z8mBQ2Huj6bRDn/uTfRN9C4c9hqV3Cp7uOomiLt/F9kL1JkunY70ildCONtZ+4CsSk
         NA/juUnSpGyMP9s0nRpur00wk3sXV5umDsvlXGJYCTpi6Xwiyrm9Kh+fNEvupjdPzFZx
         J9LDfp7rluhVDAu+OUIF1mXEwVZ/M3Ip1wY1NaIDPM6ZNo/6+m9r451EaZsedrBcGk2Y
         ThUvvKAdK4qkEsNtEcQVws0sHRR6UVmESznNOdIuZp7yyxkrDw57YX4ZqQeyVxQ8UymI
         5g27Zbj73nvzO9WcMPRq9gUjuGz2PnrgRWyOBYiYbxx9lGGyKftfWHVQ+0JHuA11u8P0
         1LHA==
X-Forwarded-Encrypted: i=1; AJvYcCVW1Lo9GPMp3Mre41kCOr1CCDNMSGrlGRfUTIHCZE98f7mHhQ0mdtNwCJr3NLAR3wEhTGCCtE4QE5xoWTPC@vger.kernel.org
X-Gm-Message-State: AOJu0YwhXeIIGgfqDoiL+P3Vxg+LAwVxMz5fcqILNi+31P3Df8ykNH7J
	yFYVEWSZy9J3zFkgPa2/Wz+JgzO3Z6thZdLEdHD857oTK4dCxa9IAlWKbsCrrgk=
X-Gm-Gg: ASbGncs9wIcIBllQ2gqFX1SoNQFLcW6bZPtH9TrC8FS0b7xQ+PeTQ7lbGLklWs/gpBa
	njvZdAq1L+kluypVyaFShU7aBY2tth2rkam80chL4fkpmuboP7guNwAjOj81t/dKbpZgWwMe5wQ
	L3O5C070OJvdin+rzH3j8PeSB/l6S5le2yR/pJhV+Zi04PcgwG9QjP5vz7r7fmJMyoPZTfx5Dt4
	izCLI6aT/quSn+aouWA1n7wecACM4jzhrUAYQJhKcjdvd+94b5mc8eSHopnqbPeVU0rrypfnM0b
	+l4kV/aB+37i1qPopeuy/sC7vZBilQ+QWrM8qVaZjZfQff/NMHjLyc9TG2C11qHeYMPGydxxEn8
	t+LnEGV+zBUKir8WDAccNFMEvWBoFwg/fluno8JNP58fmzuvU1WuTxsKV
X-Google-Smtp-Source: AGHT+IHTeHXgzQx9nBe7ZuxYvDPZW6eexOSde6sU5uGzolFYjQErhchMnqWKKOUDN7l4/orwes2PJg==
X-Received: by 2002:a17:907:3d89:b0:ac3:4373:e8bf with SMTP id a640c23a62f3a-ac738932d65mr708179066b.10.1743423607866;
        Mon, 31 Mar 2025 05:20:07 -0700 (PDT)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71967fdc6sm609704066b.127.2025.03.31.05.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 05:20:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Mar 2025 14:20:06 +0200
Message-Id: <D8UG37Z20WLF.1EH3L1KZTJKO8@fairphone.com>
To: "Caleb Connolly" <caleb.connolly@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>
Cc: <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: align gpio-keys label format
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250331121011.385250-1-caleb.connolly@linaro.org>
In-Reply-To: <20250331121011.385250-1-caleb.connolly@linaro.org>

On Mon Mar 31, 2025 at 2:10 PM CEST, Caleb Connolly wrote:
> Most devices follow the practise of capitilising all words in a label,
> this seems to be the standard elsewhere too (e.g. run "evtest" on an x86
> ThinkPad).
>
> Adjust the stragglers to follow suite, and standardise on "Volume
> Buttons" over "Volume keys" as the label for the entire device where
> applicable.

In theory some weird user space could find the correct input node based
on that label, which would 'break' if we change that label?

Not that anyone should really do this I believe, checking the supported
keys on a device is a much better solution.

But good to keep in mind.

>
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>
> This is really a drop in the ocean, a good next step would be to fix the
> pm8941-pwrkey driver so your power button doesn't show up as
> "pm8941_pwrkey".

"Power Button" would be good there, that's what my Intel Dell XPS 15 report=
s.

> ---
>  arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi | 4 ++--
>  arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts    | 6 +++---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts   | 2 +-
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts     | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi       | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi  | 6 +++---
>  arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 +-
>  7 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi b/arch/=
arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
> index e6a69d942a4a..452c455294d0 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
> @@ -90,17 +90,17 @@ gpio-keys {
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&vol_keys_default>;
> =20
>  		button-vol-down {
> -			label =3D "Volume down";
> +			label =3D "Volume Down";
>  			gpios =3D <&pm8998_gpios 5 GPIO_ACTIVE_LOW>;
>  			linux,code =3D <KEY_VOLUMEDOWN>;
>  			debounce-interval =3D <15>;
>  			wakeup-source;
>  		};
> =20
>  		button-vol-up {
> -			label =3D "Volume up";
> +			label =3D "Volume Up";
>  			gpios =3D <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
>  			linux,code =3D <KEY_VOLUMEUP>;
>  			debounce-interval =3D <15>;
>  			wakeup-source;
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts b/arch/arm=
64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
> index 0cac06f25a77..2a62d58195fd 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
> @@ -124,16 +124,16 @@ zap_shader_region: memory@f7900000 {
>  	};
> =20
>  	gpio-keys {
>  		compatible =3D "gpio-keys";
> -		label =3D "Volume buttons";
> +		label =3D "Volume Up";

Not sure where the label from this wrapping node would show up, but you
maybe want to keep this one as "Volume Buttons", like in some of the
other files?

Regards
Luca

