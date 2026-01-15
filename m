Return-Path: <linux-arm-msm+bounces-89191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD7DD23A8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 10:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E96F930275A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 09:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DC635B12F;
	Thu, 15 Jan 2026 09:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRr8tM8E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S7ded4eh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D730835B144
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768470063; cv=none; b=jDWwIirFm2D3GNZ8REOi+TRNI012aDyKZ/efZTigMQ+mnLANX+4adqTMiaJefp14oNqVjaWimQHhIINMliv/O0GLtTJUKUGxm4atkChEXsGmSErCEp0Rc53uTo8VqEYMr17R3Ot8E1naZuVBD+fjH4iYxFZeZc1DqVbbzAqBiUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768470063; c=relaxed/simple;
	bh=PwAOgZZfF22QPZkl8zp2U7gYqmDlGNO8OdqN4pMpMUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NDlyKbygMx6V8h/K206ckrj7fSlEFI3HO/rrqYK7goQtb80/JZ1EdNEt/S0mnhdrrwLwcAK9VqZBMrkfWwvtMp3zXT92zy8HvyZVDyE412kdlnwDa8ni7dZOP31D1R4WgBW8hx7diljx4iWoDua0Ke+LpbyFj1y7KcYlmIBiemc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRr8tM8E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S7ded4eh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g4rp1172441
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KZbtfwVixV70GKFxqCodeAZx
	DcfZgnV19oKW0cgK7+I=; b=jRr8tM8E6Zq5i90RJcBqaunvEW5vzSngxpni21sO
	lrRBzI75AufEPEH/TnTnjGDV41lCnDw0yEjeNuRa31zc4rYr8/VELGLojDYoIMt4
	7MF1yK+L6Q7tAGrV56k+k1k71+Ww0RFhhSLjjsGOXqVq1dTdVhwOMlzMNWwsUURh
	7/zjfUmIOrSNwTgWzk5Or76iOqNaUkM9Qs/DGtq6z5RW//PzAv8sIPLcX5zYcrX7
	1R3TLAhMdJFIsETQWo1Oe00yFAB3lcC3Eki+W9O1codPJxEsjKOnhW66oJe3Jox4
	siqX9LzwyCgsRKGhy+um81RDE9FxUjLgGmz2l2TQWnOkjA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpg84advx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 09:41:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5296c7e57so272244985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768470060; x=1769074860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KZbtfwVixV70GKFxqCodeAZxDcfZgnV19oKW0cgK7+I=;
        b=S7ded4ehxbvG1JQGDvGXT/sOXs3ZtV70EPnubqZDyV3zaLkEHteuX+WrU50h/sFc0M
         0KDjEJVuQrvKB3ndHyXPvjvt242jWS8zERlqm+250OKq6Ct01TURKs/B/1/DgVMv1NSz
         WQzRsf6xuTZXFnfEQYie7WgGEBTbHkf20CPctzb6iUOwU0AJ0lXffYirCZwMsQTwq98K
         o60xVuZ8LL+PRL0smV9e8yFrL6T4mA3Wv6/ghhXwakFNboggz48HEOMvHdqSB4Ldydya
         /4w5LsLtnb2F41qz1zUvfym5pEuT3+C0cgp6Iv4knRWkcUvG3Lexq/0qR6tNVTlZsmlc
         Vd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768470060; x=1769074860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZbtfwVixV70GKFxqCodeAZxDcfZgnV19oKW0cgK7+I=;
        b=GNIGxsYvdCd24DHgbFdMI4PiXR3fhRaamoaQ1yLJv7M3MoI1Ts+A/wqwTFE6CfRakY
         0fGpp/efb5sckAOQNS2SvvuDbGhQuNvklZAqnr794uerEsP0KiCpW2qcEy2rQh/aB+Ez
         pGru7s3ao2186xBnOdZADr/34upvc9iZ+TKqtuOac3u5fpCpInDICgFjgE+RoSUlWv2B
         3ECStfvImB92ohHF+gHJFbzctpyptjzeLBU2L1oAsY3qzuajzLZ3Bn2Kdm07eD5IpC+o
         0rECerKUy+DlnYHTql4B0BlAY7lHLym0F4EOD5bT+Hw4fKjy0/VPlE6lbDUyAJQujDIR
         pl9A==
X-Forwarded-Encrypted: i=1; AJvYcCUIha3urxaYzLMzV3QXKYrYt3WvEZuBvyZXnPYd+aOH4Taq/j0RwMWFdpI8Dq5GUd1unjSu/Nn5sMwLhwHn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5dzbi5ctMpNLzQPUXXpj2EUGl/h4wUK/k97U8Dt9rg59fl1v+
	l+NoQU1kCgiPjOkoCNvdcSQKzj2AGgoKmUHDV+DZql9ZhiteSWzfwi6mKkNpAr8JFleJezrX30c
	7TfbQUggNxi3/LVH4AxuTGV6iTCgBGTM4AjLc5EOTFOdbmgKQR2NvDDxb7qCSSJ6lWt5YfChtny
	a+
X-Gm-Gg: AY/fxX6Pnn+Y1SYNHyyDJSr5o6OKm4rMVUnJ4yDeTDoVw61sXQ4KPG5kbg2YmJmGpbc
	7OKe+AN3miTxyYg8uoXFIdXeq69w7uC/9e0RU9LMc5GUHUDMypdo2DzZdpFl4PKygjS7BwMincS
	S7Zlr2wG+yzjadMo4YhFZ+a1RkRtLVoSFsLh3h4p/se2t/qQENUI2WjMUmKGZ1kJRo75QGCSEcl
	DFQDmMT7q5WebL7DdoqfqYxlfFbdYf4ESbAgSRK/QRHSvA05EZYEHsGEMFcdMk5bdsEzYrY+URI
	bqb5DfVhKrNkC/5hgk9jGLZ9qNoN3rP4gfkH6JXhIQI3lQgrx4mPZ12bDF0dbfoiLyzhSYBZwWC
	YgA4iEKtd96YNs4+6V4IMu3v+nPUnpz3VrQTSoM5wOfaKnv5GkH9QnomMULueSxU9RNwK6oJhB+
	ZAagNStUJh07WEkz+h8NKRE8E=
X-Received: by 2002:a05:620a:29d0:b0:89f:19e:46fa with SMTP id af79cd13be357-8c52fb153c4mr792406585a.20.1768470059797;
        Thu, 15 Jan 2026 01:40:59 -0800 (PST)
X-Received: by 2002:a05:620a:29d0:b0:89f:19e:46fa with SMTP id af79cd13be357-8c52fb153c4mr792404285a.20.1768470059303;
        Thu, 15 Jan 2026 01:40:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba101b46esm1544288e87.10.2026.01.15.01.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 01:40:58 -0800 (PST)
Date: Thu, 15 Jan 2026 11:40:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/8] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
Message-ID: <3bygazxh5sabn6jc7m5yd63s6igag2lt3hp46642b2tusxecb7@2zkhof4wr6rq>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>
 <d826de45-f00c-4af8-947b-246362c2be23@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d826de45-f00c-4af8-947b-246362c2be23@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2OCBTYWx0ZWRfXyMylQ7b4iHB5
 Yvffmtjt65K4XUrWzDX5gpWCXau+cLffelZzcpU9j5k4u5PML9GuhjZliqTpynlrXMpTEX8Sp/m
 1buhXNDaHwgLjs7l7dpB4KhEYqK38p1+X/LHswqjnmLGsZF+vIhbSKedB0K53s1lRDlcJcu3S3G
 eSXEH9caFLx+Ps71L8xzNJOn8yfiiUfcc4SqlO8QAQDtI4Um5zadEByNY0moUrWRAZchTH/VXxL
 Wt6eEpAUiJEANxJ5IloBkCmhi9SjbL0+ncWFkopa/44ug8ZQ2FAAVRuSJ05mXPCgfsGCszEyT5t
 AHMtXKQ9WmJuiW20uBno08MQ+qFxOHcQQ9/RpPUlBLBNHt+QbvsHnW7APdAivDEiZiEkLJaZAoa
 CmOGqV+7pDokATKXzx+m8wn67Pn161LbO1qpX0DGjDZujowhXqFsBj0RPEgF1aqaE9L6mGl9vQg
 RSE0BVyZrAlq498xTfw==
X-Authority-Analysis: v=2.4 cv=IO8PywvG c=1 sm=1 tr=0 ts=6968b62d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=riCNDKHef0uOy52QCggA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: og7FhubYEdcbtTa4otOeY-3LzUrrmf-E
X-Proofpoint-ORIG-GUID: og7FhubYEdcbtTa4otOeY-3LzUrrmf-E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150068

On Thu, Jan 15, 2026 at 10:19:27AM +0100, Konrad Dybcio wrote:
> On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> > From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > 
> > Instead of relying on the link_ready flag to specify if DP is connected,
> > read the DPCD bits and get the sink count to accurately detect if DP is
> > connected.
> > 
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c | 60 +++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/msm/dp/dp_drm.c     | 20 -------------
> >  drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
> >  3 files changed, 62 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 5997cd28ba11..a05144de3b93 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -1151,6 +1151,66 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
> >  	return 0;
> >  }
> >  
> > +/**
> > + * msm_dp_bridge_detect - callback to determine if connector is connected
> > + * @bridge: Pointer to drm bridge structure
> > + * @connector: Pointer to drm connector structure
> > + * Returns: Bridge's 'is connected' status
> > + */
> > +enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
> > +					       struct drm_connector *connector)
> > +{
> > +	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
> > +	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
> > +	struct msm_dp_display_private *priv;
> > +	int ret = 0;
> > +	int status = connector_status_disconnected;
> > +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> > +	struct drm_dp_desc desc;
> 
> Reverse-Christmas-tree would be nice 
> 
> > +
> > +	dp = to_dp_bridge(bridge)->msm_dp_display;
> > +
> > +	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> > +
> > +	if (!dp->link_ready)
> > +		return status;
> > +
> > +	msm_dp_aux_enable_xfers(priv->aux, true);
> > +
> > +	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
> > +	if (ret) {
> 
> See ef8057b07c72 ("PM: runtime: Wrapper macros for ACQUIRE()/ACQUIRE_ERR()")

Interesting. Something fun to learn.

> 
> 
> > +		DRM_ERROR("failed to pm_runtime_resume\n");
> > +		msm_dp_aux_enable_xfers(priv->aux, false);
> > +		return status;
> > +	}
> > +
> > +	ret = msm_dp_aux_is_link_connected(priv->aux);
> > +	if (dp->internal_hpd && !ret)
> > +		goto end;
> > +
> > +	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);
> 
> 
> > +	if (ret)
> > +		goto end;
> > +
> > +	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
> > +	if (ret)
> > +		goto end;
> > +
> > +	status = connector_status_connected;
> > +	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
> > +		int sink_count = drm_dp_read_sink_count(priv->aux);
> > +
> > +		drm_dbg_dp(dp->drm_dev, "sink_count = %d\n", sink_count);
> > +
> > +		if (sink_count <= 0)
> > +			status = connector_status_disconnected;
> 
> < 0 would be an error coming from drm_dp_dpcd_read_byte, should we log
> it?

I'd rather not. At this point the errors might be coming from the cable
being not so fun, not settled, etc.

-- 
With best wishes
Dmitry

