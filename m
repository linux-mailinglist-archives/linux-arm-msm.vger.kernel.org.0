Return-Path: <linux-arm-msm+bounces-69815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87743B2CCB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 21:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 014AF1BC3BA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 19:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F005826A09F;
	Tue, 19 Aug 2025 19:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNOTwsmK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5B32032D
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 19:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755630071; cv=none; b=TcveKCAUpbtTGjP1mNLKgejWY1nijf4XWg/6h94YPXdVIPULYhYiMCLxVlMGv3fymNldfuzzBS9FN381IaQjrLIQqLzy3elhEUGAH04WuUPPXTjogzoi38GQR5Hh+82Gm8c+9SCGf/kxsReTGvUXaZoWAg/lX0RD7genIxBh+KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755630071; c=relaxed/simple;
	bh=eez9nhfnJuw5MkH35eQYyBdqbDZ5HL8bveapjFesaOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XGq9buQ53StAFGaHO6ZBrd2uW95WKh1Z4YjbZOYEjMP/d+YxO9kCmrn5uq35kyEjlWMvfFCf1/3NSmX8eJEabCMFDW/JHBVuRDCzco5aYQSRGDlU+h6DKE97GchL4nmkHoesllzw/zuddXDORIE/vaGwRJ6zsbWt6SpffX8pKNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNOTwsmK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JGxVU7030332
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 19:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eSDc9BAB3b8+b7b3/+MDQM9E
	BEAEmQchCpTlVTVH4Ro=; b=nNOTwsmKxmiAAPv1CaIr7jcGE7rJUarSvvDl0fFw
	2vOcYRSEyqJ6z0bw1sI/tw5eGGR2SMmqV48HP2AXM7SOqjQH5mTNXLfpY9zNn/4Y
	/r79/dDwqOgYdW1wjwD1b1hyR91ItzIuYKdS/bKtYclVd5ROt6sVSfDrOLHerYck
	3ja5ntGtPKSXflcnhIvDPduVrodYB7tiGbDWh3nMjpnpY5p8r+Y25hNIX4BOV1t2
	iN3SxuUmFL4Wk2xc+6GOPUJ2jn5TH51q0IaVL5AVyHpg2/o3KYfFkggjy6tjC+yF
	cqBJP/DHJy6JXqoMjHQM0og9CLI+w/Z2iIZDuviGHNvDSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyunwwss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 19:01:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109bc103bso153512881cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 12:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755630068; x=1756234868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSDc9BAB3b8+b7b3/+MDQM9EBEAEmQchCpTlVTVH4Ro=;
        b=JoaTISjgoqrFpfwoU4WevhYR1Jw7l2+FZP9/c5Zf43csOfGrYvo+2pJ+MfBOINe17C
         jHhPk+4sv899VktOG2b97BuGjCFDr1TtW8o45TaNK7hXatVF8ZHsywhVC0QrlAuHQmjE
         ryf+k0Qi8hkVXrBq/fsMq6GTOAgFL1oBjiIhAlS4AU2YAnjEAlbw1Xwmtxu53cMPoQLR
         yBSzMTqcy23DqqNPtqF6oOpnHJ8DdBJho5nvMyGeaFOC6WcLrL4DDYrY1c+OfDqPmuNy
         kC+aa3xFOsuSGKZ3NupRcjy6o7DXVnqVGB92gF2ftaRNrDafS+PQHFPMWags3ZhDHRkV
         Q3aA==
X-Forwarded-Encrypted: i=1; AJvYcCXwi3jhhnkQxjLbmaBOmdo1xyKwANVWT3pc7YbjFraoaxODJbMGm6gIR0RuuJq9qUL9egfn+yOjtE7kQth9@vger.kernel.org
X-Gm-Message-State: AOJu0YzcJMWqHlFDslrjYYF7YMyxoUGAEz0bl0fCunaTTbkAux9mBiOO
	ktJgcJLKAwdBIXYs3cAjcMZWofoLeaIerIyybKOpgdwDZp4DXZ1IEyIvGlxVkCJWvfmSLdFoYqk
	34/uzR/9B5FiukVKB8X7KNqxCN8enqWgU0c9ej3lw3COBjrhE9/PpWtVNe1y4xgaddwUtek/Xhv
	OZ
X-Gm-Gg: ASbGncuWziLXxfSCEoW/Fd5sRf2NByk0qYybMmupdMFHg3jXL95FiyvMjbsSoi9DtBa
	aYVgcjnxfsznP9vLD5a9dV/uZpukwGF93l0uWDs5+TYkqFeb+f/puVm13w6vqhFuRYFmZ79cQ/h
	u5FvFWfJPMJC3xmiW539r3rFgPIEcu7RFZpa94qjXyj6+ljhsRussJAfD8gy+PV4brgKv0ZpCXR
	9oRvsXVyZmcyraW18ILmx6kuNYRH9PRpb1YgC7GNVV2kbOD3Z0ZPKgBO4K7nuV+i3GObyOO7/Zd
	RHzlsYzxp9kc9t02Mp9+7VnhUU8F+digI4GVW7+2kgXq1u/ZF71wc3nEgE/HWQzFTB9iMhHZ0tQ
	i4DvAPKrs8IO5ttf0/wzvU0+4UNUbHGSSCqbh8w11pcOldhdfg3tS
X-Received: by 2002:a05:6214:5086:b0:709:b691:c9b3 with SMTP id 6a1803df08f44-70d76fb432bmr1090286d6.21.1755630067764;
        Tue, 19 Aug 2025 12:01:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEzyh25IcZixT1XrdjSA5oTENrZfRkUdENPuOBeZx3C/0fuWIV+BjW3wFDLEBMFAfYSgCcXQ==
X-Received: by 2002:a05:6214:5086:b0:709:b691:c9b3 with SMTP id 6a1803df08f44-70d76fb432bmr1088806d6.21.1755630066382;
        Tue, 19 Aug 2025 12:01:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a4758bfsm25257681fa.32.2025.08.19.12.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 12:01:05 -0700 (PDT)
Date: Tue, 19 Aug 2025 22:01:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 11/13] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <hrcp5pcjkqotexrnenm7dxojcmmzx2fl6ybxxofbtcot6q2hxu@3w4vyod2n74r>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
 <20250819-v6-16-rc2-quad-pipe-upstream-v15-11-2c7a85089db8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-v6-16-rc2-quad-pipe-upstream-v15-11-2c7a85089db8@linaro.org>
X-Proofpoint-GUID: wBNN3KEbCYOXyxODp4r6VKfwMxM2oAx_
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a4c9f5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=nT20EUERFaLimiOwrcQA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfXwWbKAIp2bBPH
 ldkNnZsAeGeUrCBloFx4y9IKmDufYRGgigdMibAV2dgtRrFrobPxOiFw0NN93OMoUFNQj7zZEpL
 VULyPhQGNU2G1Mjpe0fZAaEfuUWNXPOJ/RsldmNgGdHIO5VaZP2R5vqpJc5HJEKs4FrU/7C7brK
 8tokSDXDhlutpXCiZjGzF3ocUu09c4ao5QiO51lC8+wlwHlv120zBfdotBdNTYewWpddyMdaMqs
 hY1wHMaIcdMxyBirFwrryzXoZBJZ97rCgActXeuhzu79Q9k8yLDBDC8Ns3d0GrUqPt3BzBBL+QQ
 QV3N9ZwO+NEepmxl2N5ZjIY8zNUPB+eNZ4fTd9jGeOsG9pD1ZpJAs2+RZLdIBSddUPWqS5mSzMF
 Yi+7OEYu
X-Proofpoint-ORIG-GUID: wBNN3KEbCYOXyxODp4r6VKfwMxM2oAx_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071

On Tue, Aug 19, 2025 at 09:31:05AM +0800, Jun Nie wrote:
> Currently, SSPPs are assigned to a maximum of two pipes. However,
> quad-pipe usage scenarios require four pipes and involve configuring
> two stages. In quad-pipe case, the first two pipes share a set of
> mixer configurations and enable multi-rect mode when certain
> conditions are met. The same applies to the subsequent two pipes.
> 
> Assign SSPPs to the pipes in each stage using a unified method and
> to loop the stages accordingly.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 150 ++++++++++++++++++------------
>  1 file changed, 89 insertions(+), 61 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

