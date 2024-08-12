Return-Path: <linux-arm-msm+bounces-28297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B1894E683
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 08:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA4171C20CEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 06:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9EE14D435;
	Mon, 12 Aug 2024 06:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UOf1skM2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9B527457
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 06:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723443772; cv=none; b=f5VDqFgvDIaeuB8MgItC4z8qwR7bm5lRtP7ssyuXRYa76Q+EZEy7YrAAtsSuLXWMtOZdPT3deoLki6txN0eOPqghGa6C2nLvlJs1+piqs9xj3ie+kvovdLBUIiAKTN1eDslYdWP2RVvyFxoPqB3BsTEtP/ycN2+ttgMI58sWDCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723443772; c=relaxed/simple;
	bh=2X2zktOCPNtMwMfn++M+YFoWBAqn5W5AOnZNgLvuI7w=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFjTgg/r5PAjQmq6m0WPm60Y6MIet4gWaZNy6m0TThoZrEgL0cu97d1yoXEy69wu74St0mHQp8YXhZOTTDQFHzGeWlp1K3LjhTKyWWV/8wNpPY96odj5NW9P5t6Zz57AeciDJ3wk9tgP/QUAe7RmfqI/9C6Mttw+T3aB99l+FEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UOf1skM2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C2Zdhc026749;
	Mon, 12 Aug 2024 06:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c7kfLYR/umM4S8FWhltY+hdX
	/xVr0OLSm4xynhpyBFc=; b=UOf1skM2MyjQSs5iLbqG5GcfprT7XkX5Wm49STQu
	THxiFWMDDDzj73/BscdoOrUeU1BBdUiRIa/w7pBI0qNXIpj66SxpDAXWaSIv7YSB
	e3U9ifFWUARZMbxR1aSZBCHZDIYvijalSQBN4V0v593tjhS2UstMR2Ik65/bklG5
	esXSX2dsf2PVfLP/JRzWUUZUb/+MnRdcbRa692JANfQj0TdOpZJYR1eYB7Oyj1by
	zA9Z7iUJMKerjS7b44M8r7r4QGMa5G3CmKTzKj11yzw30LOHwosDEft+khb5nL1v
	wgvChBqss4laquIlrgF1TNr+PmCajOCwSYqU+mI7FUd/EA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x1d4b0nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 06:22:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47C6MhOC021351
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 06:22:43 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 11 Aug 2024 23:22:40 -0700
Date: Mon, 12 Aug 2024 11:52:36 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Connor Abbott <cwabbott0@gmail.com>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/3] drm/msm: Fix CP_BV_DRAW_STATE_ADDR name
Message-ID: <20240812062236.nihk2iyn6ya62ixh@hu-akhilpo-hyd.qualcomm.com>
References: <20240807-a750-devcoredump-fixes-v2-0-d7483736d26d@gmail.com>
 <20240807-a750-devcoredump-fixes-v2-3-d7483736d26d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240807-a750-devcoredump-fixes-v2-3-d7483736d26d@gmail.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MUq5Dl8ruf-4xIzM1wyYEsY6Fopblpme
X-Proofpoint-GUID: MUq5Dl8ruf-4xIzM1wyYEsY6Fopblpme
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-11_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=745
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120047

On Wed, Aug 07, 2024 at 01:34:29PM +0100, Connor Abbott wrote:
> This was missed because we weren't using the a750-specific indexed regs.
> 
> Fixes: f3f8207d8aed ("drm/msm: Add devcoredump support for a750")
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
> index 260d66eccfec..9a327d543f27 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h
> @@ -1303,7 +1303,7 @@ static struct a6xx_indexed_registers gen7_9_0_cp_indexed_reg_list[] = {
>  		REG_A6XX_CP_ROQ_DBG_DATA, 0x00800},
>  	{ "CP_UCODE_DBG_DATA", REG_A6XX_CP_SQE_UCODE_DBG_ADDR,
>  		REG_A6XX_CP_SQE_UCODE_DBG_DATA, 0x08000},
> -	{ "CP_BV_SQE_STAT_ADDR", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
> +	{ "CP_BV_DRAW_STATE_ADDR", REG_A7XX_CP_BV_DRAW_STATE_ADDR,
>  		REG_A7XX_CP_BV_DRAW_STATE_DATA, 0x00200},
>  	{ "CP_BV_ROQ_DBG_ADDR", REG_A7XX_CP_BV_ROQ_DBG_ADDR,
>  		REG_A7XX_CP_BV_ROQ_DBG_DATA, 0x00800},
> 
> -- 
> 2.31.1
> 
> 

