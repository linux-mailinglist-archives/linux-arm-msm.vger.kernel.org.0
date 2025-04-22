Return-Path: <linux-arm-msm+bounces-54971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA1EA97359
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 19:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C45BE188D63C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 17:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BCF29617B;
	Tue, 22 Apr 2025 17:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GVbjpSQB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD3313C3F6;
	Tue, 22 Apr 2025 17:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745341733; cv=none; b=bvl0sxby7v5tidMEc3EXCIM+0bQiGKfnvm9eRq/eImewrzDkgAmH/lz2cyppdI1XbbiFyzke1moZm4EAuquj8QIGoSyvA2q7G+YV/zrv2pfl39IQW8Q9FdZi8kWGwN9Mt8Z5K9MwBkGBLw77iVIxRftX5ECDJvC6geBLEjaauUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745341733; c=relaxed/simple;
	bh=tNSqlnQv4PhNulf8LTTvZEON1j+91hk0BJf6+XuBtaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nx+XMqH5Fl92rCGKUw0rd6eQeuwvmS/R3a0qGRoZFk00zU2L/V71b4xO5sNbTDUgLamAV5X5V7r1CAEZXDv/GIU8uTxgIrdp6RAp64lrbJQp0sECPk+nuED0GEpumxWD4yauSQ5JTEypa3fj4lqITkPrxvvz6fScK8Bg3gFyFG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GVbjpSQB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MCSGgg000493;
	Tue, 22 Apr 2025 17:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ltOm7Cp+SJCEusXF3mlfu3arUXedvGyVWgd5yFun3C8=; b=GVbjpSQBBpZbXkg/
	c0m+sp0DQP3hzY1QHVQbvd2zxhWYS2ptmcancRuM4KfjP9CYmkllEsxr/fVvbEJi
	x0agFeaiAiHlxZB5bPyUdJNcf/It79FJXiX/OcJv0vv7f4Shua/KKBMwDHJH649P
	GZPhqqn8ePZRgqvhcKC13ic/M+qwMClcNAlXbpKII1etykeGIoB9i6AwA6XoaV1+
	SU5DIlb7j28SaJ40bmGBlb4bT+YAFGUoPqh1qCduhza7e078gklNi1vIeZcOOWlI
	PQjENvGaLuvzFM/eqjsN4f6kfCDfs6ViXRb0CpJwcOpfhJd6nInYv47+kOB3N4vd
	0+8aiA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4641hhrn77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 17:08:48 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53MH8lRS030429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 17:08:47 GMT
Received: from [10.216.4.61] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Apr
 2025 10:08:44 -0700
Message-ID: <54746caa-f326-4736-b06c-904e413ce8ff@quicinc.com>
Date: Tue, 22 Apr 2025 22:38:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/8] arm64: dts: qcom: qcs6490-rb3gen2: add WSA8830
 speakers amplifier
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@oss.qualcomm.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
 <20250317054151.6095-5-quic_pkumpatl@quicinc.com> <Z+Q5IM0Qj8J5xZUm@trex>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <Z+Q5IM0Qj8J5xZUm@trex>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Fe43xI+6 c=1 sm=1 tr=0 ts=6807cd20 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=vC_a7ZyuHw2JGkk7z40A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 7cd6NAMhNN1mr2Ms0-4dtQE6RYu72EXa
X-Proofpoint-ORIG-GUID: 7cd6NAMhNN1mr2Ms0-4dtQE6RYu72EXa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_08,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=817 mlxscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220128



On 3/26/2025 10:58 PM, Jorge Ramirez wrote:
> On 17/03/25 11:11:47, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> Add nodes for WSA8830 speakers amplifier on qcs6490-rb3gen2 board.
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 27 ++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 23dea375c213..a1a3df77ad57 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -870,6 +870,33 @@ &sdhc_2 {
>>   	status = "okay";
>>   };
>>   
>> +&swr2 {
>> +	qcom,din-ports = <0>;
>> +	qcom,dout-ports = <8>;
> 
> are these number of ports correct? from my unit tests, 8 seems to be out
> of bounds (soundwire probe error)

ACK,
Will fix it in next patchset version.

> 
>> +
>> +	left_spkr: speaker@0,1 {
>> +		compatible = "sdw10217020200";
>> +		reg = <0 1>;
>> +		powerdown-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
>> +		#sound-dai-cells = <0>;
>> +		sound-name-prefix = "SpkrLeft";
>> +		#thermal-sensor-cells = <0>;
>> +		vdd-supply = <&vreg_l18b_1p8>;
>> +		qcom,port-mapping = <1 2 3 7>;
>> +	};
>> +
>> +	right_spkr: speaker@0,2 {
>> +		compatible = "sdw10217020200";
>> +		reg = <0 2>;
>> +		powerdown-gpios = <&tlmm 158 GPIO_ACTIVE_LOW>;
>> +		#sound-dai-cells = <0>;
>> +		sound-name-prefix = "SpkrRight";
>> +		#thermal-sensor-cells = <0>;
>> +		vdd-supply = <&vreg_l18b_1p8>;
>> +		qcom,port-mapping = <4 5 6 8>;
>> +	};
>> +};
>> +
> 
> also, should we enable the soundwire controller?

ACK,
yes need to enable soundwire controller, Will take care to enable in 
next patchset version.

Thanks,
Prasad

> 
>>   &tlmm {
>>   	gpio-reserved-ranges = <32 2>, /* ADSP */
>>   			       <48 4>; /* NFC */
>> -- 
>> 2.34.1
>>


