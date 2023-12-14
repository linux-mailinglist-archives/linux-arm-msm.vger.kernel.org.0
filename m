Return-Path: <linux-arm-msm+bounces-4846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D88C813D5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 23:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4FF6B21B66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 22:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2109F66AC5;
	Thu, 14 Dec 2023 22:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="neoCMENw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD02668B60
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 22:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a22f2a28c16so13948966b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Dec 2023 14:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702593476; x=1703198276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=82WlJRLjSGo/vPW0f6ZIe9xHewTxZnBuvNjtigfiQoc=;
        b=neoCMENwiva6jIDIQeZSXd59Q4Lp2bDBTXtljwfQBhaEi6qabFtnPDYRBUU3ipRYgR
         R7rlse6qn3U7/Gs2hCYwO5CEGdFYCE93dZIDZlRHYD5MdJwAjCeLVwB9Woqwod2WyRjy
         lwH2swLKpGSXOjItXtiTk3xettqXKJHDPNnhtbrwbUVqiorLzm3aEFktqGbCad3uFJyr
         jHqVBU8gQ9psViJeRezLNRoxpSkSiGCbJQp3srr8W1CvFmuOAeLZv+ixZF+AyYx1X+7L
         5597vsyDW/E2srINm77dITBjKWvKsl6sp5yXATXVy/nawLs+1gzAHm52CrXThOT7gkCk
         dAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702593476; x=1703198276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82WlJRLjSGo/vPW0f6ZIe9xHewTxZnBuvNjtigfiQoc=;
        b=M+04kMvg9FgckiIyohIBvVr166ryVinou3CvH3wccBHYjAmokkXQjP0FIFgp/K5y2X
         QShgOZyIhVacHGAba882iXrNBPfCXZkag+4Lpp0Lg26oZgGcNGV5nLfpYEeKtP+4tP8v
         qOJpTUE3Q5FgR1mPYmVCQYYETbRkFDKyLpItmUny1mBQpBR9xfQJ2iHLXmnSf1XMUkfm
         zuygeroP55WWQwhIKTOaXz6/kPUu31PWsUPWvCeHtlnpGW+4Ly/eCedSa5guOlKGz9uE
         cDpiRq+M1ob/U4X1585zmlD30Rd7r7VPMbjyRQMeyGtwzzeIUHqRq05GWQPIR2SBI+cn
         nwDw==
X-Gm-Message-State: AOJu0YyYmKSS+qt+9toAHtjGbqIuF++2bM58JS/0x/3Rl5Zcv5U6TLnr
	8cq2aRmqnYb/s6Zq6oCArCIKPg==
X-Google-Smtp-Source: AGHT+IFB9c8G3F6p8Djjw3isqnzw95yObhF11H6TdI+vXof5Qw9NTBybN7yB3FhOASkkyVChjmVMZQ==
X-Received: by 2002:a17:906:180f:b0:a1d:2e32:d28c with SMTP id v15-20020a170906180f00b00a1d2e32d28cmr2914094eje.146.1702593476544;
        Thu, 14 Dec 2023 14:37:56 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id vc11-20020a170907d08b00b00a1ce58e9fc7sm9927639ejc.64.2023.12.14.14.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 14:37:56 -0800 (PST)
Date: Fri, 15 Dec 2023 00:37:54 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: x1e80100: Add some issing nodes
 for CRD
Message-ID: <ZXuDwrtvhejz6of7@linaro.org>
References: <20231215-x1e80100-dts-missing-nodes-v2-0-5a6efc04d00c@linaro.org>
 <20231215-x1e80100-dts-missing-nodes-v2-2-5a6efc04d00c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215-x1e80100-dts-missing-nodes-v2-2-5a6efc04d00c@linaro.org>

On 23-12-15 00:35:38, Abel Vesa wrote:
> Enable touchscreen, touchpad, keyboard, display, pcie and usb
> and all related nodes.

Urgh, type in subject. I'll rephrase it anyway in the next version.

Please ignore this version.

> 
> Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Co-developed-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 221 ++++++++++++++++++++++++++++++
>  1 file changed, 221 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> index 7532d8eca2de..d44898453315 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> @@ -401,10 +401,144 @@ vreg_l3j_0p8: ldo3 {
>  	};
>  };
>  
> +&i2c0 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	touchpad@15 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x15>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tpad_default>;
> +
> +		wakeup-source;
> +	};
> +
> +	keyboard@3a {
> +		compatible = "hid-over-i2c";
> +		reg = <0x3a>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&kybd_default>;
> +		wakeup-source;
> +	};
> +};
> +
> +&i2c8 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	touchscreen@10 {
> +		compatible = "hid-over-i2c";
> +		reg = <0x10>;
> +
> +		hid-descr-addr = <0x1>;
> +		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ts0_default>;
> +	};
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp3 {
> +	compatible = "qcom,x1e80100-dp";
> +	/delete-property/ #sound-dai-cells;
> +
> +	data-lanes = <0 1 2 3>;
> +
> +	status = "okay";
> +
> +	aux-bus {
> +		panel {
> +			compatible = "edp-panel";
> +			power-supply = <&vreg_edp_3p3>;
> +
> +			port {
> +				edp_panel_in: endpoint {
> +					remote-endpoint = <&mdss_dp3_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	ports {
> +		port@1 {
> +			reg = <1>;
> +			mdss_dp3_out: endpoint {
> +				remote-endpoint = <&edp_panel_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dp3_phy {
> +	vdda-phy-supply = <&vreg_l3j_0p8>;
> +	vdda-pll-supply = <&vreg_l2j_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&pcie4 {
> +	status = "okay";
> +};
> +
> +&pcie4_phy {
> +	vdda-phy-supply = <&vreg_l3j_0p8>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&pcie6a {
> +	status = "okay";
> +};
> +
> +&pcie6a_phy {
> +	vdda-phy-supply = <&vreg_l3j_0p8>;
> +	vdda-pll-supply = <&vreg_l2j_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&qupv3_0 {
> +	status = "okay";
> +};
> +
> +&qupv3_1 {
> +	status = "okay";
> +};
> +
>  &qupv3_2 {
>  	status = "okay";
>  };
>  
> +&remoteproc_adsp {
> +	firmware-name = "qcom/x1e80100/adsp.mbn",
> +			"qcom/x1e80100/adsp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/x1e80100/cdsp.mbn",
> +			"qcom/x1e80100/cdsp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
>  &tlmm {
>  	gpio-reserved-ranges = <34 2>, /* Unused */
>  			       <44 4>, /* SPI (TPM) */
> @@ -416,9 +550,96 @@ edp_reg_en: edp-reg-en-state {
>  		drive-strength = <16>;
>  		bias-disable;
>  	};
> +
> +	kybd_default: kybd-default-state {
> +		pins = "gpio67";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
> +	tpad_default: tpad-default-state {
> +		pins = "gpio3";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
> +	ts0_default: ts0-default-state {
> +		int-n-pins {
> +			pins = "gpio51";
> +			function = "gpio";
> +			bias-disable;
> +		};
> +
> +		reset-n-pins {
> +			pins = "gpio48";
> +			function = "gpio";
> +			output-high;
> +			drive-strength = <16>;
> +		};
> +	};
>  };
>  
>  &uart21 {
>  	compatible = "qcom,geni-debug-uart";
>  	status = "okay";
>  };
> +
> +&usb_1_ss0_hsphy {
> +	vdd-supply = <&vreg_l2e_0p8>;
> +	vdda12-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss0_qmpphy {
> +	status = "okay";
> +};
> +
> +&usb_1_ss0 {
> +	status = "okay";
> +};
> +
> +&usb_1_ss0_dwc3 {
> +	dr_mode = "host";
> +	usb-role-switch;
> +};
> +
> +&usb_1_ss1_hsphy {
> +	vdd-supply = <&vreg_l2e_0p8>;
> +	vdda12-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss1_qmpphy {
> +	status = "okay";
> +};
> +
> +&usb_1_ss1 {
> +	status = "okay";
> +};
> +
> +&usb_1_ss1_dwc3 {
> +	dr_mode = "host";
> +	usb-role-switch;
> +};
> +
> +&usb_1_ss2_hsphy {
> +	vdd-supply = <&vreg_l2e_0p8>;
> +	vdda12-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss2_qmpphy {
> +	status = "okay";
> +};
> +
> +&usb_1_ss2 {
> +	status = "okay";
> +};
> +
> +&usb_1_ss2_dwc3 {
> +	dr_mode = "host";
> +	usb-role-switch;
> +};
> 
> -- 
> 2.34.1
> 

