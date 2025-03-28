Return-Path: <linux-arm-msm+bounces-52715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD866A743AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 07:06:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F7B617975B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 06:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D4F1A0BCA;
	Fri, 28 Mar 2025 06:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="clkVJETU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B79079CF;
	Fri, 28 Mar 2025 06:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743141963; cv=none; b=OUlTczWau+boZ0pmP70KCcpZ3rDtPw+YryWjf95hrspeJUNoF8z3+RcdVEeU/pSXyifVDEo1FH75QTCJHWtiBmlxLlQhrCpjp9bd/FMxWUGKjzM82lfyitpCsgkIIv45cvHXRKQua55P2Pu+g7K1xlyp+Q/mAdptjDXAzNop2ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743141963; c=relaxed/simple;
	bh=mMBBdaEfvWPB+V13LxKAUqSfPqHXXoV5jbWKRlNKZhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SjozZUooPVR3w30ZAC/aa1BAaZbC6SHNYLdHTeQwo/LIMtQIy1U0Zy96E/BZ2hILxqH57Wpm9TP2B6noARVdxtH73kATCfGVScQ+bhXUbHGZg93qa5bg4eMkVfXCfSeLbpIfhk0x2XVlIP26ykdmz3tD3IwMsG0A56UKAGiTSvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=clkVJETU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S5V8pA013798;
	Fri, 28 Mar 2025 06:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JOfvnTSzLoO17AT75usOqFQaQV75k80oAk0V74z+Ub0=; b=clkVJETUE0eEmL+Y
	A4zDILhXrHQgdD0tt4Hu+H/GadDEfZ79sE7ZN9JpdP6aCURP2tXJbrk3k8cRJx58
	+IW4vlttricMA5KXm3gCRSeXVtOodr6ZbydI9n+GrP80u0z41xlIbSgqEBJOPu/5
	9l9UNR6VKiDaFT4OL5bmbWIV8Fu9t+6PSVpA8HQ8WOVSPRq2bwBgVpdsK9dIHI7X
	jjCIgl5GAq62ewmjeTdUSCQkSC2ycOlOtVN0E3jIRlDKu33DFS9IaicctZ4psGCi
	VX4l/zmhESDoUZLWL/syKwLgdaiSdcur5mdtHKqMc/ALtJS72eZrDtcbT6jgiCv2
	egnpiQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mffcp9ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 06:05:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52S65udb007684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 06:05:56 GMT
Received: from [10.217.238.57] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Mar
 2025 23:05:53 -0700
Message-ID: <4a205725-af49-4f28-ab78-7059451d66c8@quicinc.com>
Date: Fri, 28 Mar 2025 11:34:58 +0530
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
Content-Language: en-US
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
In-Reply-To: <73ed6108-27ab-43ac-abd3-82656693404d@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CdgI5Krl c=1 sm=1 tr=0 ts=67e63c45 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=sY3dAEUmMzCiYxic9fkA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: VQmD0566vwbfOYe4r6RzvjEYkHsAt4rL
X-Proofpoint-ORIG-GUID: VQmD0566vwbfOYe4r6RzvjEYkHsAt4rL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=960 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280040



On 3/27/2025 12:38 PM, Krzysztof Kozlowski wrote:
> On 26/03/2025 18:40, Yuvaraj Ranganathan wrote:
>> On 3/25/2025 1:00 PM, Krzysztof Kozlowski wrote:
>>> On 27/02/2025 19:08, Yuvaraj Ranganathan wrote:
>>>> The initial QCE node change is reverted by the following patch 
>>>> https://lore.kernel.org/all/20250128115333.95021-1-krzysztof.kozlowski@linaro.org/
>>>
>>> Use commit SHA syntax (see submitting patches, checkpatch).
>>>
>>>> because of the build warning,
>>>>
>>>>   sa8775p-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
>>>>     ...
>>>>     'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
>>>
>>> Not relevant warning.
>>>
>>>
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Are you saying this is not the warning seen at merging?
> Tell me how it is relevant? Tell me how can I reproduce it.
> 
> Best regards,
> Krzysztof

Below commands will show the above warnings without the fix,
make clean && make qcom/qcs9100-ride.dtb CHECK_DTBS=1
make clean && make qcom/qcs8300-ride.dtb CHECK_DTBS=1

Thanks,
Yuvaraj.

