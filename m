Return-Path: <linux-arm-msm+bounces-83341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4470DC87962
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 01:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BE215348C84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 00:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C16148850;
	Wed, 26 Nov 2025 00:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7sF07ll";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmE5U5GH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCEB4C9D
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764116743; cv=none; b=WCP1t8WzHj/LYZvjIvhzXQLU4LT/Jhd7mDWjMdtS23Y/6tAK9xtDYXlA5Mr3AjLQt6iHCHtBNoEFj71sf534HogstS4OJZhv+9/ev+mtF89IUUTq60BO3pfEYSkB6LTgJSQ9c3+QZo+0TDOucdF3jyAy6Bu9yG+65KcKxOGjM3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764116743; c=relaxed/simple;
	bh=oyPlD+pey1edfeoyyPeZJKoR31H38VXZHS3cbDqW4kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pO3PEDBNuxOI44IxkKhfEhudq03yPsOS1oz2Ze1Immkx7xp7KtrXR9Glp+03lejotna7fTPgfjt7Rj7qihU/3b6nGsC1sNXxLRJH+PP+Um70JjlXJ/doHNfzj7PEb56e1cAGxq+8QmgBWsxrwqIO86w8Y8KZJzJksFGq8RNl0rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b7sF07ll; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmE5U5GH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APD7vlP3317496
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5d2Twl82X5Ayvh+7UIeHN6bw
	AGRYFoh6iqVO8BoTiBA=; b=b7sF07lldsah+AE/bFv2zwvwlkm5K4/xA7Qskvh0
	hPJpgCAYiFy5Dvkwq+tvODejTa6UDL04p+fWpK0pqE47L1M0idCCF+HUCa12xcfN
	Tz3yCC91EhPcJBZl7lkGn/pDEhIwoMOOf4qedobnhXca7hGIR9OvsLmTzzdSCW2H
	6PVdN3NpxNXsVYNZt+IwaqJfC/HsLT8ji2ONVTkqVe9Ljo6zU4OffNDpnWWBwSrq
	QGS7d/Wi9vuiZ6u4PjFTN/DWVHNaNE8V+OC65zqCJjgz8ca92m83Ya5iaLTyB0Rl
	9DTAEx5ruMxGoZEAuWxa3E1x4YmE3D+DJLYo0u+8+AjPVg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4and2qhqbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:25:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-89eb8ee2a79so2963447285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 16:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764116739; x=1764721539; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5d2Twl82X5Ayvh+7UIeHN6bwAGRYFoh6iqVO8BoTiBA=;
        b=hmE5U5GHZWR8HDuFwEPgLD2gNngN5xnddqc3WmT2act7FL7mxZCt6SH81oQpjIHivi
         yXzB2HWdXJKxOLCkqFHReYD2OLJUvvU6WLt38EYgXZckAmn60XaD1366CYEkgFdUjxC3
         QYsdDRg0PLjvKN8uMSScouP/75qkr0peb4bEF05G2E32rQTD6VG4+lzcic7kYb50kTrj
         y99ciIGfH+i+I4RAm+ap4+7HyMKrJLM9puY5ftAGz93tDZMP/2dBIeRrIG5zkK5Prt0S
         hLOfdnAA3bMJuJWCtEL9HWQB/Uq5vdv614KtRjcFwJXrsX6qURIShTf47jks4t0bJ07Z
         4kEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764116739; x=1764721539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5d2Twl82X5Ayvh+7UIeHN6bwAGRYFoh6iqVO8BoTiBA=;
        b=MTAY84IJ++nHzlVrk+wVOxFuUXPWETs1pMYaUz5omyV5d80UgbJ6nBufDIqHfGBT62
         8SfV300lokUET8rGYJcsfdPiSjjKgbKYQobZ6d7/vEhIZaxjuKGrj5ab92Ana+tlPRPx
         Kmx3bt09u7ZlgPgDADkdYhDuZRVZn3iEhILv0ySqfSaskvDVYHzCgN3WCBPpPVtTz+B/
         C+MXSb9u7qdtyQBU89V3XFGU+SCpb46ahbcuUwJ9TV13i34jdT7WSuwbrMREbUwGVT54
         hA32dkJoe+cUP45GllhFSWkJf6qPIcoSa6Ns2jf9ncl3Bu+AJQZVQmPlCCATMwRrKYZ1
         9lMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhm1d8Smn9rzMNoymqkf+9grGvBnFwuCNAGiJELvpNXm7wQWXhH7Q/RRbNUbtFPyKsry7M3/CkjI09hjo0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl0LTV4Obd1+7FVEZQFRfsmgSCuOOa5koZwWysAATpJx254Y+2
	fxSuQlLalmXeGLg9YQCMV6L0d/rOPKhHnw6YUV4IOqBu8QQHdtxNU7k6kRXFNA+3GEvehGDOId/
	xJTO3NeJgAradlvjKCkUYoK3Y4ztPDIVUKpbyyoPOAKYf5YBE+txAUlAnPRojpLRE9uSP
X-Gm-Gg: ASbGncvrviLHluJErFE5r5S1nj9CzxIH/oOh9xkn/glnhr4qJTybRVX5ICP33B48Ume
	GCyK5Yrf8DjBhQ3Plvopvkzv3QF6lKDC33qYNcjodEUJSNHxiyD+eq6xJS0ME2DKIymP0Yz/lLo
	5ZZaVKff9QoShO/yBZOWxzC0ayAMywoOF4X6bJiPaaajSP9sIvSlwdGUqcIkYj0QB+Ogn6INMGp
	/l3z0rwAGYfRzzmm6nekB35UjCXSgU8Pj9tMscAyVwnb4YmSXVFTAJYnPyUokmHLd964VgkbJ6T
	HLLfYi6zhlopMJFHQa0p2A1TdcUETWLaFFn1J4QTdvnR4o5eqEExg68GVImow2YKfGabbPI6uLT
	qNmoVjT1ZW24tRAglqK3A2qnOzqXrR3ENrdAoiddi5W+rZK2vRcZq1fw8ssTpZ9YuXTKv/PEg22
	sCoVsRhbToiurwFTSky1u3VIU=
X-Received: by 2002:a05:620a:4613:b0:8b2:edf1:7c4a with SMTP id af79cd13be357-8b33d253d67mr2508840085a.39.1764116739410;
        Tue, 25 Nov 2025 16:25:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvbrXdwT54hjBQEGfllxVr3ihkFARzZblVNPmDey2OxPwwIOmJzCrtTxhBTl+4NNXy/fGGgg==
X-Received: by 2002:a05:620a:4613:b0:8b2:edf1:7c4a with SMTP id af79cd13be357-8b33d253d67mr2508837085a.39.1764116738858;
        Tue, 25 Nov 2025 16:25:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbc5bf7sm5446600e87.77.2025.11.25.16.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 16:25:38 -0800 (PST)
Date: Wed, 26 Nov 2025 02:25:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi/phy_7nm: fix rounding error in recalc_rate
Message-ID: <bpiqx2ouerihm4jvrt6cv4yhd7d2pthryn22debqjeg4suz2x4@eod5ibcj54ld>
References: <20251125-msm-dsi-phy-7nm-clk-rate-v1-1-17141806e3a0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-msm-dsi-phy-7nm-clk-rate-v1-1-17141806e3a0@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAwMiBTYWx0ZWRfX/6ebqmnO8E9B
 64lAr133SZjbGMNyvzOhhjmxE3P5D4nI9CC/GrT4HIw2F7JAsyyBtaImAu2/SFD8S2ncRDL7svP
 LAzIMxgiPlmZBnD/d0nkKByU0fbs5rfJtOsQBdiFCP+iawI9MS4sqqdRplJzB4jtrdYjMIR/4je
 +5gv7cwsgWwiI5f6MSll547kHdR3ccMupZqD39IUJUEE0x79wShmeUOZXjEym2JlfZgdmr9pcCQ
 gEdhBcMOPu4hP5EUbcq6QY/kYsVoBSGEStl3UOC3iny6LbsjjI6/FkjXq3bPY4cKJrU+bIRHBow
 j9mEeKZZCqmZls525+H49dho9bQ3ynQv+QwdQ24hYkQrO8cdMI9C1ZnTYZ1qRwGlsHB5D/AJcYe
 uyr16dUSnEShYh0PHTUBqsY1kWraYw==
X-Authority-Analysis: v=2.4 cv=dZyNHHXe c=1 sm=1 tr=0 ts=69264904 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vAqZcY3_g_uuhliy_rEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 7289epzWfWNomXlvo6MpACaw39pYvgLE
X-Proofpoint-GUID: 7289epzWfWNomXlvo6MpACaw39pYvgLE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260002

On Tue, Nov 25, 2025 at 08:55:07PM +0530, Prahlad Valluru wrote:
> Required vco rate is set by programming decimal and fraction
> from 64 bit calculation. This programmed rate is not exactly
> matching the requested rate and corresponding recalc_rate is
> having rounding error due to this delta.
> 
> When setting byte_clk and byte_intf_clk from this pll,
> set_rate on byte_intf_clk resulting in dividers getting
> reprogrammed, which are already set from byte_clk.
> Convert this recalc_rate to KHz and back to Hz to round up
> this delta in calculation.

Should the same fix be applied to other generations too?

> 
> Signed-off-by: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 32f06edd21a9..00f20c5a7c73 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -598,6 +598,12 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
>  	pll_freq += div_u64(tmp64, multiplier);
>  
>  	vco_rate = pll_freq;
> +	/*
> +	 * Recalculating the rate from dec and frac doesn't end up the rate
> +	 * we originally set. Convert the freq to KHz, round it up and
> +	 * convert it back to Hz.
> +	 */
> +	vco_rate = DIV_ROUND_UP_ULL(vco_rate, 1000) * 1000;
>  	pll_7nm->vco_current_rate = vco_rate;
>  
>  	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
> 
> ---
> base-commit: 63c971af40365ee706c7e24f6a7900d693518f09
> change-id: 20251125-msm-dsi-phy-7nm-clk-rate-26723a3b686c
> 
> Best regards,
> -- 
> Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

