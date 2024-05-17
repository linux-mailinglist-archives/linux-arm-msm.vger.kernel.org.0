Return-Path: <linux-arm-msm+bounces-20009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 337A68C8C3F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 20:33:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 647791C220C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 18:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC0F13FF2;
	Fri, 17 May 2024 18:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Vg79+cHH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15771A2C19;
	Fri, 17 May 2024 18:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715970784; cv=none; b=WtmqlXDOMEytUsNfn9+cZeUyg9kAoUT1fkESm6YKMB04q44adJ1K7pYQdd0z8iGhsfe4zCLBFKdqehWU8/cGSPKsb3o8ozKpQR6mgkRcy7IIE1qiqGu+VMA2miLzBqL9FSSSeRcwwc78ulXMeopNqO6rQos5qSv9WNRhiOzmwc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715970784; c=relaxed/simple;
	bh=IpHKn100vUjrZafmZKJ1y8v2H5IiPMdG53S1ZMl4E+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JZBaN1w1C4Z15A0SGIW36kQ6DFv2+fd5nxMyLqQay5WxT+iArhHmSPFZzHjWU25SS7hNbQdiLqcQiXH3+C93mdVvuZrYBStqalYuR/8uJQ9988JfH0pSQRgZpDdMIjuO5VMnDUt8k1nYNKiy4VfmyIJBGp4kal+/LaC+RMkdzXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Vg79+cHH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44H98KQL007278;
	Fri, 17 May 2024 18:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=trmdsobqOMWDgc1D8NKUUfFAo9qR0PrBuwm8lSkrz3c=; b=Vg
	79+cHHTr16tp9TBmcnGCAcEW4MomLM4m1TKiTIMTQjhQhCHjjJmqRKuVQpASP1VN
	gxPAIarbirbphn6E+t149eDVGIc8hRdrMDvVL2EPWF0/JqMPMC+sDo22wQMCLsD9
	TaDEpjCGVD6MyiiC+Zypj2Qh8NGx1wx/BT6qe8gGgVukepc9SfhRSypj9nwj2AXF
	pdjF1XthSOHFf1ZIDamd8/2hyO6puG00UnQXR3gmAhQeqdI7avackgQZta38hLf+
	F7v7kO4aoxLR8t6au8FWW0Go2wxeAf7yXaKYIS9GNA8dwVz211WwZI8AzmkmrsoI
	kP19QtIyiZjB95ADFoOA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y49ge0tmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 18:32:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44HIWlH1005033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 18:32:47 GMT
Received: from [10.110.126.2] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 May
 2024 11:32:46 -0700
Message-ID: <8000851c-f3e2-4fcb-b4d4-9acaf9763fdb@quicinc.com>
Date: Fri, 17 May 2024 11:32:45 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] hwspinlock: Introduce refcount
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Will Deacon
	<will@kernel.org>, Waiman Long <longman@redhat.com>,
        Boqun Feng
	<boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Richard Maina <quic_rmaina@quicinc.com>
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
 <20240516-hwspinlock-bust-v1-1-47a90a859238@quicinc.com>
 <edfb049a-b56e-424f-bca7-556dffa6c87d@linaro.org>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <edfb049a-b56e-424f-bca7-556dffa6c87d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iv9sI3L20wtxJZlWpyoVobWcaFr13M2_
X-Proofpoint-ORIG-GUID: iv9sI3L20wtxJZlWpyoVobWcaFr13M2_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_08,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=888
 impostorscore=0 clxscore=1011 priorityscore=1501 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170144



On 5/17/2024 1:58 AM, Bryan O'Donoghue wrote:
> On 17/05/2024 00:58, Chris Lew wrote:
>> +    unsigned int refcnt;
> 
> Why int and not refcount_t ?
> 
> Have you an argument for or against use of one over another ?
> 

I wanted to avoid the warning if you try to do a refcount_inc on 0. In 
this case, 0 means the the hwlock is unused but the hwlock should 
persist while waiting for another request. It seemed like refcount_t 
expected the associated object to be released once the count hit 0.

Also the count here is serialized by hwspinlock_tree_lock so the need 
for the atomicity provided by refcount_t was unneeded. Using unsigned 
int here seemed simpler.

> ---
> bod

