Return-Path: <linux-arm-msm+bounces-107225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJoiNKQOBGqLCwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:39:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 436F552DA17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDA51306C4CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 05:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34573A63EC;
	Wed, 13 May 2026 05:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K2TgNgQI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bidZm+Kj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B773A5E8A
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778650783; cv=none; b=E4qHo03pqIrLjKLjI407aRt1jVNNBG76rNu2rtWegGvxYcOYDv7JyloENJN/syEG/ROCeO43F8jxoZtidRm2N9o0Wf++5bGESkyFTVA2IEBAH5XSHkJsUXTMmUuOzClbypPwDFI+nFQMZjj64kHaGpuE/NEidyaz36sBiZ7OhEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778650783; c=relaxed/simple;
	bh=oo307cBVsJwatzWX/p0srMdX8pjcWA4i3nXIMHA0vSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhU9FaIr7ARIrDk4LlhSM6UtWHZ1A3juofck2ZaBbxb8LwK1/ZFN6hxnfOAhBYTeTcnddUr77J/lcXa6jDTNnD68VzoSUC/t6en0NSISs1c2E8Bvy5uolLJQYf6hvLpS8dtxthIc69a8WRr47CDqftOg7WOesDlbDEH0KgDSC4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K2TgNgQI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bidZm+Kj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pVOk2344771
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z1eg0rADF+MRr4TC+Z0EGVjM
	pmf50WH81VVlXV7fjUw=; b=K2TgNgQICan5Q9VR1dlUpy635ll0XMMLKJuu2qNZ
	SgO2whdYqcs9j1BdZpxkn03E2pTD+sFFoECzAMOvSm/sgkkBunePCiFo44XFGyLR
	5S0Iex0Bngn7HpDQNRUW/WgSapps6NoAjoSfF8OREesKzOy2VIBBTSDzcG5ZW0ht
	bi1IXVwZZZP4b6sw7IuQjitv/wsP8EMg/R5Q9WRgO4hHuKC+A0PlWusefaeu4pNR
	wrtJ7ohDH7jrHQRP7EjUFmUAhyi6nL2EgMN7qkwrfNHwmGs31l+rtS7bosUDaKZT
	exj8CdK/2TMAK99hqzK4K5JoWhRnHQmhXErvMG/DYGBv9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43tn3e1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:39:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-90d6fe98316so236687585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 22:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778650781; x=1779255581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z1eg0rADF+MRr4TC+Z0EGVjMpmf50WH81VVlXV7fjUw=;
        b=bidZm+KjPXptJW/0/lQ5Am70ksvT+63bH5/0cyMteyqQ/zfCQRwMkwGv0dwkpx9ylY
         WzRdZ8bRnQJh6ZPeGVctgEuiTS0NVvrci/QSpDsedeopE0GUbsCb99j/O6a1D4ibLxfn
         RGwreh2/ZXkjigpiIV3SdjLB7LeRoloFFbKBNe2Qrh+/h8O73yml5HhgJfxfyhT9VDcv
         xklnrTDwzULuqe61HBitQSLYu7vC0ZbE8rji7oAemRc4oyXtGocWJtQa03uIU6QqZBr5
         wDdkqcWJe+bIpqYQhyfzFYQnOnqVfMcf0jeipMWeevUv8Y2CBwSOOWzm0fd+XamN+lZ6
         58FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778650781; x=1779255581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1eg0rADF+MRr4TC+Z0EGVjMpmf50WH81VVlXV7fjUw=;
        b=TZ0CT8LtRys2+FawMubXU5RFqhVNTr/TQemagV8Aj9DWvvSCjEC+7jQlY33aIqCplQ
         kM4Gl1gu1bcyuf6EKNY9CeoTJ7/T9dBetkrDGGFEeDYTGSv99+wYHi9l1dzR7pyWswGt
         x1mOFZxZtjtejhFbvwW+RzQnqEgm6YdyfrUbjUhNvS8QHuoXW8qiLUwmuUu3xaCK7OGH
         +QPgVyDnWCLybjCvvGKMrdkAonKuRxiSK1eZ/o+13mOfu7l9u88h9NUskTFjxYhcALIk
         Hfgz5mWPCIgAfr8VX0PmvundeXFGRiHp7aZzut1PsuzkHdaNFFAqkMBDKLCXt/diGLhn
         aNgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Fu8WZCSw9rq+nWAu3QjNg+oQSbeGjyPfxpO8JRfWlX0IjiCLna4TPsyCQxi6rkyOHvUWxzKT5byy1NIBr@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc83s4BzuD6U4f6Zd6phPY33ZoNkd6nPA6txwgwhmhpx4RkTmb
	ZRjMibxARXMUDa6TX1/90FTxmJ7PVYOA+DhQ9HKEtg4/9VtkZaPBxs4R5vVm+hHZ1jOEEc+mtXc
	oDQofdae98rP0nQWM1VR4P2J97vddLyUmGWaugIJVOrPl0pMlu8jL93U8mtMgt2ALjwgP
X-Gm-Gg: Acq92OGdHM+fCNOLLJYVw2Q/Sxr5E1nnFMBmLb0o7DxqVkt3lZ40zWjticw+uGVusZ7
	yXSbqamtDFVVdgNaw+e+cIa/1BVQAXthu1iRzaikU7HoPz8XOEDeqxvR4cN0amXZM3Cs2XaixKW
	pjELlhYemRNRJZ1OP6dOMHLbJnCAzLsS5+f+3MVPTUZBobkTZm2uY08xdquCCQ9plsxR4idaYPQ
	elwBcY8OCF6e/XyWkE2qN7TsRLN7zza41CbBc1wBFBFGi8LyJuKuq1dXFfu8tQLvC48nynGRIfM
	nDvCR8mNNt7mYjaklb6tphMohXgc8st6mdc/wRzkKz7cEfVJweQc1Wz+/ldGM4vRWr+7jWz4dkQ
	1Ml1IPQ4xjAOPRCuD6slOE2WBD9PGQa6BPVaEm76PXfPRotqK0Xz4jznqMOlWj81bj8Rh7AhTFo
	FcScO+xuVwbqvJIsgYuNzPAL3w/PM2scvBP30=
X-Received: by 2002:a05:622a:1f8f:b0:50d:62d1:c3fa with SMTP id d75a77b69052e-5162f422543mr24814041cf.2.1778650780767;
        Tue, 12 May 2026 22:39:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1f8f:b0:50d:62d1:c3fa with SMTP id d75a77b69052e-5162f422543mr24813811cf.2.1778650780289;
        Tue, 12 May 2026 22:39:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955e3dasm3772290e87.42.2026.05.12.22.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:39:37 -0700 (PDT)
Date: Wed, 13 May 2026 08:39:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 3/5] drm/msm/adreno: Fix invalid drvdata typecast in
 adreno_remove()
Message-ID: <fazwegi2tylfxwhndtjyhlrqldhcm47ydszci6qghgxeul7ffh@d5wgtrlx2ymo>
References: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
 <20260513-gmu-sync-state-fix-v1-3-6e33e6aa9b4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-gmu-sync-state-fix-v1-3-6e33e6aa9b4f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: SwYaxCmd0K-xYbVnRJZ5b39fqW4fYsXN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA1NCBTYWx0ZWRfX/TumMO/K6QMh
 ZycGvGq0S1fBKCpBQEdwXb54G+x2hbrqqvC4zYPxwBt4Mzz2V7oW0mPf2+QENtvVEafTl71jXfs
 DjYs9L5n5GyCrUoaWwMl9hJBX8bCF2EqdTkMHtoENL/cwV2Q+bUT8TBjVA/u6Ki/EkjhrWEno5u
 TrO6kKDZCLDfJHKqO+kBNauzehUCTgKZQb1XZV6nbmpwWlnHg/64kM4pa+9pQs4ADyHSOKksSeE
 /KMib/aTvtbYH8fDOV1iC3UP0K7lckgMTPKfY/s4ed6TwPMTT08Vwlr/6pxajC1qHE+V7skYaDU
 n7P4mMnEHWcXPgqHkupAKb0T3l2EViyN4NXxdHM+J6q9eObWspgx5HPfajIbxEQizp8V/T/3gBF
 M3BKhHw1YWPL/cdyPco1uuilQ2j3wHZNDOKMAwVY+EfMH75KHQ8MdogiD5JEZ4ohq8JrMUSui9U
 OHYU1U40JM6PaRPWJ9Q==
X-Proofpoint-GUID: SwYaxCmd0K-xYbVnRJZ5b39fqW4fYsXN
X-Authority-Analysis: v=2.4 cv=Ebn4hvmC c=1 sm=1 tr=0 ts=6a040e9d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=xr6eH78PXR7NwqaAx1IA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130054
X-Rspamd-Queue-Id: 436F552DA17
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107225-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 02:22:58AM +0530, Akhil P Oommen wrote:
> adreno_remove() decides between component_del() and msm_gpu_remove()
> based on platform_get_drvdata(pdev), interpreted as a struct
> msm_drm_private *. That dereference is wrong because msm_gpu_init()
> overwrites the GPU pdev's drvdata with adreno_smmu_priv pointer.
> 
> Fix this by using msm_gpu_use_separate_drm_dev() instead of relying on
> drvdata.
> 
> Fixes: 643515a9cd09 ("drm/msm: rework binding of Imageon GPUs")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

