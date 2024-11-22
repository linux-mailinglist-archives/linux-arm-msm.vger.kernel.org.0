Return-Path: <linux-arm-msm+bounces-38787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8140C9D5A84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 08:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0D301F21966
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 07:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D4018595F;
	Fri, 22 Nov 2024 07:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gDjsmJlT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3118166F26;
	Fri, 22 Nov 2024 07:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732262375; cv=none; b=vGjT5whX9DqmGocqZq5ibRs750m07M3X5PkFApzi0gOe5kSIygGyLdee2jwTbuKjA3NpCOS0XyShUX1QNGHzU8gwMaTc1DNq17MzRM4sTNnEmdnpW7ovEeeMEnkQQNvR2hoLGfROxGzNw03cTgd/yl8r+aPU1PwZXLARW7C6QfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732262375; c=relaxed/simple;
	bh=wYGRj2iBykDhXHFmoI/kOYWd9wW2qzvD+ug1Q2u5OrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YiEASgziNXbOUCbqgkJjJEEhWbXrhLHooNgZrbRCdFzrEZ6YefQQr8rxyzz+GEuB3GNsky9mZY3OI+nCMoSDbTXe78F3lGJd0SjbMPlRS7bFeyQ1oGC/5yW5p1sG/srCEWj5srmzrtd+9ffU9HbqNV2ncajTQKbERaMTGkiTHrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gDjsmJlT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM6I3jA007373;
	Fri, 22 Nov 2024 07:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NAQBA/kdjmhpvBrX/2Y1nIUNO7rIloWLIsoHN00wedM=; b=gDjsmJlT9O+1qsKs
	c/CkdNX1o1jJ6fjaLVKf/+n9NfhD9PWgzMRG0+jlRWLx1NihB6B8ol8eZ9x/4N1y
	CkZYv5cstHbuV+1A12AGVm04YFtqfiFp0Js9oeZPOruOw8QTWoRke4+2qf8aWnbL
	6wiiqwaFLCNQc9X7KI8UhnVFJ5s05eH14sR8eNRzUCG+k8upUUZvere1bE3Twu3c
	GvtbvOYKP7Ty9lv5M7bJFy6BA4RL/lEWkhAYpJqal6H4TC98FiFxlimhTF8kWoay
	LqoF+o7/n9lVtsDEUORJA18wP0ITUPcCSHGF36h7izWbl1G8NoU5cr6ilWNYYcJj
	s4f5Ow==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432mjh87eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 07:59:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM7xT23015235
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 07:59:29 GMT
Received: from [10.64.68.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 23:59:22 -0800
Message-ID: <83f5aa6c-61d7-4552-859e-5518c0ebf3f4@quicinc.com>
Date: Fri, 22 Nov 2024 15:59:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: qcs8300: Add watchdog node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_jiegan@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_tingweiz@quicinc.com>
References: <20241119102315.3167607-1-quic_liuxin@quicinc.com>
 <20241119102315.3167607-3-quic_liuxin@quicinc.com>
 <252644d9-e304-45ee-91ed-a1452300840f@kernel.org>
From: Xin Liu <quic_liuxin@quicinc.com>
In-Reply-To: <252644d9-e304-45ee-91ed-a1452300840f@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VI7ZXZVpjZ6AXkHDVrWBUrg8QoWbUFQ_
X-Proofpoint-ORIG-GUID: VI7ZXZVpjZ6AXkHDVrWBUrg8QoWbUFQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220065



在 2024/11/21 1:00, Krzysztof Kozlowski 写道:
> On 19/11/2024 11:23, Xin Liu wrote:
>> Add the watchdog node for QCS8300 SoC.
>>
>> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
>> ---
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions, under or above your Signed-off-by tag. Tag is "received", when
> provided in a message replied to you on the mailing list. Tools like b4
> can help here. However, there's no need to repost patches *only* to add
> the tags. The upstream maintainer will do that for tags received on the
> version they apply.
> 
> https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 
Thank you for your comments. In my cover letter:
PATCH 2/3：Drop the Reviewed-by tag that received by v1. Assign a label
to the wachdog node.

I have made modifications to the code. Should the reviewed by tag be 
removed in this situation.
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.
> Best regards,
> Krzysztof


