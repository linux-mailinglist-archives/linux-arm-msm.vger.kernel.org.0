Return-Path: <linux-arm-msm+bounces-46236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B98C7A1D6B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14723164DFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C805B1FF7B4;
	Mon, 27 Jan 2025 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YPjvXoNJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09781FDE28;
	Mon, 27 Jan 2025 13:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737984408; cv=none; b=OpXx+SMnLWv4Kp5JGRjJVMomrWCcukyyrnqCjENPG8OdfzdOctEtJ9wGF57YfmXLG9Uq/bzeQjzJ9aaMyNseNzX6DDZ2hp6oPHpIiAW3KnjlRAZTJOYtbitvRzcn9/jUJTp8wkGTrHWpOOo49gFDk3n+fBFTQxRODI1l8pirXoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737984408; c=relaxed/simple;
	bh=h0qT8iQaaqvhxmNxxU3dstNgJHiEo3wYtKUz1k0RERU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L31F5izuIKbN4LPLacospsCwbmK3JtgtH5oYWnQps3xGwB+fKrOJoImdyfE/Pc6eT2SxRVUrmYgEh6BntN5anBlPxS6Yukrmwkq+9oNOmQNg5WH+j3vaYR27wuiRIxHjNmTyrTNPxKzjgOqFBgKYGt2LpVlKVbukNEExZbnRKpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YPjvXoNJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R0tDO8001841;
	Mon, 27 Jan 2025 13:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBirlOQuqZ9z97hxsMQLPN82U5nWcgrsp+jEESJprQ0=; b=YPjvXoNJBn2vMXt+
	KL6CNuDsNmOpP8SvQLH0vV0BxJH3J3+4/7K8pKAxFHNJauPUky4MqTu05Hj/fOTt
	hyVzimJ0uyYynQQl2T3Dhaid0/p0Oq+FkiiRUDaTa3PgyG6PQ5OVxItbJG1L9+Yw
	yxmgEGpZhhZMTiX6VbZbNt0RxK6i9ZEYA7PPdWPDL5H8l8AZSa9Mj52Fc6EFox+b
	x18xtRvM1pMJRz+oLTGe5IbXQHUikEmRVD63rkdx5v33M0j2Kfn2yzocHko6OlZa
	38Qt2knM6Rl7FsafifryC7wn17JWX/Z7234bZVsH/81NJgdZPqek/D2yv3J5N8gu
	6qx4mQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44dwg0sf0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 13:26:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50RDQe0j024936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 13:26:40 GMT
Received: from [10.217.217.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 27 Jan
 2025 05:26:37 -0800
Message-ID: <1add841d-84d8-48b7-af79-f81c7bd893bd@quicinc.com>
Date: Mon, 27 Jan 2025 18:56:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcs6490-rb3gen2: Add vadc and adc-tm channels
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: <andersson@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <krzk+dt@kernel.org>,
        <quic_jprakash@quicinc.com>, <quic_kamalw@quicinc.com>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <konradybcio@kernel.org>
References: <20250124070200.3969230-1-quic_kotarake@quicinc.com>
 <173773232224.1805161.13299626383351520341.robh@kernel.org>
Content-Language: en-US
From: Rakesh Kota <quic_kotarake@quicinc.com>
In-Reply-To: <173773232224.1805161.13299626383351520341.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VBu1Iv8lkn4sEHXohOKXJiq6eV1MDNCl
X-Proofpoint-ORIG-GUID: VBu1Iv8lkn4sEHXohOKXJiq6eV1MDNCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_05,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=762 impostorscore=0 adultscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270107


On 1/24/2025 8:56 PM, Rob Herring (Arm) wrote:
> On Fri, 24 Jan 2025 12:32:00 +0530, Rakesh Kota wrote:
>> Add support for vadc and adc-tm channels which are used for
>> monitoring thermistors present on the platform.
>>
>> - Add the necessary includes for qcom,spmi-adc7-pm7325 and
>>    qcom,spmi-adc7-pmk8350.
>> - Add thermal zones for quiet-thermal, sdm-skin-thermal, and
>>    xo-thermal, and define their polling delays and thermal sensors.
>> - Configure the pm7325_temp_alarm node to use the pmk8350_vadc
>>    channel for thermal monitoring.
>> - Configure the pmk8350_adc_tm node to enable its thermal sensors
>>    and define their registers and settings.
>> - Configure the pmk8350_vadc node to define its channels and settings
>>
>> Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 114 +++++++++++++++++++
>>   1 file changed, 114 insertions(+)
>>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>
>    pip3 install dtschema --upgrade
>
>
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250124070200.3969230-1-quic_kotarake@quicinc.com:
>
> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2: pwm:nvmem: [[346, 347]] is too short
> 	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm: nvmem: [[346, 347]] is too short
> 	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@0: adc@3100: 'oneOf' conditional failed, one must be fixed:
> 	'#address-cells', '#size-cells', 'channel@103', 'channel@144', 'channel@146', 'channel@44', 'pmk8350-die-temp@3' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	'#address-cells', '#size-cells', 'channel@103', 'channel@144', 'channel@146', 'channel@44', 'interrupts', 'pmk8350-die-temp@3' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	'pmk8350-die-temp@3' does not match any of the regexes: '^channel@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 	['qcom,spmi-adc7'] is too short
> 	'qcom,spmi-adc7' is not one of ['qcom,pm8226-iadc', 'qcom,pm8941-iadc']
> 	'qcom,spmi-adc7' is not one of ['qcom,pmi8998-rradc', 'qcom,pm660-rradc']
> 	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: adc@3100: 'pmk8350-die-temp@3' does not match any of the regexes: '^channel@[0-9a-f]+$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/iio/adc/qcom,spmi-vadc.yaml#

Thank you for your review..!
And After updating the dt-schema, I am also encountering the same error
According to the documentation, I need to change the pmk8350-die-temp 
channel name to channel@3. I will correct this in the next patch set.

>
>
>
>

