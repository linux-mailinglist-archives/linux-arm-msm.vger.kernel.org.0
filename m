Return-Path: <linux-arm-msm+bounces-57293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F067AB00A8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 18:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A98C44A52B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B639A283FD9;
	Thu,  8 May 2025 16:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VlFxXS1n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2503528468B;
	Thu,  8 May 2025 16:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746722701; cv=none; b=EWBnCumiAXq2haEJHSgLAKJDm5RcIKAyTuw6Yd5A3NoHkGk9aHo8z2IvkmjZl6xxRnfgrzTDl1dK3vTzBL4Yo+U638hPVJrI4jdlau9rmzIOTVe1fcGg15MhUhUs9LQwpmjfHRP77NfmdRaVcGrYwzfEP+i7bMhC9eFOXYNd1Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746722701; c=relaxed/simple;
	bh=qS+fG1uY2qfrXxmPkhApBQLcFLFlfoSwkBrytx72YYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C26k3dPTL/aeklqLEmh2Uhl6LNYTIonVQdMLSPYgjuqGQBpavTzuwjKFBCk03wHcN4qcDfqOg0OU+qIUEhblYr/suzRnr6aDeQQYA69b5J2+e+Fh5PwVvvbkfGPiQmnaESBHpAnHvIYbzp9WFrH7VSnAlxj3hDp9xIptIKfk7ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VlFxXS1n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548EGKp7016373;
	Thu, 8 May 2025 16:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJUZNKKB4R9qVDa1LsBb9kjHLjV8gYiJE/WYl+pHjPs=; b=VlFxXS1nD1g3Rt7l
	UrepsmHmWgwzKLr1fZT/1PNktE10/Iu+Z/0uOBypn9DgZ3f3umGqR+7AWFTP5FAy
	mUklNgWK5SNvmyqgFaubmDTIiZn9+qcbdeFL44NGMULNzhF8lYJ7Xd8tP9pbYDYg
	emY69QqBq4bN4RX6vWhtHHfR5V6PqCg3D6cElzfenG9qZyIHbPv6FxXlDgULwbtg
	1sxgOPKY/xYy4TGB7drdtGwrS+NTfWmmR3MApGTi3l7dwG0dHf2F12SrBwBEaRdD
	gulUt/vgcWGArGpDv8KZHEvUXO079p/MMHE4h/hzf2o8cAeuxcMnSEvkAvD2fCqA
	SQrn8A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8synu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 16:44:56 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 548GitZT017762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 May 2025 16:44:55 GMT
Received: from [10.216.33.253] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 8 May 2025
 09:44:50 -0700
Message-ID: <e13d03e4-623b-43c6-b829-21b6cb8e3bf9@quicinc.com>
Date: Thu, 8 May 2025 22:14:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@oss.qualcomm.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-6-quic_pkumpatl@quicinc.com>
 <cffa3374-c88f-4390-af7e-d6309a870b63@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <cffa3374-c88f-4390-af7e-d6309a870b63@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AcCwZKWpsD2mKxaxqSgN14GFZ4nqL4zy
X-Proofpoint-ORIG-GUID: AcCwZKWpsD2mKxaxqSgN14GFZ4nqL4zy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE0NiBTYWx0ZWRfX3cEEfERPWGPw
 x6A7pabUIPxTwR+ek2uphyMiZlsIi6/xTXX5R2KMMhXHdzdARFNX6QvAT+1AC7EAToybpR6SMTr
 XC9Q+fpCNvPlJBQBSIpI49ftAP3d5rZ5+6icO1Kivge/Ud4isksQLPL96qRcZ7RBWSe3F7nD5/I
 H8T6sqLwhMI9YHr0JBtnE0y8CeMZsWdJq89WsjR2dzhpfV20xz43NI6QyCtdZ5b5TO4+UOm6MpN
 vQhfqOVROJQK+UsBpOZ7W9YJqDkmIRvCQLceyV1jiSD2w8ZykY+17Q9NL46mvPL/E3fJlzzOg6Q
 1CsWem35KPej3WNcvGWK2RpDEzrVXODKml//YiIsc4dXI3EGUgCwDWn7Um0wSIdCo1O16XN4hr1
 gsCW7o1h/Yd1Mxf6Y4+ZZ8DdmLzFTyglv2237aY8RK1ZlFPM7k0rp/ETDdb1twgzVBhSwxg7
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681cdf88 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=EkdEwCnvp131_jYCVQ4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=875 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080146



On 4/29/2025 4:28 PM, Konrad Dybcio wrote:
> On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> Add the sound card node with tested playback over WSA8835 speakers
>> and digital on-board mics.
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 49 ++++++++++++++++++++
>>   1 file changed, 49 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 43cbdbe43afd..9cfe648e29bb 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -1078,6 +1078,55 @@
>>   	status = "okay";
>>   };
>>   
>> +&sound {
>> +	compatible = "qcom,qcs6490-rb3gen2-sndcard";
>> +	model = "qcs6490-rb3gen2-snd-card";
>> +
>> +	audio-routing =
>> +		"SpkrLeft IN", "WSA_SPK1 OUT",
> 
> Please unbreak the line and align the entries
> 
> [...]
Ack>
>> +		"SpkrRight IN", "WSA_SPK2 OUT",
>> +		"VA DMIC0", "vdd-micb",
>> +		"VA DMIC1", "vdd-micb",
>> +		"VA DMIC2", "vdd-micb",
>> +		"VA DMIC3", "vdd-micb";
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +	wsa-dai-link {
>> +		link-name = "WSA Playback";
>> +
>> +		codec {
>> +			sound-dai = <&left_spkr>, <&right_spkr>, <&swr2 0>,
>> +					<&lpass_wsa_macro 0>;
> 
> Please align the <s
Ack>
> Konrad


