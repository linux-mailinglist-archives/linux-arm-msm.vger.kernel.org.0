Return-Path: <linux-arm-msm+bounces-68155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3374B1F1EB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 04:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36C5E727B97
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 02:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D777275AF4;
	Sat,  9 Aug 2025 02:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IQtr0TCA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA24AC2FB
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 02:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754705699; cv=none; b=aHAXcj25JmJKNkPHHBhvVhXZjV8CGFNcdOjMyrgo09Q2S/wkdkEyDMzbBJygDsrqwcF6RYRb/k/pbBMlgAPn8Gub0/Jl/1ZOMhQGN7ZI6rlLZiOS7pIcB7/MzGMDnM3RIqq5dabith6D0Vx4KDSuEwzioKYLeYL0lvekkZypU1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754705699; c=relaxed/simple;
	bh=XEHcXFeB1JLeJqc5dVktvb+4u89AId7IC1+S2hcUAzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kUzM0ItsxPJG8oRZBkv9p1h+tFsrv85H95eJu1FN4Kg2tZoMnT016uxs6py4Dz6982m3KUV3PWFD6+Q1CLz/DD9Hr16+GM5ZQdUMvhxZKxoiPBoI3+m3ZGi92J3a35K1J9PzhjKefyBk55/EsJdwsFtTX7E+FYCBIPGrZrv3480=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IQtr0TCA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578EtE8g022513
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 02:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d8V82vBwUz1mJ+IWuJuo2vsL
	/UFk1BqGFbx/Lzd+kf8=; b=IQtr0TCA51V0mY2vJcxwuMa31dpLyn09YQndPGAQ
	A3OZw2KyvMcC3QdCOOdDXibEQxO/wXrJJj8VRgTI5TWUWVdYXemWlaTHCzX2mKg6
	/ZjWguNe9BwlAE1Px+zzEFmMqGkR1XNgIW21jEzqW9djN8Ql3kSYOcwutgptrdj7
	H70st6UGLQtW6HLcv/59csvO5g6Oc04FoSNDjT8QYi9JCqerP7a6Mf8h29z3CyLD
	VxR0BihDXoNfq97n6fbtlupB6eiqIXajqC9wctCo7rjXN9v5k5B75Avnb9/NMAlT
	g09B6ofPria46uQ0aR+OScIKET3vdp2HhF1NRy3Qg8OXQg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cs5ndxvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 02:14:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b0b507d014so17962401cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 19:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754705695; x=1755310495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8V82vBwUz1mJ+IWuJuo2vsL/UFk1BqGFbx/Lzd+kf8=;
        b=rHgJuC53LfZuopYfHvWN1Cw8V3l6I6e2UKHyIK5WBcid2QDBdsi471gFjyM5SCyhHh
         MB4yExLefF619UVo9yoe4paxwHKN/lWoIqGu9DMbEfp32iD737FqFn+PjCleCw++oyE0
         TSCIiDXP1CU0PVJRG9LYX+EwAxprrDJtDdS8A64faFFyS04k9q8XB7WNGZmu95dTrQ+K
         k9nIMAtQUHQWKi+zxlGIliB4Ig/oNKGouGV5SLj6+Hftbu3zJ6hPmXKGcvPxDgMhvGqV
         ZMAEUTkBkZSRa5pQZPQaxHifhvqndVi21f175xdy7QM5FXoWjwN6ORMxrlWQmPZKpX5U
         Jorw==
X-Forwarded-Encrypted: i=1; AJvYcCXjC2Lz0V5fRtWOyrEFqh8u8YjJjptxBfKJdxEE44nimqqitP7MZ16n3jVPNGLcYAuFtnk118qkP1fobb6z@vger.kernel.org
X-Gm-Message-State: AOJu0YyVcZuai+KSvrAb9FtZEJ3cmtCwkO9mklq/dfeGdPpcISvXyE7r
	e9tWbtY6cOVmthYR8f8i51fRMp9jQJHqjl/Y38N03+Hbb1zYObgv0XhZxSYYK7bVqRpcBlEBNC+
	+W/8I/imYxIRnAoLj4xo6yEfNvmp20LVp/h4frLPHMoTZ/0pxMzIvgo/LIqrcpueYcx/p
X-Gm-Gg: ASbGncsMnmOQ1GBC1uQiJaAIovZZwXE+JLkpM0BhV91oVibDEBQYKOUuvFD/KUAGpzs
	v590Qxy1LLeUWRvdj24rIbguLMwUMNVdgP72VtTH4P9TZzBe0BBWOG0kd/tqIjO33ywZPgfZtYZ
	UnyQZasy4czDDp8Mlfaa2m9QbnAmHr21XxopUtftPwmt+3fw35rVAQ+k68LQoJ4O0OWLy8A+6jG
	j9Q39kxXIoGcl3FZjZZVz3F532xU/L5Qwc56pQA1b4LMxKhnWaApwsuFNMikxXWB+yQ91uOifb4
	QXeA02sSYjEqrd3Sd9SoyGwPTl0mN5iWGW3HPswtOHia1qOnyDlVw6CLxovbsXALbSMy3nRJWsR
	KA5YMYdwSXVZ4r38JyB6+g74YjUcb/Q/Y6YBgyfJAxffsM6jDTSFN
X-Received: by 2002:ac8:5749:0:b0:4af:1f61:7d39 with SMTP id d75a77b69052e-4b0aed21313mr106146021cf.29.1754705694674;
        Fri, 08 Aug 2025 19:14:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5aRbQ/NlwN7L7iMrcnkgPVM/w6fIHpvroCwE+0c/uE92MdaewoP1y/ibErVYY6x3kEp26cA==
X-Received: by 2002:ac8:5749:0:b0:4af:1f61:7d39 with SMTP id d75a77b69052e-4b0aed21313mr106145681cf.29.1754705694224;
        Fri, 08 Aug 2025 19:14:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8899f897sm3194466e87.49.2025.08.08.19.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 19:14:52 -0700 (PDT)
Date: Sat, 9 Aug 2025 05:14:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v2 05/12] drm/msm/dp: Drop EV_USER_NOTIFICATION
Message-ID: <ykbudesvb2ya2gbtgbyrcn5niesul2bnpfsrl2hourpw56zwdn@y7kmcd2ejwxz>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-5-7f4e1e741aa3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-hpd-refactor-v2-5-7f4e1e741aa3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Q+XS452a c=1 sm=1 tr=0 ts=6896af20 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=93MD9rSA5G_0oRVq-qYA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: hs4T8cLYGL7Hrl-YEHE8APut6GwIOzv_
X-Proofpoint-ORIG-GUID: hs4T8cLYGL7Hrl-YEHE8APut6GwIOzv_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA2OSBTYWx0ZWRfX6eJik0CZ+E6m
 G8FP/ufS5x5K8XrkK5Uu21kPXr60L+KLkOCX2Jg1UjK7HtW/KG6y0sf9NUFyvbsy+cfoIWZiWK+
 1Sak7kpHfgUWOfNjDU7Ki3RCUZb7E8Ige9WzBbIPZnMeptsNq/X1c97HlihGmxSxv53gVrO1gMB
 310KXXbh+T7C8VIEP6QcSRHKTJLs2PTPQh11/matXyN4MnTlRZJeYHmxlA64pRa8NkohHCXmaQT
 RX+G7ruUlVnlymEUaxcUjuVPMNQxkLs/pthwIx7dvMQqaujSvv5rnBuRF7mOaCShnWb56DWqjmk
 sR3Nd1CKoRfSdWRU6Wsq0IOlMLVAghmxeB92bfYgEE0dKO3/bLOlaZloqR7RR04PFbX/iCvB+4H
 ZF//MMZh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508070069

On Fri, Aug 08, 2025 at 05:35:17PM -0700, Jessica Zhang wrote:
> Currently, we queue an event for signalling HPD connect/disconnect. This
> can mean a delay in plug/unplug handling and notifying DRM core when a
> hotplug happens.
> 
> Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
> handling.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 

This removes serialisation around
msm_dp_display_send_hpd_notification(). This means that it can be called
this function can be called in parallel, so we need to add locking
around .link_ready access.

-- 
With best wishes
Dmitry

