Return-Path: <linux-arm-msm+bounces-33679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AD39966AF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 12:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D48328336C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 10:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41CB18FC65;
	Wed,  9 Oct 2024 10:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a1Mp+NNM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F72818D640;
	Wed,  9 Oct 2024 10:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728468626; cv=none; b=iLd1C9fG3m98nZC0ODUSMPPrbq/Vxmb4Vu3PDY7YfnwxAv316h8Gc1m55MP0kGhh0CtQkDHOxD1s6QkQQhNnjmcr5wpQliEEsbNaF8vTK//GRu5F3FH9jpsBcFXLHGyHIELtzF7Ow5ixPlFfs4JCc5pUpZbvorSsAyi0TJCbB04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728468626; c=relaxed/simple;
	bh=+ffdGvydL+K0g6GT+woMHoeS9IAo6WhvHNnz7JWbWaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mrZz/LVJIQ/wi+npBcXz+mZnEH7H9qYiKXXCp3kVp3YdT4celQBc1nR8UrZ7v1Liw/To04NQPQjwinCl9IH85moix6FMGcuU3e8ZY5rd4nPaqItn/LRwJk80nNe/X1csAjxxwATTpLJk1eYZcGEJ0vxxRbRFeWi9QECpdJV72a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a1Mp+NNM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4999p7bO006880;
	Wed, 9 Oct 2024 10:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eRCqpdgyku5vfU+giMUh7zvuCPuY8rnO6KeBTnScM0M=; b=a1Mp+NNM8p544DZp
	Elsnvb5owye02M36jQnRAx8bkFD2CUDeTWyM7ieLaqlvVZ0d0o6WDUjvwAXgQwbl
	HWWL7+FM8LJpqQqo6wceykQzenFWb62SDz8VU+1coJUDA7oOx6brEOBv7T29XdY1
	2JAi03UwrJdWhYw6B+UnvgidxZfBaKBpvE7kvo32lTKsZPUXR5pnkCra6y6oMDn+
	QUatioQ2OBlHpRnV/BBfB/7hOdqLxAQlBFsWj/Q2MBqWuWvCEyw3ZmCoiaW5iZdz
	vN4HuPLt7/Z436FKDm1XBeonlPmqVT7QTz0CDshY3w1A43tHgur9iSFE0FcNwlMu
	GycIUQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424cy7ewma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 10:10:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 499AA3gv006978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 10:10:03 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 03:09:56 -0700
Message-ID: <e9b2bd7d-1e4f-4f0e-8be5-18033a8ec964@quicinc.com>
Date: Wed, 9 Oct 2024 18:09:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 0/5] Coresight: Add Coresight TMC Control Unit
 driver
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        Song Chai <quic_songchai@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20241009095556.1754876-1-quic_jiegan@quicinc.com>
 <dc93578d-0ef6-4446-ae40-ad9f4ba6af15@arm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <dc93578d-0ef6-4446-ae40-ad9f4ba6af15@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mtbhRxcC0UxtiCWLGHcW7yXGFS_zwCWU
X-Proofpoint-GUID: mtbhRxcC0UxtiCWLGHcW7yXGFS_zwCWU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0
 mlxlogscore=932 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090066



On 10/9/2024 6:00 PM, Suzuki K Poulose wrote:
> On 09/10/2024 10:55, Jie Gan wrote:
>> The Coresight TMC Control Unit(CTCU) device hosts miscellaneous 
>> configuration
>> registers to control various features related to TMC ETR device.
>>
> 
> Please rebase this on the v6.12-rc1, which has the sink specific trace
> id allocation changes and drop the "Depends-on" tags on the patches
> which don't make any sense at all.
Sure, I will drop all depends-on tags and those patches already rebased 
on tag next-20241008.

Shall I resend those patches with V5 RESEND or V6 after fixed the issues?

> 
> 
> Suzuki
> 
> 

Thanks,
Jie


