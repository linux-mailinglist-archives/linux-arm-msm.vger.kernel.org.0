Return-Path: <linux-arm-msm+bounces-65508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88696B09184
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 18:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 258A91890F8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 16:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF3A2FA63D;
	Thu, 17 Jul 2025 16:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YFzuQ4w2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7021F5413
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 16:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752768891; cv=none; b=HsMKYKKrkLvz3okVqD2J2XtfoRdB/oLAXaE4QYGKZAJIU+09FFKscbnz392zIktYzUPExtuvoEiZhYn+I2RKe337uoq0gRsyLQ9eWT+VVvop9uj/JOLgG9g4RVA624Ib0klM0a5iptVNmkQ4HCSStuvJRTwkstXKR1zXL0uUgFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752768891; c=relaxed/simple;
	bh=vnrfW7MDEtPXiQ+PeefY1maBKqzCBMejc315uPOTQ/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JXwxmNl+zBgeNYsI6doNPTil1BYrFtyUIX2fd5nRGcMhRhYAmvwVWDNgiktkcaJPSZ+W7b7NhwDJi/nhY3ckH1ju4TWVOLQrfATP4m3hTcGBoFVzWdfIZt8vNh6VVVmeSvMxnPUTUbloEZJDhmPAxYwQNMExjFiakX06z7jGuzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YFzuQ4w2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45555e3317aso7290525e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 09:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752768887; x=1753373687; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XLAwLeBG8xp4dc08BrzRdbHpWuQPpe2nJ16RFlGB0IQ=;
        b=YFzuQ4w2OoglQFYkCU/YjBjgUrsfkIHHBeozkhDB0IoMkr9vvMauERIWtb5tJrPKNl
         Gri/Z4WkGbJf/CfVEwd+6JsFxL/+uOhqxuwcErzq2UqAP5RJMH+UB39rZ2RMLvF8xz+F
         1TZvEuH6FcpeHuIgqRN+AhtALm07OrvQ2NAnrUCZ6wzUeyfPztI7O5S0fgnqSvxWRPy9
         kgIW4qjPZ5mWCw9YQCkYtE2UF1yEySAX+fSNVJ6uH0fRjtoN8vobU2Qzi8kkl7SxrBOk
         UekQqdzYxjJM5wZd2YMDAX8fAsOXch49yGh7qzAUUtJAy6byaeLEl8xQxcpD3qtzFN/A
         YqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752768887; x=1753373687;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XLAwLeBG8xp4dc08BrzRdbHpWuQPpe2nJ16RFlGB0IQ=;
        b=KmaAr8r14BR7ooyOuKFxsujkYmHLe72bfl3a4w++nzcPXXHkX81g3cC7e4OP0O/+TY
         gC7xAUYZN9X4dEGiRO9rBzt4tzu29QJwFzZ1JT00QJljiR8zrwZIzMpx9h69CNdWEpBu
         WZktGn4oqt51B6YJtcsetUA5rgmNQB+3F+f28LwD0+iqlPOYemUs3FdtUC/cqZhp5Bjr
         yZh+eyBwsnI1sxQSCx+uDFuRko8fsj8PGqMwWF/lWJBWtbxVLp/Ofnwr7Dz7yeDxoR5L
         4u/f1gxkjgF9f05fars4qdbcd1+YMrT92lk4lN08jr69bTe8HMe9yPGDOABfvxTVarjt
         CEhw==
X-Forwarded-Encrypted: i=1; AJvYcCX4+R50ZjiyrJDCXyvcoW7F/NQxqcFdqcYRdmgLW//e8Q7hCDSo4y92FreBOv7hN7CyqByknOLmplu3CzRs@vger.kernel.org
X-Gm-Message-State: AOJu0YwpXvI5n7Gz63pX5saUArotftV1q38j0LlV05gaDvBsX13uZuAw
	pgd/ZCFxHsZ4lnGBcKZSaQjXTVSXFRYmT7pYaJKJpJ8Rx7XFk8uqO6oPtfhgumxWERA=
X-Gm-Gg: ASbGncu6GJlHnvtf5oQqBDdslFOi/XGUHlggZt1dkPFeBzC3louAhdYubg+6TPid6cC
	2JwXNmoEzsDMoaywysc2tbjS7id6AitgrH56LI7oRgFZUgPiyc6bVzFv1oYA9EsVfC+uRdmAXfY
	/yOWwOGYLRr6f7LPYBS+9XSu9xw2YhYy14M8gf8YHy1prUERD+kJhDLpKObzBciWBJdRTVYpsHU
	EsZWd8p0mKVVrC4QX08P4dgTOkWNxOzmqLcb939P/VQCXvkHI5a/wVJh09nSBrArVL6rMzMwgvL
	L2B2KjyUaf43flYPQ7a7f4ZtRSriwPllYgBZaKJuWwJ2p6I6iXJ3DLLl2hQCEOXLuDhu/C+bs67
	I/HkMq7uCLXSi8LF1yxUgAsM/U2POP8jeRw==
X-Google-Smtp-Source: AGHT+IG8X08yDtcJjXlqFt3MzTuc0Qxi/sS6hoizIgQ85eHNFJWG4UtueCANjketu6w7VGqk5gFBWw==
X-Received: by 2002:a05:600c:314f:b0:450:d3b9:4ba4 with SMTP id 5b1f17b1804b1-4562e34ad97mr80610545e9.2.1752768886828;
        Thu, 17 Jul 2025 09:14:46 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:79a0:386f:8c5a:9506])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45634f4c546sm27013375e9.7.2025.07.17.09.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 09:14:46 -0700 (PDT)
Date: Thu, 17 Jul 2025 18:14:41 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
Message-ID: <aHkhcUVBnrwadKfa@linaro.org>
References: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
 <20250716-hamoa_initial-v1-3-f6f5d0f9a163@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716-hamoa_initial-v1-3-f6f5d0f9a163@oss.qualcomm.com>

On Wed, Jul 16, 2025 at 05:08:41PM +0800, Yijie Yang wrote:
> The HAMOA-IOT-SOM is a compact computing module that integrates a System
> on Chip (SoC) — specifically the x1e80100 — along with essential
> components optimized for IoT applications. It is designed to be mounted on
> carrier boards, enabling the development of complete embedded systems.
> 
> This change enables and overlays the following components:
> - Regulators on the SOM
> - Reserved memory regions
> - PCIe6a and its PHY
> - PCIe4 and its PHY
> - USB0 through USB6 and their PHYs
> - ADSP, CDSP
> - WLAN, Bluetooth (M.2 interface)

There is no WLAN in here, it's part of PATCH 4/4 as far as I can tell.
Move it to changelog of PATCH 4/4?

> 
> Written with contributions from Yingying Tang (added PCIe4 and its PHY to
> enable WLAN).
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 607 ++++++++++++++++++++++++++++
>  1 file changed, 607 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..dad24a6a49ad370aee48a9fd8f4a46f64c2b6348
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> @@ -0,0 +1,607 @@
> [...]
> +&remoteproc_adsp {
> +	firmware-name = "qcom/hamoa-iot/adsp.mbn",
> +			"qcom/hamoa-iot/adsp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/hamoa-iot/cdsp.mbn",
> +			"qcom/hamoa-iot/cdsp_dtb.mbn";

You say this SoM can be used to build "complete embedded systems", are
you sure they will all use the same firwmare signatures?

If not, this should be in the device-specific DT (i.e. the carrier board
in your case).

> [...]
> +&usb_1_ss0 {
> +	status = "okay";
> +};
> +
> +&usb_1_ss0_dwc3 {
> +	dr_mode = "otg";
> +	usb-role-switch;
> +};
> +
> +&usb_1_ss0_hsphy {
> +	vdd-supply = <&vreg_l3j_0p8>;
> +	vdda12-supply = <&vreg_l2j_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss0_qmpphy {
> +	vdda-phy-supply = <&vreg_l2j_1p2>;
> +	vdda-pll-supply = <&vreg_l1j_0p8>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss1 {
> +	status = "okay";
> +};
> +
> +&usb_1_ss1_dwc3 {
> +	dr_mode = "otg";
> +	usb-role-switch;
> +};
> +
> +&usb_1_ss1_hsphy {
> +	vdd-supply = <&vreg_l3j_0p8>;
> +	vdda12-supply = <&vreg_l2j_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss1_qmpphy {
> +	vdda-phy-supply = <&vreg_l2j_1p2>;
> +	vdda-pll-supply = <&vreg_l2d_0p9>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss2 {
> +	status = "okay";
> +};
> +
> +&usb_1_ss2_dwc3 {
> +	dr_mode = "otg";
> +	usb-role-switch;
> +};
> +
> +&usb_1_ss2_hsphy {
> +	vdd-supply = <&vreg_l3j_0p8>;
> +	vdda12-supply = <&vreg_l2j_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss2_qmpphy {
> +	vdda-phy-supply = <&vreg_l2j_1p2>;
> +	vdda-pll-supply = <&vreg_l2d_0p9>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2 {
> +	status = "okay";
> +};
> +
> +&usb_2_dwc3 {
> +	dr_mode = "host";
> +};
> +
> +&usb_2_hsphy {
> +	vdd-supply = <&vreg_l2e_0p8>;
> +	vdda12-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp {
> +	status = "okay";
> +};
> +
> +&usb_mp_hsphy0 {
> +	vdd-supply = <&vreg_l2e_0p8>;
> +	vdda12-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_hsphy1 {
> +	vdd-supply = <&vreg_l2e_0p8>;
> +	vdda12-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_qmpphy0 {
> +	vdda-phy-supply = <&vreg_l3e_1p2>;
> +	vdda-pll-supply = <&vreg_l3c_0p8>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_qmpphy1 {
> +	vdda-phy-supply = <&vreg_l3e_1p2>;
> +	vdda-pll-supply = <&vreg_l3c_0p8>;
> +
> +	status = "okay";
> +};
> 

Assuming the USB ports are located on the carrier board and not the
SoM(?):

Are carrier boards required to make use of all these USB
ports/interfaces? In my experience it's not unusual that embedded
carrier boards use only the functionality that they need. Maybe this
should just set the common properties and enabling individual ports for
PCIe and USB should be up to the carrier boards.

Thanks,
Stephan

