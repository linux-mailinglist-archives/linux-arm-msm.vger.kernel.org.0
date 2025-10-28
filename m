Return-Path: <linux-arm-msm+bounces-79302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1E6C172CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 23:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76153403D8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C723557F5;
	Tue, 28 Oct 2025 22:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ki0Mq75I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qo1i4bbQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115E22FFFA9
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 22:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761689657; cv=none; b=OoXvmtylKbxzF2EgfnNUj5e1tzf9zlkro6YXlrG38DnFVuNliIglFB2J3GWNRitmmIXeDKWbasnlPH9F0frW61sB7XfsHriPkMAJYn1Dfk5NoJhtSNwZ7/PPO/ofpl5QoVc2EVctnWJBJXCPz+X+H61Kp9oe70rjiFfmWgfxys0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761689657; c=relaxed/simple;
	bh=BGHl/hnI9iOa7t310ZxG3FCAuX/ld/6xwcqaoEeuUnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTJCJEJDw6nxeT8uTPAR+B2m4xQ9tu3pNapJ0aZ2ntSpIMCudDq6oz0zuKfq1y0l8jZ4XselYcmMLAwvLi9K78DpPOnGeZjmSCGlXbqkR6KR9rxqPeFLbk2NOQbF+EEVjeeRGsM3jrVvoJuta9G8IZZz6hv/7aKQaVQSfJG/H+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ki0Mq75I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qo1i4bbQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlVUI2575622
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 22:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1me6Y331o4LK9HXk4HeTnXtF
	sN7EPXvCiOq7Qn53yrY=; b=Ki0Mq75I+m1RfqsuDmfGYFvJ8srrwhheO6+un7HK
	cuY2kmSa0krklte3J82ZZiXXye7kaOKJZ09p+IbaPELIN7tuyVoIHyzxFCv4eLNC
	gLcBMxQn5lUgtVDF7kJrQB1pZCBxo8vb1PGXj3lQsJV3l164rmc/NO39XbmBAAYc
	f7uVj7XZc371eLRejWKFjwLXBBWcw7MI234VfLkGFdSTa+niEuQ7SSEsafg/UaU3
	+NxgAIwH68Pc++9FT/Dr7Icw+U3Ioo/1LecGv5uiSMifNPkRSgVCuYiuhJyfMo7s
	kbBTLrdJd3kozhZpgzsVZsrLz6ncNgxINORIzBZtitCw4g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a20ax0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 22:14:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ecf2adbd3bso23537491cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761689654; x=1762294454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1me6Y331o4LK9HXk4HeTnXtFsN7EPXvCiOq7Qn53yrY=;
        b=Qo1i4bbQbqHh5SshbVcQqWpNMjmXcztNRqgxeqLvJnyumnkpwN4Bit/ImAJ02fhpcN
         foHhAE7W5AMVe8c3FuBUou0WU2sVV4B0xK8Of9xnYaqajKaIj7ZdvdCRPYOigIFutGZa
         Gto1gNaMt+AAXTcLH9XUYcKfNjku98HUIWgH6Jkj9uhsUjY0mclHXka5iSQG+xo2gQs2
         6bA+sb2qX9NMTSAh8mIjJO2ZoBpftPxF9Pl2BjxdWMJT5qDGeiU8PslVH1SP4Dz59GtB
         1+ewnLDJQYSdbE3srmtwJO5/rU/ds2c/Fs+OcOfdW5zQLGF7pXN3IePXWTKExoeKrQ59
         Ni7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761689654; x=1762294454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1me6Y331o4LK9HXk4HeTnXtFsN7EPXvCiOq7Qn53yrY=;
        b=I22v4BPVvIVFWD8/9pb7YrXJCDqzzR61qgCepGp5p3wi9nz4qC41NEhjXYzzLS1DTv
         DY+0VYYiQD+RyDVZwtjGgEl5vDSO9HjkV1lODKJ9aZnLXyoHehIfJer6XdBcsoy2ZQ9P
         pZLKR1Ffh7RoeTtrOqiQlw+m/JxhfLcil0SQ+ER52tWKKqUPo6N6KLEycOIvh0M4BjQ8
         KYLM8egikISyq2V+MAfQ40lNImlSC6smBQMoR4M89izUlyEHXbewxkNUojSTe6iraRCv
         YOqUBhBol26svFhq0xmJ5T2qCHHi5rBAyALRqghM9Po9wd8PDoZnhe2PU/dOBFHOG62B
         6fRg==
X-Forwarded-Encrypted: i=1; AJvYcCXKvHALrqg88AzjGpmD53l83n5Rr8vdpDzah0Cs7kaSZTmHjTj1sniUisi5qWvbEPz0Owa/97RMCatQxWNA@vger.kernel.org
X-Gm-Message-State: AOJu0YxHh5Ui+bmQ1f/yUpsOstYoCEJeqdkkKJPrLTX+KKHhFftqmXjo
	4ehe+2MUdfJwFYwaEaM+tIS1jZ5ebP2XPQTi2bmcRa9XZdievzJe/rc/kcPFHGIT7KDdAKzPRx4
	9TvleH7FDEf9hHe6yuSwAtoem20a2tnyqr3MXlKjv0n0XxbzMoZrqAH94Qieiy/i4z7tE
X-Gm-Gg: ASbGncu8XhbKkjMsdfg0I6BrKUc4essbhghA932FhECatVj2KtpbsO79Ryo5SOopbRM
	vKCwRNqq2vNl8cwgDP9wy/sfcSKzLwoHtGN7yasGbgHdci6Ir7aWAkgZvyk6WvKV3a1Br1G5S8O
	5oq7rbnc0yuNOqda2eFwxcABcqC07Z+7Tx1WU00TO3PjfXPTihRtai2TzRkKOgSprSMstrg8SlA
	cEe8a48qz/xA/sd6c+JMk/Q5EJYceLZwLvtXg+J3BJOcgI2MzK0VevWrnSmYZsTVR4ANqUwN2R5
	sa2qonZVJyRX8a/67yhsJpEXwC6LEtXFEhQY3eeycmiOLa4LmwVKgfQN+xupUFRrkX0iM+wuqE4
	JMxLFWUcuazpJOhgA5hr3hdaiRA2wks+uJWeBa+sicg54N1hv3dHZ6cLMJEjW1oMcWZ7gJqhajC
	UAdAsAB7GZ3O20
X-Received: by 2002:a05:622a:8b:b0:4eb:d84d:f8a8 with SMTP id d75a77b69052e-4ed15c765b8mr13810381cf.83.1761689654152;
        Tue, 28 Oct 2025 15:14:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEaAR+XeAuLNAUIx0RF3XIOtIX1rvFmAxnu86IueWYjWEDGa8UW2uPoQg5lQeuV8zGvL1PoQ==
X-Received: by 2002:a05:622a:8b:b0:4eb:d84d:f8a8 with SMTP id d75a77b69052e-4ed15c765b8mr13809811cf.83.1761689653577;
        Tue, 28 Oct 2025 15:14:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41bfesm3335363e87.14.2025.10.28.15.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 15:14:11 -0700 (PDT)
Date: Wed, 29 Oct 2025 00:14:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] drm/msm/dpu: Disable broken YUV on QSEED2 hardware
Message-ID: <uoavlz3rejw4ntnyq5kwf3fy7zjtbnrldqvwj5tqtahee6kxne@nhx5wgo4zizv>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
 <20251018-b4-dpu-fixes-v1-6-1852278064d0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-b4-dpu-fixes-v1-6-1852278064d0@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4NyBTYWx0ZWRfXxdlaG9FwJOpW
 u1AXdb/3RHEuR8Ytqub1uYenH/8GynqrgK/EYMB5DOtvMA+o30jlnO0Jw47uvTs2fu2FGGBgO7C
 YZjeoi6Ax7lyK+7gT5v+ZajmXhW8xPOnGQmsowVJDgndJDOCHtLcXT/l6XtXDPvnNuEXgyOzrer
 8FAVgyaSW85NcmOl/kQ0j6DnA8jdMNQTERNZQ/DUgbgXj9hmcWqXIfvDHsReV/7EkO5hzxzPqBt
 cEDPgwoH8o9XJ6Anpb2rqXQO54w0dyd/svyM3wohR16GR05aMFju5v0Q2TixAEuBqdjZloc8VZp
 oEAi4anakojOWjAzLLd8DwCx8jWLrSLKoPsuCJPhmBQPUSyk21Hu7O2Wtf4JbDK0QdZcIsfL9YT
 l4SPa/pONp0HxSaYT8drZeXh/VjF+Q==
X-Authority-Analysis: v=2.4 cv=V5ZwEOni c=1 sm=1 tr=0 ts=69014037 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=kAP0dVoXV5zkFeC1rmcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Jktu5KLyqKSFhVhhLqHkQKVsnBoqchzh
X-Proofpoint-ORIG-GUID: Jktu5KLyqKSFhVhhLqHkQKVsnBoqchzh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280187

On Sat, Oct 18, 2025 at 02:33:43PM +0000, Vladimir Lypak wrote:
> YUV formats on this hardware needs scaling for chroma planes. However it
> is not implemented for QSEED2 which breaks display pipeline if YUV format
> is used (causing partial and corrupted output with PPDONE timeouts).
> This patch temporarily disables YUV by switching affected sub-block to
> RGB only format list.
> 
> Fixes: daf9a92daeb8 ("drm/msm/dpu: Add support for MSM8996")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

