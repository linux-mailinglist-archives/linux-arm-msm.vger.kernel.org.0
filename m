Return-Path: <linux-arm-msm+bounces-40651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F18FF9E6471
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 03:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E65B41885010
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 02:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9261F41C77;
	Fri,  6 Dec 2024 02:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Mk/fzamn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECC913C677;
	Fri,  6 Dec 2024 02:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733453425; cv=none; b=LQfe0rpviiDCQHMuIG3cjs5ES7sjxuncw1ZVwXQlfD28mjeMAjm3A+R7VK6RvSoxYr14cwJzdV2yI2Y1fRUKJa9WgzOjTmgHx5m4kN677Y78x1Z9kIYmoC84JFHYVf8fmiFwcY1gUWBnAR36j+4u+ctZWEupARlkUSjX9w+kQ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733453425; c=relaxed/simple;
	bh=Ndn2jxtEqosWyoI28JUucb4KFXtu4aIp4wE7cHQ5Apo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Al0UB/6s+9Y2D3uSceZ636FYRAWt713p07LGzQWcPvo93O2RpQMEAXw/bxNMDmZer1BlGTlDsZobMnsNfKsxjg20hB41YeGA10py4txugI3ZK501RWbddJi4lc5TzFSIFkzmsBPXaVOm8Qbr7V9Sm7PjLgrROA4LXgxEoeqizRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Mk/fzamn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaO3R005965;
	Fri, 6 Dec 2024 02:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zcm4DqSYOflesfW7kwRW3Z1Ht0YyrkJRhNXH8J1FOEw=; b=Mk/fzamnUDHwWH1T
	k8WrikGVvbEH9PTQqBTG4xU/Uy9ziSDiJRxuW8O4hydVL4iBal4XxvgkLL+EUUwH
	TAJESiZAnW6EL+9nAflA/6VjYL3qL/RlSSn2kLmor+O+XKbgDFypZoIIUG30mNyb
	5whicFXkQ2kRL/Dl9FvMZD7BScfUsFz4P10uvg/tq/GdDzmseD38umX64i5JGPWX
	akKtXcqgDmkdpX3SeoIlmlmZhA/zmqPuTDneqKYc4HNTf0jHMCYqDxRCL/NT9xaU
	0kKtasdZa9pHnD/zeDohaPLFuVGhGhgCHMxtPURulH9l32r/xdsBv6BxCkQ4dIKi
	4KB9wg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ayemby3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 02:50:20 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B62oJSW022937
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 02:50:19 GMT
Received: from [10.253.33.254] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 18:50:16 -0800
Message-ID: <4ebf9f1d-74a9-451b-91a5-fe38a0d48e24@quicinc.com>
Date: Fri, 6 Dec 2024 10:50:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Enable ethernet for qcs8300
To: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
References: <20241206-dts_qcs8300-v5-0-422e4fda292d@quicinc.com>
 <87c9ebb9-36b2-4891-8800-2896d6d9bbfc@quicinc.com>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <87c9ebb9-36b2-4891-8800-2896d6d9bbfc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6IGmeDmEgFV6xmkInLCHROVJh7DiU6zI
X-Proofpoint-ORIG-GUID: 6IGmeDmEgFV6xmkInLCHROVJh7DiU6zI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=514 phishscore=0 malwarescore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060019



On 2024-12-06 10:37, Tingwei Zhang wrote:
> On 12/6/2024 9:35 AM, Yijie Yang wrote:
>> Add dts nodes to enable ethernet interface on qcs8300-ride.
>> The EMAC, SerDes and EPHY version are the same as those in sa8775p.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
>> This patch series depends on below patch series:
>> https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi- 
>> v2-0-494c40fa2a42@quicinc.com/ - Reviewed
> 
> Above series was already applied. I would say there's no dependency to 
> block this series to be applied now. No need to respin for this but 
> update the dependency status if a new version is required.
> 

I will take care of it next time.

>> https://lore.kernel.org/all/20241010-schema- 
>> v1-0-98b2d0a2f7a2@quicinc.com/ - Applied
>>
>> Changes in v5:
>> - Pad the register with zero for both 'ethernet0' and 'serdes0'.
>> - Change PHY name from 'sgmii_phy0' to 'phy0'.
>> - Link to v4: https://lore.kernel.org/r/20241123-dts_qcs8300-v4-0- 
>> b10b8ac634a9@quicinc.com
>>
>> ---
>> Yijie Yang (2):
>>        arm64: dts: qcom: qcs8300: add the first 2.5G ethernet
>>        arm64: dts: qcom: qcs8300-ride: enable ethernet0
>>
>>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 112 ++++++++++++++++++++ 
>> ++++++++++
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi     |  43 ++++++++++++
>>   2 files changed, 155 insertions(+)
>> ---
>> base-commit: c83f0b825741bcb9d8a7be67c63f6b9045d30f5a
>> change-id: 20241111-dts_qcs8300-f8383ef0f5ef
>>
>> Best regards,
> 
> 

-- 
Best Regards,
Yijie


