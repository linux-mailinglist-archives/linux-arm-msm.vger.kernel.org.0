Return-Path: <linux-arm-msm+bounces-39150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C28D9D903A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 03:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4E8616A060
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 02:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C46DF60;
	Tue, 26 Nov 2024 02:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CLpiE00A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AACB672;
	Tue, 26 Nov 2024 02:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732586643; cv=none; b=icc5Cwh9dCAQphmjCZ2B/51Qs0As4o826OZb9uy1eJpCNYINaW+L5qai5nzDSJeyasC34/TxslK2hiZBLo0Pt+FULykBrWPrh3q2vw3l9761nVtRRFFeRjk9qKe/UCUw8RqbQWJR444DRChmxVlDthqkK8nZGrNh4aqbE/atG+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732586643; c=relaxed/simple;
	bh=KY9QVG35V33M3yvM020XF2EgLyCtZQ6islf4r7hArXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XkpCN4f2OKxG+uWouAsZ/rjaqrN9Q5FIppNL60osz29T2VGob9YqvTNiyy9C8+sZuW//q0WYzNURWaDg5iuHLGAyt8zzR4NGwTEXRQ2cNBcEQIF4fMvRgJUO60AYPSpz0NyAOIwIWeh0hpr0H5rAXw5pM8JV5bvdHpLyVjJUUNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CLpiE00A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APFeulb014539;
	Tue, 26 Nov 2024 02:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYjWChBvP98BCdvoCODQukJ9e1vThwOxMEM7cCrvZRU=; b=CLpiE00AFetNcr0T
	2zIzCYr8EIHqLWYgYoGtDI3wPNCWScjYOiktzregaRert/dPm7rBWdlTYmyNGmRh
	rZ2l4JtDhOPDu+jtmB3/XDZk8l0zB7oC5ED5r5F3O5aHVA4lqKyhlovbb2VX0uae
	kX8oEVq0yAvY/MzA+AcJaFvrFdubDOWrL4EHheNAVDbeXd5qR2RwFkpO5ElBngd9
	WsHHr39yyU+zRBO2I7F3aQaZvHS1iBIQi5SVRifRoLjQuN4lnaXOPTiA7F2r53IP
	kQQl45Aw9v1k6UmtGBbacidozTYf6rVc75o911rtAxZMQwZ4Gxv5dZjGIzRTWeBH
	F1sN3A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434nyg2n77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 02:03:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQ23rbd027020
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 02:03:53 GMT
Received: from [10.110.75.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 25 Nov
 2024 18:03:52 -0800
Message-ID: <784a7813-b024-452e-8d7e-8cbaea761bcd@quicinc.com>
Date: Mon, 25 Nov 2024 18:03:52 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/msm/mdss: define bitfields for the UBWC_STATIC
 register
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Connor Abbott <cwabbott0@gmail.com>, David
 Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
References: <20241123-msm-mdss-ubwc-v2-0-41344bc6ef9c@linaro.org>
 <20241123-msm-mdss-ubwc-v2-1-41344bc6ef9c@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241123-msm-mdss-ubwc-v2-1-41344bc6ef9c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4og3NpsBxv4WY-Z7NQ7DQwu_3JEWZ0AQ
X-Proofpoint-ORIG-GUID: 4og3NpsBxv4WY-Z7NQ7DQwu_3JEWZ0AQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=999 clxscore=1011 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260015



On 11/22/2024 9:44 PM, Dmitry Baryshkov wrote:
> Rather than hand-coding UBWC_STATIC value calculation, define
> corresponding bitfields and use them to setup the register value.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c                 | 38 +++++++++++++++-----------
>   drivers/gpu/drm/msm/msm_mdss.h                 |  3 +-
>   drivers/gpu/drm/msm/registers/display/mdss.xml | 11 +++++++-
>   3 files changed, 34 insertions(+), 18 deletions(-)
> 

<snip>

>   
> diff --git a/drivers/gpu/drm/msm/registers/display/mdss.xml b/drivers/gpu/drm/msm/registers/display/mdss.xml
> index ac85caf1575c7908bcf68f0249da38dccf4f07b6..b6f93984928522a35a782cbad9de006eac225725 100644
> --- a/drivers/gpu/drm/msm/registers/display/mdss.xml
> +++ b/drivers/gpu/drm/msm/registers/display/mdss.xml
> @@ -21,7 +21,16 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>   
>   	<reg32 offset="0x00058" name="UBWC_DEC_HW_VERSION"/>
>   
> -	<reg32 offset="0x00144" name="UBWC_STATIC"/>
> +	<reg32 offset="0x00144" name="UBWC_STATIC">
> +		<bitfield name="UBWC_SWIZZLE" low="0" high="2"/>
> +		<bitfield name="UBWC_BANK_SPREAD" pos="3"/>
> +		<!-- high=5 for UBWC < 4.0 -->
> +		<bitfield name="HIGHEST_BANK_BIT" low="4" high="6"/>
> +		<bitfield name="UBWC_MIN_ACC_LEN" pos="8"/>

MIN_ACC_LEN OR MALSIZE has 2 bits , bits 8 and 9.

But bit 9 is unused today. Hence we were using it as a 1 or 0 today.

Its unused on all the chipsets I checked. Do you want to continue using 
the same way or correct this?

