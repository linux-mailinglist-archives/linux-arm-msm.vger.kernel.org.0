Return-Path: <linux-arm-msm+bounces-102805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMtrNh+H2mkO3ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:38:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC063E1154
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 19:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E594B3017262
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 17:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917213B774F;
	Sat, 11 Apr 2026 17:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jumy6wPi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ap4Clz9j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4779D1E885A
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775929110; cv=none; b=iNoI5G/JmgC/L51aLNsjW2AVKcz30EG1+xogXK3RiGgYLgwehJovUUHipKvXEu2mNZJ+b1cgDPKjrJ0bq/YaUMMAbUifr+ZniRed2hqk2lj8yJovboaddXrztv0aJRt90FPVXzW3zf2l2VfhwXpEe6k8aO5sFlWRk3iONDzjIbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775929110; c=relaxed/simple;
	bh=NmMIG5XyqW8qSeZUKVyY8YstD6a/Y/dbTSx6a+xwWWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cbxKgwkKCyl87Qh57D52XpDbjLkTjGwsXt4RGW144nTv7bah37QTwoy1GinFwoyAYn3OlSgNWqFZ/eI4IgjM2W0350fblgtOqlMGGJEdwv0PlElP4E/ukxo3EsNGwvKygJ6XcAp6slGMxKCr8asO8KO0w2gH78sOg27joU03K/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jumy6wPi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ap4Clz9j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B9rC8L3327378
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yyRH0qM1t0DffykVpcZOI/IC
	2eDaHpipeVNrbq3xmqI=; b=Jumy6wPit6pM+3mTeJT7udZIbhWGwTL+J4fz7da1
	CbyHoo2AM08l2HwR0tTakPdsv5CawA0v9Y123GHeVfWelwtZH1uk1FeyLPuyW7Gd
	9EONHX1odR2urMwyuXd8x5SfJAbewd+SDfdMV+KTe9O71jn4ilOGVfWzHrUqb71M
	A1GfbVKtkRJnQnerqg+nvN4OKIRldP4GaBz9M+fgVV80cw290DNr6mz1pTd/FR2n
	A+HJIL+Z5+Qctqcru6hW2jJr3AXG8C+4IOvTdd5b90Nb8DN41ObP4DvNaniPxXYt
	tINg/xE9DJMvDiyrArE8A98N6ynH9OOavs5/V8LnRfSSaw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfeyys548-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:38:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d831e8083so29689691cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 10:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775929107; x=1776533907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yyRH0qM1t0DffykVpcZOI/IC2eDaHpipeVNrbq3xmqI=;
        b=ap4Clz9j+NrKZokUSjT2eRdPGiDRB6EG1P5nwnbxvLqknm+J2Euw7saJZ/VyRWUdBj
         9owiGVAj3vfJyXRxE6prUtrYXDvxLWNMBzTfz10S6jN4RqGKDEcOwGx3Wg8yvS6eF7mZ
         b/Pl8LIyY8AoanO82uiLt/+kZTtl7cEft9sLfzZsD/xN1cYP9J56BUW93JW3x0f1ZsST
         A/xoCFKe/2opXEPU0EboLKKOYRezBnW47Ah/zvs+S+2my1KtnYj+k7ul9O6c2mj3FUU6
         LXj0erYdRHFQYPW+02lRIY0gEwuldhoGqJAjIILLJ5UTFTndFwb2RCJm4wLFm5JCr7gd
         yvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775929107; x=1776533907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yyRH0qM1t0DffykVpcZOI/IC2eDaHpipeVNrbq3xmqI=;
        b=YFwRz0VCw98jxjphdCzU54LuX4LSUm+ZXo1KVfRH8eYCLEyVri8tgc5BjDD21YRgYK
         fHWysK/UI7zS7EFdZ1szcKvIFZJRhKTZBApQWsKYRQg3hlbsQXIjRWQM8sLJl3iSynDX
         WYRJoAeG/gA7BQVN0yRjPMtxjHe4E6GyZEyzsDYfEOBUahvdB0sFQDDfXhLATVCHipCZ
         r6WAeSM+fJpiob7gZ1alYF15HGMNL5+oChCBZ5h6GsVo/zFQvqIkhWcHmleACDrKuj2s
         EhyUY2aiaSnlR9QP+4Uo0kyd5ylGLVbKX7fRD/LySdP2YwwvnQBsQA5iT90apdt8PTtc
         wGEw==
X-Forwarded-Encrypted: i=1; AJvYcCUP61HG0ri5rwuLd3eCb/PtIyfyqvwKlOxymZxcs9HbuRPJ3Hkh/E6Kav/jyEVvDFtpn0hYsfxeByDAX+CX@vger.kernel.org
X-Gm-Message-State: AOJu0YyW2t4P72Mddm1PPpBxeWxywFwDZkVhUQyV6r5WoDnpF594rLta
	hKdiEox0Xq+WoVCY6iMTq4EkK9Ezjar1Ke3V9PFyck/j0ebe5iTJvdsONQI3YQ/sXp62yJs6AKA
	rNPi/NOY9fXSef4dsm3BR/PgIWaVhQXPb3p549lUJZF9Xb2NXSbv9mVM78HuU1zBUaw4V
X-Gm-Gg: AeBDieu5snxktonX8bEkSnjV98pUEt92o3M9/pFhaREwJbVakIhlZL1WZcsKfE5gkvE
	hLzu0mmKd7rIsiF8CNvEymf5rFqN+enddVeBEPRcI58h5y//WYOsg6Ej7YpQPaJP3s6T7zYHKsG
	8vIiQZTDaUZdo+NdIn/avn+ba0w5aG074QOSKHnphoCeAo/CMi5Hr4p5CsGD3sFrGQXe0xB3dpn
	ztWRQQitYkzFiR+Vq9xyZM0Bco5q9XPhXSjpYV29f+sbw9TY8uGCsb+YKf2SLZUj0H+u0tRGJEN
	6ziZpJQDk0cUo4tVTJ611i4O3iA3qpGht2tVRSnMg3g40pCnmSYlmChPuHvGv7AUcc1Jb78WqAV
	aj2SG0SI1G3ygnqrLb0TTlMozaV6+Nmolotf5feMwZ0J6EOyWz2U+cZJErW747DHjWgHf2FPY/m
	OccAFbUeFHwGdOJlYlSNLb1qHPNaGByq9tvtE=
X-Received: by 2002:ac8:7d96:0:b0:50d:82bc:d2b4 with SMTP id d75a77b69052e-50dd5b3f2ecmr127480971cf.25.1775929107382;
        Sat, 11 Apr 2026 10:38:27 -0700 (PDT)
X-Received: by 2002:ac8:7d96:0:b0:50d:82bc:d2b4 with SMTP id d75a77b69052e-50dd5b3f2ecmr127480691cf.25.1775929106900;
        Sat, 11 Apr 2026 10:38:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee1315sm1509744e87.53.2026.04.11.10.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 10:38:25 -0700 (PDT)
Date: Sat, 11 Apr 2026 20:38:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 08/39] drm/msm/dp: allow dp_ctrl stream APIs to use
 any panel passed to it
Message-ID: <oughavmmvruhnehdpa4e3ptigcb4wndugxazhoeg2yed7ubvgi@aa7wtrz5s6mx>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-8-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-8-b20518dea8de@oss.qualcomm.com>
X-Proofpoint-GUID: Aibu0QGMkDsMxpKMoEjyZb_syYPFHvUi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE1NCBTYWx0ZWRfX+moTp9jUcAyY
 U2zZdWsAKni1gc76R4zx7VDxUbS4h5UGrRK+Pzas6q2QprB+eRodogR6wsUFYv5HgJemenGQnSl
 6koFelGxW5Q/88lD+TQIYj40WNt+8h7ykhgqmf3a+YELepGRc5vdhv0mNhh617lk37Bcdje4dlz
 Vr3AygHUIyPjyWMk5YP7U54RfpUpU1VOycORIsPcPKx3yx+R3gdpybPNIlWy+HsaqCyKffdetg/
 4LGzHhzV3gyVyx0n8kyF/l+ijaJ1eKfr5dCuweU1KLdv1GSfzaqoDK8mMZJm+gtu+UWVVRfQyaM
 rBe60HPKRPjP+BeDhv1J6oPjr347sPCTFXKLOsShamE0vzT1FROlYmgf7OHB32d94aNtLNayBTq
 XHNEZMDHTuvh6gvxgoQfA9LjF8N4F4nq6nbV7AA2QT5X6Le6ffx/O8gnQIaUgoVTp/k1/6p7+hh
 X9kXeqA7EcXkRzLmcPQ==
X-Authority-Analysis: v=2.4 cv=FPQrAeos c=1 sm=1 tr=0 ts=69da8714 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=hUxYLGb64pCA3aMMaCQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Aibu0QGMkDsMxpKMoEjyZb_syYPFHvUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110154
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102805-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3BC063E1154
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:43PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Currently, the dp_ctrl stream APIs operate on their own dp_panel
> which is stored inside the dp_ctrl's private struct. However with MST,
> the stored panel represents the fixed link and not the sinks which
> are hotplugged. Allow the stream related APIs to work on the panel
> which is passed to them rather than the stored one. For SST cases,
> this shall continue to use the stored dp_panel.

Hmm. Why? Can't we get rid of it (in the followup patch)?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 21 +++++++++++----------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>  3 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index cd58968d4e14..d0eed8c7df45 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -477,13 +477,14 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
>  	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
>  }
>  
> -static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
> +static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
> +						struct msm_dp_panel *msm_dp_panel)
>  {
> -	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
> +	msm_dp_ctrl_config_ctrl_streams(ctrl, msm_dp_panel);
>  
> -	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
> +	msm_dp_ctrl_config_misc1_misc0(ctrl, msm_dp_panel);
>  
> -	msm_dp_panel_timing_cfg(ctrl->panel, ctrl->msm_dp_ctrl.wide_bus_en);
> +	msm_dp_panel_timing_cfg(msm_dp_panel, ctrl->msm_dp_ctrl.wide_bus_en);
>  }
>  
>  /*
> @@ -2523,7 +2524,7 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
>  	return ret;
>  }
>  
> -int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
> +int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
>  {
>  	int ret = 0;
>  	bool mainlink_ready = false;
> @@ -2536,10 +2537,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>  
>  	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>  
> -	pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
> +	pixel_rate_orig = msm_dp_panel->msm_dp_mode.drm_mode.clock;
>  	pixel_rate = pixel_rate_orig;
>  
> -	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
> +	if (msm_dp_ctrl->wide_bus_en || msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>  		pixel_rate >>= 1;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
> @@ -2571,14 +2572,14 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>  	msm_dp_setup_peripheral_flush(ctrl);
>  	msm_dp_ctrl_config_ctrl_link(ctrl);
>  
> -	msm_dp_ctrl_configure_source_params(ctrl);
> +	msm_dp_ctrl_configure_source_params(ctrl, msm_dp_panel);
>  
>  	msm_dp_ctrl_config_msa(ctrl,
>  		ctrl->link->link_params.rate,
>  		pixel_rate_orig,
> -		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
> +		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420);
>  
> -	msm_dp_panel_clear_dsc_dto(ctrl->panel);
> +	msm_dp_panel_clear_dsc_dto(msm_dp_panel);
>  
>  	msm_dp_ctrl_setup_tr_unit(ctrl);
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 5d615f50d13b..32196e97cbe9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -17,7 +17,7 @@ struct msm_dp_ctrl {
>  struct phy;
>  
>  int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
> -int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
> +int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
>  void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 58c46d5ab4d8..1bf1335712bc 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -666,7 +666,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
>  		return 0;
>  	}
>  
> -	rc = msm_dp_ctrl_on_stream(dp->ctrl);
> +	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel);
>  	if (!rc)
>  		msm_dp_display->power_on = true;
>  
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

