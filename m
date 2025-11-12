Return-Path: <linux-arm-msm+bounces-81372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F5FC518F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EBD1F3483D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 10:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC572FFF8E;
	Wed, 12 Nov 2025 10:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kAGdreiM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qf+pUksZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BCE2EBBA9
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762942073; cv=none; b=RpkStbHcRgSLhC5XomhSgL0cVPTH99E4zLAfP0GO88/S3MrZuWqcqVyQTJuBr6D06jXwWrtd3DCVL03MYJzFM64sRieOUMpR6zcXta+e6upHxruNZtkLeuGQC23x/Iso9fZMFyvm9ZKVGnYFhOrczOKTde+px8ZiDRUKj8QjCLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762942073; c=relaxed/simple;
	bh=TVAcGPnABcNOszTgcAJl5hDoV/qMbNyV12hdTLLHVSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YAj2xCa7yg94siaCU5KvGNaV85fclooMl2dpdZsAgFEOzC/7a1Zxkn7nVX14GO00bDGSGE+lz24SDZgakSbSsq+9dGZ0aB+2Y7lTRElp51Jpri2RtH1sQhKMuukuWLtoz2lgql5A2DXZYwM7HTGHb/s/0xJu7WmYByYpuVjI88M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kAGdreiM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qf+pUksZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC4YlXq3060096
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tMUAPHj3MTUC9Ymia6xtrQkXoeMohe0oVZfqEDumFs=; b=kAGdreiMYqZZcG2C
	a0uUG51Xyaex5zm8dEzDifgrYM5roPuhPx6kulk58BS+3W4TQOgTjoDq/LETD+5v
	toGP7tnj8cm8v2VOP+Lz/IpXCakCM90iM38mvClvDOeFEsYdpaWGBXd1aHjxLjpp
	AG2iXmEwEz9WwP5KH0yLT47UkP4ZycamLGgCsOVpOXREEsSXGEPofqjIuh1/A6cl
	8LeM5ogKJJzUCQJLJcS3TvjBK/3S3BtpOkBOzEhYPUkaFk6OcMno02VIYZ06WDsx
	ptIuEYHOCgcE0bzK3p9fTf3uJs5R1wFxbW1ukttPz3Fs2uSqO/F6CPSlVCgrZfQs
	ttvkZA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac988jpqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 10:07:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edde056714so411841cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 02:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762942068; x=1763546868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5tMUAPHj3MTUC9Ymia6xtrQkXoeMohe0oVZfqEDumFs=;
        b=Qf+pUksZREPSNXsoz9oOS/eHyEasl2qTaaC847PiZRVOdajV0AHuwYOO/sPqfSR53d
         K2vMc9ZHEvRPE21AQ2eN7N6/7W3hCYJ7M2ZKRkPEfkg3fr8ZbimbQW2oQBvBI7+tuT6k
         0g/0ww3nfQNH8O1wd3PIkzmWsvTGQbc2RGqfDxtxPu758GkgD2Ck5Lg1kw7N3MaQLL4N
         KA3WMyhJCZ1PoPLtkkMmpa+5T/q1r5o4a48QWeWi6kusZlswhoD5fJOpRt5c1NslIIxE
         mCGp8iutttVWYUQ6tdd1+UpEi1+Ep3JIQjuXM7/soZoCb8DOuFbtD44pIBPr4mVgkbcl
         0ZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762942068; x=1763546868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tMUAPHj3MTUC9Ymia6xtrQkXoeMohe0oVZfqEDumFs=;
        b=beSo25okqr4Gjl7l7F8xDddXEudRbOFMP6+0soczrC4p/IHWNLdDK5emfMHHBDsgvE
         bCDT6xS166gBorSC8H9PjjCiG8tClQR4ENrJmXZ6e1bV0KnE7VSrrUhU9i2DrZ9gDi5s
         ArpuYtYLcnyNuUE+5nKaoHVKXTXPlDSHzN4F1mXAeV0vZYckAcMu/yoaxDgTni9GGDjV
         mepGdAxfTp2tNVNctdFJVFRytkx64NGiKCLUqrG/4PdkPkfELExQOGABlXrTLwQGImXy
         YV3gWlYcxdJ14cL4D1pF4oHFJZTJUHSeq51XN9vQtICVYDiQPjTWbde+M59BpgjJbfgt
         59tg==
X-Gm-Message-State: AOJu0YyVok0LiHpY/F7N7T2JGlbXLNP63UPAnxHp/odshhsdgL5TdoGE
	54bqL9K3jdcDGuL10XL4MX4xP04jSRDZU+7UW4AbkXYqntehZVvq0SlPfLHRE23somppe7WVjN9
	VKQEN9K1jgt7EgccEHFCzfpHk/sbq8WvEFr28rjmG5XGXnQDP1u2R7ldc+aBwIOEmwKN6
X-Gm-Gg: ASbGnctLXILjWEbn2nD8QVMy4PZ9Dcjr2OS/yxR7VDiIckwW9gyDDJGqK4Di9rteOdw
	dIff3ZbWJ/DGl1h4ors7CG+xYC4gYZgL1dljcwBguJDHh/S6o7opDPnWQ0LAYDRcB8Jxz1wIEOW
	TPEa6f2GjUtRRAELhiiff39uvGENvuoL8D9RFQaoyEVuAZk0rcQP1kpbrv7T7qPTe8RnruzgOkn
	0FHlxmJWTxKpSxj5taHCK+VoS8JaE4eDuwljUHtYqfpLFMdAoFlmv0/D4GG8Hy/KOOmVn1NEqmW
	iYqwtKJrv/U/fB9BQ911UYjQN57aRTM71iI6BNbg29iWoHryXhMCth1TukxSsLBgJ9LYcqYpATo
	8YFItKNwBPhwoy/uLoA+axMBMggtT0Q2z8gzYAJf+F9Ag9qSoLmdHJpDm
X-Received: by 2002:a05:622a:18a2:b0:4e8:90f4:c3aa with SMTP id d75a77b69052e-4eddbdad648mr18859911cf.8.1762942068469;
        Wed, 12 Nov 2025 02:07:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGd6taWWH3kgb8r8uxKAXxyDkXj9rB9AL10HGL6oyqqdNWof71H5ltc/gx7kawJfP1MWxxJCw==
X-Received: by 2002:a05:622a:18a2:b0:4e8:90f4:c3aa with SMTP id d75a77b69052e-4eddbdad648mr18859471cf.8.1762942067993;
        Wed, 12 Nov 2025 02:07:47 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72d3baf872sm1427413366b.27.2025.11.12.02.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 02:07:47 -0800 (PST)
Message-ID: <da9e9d31-7745-4eb6-ac24-50905dc2a133@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 11:07:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/21] drm/msm/a6xx: Flush LRZ cache before PT switch
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-1-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-1-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U4IkUi7IqiP1vTbCpBvf-57fNNUyh6IZ
X-Authority-Analysis: v=2.4 cv=eO4eTXp1 c=1 sm=1 tr=0 ts=69145c75 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FVkm2KtGXHSZZ5XTrLgA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4MSBTYWx0ZWRfX4nZGn4N0DmAy
 hPuLwAjf4RVheFF6xbjJ2UgnHTQEX1/QeoQ5OLI1bhCtc3LDPebl9RMFvtHW+4jWBUBKmMJ8T63
 DdEoce628JVEYjbYgHj0TAZwtro3gTc1kGKIn2jfydE6AjIcqU7JDhVw6GHnV8lgBZahZYx+WBT
 YQnwV4H4LAW8aEkllShBLpQzLiOyvSQmy+K7wYz5FOyOIWPLq1YZcZkGZGQUs1LS3aD5FTNE2wk
 Zt2JpOLprdWifSVw2GBLUuMkcxR0O5TKiyml1Mp03KAzriThq3br1uB53RA1goLn8BJN9mrA9Tb
 SfXEZXYhT8BzvEHju+YjMdwdK+jcA96luyx7O0fS4PNsX54EsffcDLMBM3P5rD4e8Rxyf49A3a7
 QAJK0bRQDqAJyQsH9U0ULo2NfegjuA==
X-Proofpoint-ORIG-GUID: U4IkUi7IqiP1vTbCpBvf-57fNNUyh6IZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120081

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> As per the recommendation, A7x and newer GPUs should flush the LRZ cache
> before switching the pagetable. Update a6xx_set_pagetable() to do this.
> While we are at it, sync both BV and BR before issuing  a
> CP_RESET_CONTEXT_STATE command, to match the downstream sequence.
> 
> Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index b8f8ae940b55..6f7ed07670b1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -224,7 +224,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>  		OUT_RING(ring, submit->seqno - 1);
>  
>  		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> -		OUT_RING(ring, CP_SET_THREAD_BOTH);
> +		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
>  
>  		/* Reset state used to synchronize BR and BV */
>  		OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
> @@ -235,7 +235,13 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>  			 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
>  
>  		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> -		OUT_RING(ring, CP_SET_THREAD_BR);
> +		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);

IIUC downstream doesn't sync here since there's a sync after the LRZ
flush, but I don't think that's a meaningful difference.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

