Return-Path: <linux-arm-msm+bounces-19035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 760298B8523
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 06:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3ACA6283BF5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 04:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635163BBCC;
	Wed,  1 May 2024 04:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PjR7yZQv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744403D556
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 04:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714539504; cv=none; b=G62ciEYLJV5dx+c4L0J0pJpx5PGoycs5caTo2AEuYiI/vvRgH0K9DLsB/VMZpbFosVGSjc+dTVCzmWxwVm76DRFrk0CWz+HWZtJsT7yKJIW96GrqaoCCl/ivg87v2kET2fcElqWXICeiLsQek+Y83qEgBNE6FgCwog0bA1p10YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714539504; c=relaxed/simple;
	bh=dzFqgbK+SiKGJY/sONAxqG/4FaxLuv8R4OaPXcxW+fA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dQDq1cTaVG1Nt60cBUwVu8x393hKoz2QFPnU9G+lImxTxfpWsQEyLMEZkTcDQTHTPK3Myoo3bqL9wjMapt37tVxXw9vZ94dcMrVtGmjyT1PFJF6WBtErDuT21eRTbFZgGvtiiFlNaEXV/G1Y7j7ToshCnahVtjxs6J8Wbej8rXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PjR7yZQv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4414cX7e001144
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 May 2024 04:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=jF9oVefyrZw/ZUpy5p2OSYk7tvaMLB/C/JYFozBRFbM=; b=Pj
	R7yZQvzP5iE8pncmT2RU5z2QBcfR3F7lNPsT4VInUMHBnvGls5Wk/8nhSQLps5Ub
	XDkPTtJez92fJ38vDPzBsU/PGyim8TIWKR4Vk9/n9kEaXbKMuNRnUQK77J+dO3Ex
	+ixDa8+nbx76qIrJ3AIQ3J68sb4bc2MVkwPg1FoM+L45tIspv9p7xrjrJ+dIuRGm
	GFt1I4LEp7OHDS+3vGQ/AyjPnNNlW4IScW5RWMiVbVxO37OAbW/qxBLwBwhETyn+
	uGSOy3O1BAE3CFtLPbKwP5H78l90jMnCz7kcA0qIRsu81shteUqE8laYt/37tGf3
	AN6p6JQAcv+VX4dHvlRA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xud76847w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 04:58:20 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4414wJrw028861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 May 2024 04:58:19 GMT
Received: from [10.110.13.136] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Apr
 2024 21:58:15 -0700
Message-ID: <cbc05a31-3186-00ba-f762-2937c2540401@quicinc.com>
Date: Tue, 30 Apr 2024 21:58:14 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] arm64: dts: qcom: sa8775p: mark ethernet devices as
 DMA-coherent
Content-Language: en-US
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20240430-mark_ethernet_devices_dma_coherent-v2-1-24fbbdc90122@quicinc.com>
From: Trilok Soni <quic_tsoni@quicinc.com>
In-Reply-To: <20240430-mark_ethernet_devices_dma_coherent-v2-1-24fbbdc90122@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7TIkqpCCVOBy4AbD2ejQdSCrGNX-2vvM
X-Proofpoint-GUID: 7TIkqpCCVOBy4AbD2ejQdSCrGNX-2vvM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-01_04,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 clxscore=1011 bulkscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=632
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2405010032

On 4/30/2024 8:45 PM, Sagar Cheluvegowda wrote:
> Ethernet devices are cache coherent, mark it as such in the dtsi.
> Fixes: ff499a0fbb23 ("arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface")
> Fixes: e952348a7cc7 ("arm64: dts: qcom: sa8775p: add a node for EMAC1")
> 
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> ---
> Changes in v2:
> Remove internal change-id from commit message
> - Link to v1: https://lore.kernel.org/r/20240425-mark_ethernet_devices_dma_coherent-v1-1-ad0755044e26@quicinc.com

I haven't seen this style of keeping the changelog at this place. It should

> ---

^^^ start here

>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

-- 
---Trilok Soni


