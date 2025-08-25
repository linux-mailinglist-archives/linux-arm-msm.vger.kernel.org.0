Return-Path: <linux-arm-msm+bounces-70736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A47B348B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 19:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E66997A4BE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 17:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498BE303C85;
	Mon, 25 Aug 2025 17:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVZ9EhpK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C292E3002A2
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756143168; cv=none; b=frknA0txFZ4SQ+FkTU6SIG+sJTtoI6FyrWPa0shhbGU8C//Mx0Plh9SI70u5OLL0X38k3wi5kpzW5rDhzr/VgeVbfstHqv1uUaVLPlSJKBnBd1j6CL6E8jBXdPOFF+w8v9Od5WwBvR4de7K9mhdQbj9LRuFBYSkyME1uDbo628M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756143168; c=relaxed/simple;
	bh=FdQgA63171kQamrvoRpHVDUxsVOKlVjnZl2p+Aodt/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZe2O2KQTk7LOMgokS3PSp06gejvTbmjwPkBUHdSn3mQtaCrFZFjIQA5xpWMran7ci5JYxgcMCvHVjRl31WephYihp3eyW/JZT9c55DYwFI+vg3GQ1zLhZjo5OSCVOi1AZY4KCLck9Nd7/fe+KIq9Bffz2VFqyTCPmo5EeAgrNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVZ9EhpK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGHjTh030554
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PtOiqEStQKZ77zF7pAKUnMDX
	Hl86zn3BR3KKMOrL/y8=; b=NVZ9EhpKamed2usnZ22OuD7deiCJJtYDOVcRZlh4
	C7h0LGQNQm4BhPWhv5UxLXdQSm6CPiDDWxMgkf8XfW4x/0ShSHHRDa988lxJHkdY
	NMkcr10gI4fWSRf3z3vL78XnME/a7n3ijNuUXGwpfJFzZVXbJ30z2xzJ0rlP3MuP
	CNOc6p3+/nvhLe+EUYefcW/fhy5KdLsVz+Wepweh0hDQMC41mRXMR51xnSJCOeJP
	3JaDIIjgRpaJNIKcglNm6TILMfgVSJ1BlG0wpkw255znSohOILxAJL9i+Vg4xdBs
	H8GcFpp5dOTcDqddrRJs4zhsj07NveIQud2D/+C0TDQXOA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfdxux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:32:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b0faa8d615so147786151cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756143165; x=1756747965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtOiqEStQKZ77zF7pAKUnMDXHl86zn3BR3KKMOrL/y8=;
        b=kiyp5gHnaqTe/BnUBVvGnJScHF7WNQQlun7t+MwL1h8mvBHPDe5HXtQjYlHaMFXVLN
         8QeAZTtnQiJ5SlASItRcSa0nBe9YWFN1NzYdBtyqR00jZP+yJLAnrb4Xqw3bDAk99CwE
         ng2jY+hUskHza7dxdKvta0ALpPrhOVE3S6JjXjnjvo6nvCCx88SRLhSvDKwTkWQXNtV7
         izp0coIbyV5BuMqGJhu2cFGpqoWxwBwRj2yH7HONLRuptzGINifQff0+LK5ehji6pVMF
         EePljo61FCHGsIuc0dDNx7dQ8oduxsbzKcKXEeJ5lftctHPYmkzC9LZUmqNOsT8hODEL
         wYgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcjK73Kkh9L80j9AdplFAzbZrsXpRNttmN25vTxMXsCIyHhTX69GbiInmf8aFt4oiCX6/Tw2rMSMieX+zT@vger.kernel.org
X-Gm-Message-State: AOJu0YxntVIOsAAW8OFydmekPzrS8EW9/HzYXgzHrsAmfXvhhP53kYGx
	4F54T+KCRdGynIJrjrTTljJxlg00wsDBZdoah9wTdqQAND2XyWVBLjdEZE5kMm/1pMffv2FzMu9
	IFluhI2yVz3gDGjroKwea9c08O7T5/ImBHROMRLy42hNLfZOdgaPzdSYzlMuoBBJ/0aS1
X-Gm-Gg: ASbGncsByxyFNOUHfryFBKENdNB5ZpgI7wEb3ptkuY4x4mSdjWTRsOJnoTF3BWZO8O2
	1WskivYLdUpBmAEi9mscF45snDn99mWvU8FNdOgHeuOitm+aYaPOKtIHv9DlYVxluK3//LM3r5c
	4/UeqTtB+x3IzCHtD+VXaBxGwY11wyVOkHaJEbn5ZkMaEPvp7Zz9OC/+hpb2Ip9HcwxV5BEBHaV
	owp74BIe/Msx11YsWaF3OTN9UiJbuGh4QwpBPRKdlzUi1/ypQhaQS7lvO1mV/IISkZfkxfirKI0
	VjNaDn4XeArfyVOhIFgjN9J3A/XjhTjyq5tOzhruE5pxQ+V0aJQH+h5+zBXHF8zKHOTJFuXYb2x
	gLdHCAmgUNsZR8ytaBeziHX+jfjd1FOn+85RF3a1KWviBZbatYXFd
X-Received: by 2002:ac8:7c41:0:b0:4b2:8ac4:f098 with SMTP id d75a77b69052e-4b2e0a20a11mr6080871cf.34.1756143164550;
        Mon, 25 Aug 2025 10:32:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyWUI9/JcuNq34IRC/iYRA3AEnS2Qy6SSU8Z7TfujwVKyou4G/jnYD5HrIwMTWY66+zeUXJg==
X-Received: by 2002:ac8:7c41:0:b0:4b2:8ac4:f098 with SMTP id d75a77b69052e-4b2e0a20a11mr6080081cf.34.1756143163891;
        Mon, 25 Aug 2025 10:32:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f3d4d1afasm1436815e87.58.2025.08.25.10.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:32:43 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:32:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 07/38] drm/msm/dp: allow dp_ctrl stream APIs to use
 any panel passed to it
Message-ID: <jlgm2fgkyflflphtb4cv5gqedvbrstc64rz5iihjvvwvncha2q@5mrwxuq3i7jx>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-7-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-7-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXxi/F+QZmzyBB
 oNH79m8vHF0+pjM03NoJyy/4dtriQhb2cMBhbQT0XRsZ/sosprIjxis8ecJMiep1Adkp2/DgRQ+
 HuoosjzG81dWASNg2A7ZmYtzMEBtw0PcuL5c2JIMgcnbxgjJ5Oi0OVN9BXsbYIOorDMOfge7okF
 1rpGKVBC4YsZdKrZz3VQDMzhs2/8C7tbLo8aOqZ1QHmYsSjATALjd5oICRGvFfnUvovLXk1KHCI
 eFbNd/5eCZtMlAqeQS2gYd2FsnQofUxCHkY473ljl5OWkoiBXJmoRVn3HqAwnR/U88XIJSR7N3b
 2C29ac2GZL7+AfF7Ouq7xjqUf/X/zGbIgV3FKhVVkv6DzsesKYCmPip7J408dCFUKHuQTWPaGTP
 KYI+NKVC
X-Proofpoint-GUID: RhPgt08s8KLR1szVIRHvQ3QMEJutbIlU
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ac9e3d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6Lrzk36WTCfDkofcdswA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: RhPgt08s8KLR1szVIRHvQ3QMEJutbIlU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

On Mon, Aug 25, 2025 at 10:15:53PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Currently, the dp_ctrl stream APIs operate on their own dp_panel
> which is cached inside the dp_ctrl's private struct. However with MST,
> the cached panel represents the fixed link and not the sinks which
> are hotplugged. Allow the stream related APIs to work on the panel
> which is passed to them rather than the cached one. For SST cases,
> this shall continue to use the cached dp_panel.

cached -> stored

I think that for MST case we should not be using the msm_dp_panel for
the link handling at all. Does that make sense or would it require too
big refactoring?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 21 +++++++++++----------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>  3 files changed, 13 insertions(+), 12 deletions(-)
> 

The patch LGTM.

-- 
With best wishes
Dmitry

