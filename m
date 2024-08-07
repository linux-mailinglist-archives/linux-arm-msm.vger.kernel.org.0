Return-Path: <linux-arm-msm+bounces-28124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA63794B3CB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 01:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B31801C20A41
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 23:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE951553B3;
	Wed,  7 Aug 2024 23:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AYrj7uNR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EA9148FFF;
	Wed,  7 Aug 2024 23:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723074144; cv=none; b=leIlLy8PsBn4mBTG+T1m1jtLz776kx1E7RLr+0zpRuFnY86EGE80MyElW9xh2mGIYC/XI7S/fG5nwNUoc7BjntxJRazcbunRELtd5508XljZZyVUf1Zvz2/BZnSXItYNiZRSqA8XkhOAOjowJLE44m82uM61fXNMtFpyfJPfarQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723074144; c=relaxed/simple;
	bh=SDnooXiMPjveErWtDF5D96JovIXPHI2wmHlDI8V+H4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=QukFqri1KpAVH9K1BuajuJqrpj1eJTuqk4JMNBmOog6zQZyyB9c5TM2UkDicsoBU1/rNWxoqdcO1ftlEMvGhkIv5NN9ZScslaMSISAcqQwVkcRPep98t4VTmlINZGhCBY0DhLa6hMO7emO1jSmx/N2nz2CQlke05oIUfbumqflY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AYrj7uNR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 477KQ7ab008155;
	Wed, 7 Aug 2024 23:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jmYhQoRmvdrHL78PtexV6fn9tkT+h6zQBs5+EBNa7+U=; b=AYrj7uNRb91waKLb
	7soD/rcmPy4ll1iQlYt1u5T1jBwwaM+IqgLK9c7FOlSBvgRlbxvn13h1FV7rWe3t
	cKEyL4zJKdSTd94IDPdpY2CKDISJ3minxEDiVnfEYf2ENLglHJFV+J3FmeywOmLA
	Epx3WQu0KmMOBAH8oZw4oyRVr3eYaFtCHLgAMRaQSBoVD6u2Y6NyNQ8AZi+MbjVf
	MNvZO5j2hSywInKiz7ZNajRm5BYz/yeFdHjLxfMkqEv5L50JrymJDxsKPiWq1Gqw
	wsoKHBtGTF7t/eKyah9qCCM+DYVG+pwDoXUi1V/ZzfzxEQroqWXC4Gj+RBuz69DM
	DohRxg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vfy58a9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 23:42:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 477NgIqP014023
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 23:42:18 GMT
Received: from [10.71.112.173] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 16:42:18 -0700
Message-ID: <3088a9cf-aad4-4495-8fb1-bc9cad1e0386@quicinc.com>
Date: Wed, 7 Aug 2024 16:42:17 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] rpmsg: glink: Tidy up RX advance handling
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240805-glink-tracepoints-v1-0-a5f3293fb09e@quicinc.com>
 <20240805-glink-tracepoints-v1-1-a5f3293fb09e@quicinc.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20240805-glink-tracepoints-v1-1-a5f3293fb09e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XvRszvJ1CT5JDCj1xYRIjo1RbnU4oZ8M
X-Proofpoint-ORIG-GUID: XvRszvJ1CT5JDCj1xYRIjo1RbnU4oZ8M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_14,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 adultscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 mlxlogscore=647
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408070166



On 8/5/2024 8:56 PM, Bjorn Andersson wrote:
> The operation of advancing the FIFO receive pointer is sprinkled between
> the interrupt handler itself, and functions being called from this.
> 
> Push all the RX advancement operations to the individual handlers, to
> unify the style across the handling of the various messages.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>   drivers/rpmsg/qcom_glink_native.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)
> 

Reviewed-by: Chris Lew <quic_clew@quicinc.com>


