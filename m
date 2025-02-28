Return-Path: <linux-arm-msm+bounces-49820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86765A4922B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 08:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0356418926A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 07:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB4F192D83;
	Fri, 28 Feb 2025 07:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ARi/4bYJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D396E18872D;
	Fri, 28 Feb 2025 07:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740727821; cv=none; b=nCoxWlLd4Ido+j1qiWgQFr0Ftxm1nhjO4ZFj2oeSplF/cmGZO35TzsLojhKhPLiIQlvo+Zpi7mvaGE7ae2vXlO61HpC5vRuLD37YmqsKcj1jfTkz7fm+YX7TISyn6j6ynaQMqHH2MLhP4MFcC8SWcWwYBGjEEhXcgV6T+ydJvr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740727821; c=relaxed/simple;
	bh=MsZdLadOb6bAVk6AqLLefUu/4XUA+aSafDcotdYFgWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DGwZZFqahg1CA+g91DADaAOXCcsXJ3xJGsW2WxrQUExSuObpC9jcI72wbR3MYlGyR52HdR+3h2mi1WFO7JNsxrdBTCGWjPOVyJ336i7X6YyIp4/YE3wLElqxdtGuMHWL7BAzZ5pDvi9Eaq6ioPIUVOasYPs8NFxIodq6+T4PC24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ARi/4bYJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51S7RsNK018544;
	Fri, 28 Feb 2025 07:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7tWosMGbLHMAvjm1d81SVDVfNv1EC5GVkU6SRnrc1tI=; b=ARi/4bYJCvaKG/1m
	ek3hfTEv//Uc2BVRWFlB23KNayFc69zkc3HqtGfkOwpwWCWK45/URGJX8tXyq9Rp
	MlVeYKwp36GgfbVlLuYEih5dwmK48A7GxC+4WWgVVj2eu6RXXlXBsgCEFyNaevkr
	FTv+2lch0ExVjjxImllk9VZPbgXekG1WgOm8ut1wTc5lcWBI7K4JW43QKkt4D4Ov
	wfKcdRucZX+IRPFwrUu3wboOxU3psD98f9hvZou03BZk7EHmDJhqlKwYC1rnhXzz
	LNlhf8QPxksxiDu9ZvybEVnLYeeaSfPYv/jQE4+WDXung24ybG/C+lGATSgoDi/Q
	6frD6Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prn8d4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 07:30:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51S7U368001805
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 07:30:03 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Feb
 2025 23:29:56 -0800
Message-ID: <71cab81f-90ad-4965-b3fc-26d72afeabc5@quicinc.com>
Date: Fri, 28 Feb 2025 15:29:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: Add Coresight device Trace NOC
 definition
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark
	<james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
 <20250221-trace-noc-driver-v1-1-0a23fc643217@quicinc.com>
 <edfd6c6a-65d2-42f1-8225-0808359dd375@kernel.org>
 <593e1777-a033-4922-93c4-c056e6b9bf4c@quicinc.com>
 <19e9db80-e493-4494-a57f-18118c1ffad1@kernel.org>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <19e9db80-e493-4494-a57f-18118c1ffad1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2VpJnGQo5Zf6BfiFzGLgbNUeNbyruWmN
X-Proofpoint-GUID: 2VpJnGQo5Zf6BfiFzGLgbNUeNbyruWmN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_01,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=752
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280052



On 2/26/2025 7:07 PM, Krzysztof Kozlowski wrote:
> On 26/02/2025 11:52, Yuanfang Zhang wrote:
>>
>>
>> On 2/22/2025 6:47 PM, Krzysztof Kozlowski wrote:
>>> On 21/02/2025 08:40, Yuanfang Zhang wrote:
>>>> Adds new coresight-tnoc.yaml file describing the bindings required
>>>> to define Trace NOC in the device trees.
>>>>
>>>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>>>
>>>
>>> So you just sent the same v1, ignoring previous review. That's not how
>>> it works.
>>>
>> sorry for this incorrect process. because i just update --to-cc list and no other
>> change, i forced the version to V1, hoped it would work like resend,
>> but the result was not as expected.
> 
> 
> But you got feedback, so why resending without implementing it? That's
> the problem, not you labeled/not-labeled it as resend.
> 
got it, will implement it in next patch.
> Best regards,
> Krzysztof


