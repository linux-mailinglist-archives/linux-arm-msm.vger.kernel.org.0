Return-Path: <linux-arm-msm+bounces-7010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 128FF82A9BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 09:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8363285F54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 08:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38519125D5;
	Thu, 11 Jan 2024 08:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Bw8R10uo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB37125D2
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 08:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-5589cfe4b88so360347a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 00:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1704963197; x=1705567997; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fdzAkRigLOJSs0p8z2FKeIqZxw3OTVE9TPYi8cJXf8=;
        b=Bw8R10uoKP0KsSytiLAWl40hOI9Xxx83fcBSz7qPsGhOQoHG+/MBQxnn90qal8qACj
         qDxyuoFYJbKTQNylg458HDCQE8WtnOmZ7yi2nG77XkH896e4EafU6Vwztm0W+g/vDdrz
         r91l37gL+gXuE533w7Pr6S23HcldMz7J5X1GawX+Fhefpfa65qkRax6rHgyWwE4mjMdX
         fJt9L9ghzzfWvo8o7zM/3aCtKfu/5hWaKMHJyjiPU99jgNs3Iy++EkTgodt/QrcrzUbL
         /XgrAU54imWmtXyrP6Z18HXpnLzOjIC9LMCW02rs/HBXAnHaxMWN7k+D9ljOikHtPXqI
         ONrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704963197; x=1705567997;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8fdzAkRigLOJSs0p8z2FKeIqZxw3OTVE9TPYi8cJXf8=;
        b=emTT8bFAU2sNgj0xaOlxi7TuqiBKDgIXJdMyibjvvfMR/AKYe/EodgX6nwJvgF2o5M
         3Z30DyZ3Io2xWf9R5gAl2ynNhRF/fqXOuhgteLyW8/2/zrn/W2EzCFIL+BJHHQJMjezs
         giHxocqWQo52pNN15A2/O+5Fkn2HjfQGoz4pf84iKwiE+g1gh7Cv6sIJyZ8TtDIQi3gy
         7tHSowa70K/bbnyLNf43votuOZOAg8rNg4NbBSzOe+FPUwYWNpz70o7KQNmktuoDRZqr
         9K4Jsnp5ypuhpW8Y5y/l4MKDML9wnfbOGrUTPbJrt5gHsqcEyfqTunLA6cclkNz7f/m9
         AA4w==
X-Gm-Message-State: AOJu0Yx8GknnJVa5oFKC61DL762IkSrh5unmtYrAFAVlvImOwgZXqNnb
	EOZmroYWc4yi2ujkPq9zXCl4p2CNECdg85P/IhzqM5R4QPIf7koE
X-Google-Smtp-Source: AGHT+IFq5ynQNEJVSXgc5jOV5wTNN9Vjm/J5WWKvAdAgAN+RMQzy+62aeC55Dtrg2J/oQzlpesDVgA==
X-Received: by 2002:a17:906:17c4:b0:a28:d427:3959 with SMTP id u4-20020a17090617c400b00a28d4273959mr397730eje.62.1704962870935;
        Thu, 11 Jan 2024 00:47:50 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id rv4-20020a17090710c400b00a26e490e3f2sm305391ejb.181.2024.01.11.00.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 00:47:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jan 2024 09:47:49 +0100
Message-Id: <CYBQW9KRHVJS.3UOHTOMRWDWVK@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND v3] arm64: dts: qcom: qcs6490-idp: Add definition
 for three LEDs.
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <quic_huliu@quicinc.com>, "Andy Gross" <agross@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>
X-Mailer: aerc 0.15.2
References: <20240111-lpg-v3-1-811c9e82dae4@quicinc.com>
In-Reply-To: <20240111-lpg-v3-1-811c9e82dae4@quicinc.com>

On Thu Jan 11, 2024 at 3:52 AM CET, Hui Liu via B4 Relay wrote:
> From: Hui Liu <quic_huliu@quicinc.com>
>
> Add definition for three LEDs to make sure they can
> be enabled base on QCOM LPG LED driver.
>
> Signed-off-by: Hui Liu <quic_huliu@quicinc.com>
> ---
> Changes in v3:
> - Rephrased commit text and updated the nodes to qcm6490-idp board file.
> - Link to v2: https://lore.kernel.org/all/20231110-qcom_leds-v2-1-3cad1fb=
bc65a@quicinc.com/
>
> Changes in v2:
> - Rephrased commit text and updated the nodes to board file.
> - Link to v1: https://lore.kernel.org/r/20231108-qcom_leds-v1-1-c3e1c8572=
cb0@quicinc.com
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/d=
ts/qcom/qcm6490-idp.dts
> index 37c91fdf3ab9..f801144a1556 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -5,6 +5,7 @@
> =20
>  /dts-v1/;
> =20
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sc7280.dtsi"
>  #include "pm7325.dtsi"
> @@ -414,6 +415,30 @@ vreg_bob_3p296: bob {
>  	};
>  };
> =20
> +&pm8350c_pwm {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	status =3D "okay";
> +
> +	led@1 {
> +		reg =3D <1>;

Hi Hui Liu,

> +		color =3D <LED_COLOR_ID_RED>;
> +		label =3D "red";

Please remove the deprecated "label" property. Since you already have
"color" set you only need to add "function". On phones for the
notification LED we usually use "function =3D LED_FUNCTION_STATUS;"

Also depends on what your hardware looks like, if it's 3 separate LEDs
then with label replaced it would be okay.
If the 3 LEDs are in one spot (so you can mix the colors with it), then
please make it a RGB multi-led like e.g. in sm8550-qrd.dts.

Regards
Luca

> +	};
> +
> +	led@2 {
> +		reg =3D <2>;
> +		color =3D <LED_COLOR_ID_GREEN>;
> +		label =3D "green";
> +	};
> +
> +	led@3 {
> +		reg =3D <3>;
> +		color =3D <LED_COLOR_ID_BLUE>;
> +		label =3D "blue";
> +	};
> +};
> +
>  &qupv3_id_0 {
>  	status =3D "okay";
>  };
>
> ---
> base-commit: 17cb8a20bde66a520a2ca7aad1063e1ce7382240
> change-id: 20231215-lpg-4aadd374811a
>
> Best regards,


