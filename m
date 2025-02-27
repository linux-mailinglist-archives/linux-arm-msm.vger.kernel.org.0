Return-Path: <linux-arm-msm+bounces-49613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF23A47475
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDD9A188C200
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3771D79A5;
	Thu, 27 Feb 2025 04:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m0rimY+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282522EAE4
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740630625; cv=none; b=VrZXZr2fw01khKA03K1pWnmbYbkZappHGAq463qIkZIhsrZpBzrvQJZ7pL3GdiQj1TAywzlI6ni1dS1Xf3dcSN2fwEhPiBrAyOF4UCjvFITC0JnFUwHtv3HLd4itMpJBN8iXDSuX3yt2tR3c4O2j1gSowDBebDDgby73op7aGaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740630625; c=relaxed/simple;
	bh=K5Ig3YWAa+ZrYmIukjgNYwh4zK1sumsgYolE4PtduI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvAD2HW/44eO+vKr6JOU1rXRMkFpzn21y//xSlfeNIlkadAHdyoHul8XxpU5G11E4qtvS/Rh7PnM757Ased/+LGH4ZlE6moAz/IoNTEll7xOVu1LvUAe8X7GCY3FdIEhsBs7z72l76nCyF990sfTNHJiHt9J/4k2Mici1x7oOxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m0rimY+x; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5461dab4bfdso525445e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 20:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740630621; x=1741235421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6xImYWDi5dHhhhMYMyVIYxjxB6DJ6bmImK4QBDVtyf4=;
        b=m0rimY+xPxa6Rt9eD08HgZpGg8Ufd978jWDP7E4h4nx7POfHYrERe9sZxNsD5bgi13
         dNOFSqkegTp7FG3APXGDW2G9HHtfP0kENY4g16xAEPeATEwh8YO+a4dVt3oLmlAsUNSe
         XNUdcnlwvGOy54bDCdhB0t66SgmDVGI4whLN0gmset1MmCqOj1m2iDaqlKQp6Yw3XWp3
         NfpWrjqL7/iZhZfoqb1r3giKn7iZaO0Poj5BDDCrOOGIe985ink4dZzQVziwA4rv4I2g
         OnijiDfD7bcurP/pl47Yp35iQi4J83i7HPSOqxeLhfX6/sNPNW+CJ97MFS1lKhc9kwBF
         1tiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740630621; x=1741235421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xImYWDi5dHhhhMYMyVIYxjxB6DJ6bmImK4QBDVtyf4=;
        b=gQ/qCkogSS2L9nWml9v/UIhDD/uBmVAWX9AFzH6p39EvC/7oPYPEO6QbGx/zkuuvMt
         eMnfPX6Ti4q6u/j35aEZaFopc2w1ikE5hFLSUS1IkhKKLoVbc4AlzJLr9+3ZfZaU4fGs
         vjlLnszWgJjAkEByCvbqw8+Sx9AlfyteVaXb3vrumlGCTlsr5eeF+JP+bxPhL+QKM2rM
         lw4m4m/Uk+dvEGXXLFT79mng5DJD1urfUbwXYcJLSB8N52qS9niVsLUTifkfXWnpr5Wx
         PEC1PP588ruILbHEKTK/eh7u7gWCzOIJ3n+tfT5DhMw9EBAog2mk4S95AQwGzq9F238t
         3pZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSiWMAZIk3IzylspgRs98xXCexHSbyK2P1nWDLLCGvCvcCfSqz35S8wxpHV8dwzIGorzdWkb3VJd6u8oih@vger.kernel.org
X-Gm-Message-State: AOJu0YyO0b3R3Nt8a5xk8QHexjeBh9HHyvHPE0lwNX1WtOuIADtj3jFW
	o9Fq25ry9DRRnUAVYFsAq1NtNj1Fpcb6RyYySyUWkf7hyGZGjSgIzhcNY86CAtM=
X-Gm-Gg: ASbGnctJNJwYNqFcbdyITnz29Lm7s8PVdRqNpdSmS6TKBbB5vLn503bXk6hOX3QCSaF
	1VLwQYr/8Z72sHKIvoSJKQcEY8zdzXcPCds/S7AzNjYZq6IHMFVgobEKNZw4NITBhQHQ0mRVgGH
	MQ4CWTy+20sJJEzmAlVQR00vrEpeeRPAjM5rFv0KoSw6q2iBZrxqEs37DEnTsObGasZTJEj0R5i
	zQgjupGF4e1WEWruBZ5kkjAIvqk5w7fBmg9DDn7cqFOlpH23pBXsBZeJzCO2zVRG/F7Usw0Ar07
	SrkNuOiDTmuxAH7jrYcnXAUMfPbJnhYdmaGofmkPRLKhhbDM9zFFkLhm2vxESimm9dRPeQYHAKM
	DCE45lA==
X-Google-Smtp-Source: AGHT+IGL7HDk5Dk+8hhQWHKYR6eLK127rmTECoFhOD2p60rLksOSOUqbp9cBZQmHY4NpEr7VKXUNsg==
X-Received: by 2002:a05:6512:ea1:b0:545:2c25:44e6 with SMTP id 2adb3069b0e04-54838ef5865mr10147861e87.25.1740630621185;
        Wed, 26 Feb 2025 20:30:21 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443cd06fsm60825e87.228.2025.02.26.20.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:30:19 -0800 (PST)
Date: Thu, 27 Feb 2025 06:30:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up
 DisplayPort over USB-C
Message-ID: <it5pyziyolnzjlfzfcvugiupauf6vqrbes4kdjpae2edgoc2pc@zr3d4iqczuvc>
References: <20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com>
 <20250226-fp5-pmic-glink-dp-v1-3-e6661d38652c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226-fp5-pmic-glink-dp-v1-3-e6661d38652c@fairphone.com>

On Wed, Feb 26, 2025 at 03:10:20PM +0100, Luca Weiss wrote:
> Extend the USB graph to connect the OCP96011 switch, the PTN36502
> redriver, the USB controllers and the MDSS, so that DisplayPort over
> USB-C is working.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 67 +++++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |  2 +
>  2 files changed, 67 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index b3fc37dba51523ce5678ae6d73f7d835f8b26d9e..1e04c7ec7163538d93543f36094203e58212f600 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -101,7 +101,15 @@ port@1 {
>  					reg = <1>;
>  
>  					pmic_glink_ss_in: endpoint {
> -						remote-endpoint = <&usb_1_dwc3_ss>;
> +						remote-endpoint = <&redriver_ss_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_sbu: endpoint {
> +						remote-endpoint = <&ocp96011_sbu_mux>;
>  					};
>  				};
>  			};
> @@ -758,6 +766,16 @@ typec-mux@42 {
>  		interrupts-extended = <&tlmm 7 IRQ_TYPE_LEVEL_LOW>;
>  
>  		vcc-supply = <&vreg_bob>;
> +
> +		mode-switch;
> +		orientation-switch;

Should be a part of the previous patch.

> +
> +		port {
> +			ocp96011_sbu_mux: endpoint {
> +				remote-endpoint = <&pmic_glink_sbu>;
> +				data-lanes = <1 0>;
> +			};
> +		};
>  	};
>  
>  	/* AW86927FCR haptics @ 5a */
> @@ -778,6 +796,30 @@ typec-mux@1a {
>  		reg = <0x1a>;
>  
>  		vdd18-supply = <&vreg_usb_redrive_1v8>;
> +
> +		retimer-switch;
> +		orientation-switch;

Should be a part of the previous patch.

> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				redriver_ss_out: endpoint {
> +					remote-endpoint = <&pmic_glink_ss_in>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				redriver_ss_in: endpoint {
> +					remote-endpoint = <&usb_dp_qmpphy_out>;
> +				};
> +			};
> +		};
>  	};
>  };
>  
> @@ -799,6 +841,15 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dp {
> +	status = "okay";
> +};
> +
> +&mdss_dp_out {
> +	data-lanes = <0 1>;
> +	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
> +};
> +
>  &mdss_dsi {
>  	vdda-supply = <&vreg_l6b>;
>  	status = "okay";
> @@ -1297,7 +1348,7 @@ &usb_1_dwc3_hs {
>  };
>  
>  &usb_1_dwc3_ss {
> -	remote-endpoint = <&pmic_glink_ss_in>;
> +	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
>  };
>  
>  &usb_1_hsphy {
> @@ -1326,6 +1377,18 @@ &usb_1_qmpphy {
>  	status = "okay";
>  };
>  
> +&usb_dp_qmpphy_dp_in {
> +	remote-endpoint = <&mdss_dp_out>;
> +};

I think this one is static, plese push it to the SoC dtsi.

> +
> +&usb_dp_qmpphy_out {
> +	remote-endpoint = <&redriver_ss_in>;
> +};
> +
> +&usb_dp_qmpphy_usb_ss_in {
> +	remote-endpoint = <&usb_1_dwc3_ss>;
> +};

And this one too.

> +
>  &venus {
>  	firmware-name = "qcom/qcm6490/fairphone5/venus.mbn";
>  	status = "okay";
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 0f2caf36910b65c398c9e03800a8ce0a8a1f8fc7..4880d26e745566fa7ef906a0489e3772f2426ab6 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3639,6 +3639,8 @@ usb_1_qmpphy: phy@88e8000 {
>  			#clock-cells = <1>;
>  			#phy-cells = <1>;
>  
> +			orientation-switch;
> +
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

