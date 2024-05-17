Return-Path: <linux-arm-msm+bounces-20003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D708C8ACF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 19:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB5701F2511D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 17:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A7D13DBBB;
	Fri, 17 May 2024 17:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SXv+eT33"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FF713DB83;
	Fri, 17 May 2024 17:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715966440; cv=none; b=pvw6P7HXUE640TJxBDS9pifhddFS/n4sqkaaYdS1PfCb56gxF3GUbN7jTEe2/8HdLDUpZkcshy/S8luQcaBy9C54lXemgpBWKYQFfk+HlLh7sszmV2O6UEvIK/aPJJ+OR8pJ8kycsrskDpaJOK7r++EFZAOYt1yb5QCxF9emzq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715966440; c=relaxed/simple;
	bh=bGx5fE8ig9g3KHDsz9s7MhC3JHjF6v+ZqWiEcDWnt5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=h0NhKE7OdofOwVC1HSq8KZsmSPQcunhyQ1Z4rluwwiJvOUDm7h/dMWTZjDKxzT9NRtf/MXfXOLhL4gcoNRGmKPAxJ7Z/0ei5/7iwDmN80tiFCQ5svH/BiezgSTywnOno0Jlb9p++WLxUIilO4Q7FSdjIvyTan+H+boAv6QtRFKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SXv+eT33; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44H98KK7007278;
	Fri, 17 May 2024 17:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=QEQp5msevNm4J4LDm9KOVT44ZsbOilXU6qGhunnZvBw=; b=SX
	v+eT33slzj66rpBelip6MvHlnUed3GkAQ4pD0Zi5tc3Tx8iL/MEa7eBwUHs/8SUY
	IHLugdQ1FWZi8MOd8d5dqpBBXuXHX1niQ+ki1Nd9+X4SehbxC8IgpIXQzQSFVMb5
	RnW2DZ18Qr/3+PvhvZ5hJ/UIeiH5+qVMu5uKLxhh/kxYPwEEnZnqh+McwInskgfc
	rZ/ElEC0CVWEutgl6jIBMXDqZgWPABeli3Zi3SKUFHbLMcLM0P66IpoltPJ1sxzL
	nfKR4E6QjBZ9X/hikxXtYOM5/H/nfanjl+TeELqsExTpkwQqQToGBNUs0QIqQFU4
	dxr05YbfILxoN483upBw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y49ge0m58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 17:20:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44HHKFuP008062
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 17:20:15 GMT
Received: from [10.110.27.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 17 May
 2024 10:20:13 -0700
Message-ID: <b264bd9c-c355-4b08-8e52-7adc23cb0b20@quicinc.com>
Date: Fri, 17 May 2024 10:20:11 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] remoteproc: qcom_q6v5_pas: Add hwspinlock bust on
 stop
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>,
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
 <20240516-hwspinlock-bust-v1-6-47a90a859238@quicinc.com>
 <40730e9f-ae2b-4b56-89bd-f839876271fe@nexus-software.ie>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <40730e9f-ae2b-4b56-89bd-f839876271fe@nexus-software.ie>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YKCFMaI2rJ-_gTZA9j16KUiazNOWtQPz
X-Proofpoint-ORIG-GUID: YKCFMaI2rJ-_gTZA9j16KUiazNOWtQPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_07,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 clxscore=1011 priorityscore=1501 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170134



On 5/17/2024 2:08 AM, Bryan O'Donoghue wrote:
> On 17/05/2024 00:58, Chris Lew wrote:
>> From: Richard Maina <quic_rmaina@quicinc.com>
>>
>> When remoteproc goes down unexpectedly this results in a state where any
>> acquired hwspinlocks will remain locked possibly resulting in deadlock.
>> In order to ensure all locks are freed we include a call to
>> hwspin_lock_bust() during remoteproc shutdown.
>>
>> For qcom_q6v5_pas remoteprocs, each remoteproc has an assigned id that
>> is used to take the hwspinlock. Remoteproc should use this id to try and
>> bust the lock on remoteproc stop.
>>
>> This edge case only occurs with q6v5_pas watchdog crashes. The error
>> fatal case has handling to clear the hwspinlock before the error fatal
>> interrupt is triggered.
>>
>> Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
>> Signed-off-by: Chris Lew <quic_clew@quicinc.com>
>> ---
> 
>> +    if (adsp->hwlock) {
>> +        ret = hwspin_lock_bust(adsp->hwlock, adsp->hwlock_id);
>> +        if (ret)
>> +            dev_info(adsp->dev, "failed to bust hwspinlock\n");
> 
> qcom_hwspinlock_bust() already prints an error on failure, you're 
> printing a second error here.
> 
> Choose at most one.
> 

Ack, will remove the error print here and leave the one in 
qcom_hwspinlock_bust()

> ---
> bod

