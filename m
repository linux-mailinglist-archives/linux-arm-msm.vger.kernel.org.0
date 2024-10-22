Return-Path: <linux-arm-msm+bounces-35392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA6A9A9F8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 12:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3BA41C22588
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D882198E91;
	Tue, 22 Oct 2024 10:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ixlqDIyq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5C9145B24;
	Tue, 22 Oct 2024 10:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729591604; cv=none; b=Qp69aQ/kDGo+qks7rNuHIKPGy16RJUWVfiU8wqS2qXBgGKpKH/YrUeRaAmyRcQoZ6tpMsYfSlVR0B+XIiZjV13GU5fDaVvhWzQF3SqKHhREaSJTLkDtYIC7+W8KEhgiITBArnDG3x60nOzocl4XstUhmYsqvnx5rr/zdJ8OW2aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729591604; c=relaxed/simple;
	bh=iYf+10kMeSBOR6aGGLTqZ8pe70W5rTjB8JNl2JJ22KA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GTJVznKahPYN7sxdiTJn8wuSKTmjOPxhT6//xM2oRvN/JHaODgaHOrclYGbbxp7JDGEiCP2W08NAVvLcMTy8UbFjpUawrhMFC7yJFwnNcq0tqYU4HaQYTMx3sBJakHE0jaPyB+sGP99j3P402e3HMknNwXT41pxXKNpf25g1zu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ixlqDIyq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LMaVW1013484;
	Tue, 22 Oct 2024 10:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rCcLkvtvP8ut4/eKH4CzWfv1HSNFUWFFAHcqRVEvIDw=; b=ixlqDIyqUTp98y4t
	fyjsbF2J52tbsphyZZBvY2spTctAWDrnGIgCSL35OLLvi3kkkLbGpLUXhBr58Qd2
	PKyL5wHFNMY1VXIgZ9ZP58Kai6tUQpFRnZrCsS9DxqTmQ3JqyvtO4hsAVuF9hxPd
	NB2uN5NS3gDrrzbuug425+3oGlJlh4X5C7hY8HctgkBuUUS4/wbVzRfUMVJI3QLo
	ljG7NFzFYe5b1T1Sd0FeMew6gjZDOCPz/lO+A3LrwFxvwkkDAbgQvUQy0Au2BS6T
	MFyH5GX/TYJCwWDdwcw8WsyLtmAACGzQfUPPL2usJb1hX02gyp1IzGVxM9YaZluu
	mGZHgQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6rbfumh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 10:06:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MA6cY4023898
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 10:06:38 GMT
Received: from [10.218.29.219] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 03:06:34 -0700
Message-ID: <bc72b450-4cd8-4cd4-b160-36fb6031d035@quicinc.com>
Date: Tue, 22 Oct 2024 15:36:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: enable Bluetooth
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <quic_mohamull@quicinc.com>,
        <quic_hbandi@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241010105107.30118-1-quic_janathot@quicinc.com>
 <jywgmxfhzwvoknpar7hr4ekfnajauzgk5q3bewgpdv2ghpemtw@4vvhit4jb3tm>
Content-Language: en-US
From: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
In-Reply-To: <jywgmxfhzwvoknpar7hr4ekfnajauzgk5q3bewgpdv2ghpemtw@4vvhit4jb3tm>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FyBChjC-ursg6lTJ-vi57w85RpfO2jay
X-Proofpoint-GUID: FyBChjC-ursg6lTJ-vi57w85RpfO2jay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxlogscore=961 lowpriorityscore=0
 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220064



On 10/10/2024 6:09 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 10, 2024 at 04:21:07PM GMT, Janaki Ramaiah Thota wrote:
>> Add Bluetooth and UART7 support for qcs6490-rb3gen2.
>>
>> Signed-off-by: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 122 ++++++++++++++++++-
>>   1 file changed, 121 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 0d45662b8028..c0bc44be7dd4 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: BSD-3-Clause
>>   /*
>> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   /dts-v1/;
>> @@ -32,6 +32,8 @@
>>   
>>   	aliases {
>>   		serial0 = &uart5;
>> +		bluetooth0 = &bluetooth;
>> +		serial1 = &uart7;
>>   	};
>>   
>>   	chosen {
>> @@ -688,6 +690,39 @@
>>   	status = "okay";
>>   };
>>   
> 
> Please review the file carefully and find the right spot for these
> parts.
> 

Thanks for the review, corrected in [PATCH v3].

>> +&qup_uart7_cts {
>> +	/*
>> +	 * Configure a bias-bus-hold on CTS to lower power
>> +	 * usage when Bluetooth is turned off. Bus hold will
>> +	 * maintain a low power state regardless of whether
>> +	 * the Bluetooth module drives the pin in either
>> +	 * direction or leaves the pin fully unpowered.
>> +	 */
>> +	bias-bus-hold;
>> +};
>> +
>> +&qup_uart7_rts {
>> +	/* We'll drive RTS, so no pull */
>> +	drive-strength = <2>;
>> +	bias-disable;
>> +};
>> +
>> +&qup_uart7_rx {
>> +	/*
>> +	 * Configure a pull-up on RX. This is needed to avoid
>> +	 * garbage data when the TX pin of the Bluetooth module is
>> +	 * in tri-state (module powered off or not driving the
>> +	 * signal yet).
>> +	 */
>> +	bias-pull-up;
>> +};
>> +
>> +&qup_uart7_tx {
>> +	/* We'll drive TX, so no pull */
>> +	drive-strength = <2>;
>> +	bias-disable;
>> +};
>> +
>>   &qupv3_id_0 {
>>   	status = "okay";
>>   };
>> @@ -719,12 +754,97 @@
>>   &tlmm {
>>   	gpio-reserved-ranges = <32 2>, /* ADSP */
>>   			       <48 4>; /* NFC */
>> +	bt_en: bt-en-state {
>> +		pins = "gpio85";
>> +		function = "gpio";
>> +		output-low;
>> +		bias-disable;
>> +	};
>> +
>> +	qup_uart7_sleep_cts: qup-uart7-sleep-cts-state {
>> +		pins = "gpio28";
>> +		function = "gpio";
>> +		/*
>> +		 * Configure a bias-bus-hold on CTS to lower power
>> +		 * usage when Bluetooth is turned off. Bus hold will
>> +		 * maintain a low power state regardless of whether
>> +		 * the Bluetooth module drives the pin in either
>> +		 * direction or leaves the pin fully unpowered.
>> +		 */
>> +		bias-bus-hold;
>> +	};
>> +
>> +	qup_uart7_sleep_rts: qup-uart7-sleep-rts-state {
>> +		pins = "gpio29";
>> +		function = "gpio";
>> +		/*
>> +		 * Configure pull-down on RTS. As RTS is active low
>> +		 * signal, pull it low to indicate the BT SoC that it
>> +		 * can wakeup the system anytime from suspend state by
>> +		 * pulling RX low (by sending wakeup bytes).
>> +		 */
>> +		bias-pull-down;
>> +	};
>> +
>> +	qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
>> +		pins = "gpio31";
>> +		function = "gpio";
>> +		/*
>> +		 * Configure a pull-up on RX. This is needed to avoid
>> +		 * garbage data when the TX pin of the Bluetooth module
>> +		 * is floating which may cause spurious wakeups.
>> +		 */
>> +		bias-pull-up;
>> +	};
>> +
>> +	qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
>> +		pins = "gpio30";
>> +		function = "gpio";
>> +		/*
>> +		 * Configure pull-up on TX when it isn't actively driven
>> +		 * to prevent BT SoC from receiving garbage during sleep.
>> +		 */
>> +		bias-pull-up;
>> +	};
>> +
>> +	sw_ctrl: sw-ctrl-state {
>> +		pins = "gpio86";
>> +		function = "gpio";
>> +		bias-pull-down;
>> +	};
>>   };
>>   
>>   &uart5 {
>>   	status = "okay";
>>   };
>>   
>> +&uart7 {
>> +	status = "okay";
>> +	/delete-property/interrupts;
>> +	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
>> +				<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
> 
> Why? Is it a UART interrupt? Or a BT-related interrupt?
> 

it is HS UART interrupt for BT.

>> +	pinctrl-names = "default", "sleep";
>> +	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>,
>> +			<&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
>> +
>> +	bluetooth: bluetooth {
>> +		compatible = "qcom,wcn6750-bt";
> 
> Please use pwrseq and define the PMU unit.
> 

we are in process of migrating to pwrseq, mean while can we merge this 
change ?

>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&bt_en>, <&sw_ctrl>;
>> +		enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
>> +		swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
>> +		vddaon-supply = <&vreg_s7b_0p972>;
>> +		vddbtcxmx-supply = <&vreg_s7b_0p972>;
>> +		vddrfacmn-supply = <&vreg_s7b_0p972>;
>> +		vddrfa0p8-supply = <&vreg_s7b_0p972>;
>> +		vddrfa1p7-supply = <&vreg_s1b_1p872>;
>> +		vddrfa1p2-supply = <&vreg_s8b_1p272>;
>> +		vddrfa2p2-supply = <&vreg_s1c_2p19>;
>> +		vddasd-supply = <&vreg_l11c_2p8>;
>> +		max-speed = <3200000>;
>> +	};
>> +};
>> +
>>   &usb_1 {
>>   	status = "okay";
>>   };
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
> 

--
Thanks
Janakiram


