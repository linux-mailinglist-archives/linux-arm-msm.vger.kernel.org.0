Return-Path: <linux-arm-msm+bounces-77263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 882AEBDBF08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 02:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0F4A5341872
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 00:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D3B1C4609;
	Wed, 15 Oct 2025 00:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="drvVXABG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F7F29CE1
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 00:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760489570; cv=none; b=T/Rh3l8ToTBKuquSoQDqsy+dx3Yqfo0HIEJvX0wZ3IjGKBm36uePKW7uxVJiWLKFMwcALrfTnimMXhD24e6D/YgW2vXp9hysNfqdeGQ5zpjhoiXAMvKe06Rf+zGldTVYG/AXhGFXnWER5h0MYKQgcdn5JIxipmthX8wCsRB7QE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760489570; c=relaxed/simple;
	bh=lquFcUF2HJaE0Nif3Shl0zeorFXx3KSlS4v2pTAhRH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmaDQQ8XNW20cKgZ+rrddZRuIgQVhuCQrN/J7tbguKefexnel2y4JfoCJBiezs213ylXHr/PmN5YPcA9EMdjTd2kP7XXa+UkCdxDEvkZrZrJoLWT/f2UqGC45oquyhT5ecFTGyaJDfLKLXSemHI1GIIcINp7zkmGkP56ir+xocY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=drvVXABG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKSC0v016331
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 00:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v6jgXJjjhJQgEeLigi3JtVL9
	kgOdixyq/3UnYeX/yA0=; b=drvVXABGVbv/fGc7BU2ZshHr/53UJPRKevbg5dAc
	EJkhc8WPrU3jGgxZg+z/KtLVe3c8EHmm2B20madUway+zu6VRMNC2bFFNAgEM35Q
	XO0LvL3sxnZjcSB785f2Oo8EQFGFkg4LtWBEpmYi3jewqDa8vNfMjQCwkcge+7Jy
	ZnsRxwwfLG1jObcAEAePOz8VB6fFF6JewKsrbD1+X6BelKXIecB87Cpw81rXcL40
	KpOFjvJDKpUru4VLyk3XWGoniTWDxltnsnaZN3D5U40n5QFdrhmuckgAMd4Sxb5/
	ByBlsx/ccKehueVHIaeUraHDMWaXNACleQQqDOS1iFKzdg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd92m6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 00:52:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-88e2656b196so94393785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 17:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760489566; x=1761094366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6jgXJjjhJQgEeLigi3JtVL9kgOdixyq/3UnYeX/yA0=;
        b=RetdSmK2AVjQA6yVxPoLcx8NsTitOBIVUaaAjS05qH0BOXqt/zZ+6XTQmD9rSwjWU0
         PDAD8WtnFVbmMHq2444+pcS+j3KwXVhnqfxf3h5VVY3NTw5zTZu5nEXy/iyZ3Bva6N9u
         EJ7bYZcBNjf04eDGOwIKjJwLOsVcRR3YHlq3nM4xvbqeoAHsSDuf7nDXpbVLima5qMOG
         r/wAoOYVeOGN0p2inNyiNXXhVxbpfQ/1zH1CX88l/kVDiC+aPBzHskpEMD/YaZfh0dud
         v4KJ2f7swFE/N8Olp4HbNwYDxCMA9eseEaCIJ4fn5r6cHGMgSFCotaoq3Idah0qQflbX
         Xhog==
X-Forwarded-Encrypted: i=1; AJvYcCWYOqS/7+K1cK8YaszuWM2aBg2R+ku+qbqsD11tgiKazd6NFtnvlJ49boNn88J9yN+s4dCejbSNCCckohGQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyphUysqCuI7HsSuJHz3d/kHzXrVsMgj6LRnTPCASTY41dw0Lz1
	/nIyE8w51EcBg7bM+x3qqj9brGsJvtxwpS5ur313swaYEcstVs+CH/FQxEXetkEpxo4WYNUPEDb
	qyMa63grcemO/JPXshfUMdswJcZL/FTzJqUaEwUrt8eGwtQxn4Nz0/ScwuGN261xw4Y9z
X-Gm-Gg: ASbGncszmmPnNKBYVo7lpgw3LUQueUBYXjRXuPaR28B0MWezIgUM2MqupUqcXff657g
	I/fwZjvEjAfp8+VVk9iTvqwLId6VkwQHclMTvHz1WYT/EmdxCXVgFj7+t9rbfmdDD7/iwHFJ4y/
	TcYe+rtXz/lsQEcRwZdaB0l87lc9Ku5nMZazFNM5B/iQRHEUsdV+av7uxvdSxBhUT6Y/3Syy2i2
	wc+hg2tZKkofhUKkzO0yZsMxCkqdIUGRXHHE3MRGbY7ddFZHNXYt7fudahKJ1E4BncJcHqnth4v
	lhB6YhRPtcGv++SrZZKhNXYRZb7anzaXCyjyTRRVLAJ7bC78X0j+MIhBLjnZxKBLmWlnb4+T5uZ
	v5S3uptHVqzkOoViokYMvMVIORm/sqnI1HlpX2G0D1DzBJmkpHxFO
X-Received: by 2002:a05:622a:490:b0:4b5:781c:8841 with SMTP id d75a77b69052e-4e6ead46dc8mr387551101cf.42.1760489566164;
        Tue, 14 Oct 2025 17:52:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW7m8cRicbOVlOzwtOiVLlN+6jv4dabkaHZG6TVMI+/LbJiygclcG412ZISQ5L9/YyBrt2pg==
X-Received: by 2002:a05:622a:490:b0:4b5:781c:8841 with SMTP id d75a77b69052e-4e6ead46dc8mr387550931cf.42.1760489565763;
        Tue, 14 Oct 2025 17:52:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e7f7f7fsm44067811fa.27.2025.10.14.17.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 17:52:45 -0700 (PDT)
Date: Wed, 15 Oct 2025 03:52:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 12/16] drm/msm: dpu1: Switch private_obj
 initialization to atomic_create_state
Message-ID: <36y2be6lf2hthjqojovlqsonkd4borz3qh54wup2mqvgktcuca@h4ziajonssoh>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
 <20251014-drm-private-obj-reset-v2-12-6dd60e985e9d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-drm-private-obj-reset-v2-12-6dd60e985e9d@kernel.org>
X-Proofpoint-ORIG-GUID: nC0xOKLl5vIV-MdRdzsRZYmQ1w_Eq0jV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX0hvMAnxZR9tm
 JH6gJzNeIDuHC6Tg/VLDyejA3bK8QHfZqoktbLkJey003kUgtBD+0Em8aC6wUswH9C0Q1zpctlb
 7nk2qCwLEZLNdHrgUq7w0P8xp4JuEBB1m/k4kJuhGze8gRUBmnhP5XbcRCg40E8vLDeneSZvDMe
 lGRYqveaPaWR/C/bP6Voh3//Ff2DBO/aju8+ao/eZS5msF+hH+FSpRz8Gc5sraOr1o/Rm93MdnZ
 hCV6pdsa/s6zI8hKrOic2MM/5VomS0bbUsBpcnymNX6QRFjwaz76mobbDcYHxDhjkk0I8LcG6Pd
 nUjepdnb60Lr6IrTmTLqsoGOW9LBSLYUA8pZosV0l4Czts4ZYOecw/ZMSgUzirGER96h/PQPiI2
 xeiHLXgI2ounDWi9ykY3jzHb2yOTyw==
X-Proofpoint-GUID: nC0xOKLl5vIV-MdRdzsRZYmQ1w_Eq0jV
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68eef05f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8 a=MY5GpsA41Snrp9pqcaIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Tue, Oct 14, 2025 at 11:31:56AM +0200, Maxime Ripard wrote:
> The MSM dpu1 driver relies on a drm_private_obj, that is initialized by
> allocating and initializing a state, and then passing it to
> drm_private_obj_init.
> 
> Since we're gradually moving away from that pattern to the more
> established one relying on a atomic_create_state implementation, let's
> migrate this instance to the new pattern.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> 
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 42 +++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 20 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

