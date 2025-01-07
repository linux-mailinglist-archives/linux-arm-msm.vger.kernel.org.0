Return-Path: <linux-arm-msm+bounces-44083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72956A03A46
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 09:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0793818869AF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 08:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18E21E0E13;
	Tue,  7 Jan 2025 08:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IC+hdV2S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EE31E1A33;
	Tue,  7 Jan 2025 08:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736239947; cv=none; b=LKXFLaULc0lbemYENp0TgRhrDf864KH7tN3g+BItfo/4JBpEpWR2p7ixBvLxHhaNq4wik6JKSy7D3C7Axa8z4MrDbsHMJDaBJtsybr6wSHOvZnLwiE4k1xhK0J/dmY3/cH3ZdFZWjWmhv1RUkGxUL85YRLahqk+ksBhyQls0N3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736239947; c=relaxed/simple;
	bh=TD4NTGiT/c7ACTMbbS4vLYcRuMRFsWgJzKZCpugtq2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eCRAgy3cWHLsEqQDL8WKCk6f1t8X/NKrcVFc78+ovNL1fgFxZz0rx7nWVe56aB6nnPAsA8uEAJ6BMcdsc2c5xIQ74fWhZxi4AjYlQQtQlAhkNCtIfmgkA1srekvcSOV/b/a+bkuRkgtaE0gqeX7/sHbx2AqL3clEI5OOsfvCYPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IC+hdV2S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5073QC15007312;
	Tue, 7 Jan 2025 08:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AOF+5w1gP+wOunvkUKJNFjxZNW2+9AggjH4Q2vEYWXQ=; b=IC+hdV2ST9E2GzPZ
	sdJwEtF0rxvjfcautx8Y93oRisFkiF2sIulZY6e6RYOMB3FNy4qji3+TQcCq15u/
	thO9aVgZYoh7nG0U/RoPcDGKem/MPIP5IihaWdVEapBceXisIkJJrfUcRSW8Y2Of
	QwtY7sbhNMSmaPMM6O+oA+1bEnK2LT1usCoPxYAHH+vFaLmltegYFaJXJjHJl1yU
	6cxMNPg5fnp6kFNV1ydaU0TGSCxVBoyovdBOBqj5V/l4x6VMleB6mjyj0YgtnJ/j
	IgjAZhC/pXoPYQHdou2G98sUi2xEjl8yF+1zNDZV4Jp8jL2oYqATomd7lzGYnjmY
	Bpki2Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440vbu0nkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 08:52:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5078qHLK015259
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 08:52:17 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 00:52:12 -0800
Message-ID: <44020b6b-ae32-4910-b1dc-95d7d5f10204@quicinc.com>
Date: Tue, 7 Jan 2025 16:52:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: Add coresight node for SM8650
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250103-sm8650-cs-dt-v3-1-759a3f6a3cc8@quicinc.com>
 <770b35b7-27c0-4b55-af85-9d6170d43102@oss.qualcomm.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <770b35b7-27c0-4b55-af85-9d6170d43102@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: adNS7ngqxVWeFqfaDMBCPek8Nfu0X74q
X-Proofpoint-GUID: adNS7ngqxVWeFqfaDMBCPek8Nfu0X74q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=705
 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070073



On 1/3/2025 8:44 PM, Konrad Dybcio wrote:
> On 3.01.2025 12:27 PM, Yuanfang Zhang wrote:
>> Add coresight components: Funnel, ETE and ETF for SM8650.
>>
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> ---
> 
> [...]
> 
>> +
>> +		funnel@13810000 {
>> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>> +
>> +			reg = <0x0 0x13810000 0x0 0x1000>;
> 
> This now looks good, please just re-sort these nodes (by address instead
> of adding them at the end).
updated in patch V4.
> 
> Also, did you give this patch a try on a production-fused device?
> 
Yes, it was verified on Snapdragon 8Gen3 platform device.
> Konrad


