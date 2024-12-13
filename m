Return-Path: <linux-arm-msm+bounces-41970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FDD9F09DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 705AB16A30D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3DA1B392A;
	Fri, 13 Dec 2024 10:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BxDxXCHa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4451BE871
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734086513; cv=none; b=WpF5d6qUqbfc7mGjq7sRswnDxYI0OOVNtNvrq/bsrcWpD5mDRfmdkHtH0Rp+5YmLq4PVN1jhSOeN6nt2UmTPk0Yt0OtmRUDWMI6Si4nkgTR2dubCVWvNg9IuvIBWU+BY3QeLnmCIeMCZx6FbNoNoUucDgX3TGRcVq6yX7b68WOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734086513; c=relaxed/simple;
	bh=aeW9kMMGfgX8aB/yqCjSOm98WV3VytTuLcNHiybgwdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=o2hd8AA0hHJWwVmUglb0y08f0PV7P1rbJM6POA951Bh2QQHTDkwvaJg8DRyj65TfIguHZL3CbtHp6+D9MScby+63CkwJcLkoURpuk5nEupoRQ2+GhMi8+2U8AWP4YFgIpURqgJXOcidbiAI5u2b3EsSfqx8ChdbomNTHBPBK0lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BxDxXCHa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD8rlVZ022838;
	Fri, 13 Dec 2024 10:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F7dJuBWOlZbyLOpDMZu8mi2U03SalrRw5tG7sEM4G34=; b=BxDxXCHa3/IYd+F8
	+dDSfIf8xsLzEXOs15Xcn0TAPih40u2graBST4/4DzkIwayaudlVhvhnqYEbhGcr
	HY0Er8/ADepHb8RYsJfalHhJhPdzCU+IEOar++6EkQjScIX4/3TcJXC8iNi8RHdl
	ym+AsqOKjabTtLNgBvVyxVyKPAvU4xAA1swsZiAsLnxfWESkX1psaU1X04wj0Z4L
	SyZcofqC0H8HTfdsH3o8BRiatRaqK09ArVedTrO9XYk+aBSOrAgMjJvzpDjl0gij
	M7QNbpfxe7qRkfGSR+5I5al9bslc5o0CLJGmD2LGWVYc2dfKRA4PoZQ4viiMgzNt
	MsmvSg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g4wna575-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:41:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDAfoZT022688
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:41:50 GMT
Received: from [10.232.155.95] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 02:41:49 -0800
Message-ID: <8fa98b69-1a68-4cc8-9806-cd6ea3ee940b@quicinc.com>
Date: Fri, 13 Dec 2024 10:41:37 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix typo for struct
 qaic_manage_trans_passthrough
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <quic_carlv@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20241129202845.3579306-1-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Youssef Samir <quic_yabdulra@quicinc.com>
In-Reply-To: <20241129202845.3579306-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MkfWWredAErxCE9fyNvneoZ4edF-EGfo
X-Proofpoint-GUID: MkfWWredAErxCE9fyNvneoZ4edF-EGfo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=757 spamscore=0
 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412130073



On 11/29/2024 8:28 PM, Jeffrey Hugo wrote:
> The documentation header for struct qaic_manage_trans_passthrough has a
> typo - "t" is missing in "transaction".
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Youssef Samir <quic_yabdulra@quicinc.com>

