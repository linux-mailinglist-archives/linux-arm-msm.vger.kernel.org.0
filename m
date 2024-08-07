Return-Path: <linux-arm-msm+bounces-28125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDA294B3CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 01:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 167561F24037
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 23:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9BA1553B3;
	Wed,  7 Aug 2024 23:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d3K+s44V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A985214EC5D;
	Wed,  7 Aug 2024 23:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723074162; cv=none; b=crhMgqNTxy+PaPTGg89DH8V327squ+SIqC4tVjF9bKN9402bHUlL0oad8ORlCLO25SCvUeav2cN++sXGbj7QR6Ov0uxTwVdIizHUO7JGbnWUTpec1Y1WyYcCsXunvzSBEpauMyXBgHrq71dEeISZSVkO7xfR0ACQOqk6lhOOH2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723074162; c=relaxed/simple;
	bh=yGtXHO7ofPsg49/Nkw1N/kkphN5BPDPfzsXLmbXQgwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bC9XEiP5glO0DAzOafz3h8gqqSQKBvO2LXxkLZf8c7xnMRv2+CAVvxEZzBlcYANn171d9+OzHndLNAQiTsP6zlTCaLDXoN2mfuCOlLmh5T8NrEMFuGohML2WeR5I3EOxsovqqoWmqirdlN4YBO1DrZnhYvqUnh5WyjO3fe5p6oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d3K+s44V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 477IOmqk007179;
	Wed, 7 Aug 2024 23:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5I2gYpabj9CGx7ebUx6DWPx/R0/d3mN7u8tcF+Bsokw=; b=d3K+s44VXzk+x87c
	FxpxrF+kqPONuizIjLZ/nfztTlmQEjl00AXyuc9WRtlonWFSzIdu9pL1blrzSIQw
	7jrTA67OugYNeiARQKrKEGaH0LvtijdWOhRLvcg5yFLWC+Qri33zCyJlqhymHJtQ
	L/gPzjJtY2+AvJj+VZ/ImLvvIRDaCHNrX6oj9De26FEaYoAzYiGgrp8E/ikYuWAk
	gPrpJ8LPcahWOWo0OMcoFwXNiYJ9My13dv0OqnWgjYtH2N96Brwv9k3MT1JHCchF
	1R5EbTYe7ToWZ6jZBCeCRtwZcyHhG27a4PZPDe0RjiP1/Mz68WNhVJbYQtvQEqAJ
	60cZkw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40scx6v9r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 23:42:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 477NgYnp000521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 23:42:34 GMT
Received: from [10.71.112.173] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 16:42:34 -0700
Message-ID: <7b34d3df-98cf-47fc-815d-8c515a68ffb1@quicinc.com>
Date: Wed, 7 Aug 2024 16:42:33 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rpmsg: glink: Pass channel to
 qcom_glink_send_close_ack()
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240805-glink-tracepoints-v1-0-a5f3293fb09e@quicinc.com>
 <20240805-glink-tracepoints-v1-2-a5f3293fb09e@quicinc.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20240805-glink-tracepoints-v1-2-a5f3293fb09e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lXbtn9vxz7rmA4RR8aCDNfMmxk6E4vkE
X-Proofpoint-GUID: lXbtn9vxz7rmA4RR8aCDNfMmxk6E4vkE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_14,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408070166



On 8/5/2024 8:56 PM, Bjorn Andersson wrote:
> Align the qcom_glink_send_close_ack() arguments with other functions to
> take the struct glink_channel, so that the upcoming tracepoint patch can
> access the channel attributes.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>   drivers/rpmsg/qcom_glink_native.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Chris Lew <quic_clew@quicinc.com>


