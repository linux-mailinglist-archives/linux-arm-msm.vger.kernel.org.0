Return-Path: <linux-arm-msm+bounces-70954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F35B3746E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 23:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36DC73B4AB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 21:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8102F8BF1;
	Tue, 26 Aug 2025 21:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAsrtfik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DA52F9984
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 21:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756243712; cv=none; b=DWivi/toEPC3Cf3yNVolyqQNSOa9Dq6UA/6/CcGqjPKjIE4DRz6zoDSLd5gI3+7QU9PGoqgRnYDaL46gVMPxEiXGReTRFd9/6N8DNetr4Yu5yfnSmEAvbhT+1o8OUt2skK6DsRmrdH/vsVDAGT6+y2OZmj5/jdp1GruDDk6GH4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756243712; c=relaxed/simple;
	bh=Qde78mFgh7GtdK1Q3VM3SDoWByRWzJWdWCqZbIAYagY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFqL6H0XQfZGuK5GEz3TiGv/XnqoHyBObxGWfVJ2Ri2kY9yqaXvdqtX58yhvGaKGrqAQdwvojoKiK6YBPC1+R95hV4ZvlvfOnPOIWWOCwMQLruiireyMNkkyqgg1fIzWA6NTrEeTB6cp3Zu6UVFaMea3eCrDRsuhe0kt+5WezHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAsrtfik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QHZign018258
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 21:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=clTRNlMfsTDWnZAZ4jytuHfn
	PZmj1afqUgmhWf7cX/k=; b=VAsrtfik0TLBIkRuI4N3JDmJMS2bvlceUWREYRmh
	/OEntdKy0NOP9cfM4wpFpgHRjOfDyjAXEax7TaYXqo7Zwl53LJHVjsoi/Zg1351V
	2j60JAC8jxgCACiyqinxvR8qgw1pBuMMQAe2OCbVMqzM8p+LyaGHH4xi9s9jnSwb
	013pD8V6GCA9hSJ6ByEIMW24tJG0g6tCJ6b1dfZgHAtizuN+NFteNyrYXxVHQYny
	xy/lMoSUCD30kPDv7FKTGZ1yFVY7MhvOrd8Y+UE041Ch8HN00XqyOd32/0PnbuWJ
	ZmzI75D12MKF3kqE945U7QfgxRcdlfqYNDsF5fT8iKtjAg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x8ag8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 21:28:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109c7ad98so212194731cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 14:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756243709; x=1756848509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clTRNlMfsTDWnZAZ4jytuHfnPZmj1afqUgmhWf7cX/k=;
        b=jYZzUrygNYxslS2NBORH4vCveD59QYnpwxGKahCI5ou+6HuVzDptQCRDl0piOQVwf6
         ahbwQWPNAGKlJInWmLHqlEdusP6uvTzkKfubT64rf3pj9wJRkp+Qe3jcEDV7AVcvzBZt
         INo8QUVteQmW3vk8VTXDpzOP8MJbN5Xv2e4b6EcRrbQ1ryx7CRC9rYR3zP/jfd98Xv7G
         rIV9c3HTlPIhjZEe5UZRrUGzD2oGrc9H/23P/V/BWIUYAZc6ht+6CYY7/ZMxfryqZ0f3
         +1nbnfLU6AcwmAbXpJ2DMaIh1bGPuRCYYOcZbMDa+SsQfaFkGEcjFeZC3FQs3imsWY3h
         7EIA==
X-Forwarded-Encrypted: i=1; AJvYcCXVoNHd4xecsGKcfLxt+BkgRaXrjzil0JGmT6DHrxnV9qJj78wbievfXjTDAF9MJmiTzFllsfgjuDqBdN74@vger.kernel.org
X-Gm-Message-State: AOJu0YzUhW1gfZPZ6Cx3OaqEq4PwBhksgqQ3Y+8Q8+9rQko/zhmI+N7f
	0X+JrScmPd3svHhv+HgBrmxVgrTWUHJFqWJQZdmV5I/QjPlkRsj56xVJ8nu3+CA8UW8qHWCkWXi
	/1agXQ+GXsyW520HMkycJD8FavSd+eiTd6qYFkajqAHqXNqQWlpuU3SYYsH+kIn5GMFCv
X-Gm-Gg: ASbGncsdjxuTykj4cEgkK7G/aWNq813m5NkGHPqgMavErVUPjtyNau9pTWXLQ9UzSd7
	afFVJ9D1rGzgYqHwWUZwCWRLpUy5Gl3HqJCruki5pi1AiScBWETcLK89WgCyMk32eERufpNzD6a
	Qyeidx7OYNkA7+9lgs6cqLNVFxs6LGSF2Xlh5MmbfA8djn/CQ07vfu5uzEgpGQ1yZ2yDVx8/I18
	JkLTxLN0ueY6rwwLp3mUA49sl2klbEXV4lv/RE59IvOe+/yA6G569xsOSxAmvS2JkwyP2zToB0h
	VloqS5onDfSxBPtij6g1CFUEgtAa/ZU7lCZOEjBaC06tKT+W6nXfCJURUVlkQM7JLk3tYKAF23e
	ipDX9D7akxHZUTo1iUW7lQ3FnRNDpSsN0johJX/YBkhRBdRnh5gCv
X-Received: by 2002:a05:622a:118c:b0:4b2:8ac5:27c2 with SMTP id d75a77b69052e-4b2c4d99612mr129989651cf.77.1756243708963;
        Tue, 26 Aug 2025 14:28:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpR67kwi5LVp5pSfPnw+J3VFspElzcvSFuZyuXNRvTjYvd1FyPiBQ8eOYtogA5Vrr61DpMWA==
X-Received: by 2002:a05:622a:118c:b0:4b2:8ac5:27c2 with SMTP id d75a77b69052e-4b2c4d99612mr129989341cf.77.1756243708542;
        Tue, 26 Aug 2025 14:28:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3366fdea6eesm16950191fa.44.2025.08.26.14.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 14:28:27 -0700 (PDT)
Date: Wed, 27 Aug 2025 00:28:26 +0300
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
Subject: Re: [PATCH v3 21/38] drm/msm/dp: Add support for sending VCPF
 packets in DP controller
Message-ID: <irlo6dhfm23b56hojskn5oxwznwmcfpwkbq6zq66o7bhxvq6w5@4qaldcvcwqev>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-21-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-21-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ddCYHl8mpIdc9q8VlQfeOh1faQG6KCrP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX/vrCHMiX6qqv
 DwuoYxi0iWCWCJOVsLf4SbGtqIDM42m95LljDJhwfl6ArYPzUFHsuM5F8kfq7nBJNSH5xrZSv3b
 kIJoKE1tIaDphxcJe36Ls8xZpHawJSW3Hk6/oxtrue0RKKyPEJJwfReW2dzgcUeFNjyn4u7gDwD
 MuDLdJdxHlf6pdSEu1TmYo4cvQ8RPWLw9LpSViHR58HLuBHf9187R3G02h0XrC2LGOYzuF4O/fD
 AROpVrhYNkNyZ2ZxUFOs6oEX+hKYAM0UGMgAiVIjIAGvQoN6PsB2nYDY0K+HKwKyGn8CekXKvLh
 twUvm4GJBaLcRjeFyGryO3X1rTEKBW4mdVl7p+F4bNhUm+To/NnqPgvvIBpkcvEpwL+w1I+zOeV
 T9RxFq3a
X-Proofpoint-GUID: ddCYHl8mpIdc9q8VlQfeOh1faQG6KCrP
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ae26fe cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=abZXHuzVrGm33jVRzXcA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044

On Mon, Aug 25, 2025 at 10:16:07PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> The VC Payload Fill (VCPF) sequence is inserted by the DP controller
> when stream symbols are absent, typically before a stream is disabled.
> This patch adds support for triggering the VCPF sequence in the MSM DP
> controller.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 56 ++++++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  6 ++++
>  4 files changed, 60 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

