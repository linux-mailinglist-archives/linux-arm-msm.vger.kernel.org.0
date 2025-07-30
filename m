Return-Path: <linux-arm-msm+bounces-67043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEC3B156E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 03:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E4D03BD9AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 01:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8072F6DCE1;
	Wed, 30 Jul 2025 01:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHHC1Q4e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE8D8F54
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 01:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753837658; cv=none; b=iNYpUMhxpPgsECeyd4YoYay/8SzGTxNm2ALTKZIMj+lq8rpG/qnFenLH+RVLq/paYT3Ix/614Bouhkps504HKaylS2ZcBkcf+6wp0EN7WOl9jUBAMRC6AYP53zznp9+1MNFM+qFElnJ4dkW23e98I1cqaJ+2Ns6bX9Um26+st2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753837658; c=relaxed/simple;
	bh=0o5GCuxJ26hbOMWxYpDUV565+NjJFqiiZTwIzjCSQMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tpWQJrtIhVedzlU5vvoH3SO/RecYP6ArRZluz6G91BCovC/XR7h7RjlCHnXG8zwhfHXNs6RGnHJ6VcDR5OmPNR+nCvyyc2n9B+Zaj1vRUybD/fSQuLe7Fds5YlplA1VG1BigpaBpNwH278ry6Dg91W5CYC5DpP5GfaMFIJ1mk1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHHC1Q4e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TIS9U1023465
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 01:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9b8nceYhkIBnOga0zcO3rPr5yt0ZEpFTBjcmcJTA57g=; b=YHHC1Q4e+vC+jtZb
	es83dwMH3fkMCyJxFdJOLJMUa5/tItHPMX+mdCsETk7dqp6DEhG149ywZCBxUma4
	Zs/zslV4SYzVnUiI5n87yuTX2slf4dF2ZFOpEephgOevIvMdoJ5mwfXtGHX7Eg8Q
	Hz4ZCjVCY05hbPB8m1ZqHaYDaSFGfbalP5ajfoIrg3kTEGh2ezbJ7hGfNo7RlaNB
	PGIGafQqqxPM25Y8mQ2JgsS+wdTUoWFA9fpkZD4tiRpMVy02vK6KRhsR8vNfdmSL
	8KnyXYoOm/Gkmljp/jmhSOFCJL/nIdYnlz1sV90DYHG8PbBN+O5jMIpcDPI5SoTl
	mkCuAQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qsx9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 01:07:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24004ac2ecdso41408435ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 18:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753837654; x=1754442454;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9b8nceYhkIBnOga0zcO3rPr5yt0ZEpFTBjcmcJTA57g=;
        b=sI2uypFg8osJ5q7OmFMa11wdGtrtgH9dmY0hc6EaLJ5fK2XIhV8R2z+aaKUh6O6cK7
         Mf2VAPBLaVZEhVqPUCQtTv0vYf+Z1nU6cFaBGkqpQFq/9R/exAFZefJrxPNOlKyCqwun
         lmi6Ha3+03lfNpUSgazufmuVlpfMsRWyuFg8w3SgnTMsaUW/0eaiGixPFGeBcKKv5Fws
         Z7pd52IbGtTEB43v/oJHTnvOZnHTLG+/tSfZhJVwwiepQDGAoi4mqD9rG3z9Jj8MSym4
         TGVatbX0Kyo76wDjouToj+DkZ60tfilcZTwhGsq4aPu0mqmZqSaW4HwkFuIigro3b/Ta
         jsoA==
X-Forwarded-Encrypted: i=1; AJvYcCXcN++15av5Lxwvtn8uy9ol1EQkbpSxfTxM3bZ2pYq7dH9Huv033o0cq2xygfhOlTcOJz6HEh+Y1LVrHENI@vger.kernel.org
X-Gm-Message-State: AOJu0YwigX1lmja+JnJEyRM3obfbzLdXRi3U35Kq71kQcwbxHIGo9TlD
	bx/E7jZbTBNIniL3FaVDjNuk+glC+3+pr2mCJDwrNgMSz4GbKpErtSx4HNYkUyMAtSLy1AL50hZ
	uFuY6VaVa19ihBKhUvu0YKzSk+5rpJjozTYvhLoeM5JlEAMQC9W/RzS09OnbCv3eEVelJ
X-Gm-Gg: ASbGncuOe9PdBgyevcoQ2b4B6V4xoeMlxrIi/CSs0OSw8ad7/VXF+JnobUZ5RST47nW
	XNctkEiGJ/3wFyhdW5mViKhIfPb7kR3TKvHZ5DbINz4HEF9vkNOa3iSh5oMHUCKu0WddwBM/ynf
	QQ6O5tZ/AS2yIxNTB0nancscTHuDefnaWHCbmBwpkXAUId5N2D3ud+zq7tR8vstti6SvjWoY0mS
	zxBeD7Xvk+mMtOeRy+n63/5jgreD+k3I3Fuqsu9nPUQXHlkLsXDMbbb/SEXE7zo3BYjqeaDbVff
	/K8ZISr0rWsdgw7Zhu7dP8CeY1kmCYLhhoJI3AGGKflbW0QwvOKUDoU+GDdmDJpybWoafRtSr7s
	HkKQvZXBc3euJzx14yGY/iwYqxlVs
X-Received: by 2002:a17:903:1aa5:b0:240:41a3:c18a with SMTP id d9443c01a7336-24096a72c27mr18873275ad.6.1753837653943;
        Tue, 29 Jul 2025 18:07:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHN55eG7g7A+6uencanHV1jkt67ryQJNo1LEwo9LKkb13/fdpc7dlLE5jk48aKDE/Hm2AdGWg==
X-Received: by 2002:a17:903:1aa5:b0:240:41a3:c18a with SMTP id d9443c01a7336-24096a72c27mr18872875ad.6.1753837653350;
        Tue, 29 Jul 2025 18:07:33 -0700 (PDT)
Received: from [10.133.33.126] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2408cc22cecsm12287315ad.162.2025.07.29.18.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 18:07:32 -0700 (PDT)
Message-ID: <1e34840a-d300-4f8c-94be-2ba63a86a020@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 09:07:26 +0800
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDAwNCBTYWx0ZWRfX9GBESxW6BEzh
 d4mDdoOY3kQvITyoHpvBQi7TI3yaUKcUvUQfCvC9Jtl6f1RXpSHLOqYR7MfnXXrsyKrmPgLg5A1
 2QvgzQuSxCqv0gQDUzyuBKi2qauy0r6VIZIV19ncM0BdOJbw8c+3xsUUvpsa83yWCkvrnKeeHm1
 7iPXCIequCfi9q5LWfAVgeSQOLHvZyaSuyEH+xC59DpYGeSo1qRWUFdJQ5hVwnK+6bCLcbppX1W
 FPcc4JrQp533bQ15yFnebXLdxdSBCj0PQbKuC870IU/s9sy9XtRzdrH1T78bKDnl6qy98U/LjCT
 UVr6+NGqh7KSylyFWw9bDiEIbilRO3R6/3OjDSGZf1cQMF8uJMyA7oSPDNcevKWqn0MjSgQx9F3
 XML/kuLELJN3uScTXkqKQG71dcuLWup/jZgMDdlE6/UniPVRdF2jdLIain7v/8I04cZIYEok
X-Proofpoint-ORIG-GUID: CO0wiuqVSqRzWFoxM7rHf2XhAYe_TNZQ
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=68897057 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=N3c1US3UlBgHhiaUDIUA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: CO0wiuqVSqRzWFoxM7rHf2XhAYe_TNZQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_05,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300004



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

Sure, I'll take care of it.

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


