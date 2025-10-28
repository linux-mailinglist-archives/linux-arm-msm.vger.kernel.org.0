Return-Path: <linux-arm-msm+bounces-79294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F7CC1706C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB87A1A20019
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 21:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8EB3590BD;
	Tue, 28 Oct 2025 21:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OstP8fKM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MPQK72h3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D687F3590B3
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761686798; cv=none; b=apvDi8ZKFS/m4ASiLotS/p2AAV/2sAK1Sb4dcCgB8yM16byWqhMhpRFsFvp4FgjztnN157EH4R239/vCKf/6+EsIbaPoVc7M4RFMI8YvQZz79qF/y8PCLrvshTaX96KWjV1cp39XdCXFM7RKuM2rkWuAaZofEFaACC3/oRejb6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761686798; c=relaxed/simple;
	bh=PX0MeDsoigCBZQCBcVCwvWH4qF8r8NfW03sJjjwPMSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MsPW8n4BSgyw3WqRx7UnkUCXWvihmIS8OXdoOdZCtTmFYQ0SQE2SvLUEz+YLuyL1OvRH/9SmITgAP9RIWmRsMn5H3arRqINtqS2d0GjrcE561ukNrcbPBFdKTdV/R7rNobV+60HJHN0qsuwoLOU5WtPJI2TARdqXTyqC++Q95Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OstP8fKM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MPQK72h3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlUDC2575509
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vb6dVEBF1GsrTqvUi/V9O4Oe
	gNy8kFowkn6bq/8s4Qw=; b=OstP8fKM1OdJjzrC0fYc/V3QRu5HUJQJ6KPqVswF
	ZtdSTSs/dDuwJIrnG+kRESf2fAKb9wWMO2b/XI3bKWanEJTdG8c5bN3w5sZJ/LOH
	E5IWqEuV2AfPsGKvo81T+58eFaL/kfwmbZ+jc2bEZTC/B/fJ9OCwIVL3d0uTsb+1
	/g64V2YyWY1MYpHnwyr6UYLUx2Qt68tqUa9yj/5SirENKyq1jmkWysLOS6HrM7df
	No5LbEWEZsax5CBhwg95Q2911BPQk8LqX6pnVKTESI2ZTaF7Bd3733gwpOnTwx6B
	eW5iHNpmIoMVftAuHVh1a8PzlMfWEGf8BvBdujcjwps4ug==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a207p3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 21:26:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8916e8d4aso140528811cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 14:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761686794; x=1762291594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vb6dVEBF1GsrTqvUi/V9O4OegNy8kFowkn6bq/8s4Qw=;
        b=MPQK72h37cDSSD6veEcrF/PQrAEKtXlebeAL6A14NcnYd1WLscJC0f8zjnpLhKLyBt
         I7y8k8SYawTtx3RyV1NMFJD5qpNNba9GfclFcTusPuccVp+OWxUvILWV1Rt4ZTqDJJpd
         cWT/X40jhmGxIIn+A6uzRkCqnfnPmmoG8KoK2m7QFmDg3tV1a3RTlNGWywohI1DovA89
         U6XIsrv1ECMAFdaOlx3swJtKl25p2YL6XYZA/7A63GIevzX3RBzkouWsYot78/yiCXf+
         7yFU370Ey4D1UFDa578F928E/HcPY7rvNz+EVaXS/5m024HBzFkSZktXUiCzovwRV7cB
         zDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761686794; x=1762291594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vb6dVEBF1GsrTqvUi/V9O4OegNy8kFowkn6bq/8s4Qw=;
        b=BPonEyOyXOUlWXiDMSclnod1p11nksolB+SZUs268JBI1rCmbX8uW4ChaAi0+GHESk
         WiUJCXb4ygRQITx/fZvo/pmQLRpPZlQQktAZZW1PJ3O97w3Ii9/963qtCTKhmaRjMzBG
         rq4nPf0+iCqqMyyvt5P+NZOeg+EDWKcpRw0NjxnwXWpb2Zd1nUpSKiYg/KAj4bpaz9N+
         ht+aene0bQOeDLFJv6POGT7ehzHxCDQFuPp0EFxLdNsxY8h3oEKfpZPsdOGABldbwXCI
         G427nt/A57U/GFKWu/gAUyqCxeSru2uCahJ7VHqRlX0MAgjtykxtzSe5EVI3f7gxJDUO
         Z/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXn23kNU92OsXShioR6KiUfk8+ZTwQFknXjJb/GH+k8S3RnNljEIweROX6EgLtomjnV/YseY8S+RneK2unK@vger.kernel.org
X-Gm-Message-State: AOJu0YyHyHdhL0gaFPDFeY0cG40bOxnTB8mfgKZ99a8f9IPKF0rZsLXr
	kHWyFbmezReIhgYwJ2XZO5FrDGqMB9CBmPX+v6xm7u88S9lx8UgdQAIhBtt3Buq/Vrxms9qbnnP
	sAfiKJP+W13Cv+GSncmnmaxRBaT56AYaqq1HhKhgCx/faqV8eKWZWfLr6nGyNp6M9mehx
X-Gm-Gg: ASbGncs+lKLx7RM64TgHyVe4x7V8235g4sui4MBFyCG3kT99ckWs2wq03zYL3iHKwt4
	A/N6Vt3i686CJdStcTpOleugC5g+rAKGguIS3fXinV99TiMAa2AK1nbuaSCrxrhyZuypSrbk5X2
	la9GaPq3XOsXJMoGykTDGPNqrXN+mcg99APgFVy0hYNfGzJdIwJXu5SEiEo7nF6mnz21wB3NbbV
	obouXq6Opx/sUfdW0fpGxxSyQi3UX7tojN4ozyZh2P++J18qRAMoQ9gvEP9KA5wPfcd1rXAlYJ1
	i00FM8/wNB4CXSE1XrGme5awrXhqc/fwZGhx7pxWhGUORBMCTAYx1yRIev1ydfR4A07tJdOcQO2
	FLD/L3UgRFtuLmvlnlRJYME+yTJlqd9K/DTI7IHjZhh2WmepDyXDozLwAVPbKA7we6G83j7FV6q
	i080jn+nQPs+N7
X-Received: by 2002:a05:622a:1105:b0:4eb:7807:1816 with SMTP id d75a77b69052e-4ed15b5ab08mr9646281cf.35.1761686794444;
        Tue, 28 Oct 2025 14:26:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoc7W3OAdXR6z0ZRmTUyu9evmiDq4dbWddJKVeKeXcDDjGijRuSjVD978ICY7up4qhMEzYew==
X-Received: by 2002:a05:622a:1105:b0:4eb:7807:1816 with SMTP id d75a77b69052e-4ed15b5ab08mr9645881cf.35.1761686794002;
        Tue, 28 Oct 2025 14:26:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f864aasm3284263e87.109.2025.10.28.14.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 14:26:33 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:26:31 +0200
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
Subject: Re: [PATCH 5/6] drm/msm/dpu: Require linear modifier for writeback
 framebuffers
Message-ID: <6qev23tgzl3b2nkxgxgjkgd5tjljop37zhfm64unla46angtek@2fychx75wsqy>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
 <20251017-b4-dpu-fixes-v1-5-40ce5993eeb6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-b4-dpu-fixes-v1-5-40ce5993eeb6@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4MSBTYWx0ZWRfX3mAC/3Tok5wl
 EPc7Qn9Db2SX/1RpFKCP5TF+g10vFWCw589lpzEuPYAiEsUZjQ9YOymRC/gdGmyjmhnAQrSLhRU
 fCG100veq91+XYbCOhFLRQx5HvXOc++Dlpsc2/76zBU++lFUN0jcwkfft1qjdwGx2sjAEB/+EYw
 dwdjZeoEwGGjodmiFSr8ztm18iPCIixIJ/ZXkTkrzHuRegnsZIAqW9Yt6Ob0CPT3KQBaeoyBpsh
 3JtvuQtjf/zM7ELVTjxMBEyVDYP5ZLDJqMBx9jRkU/xDyLbbv0+VchtQjA+cYRT/ggcja7JxZ2j
 NZTigGpVkujrDN1h+xhDOeFLGGIJENpbY9fvHWVgDhUUBGOAWjgDqP0L7PKfO80XSky4mjFCqOY
 eSDj/LU3fVRwLGfvyZeQRCXP9+qK0Q==
X-Authority-Analysis: v=2.4 cv=V5ZwEOni c=1 sm=1 tr=0 ts=6901350c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=AghEqMNuFSJYpPmXAAYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 7rtocfAwCYdraxlnGhuKDdlGM8Y8ad4p
X-Proofpoint-ORIG-GUID: 7rtocfAwCYdraxlnGhuKDdlGM8Y8ad4p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280181

On Fri, Oct 17, 2025 at 07:58:39PM +0000, Vladimir Lypak wrote:
> UBWC-related register configuration for writeback is not implemented in
> the driver yet but there aren't any checks for non-linear modifiers in
> atomic_check. Thus when compressed framebuffer is attached to writeback
> connector it will be filled with linear image data. This patch forbids
> non-linear modifiers for writeback framebuffers until UBWC support for
> writeback is properly implemented.
> 
> Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

