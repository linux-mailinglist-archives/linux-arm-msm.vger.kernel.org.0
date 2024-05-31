Return-Path: <linux-arm-msm+bounces-21204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF80F8D5CCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 10:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F26431C21344
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 08:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B88150992;
	Fri, 31 May 2024 08:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ec2Jh6WU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A73150985;
	Fri, 31 May 2024 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717144555; cv=none; b=VaB1P+Aj80Jz/V+FAua0OtO2GK1DqdXid/vHOZNd+IAtYPspf14h2VDXVcQyQOCgzHk+V/9FEnTFDrlqq4v13SEOlm2Ts2gOMStoZo4r4ASj33E3SXg38nhWWjaUudm44C0X74EHa0nvChznFlSSxNj34BZQL4b1Hh9+cLOlWbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717144555; c=relaxed/simple;
	bh=84Nm2YWQ5fO4QCzYRqYrIDHylCt4gvVooCTA+Wm8L54=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gTFP8sxkRYbWCHseXgJj9kLcPLDc7eVksugclg3yRIIUeGk66sy85Lg25/E3Va4FzMYBPex65f9ObocatZEH3pGXxIF5MqRS3eoOQREQi6nR/UoRozUMb3Ukt+qpMeZLB8CaZT15I+8BikewLPWIx0IpwfrII57KcPMP4QtAOTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ec2Jh6WU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V8CDMY010291;
	Fri, 31 May 2024 08:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dyan4G698Omco8Bulo5Sv+xvqHs+ooLOsBp/5AYjPmI=; b=ec2Jh6WU0Ttqn35o
	0Qajs+FsqVxabKCOhVcHCHlyagLT26qfgbpj4dz2KI7b28xpqPpAXXU9WSQCwBeE
	TmxyDEtpqTQp3UBsv3eeyHhu3X6t5lWwbLiPgwG3SKHPXj4g7oS9O2vp8DjSrIgT
	7CH4aupDxJj6TYu208ISjfzMttQ0OhdZcw+5k+ofb0A842HuOisovFKhJhHSs4za
	xL6g7vN1gFNGQd/DqS/t2aHbfGbnc+wvNIIOEs/uv4uX/0Qq/N+f1eCs57mIKpYt
	143t/bcoGNDSIrOPl5TCYsWi4gThykIJBIVoCFSXsIV4SVxCPvGfjRptPSKh+KND
	fgRk2w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ybadxedw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 08:35:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V8ZloU031219
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 08:35:47 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 01:35:40 -0700
Message-ID: <205de8b7-507f-45c9-83ce-6eceb1466cb2@quicinc.com>
Date: Fri, 31 May 2024 16:35:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] arm64: dts: qcom: aim300: add AIM300 AIoT
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Qiang Yu <quic_qianyu@quicinc.com>,
        Ziyue Zhang
	<quic_ziyuzhan@quicinc.com>, <quic_chenlei@quicinc.com>
References: <20240529100926.3166325-1-quic_tengfan@quicinc.com>
 <20240529100926.3166325-5-quic_tengfan@quicinc.com>
 <s5gt3p6zsd5ebrkop4dhd33tykln33f6ahu3pibymecxsmakyd@lg5wfgec6dat>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <s5gt3p6zsd5ebrkop4dhd33tykln33f6ahu3pibymecxsmakyd@lg5wfgec6dat>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Gv9fmC6ds-DDJJ7xdKga8-Gdz-CjJBwt
X-Proofpoint-GUID: Gv9fmC6ds-DDJJ7xdKga8-Gdz-CjJBwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_04,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=841 malwarescore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405310063



On 5/29/2024 11:18 PM, Dmitry Baryshkov wrote:
> On Wed, May 29, 2024 at 06:09:26PM +0800, Tengfei Fan wrote:
>> Add AIM300 AIoT Carrier board DTS support, including usb, UART, PCIe,
>> I2C functions support.
>> Here is a diagram of AIM300 AIoT Carrie Board and SoM
>>   +--------------------------------------------------+
>>   |             AIM300 AIOT Carrier Board            |
>>   |                                                  |
>>   |           +-----------------+                    |
>>   |power----->| Fixed regulator |---------+          |
>>   |           +-----------------+         |          |
>>   |                                       |          |
>>   |                                       v VPH_PWR  |
>>   | +----------------------------------------------+ |
>>   | |                          AIM300 SOM |        | |
>>   | |                                     |VPH_PWR | |
>>   | |                                     v        | |
>>   | |   +-------+       +--------+     +------+    | |
>>   | |   | UFS   |       | QCS8550|     |PMIC  |    | |
>>   | |   +-------+       +--------+     +------+    | |
>>   | |                                              | |
>>   | +----------------------------------------------+ |
>>   |                                                  |
>>   |                    +----+          +------+      |
>>   |                    |USB |          | UART |      |
>>   |                    +----+          +------+      |
>>   +--------------------------------------------------+
>>
>> Co-developed-by: Qiang Yu <quic_qianyu@quicinc.com>
>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> Co-developed-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
>> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>   .../boot/dts/qcom/qcs8550-aim300-aiot.dts     | 322 ++++++++++++++++++
>>   2 files changed, 323 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dts
> 
> [trimmed]
> 
>> +&remoteproc_adsp {
>> +	firmware-name = "qcom/qcs8550/adsp.mbn",
>> +			"qcom/qcs8550/adsp_dtbs.elf";
> 
> Please excuse me, I think I missed those on the previous run.
> 
> adsp_dtb.mbn

Currently, waht we have released is adsp_dtbs.elf. If we modify it to 
adsp_dtb.mbn, it may cause the ADSP functionality can not boot normally.

> 
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/qcs8550/cdsp.mbn",
>> +			"qcom/qcs8550/cdsp_dtbs.elf";
> 
> cdsp_dtb.mbn

CDSP also as above ADSP.

> 
>> +	status = "okay";
>> +};
>> +
>> +&swr1 {
>> +	status = "okay";
>> +};
>> +
>> +&swr2 {
>> +	status = "okay";
>> +};
>> +
>> +&tlmm {
>> +	gpio-reserved-ranges = <32 8>;
>> +
>> +	dsi_active: dsi-active-state {
>> +		pins = "gpio133";
>> +		function = "gpio";
>> +		drive-strength = <8>;
>> +		bias-disable;
>> +	};
> 
> s/dsi/panel[-_]reset/

I will update this (like: "dsi_active" to "panel_resest_active") as your 
recommendation.

> 
>> +
>> +	dsi_suspend: dsi-suspend-state {
>> +		pins = "gpio133";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +	};

This also do update as "s/dsi/panel[-_]reset/".

>> +
>> +	te_active: te-active-state {
>> +		pins = "gpio86";
>> +		function = "mdp_vsync";
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +	};
>> +
>> +	te_suspend: te-suspend-state {
>> +		pins = "gpio86";
>> +		function = "mdp_vsync";
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +	};
> 
> What is the difference between these two?

TE pin needs to be pulled down for both active and suspend states. There 
is no difference.

> 
>> +};
> 

-- 
Thx and BRs,
Tengfei Fan

