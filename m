Return-Path: <linux-arm-msm+bounces-80841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF482C43051
	for <lists+linux-arm-msm@lfdr.de>; Sat, 08 Nov 2025 18:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 839F2188BC02
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Nov 2025 17:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5E214F70;
	Sat,  8 Nov 2025 17:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8zryxwm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hl6XGmG/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE0934D39E
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Nov 2025 17:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762621253; cv=none; b=i/LnAftsZZOx7REaPpIcXNSwGTqhAw4e/m5qNDeFX8TKINoAxoSgx1T/1o1Oi4HPbbxy3uWBXb8yFLdPJK3vshVD3SI6Dse9Yq3oV3P6nWdM6CeCuw7dj9JcvtMDsAcjklDa0VgUnOIf4jFV4VAgaMPFWffzGq1GuUSMPlvNb3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762621253; c=relaxed/simple;
	bh=EwCrax3NJxwg4/U28uxji+DIq1FaeiAzFr5RwfdjBmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKZ5LsK4p+h6S5D5UAvgLaWIy8BRQ8tdAtfcwQQ6Le4kfK2eZuWBra/iYOxH6mHRfh7KeS9+FQGwiC/1Od0XScoAhbJw1waEiF65ssq72/WvRervswUmzSvYhf8F6KZEqnRZ687zi8+KVkcZPcHTMNCYr8woB1JhXLDXKGR5158=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W8zryxwm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hl6XGmG/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A88PYMa1150806
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Nov 2025 17:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SymD3woxruHShZlmzgGQ9Ao5
	sdm1n6xaKEBnyNrZI5I=; b=W8zryxwmyyS0uVOxyZdcWyJS7fEeS3r+4YSWjwAH
	0XsaGqv6tzTMZ3Pco9DdQqZSl2SDWFk+/GcF1CEWld8UTkEY7RcdX9bKPUdaI2ik
	MSIKK6If78PXQokl1VbgYqrE5UvCY+1p9ZJBIaWBsgSb6OftqJwRpa9N+iuLz5vB
	avPoz9QgcFuCQL2t785LjXPrOr1AK8mCQqaSlh1MolBFH71HQZrkAHq1hHm+/gCU
	I0F8y/Nkh2WkGUffdAXDrjwTEUKkD8SFX3r0sqWdBpsRrZ9yPnS5lTYruEkH1hSU
	eYtSU1MHNq9GN6+HMgz5HbHRaH0yn9NpB+Hwr5A+7khPgg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9y1h0va9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 17:00:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed76a29beeso38426411cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 09:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762621250; x=1763226050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SymD3woxruHShZlmzgGQ9Ao5sdm1n6xaKEBnyNrZI5I=;
        b=Hl6XGmG/REf5HFMHu32ID19TEUpNBVgUh33I2VkP/g+GCJjYjfH8i7VXTGBZ6goXwb
         gLjhNHYpjlslZr0J76Tt6v+Olj9WML73zKRfboGXtak5JFuqsaEkYyr7Dx/m3btnNoaZ
         yr4nwVDzF9LXYOoO3nm2J7XI+YoyDnWIkA3QsDuL6qAXqubO6z5PY8WXyFTuU4gdokbk
         BmJraCr840Vv0jeo5czeMutMkBFE+DjGHeQ/BiSAiC0rMctKw8/5rgxzF+EJN+0j70Bs
         ppNsMKQnZBt2oj8xAGFNzUb4hjqp1LYSNbdXKyjddvnxgZrtBhieyswLUT9j31FXVUcp
         MIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762621250; x=1763226050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SymD3woxruHShZlmzgGQ9Ao5sdm1n6xaKEBnyNrZI5I=;
        b=nLeMiZyTqkEPDabgJDVeRY89nfo+nfKl8yoVztmrmo2vV+yQFlz4VeaAZ07QHWDX7Q
         qcyirlFAxtJ6qp1Wisv11QYKeAoYKsPkL4yvvPwJwbf5xnHImwNuQ9TD4bO/AQHN8WcV
         8k9avX8oUEO94eODEc34+Ub9eLqAWiXuPUtR94Zr+pXbJDdcEZE3AYhXHscP79apzusl
         Wn+L5aqOlewtIP/3SSwfEo0W4BdjJgUKtKXfp8ywjVMu8t13+JHqDk84b3gvj87opD2+
         Z5d+PlKOcCwSnhQP/P2ouyigp4T/4vMLiO+dkasrNDN8P3PWo9ZJ8l9flGe88cCPEJle
         HvqA==
X-Forwarded-Encrypted: i=1; AJvYcCXIiI2orjEKyAaaxwmRBVIY32AtzFJFyjyls7tjTtk4UhkIDtBOttyQGt9KluN/usmZvNnTHyoqcUtKO9Yf@vger.kernel.org
X-Gm-Message-State: AOJu0YxBewxdutbhfgjqsVORoQOJR5rA8MIMb3oABB0YHZ445u5qdvv4
	tFdBYtqAXQ7L7Y/FW7O639ImrFHGJVclHLv7uA8W918DW48maDA2tdgMShQECxPrtGpS3Jiuf2K
	/7fBzMn1eoAgCf0dPrJAAFsCsSqOlEDHSMr7g8l/JWyYYBkxHiX9ICT6gbQHO+T5cpF0H
X-Gm-Gg: ASbGnctQLDHeA7DLsZx/TYaWZY7GvwDu177axolWke7Lfg1Lr9GC+p7Elw4kVgWN77e
	2m+x9WUAU/aCWni7X2jYBMiE3JarANHEE2zKQ2qdxCk0cjtspqLdB7D2t73LYfc9kauh9V5sOGZ
	lmffocDy8OQkqaGT9SRqh21laPksfMXZumTZh3d3ppJpFku/IyBfq3dGay7dFybE+rqc8/UL5k3
	x7RyBSnlI42vAMxXXi0FUkczdfKVzORI1o4MmW66U1GTkp1PbaeLbWMe18WpgM9HXGNtVBGyaRF
	W86g/XoLd69pJiDcGu2C2wfggQQQ9XvWYS2PRhB0/S86l4gofX39PJlAxRX7qaja7Zy1SQTL0ZY
	uH2Z3S6+HNedidgPsrzBwgxDagtrqLVX6YztXjaua8LnV1d0B/itSkeQC0qszRg6rg9Fu1pzUae
	+t0/6+PKP/vyMe
X-Received: by 2002:ac8:5acd:0:b0:4ed:43c4:5e79 with SMTP id d75a77b69052e-4eda4e7bf1cmr44278751cf.12.1762621250282;
        Sat, 08 Nov 2025 09:00:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1ot36r/5empkRXCspZfcIecbvIzABkFl724CS94Vw2gQkEMA6LYJRcTmCK9inn074sbu6tw==
X-Received: by 2002:ac8:5acd:0:b0:4ed:43c4:5e79 with SMTP id d75a77b69052e-4eda4e7bf1cmr44277961cf.12.1762621249762;
        Sat, 08 Nov 2025 09:00:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a01a67asm2305233e87.38.2025.11.08.09.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 09:00:49 -0800 (PST)
Date: Sat, 8 Nov 2025 19:00:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/6] drm/msm: use drm_crtc_vblank_waitqueue()
Message-ID: <hvbwatl37zseui27epzns5btxdzrjehamtua34ja6flenjxz3q@ac57pl6niv62>
References: <cover.1762513240.git.jani.nikula@intel.com>
 <5917fd537f4a775a1c135a68f294df3917980943.1762513240.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5917fd537f4a775a1c135a68f294df3917980943.1762513240.git.jani.nikula@intel.com>
X-Proofpoint-ORIG-GUID: OrcvMKDbTixwCuxVlOe8ioA_Bdo5FLxw
X-Proofpoint-GUID: OrcvMKDbTixwCuxVlOe8ioA_Bdo5FLxw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDEzNiBTYWx0ZWRfX0rY5/cSTMh9B
 C1iWVw2nTBjRGrw87MsikdqswbVxzWGX/tKXLRvKEJ5WlPLFF4WwdW2DYZPu4IGyO0SLrRW7zHI
 vwSmc4ZYxi2qsy9cTsEXCWaYj2ODvt3ML2sjITpbsGx0C46jxcXZEuZ6d3U1EJp6FCMR8Ws0/a9
 Rxj+JAEijJACNk+zAGFMswxwiJAuTTTxJio2w/9WpPimRs3e4QooUZucqGvftgsWpe1d1ht0sxr
 BhdAHBc9OcULSQWgKaz8gTkqRrLnUkil1q8N3XfsRGyLvuKzryeOmLqKOr7emL2Q+TQwbQw6j8U
 RqAt+TwlCm20h8YegcA0RCc1p6CpNkFclgkaFwfYZArGCrlJTk3TXGF08XXgw9E8YhrNy/S+b+m
 rBQzISZvn0b8zkDn3SPShWCMevw0wA==
X-Authority-Analysis: v=2.4 cv=Xuj3+FF9 c=1 sm=1 tr=0 ts=690f7743 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8
 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8 a=32IxprGEISmnaGXNLfEA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511080136

On Fri, Nov 07, 2025 at 01:04:57PM +0200, Jani Nikula wrote:
> We have drm_crtc_vblank_waitqueue() to get the wait_queue_head_t pointer
> for a vblank. Use it instead of poking at dev->vblank[] directly.
> 
> Due to the macro maze of wait_event_timeout() that uses the address-of
> operator on the argument, we have to pass it in with the indirection
> operator.
> 
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c | 3 ++-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

