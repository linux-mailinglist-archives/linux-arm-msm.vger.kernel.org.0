Return-Path: <linux-arm-msm+bounces-71210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 728EFB3B01C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 02:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F9387C7205
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 00:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C56E1990D9;
	Fri, 29 Aug 2025 00:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRwOjidb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E098528E
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 00:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756429025; cv=none; b=i3ePUm8/PVL3Gs6bxk+6YasVBnZrKINr2qVFy6AN7XPwevXtD6LbpYdm0z5ygVCX4DzzU99S8NENwueX632m7INbC+KY8DBOe/jUzBAjsKceLxw8LK7PYjrxWkz2BUZzazgzIr2KDptCHEmff4QtO1A1PNtQUSrBWYrMVZhnHjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756429025; c=relaxed/simple;
	bh=5VpBiD1bh8tENaMhlfTz0Xgm05LQYN+MAMED3oSVybY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y1njYgDMVym7WZ//reIqPDkaQ5jsCvyGSL0F9LURGXDMQZpmIdYLLmI8/TE2mJZYDrXXhkFI9eTgVheqyKJpb6U4590Ma11BgFhlo16FRIDUL4/Bm6quofNU4/cA/CyaZWde505gDn2l9PUaYeKemHPxPomAipqhgAz2FfqbKmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRwOjidb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWgCZ018233
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 00:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IKiaxI/p6jV7V+oPFUa1K2Xd/nFwPPTLeu8CrcN5bXE=; b=SRwOjidbtIHaO8pJ
	cpOfV2tuKn3E6c1mhVUDorC2y9mjTZjPNX21mAN/eLYQX0RfHdBRMAlmDyzJv9nC
	mvV0Mg6bxKCYf5aWiHtIPC7Np7VOtiACnDIHsaV4AwEQMoRDRtu2or5WJlyWzQum
	dQetYUpH67u3Z+Oag9qrVQUxSq7to4N35fpFds26Y6mq/91RyoUuIn/SW050Wpw/
	REV/tZ5nz93wQaqK64BbRw0QslFr22Xmq2dN+IeOXu3vgb9WhyYTHTNzPzXfPvYX
	8OG3aTKHZJtmeEfzICblC7N+BwnZ2+ny3mbI1kOuPJQATjkAPVaNFvVx+bZRXUq6
	/d48hQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tp5k27aa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 00:57:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2461c537540so20919435ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 17:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756429022; x=1757033822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IKiaxI/p6jV7V+oPFUa1K2Xd/nFwPPTLeu8CrcN5bXE=;
        b=dGA8htad/fKEHMRLPT0n+awFrg2qt4jAhCa+/0Ni6KbjzFt9sn3aiC0uJJS7Fd3vKc
         vMoUYka+CPyGAR+CzKonE8Mev+RqA22mnbaiVrd6P6eXGJBNUekdj10Rokz5Jvpn7g4F
         v7h3tIj6y6LKEX+HcHVMUH1+3BJ6G9AvhG+ZK2zOQ5SpZnIFHR5EfW/9S74HDM3Xu17Z
         N6Y1LJbnfyFWSDH4dhMjYuKcyM5u9ETraCXB+3FFCjsTS4g3e1IGuyDw6WoeBGSZvwY3
         s5vVSVf/+3J6a5RL2y74FNcd2eWp8d71mbTCLHHTDEvDjNVE/TOjpL79V5JJjq4avAmn
         y35A==
X-Forwarded-Encrypted: i=1; AJvYcCXpsLEvKOktQMZbpdrH6w/CvkwakqP4n175Yn/xxjbOw3nXZUdTuny9UgfJpTy5YQghfDtCo8Qzx6p+6dGx@vger.kernel.org
X-Gm-Message-State: AOJu0YyCAOwb2GYi88TFwMPrCv4THIrtjoglLc21G5dd79417YN4A9NR
	MYHVMU8Xou+C5VCtizX9mbvoaVIkcsqZvnyJEWF0Q2b+hrP1EEyW7cIStNCqfArc0JFn/4FMPIQ
	MMbl1EEBz3sGNcDXa19NtHgEmTeT/n7Bhc2vf5Z/2OHmdC6cNWrRZ2KF9NNhpKi4KApaG
X-Gm-Gg: ASbGncvr/5QPgOTcnXE76cyzqHTfGLjl24eAjff0bjIFVyox6SWvcywH0WP9xahxSE9
	XhKucNjY+jRkbGOzwjkqk8HTbYwlypZryW94sDliKrA/SRX6ebpHq6RUtWs96l+UHX/ZZqqwtBs
	AmCwIc+dJQ4zEaJdNmvk1B9W86P7d6kRDqSr4UugWXEeEH9txwdnrYOYm1VNL4Q0itqyBvmuyXS
	Mid/e8mRHiKrd++xSz7/btRpanDyZEp6Rxy7ihbAOLujnBRiCMFBJXILUiXEstcngM6CZUdK5Zr
	SlXLI7/5IDzxtPOHgcZn4BvcJfikC+gom1ZVpU36p0GY26i9a19qcU4isIMKHestZSJDSQnEerE
	2h9Ozt86Xg37y5cvb57p61nGxPGwRZQaJzQ==
X-Received: by 2002:a17:902:f64a:b0:246:8b9d:2519 with SMTP id d9443c01a7336-2468b9d27e8mr234886625ad.23.1756429021591;
        Thu, 28 Aug 2025 17:57:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTJFC4qjj4YqaBpxnHZ+CcQLia3qSMORPl2dhJnZ/UiAPbctm4+aTBBM3i8lHcGkNVdMU7ow==
X-Received: by 2002:a17:902:f64a:b0:246:8b9d:2519 with SMTP id d9443c01a7336-2468b9d27e8mr234886345ad.23.1756429021115;
        Thu, 28 Aug 2025 17:57:01 -0700 (PDT)
Received: from [10.133.33.203] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e546sm624210a12.4.2025.08.28.17.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 17:57:00 -0700 (PDT)
Message-ID: <744e56ac-5421-49af-832b-61142ebb681c@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 08:56:55 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250828-hamoa_initial-v8-0-c9d173072a5c@oss.qualcomm.com>
 <20250828-hamoa_initial-v8-3-c9d173072a5c@oss.qualcomm.com>
 <hbvc72fy2bnx5ggmmcpbrgy5jkhrlvewfv3ofh7z6blnj5l27e@4m2js7nf3g6b>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <hbvc72fy2bnx5ggmmcpbrgy5jkhrlvewfv3ofh7z6blnj5l27e@4m2js7nf3g6b>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V9F90fni c=1 sm=1 tr=0 ts=68b0fade cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=Cujq2m1fB0P6q8KZPf8A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA5NSBTYWx0ZWRfX0mHU1Nk9kbuS
 guu5/nVXVBnOZf8+v+N+FC7LGZYCYQ1BI4mOdGhTFbxd8hSolmmI1eoCG7/LMqhwRIdWRh4V9An
 psy5uIzkELus+VkVQ/arPToh9mizaIZuCyeHGhLjqUhEgd/EFz58M+JFio9ba/IpXEkQXOvXhNq
 24nR9bf/sAKeEXbmMpz1ZR2ha4amiQuUsnUBPf+3Hlpydt8zcFwri2M6KYD57wrgYd4FiXrzTWm
 zarRV36ekVc023ILOkrTaRJvtuNWCoPhsdyHv7FpqeOj2XZHBm3lBIwjlw0UZ8jzihdTnJt1pMD
 NT7KtyKkNnM0SKU9+8ZAbWkmJGrPM/htBThx7rKxe6UKAXIUcdkJQm1erfFzMJnxNzNk1vnZh72
 RrEUuYqU
X-Proofpoint-ORIG-GUID: ySgEeZzhr1lKStt9etiHYqLWh48C5aEB
X-Proofpoint-GUID: ySgEeZzhr1lKStt9etiHYqLWh48C5aEB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508280095



On 2025-08-28 19:15, Dmitry Baryshkov wrote:
> On Thu, Aug 28, 2025 at 12:48:47PM +0800, Yijie Yang wrote:
>> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
>> the Hamoa IoT SoM and a carrier board. Together, they form a complete
>> embedded system capable of booting to UART.
>>
>> This change enables the following peripherals on the carrier board:
>> - UART
>> - On-board regulators
>> - USB Type-C mux
>> - Pinctrl
>> - Embedded USB (EUSB) repeaters
>> - NVMe
>> - pmic-glink
>> - USB DisplayPorts
>> - Bluetooth
>> - Graphic
>> - Audio
>>
>> Written in collaboration with Quill Qi (Audio) <le.qi@oss.qualcomm.com>,
>> Jie Zhang (Graphics) <quic_jiezh@quicinc.com>, Shuai Zhang (Bluetooth)
>> <quic_shuaz@quicinc.com>, and Yongxing Mou (USB DisplayPorts)
>> <quic_yongmou@quicinc.com>.
>>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile          |    1 +
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 1247 ++++++++++++++++++++++++++++
>>   2 files changed, 1248 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 94a84770b080..5e19535ad63d 100644
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
>> index 000000000000..b1a8380d6639
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> @@ -0,0 +1,1247 @@
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
>> +	vreg_edp_3p3: regulator-edp-3p3 {
> 
> Here is a list of the top-level nodes defined in this DT. Does it look
> sorted?
> 
> 	aliases
> 	chosen
> 	pmic-glink
> 	regulator-edp-3p3
> 	sound
> 	regulator-vph-pwr
> 	regulator-nvme
> 	regulator-rtmr0-1p15
> 	regulator-rtmr0-1p8
> 	regulator-rtmr0-3p3
> 	regulator-rtmr1-1p15
> 	regulator-rtmr1-1p8
> 	regulator-rtmr1-3p3
> 	regulator-rtmr2-1p15
> 	regulator-rtmr2-1p8
> 	regulator-rtmr2-3p3
> 	regulator-wcn-3p3
> 	usb-1-ss0-sbu-mux
> 	regulator-wcn-0p95
> 	regulator-wcn-1p9
> 	regulator-wwan
> 	audio-codec
> 	wcn7850-pmu
> 

I'll get them sorted.

> 

-- 
Best Regards,
Yijie


