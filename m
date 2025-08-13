Return-Path: <linux-arm-msm+bounces-68989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7C4B24A86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 15:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FA4C1632C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 13:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711522D1308;
	Wed, 13 Aug 2025 13:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXVT3Q6P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AFD187332
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 13:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755091276; cv=none; b=PF8HPzXs9p0QSwU+RyVv1S8vO6YhYG69jtQDgFzlQvNk21kpG3jZWYVaEgw0sISkZag0McG9SWQCMgLJQN+7qZaY7v5/FCZw45ALlQp8rhHdqDrU2DvGlOYgLQ2xDmuADI7ZISFZ0mmh6m5pZTPbBZYd0x5WyGOI40Vma8kq8TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755091276; c=relaxed/simple;
	bh=wMAWaymQ5G6nK0yoeQsi8j3VBb1ytrLfhPtmx/Aq1Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7xzSvOksVHks4nywDZv5rvMnoCbTk3PiEU90z+uAJtOtlQ++k6mzj6AwdTnyEr9uOjI/nh6plzMnvMae9alzVrTPbOd4EvVfqLNbm7BifviTUIjuQIrx9ZgY3n1op48ehoLHnsvEdCrJ79P2NXZMCkJDMqfHD71fX5zNGbt8Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXVT3Q6P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLgUx031974
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 13:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Tfp9cm/j0vQaoGGxkHI2V5b
	XcUTdHOp4xCqrHRWtts=; b=NXVT3Q6P87PXgaugn+Ofs4LdmifWzzKNZTlFbITc
	9O8UQXRHKkAHO1hiaMC4NRecGfamyWu82KEOm126G5LLIzkRSCdKrmyTX/0Oa7Jh
	HptNzhrdBtxOovTzrld9wRHROx8vlDtlMW8fhEAy1GNiNZZGCaYs8nOaighi+A/C
	jvRPRb7dHtoZoAlQPtj5lpo4YdSDxmxeuqj9TzLx1dBCJmq8gu3MUAssuGHo0OJX
	EYl9Ur/eHu7ML/Ge8kmoiGz8hKvtlu92UeUfO75xBwTycI7wQoIhmrUIBNLsWsrr
	+4R0s0XfRllnX0ZWNzMH/c32YCfhHGwCKU6m54YpjEJ30A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4fuv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 13:21:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4af210c5cf3so264286911cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 06:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755091272; x=1755696072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Tfp9cm/j0vQaoGGxkHI2V5bXcUTdHOp4xCqrHRWtts=;
        b=tiASb4wVlmm43kuVax9qahWE5RlHKCE6CFpc6IOHzFw+4e8AZS27/aiiytH6UXd4O4
         LQqKuGfJLcyPFJMKGBL8dj5Hzr57mH085UQTuWdhenrWk5Q4DVfq63PG4j0KzCqc15Xn
         8vyZ96pddCJNJDA5TBVK7KXO9EBfwXud+n1asLNe2L+a49BcdSWCbJ1vURwucde374gq
         fW+pyWt7S997lFs3qu8/E6bPLHgiYpElFGs5uAxlu8/WsvQo9Ss+yQ9D13j5+EFV3SqR
         UEUtPgLMBXD4a1fXmE52YCu7T49W5iCqnss0ttrj4oKirsgwrwhOWGVJ6RIMmt9Zg5ZV
         EENQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMw4h/DI2Pgyqkyk7txAP4WIX97xRgveervmMml/8RfVhkhFGKzdxLm+4lbB5q2lCMVv4rR34DdK0rn5QU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg8QZ3l5CBCtVRslaGGFZhBT8vatyBWy74aQWabazQ6xPnEbax
	yAcDNF8ztYONg0W8gL4NmHlRn2zZmtcvy06QR53dIc6rb0TYIE0pJpEqoB1RpfjbD+SNOjcJZef
	BFfpB0s5Q4a5uocbFKS5VQ+XBKX+UyKfe6bCFqr+TaaniBCt3+5GuoaZsH87TQK+DQ61C
X-Gm-Gg: ASbGncvJiaBIbl8luf4qfpPYY1drpcAPFef7pftDQxddVBnpvlb9L6mgTPuRrFXAnZa
	HG1W8aYRkNmYPKnWcu8cpyfTs63wIBEds5RpnPn/LPu0wBLhCvQTFdI0hoNsCtUU+1k5byq8Bcp
	L86l+7a5pzIEWpg7Zf2z4jIEp7Kf6+81NtZ4qh/B4yqjXIxp3y9BeegLzUmN7DfpRuzNXrYa/nq
	JJnQSLyKyW6C2lOTdL/g9YpE0IA16ArEXNsDiB+T4AN74+9/39Xi+JaoHgj3MIEFM9Voh8kyKu1
	eP8E+j5FSvb9ZkZgRLTG8zji4dIliVJnoBxwOEWEdSbqDWdfbijngmXt/KqFEX0cAbKz3OivuxP
	DLItLOWRteJJTeuYfjfvgJrIufX+PlSEhtsBrGJ5F9Frf4ybNPYQL
X-Received: by 2002:a05:622a:1e95:b0:4b0:da5c:d1f8 with SMTP id d75a77b69052e-4b0fc86deedmr36859441cf.57.1755091272135;
        Wed, 13 Aug 2025 06:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFatniPO3tMmPsEK4QYjJL8ObC6Yrn45NSDJO2pqanavZEpL4QtsS5JaYMLwWW5MJxZeK8qJw==
X-Received: by 2002:a05:622a:1e95:b0:4b0:da5c:d1f8 with SMTP id d75a77b69052e-4b0fc86deedmr36858841cf.57.1755091271531;
        Wed, 13 Aug 2025 06:21:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55ccb631ccfsm2035826e87.150.2025.08.13.06.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:21:10 -0700 (PDT)
Date: Wed, 13 Aug 2025 16:21:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 06/38] drm/msm/dp: move the pixel clock control to its
 own API
Message-ID: <hqz6b3cd72kjeceau2te4rfruwsxqancp7qh4f3fgi4ifyap2b@5kxwsj3mc7ix>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-6-a54d8902a23d@quicinc.com>
 <5b2lpjd2raqmowi466avustasdjsssl2tjwogd3ixjg7gi3dxv@cqtkbtcijnlc>
 <552ce804-1aa2-48ca-a68c-8a98621e7363@quicinc.com>
 <x737uymd55glqazjct3aoskfdc3wszuslobjjoyx6r6zmzju2v@vjj74a2bfrn6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <x737uymd55glqazjct3aoskfdc3wszuslobjjoyx6r6zmzju2v@vjj74a2bfrn6>
X-Proofpoint-GUID: 6PU3yC6vsqoet2aG3kCFuBIUr2ObO7Vy
X-Proofpoint-ORIG-GUID: 6PU3yC6vsqoet2aG3kCFuBIUr2ObO7Vy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfXyAO+LzHbggkQ
 5n1UGOTwcn3G1hNUJUG2VvKuWicb3svvDLBdpudBDwkrvp9PajWLJLXFORC+r/Tw1jS/E55BJDY
 kRjMflKeB6VUsd/noek1YX0wjlorEGj8ICJu96+yax8IHIfyxmeohAfRkxxc86Na/Rhiy30ii5Q
 fzaKje5Es0F/aelghllpXkjWQFWAFg0Dk/94hU5yTwrCsibpku7oJjfiApzZX5hf7GIcySGeT1a
 h+xy+wsRAFI6Ue0l/XlB1OPLZ2FGbeIYhFF0sob/fYK42j5AlIIlI8YHwhXRwO7X3sxc2kD9oJ4
 s8NzXEIoGW0CZiBhmNmJId/Bb2DWpzqWyLNKzVWmPZrtOUPRbCoHTUGDlKLCAnnwAJqm9FWBFLz
 OcU94Wtm
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689c9149 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=f0938oLFc8w2-2QPmxoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

On Wed, Aug 13, 2025 at 04:05:59PM +0300, Dmitry Baryshkov wrote:
> On Wed, Aug 13, 2025 at 07:56:41PM +0800, Yongxing Mou wrote:
> > 
> > 
> > On 2025/6/9 21:16, Dmitry Baryshkov wrote:
> > > On Mon, Jun 09, 2025 at 08:21:25PM +0800, Yongxing Mou wrote:
> > > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > 
> > > > Enable/Disable of DP pixel clock happens in multiple code paths
> > > > leading to code duplication. Move it into individual helpers so that
> > > > the helpers can be called wherever necessary.
> > > > 
> > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > > ---
> > > >   drivers/gpu/drm/msm/dp/dp_ctrl.c | 98 +++++++++++++++++++++-------------------
> > > >   1 file changed, 52 insertions(+), 46 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > index aee8e37655812439dfb65ae90ccb61b14e6e261f..ed00dd2538d98ddbc6bdcbd5fa154fd7043c48d6 100644
> > > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > @@ -97,7 +97,7 @@ struct msm_dp_ctrl_private {
> > > >   	bool core_clks_on;
> > > >   	bool link_clks_on;
> > > > -	bool stream_clks_on;
> > > > +	bool pixel_clks_on;
> > > 
> > > As you are touching this part, how many paths lead to pixel clock being
> > > enabled and/or disabled? Can we sort them out and drop this flag, making
> > > sure that the clock can be enabled only in one place and disabled in
> > > another one (hopefully)?
> > > 
> > Here we only have 2 paths to enable/disable pixel,
> > 1.msm_dp_ctrl_process_phy_test_request 2.msm_dp_display_enable/disable.
> > both of them are in pairs. Maybe we can keep this state to make it easier to
> > access the on/off status of each of them in the case of 4 MST streams. when
> > we get the snapshot of the pixel clk, we can visit here.
> 
> I don't think I completely follow the MST part. I last reviewed your
> patches some time ago, so I might have forgotten part of the series.
> 
> We need some refcounting or state processing in order to identify if
> there is at least one active stream. Only if we are transitioning from
> the full-off to the at-least-one-on or from the last-one-on to the
> all-off we need to toggle the pixel clock. This means that we don't need
> the pixel_clks_on flag but some other kind of variable.

Oh, I'm sorry. It was about the pixel clock, not a link clock. But then
I also don't understand the MST case.

> 
> Note, I might be wrong here, please feel free to point me to a patch
> which handles that.
> 
> > > >   };
> > > >   static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
> > > > @@ -1406,8 +1406,8 @@ int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
> > > >   	ctrl->core_clks_on = true;
> > > >   	drm_dbg_dp(ctrl->drm_dev, "enable core clocks \n");
> > > > -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> > > > -		   str_on_off(ctrl->stream_clks_on),
> > > > +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> > > > +		   str_on_off(ctrl->pixel_clks_on),
> > > >   		   str_on_off(ctrl->link_clks_on),
> > > >   		   str_on_off(ctrl->core_clks_on));
> > > > @@ -1425,8 +1425,8 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
> > > >   	ctrl->core_clks_on = false;
> > > >   	drm_dbg_dp(ctrl->drm_dev, "disable core clocks \n");
> > > > -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> > > > -		   str_on_off(ctrl->stream_clks_on),
> > > > +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> > > > +		   str_on_off(ctrl->pixel_clks_on),
> > > >   		   str_on_off(ctrl->link_clks_on),
> > > >   		   str_on_off(ctrl->core_clks_on));
> > > >   }
> > > > @@ -1456,8 +1456,8 @@ static int msm_dp_ctrl_link_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
> > > >   	ctrl->link_clks_on = true;
> > > >   	drm_dbg_dp(ctrl->drm_dev, "enable link clocks\n");
> > > > -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> > > > -		   str_on_off(ctrl->stream_clks_on),
> > > > +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> > > > +		   str_on_off(ctrl->pixel_clks_on),
> > > >   		   str_on_off(ctrl->link_clks_on),
> > > >   		   str_on_off(ctrl->core_clks_on));
> > > > @@ -1475,8 +1475,8 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
> > > >   	ctrl->link_clks_on = false;
> > > >   	drm_dbg_dp(ctrl->drm_dev, "disabled link clocks\n");
> > > > -	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
> > > > -		   str_on_off(ctrl->stream_clks_on),
> > > > +	drm_dbg_dp(ctrl->drm_dev, "pixel_clks:%s link_clks:%s core_clks:%s\n",
> > > > +		   str_on_off(ctrl->pixel_clks_on),
> > > >   		   str_on_off(ctrl->link_clks_on),
> > > >   		   str_on_off(ctrl->core_clks_on));
> > > >   }
> > > > @@ -1737,6 +1737,42 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
> > > >   	return success;
> > > >   }
> > > > +static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> > > > +	if (ret) {
> > > > +		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	if (ctrl->pixel_clks_on) {
> > > > +		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> > > > +	} else {
> > > > +		ret = clk_prepare_enable(ctrl->pixel_clk);
> > > > +		if (ret) {
> > > > +			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> > > > +			return ret;
> > > > +		}
> > > > +		ctrl->pixel_clks_on = true;
> > > > +	}
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
> > > > +{
> > > > +	struct msm_dp_ctrl_private *ctrl;
> > > > +
> > > > +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> > > > +
> > > > +	if (ctrl->pixel_clks_on) {
> > > > +		clk_disable_unprepare(ctrl->pixel_clk);
> > > > +		ctrl->pixel_clks_on = false;
> > > > +	}
> > > > +}
> > > > +
> > > >   static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl,
> > > >   						struct msm_dp_panel *msm_dp_panel)
> > > >   {
> > > > @@ -1763,22 +1799,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
> > > >   	}
> > > >   	pixel_rate = msm_dp_panel->msm_dp_mode.drm_mode.clock;
> > > > -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> > > > -	if (ret) {
> > > > -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> > > > -		return ret;
> > > > -	}
> > > > -
> > > > -	if (ctrl->stream_clks_on) {
> > > > -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> > > > -	} else {
> > > > -		ret = clk_prepare_enable(ctrl->pixel_clk);
> > > > -		if (ret) {
> > > > -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> > > > -			return ret;
> > > > -		}
> > > > -		ctrl->stream_clks_on = true;
> > > > -	}
> > > > +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
> > > >   	msm_dp_ctrl_send_phy_test_pattern(ctrl);
> > > > @@ -1998,8 +2019,8 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
> > > >   		   ctrl->link->link_params.num_lanes);
> > > >   	drm_dbg_dp(ctrl->drm_dev,
> > > > -		   "core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
> > > > -		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->stream_clks_on);
> > > > +		   "core_clk_on=%d link_clk_on=%d pixel_clks_on=%d\n",
> > > > +		   ctrl->core_clks_on, ctrl->link_clks_on, ctrl->pixel_clks_on);
> > > >   	if (!ctrl->link_clks_on) { /* link clk is off */
> > > >   		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
> > > > @@ -2038,21 +2059,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
> > > >   	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
> > > > -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
> > > > +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
> > > >   	if (ret) {
> > > > -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> > > > -		goto end;
> > > > -	}
> > > > -
> > > > -	if (ctrl->stream_clks_on) {
> > > > -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
> > > > -	} else {
> > > > -		ret = clk_prepare_enable(ctrl->pixel_clk);
> > > > -		if (ret) {
> > > > -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> > > > -			goto end;
> > > > -		}
> > > > -		ctrl->stream_clks_on = true;
> > > > +		DRM_ERROR("failed to enable pixel clk\n");
> > > > +		return ret;
> > > >   	}
> > > >   	/*
> > > > @@ -2080,7 +2090,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
> > > >   	drm_dbg_dp(ctrl->drm_dev,
> > > >   		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
> > > > -end:
> > > >   	return ret;
> > > >   }
> > > > @@ -2154,10 +2163,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
> > > >   	msm_dp_catalog_ctrl_reset(ctrl->catalog);
> > > > -	if (ctrl->stream_clks_on) {
> > > > -		clk_disable_unprepare(ctrl->pixel_clk);
> > > > -		ctrl->stream_clks_on = false;
> > > > -	}
> > > > +	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
> > > >   	dev_pm_opp_set_rate(ctrl->dev, 0);
> > > >   	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
> > > > 
> > > > -- 
> > > > 2.34.1
> > > > 
> > > 
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry

