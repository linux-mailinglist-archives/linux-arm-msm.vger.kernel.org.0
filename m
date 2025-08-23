Return-Path: <linux-arm-msm+bounces-70473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 378A2B328DE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 15:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19A3B5C071E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 13:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DB51991CA;
	Sat, 23 Aug 2025 13:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="esScmJq1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2F8155C97
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 13:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755956989; cv=none; b=BoCFN2HtyppQLvjNGH0fs7b6FSBe4J2RelOQ+KFqs90GjoGIzgFCY0MgSiDtPtaYu7e+O+2HKlw/XxtWeLHuaeVXCvpzmsqqywfDR7hn8tNTzohWyol9PTLgwqDpYmM4tET2ENOq909rrhvygFSi4H3mgEGsAs1VGrPIn0eSfxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755956989; c=relaxed/simple;
	bh=8a5YgUlqZW/ubZvLLh0hAur9fmf0pOjpnzLG3GP9Iow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHMD7PukxyIu5Khco9bDEI4lhhYtv3x4yfTLIGQyF5AXXDJFc5VN7Te4MWmWFQpJoAhNXC3ijGN+Yp+jUCzlYGzcAQm5PXxpyGHSfwEBYuVAYlinSV387y1UCrAWM34uAdJ+Cjfn3abKWux+nrzB2nJZqmLziLOjjIVNfEjJLTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=esScmJq1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57N4DAYl004690
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 13:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NJutXUx9GwbOyDCxu0OWA/tm
	x5myteKgI5lzXDqLEUY=; b=esScmJq1afz0shmLdLYmLpDD6Z+89szHUSJ/5+GU
	Zk/vYSEmBVI/mAP/nvVNpIwlBxKYedTO+PWzTV3KdgxOl8g1sEK7kIw1cd8LUkiZ
	koZWRgMkauLbpP6Z7kbxAkP47GEp5gM5G2tKiUCx2ib6ZUpgFp/Dza0H873ag7Xv
	ayc6cfuWZmH1Epkn23t0A55+PoWPQIp3d7QpdsffJ2hEZc1t0UGELxhcY/UOkGVa
	rV34lHMEtr0/Pa5lHtrYl0V+awcr5hUIk9LvxRzG1pMASjQhDddhLDGopFKf9f89
	n96SmbHJsuX3KaW/ImIxm1B/IpzFkmR17lMLNvEAsd0jfg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de0w0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 13:49:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b1098f6142so61083481cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Aug 2025 06:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755956986; x=1756561786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJutXUx9GwbOyDCxu0OWA/tmx5myteKgI5lzXDqLEUY=;
        b=bc1DgFoO9W8iF8UrdP6HYDorTDYO8WDboKYx9ASUeiXv4cRSwNttgXHB6htb+GHxQ7
         bpCYALv7RZRLFop5m7iNllpv/zIj07Iszju0D49XqVLP1+YoWQ4WsHlbl6AKphs04g7f
         j/1kh9Z8gZaDZq9zE6TvBZU7d+zSTrBOT3xX5xZSJMfEgv2BomHPu+y96aojmbjHboYC
         /OiDPdMN8ZZ8NVE8oQtl1Fvj8k3OmfqK+1jmEz21/EqxZyWGrq7S4U41XgGuJxb358Ot
         ED+fnTETpsc0ZTzxv8ULKtx6BlLdyu/B1FWDUj2sX5kHgAomNXTdRilf5yQfbaakY6ON
         ULhA==
X-Forwarded-Encrypted: i=1; AJvYcCWyNkMlx9gkIzE3GjHuckEqH2jPd/aOwjTTjkQiqhM4zyj2qFzZPqtvRXB80nSZd5lcgl1rs7uKbbltAz/u@vger.kernel.org
X-Gm-Message-State: AOJu0YzUy+9svt2nBQtrEZG1MLGDodLF5CLKm2o6cgk5QcNQ50K5Cb/l
	cR3ffHX3CcTMJtBZfB34ys3WDEhsGMzBlkVhGu8pjVfw+mwJ4ybHpwC3GKivoqOn9vRdzdpK/oZ
	AtyNkatEiQfJYiMTG4aZdY5zCEVPMACElOh7OLeriDEhuGVZtQu8EHoY8eHqVviaLeD4o
X-Gm-Gg: ASbGnctFVjeuKLw6zSnOtVBAdFnVIJR3UInSSDDLN1MvjozAxBWzyguKa0WK/59WhXr
	nQXDvJWaLs9gUWcWzXgw1J2qAQyetjGeIbiUEZaEZeLkwMqiEqb/oWccgX1Sidu4vst4qmTH3cr
	yyRpsbpoDq7K0PzT1iZNDRd0QPsfJXBkYfrkSXoOKKbvXg473PxTFSwmDBsR28+7Qtys5jYVOBo
	Ee+IGagT2kFg5Y7zMPHadKx49On3YBK9Ec6DQJBFBrK9lFclSnjNOpZBnD2fBxzUCZWNSQZ1y+n
	+uO9B6iP6ids90WobgC2Ru2P72A5g2oHiEtN91SXWyDoIvCCcZFFJagZmIqFxnLFzC2x9eEq1G8
	AoCp2a7x+qRx1fQldiDB+Rg2aPlTGPCU2b5fJ/Kh8ZMG6ajJlQuB+
X-Received: by 2002:ac8:7dcd:0:b0:4b2:967f:cb4b with SMTP id d75a77b69052e-4b2aab242c5mr75185361cf.63.1755956985928;
        Sat, 23 Aug 2025 06:49:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2g0EFzejzCmD7mV9QSqwLqUbabc5ibMXHvpMqoKZRAVTOkV1CMYQolhIhiB2z113FQRZ/OA==
X-Received: by 2002:ac8:7dcd:0:b0:4b2:967f:cb4b with SMTP id d75a77b69052e-4b2aab242c5mr75184991cf.63.1755956985376;
        Sat, 23 Aug 2025 06:49:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c01e5asm529627e87.26.2025.08.23.06.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 06:49:44 -0700 (PDT)
Date: Sat, 23 Aug 2025 16:49:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alex Robinson <alex@ironrobin.net>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: fix race in Adreno header generation
Message-ID: <6sdzghcc4uynvmk6r4axpwgqlmgxqzi457ttedqlrql7f7lt47@glsrzu46a63x>
References: <20250823020919.9947-1-alex@ironrobin.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823020919.9947-1-alex@ironrobin.net>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfX+vHGLWjYfuYQ
 afPqndzwkpDQ3q9zLR6GsY2cw2UcJ2sWMOQIIMdzZE5PKaXDqGJvlrQPONlKg+GJ87fhe7eWr9C
 LomR7h5/O/ZfshFAFun4ivsUTlU6BzHU6F4ZLk0reK1Ue3eFnx5/rhmSAtNaCHur0c3+HMGUZ1d
 THHJB46JW/ujk6UYEzLsEQK5jzyzNLXfpBfXdIWAookk3NSCcKIqUAKF/Y6UWRxEyyrp4MCjcuO
 3KaVfkcXhngEoSWGlzTFG0Lp6Psq87V3u5J7F4Ncwms04+MMPtDQhJAWu3G5el9RCoqCMNLb45K
 4O6b+GoBPR/xJam87SwTfsf6bix79ZCPFqW8CPKnMqfThgVtWSwz4hcH4EUxDgN/HWGmL0k5VcW
 5lSX3Wfv
X-Proofpoint-ORIG-GUID: B5cVB1T9bIrxn6wX-ZEj7o3k0Y3D_oJe
X-Proofpoint-GUID: B5cVB1T9bIrxn6wX-ZEj7o3k0Y3D_oJe
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68a9c6fb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=foaXouvCAAAA:8 a=lkkxZxBEGYBqsCjUt94A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=lBkOZJTZZNyIbKe29SIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-23_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037

On Sat, Aug 23, 2025 at 02:09:39AM +0000, Alex Robinson wrote:
> Builds can compile msm-y objects (e.g. msm_gpu_devfreq.o)
> before adreno_common.xml.h is generated in trees that generate Adreno
> headers at build time. Make msm-y depend on the generated headers,
> removing the race.
> 
> Signed-off-by: Alex Robinson <alex@ironrobin.net>
> ---
>  drivers/gpu/drm/msm/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 0c0dfb25f01b..1a918d44ac48 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -221,6 +221,7 @@ DISPLAY_HEADERS = \
>  	generated/sfpb.xml.h
>  
>  $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
> +$(addprefix $(obj)/,$(msm-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))

I'd say, no. The idea was that msm-y should not depend on
ADRENO_HEADERS. If there is any dependency, please move it to adreno-y.

>  $(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADERS))
>  
>  targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
> -- 
> 2.50.1
> 
> 

-- 
With best wishes
Dmitry

