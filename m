Return-Path: <linux-arm-msm+bounces-38733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 837189D5709
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 02:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4853F282BE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 01:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0BE70824;
	Fri, 22 Nov 2024 01:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CTc6EXIK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887E22309AC;
	Fri, 22 Nov 2024 01:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732238484; cv=none; b=U0pQ1+y1XIUE1ZlH8av1jPWpQKQUsfpZhZpAV7FLUDkmsPuHcNpvAlvbXUVWBk1lUNrILN1GClh8KBBJDQxruhyuEkCOJKRPblso39zDxLFDy/g78tPb/JVsJOv1t3ATFfd+hgwZbp7pdt1YC9gq2+YXewxaacHFsnU6KHLKETA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732238484; c=relaxed/simple;
	bh=YxeYppzDf7V8g4Tbcz+mEhSb/412HQZ+neLnniD2HVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JGt8svCC6a2WIFQ1Y2LZtUe/oh7q1zlZvM4RRu/4paM/tqcDemAltaJAL0GwHWByIn8QBdWI5c/WzzLVUXLFCNMnpO7v+rLsaBkh6t1PKiBM6Ig/F9B6CKX4tNWjsNt++xfSNW4hogO7fZfi4HQjxBqBOpjtu7XJ3Elk2IfkdQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CTc6EXIK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALKxwOE002369;
	Fri, 22 Nov 2024 01:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mJY+C2OrUNq8Cv/RftLal0ztMq2TbuzpXQ7+SdQmAU4=; b=CTc6EXIKke9fSPk7
	mcmffX4yJhwHbTI1K7gXt59cXgLZ4DFcRqS6aLyP5DItJ02+V5Gam/067tg+Rf2l
	LKbi/5n4f88FOTmotPeEllpLpNIRVKoUUyQCVtvCoBrpg6JE1J9igZDcgb95DING
	YxzK0+76mXPzM/PdFSSoO9PrpsiCuoNIYKid4IET26kNLQtfrvtXgMW5Sk4nbRO7
	Ax1IR3AhTdhram6z7UtmTs+Cwzu/POGjzH1t7irzh/p9hKi51oB6JMajm1eVKl4D
	JvJfPBXgVNV5ElO+wBi5nyKRTLyPYI9g4iDD1IslADgsH7q8Mkb3+v1OK99tO7L3
	NulYBw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ea75cwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 01:20:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM1KrKK021474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 01:20:53 GMT
Received: from [10.253.13.126] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 17:20:46 -0800
Message-ID: <32eb38dd-1176-4356-b36c-00aa34a07040@quicinc.com>
Date: Fri, 22 Nov 2024 09:20:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add standalone ethernet MAC entries for qcs615
To: Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>,
        "Andrew
 Lunn" <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro
	<peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_tengfan@quicinc.com>,
        <quic_jiegan@quicinc.com>, <quic_jingyw@quicinc.com>,
        <quic_jsuraj@quicinc.com>
References: <20241118-schema-v1-0-11b7c1583c0c@quicinc.com>
 <3cfc2e90-c9b4-425d-80f4-ddace9aff021@redhat.com>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <3cfc2e90-c9b4-425d-80f4-ddace9aff021@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dYuuCkmnewuO-08MOeB_S_9jO_bMNVm_
X-Proofpoint-ORIG-GUID: dYuuCkmnewuO-08MOeB_S_9jO_bMNVm_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=587
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220009



On 2024-11-19 19:18, Paolo Abeni wrote:
> On 11/18/24 07:16, Yijie Yang wrote:
>> Add separate EMAC entries for qcs615 since its core version is 2.3.1,
>> compared to sm8150's 2.1.2.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ## Form letter - net-next-closed
> 
> The merge window for v6.13 has begun and net-next is closed for new
> drivers, features, code refactoring and optimizations. We are currently
> accepting bug fixes only.
> 
> Please repost when net-next reopens after Dec 2nd.
> 
> RFC patches sent for review only are welcome at any time.
> 
> See:
> https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
> 

Thank you for the reminder.

> 

-- 
Best Regards,
Yijie


