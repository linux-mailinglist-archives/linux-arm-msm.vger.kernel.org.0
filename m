Return-Path: <linux-arm-msm+bounces-52735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EC1A7457F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 09:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 624F817BF54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 08:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A8B212FAA;
	Fri, 28 Mar 2025 08:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OEgoutiv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93177212FA3;
	Fri, 28 Mar 2025 08:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743150752; cv=none; b=UJeHzVI8LYHlpTOmlIFDhgI4dJE0R+G+2fYbefofQpGTBMa8hoONmUQNYXf2xZ2gvlMDaaKFgmkMJMYq7ifU39iwT+zilGAvMnoWVWxk2QswDZds0qEQbPlLRPCiq2wNRuYJ8pp5qrngAFynKB2FEH4RdykbNi2lVHjKA6fLQns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743150752; c=relaxed/simple;
	bh=oKs1ujmgPZWoLVJAZuAt1ijqCCyZMIBVXIR/QxF0ogU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XObIlqdvo74VM0R1MgUfR3mcP1deCsnpMKuIl4XvyzwGOlC6czx2L5qweC51X4u0G68MRqS4djOr4Y2LAvoT2ZJSVEBZpqJJvFRZ0ekRzhUYgZ7mv0abWkuMmR4sCBkNO7ERc0p7VpWLPn4lEzU/d5IuMaqgxhbJsw2B2hnvjn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OEgoutiv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S4Kbjp012658;
	Fri, 28 Mar 2025 08:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AxdmQqJCgwsUTPfpVE4IJAkCYojeAeEK1XpoQV4VsKg=; b=OEgoutivPwcrYBcb
	wcbsqx5a8hbU7+P03x8cHtTxs9rbz6bxa3qgqsA8LrOYTCb2rfPJOxHyZwWXTVEK
	zNm/vYdGQjkXxavlSY3RzY+knRtgcXnOqB8e3DrcQpHWX/jqbWUr3KOdsH6js7vZ
	qdohSQ3/4zg3GZyU9bzXFg3xx2qpccgigUzzJVBKdrTGtTkPuqJo1jBbVDSfuq0z
	TrQhyIyF8trapvSxXD7QgFwpREMspmdGyJ1N2aWHfOJo1hWyjJ0iEG706FM/FrsW
	6QKPecXbjyiZTOYM/QmYvmdELtefGFe/80VtqdIdNnqvsd+asTXtAy2RxpcBNh8O
	yqW3XQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45manj7shp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 08:32:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52S8WO59004627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 08:32:24 GMT
Received: from [10.217.238.57] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Mar
 2025 01:32:21 -0700
Message-ID: <6ccf4cad-a99b-4168-b4d7-577112c011e1@quicinc.com>
Date: Fri, 28 Mar 2025 14:02:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8775p: add QCrypto node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250227180817.3386795-1-quic_yrangana@quicinc.com>
 <ea79cee4-8c47-4054-bd17-2097ada4e583@kernel.org>
 <b57fa204-d3d2-4b74-8834-3f2d93726a99@quicinc.com>
 <73ed6108-27ab-43ac-abd3-82656693404d@kernel.org>
 <4a205725-af49-4f28-ab78-7059451d66c8@quicinc.com>
 <29f41232-28fc-439d-bb35-7b9cd1e4be16@kernel.org>
Content-Language: en-US
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
In-Reply-To: <29f41232-28fc-439d-bb35-7b9cd1e4be16@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KzzunXhzoOF_BR4PCjppt7kO321GpmLm
X-Proofpoint-ORIG-GUID: KzzunXhzoOF_BR4PCjppt7kO321GpmLm
X-Authority-Analysis: v=2.4 cv=KvJN2XWN c=1 sm=1 tr=0 ts=67e65e99 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=sY3dAEUmMzCiYxic9fkA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280058



On 3/28/2025 12:47 PM, Krzysztof Kozlowski wrote:
> On 28/03/2025 07:04, Yuvaraj Ranganathan wrote:
>>>>> Use commit SHA syntax (see submitting patches, checkpatch).
>>>>>
>>>>>> because of the build warning,
>>>>>>
>>>>>>   sa8775p-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
>>>>>>     ...
>>>>>>     'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
>>>>>
>>>>> Not relevant warning.
>>>>>
>>>>>
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>
>>>> Are you saying this is not the warning seen at merging?
>>> Tell me how it is relevant? Tell me how can I reproduce it.
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Below commands will show the above warnings without the fix,
>> make clean && make qcom/qcs9100-ride.dtb CHECK_DTBS=1
>> make clean && make qcom/qcs8300-ride.dtb CHECK_DTBS=1
> 
> As I suspected, not possible to reproduce.
> 
> Best regards,
> Krzysztof

I'm able to reproduce without this fix, I hope you are discussing about
this failure only,

	from schema $id:
http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
/local/mnt/workspace/K2L/upstream-kernel/linux-tree/arch/arm64/boot/dts/qcom/qcs9100-ride.dtb:
crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-qce', 'qcom,qce'] is too long
	['qcom,sa8775p-qce', 'qcom,qce'] is too short
	'qcom,crypto-v5.1' was expected
	'qcom,crypto-v5.4' was expected
	'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
	'qcom,sa8775p-qce' is not one of ['qcom,ipq6018-qce',
'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce',
'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
	'qcom,ipq4019-qce' was expected
	'qcom,sm8150-qce' was expected

Thanks,
Yuvaraj.


