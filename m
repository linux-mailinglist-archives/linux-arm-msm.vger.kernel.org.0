Return-Path: <linux-arm-msm+bounces-58194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A533AB9A3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 12:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9458A07199
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 10:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629F72356DE;
	Fri, 16 May 2025 10:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PTNIDXQk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9368E481C4;
	Fri, 16 May 2025 10:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747391566; cv=none; b=dNOO2h1Kudqn9uTSpljasT0YZWeUCeUDiZ/sDcF0YqLYZHJwAfWj5pweC7kVH/Pkl9utSm5uomp9Em7zndh0WVEkrwFdwgPk1sgWK3O/uPxVoF1v54ACeR3B10YrHPFpwOiKVUESIdkvwDIi9gwiSfFlgaiPyRF9LcVs5iC+nQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747391566; c=relaxed/simple;
	bh=ns2K+SXZcdu1VRskCGGwgiBaJc5JewnjUVXXcj7v65A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BAZYiIjVWdCFybW4v3vU5/CO8zMEwrD4WBiiAF8ztsr460z+po9QXHHvHiZsxjAxWQohEQ3fHiyoA6VrEy5EHhipQVz6eGs8OxdGhKd89Oqc+I/KvElI8qxLjF+2e6KTgGfPsmVzIO/evwvHVQ5z8MKQS4Ko7sv655aHQkhd4BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PTNIDXQk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3Xp4B032604;
	Fri, 16 May 2025 10:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NtbGRVewdCYtlga0ccxkzV8Ksy/nFFOHtWPaoectw9Q=; b=PTNIDXQkHKGfP8Eo
	WOpSdWfy5lOoi8095oHXPvuyJiaMcBw4bQ0RmQ4qM0FLUbfg8bE+M19R4IgWojte
	PQn8CdroVGf/PRA9xbQNG51q8dXrp5V8WPnGoU8wcNEGuwzlKSjrigfWsuXlmJyK
	HNv65LLtYpgGSfH9lkGt/+ARWJF3RG7Tvo/NKt4BkJjtQZcpOSjoMT/M/Pg7fGez
	CIrKO/rVMlUmUa3X042MCpSAcVhVFXsIvmpbmUwW+2NLczZxFKauiucLahrjXnwk
	sZf4xG7qvCZhDutukzXapMmO+T+9O2FPpWsSeqwbDbzr3UBTPone1+U9UG5QgkwA
	xI/5cg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp1k0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 10:32:40 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54GAWdca030366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 10:32:39 GMT
Received: from [10.253.78.92] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 16 May
 2025 03:32:35 -0700
Message-ID: <72b61199-bb70-4965-9ca9-f21966195f60@quicinc.com>
Date: Fri, 16 May 2025 18:32:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Add support for camss
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Depeng Shao <quic_depengs@quicinc.com>
References: <20250415-sm8550_camss-v1-1-d4b7daa168ac@quicinc.com>
 <wOxjiEBKO2XU-PikPlT8IMpSGOrP4ocgZEIj_zNhLzzBjySkhGQzupjmJAFhUHcnknLKSASwk33LjBI6WrZ9vg==@protonmail.internalid>
 <1ee8587b-2bf6-418a-9834-8f8cbf1e94d8@oss.qualcomm.com>
 <4e81a1fe-3ee5-4f5f-b958-13e6cf9138f7@linaro.org>
 <db059233-523d-420b-81a7-73b02beef4d1@quicinc.com>
 <36f02ed8-b440-4760-8d08-b633406ce92a@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <quic_wenmliu@quicinc.com>
In-Reply-To: <36f02ed8-b440-4760-8d08-b633406ce92a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bLfMmbkbrys3govir_NI9CEn4jMIJOkr
X-Proofpoint-ORIG-GUID: bLfMmbkbrys3govir_NI9CEn4jMIJOkr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEwMCBTYWx0ZWRfXzKOa3vnQWyfg
 NZxTiE/QlmaggivuwQhehRXdTj7Z2Sn0o3ME9LU1lh/ldyyjjwtXDPMaPKN8Pl+uKkR27tpEAsF
 QVEXhHZk3DkEXqe9wpnk+f/zyt+N/tWO0dR3fyo8iVm8tK0fnHumwRcWLifEjBDwtfY1NeFvuYb
 6i2OzGK7F8NQIQCc8ow5bRNrN38BwExVwrvRJF6jTn+LTH9fPIt8r8gLUie68v8cvHdNS54wDWG
 SWWRc1/L+WVJOXfcJLgH93ngpcdoDaqGmk5omutsbTZHxTXLqU5EO0wwweJg6Ee8gTODjwoGbmB
 e0TReWhU3o5yE9YnaaktuWnPYjhV4c//8v7HYIwWyc8EDB2i55YpYxcP17exTNXmQDGEuE/SFBW
 ZFDVWh+MZAzL/YOJV+MdfEaibYCKL5NCBpfZmWTPQ2BQMH/yPp4VitZ5vKUM51Wf6cU+96iQ
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=68271448 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=HT0NK4niDoYcv-slHuEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=400 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160100



On 2025/5/16 18:15, Bryan O'Donoghue wrote:
> On 16/05/2025 08:34, Wenmeng Liu wrote:
>>> This should be 689 yes
>>>
>>> ---
>>> bod
>>
>> Hi Bryan,Konrad,
>>
>> I confirmed that the value is 688 instead of 689. The documentation 
>> incorrectly listed it as 689. To CC linux-media, I have resent the patch:
>> https://lore.kernel.org/linux-arm-msm/20250516072707.388332-1- 
>> quic_wenmliu@quicinc.com/
> 
> Do you mean the documentation in the kernel or the documentation inside 
> of qcom ?
> 
> I checked the internal silicon definition, I think Konrad did also.
> 
> Which documentation do you mean here ?
> 
> ---
> bod

I mean is the ipcat documentation.
And if configured to 689, the interrupt will fail to request:
irq：irq: type mismatch, failed to map hwirq-721 for 
interrupt-controller@17100000!

According the mobile configuration, this value should be 688.

Thanks,
Wenmeng

