Return-Path: <linux-arm-msm+bounces-42482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF459F4580
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 08:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDD02188CE09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 07:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1960D192B66;
	Tue, 17 Dec 2024 07:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OZ8yJ3Ui"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6AFA29;
	Tue, 17 Dec 2024 07:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734421869; cv=none; b=mC3kPOSpMSzY3A9CA9fdVdoreDduQodiMQZxdazUXdrGJIGAzIjwEvsxX49BuI3m1KY/LxW4cDk2yrxb9Zq9nD5P5Ub84xwkzavqYNENSbNe8i3kuhPCMxYJ1G6uwOkobzRzM2ivbD6hWvGvWHtI27jhtd1KWtYxGg7zeOeC+dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734421869; c=relaxed/simple;
	bh=/7pgGC3NTj2JpUtIKHmal2KVbCa5wlHMP7hJIk5gmQ8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=m79+06TnYbTIQM+w8zYkPnqxHiDiveqLkiE0D/WxgNMgVAj5UPqiq7/+05c7F9JejO2EdTt7asW6X9ZLo3msa1p8MsTs8yjUO+T8CeNWkcp8TmVKNJJIjfXBYvr4IBJ7s5x5+O3Udpgjh228xUB/keNJusHhMPBzP8ATRXtjxaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OZ8yJ3Ui; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6231h005880;
	Tue, 17 Dec 2024 07:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQL5qS2pe+X8kDeHnQVqNSkQhE3qui4U3YosF4AomTs=; b=OZ8yJ3Ui89Z5Uhi/
	hG8EzDrXmLKBaWRwiFLOaf8rzxUlqMe2t1X4hxPR38Av+6ip/R0oldSRCP69dYx2
	geMNfS518MXgen3E/CZ/3ClOCXUlPJx31CbQZ1f5pvz8YMliJwbuVmdie9XE9XXi
	H5afzyZhhISur0pXSnsP7wN6bBw80Kpa5WFbsMu2LBS+YIHO7LpigQS1y0fYVagU
	xEp4390g2kObKdUuvKCEjM80AnB7H6vlVBZM0bPgnoF0sgfh4N6FYAuDe++EmBzP
	hiAnjEcOt8RQ5JHvcIzjsUec6f5eOK13jKkNxy1S+C0XM24oNzY0jJYFZ1gcuILv
	6f3AFw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k3p48908-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 07:50:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH7orrD021258
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 07:50:53 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 23:50:49 -0800
Message-ID: <f839a280-aa76-4963-9580-a6e089136bb5@quicinc.com>
Date: Tue, 17 Dec 2024 15:50:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] Add Qualcomm extended CTI support
From: Jinlong Mao <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20240903121847.6964-1-quic_jinlmao@quicinc.com>
 <742d1cec-13ec-4f08-b7f3-611c6d602b3b@quicinc.com>
Content-Language: en-US
In-Reply-To: <742d1cec-13ec-4f08-b7f3-611c6d602b3b@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GLJg2LnoYiq9y_XL-l9hMt1WX2YF8zQO
X-Proofpoint-GUID: GLJg2LnoYiq9y_XL-l9hMt1WX2YF8zQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 phishscore=0 spamscore=0 clxscore=1011 suspectscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170063



On 2024/10/10 17:49, Jinlong Mao wrote:
> 
> 
> On 2024/9/3 20:18, Mao Jinlong wrote:
>> The QCOM extended CTI is a heavily parameterized version of ARM’s CSCTI.
>> It allows a debugger to send to trigger events to a processor or to send
>> a trigger event to one or more processors when a trigger event occurs on
>> another processor on the same SoC, or even between SoCs.
>>
>> QCOM extended CTI supports up to 128 triggers. And some of the register
>> offsets are changed.
>>
>> The commands to configure CTI triggers are the same as ARM's CTI.
>>
> 
> Hi Reviewers,
> 
> Could you please help to provide some comments from the design point of 
> view for the changes ?
> 
> The main difference of extended CTI to the normal CTI is that the
> address mapping is changed and it supports a max of 128 trigger signals.
> 
> On one soc, there will be both normal arm CTIs and QCOM extended CTIs.
> 
> As max trigger number becomes 128. So triger registers becomes 4.
> 
> Like CTITRIGINSTATUS  --- > CTITRIGINSTATUS_EXTENDED(n)     (0x040 + (4 
> * n))  n is 0 to 4.
> 
> Thanks
> Jinlong Mao

Gentle reminder for the review from the code design point of view.

> 
>> Mao Jinlong (2):
>>    dt-bindings: arm: Add Qualcomm extended CTI
>>    coresight: cti: Add Qualcomm extended CTI support
>>
>>   .../bindings/arm/arm,coresight-cti.yaml       |  14 ++
>>   .../hwtracing/coresight/coresight-cti-core.c  |  75 +++++++----
>>   .../coresight/coresight-cti-platform.c        |  16 ++-
>>   .../hwtracing/coresight/coresight-cti-sysfs.c | 124 ++++++++++++++----
>>   drivers/hwtracing/coresight/coresight-cti.h   | 123 +++++++++++------
>>   5 files changed, 253 insertions(+), 99 deletions(-)
>>
> 


