Return-Path: <linux-arm-msm+bounces-67047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7139B158F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 08:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1A1C18A60BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 06:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22EFB1F1538;
	Wed, 30 Jul 2025 06:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nfQElPeV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCE01E8326
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 06:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753856920; cv=none; b=mZDLjfHKB9QUSxOi4HScnGJqnvSTGAAqkiyDgBrBSKQ+QgpwsXyxB9lu6N1U/9S5oeRLHIiXhTDTaxvMu5nbBjTraUp72eX5cd63xoARBojoRlsdHCkm+BTYIams5RsYwtw7z3pheft6uQJxfPJeKS+kAbplat4IcpXsmnSR6R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753856920; c=relaxed/simple;
	bh=DvfEE0bU9OVbqhc68QOvZdIyTfPL02QC8XNnNzzc4Cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DwoDwBHWTfe3fA1duFz3a4BhnGiPZopF8xrafpvhQPrUn6wXkBdKKXe9+Xdp3aEXnwzIcLMtV3kBG9rblP5oxzWHutSOkXua+73WCXBdZ8yt0pn6bUSJoNUuARDW3F0YXdDNFNwONstJ4wc9k9tqX8m6iwsXOpmYPBFyb13iclc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nfQElPeV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TJVlGW030134
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 06:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rhbZtkdGLcHxC8WrXNhPgdwhaNLXBDTsK4h1rM8ia2U=; b=nfQElPeVkuAR95PX
	xMgnXKnHWcL7JK0o51Fmzf75Lhn2axbkxjdeVJVRyx0YPeOQkOscIsh5a7AyNat/
	yQRXuDMNCtXHbCPqSK14locArj2cBzFfVgDDI/KTsS0aaS6D3Ot2CNXJ9sunG4fh
	21MlrSaujJrD1PebJZzlM1Wms3BugjcIS/4N4vqBUmnrIZmPCdiIux33yl4ExYHc
	xGLLI6zCV0IOnFtOs+rcfLpxu1oj/TWdi+L7ltzIBDi4NjgHWEa7eiUsktDkUPwh
	xtykYVMilnadqiIKDuOE/PsftqzeMSJsNifWA8zYqLQO+KxO3PvkOgnCYrYKSlTF
	ojG2gA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm2hr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 06:28:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74d12fa4619so5841636b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 23:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753856914; x=1754461714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhbZtkdGLcHxC8WrXNhPgdwhaNLXBDTsK4h1rM8ia2U=;
        b=mAtu3mfoAoiz85Y59nRytB/aRlYYtwhsGGSIK83acEf7glvuCyHBgGMcjs96nJzhav
         uYfHoxHbIzOKEfeTf17u0BRBRLKLEX0PWVYlKuHlFPvQJhVpbpImv2cSsy55kEXF/cE3
         R9WHVAVv7YjV8KTAYbkhecGPATmrkTXvVMU6I5PmGeSBm+VCaLlTV2bR09GApUw37rLI
         jS++9BSiRBZbhj7I3VNTHeLTksRJUxl1IRfjY13ug8kfagK2pRX5egH3lQZBtSmsHPyP
         m8+d0Behmb4a23CA4FgeYcnj062czeYn9dMQ+t6v3w0Gow68rCrRz+ZJemGfL54CVdun
         n9tA==
X-Forwarded-Encrypted: i=1; AJvYcCXKH9XUOOtyE/zcKsNcYMHG/W3DtmlqYeV30KCIMfwmFZoA49NDQIl511a4BO+2ucIzuVg1DwmmCRwuNKCe@vger.kernel.org
X-Gm-Message-State: AOJu0Yyejia6Z3p6BxZyYampEjsN6vIuEucm6kVq3XfIJ4B7OU/itfMS
	5P6OSH3IRVYCu9rM4elWe/z7HugrCUzyyzY9TxPGV1v6B+Qn56cnfK9yLCqn5F/1mY8ZMlJj/BH
	PXFgPrinl/6exuB8zdTbB++ySIotDTuuaYGz38OV5z18U+wCg+8ApeNHVkc9+rDhLa0vA
X-Gm-Gg: ASbGncuJpuPPkRPNg5Rz+6GD8WFi3DNZLnxZ6TsMgdly57InQNZGT8C8uRLOm7D5lfR
	AK2h2aTyWSIll8An0xXa3UHUfz3oYpe1mvTgHDpfF4GAAGHooezYTPY3OaYm52OJ8aR37lQAuxQ
	ONn9FvLuIHM0cmi+ffcXKxVrtecGKoP7/KeCNq1rK1PQpy5sKeAsFcmR7h3/6covigeE1xJxCeo
	5OHIJkgCwFAhb1eEhruH/qvst2gq8c9Kt5QwlhxtbiJp6BxmLQ7EIx5cEuR1IUDJbPgSQvfPYul
	uKdlYWEoetfdSuHnOK7FKNtXIEJPkGP7eAhbl7VlJGGWtYwI+WgeAP3mMnEQh0O9bZ4usvRtWQy
	3C2PeRy/pbZ4UgvOQ8JnyDt0Sxqhy
X-Received: by 2002:a05:6a00:23c8:b0:749:1c27:bcc5 with SMTP id d2e1a72fcca58-76ab32fcedcmr3072208b3a.22.1753856913780;
        Tue, 29 Jul 2025 23:28:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9pVo7rB4TtHZFDiijBr/7IZavo23ROq2xbEnGeydE27mKy0B4lSaUoIKF0dC349R7uMKfIg==
X-Received: by 2002:a05:6a00:23c8:b0:749:1c27:bcc5 with SMTP id d2e1a72fcca58-76ab32fcedcmr3072167b3a.22.1753856913015;
        Tue, 29 Jul 2025 23:28:33 -0700 (PDT)
Received: from [10.133.33.143] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640b1e5c94sm9718086b3a.94.2025.07.29.23.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 23:28:32 -0700 (PDT)
Message-ID: <b4a3f568-f41f-4141-b421-8b158973f810@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 14:28:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250729-hamoa_initial-v3-0-806e092789dc@oss.qualcomm.com>
 <20250729-hamoa_initial-v3-4-806e092789dc@oss.qualcomm.com>
 <pbvyog477v32s4lu72z52dhsond5yud5w3nxmcouvr6ljlndlh@ws46dncy35c6>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <pbvyog477v32s4lu72z52dhsond5yud5w3nxmcouvr6ljlndlh@ws46dncy35c6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=6889bb93 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=N3c1US3UlBgHhiaUDIUA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA0MyBTYWx0ZWRfXzf+5btl23G3u
 8Lg7TQ8p94ofL3YJWt7NxwrI5mfljeTOLBh5nkDD5n/3oTrdqpyXUoGWRYXVtZg66P/+QNRdoXC
 otOi/Aa1KAtgT3sPq+CUtJBOGXYYVGpURKrkCaeHSWs1O9A/7FMbIaoeJz9lWnLYMJEM0X/AZG5
 Fq9VM5xN6c4CN5vskc2yerghRdwlHekmi2XUiSwfZgP1YiS8wJ5nAXt4GMqi0Kle0a57u3yZzIO
 cJ/eP2r/qw/0K4m7KHjmuTIQ1YKY99bwBKZjDKQkcnEBCgqi6spgmDaIANuRdSxHSWxaE8EkBGI
 u5hhKYn0fATTs3xQS1JkcIQNwXGkfbOmuNEhCVQReBvKyo3NAlq89BO1mG81DzvYzabfSMrtLC1
 v4wQpOGaks3jmsdNiFiE3ehePoC4C8/E0a8fC4le4bmGoekxeO+3aBQT1bpSFVM8Jg18UUrl
X-Proofpoint-ORIG-GUID: lb4jVeME7z2rhTsr6c8MWKr15-c-n8L4
X-Proofpoint-GUID: lb4jVeME7z2rhTsr6c8MWKr15-c-n8L4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_02,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300043



On 2025-07-29 18:37, Dmitry Baryshkov wrote:
> On Tue, Jul 29, 2025 at 09:32:00AM +0800, Yijie Yang wrote:
>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>> embedded system capable of booting to UART.
>>
>> This change enables and overlays the following peripherals on the carrier
>> board:
>> - UART
>> - On-board regulators
>> - USB Type-C mux
>> - Pinctrl
>> - Embedded USB (EUSB) repeaters
>> - NVMe
>> - pmic-glink
>> - USB DisplayPorts
>>
>> Written with contributions from Shuai Zhang (added Bluetooth) and Yongxing
>> Mou (added USB DisplayPorts).
> 
> Please use S-o-B + Co-developed-by instead. You can add comments on the
> tag line after the hash sign.
> 
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile          |   1 +
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 992 +++++++++++++++++++++++++++++
>>   2 files changed, 993 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 4bfa926b6a0850c3c459bcba28129c559d50a7cf..c5994b75d3e56e74ffb64b2389ee1bcc086f3065 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8039-t2.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..02daec04f933c0b3ab9bd329f56ac1ba0401ddef
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> @@ -0,0 +1,992 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "hamoa-iot-som.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. Hamoa IoT EVK";
>> +	compatible = "qcom,hamoa-iot-evk", "qcom,hamoa-iot-som", "qcom,x1e80100";
>> +	chassis-type = "embedded";
>> +
>> +	aliases {
>> +		serial0 = &uart21;
>> +		serial1 = &uart14;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +
>> +	pmic-glink {
>> +		compatible = "qcom,x1e80100-pmic-glink",
>> +			     "qcom,sm8550-pmic-glink",
>> +			     "qcom,pmic-glink";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
>> +				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
>> +				    <&tlmm 125 GPIO_ACTIVE_HIGH>;
>> +
>> +		connector@0 {
>> +			compatible = "usb-c-connector";
>> +			reg = <0>;
>> +			power-role = "dual";
>> +			data-role = "dual";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					pmic_glink_ss0_hs_in: endpoint {
>> +						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +
>> +					pmic_glink_ss0_ss_in: endpoint {
>> +						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
> 
> No retimers on SS0?

Similar to the QCP, the EVK does not use Parade PS8830 retimers on the 
SS0. Instead, each port uses an FSUSB42 USB switch to handle orientation 
switching for the SBU lines.

> 
>> +					};
>> +				};
>> +
>> +				port@2 {
>> +					reg = <2>;
>> +
>> +					pmic_glink_ss0_sbu: endpoint {
>> +						remote-endpoint = <&usb_1_ss0_sbu_mux>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		connector@1 {
>> +			compatible = "usb-c-connector";
>> +			reg = <1>;
>> +			power-role = "dual";
>> +			data-role = "dual";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					pmic_glink_ss1_hs_in: endpoint {
>> +						remote-endpoint = <&usb_1_ss1_dwc3_hs>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +
>> +					pmic_glink_ss1_ss_in: endpoint {
>> +						remote-endpoint = <&retimer_ss1_ss_out>;
>> +					};
>> +				};
>> +
>> +				port@2 {
>> +					reg = <2>;
>> +
>> +					pmic_glink_ss1_con_sbu_in: endpoint {
>> +						remote-endpoint = <&retimer_ss1_con_sbu_out>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		connector@2 {
>> +			compatible = "usb-c-connector";
>> +			reg = <2>;
>> +			power-role = "dual";
>> +			data-role = "dual";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +
>> +					pmic_glink_ss2_hs_in: endpoint {
>> +						remote-endpoint = <&usb_1_ss2_dwc3_hs>;
>> +					};
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +
>> +					pmic_glink_ss2_ss_in: endpoint {
>> +						remote-endpoint = <&retimer_ss2_ss_out>;
>> +					};
>> +				};
>> +
>> +				port@2 {
>> +					reg = <2>;
>> +
>> +					pmic_glink_ss2_con_sbu_in: endpoint {
>> +						remote-endpoint = <&retimer_ss2_con_sbu_out>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	vph_pwr: regulator-vph-pwr {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "vph_pwr";
>> +		regulator-min-microvolt = <3700000>;
>> +		regulator-max-microvolt = <3700000>;
>> +
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_edp_3p3: regulator-edp-3p3 {
> 
> regulator-edp-3p3 < regulator-vph-pwr

I will update.

> 
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_EDP_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&edp_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_nvme: regulator-nvme {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_NVME_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&nvme_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
> 
> Hmm, so there are regulators for the retimer, but they are not used.
> Could you please point out, why?

According to the schematic, there is a regulator and a retimer (PS8830). 
However, as mentioned above, the retimer is not connected to USB 0 and 
is therefore not used in the EVK. As a result, the regulator is left 
unused in this context.

> 
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_RTMR0_1P15";
>> +		regulator-min-microvolt = <1150000>;
>> +		regulator-max-microvolt = <1150000>;
>> +
>> +		gpio = <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&usb0_pwr_1p15_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_RTMR0_1P8";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +
>> +		gpio = <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&usb0_1p8_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_RTMR0_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&usb0_3p3_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_rtmr1_1p15: regulator-rtmr1-1p15 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_RTMR1_1P15";
>> +		regulator-min-microvolt = <1150000>;
>> +		regulator-max-microvolt = <1150000>;
>> +
>> +		gpio = <&tlmm 188 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&usb1_pwr_1p15_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_rtmr1_1p8: regulator-rtmr1-1p8 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_RTMR1_1P8";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +
>> +		gpio = <&tlmm 175 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&usb1_pwr_1p8_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_rtmr1_3p3: regulator-rtmr1-3p3 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_RTMR1_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&tlmm 186 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&usb1_pwr_3p3_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_rtmr2_1p15: regulator-rtmr2-1p15 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_RTMR2_1P15";
>> +		regulator-min-microvolt = <1150000>;
>> +		regulator-max-microvolt = <1150000>;
>> +
>> +		gpio = <&tlmm 189 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&usb2_pwr_1p15_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_rtmr2_1p8: regulator-rtmr2-1p8 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_RTMR2_1P8";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +
>> +		gpio = <&tlmm 126 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&usb2_pwr_1p8_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	vreg_rtmr2_3p3: regulator-rtmr2-3p3 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_RTMR2_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&tlmm 187 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&usb2_pwr_3p3_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	usb-1-ss0-sbu-mux {
>> +		compatible = "onnn,fsusb42", "gpio-sbu-mux";
>> +
>> +		enable-gpios = <&tlmm 168 GPIO_ACTIVE_LOW>;
>> +		select-gpios = <&tlmm 167 GPIO_ACTIVE_HIGH>;
>> +
>> +		pinctrl-0 = <&usb_1_ss0_sbu_default>;
>> +		pinctrl-names = "default";
>> +
>> +		mode-switch;
>> +		orientation-switch;
>> +
>> +		port {
>> +			usb_1_ss0_sbu_mux: endpoint {
>> +				remote-endpoint = <&pmic_glink_ss0_sbu>;
>> +			};
>> +		};
>> +	};
>> +
>> +	vreg_wcn_3p3: regulator-wcn-3p3 {
> 
> regulator-wcn-3p3 < usb-1-ss0-sbu-mux

I will update.

> 
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_WCN_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&wcn_sw_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	/*
>> +	 * TODO: These two regulators are actually part of the removable M.2
>> +	 * card and not the CRD mainboard. Need to describe this differently.
>> +	 * Functionally it works correctly, because all we need to do is to
>> +	 * turn on the actual 3.3V supply above.
>> +	 */
>> +	vreg_wcn_0p95: regulator-wcn-0p95 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_WCN_0P95";
>> +		regulator-min-microvolt = <950000>;
>> +		regulator-max-microvolt = <950000>;
>> +
>> +		vin-supply = <&vreg_wcn_3p3>;
>> +	};
>> +
>> +	vreg_wcn_1p9: regulator-wcn-1p9 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_WCN_1P9";
>> +		regulator-min-microvolt = <1900000>;
>> +		regulator-max-microvolt = <1900000>;
>> +
>> +		vin-supply = <&vreg_wcn_3p3>;
>> +	};
>> +
>> +	vreg_wwan: regulator-wwan {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "SDX_VPH_PWR";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&tlmm 221 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&wwan_sw_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
>> +
>> +	wcn7850-pmu {
>> +		compatible = "qcom,wcn7850-pmu";
>> +
>> +		vdd-supply = <&vreg_wcn_0p95>;
>> +		vddio-supply = <&vreg_l15b_1p8>;
>> +		vddaon-supply = <&vreg_wcn_0p95>;
>> +		vdddig-supply = <&vreg_wcn_0p95>;
>> +		vddrfa1p2-supply = <&vreg_wcn_1p9>;
>> +		vddrfa1p8-supply = <&vreg_wcn_1p9>;
>> +
>> +		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
>> +
>> +		pinctrl-0 = <&wcn_bt_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulators {
>> +			vreg_pmu_rfa_cmn: ldo0 {
>> +				regulator-name = "vreg_pmu_rfa_cmn";
>> +			};
>> +
>> +			vreg_pmu_aon_0p59: ldo1 {
>> +				regulator-name = "vreg_pmu_aon_0p59";
>> +			};
>> +
>> +			vreg_pmu_wlcx_0p8: ldo2 {
>> +				regulator-name = "vreg_pmu_wlcx_0p8";
>> +			};
>> +
>> +			vreg_pmu_wlmx_0p85: ldo3 {
>> +				regulator-name = "vreg_pmu_wlmx_0p85";
>> +			};
>> +
>> +			vreg_pmu_btcmx_0p85: ldo4 {
>> +				regulator-name = "vreg_pmu_btcmx_0p85";
>> +			};
>> +
>> +			vreg_pmu_rfa_0p8: ldo5 {
>> +				regulator-name = "vreg_pmu_rfa_0p8";
>> +			};
>> +
>> +			vreg_pmu_rfa_1p2: ldo6 {
>> +				regulator-name = "vreg_pmu_rfa_1p2";
>> +			};
>> +
>> +			vreg_pmu_rfa_1p8: ldo7 {
>> +				regulator-name = "vreg_pmu_rfa_1p8";
>> +			};
>> +
>> +			vreg_pmu_pcie_0p9: ldo8 {
>> +				regulator-name = "vreg_pmu_pcie_0p9";
>> +			};
>> +
>> +			vreg_pmu_pcie_1p8: ldo9 {
>> +				regulator-name = "vreg_pmu_pcie_1p8";
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&i2c1 {
>> +	clock-frequency = <400000>;
>> +	status = "okay";
>> +
>> +	typec-mux@8 {
>> +		compatible = "parade,ps8830";
>> +		reg = <0x08>;
>> +
>> +		clocks = <&rpmhcc RPMH_RF_CLK5>;
>> +
>> +		vdd-supply = <&vreg_rtmr2_1p15>;
>> +		vdd33-supply = <&vreg_rtmr2_3p3>;
>> +		vdd33-cap-supply = <&vreg_rtmr2_3p3>;
>> +		vddar-supply = <&vreg_rtmr2_1p15>;
>> +		vddat-supply = <&vreg_rtmr2_1p15>;
>> +		vddio-supply = <&vreg_rtmr2_1p8>;
>> +
>> +		reset-gpios = <&tlmm 185 GPIO_ACTIVE_LOW>;
>> +
>> +		pinctrl-0 = <&rtmr2_default>;
>> +		pinctrl-names = "default";
>> +
>> +		orientation-switch;
>> +		retimer-switch;
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				retimer_ss2_ss_out: endpoint {
>> +					remote-endpoint = <&pmic_glink_ss2_ss_in>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				retimer_ss2_ss_in: endpoint {
>> +					remote-endpoint = <&usb_1_ss2_qmpphy_out>;
>> +				};
>> +			};
>> +
>> +			port@2 {
>> +				reg = <2>;
>> +
>> +				retimer_ss2_con_sbu_out: endpoint {
>> +					remote-endpoint = <&pmic_glink_ss2_con_sbu_in>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&i2c5 {
>> +	clock-frequency = <400000>;
>> +	status = "okay";
>> +
>> +	eusb3_repeater: redriver@47 {
>> +		compatible = "nxp,ptn3222";
>> +		reg = <0x47>;
>> +		#phy-cells = <0>;
>> +
>> +		vdd3v3-supply = <&vreg_l13b_3p0>;
>> +		vdd1v8-supply = <&vreg_l4b_1p8>;
>> +
>> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
>> +
>> +		pinctrl-0 = <&eusb3_reset_n>;
>> +		pinctrl-names = "default";
>> +	};
>> +
>> +	eusb5_repeater: redriver@43 {
>> +		compatible = "nxp,ptn3222";
>> +		reg = <0x43>;
>> +		#phy-cells = <0>;
>> +
>> +		vdd3v3-supply = <&vreg_l13b_3p0>;
>> +		vdd1v8-supply = <&vreg_l4b_1p8>;
>> +
>> +		reset-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
>> +
>> +		pinctrl-0 = <&eusb5_reset_n>;
>> +		pinctrl-names = "default";
>> +	};
>> +
>> +	eusb6_repeater: redriver@4f {
>> +		compatible = "nxp,ptn3222";
>> +		reg = <0x4f>;
>> +		#phy-cells = <0>;
>> +
>> +		vdd3v3-supply = <&vreg_l13b_3p0>;
>> +		vdd1v8-supply = <&vreg_l4b_1p8>;
>> +
>> +		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
>> +
>> +		pinctrl-0 = <&eusb6_reset_n>;
>> +		pinctrl-names = "default";
>> +	};
>> +};
>> +
>> +&i2c7 {
>> +	clock-frequency = <400000>;
>> +
>> +	status = "okay";
>> +
>> +	typec-mux@8 {
>> +		compatible = "parade,ps8830";
>> +		reg = <0x8>;
>> +
>> +		clocks = <&rpmhcc RPMH_RF_CLK4>;
>> +
>> +		vdd-supply = <&vreg_rtmr1_1p15>;
>> +		vdd33-supply = <&vreg_rtmr1_3p3>;
>> +		vdd33-cap-supply = <&vreg_rtmr1_3p3>;
>> +		vddar-supply = <&vreg_rtmr1_1p15>;
>> +		vddat-supply = <&vreg_rtmr1_1p15>;
>> +		vddio-supply = <&vreg_rtmr1_1p8>;
>> +
>> +		reset-gpios = <&tlmm 176 GPIO_ACTIVE_LOW>;
>> +
>> +		pinctrl-0 = <&rtmr1_default>;
>> +		pinctrl-names = "default";
>> +
>> +		retimer-switch;
>> +		orientation-switch;
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				retimer_ss1_ss_out: endpoint {
>> +					remote-endpoint = <&pmic_glink_ss1_ss_in>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				retimer_ss1_ss_in: endpoint {
>> +					remote-endpoint = <&usb_1_ss1_qmpphy_out>;
>> +				};
>> +			};
>> +
>> +			port@2 {
>> +				reg = <2>;
>> +
>> +				retimer_ss1_con_sbu_out: endpoint {
>> +					remote-endpoint = <&pmic_glink_ss1_con_sbu_in>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&mdss {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp0 {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp0_out {
>> +	data-lanes = <0 1>;
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>> +};
>> +
>> +&mdss_dp1 {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp1_out {
>> +	data-lanes = <0 1>;
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>> +};
>> +
>> +&mdss_dp2 {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp2_out {
>> +	data-lanes = <0 1>;
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>> +};
>> +
>> +&mdss_dp3 {
>> +	/delete-property/ #sound-dai-cells;
>> +
>> +	status = "okay";
>> +
>> +	aux-bus {
>> +		panel {
>> +			compatible = "edp-panel";
>> +			power-supply = <&vreg_edp_3p3>;
>> +
>> +			port {
>> +				edp_panel_in: endpoint {
>> +					remote-endpoint = <&mdss_dp3_out>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	ports {
>> +		port@1 {
> 
> Rebase on top of https://lore.kernel.org/r/20250724-move-edp-endpoints-v1-0-6ca569812838@oss.qualcomm.com

I will update.

> 
>> +			reg = <1>;
>> +
>> +			mdss_dp3_out: endpoint {
>> +				data-lanes = <0 1 2 3>;
>> +				link-frequencies = /bits/ 64 <1620000000 2700000000
>> +							      5400000000 8100000000>;
>> +
>> +				remote-endpoint = <&edp_panel_in>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&mdss_dp3_phy {
>> +	vdda-phy-supply = <&vreg_l3j_0p8>;
>> +	vdda-pll-supply = <&vreg_l2j_1p2>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pcie6a {
>> +	vddpe-3v3-supply = <&vreg_nvme>;
>> +};
>> +
>> +&pm8550_gpios {
>> +	rtmr0_default: rtmr0-reset-n-active-state {
>> +		pins = "gpio10";
>> +		function = "normal";
>> +		power-source = <1>; /* 1.8V */
>> +		bias-disable;
>> +		input-disable;
>> +		output-enable;
>> +	};
>> +
>> +	usb0_3p3_reg_en: usb0-3p3-reg-en-state {
>> +		pins = "gpio11";
>> +		function = "normal";
>> +		power-source = <1>; /* 1.8V */
>> +		bias-disable;
>> +		input-disable;
>> +		output-enable;
>> +	};
>> +};
>> +
>> +&pm8550ve_9_gpios {
>> +	usb0_1p8_reg_en: usb0-1p8-reg-en-state {
>> +		pins = "gpio8";
>> +		function = "normal";
>> +		power-source = <1>; /* 1.8V */
>> +		bias-disable;
>> +		input-disable;
>> +		output-enable;
>> +	};
>> +};
>> +
>> +&pmc8380_5_gpios {
>> +	usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
>> +		pins = "gpio8";
>> +		function = "normal";
>> +		power-source = <1>; /* 1.8V */
>> +		bias-disable;
>> +		input-disable;
>> +		output-enable;
>> +	};
>> +};
>> +
>> +&smb2360_0 {
>> +	status = "okay";
>> +};
>> +
>> +&smb2360_0_eusb2_repeater {
>> +	vdd18-supply = <&vreg_l3d_1p8>;
>> +	vdd3-supply = <&vreg_l2b_3p0>;
>> +};
>> +
>> +&smb2360_1 {
>> +	status = "okay";
>> +};
>> +
>> +&smb2360_1_eusb2_repeater {
>> +	vdd18-supply = <&vreg_l3d_1p8>;
>> +	vdd3-supply = <&vreg_l14b_3p0>;
>> +};
>> +
>> +&smb2360_2 {
>> +	status = "okay";
>> +};
>> +
>> +&smb2360_2_eusb2_repeater {
>> +	vdd18-supply = <&vreg_l3d_1p8>;
>> +	vdd3-supply = <&vreg_l8b_3p0>;
>> +};
>> +
>> +&tlmm {
>> +	edp_reg_en: edp-reg-en-state {
>> +		pins = "gpio70";
>> +		function = "gpio";
>> +		drive-strength = <16>;
>> +		bias-disable;
>> +	};
>> +
>> +	eusb3_reset_n: eusb3-reset-n-state {
>> +		pins = "gpio6";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +		output-low;
>> +	};
>> +
>> +	eusb5_reset_n: eusb5-reset-n-state {
>> +		pins = "gpio7";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-up;
>> +		output-low;
>> +	};
>> +
>> +	eusb6_reset_n: eusb6-reset-n-state {
>> +		pins = "gpio184";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-up;
>> +		output-low;
>> +	};
>> +
>> +	nvme_reg_en: nvme-reg-en-state {
>> +		pins = "gpio18";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	rtmr1_default: rtmr1-reset-n-active-state {
>> +		pins = "gpio176";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	rtmr2_default: rtmr2-reset-n-active-state {
>> +		pins = "gpio185";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	usb1_pwr_1p15_reg_en: usb1-pwr-1p15-reg-en-state {
>> +		pins = "gpio188";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	usb1_pwr_1p8_reg_en: usb1-pwr-1p8-reg-en-state {
>> +		pins = "gpio175";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	usb1_pwr_3p3_reg_en: usb1-pwr-3p3-reg-en-state {
>> +		pins = "gpio186";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	usb2_pwr_1p15_reg_en: usb2-pwr-1p15-reg-en-state {
>> +		pins = "gpio189";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	usb2_pwr_1p8_reg_en: usb2-pwr-1p8-reg-en-state {
>> +		pins = "gpio126";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	usb2_pwr_3p3_reg_en: usb2-pwr-3p3-reg-en-state {
>> +		pins = "gpio187";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
>> +		mode-pins {
>> +			pins = "gpio166";
>> +			function = "gpio";
>> +			bias-disable;
>> +			drive-strength = <2>;
>> +			output-high;
> 
> What does this pin do? It's not recommended to set GPIO values through
> pinctrl.

It is used to switch data lines between USB Type-C orientation detection 
and DisplayPort AUX channels. When this GPIO is high, USB0 operates in 
orientation detection mode.

> 
>> +		};
>> +
>> +		oe-n-pins {
>> +			pins = "gpio168";
>> +			function = "gpio";
>> +			bias-disable;
>> +			drive-strength = <2>;
>> +		};
>> +
>> +		sel-pins {
>> +			pins = "gpio167";
>> +			function = "gpio";
>> +			bias-disable;
>> +			drive-strength = <2>;
>> +		};
>> +	};
>> +
>> +	wcn_bt_en: wcn-bt-en-state {
>> +		pins = "gpio116";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	wwan_sw_en: wwan-sw-en-state {
>> +		pins = "gpio221";
>> +		function = "gpio";
>> +		drive-strength = <4>;
>> +		bias-disable;
>> +	};
>> +
>> +	wcn_sw_en: wcn-sw-en-state {
>> +		pins = "gpio214";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	wcn_usb_sw_n: wcn-usb-sw-n-state {
> 
> What does this pin do? Using pinctrl to set GPIO values is not
> recommended AFAIR.

This pin functions similarly to usb-1-ss0-sbu-state; it controls the 
data switch between signals from the USB connector and WLAN data.

> 
>> +		pins = "gpio225";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +		output-high;
>> +	};
>> +};
>> +
>> +&uart14 {
>> +	status = "okay";
>> +
>> +	bluetooth {
>> +		compatible = "qcom,wcn7850-bt";
>> +		max-speed = <3200000>;
>> +
>> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
>> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
>> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
>> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
>> +	};
>> +};
>> +
>> +&uart21 {
>> +	compatible = "qcom,geni-debug-uart";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&usb_1_ss0_dwc3_hs {
>> +	remote-endpoint = <&pmic_glink_ss0_hs_in>;
>> +};
>> +
>> +&usb_1_ss0_hsphy {
>> +	phys = <&smb2360_0_eusb2_repeater>;
>> +};
>> +
>> +&usb_1_ss0_qmpphy_out {
>> +	remote-endpoint = <&pmic_glink_ss0_ss_in>;
>> +};
>> +
>> +&usb_1_ss1_dwc3_hs {
>> +	remote-endpoint = <&pmic_glink_ss1_hs_in>;
>> +};
>> +
>> +&usb_1_ss1_hsphy {
>> +	phys = <&smb2360_1_eusb2_repeater>;
>> +};
>> +
>> +&usb_1_ss1_qmpphy_out {
>> +	remote-endpoint = <&retimer_ss1_ss_in>;
>> +};
>> +
>> +&usb_1_ss2_dwc3_hs {
>> +	remote-endpoint = <&pmic_glink_ss2_hs_in>;
>> +};
>> +
>> +&usb_1_ss2_hsphy {
>> +	phys = <&smb2360_2_eusb2_repeater>;
>> +};
>> +
>> +&usb_1_ss2_qmpphy_out {
>> +	remote-endpoint = <&retimer_ss2_ss_in>;
>> +};
>> +
>> +&usb_2_hsphy {
>> +	phys = <&eusb5_repeater>;
>> +
>> +	pinctrl-0 = <&wcn_usb_sw_n>;
>> +	pinctrl-names = "default";
>> +};
>> +
>> +&usb_mp_hsphy0 {
>> +	phys = <&eusb6_repeater>;
>> +};
>> +
>> +&usb_mp_hsphy1 {
>> +	phys = <&eusb3_repeater>;
>> +};
>>
>> -- 
>> 2.34.1
>>
> 

-- 
Best Regards,
Yijie


