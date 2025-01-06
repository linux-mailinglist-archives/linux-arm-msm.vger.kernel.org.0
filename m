Return-Path: <linux-arm-msm+bounces-44043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52110A0312F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 21:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C59783A4489
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 20:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FA21DD0FE;
	Mon,  6 Jan 2025 20:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VNKYLYNX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D87134B0;
	Mon,  6 Jan 2025 20:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736194284; cv=none; b=NzDq0ABdqxTiNbLhs8U7YRLMCd1wMWXkgyJ7SfUI2K7s3f5nwLzA9MHZ9RQ9Z4ObgfRfdOQkw6XnGtUhXmmZ0gXnRimk3sG12s0mIZR1rzB2mvgI0TpQNn7jCdxWWEDL8jXTPKHjZd1B5SWe9CLxe3ha+CvoJtT0OyC666Q0wFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736194284; c=relaxed/simple;
	bh=C9Yc1JQDehF1KZSUYGrbIg3H98ye5ZdYoAOz6009CsE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=Hu4goD3foRPdyioCi0pgADwIn+GEkOHXiOPY7DCFFi+V+bneQrh2hv6IOSON1TiJAthOZMZZdDgftFjUJ8z1w8ueClNeXDCr8K22kHCPkW+ScWXSUYbdf6UaXUUvJNHPD1jHmv87s630zf1ZEKkXl8dVOUhFVQiaPIsYY/c791Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VNKYLYNX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506JOg64024445;
	Mon, 6 Jan 2025 20:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OKShWIVvgC0hd8TSAF8wwXIgWBFjhPDo296N/okMqfU=; b=VNKYLYNXaursvtDr
	QZwRukHb9CM8+iECtftz9azCeyMCPKBNpewzN+AJCQs5a/XUMRoz0brQNaoWHnbL
	r8i6IfeeEwJvS9KzKh7/S6mOMI+LnSMDN0yxhs8+fREkipq10zxWWeKc2++h5hMe
	ZBojQq2bBnOsW758pTz+kq5NHwyL/UA70zWdubqXlu//R7cX7+J3Cnk59dJorDc0
	WwN5mZbpTYS21VvK2yV4/E769GKIowZGEM0yb8bB3LDpsJb69VJwRipRB1iWGYs5
	dv4JtSpKUqJhVlITyfL47hEKfKF+wKapPi4gJJVqcwq5d2gvpfdKLyBjmKq3vx5M
	B6+6lQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440nadg2p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 20:10:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 506KArrY029637
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Jan 2025 20:10:53 GMT
Received: from [10.216.24.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 Jan 2025
 12:10:50 -0800
Message-ID: <48373519-2867-419d-9f51-e7bd330b311c@quicinc.com>
Date: Tue, 7 Jan 2025 01:40:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, <iommu@lists.linux.dev>
CC: <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        Robin
 Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark
	<robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
        "moderated list:ARM
 SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
        open list
	<linux-kernel@vger.kernel.org>
References: <20250102183232.115279-1-robdclark@gmail.com>
 <76b822f0-c4c5-4d47-8e0b-c1eee513e228@quicinc.com>
Content-Language: en-US
In-Reply-To: <76b822f0-c4c5-4d47-8e0b-c1eee513e228@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0zZpxDVwd0sIlNSE1sDlJoY_CJ80Fchs
X-Proofpoint-GUID: 0zZpxDVwd0sIlNSE1sDlJoY_CJ80Fchs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 mlxlogscore=823 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060175

On 1/3/2025 1:00 AM, Akhil P Oommen wrote:
> On 1/3/2025 12:02 AM, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> On mmu-500, stall-on-fault seems to stall all context banks, causing the
>> GMU to misbehave.  So limit this feature to smmu-v2 for now.
>>
>> This fixes an issue with an older mesa bug taking outo the system
>> because of GMU going off into the weeds.
>>
>> What we _think_ is happening is that, if the GPU generates 1000's of
>> faults at ~once (which is something that GPUs can be good at), it can
>> result in a sufficient number of stalled translations preventing other
>> transactions from entering the same TBU.
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> 
> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> 

Btw, if stall is not enabled, I think there is no point in capturing
coredump from adreno pagefault handler. By the time we start coredump,
gpu might have switched context.

-Akhil.

> -Akhil
> 

