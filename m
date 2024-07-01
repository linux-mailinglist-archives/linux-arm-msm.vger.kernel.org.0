Return-Path: <linux-arm-msm+bounces-24762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1585591D655
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 04:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA238282DBD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 02:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B2EC147;
	Mon,  1 Jul 2024 02:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="De7uU9Sz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0D9B674;
	Mon,  1 Jul 2024 02:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719802558; cv=none; b=RB2A6MW0Je2TC01277d2vTK39XiDVQP/gUPbm+0AIlh7aJZphCQf2z8wHG2yPk4NcTsiD2a2N/dMXCyLPSNRwJpvQM9hPUMs82XzAoWG7ZGwhALTsJQ8YFt+HrfBVKaAMKP3TDb31YKkHC+RzmRWMKci9F/PN9RsDxtR7M+kMaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719802558; c=relaxed/simple;
	bh=9b3W5TSHr8dGDm2EfJckKW6u7JUbDzLGenvoyZxmBI0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=M3sQG0EauSHDPPz6rQQfes87XKoisRx9A8g5ARNuBZl1uwvfIQByVl7JGahcTtHhSIKEM0LHP1TUYneBXD5ikcbMtR5nOZ3wAgLkjLrxxCMrVKPekaGrISsCxMwpHtcEwcnvb++cOOsPSUJHPKp4N4wdUCf5BfZ2twm/X9M2R/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=De7uU9Sz; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7180e5f735bso1378186a12.0;
        Sun, 30 Jun 2024 19:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719802556; x=1720407356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HLBPwPLhRdwTrJD/RPLwV4cUim+rjoeYww3a0iF11Lc=;
        b=De7uU9SzfzrtbdLYFxbQE7fjddRYYFcuUwVFdX5DcQjtRJyDfebO6F4OzHv3CYFbqw
         ub54UfEYp2fd/TRIdAZM/Qnv631nTibs9Jx7RkkN427w2bhwPjnHzyAspuAWWxMxLT6s
         Nn4PxRQ+dU/sKvE7MlB0JsHPR12QCP/O+iH79/vbCfWHGeWdsC6iLXTMoUGjRRU8R1i0
         s6FtUDeV+5DMUwf53y2YhZzR1GdzisFOiMKLitVeQ0hMGju7+psMce+dAJOs4pa5yZsa
         r3oWQr9AR0FEkMb3liWZEU+Af22zVX/SbFiY1YqYZTWZugbvkkfM9le+9z448PvQCqQK
         DZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719802556; x=1720407356;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HLBPwPLhRdwTrJD/RPLwV4cUim+rjoeYww3a0iF11Lc=;
        b=Oz3l/qjIA/gcwNAT1bLOKyUb5Nr4bDNA9AZuajFIlhQqAcMsD8ucbdDRUCuNnJJX3M
         Xp2ec6YXI+zhc2VOWy0iXRKBluFpNQx0n3+TbUXC54vQ5qDWPJ0uRjx91/sZ5WY7bgWe
         MxaCk2pIToeho5DcpB6MOEE7D9Bd4CVUMquP5ui4YMsZx6eCG/Qi6T/mQzrDfztzD1jH
         JJGltqWwMKf5WEC/D/yR2uDDaiw0CWgLJPYY7ZlmtMK6Jd22BYazeVpu19Uj7uXRlMjM
         GbxSdCaI12EoHSI3JuCLGCnREnzWtUaJJzz327GCUj419sWgKcUDiFtjopspGyQ0irwW
         pJkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZudPtSeYLyLOwnMShwXqM1BZLbaHR2pa4Ae0lzwrTnwkIQr9QRQFF23pM1inXKAudo1BhWWYzk8a1+dWMS8EYYccSnBlPjfNUh/mt0+chTtqiW/44S8o8IzE7SjCoNcwmSxZa5GDJ0mPDt6liZoSlEv+YxV0XkI03zB8nWbCCkRx8mGp1YkY=
X-Gm-Message-State: AOJu0YxD84IL4fYCTu0gxS4C8iNJMFcaCMLks4J9dqnPe5ThYZKbFfts
	KZs6UepEPUEdFowXNfAK3PLvPY+twBC1o4Uh0ihaGKJm37xy0Oc9HeuzCh9DU4Q=
X-Google-Smtp-Source: AGHT+IGcWWT0YfQ3fzHVJK/yt6UUkT0nAwlaFQ3DCAg1QKgJqw34+EaBIL5tvM0MRfIA4SfQYWz7dg==
X-Received: by 2002:a05:6a21:6da4:b0:1be:c2d9:be69 with SMTP id adf61e73a8af0-1bef62436d1mr6678818637.23.1719802556093;
        Sun, 30 Jun 2024 19:55:56 -0700 (PDT)
Received: from [192.168.0.171] ([223.166.28.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70867f642fesm5012627b3a.166.2024.06.30.19.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jun 2024 19:55:55 -0700 (PDT)
Message-ID: <acff166f-9ebb-456e-9bea-61c3dafe7ebd@gmail.com>
Date: Mon, 1 Jul 2024 10:55:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Xilin Wu <wuxilin123@gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add device tree for ASUS
 Vivobook S 15
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>,
 Elliot Berman <quic_eberman@quicinc.com>
References: <20240630-asus-vivobook-s15-v3-0-bce7ca4d9683@gmail.com>
 <20240630-asus-vivobook-s15-v3-2-bce7ca4d9683@gmail.com>
 <ZoGMaOdyDFjoyqww@linaro.org>
Content-Language: en-US
In-Reply-To: <ZoGMaOdyDFjoyqww@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/7/1 0:48, Abel Vesa wrote:
> On 24-06-30 16:59:27, Xilin Wu via B4 Relay wrote:
>> From: Xilin Wu <wuxilin123@gmail.com>
>>
>> ASUS Vivobook S 15 is a laptop based on the Qualcomm Snapdragon X Elite
>> SoC (X1E78100).
>>
>> Add the device tree for the laptop with support for the following features:
>>
>> - CPU frequency scaling up to 3.4GHz
>> - NVMe storage on PCIe 6a (capable of Gen4x4, currently limited to Gen4x2)
>> - Keyboard and touchpad
>> - WCN7850 Wi-Fi
>> - Two Type-C ports on the left side (USB3 only in one orientation)
>> - internal eDP display
>> - ADSP and CDSP remoteprocs
>>
>> Further details could be found in the cover letter.
>>
>> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>>   .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 616 +++++++++++++++++++++
>>   2 files changed, 617 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 5576c7d6ea06..fe08b6be565d 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -258,5 +258,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-display-card.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-qcp.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
>> new file mode 100644
>> index 000000000000..34f90e45a5d7
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
>> @@ -0,0 +1,616 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2024, Xilin Wu <wuxilin123@gmail.com>
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +
>> +#include "x1e80100.dtsi"
>> +#include "x1e80100-pmics.dtsi"
>> +
>> +/ {
>> +	model = "ASUS Vivobook S 15";
>> +	compatible = "asus,vivobook-s15", "qcom,x1e80100";
>> +	chassis-type = "laptop";
>> +
> 
> [ ... ]
> 
>> +
>> +	tpad_default: tpad-default-state {
>> +		pins = "gpio3";
>> +		function = "gpio";
>> +		bias-disable;
>> +	};
>> +};
>> +
>> +&usb_1_ss0_hsphy {
>> +	vdd-supply = <&vreg_l2e_0p8>;
> 
> I think you will probably want to use vreg_l3j_0p8 here. See following
> fix for CRD and QCP:
> 
> https://lore.kernel.org/linux-kernel/20240629-x1e80100-dts-fix-hsphy-0-8v-supplies-v1-1-de99ee030b27@linaro.org/T/
> 

Indeed, I checked ACPI just now and I think the design follows CRD and QCP.

>> +	vdda12-supply = <&vreg_l2j_1p2>;
>> +
>> +	phys = <&smb2360_0_eusb2_repeater>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_ss0_qmpphy {
>> +	vdda-phy-supply = <&vreg_l3e_1p2>;
>> +	vdda-pll-supply = <&vreg_l1j_0p8>;
>> +
>> +	orientation-switch;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_ss0 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_ss0_dwc3 {
>> +	dr_mode = "host";
>> +};
>> +
>> +&usb_1_ss0_dwc3_hs {
>> +	remote-endpoint = <&pmic_glink_ss0_hs_in>;
>> +};
>> +
>> +&usb_1_ss0_qmpphy_out {
>> +	remote-endpoint = <&pmic_glink_ss0_ss_in>;
>> +};
>> +
>> +&usb_1_ss1_hsphy {
>> +	vdd-supply = <&vreg_l2e_0p8>;
> 
> Same here.
> 
>> +	vdda12-supply = <&vreg_l2j_1p2>;
>> +
>> +	phys = <&smb2360_1_eusb2_repeater>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_ss1_qmpphy {
>> +	vdda-phy-supply = <&vreg_l3e_1p2>;
>> +	vdda-pll-supply = <&vreg_l2d_0p9>;
>> +
>> +	orientation-switch;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_ss1 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_ss1_dwc3 {
>> +	dr_mode = "host";
>> +};
>> +
>> +&usb_1_ss1_dwc3_hs {
>> +	remote-endpoint = <&pmic_glink_ss1_hs_in>;
>> +};
>> +
>> +&usb_1_ss1_qmpphy_out {
>> +	remote-endpoint = <&pmic_glink_ss1_ss_in>;
>> +};
>>
>> -- 
>> 2.45.2
>>
>>

-- 
Thanks,
Xilin Wu

