Return-Path: <linux-arm-msm+bounces-52367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10593A6E013
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 17:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C47016CD61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 16:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C493263C82;
	Mon, 24 Mar 2025 16:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BRHwpmNI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7CD261570;
	Mon, 24 Mar 2025 16:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742834657; cv=none; b=HEb9Wgs3m7vOiz+xqY5zE5ocQBYHhqAZ5xEW8rmNbdbefQqSq+23O/S/8q5eeZAiG8d6I0j5IYQgq3IUdeyRKNv8MqUDUR/dTj/Vnx1UBy9OlhOwbFUHHMezXcdZVIx4YQPtPbRoLp0dJyOuwlXNbFbtl9O8waREJOpqJjYQh4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742834657; c=relaxed/simple;
	bh=WlcHSCuCE+B5oPFbUZhbIX6BCUYFF/YgHjdqP/AExfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VktPFj7DiTmrEvBrwYPBAk8PWjOiA8PWkA5tIlu5JVAWOF/X2Rx0nsdq1SNrF3i9sZ7wwJNBc+wU2vcF72jztSWBnpr4jV36AATIK3m/F/66jjgXJPIChrSmPDYDwRh4A+k9nBLrCoe13OLYVDkiF0xYOGJetu3H8apj7HIhyOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BRHwpmNI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O9PSxE015755;
	Mon, 24 Mar 2025 16:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1DIxwp36ktfPlrjG2+HU7c3QBj3w7DAkJ+2V61M5xr8=; b=BRHwpmNIv6Y9u5Pq
	sZoEL9PS4NEn24D3RJzk52AMNmTuXPUct77oFCpgLemkPpA4LztENVzJepovqHSz
	1U6eS63TL0y3VRQ2Szg9uRAXvS1+AN8hAu+4tGAP264Ri/L7uthr3MnT05aet7k5
	Tw8NH5VpV56CtHw0Jh9wPrO9l89KytBhih6Rx2mwq7ta0FCmgKxaMk6maUeUPSIl
	+hg+6Iz4jMratxWDxQK9DmU0RaWpCFh4tt8IB96MATRcvgwW0zg7QQR1PDpsv7F5
	ug5SdoYUnwMCVkRIcJXuTdGqXdTqVGxzyhpaV7ig3mS2BqVU9WlzNqfwcb/wQUAe
	PEFZ6g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hn9wcyr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 16:44:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52OGiAYl027527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 16:44:10 GMT
Received: from [10.216.17.237] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Mar
 2025 09:44:06 -0700
Message-ID: <f565fee7-b222-4e6b-b022-68aed9a7d9ea@quicinc.com>
Date: Mon, 24 Mar 2025 22:14:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: sa8775p: Add default pin
 configurations for QUP SEs
To: Bjorn Andersson <andersson@kernel.org>
CC: <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_msavaliy@quicinc.com>, <quic_anupkulk@quicinc.com>
References: <20250225154136.3052757-1-quic_vdadhani@quicinc.com>
 <keszvik5mrobfkdpgdz5rnl5l7tihgbpyd4en3dflmaflyl7io@d4my7wdrtkyg>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <keszvik5mrobfkdpgdz5rnl5l7tihgbpyd4en3dflmaflyl7io@d4my7wdrtkyg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ikxVXsEEZAd1-hjUiVAsxZMkQpXz-xsw
X-Proofpoint-ORIG-GUID: ikxVXsEEZAd1-hjUiVAsxZMkQpXz-xsw
X-Authority-Analysis: v=2.4 cv=CPoqXQrD c=1 sm=1 tr=0 ts=67e18bdb cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=Fu_YwIdgIx9_JamtqNsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=988
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240120



On 3/4/2025 10:05 AM, Bjorn Andersson wrote:
> On Tue, Feb 25, 2025 at 09:11:36PM +0530, Viken Dadhaniya wrote:
>> Default pinctrl configurations for all QUP (Qualcomm Universal Peripheral)
>> Serial Engines (SEs) are missing in the SoC device tree. These
>> configurations are required by client teams when enabling any SEs as I2C,
>> SPI, or Serial protocols.
>>
>> Add default pin configurations for Serial Engines (SEs) for all supported
>> protocols, including I2C, SPI, and UART, to the sa8775p device tree.  This
>> change facilitates slave device driver clients to enable usecase with
>> minimal modifications.
>>
>> Additionally, move default pin configurations from target-specific files to
>> the SoC device tree file, as all possible pin configurations are now
>> comprehensively included in the SoC device tree, similar to other SoCs.
>>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |  88 --
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 908 +++++++++++++++++++++
>>   2 files changed, 908 insertions(+), 88 deletions(-)
>>
> [..]
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> [..]
>> +			qup_i2c0_default: qup-i2c0-state {
>> +				pins = "gpio20", "gpio21";
>> +				function = "qup0_se0";
>> +				drive-strength = <2>;
>> +				bias-pull-up;
> 
> Look at other examples, such as sc7280.dtsi, and you will see that
> drive-strength and bias are considered board-specific properties and
> should thereby not go in the soc.dtsi file.
> 

Removed drive-strength and bias in v2.

> Thanks,
> Bjorn

