Return-Path: <linux-arm-msm+bounces-24063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EBD915D99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 06:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39073283645
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 04:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4C113AA3F;
	Tue, 25 Jun 2024 04:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IKP2aFKg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034F813A253;
	Tue, 25 Jun 2024 04:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719289615; cv=none; b=KwLdDPR+qn4g/ActmO2JZEESiQX8qyQF5m2b2X+ApgmeiRAiAvj1AzjRR8ZA1OJo7FSsuOJDrFZX3+lm8akTPSjcYKeI4XijckVfcWWlMvsvq/jPmHfwtQt3cQqumeeKMB68QnUt9oIVPvKewUeZn1VrcJ7puTJ563QEcTGi99k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719289615; c=relaxed/simple;
	bh=ngh9di9YBwGCpDip0VXhG5NC6zupRVpU4kXqowfdV6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hBuIgFZVo28pHbnm9CnlznFWtyisI2RQ7GcpQFPDdW8u7l2VYzmmRFwW2UgP8k+3/xn0Qh/BwZmqUjTK3cntr+1x3mVNnNz+7CEfDMeTTDbfKgitPC/F/LR4HwtZJZNu8IXZR8ZdyEqDi/luuDHRVuKRrIIHMPHDWy3Jz7IQiaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IKP2aFKg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OIUsb2024767;
	Tue, 25 Jun 2024 04:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rYFqU0H/VyUp2ne+cOQ2385R1oRcm4cDigTTCRrLIDw=; b=IKP2aFKgahJxegvl
	a9kBuhjVlRb/JESUo9cBmpOQWHOVLUQX6J1VJpvk44DYBXjQ7kCFGZdSY/9MIzhA
	Rqdqx8wMNJfIQX20n3O3WlpFpp7bTUATn+1Ss3cu3Uz3RSi0tihM2DmPkMkut4Rg
	ZeCG+3i9oni+8xkJrUv8x/45CT3zf7dMJpx7qCCYOv5L1KhwBFLGEIXphnDokdcW
	5ssine/NLhIFzGnEKcTZsAxOD9OYeFlo50r6nhvysOBtTaozjyeDqkKOV4a/BasR
	46z9W7D4wbVNyxTuu7RRzNCdFpHu4MYqd7GXhrx9qURVgbTQ2P/NzpdNdFhlSkJJ
	9UvOrQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqshne55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 04:26:11 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45P4QB7K004892
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 04:26:11 GMT
Received: from [10.151.37.150] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Jun
 2024 21:26:05 -0700
Message-ID: <070cee1c-e19c-45de-a3c3-a1b8feda0e9a@quicinc.com>
Date: Tue, 25 Jun 2024 09:55:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/8] remoteproc: qcom: Add PRNG proxy clock
To: Krzysztof Kozlowski <krzk@kernel.org>, <sboyd@kernel.org>,
        <andersson@kernel.org>, <bjorn.andersson@linaro.org>,
        <david.brown@linaro.org>, <devicetree@vger.kernel.org>,
        <jassisinghbrar@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <mark.rutland@arm.com>,
        <mturquette@baylibre.com>, <ohad@wizery.com>, <robh@kernel.org>,
        <sricharan@codeaurora.org>
CC: <gokulsri@codeaurora.org>
References: <20240621114659.2958170-1-quic_gokulsri@quicinc.com>
 <20240621114659.2958170-2-quic_gokulsri@quicinc.com>
 <cd0533b8-bb47-4c68-b970-6bad4204c636@kernel.org>
Content-Language: en-US
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
In-Reply-To: <cd0533b8-bb47-4c68-b970-6bad4204c636@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BYyeMRgIUy4mtMKn2ju_fg_qowXYRlCk
X-Proofpoint-GUID: BYyeMRgIUy4mtMKn2ju_fg_qowXYRlCk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_01,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 mlxlogscore=948 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406250032


On 6/21/2024 8:39 PM, Krzysztof Kozlowski wrote:
> On 21/06/2024 13:46, Gokul Sriram Palanisamy wrote:
>>   
>> -static int q6v5_wcss_init_clock(struct q6v5_wcss *wcss)
>> +static int ipq8074_init_clock(struct q6v5_wcss *wcss)
>> +{
>> +	int ret;
>> +
>> +	wcss->prng_clk = devm_clk_get(wcss->dev, "prng");
> Missing binding.
   Thanks. Will address and post this in new series.
> Best regards,
> Krzysztof
>

