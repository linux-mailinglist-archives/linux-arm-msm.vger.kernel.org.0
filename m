Return-Path: <linux-arm-msm+bounces-20251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E738CC539
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 18:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44B031F21AA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 16:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EBE1420BB;
	Wed, 22 May 2024 16:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ibUtR13T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121E1141987;
	Wed, 22 May 2024 16:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716397087; cv=none; b=IQU82oJtIaZx0M+uVtVFVKJmBT2wZ1aeKPezgmus9inON4KFLb1GTu6eVTzZ2KFfWLnFpJLzmg/9OkFeWNJh9WJMmaDTr4IBnW3kmIpEx0gVntmzvgBmlfv8Jwy6tALpx0xJzGK53xAdUSNUWGvthXEprEnqHSDkVcgONE1g55s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716397087; c=relaxed/simple;
	bh=E5h3O5cIByDRNsZcFYywJBUlIQEj1GS7yrSXZ4mA3nM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hze7eP4sfLbtrBNkhviuvnbNePh9vEaZF+NhYkC5OzNV6/GXEEPlLZBQ0NrEBWV7WouC81GTiPbKXyvve3QWnzldlFgjaRHRHryh1WAnMM0B8omMF+oq2Mm1eErLLLgA/4owZ6T+HvKRAwMSpj41EJGqEWeyCSPueaTKuMUbGSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ibUtR13T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44M8PZhH027702;
	Wed, 22 May 2024 16:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=
	qcppdkim1; bh=tOmL9/AFDibhDK1zK16WjKaKvy/cUQ2rVwwdEQpirfg=; b=ib
	UtR13TjYa/u1fx38Tpd0Gep3EXQeWTexkYtwe/m1eTVLgpMBLOlanUPiK42dan+Z
	r4A6AFwvSNWCndgqC1oU472aC8g4dmNxo2I9mOLLHwTnRoCxfyPrUaMbirKlsl7K
	ftiQoBwRWA7TBRseYyzhrTaaQ9x18oO2pi9HPpzQ/ENh+oWL+yZtwK5X/fYja4jB
	NYkZLlLDc3GWwy1nFzk3Z39vwfAPjijziW9qRz8FI8xancMUHtOFSqFjjkTttsCy
	K2OAA+wHOdz5aDgxaDfapJQ1nnB1B82JPGvBBwrGBGjO19SknoiwroxEFF5m6CIV
	xEM1YDdROurqez1o322g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pq5hh5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 16:58:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MGvxhr014348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 16:58:00 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 May 2024 09:57:59 -0700
Date: Wed, 22 May 2024 09:57:58 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Shivnandan Kumar <quic_kshivnan@quicinc.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_rgottimu@quicinc.com>
Subject: Re: [PATCH] soc: qcom: icc-bwmon: Update zone1_thres_count to 3
Message-ID: <Zk4kFoM4wN5/BJuw@hu-bjorande-lv.qualcomm.com>
References: <20240522081508.1488592-1-quic_kshivnan@quicinc.com>
 <bc973b4f-fe8b-44e5-afbc-f3ce8a6fc873@linaro.org>
 <baa55c1f-2670-4a3c-abcf-ea4e841e4a1e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <baa55c1f-2670-4a3c-abcf-ea4e841e4a1e@quicinc.com>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N8pLjYiFF5KKa0DlwwyVY8BanAQoQSr_
X-Proofpoint-ORIG-GUID: N8pLjYiFF5KKa0DlwwyVY8BanAQoQSr_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_09,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1011 mlxlogscore=999 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220116

On Wed, May 22, 2024 at 02:35:21PM +0530, Shivnandan Kumar wrote:
> 
> 
> On 5/22/2024 1:58 PM, Krzysztof Kozlowski wrote:
> > On 22/05/2024 10:15, Shivnandan Kumar wrote:
> > > Update zone1_thres_count to 3 from 16 so that
> > > driver can reduce bus vote in 3 sample windows instead
> > > of waiting for 16 windows. This is in line with downstream
> > > implementation.
> > > 
> > 
> > This might make bwmon quite jittery. I don't think downstream is the
> > source of truth here. Please provide some measurements *on mainline tree*.
> > 
> 
> Hi Krzysztof,
> 
> The 16-window (64 ms) waiting time is too long to reduce the bus vote.
> At higher FPS, there will be multiple frames in 64ms e.g. 4 frames at 60FPS
> in 64ms. Hence, delay of 64ms in decision making will lead to higher power
> regression. I’ve tested this change for 4K video playback on mainline tree,
> and there’s a significant power-saving.
> 

As requested by Krzysztof already, update your commit message to capture
such motivation.

Please read and follow this:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

> I propose to make it a tunable,so that user space can tune it
> based on runtime depending on fps.
> 

I presume that in e.g. Android there could be some sort of power HAL
that tweaks this value dynamically? In a general purpose system, how do
we make sure that this value stays relevant for multiple types of use
cases?

> USECASE                     zone1_thres_count=16     zone1_thres_count=3
> 4K video playback           236.15 mA	             203.15 mA

4k video playback is a fairly specific (and generally unusual) use case.
Is there any impact (negative or positive) for other use
cases/workloads?

Regards,
Bjorn

> 
> Thanks,
> Shivnandan
> 
> > Best regards,
> > Krzysztof
> > 

