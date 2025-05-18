Return-Path: <linux-arm-msm+bounces-58308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C989ABAEF8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 11:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D34FA172A02
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 09:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0358211A28;
	Sun, 18 May 2025 09:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWys5Eu5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0741DA617
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747560297; cv=none; b=keNVxxXoiM5uY3dtRixA/ySvVFS4XsOkZpZiCzMQyhzwVIcKPLolH0Y45eWO9gxIhpUx5BhxFSW9lP1BuHtsCpxvBWonoOggSomLu7dgrgnFiJEGsbfF1QkOq2y8GWa3syRpJPCdSooRD4IjIFanRKVNnK+X5mIgagE05hZXMUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747560297; c=relaxed/simple;
	bh=uXh0YNHgLrXZa9T6To7mbdQeu6U5Grn3n5SG7bUQwNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLlVDXF5M6hs681fXYCanwB2h259lcETyLTW69J7DlFnQNnjEDLWXS/c2zTTmH5Xzdrpx+5j4/li29ysynsY+Ds9E4LHeVXauWeCttOP9YNK7n86dMaB25Yyn2pCXbTH+41vvh3TJqCQqJlJ4KLfi6I/4cJIE1sDL1KyTUtwYZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWys5Eu5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I35Uk1021498
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hNr/pl/r9ZOYN8rShfMawc0k
	SnbkC2SMTXuLQZV6004=; b=aWys5Eu5LT+nYM7eRo+y2omkFE0d3tlWSCZ29Qbm
	Nijh+w7OKH158G7LqzSkKiOYszi1vj9q2L2sWnqwbtvSrOYW/tgxesky4aYSSSOj
	PxV4tjtWY+HXZhXq9CmnTAdPfbLd28henkQoeAV9O2Q8bxmuezID0n6ZKzy9orMs
	cQ5TIIitDYHB/qMjpD06fdKMis69NbPShjjMbELInU5NfRXO46B0Y6FHclU8ynGl
	iY9AZJ/bG4F+kYSvZ3UqZZb6Gas1/iZ3GxEux/GA9p1b8VnsGLyhrQzZSU2uv6gz
	W00AltwOwD+VI9snqFRk1DTqGybC6tY3d6+sTs/LOPuucQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4ssjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 09:24:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8d3f48f35so4116126d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 02:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747560294; x=1748165094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNr/pl/r9ZOYN8rShfMawc0kSnbkC2SMTXuLQZV6004=;
        b=nqfYD3V8Miym/a7TW77QDB+/mwHTerrjYaC1QrG1DovpqbWQzOXwhPDoSvRrhs/7p+
         x/bZSDb8KJpecrMr2SRr5eaxSb0yULeegGdbCGjm5syzE+3ChiiiQI3oBAxoJAOPKp0Q
         Wem5nFPFxFBbmpprMhEXl4WfsHf1JbE9jRvw0AermBydY3+9OENJ6ooFZpYwSmoffMm+
         5W3chOHRPKejcpwjs+MFK1tDrrfM/CHzeilNVeJ7qNbwJuUpKL4pV0e5BB7h6o3k3y8t
         yvBOIdRClWdUncVIUE0ri7EDOTHnV/alqNslVrR7+cUbF8X6alhCcMzkrnFjKrPTDXWA
         +XsA==
X-Forwarded-Encrypted: i=1; AJvYcCU45/EQFpFxnHkgWOBlQvS62X7rbL0HBRSlF8B3ZIOcuEBn9pjoM0cY8sBzo0CBbMqws4VWoRGDP7qpUEHq@vger.kernel.org
X-Gm-Message-State: AOJu0YwKYhqPASapTLln1hKtKMSln66B1OI95PgHQj//LMKsJYUWkFAA
	vBK1ngo78wh4Y37brakHkE8DpSz4NN0d7Z6NGJsAy5zYu09qHOGwqpKg/4cH390CoF3AYJB2E+5
	Y8Wy20hCwij8ZQO6a8wOuU/mD+WChQlhOVcQvlad6DtXJAOjOfvCUNnqOeg3F9z/LmidI
X-Gm-Gg: ASbGncvyPPzIu0/W3D3SvbKAUyOGVtG2DBdicx9JY40mkViSb4Ygr2r3WTVeblEMNkZ
	+IX7oMxvM4IJDilOUh6nklG+bBsTd1VEJM6mfvRpdTcbcRCPPGXPLD+KChKGjhCUciDp/dmwhS7
	LpDktUx+0gvsij81Otfq2CuOofoKSj21R4A/QAuMkk17rvxruG/qNNHAFLlgUiDnSDhcWrooh5a
	r42m0/CkRQB+kE12slRYMOu8rbMXO2z/0uYeemJzz3ZLso2C8TYYgKSO4v6NB+IrWYTeOCSykB1
	otzYSTf4F9tDiCTzsd01aBezrYdkeQrRHjtgs2Epu6A28Dkl79IfApHQITrhNJk7SdswdSGqYR4
	=
X-Received: by 2002:ad4:5cca:0:b0:6eb:28e4:8518 with SMTP id 6a1803df08f44-6f8b08fcfc3mr175740156d6.34.1747560294198;
        Sun, 18 May 2025 02:24:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBE8AEDRXC7fGaZuy3S3AMRf4t761oNWgvl9lJpRdtkIjuyHJ4BLR1QQmRYmnMD9O4Vus+kw==
X-Received: by 2002:ad4:5cca:0:b0:6eb:28e4:8518 with SMTP id 6a1803df08f44-6f8b08fcfc3mr175740056d6.34.1747560293854;
        Sun, 18 May 2025 02:24:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085f097bsm13953151fa.110.2025.05.18.02.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:24:53 -0700 (PDT)
Date: Sun, 18 May 2025 12:24:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 06/14] drm/msm/a6xx: Simplify uavflagprd_inv
 detection
Message-ID: <gtmbpj26nsidusqg23a6zghahotwws47ghsq2vneikpvd4b2qh@uihmkxl7nfkg>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-6-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-6-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=6829a767 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=nx35QXo8bFDwqsARtNcA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: YhEi4JuwiSyuxkPAMN4kuaskXs-XShBf
X-Proofpoint-GUID: YhEi4JuwiSyuxkPAMN4kuaskXs-XShBf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA4OCBTYWx0ZWRfX1hZhbeBjMlhU
 XPX+7cROgaM1TvuNF1aZlDCiSmyRZrCxRmiSzivFmPTnXWaXSPgBRBzu6iQXhgckQz+8CYwB3Ds
 7WNFupbCQStDGyvjAQJazqUsGDvp2ZgCtSv0NE8clwIAUywZmdy7ciUMjofv/ImvS+0Q97Q5XMg
 UqX3iXhPrltssy35yqQwcwCJYqdMxfnSpen5Z9Yi18rJLz5HPLFSYALGgv1zR9tomH2r05K/jP2
 ucmV7TMNb519qVfafuvHIUnde8oR3IJifd6ODKiZSDxZ7Lw23qjI6Cc5k7J83aH8UTdOwwnC2hI
 icWVytzdddZFSGEF5Pi6zId1zROketZMbb+NfrnfOUv8n321aBUtWXm3CY3ruaCZkTDWCnKgNhw
 UVCfRiAaUbcvKrmBKLrZYJQWaVengz9/eS6Yh1qA+7s8NabPlyLSJ0oI9OLk3wUE8A4JQAoZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=860 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180088

On Sat, May 17, 2025 at 07:32:40PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Instead of setting it on a gpu-per-gpu basis, converge it to the
> intended "is A650 family or A7xx".
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

