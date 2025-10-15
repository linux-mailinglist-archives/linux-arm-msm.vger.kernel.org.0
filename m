Return-Path: <linux-arm-msm+bounces-77262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0F2BDBEFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 02:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 86B9C4E1606
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 00:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81931C4609;
	Wed, 15 Oct 2025 00:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i827RoeF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318F929CE1
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 00:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760489556; cv=none; b=d0+EUCJ+Ur4+kbfkIq7HymrxJe0JfEYriJYVcDv4BY/qlWxcQEaiKOeXyvo6eWfWtX0osVadWCrXvcKG7NQKhjqZnvU+y0l0Q6dyMpeLeoq4at6XgvNyeR4MURnWQosr81xKo39zN4U7pwyaWuZP5OQluiR059zd+Wcv/VEFEPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760489556; c=relaxed/simple;
	bh=cK0xXI356IZ6aIOO0Y+XQmCUSMPW891OWOXfFQYyWow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnFnBuHzMTrKgzWiHklVrK11gY5NopBmVHS5VCxsDTgLNdOGdG8RvtkH34UjZrN372WvqEXuQTWvqG7tjuTqblQUqg92X160khmEM8RlKek+DlGCKsGBuJ+WHqXvcopiK7o7J4CuxJWsR7DcWi5n02waOrpWCCscGpGdXrb4KcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i827RoeF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKQxwE032678
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 00:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tzf0L6D3EH2YPFle2aNSiWYB
	7DpBkZTDjjS3DEmFzrg=; b=i827RoeFhLPic9UObH3TaIK+lvH5+VKKHubOmnOi
	ZWHtKvaevO9HzkKFGhtkA+Xt+iKVQw3ELG6zgtVGwTZZvBlwyCKaCJLoQnPPSdPT
	naEvfpe3BLRlgallQBHRh6C/9pxlJ3OuUieGVuyDrhOyQE4EpXFVRzWEiDu4tBNm
	+aqdQPkqG54EcteRe0lMhwW8Ey0LOyGbTPqUh+2My1dy2UuukBTumGHbyJcRGzPz
	GbubbPJdQe7d3NGdVK2KIhWaZrqrutj940Ic/xeu91cKGtcME3janE1UIFOa9q5H
	T2XiGsy9TiPAqU/Caopy3gTEs7gr72O7PeF2CNxQwzcPiw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0thay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 00:52:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-872d2ad9572so3029848885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 17:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760489553; x=1761094353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tzf0L6D3EH2YPFle2aNSiWYB7DpBkZTDjjS3DEmFzrg=;
        b=j1MRQvjUc7+8Jwy748mRaLZKTuXbTz6/uKJUic8voBa65QR9E4Xa0rmk1ePuxPFXOb
         dGxsF7KySfWub7cGFWm0HJ4Vc2P3Ukak11qYILyGJbTAP8I2pD9NuLKSAeaJRKDf+SPu
         +KjQEa+EGxfRUHDP7RXfjpCgOv6BVlF3zdMG55XMYQ6hXazTWaU+1RCVj7JhGbhv9EBX
         RJRa7bJ1Dehern6IpfUHM+j0NBVJ8VazqiT0ldPxD+wrmG+q29dMYwaGCbLaGOuh6yHV
         GhVQ3e4ew0rZy5F0eH4KoyC+Bf/06wf0bTGTVURD9GUC3VZwQHxCUYsvlokpJL85GK4k
         vqQg==
X-Forwarded-Encrypted: i=1; AJvYcCWXVfl0nN1seDS2QSGRUBHPULlUAELUlcGCKP0PihNRS2e6iuPbwK7EaABT+fkcJ1R6M+yXA6dRzlEcM4l7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb5shoxvMMYeZKHFakl+joe1TvdJF6HT70Rkhj8+ybGRHepn5g
	i2IrHXPfSCHPIU3FUQ7gabHscsOgH6a22JzNay9QoQPQGiEfRfpnJZ+4gs6mXgy9DAMUX401+Tw
	M2UfUi0hFx5neUkoH818c2L5uN+p6XJugmtfZRV9wEzc5ZjGiiQe/Fgk23klvFfESJF2m
X-Gm-Gg: ASbGncvx/bqCCVt980nZcH9/s8QgwvFzMthf4ijEsAudIkOPhQrIbCtNBvJIT8xD8X8
	QjL9Rw/wQnhs+b6ECxfvGtdVd8Y5mItLKLYkW987WJ2VvzoMjH5E5h+uxY1+t3P50dVuHY1JdIP
	Lf0B5qa0w5wgFEg6oJ+1dKdbKaJB7IxbG0H5b6a3JOehQO4/mRMi8ZOGaP3QvwWgqEYWjMmKPey
	6JkN5RfshzIbCsseqivCYb2yobtOGnzrob80zqw28gvCqFYqaTaCphXHPBZgDqjPkcugFeBsasY
	l12zV/3VRv5TkBVgWs+FaJsPHZq4Pi/9qvcu7vhVI+dq1PurAdnijKoJAiJ5GVuZN72bDqjT64m
	9DtNNFGFLCPZjyRImV4Zt/Twc0dplOa6Vm38ta/MZrVfPNF/Pcs5M
X-Received: by 2002:ac8:5dcd:0:b0:4e7:2506:ec79 with SMTP id d75a77b69052e-4e72506ee30mr135584881cf.63.1760489552888;
        Tue, 14 Oct 2025 17:52:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT5gGmEBzy/fGeyfAc0o95IohcwAF602kc7JGNMpkeULruHi8pVrT9U/c3E39PE+wY0ybzoQ==
X-Received: by 2002:ac8:5dcd:0:b0:4e7:2506:ec79 with SMTP id d75a77b69052e-4e72506ee30mr135584611cf.63.1760489552446;
        Tue, 14 Oct 2025 17:52:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59092ed98e4sm4876671e87.4.2025.10.14.17.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 17:52:31 -0700 (PDT)
Date: Wed, 15 Oct 2025 03:52:29 +0300
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
Subject: Re: [PATCH v2 11/16] drm/msm: mdp5: Switch private_obj
 initialization to atomic_create_state
Message-ID: <z2y7vtahoot6s2otwtvfvaulagqd6q3oz2bysj3zudj4lpu2id@jknxi66wq45t>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
 <20251014-drm-private-obj-reset-v2-11-6dd60e985e9d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-drm-private-obj-reset-v2-11-6dd60e985e9d@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXyHufZ0l/nL4Z
 N6JvfaxFmalhqeD37/Rd5fzUybx3QRTp6h5qU490Ul2w1g+kZ4k1VkSyNHHLZRhHgDeS96sivOv
 6wuiz+BgVVb5UNfeuznPJkapIWBI9bg9h7CnfleLcyxkZaESnK3GTVdR+1Argj27Al6fnbEU/C2
 GH06zpj0LbAMdU2OuCa87WQ9ooKawJCHUK9c/exGIJzOLSKc0+0Lp7c2+RNppwa9OFCHJYESBnB
 agTgFyARqWMsiC7XIzyBtgYfnXSHUgO9PoQuz0Qu9cWTOyHbDkjMTIViLRKTVqi6mukJC1aIcRE
 q8zwHfR8BOqgaW4k5tPWVg7E5kv8/KNfumNxq8hCg==
X-Proofpoint-GUID: ZVUkQYVt1qbYuRYIH4g5b6EmMPLy81xX
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68eef052 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8 a=irzjlvPHKc5pWT2xi-0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: ZVUkQYVt1qbYuRYIH4g5b6EmMPLy81xX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On Tue, Oct 14, 2025 at 11:31:55AM +0200, Maxime Ripard wrote:
> The MSM mdp5 driver relies on a drm_private_obj, that is initialized by
> allocating and initializing a state, and then passing it to
> drm_private_obj_init.
> 
> Since we're gradually moving away from that pattern to the more
> established one relying on a atomic_create_state implementation, let's
> migrate this instance to the new pattern.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
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
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 41 +++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 19 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

