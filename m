Return-Path: <linux-arm-msm+bounces-8036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFAD839A4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 21:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42F971F2372D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 20:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B97B2582;
	Tue, 23 Jan 2024 20:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ZFr6E67K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62805228
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 20:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706041952; cv=none; b=Xi+8p8u2929bPbQNJyPBG9SB6rRbiB4AJhMDZpF2uavbRLrmsytZrbJOvBO2dAuQWnsVzIYbTTVWIqqm207z3KlMYB+T2fRImO55Y5fsHJWXRWtmblJRHK/ntiLeV8/cs4FUnDFTYxfg34PSFQogt6WlhtAcPmdYl3mEqiLYsH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706041952; c=relaxed/simple;
	bh=4b7LDfndf0x2pfi/Wttei6CVEV5/thBW6qKKQoEYSGk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TUAHNYBLsw5I6yMFYNYMxAF2vAdFN6kP8hlR9j5wf0hQKUK0TFZEVhKXNF4Vm0cVY9XOOkXOVP/yQTEk0DgUIDTqEupJxsYhMuK4QZpgR3bwqXG23ICHqhag3komRNgDMM5t9/RULFQb/N5DBlEsz0MgyQODsuuGUY0nFnKZMTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ZFr6E67K; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a30f7c9574eso45319566b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 12:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1706041948; x=1706646748; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z20O7bYlmZHSvcuSYHlwtmasXHxMNJkIAnRQOpXMGzc=;
        b=ZFr6E67KPHvvq52Zw9LwxDn3ubsg4GWtJuZWrMsw5NqMzYhDh9RpXXfWePk4wkgRmH
         ekLWr6lwnuKJIt8cWd0u7dCKDfXvzOm4CMfyn+BL1pejBrWLJYWDr3BJ0wWS0v/rqct0
         hTbJOy4/bLCc5/UaVxs42X5wWi7H4+SusbIKmN0BRw5bwoUo76dIl4OxCQ0XXkJ1ycY8
         vOEE95m+CJOEJ1bm/dadizPfabo9xa5vw6ioMMhnM8oMIMRdCZ9lskxP62viesVBKDWE
         /MjnDwWiDIIFsJJkR8OS/9ZCpaU2RexsnFjZmVBo4g60NE3cS65Yyn84+PEb4d53ga+6
         lKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706041948; x=1706646748;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z20O7bYlmZHSvcuSYHlwtmasXHxMNJkIAnRQOpXMGzc=;
        b=afw7Wkdy8MEUyNqBppbsilwo9Bt1VwI//lGrWIw12qQos7qXytH93ZcUKW/CiN2Gqt
         3s4pftF3WrIfUXe+mI8sqYj9tY2YzCUFLbyLfgxkB+AhUpYLroeXZBJy/7pQbTCzgnpj
         zcAaaJ5M+Hoc1aA5yvITRHEY1cnUtkjYLvpetEiuR/ZGhROfOaAOPp6unq+Dj84fo8dr
         ElBP4D0Lce+gKYftLj+cotQcLDNfJyguWbUtLvb67nYWVpjc0B6uUuRCuucmK+TZB3fq
         x8NAIulqXVMcw0ug89+I86Z16fxQRcDxuPtoL020E787aipEGcLRmFNZkGeFhM/6xSO7
         xBIQ==
X-Gm-Message-State: AOJu0Yx0l/+9BprKU1B3zy5ITKVxVd+dCJgKmNhS7sGCUFnPZWdv2SzS
	i1B3YQvmQTLXdefCJCxYluTb5TBMU8w35WWB2kF8QkGqu6gwjEFIQ2Zh88Ptluk=
X-Google-Smtp-Source: AGHT+IEzedYGdRBr5+Ok9jU9hdAPP97DOkgzEJWvYf4nzAHEUTVNt7U9mR2OB283SD62pYYY2QK+AQ==
X-Received: by 2002:a17:906:5a4a:b0:a2c:1789:f7a3 with SMTP id my10-20020a1709065a4a00b00a2c1789f7a3mr138437ejc.79.1706041947921;
        Tue, 23 Jan 2024 12:32:27 -0800 (PST)
Received: from localhost (dhcp-089-099-055-216.chello.nl. [89.99.55.216])
        by smtp.gmail.com with ESMTPSA id q5-20020a170906388500b00a28a297d47esm14709048ejd.73.2024.01.23.12.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 12:32:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jan 2024 21:32:26 +0100
Message-Id: <CYMDEAJZ0TJK.K31XZB3E9QOG@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-phy@lists.infradead.org>
Subject: Re: [PATCH v2 15/15] arm64: dts: qcom: qrb4210-rb2: enable USB-C
 port handling
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Wesley Cheng" <quic_wcheng@quicinc.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Vinod Koul" <vkoul@kernel.org>, "Kishon
 Vijay Abraham I" <kishon@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>
X-Mailer: aerc 0.15.2
References: <20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org>
 <20240113-pmi632-typec-v2-15-182d9aa0a5b3@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v2-15-182d9aa0a5b3@linaro.org>

On Sat Jan 13, 2024 at 9:55 PM CET, Dmitry Baryshkov wrote:
> Plug in USB-C related bits and pieces to enable USB role switching and
> USB-C orientation handling for the Qualcomm RB2 board.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 50 ++++++++++++++++++++++++++=
++++++
>  arch/arm64/boot/dts/qcom/sm6115.dtsi     | 43 ++++++++++++++++++++++++++=
+
>  2 files changed, 93 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/d=
ts/qcom/qrb4210-rb2.dts
> index 52f31f3166c2..696d6d43c56b 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -6,8 +6,10 @@
>  /dts-v1/;
> =20
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/usb/pd.h>
>  #include "sm4250.dtsi"
>  #include "pm6125.dtsi"
> +#include "pmi632.dtsi"
> =20
>  / {
>  	model =3D "Qualcomm Technologies, Inc. QRB4210 RB2";
> @@ -256,6 +258,46 @@ kypd_vol_up_n: kypd-vol-up-n-state {
>  	};
>  };
> =20
> +&pmi632_typec {
> +	status =3D "okay";
> +
> +	connector {
> +		compatible =3D "usb-c-connector";
> +
> +		power-role =3D "dual";
> +		data-role =3D "dual";
> +		self-powered;
> +
> +		typec-power-opmode =3D "default";
> +		pd-disable;
> +
> +		ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0 {
> +				reg =3D <0>;
> +				pmi632_hs_in: endpoint {
> +					remote-endpoint =3D <&usb_dwc3_hs>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg =3D <1>;
> +				pmi632_ss_in: endpoint {
> +					remote-endpoint =3D <&usb_qmpphy_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&pmi632_vbus {
> +	regulator-min-microamp =3D <500000>;
> +	regulator-max-microamp =3D <3000000>;

Hi Dmitry,

Are you sure vbus can supply 3000mA?

In Qualcomm's document 80-PF208-77 I see 1000mA is the maximum it can
provide, and I see the same value looking into downstream smb5 driver
in sdm632 sources.

https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-4.9/+/r=
efs/heads/int/13/fp3/drivers/power/supply/qcom/qpnp-smb5.c#414

Regards
Luca

> +	status =3D "okay";
> +};
> +
>  &pon_pwrkey {
>  	status =3D "okay";
>  };
> @@ -607,6 +649,10 @@ &usb {
>  	status =3D "okay";
>  };
> =20
> +&usb_dwc3_hs {
> +	remote-endpoint =3D <&pmi632_hs_in>;
> +};
> +
>  &usb_hsphy {
>  	vdd-supply =3D <&vreg_l4a_0p9>;
>  	vdda-pll-supply =3D <&vreg_l12a_1p8>;
> @@ -622,6 +668,10 @@ &usb_qmpphy {
>  	status =3D "okay";
>  };
> =20
> +&usb_qmpphy_out {
> +	remote-endpoint =3D <&pmi632_ss_in>;
> +};
> +
>  &wifi {
>  	vdd-0.8-cx-mx-supply =3D <&vreg_l8a_0p664>;
>  	vdd-1.8-xo-supply =3D <&vreg_l16a_1p3>;
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/q=
com/sm6115.dtsi
> index 76c429e8ebab..01dff6641280 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -878,8 +878,29 @@ usb_qmpphy: phy@1615000 {
>  			clock-output-names =3D "usb3_phy_pipe_clk_src";
> =20
>  			#phy-cells =3D <0>;
> +			orientation-switch;
> =20
>  			status =3D "disabled";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				port@0 {
> +					reg =3D <0>;
> +
> +					usb_qmpphy_out: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg =3D <1>;
> +
> +					usb_qmpphy_usb_ss_in: endpoint {
> +						remote-endpoint =3D <&usb_dwc3_ss>;
> +					};
> +				};
> +			};
>  		};
> =20
>  		system_noc: interconnect@1880000 {
> @@ -1614,6 +1635,28 @@ usb_dwc3: usb@4e00000 {
>  				snps,has-lpm-erratum;
>  				snps,hird-threshold =3D /bits/ 8 <0x10>;
>  				snps,usb3_lpm_capable;
> +
> +				usb-role-switch;
> +
> +				ports {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +
> +					port@0 {
> +						reg =3D <0>;
> +
> +						usb_dwc3_hs: endpoint {
> +						};
> +					};
> +
> +					port@1 {
> +						reg =3D <1>;
> +
> +						usb_dwc3_ss: endpoint {
> +							remote-endpoint =3D <&usb_qmpphy_usb_ss_in>;
> +						};
> +					};
> +				};
>  			};
>  		};
> =20


