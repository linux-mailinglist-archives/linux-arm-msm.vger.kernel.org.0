Return-Path: <linux-arm-msm+bounces-64804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 607C0B03DBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 13:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B00C53B4991
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 11:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3822E3718;
	Mon, 14 Jul 2025 11:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOuXmr1Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D38A927
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 11:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752494059; cv=none; b=DuSiOIxK5p09/zPIbUpbITMd6UkKMaP6fgJnw5HRrX+kdJerdh7J2byhjMPUJAYHwcwZPGhvw5rqc9knSDy4rVoKTjYMk2sX4TlFbL0pcRILmNg1Id9sZdJKgERgvKXz5mg4p7Jo4RG/rUznrd1wtEl69hTz3XLPr7lAGP05p/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752494059; c=relaxed/simple;
	bh=io3i8HDndx+x0sFqGWThvlRejp7JwKPia7uR/FwM/rU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igHRcRPhFHXRi5pt70PbzH65L8VdlI0/V+BtrCkEO+kJWIHG3HExCJ9yUUP72qMutZB1rD6v2PpzeUdbwoj3MhWhOVuF5epJQ6olBb8g0UsaiwuAVKCMm/VxmH0WfwcT+/90Nk7L46DiBA0QXwa4qHUwfRkO8MVU6/FPsFQfuuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOuXmr1Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EA6WZw024162
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 11:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hhDlRlYOa9A7BFK+SQrOUTc/
	kbhd6bQStxsgEEh3z6E=; b=oOuXmr1YZQG3vBqx4ELGnIL9QUhw4NibIF2ljHCz
	Dxyjkpt5JPwMheuwKa+VuBzdY+vR/yfC4ZaMpNm6RBxjpq5Ie0rlCzliDD8GQMrH
	6Ao3NBx29YnpRG8DZqT3qeqquMes+il3p+jwhxGuIknfvBlO97s5wIh8DTf6J4rz
	lXUnXi0yRBSYAIedN8svvxx5ZEDLJUJyErfN6ZLNWUIFLnpqYeACMO4w61Fpijm5
	mfnHtPZDdsUovD5Sh8PkbjOlhhd9vHy1xXDtlj6AeUfrGNewxAiPFKvvqBHRfXDZ
	uui5qAo8Or9l/Im/3cNTO3eITm1vDxF3CDSeUN1Z6H5efA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbch86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 11:54:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so703413785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 04:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752494055; x=1753098855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhDlRlYOa9A7BFK+SQrOUTc/kbhd6bQStxsgEEh3z6E=;
        b=O8S5THFghCvUOoTnTdExxNymivFafYqLB9m/7JaZ+VfEShFVSFYYREdz/FcXOJNqKo
         nbw9jUnxY2E7xVotNBwhEK2FHXgRM8AO/c21y1zSheWi0m6gO2stSqb63UOvfJWnjQop
         q6o0c/oiMoNNXvTp2klrR3d/9oI0oM0t1ay+YMaoyfVt+OD+3OJ9WuYYTT1mBtF6CwwH
         GOY0FQB+h1g1X5FrR5rlBvqwIAy9TWEr3VyR+VpnRnV1AlaBi1KFN84/5ZAWNxQ3lWq/
         MghKqEmfh/Ps3fsYHqkO0aaGrMloVVWFb99/enN4VmGuvdWcVJ33x7GFQhtv/Hej/o5s
         kZVw==
X-Forwarded-Encrypted: i=1; AJvYcCXBt8UR0cM6lXbq2vcHYBBCwEBY5bgoNSxzm2OuxLWA7YS7C/WoSMqKWGOO4iSe0XGs3qr8bG3fmftbH8Se@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/xiIx/apWMFZUWm3LrBrcYgDZp28AN+xE9ouzQBslSBL1u32f
	1CicIxEIELs8JXUUHjg89FGm/cR5YAECf4fIK8TqWafj3IJ2ZypN7EGm7Xea2LeIjE+BBrzKLua
	pxskPbJchu0FxOyAak6doZrBSAciMROx48RzZEXd9WWYUPskskgjmBard5eNvBnzPOhtg
X-Gm-Gg: ASbGncsO5kqKOi/PhgT8xXyQgHHT6lYHjqz3Zk6KahW3YWBcR6SLJxBE2FCoeXGIvJq
	oPVEN6Wg3jwGLEtg5uXXVK3KAvtPP7B4v+5qUbEpuFfL4UGbh/lHxiNyUeQYUCZAjp+2RsDPKZ2
	VaXkXLty3QH8IX4nzwV+V63Tnyhc6FMHhZ+XqlPqt5Rb5ZeJm0eTuHIqNM09pM8TG1oIQKqCzDN
	z8WIuJdJgk4eEOq8dnciUWb3FmkUo09rlQEp3x5nFrc3LeJm8U05nvtLBu9Vh/QJZPLfIlcl7Yf
	8uM0Lxl+TEZm1GjWWbA1Zk/sdPPwU/+QBqJ3qOREPvhSQAQ/4TWF+ZjBs0gXhU/apOHcoDS1Y2+
	6TB9RhpT+RhBbbnXunwfD1VlAjLDbM0FFZ98zRtUFyJVljSMWk1rd
X-Received: by 2002:a05:620a:d86:b0:7d3:a7d9:1120 with SMTP id af79cd13be357-7dc99b9fb23mr2424125285a.24.1752494055350;
        Mon, 14 Jul 2025 04:54:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMqZJV+7lQmgWTt4eaASnArEGjHjj4zcLu7wtF2nr7er4jJuci6OVCbQumR6y+apIH309lGw==
X-Received: by 2002:a05:620a:d86:b0:7d3:a7d9:1120 with SMTP id af79cd13be357-7dc99b9fb23mr2424119485a.24.1752494054766;
        Mon, 14 Jul 2025 04:54:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b602ffsm1897581e87.147.2025.07.14.04.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 04:54:13 -0700 (PDT)
Date: Mon, 14 Jul 2025 14:54:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH 18/19] drm/msm/dp: Move link training to atomic_enable()
Message-ID: <cofa377vptj7on637u3c3mnxndplcmaegsb5h6idinz5wrvm6s@toylno4uapq4>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-18-33cbac823f34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-hpd-refactor-v1-18-33cbac823f34@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA2OSBTYWx0ZWRfX6eMfXAi2MHrF
 ru+zmbrybqiyFRwu0eODIfZy8LxkeeX7o6qcLD7gG+axSu2BWVbrXc0AMP2iIchFYjjJxE5pJRX
 wuR1t6BuO0YY1b6UX1iQbFU4cNIMsJUiZYjNxxBt+TCim5ZxaQPmVCoW1q7EzsGFXma7Q/SKC0c
 5V5f+NOFXekEbWEWhtJc03GfZWEMfDuIQDRtZOu3Dbzl8eiMCMVQ7bfanYsPrp3z4uRxje7R7x8
 gBtUgG4ARBuCRaDeHhnjKUSAWQpiWubz7Wpt1xejx/k7g5vl4Bhpwvpkjv2xCaUYpon0b42CIqr
 RARi+YUWn1s6iGv5RZ+qmqVppMzuq8z2jRhrap86QiQyIobu0WUbRAV8DIYv9yb+qTu4yTA2lMc
 Bn532IFUFAtTRirksSRNyX9z6NEvoPfvwSFkICLniWGHZYPj2TJAnpkN3zobiGN/C/kg+Kmu
X-Proofpoint-GUID: E51f2R3zRYexdja_ruFwK8gDgKazWMSy
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=6874efe8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=kAOSIj3XOs-WuWg9PYUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: E51f2R3zRYexdja_ruFwK8gDgKazWMSy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140069

On Fri, Jul 11, 2025 at 05:58:23PM -0700, Jessica Zhang wrote:
> Currently, the DP link training is being done during HPD. Move
> link training to atomic_enable() in accordance with the atomic_enable()
> documentation.
> 
> In addition, don't disable the link until atomic_post_disable() (as part
> of the dp_ctrl_off[_link_stream]() helpers).
> 
> Since the link training is moved to a later part of the enable sequence,
> change the bridge detect() to return true when the display is physically
> connected instead of when the link is ready.

These two parts should be patch #2 in the series.

> 
> Finally, call the plug/unplug handlers directly in hpd_notify() instead
> of queueing them in the event thread so that they aren't preempted by
> other events.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++-------
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  6 +++---
>  2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 87f2750a99ca..32e1ee40c2c3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -410,11 +410,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>  
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> -	if (rc) {
> -		DRM_ERROR("failed to complete DP link training\n");
> -		goto end;
> -	}
>  
>  	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>  
> @@ -1561,6 +1556,12 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  		force_link_train = true;
>  	}
>  
> +	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
> +	if (rc) {
> +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> +		dp->connector->state->link_status = DRM_LINK_STATUS_BAD;
> +	}
> +
>  	msm_dp_display_enable(msm_dp_display, force_link_train);
>  
>  	rc = msm_dp_display_post_enable(dp);
> @@ -1706,7 +1707,7 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>  		return;
>  
>  	if (!msm_dp_display->link_ready && status == connector_status_connected)
> -		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
> +		msm_dp_hpd_plug_handle(dp, 0);
>  	else if (msm_dp_display->link_ready && status == connector_status_disconnected)
> -		msm_dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
> +		msm_dp_hpd_unplug_handle(dp, 0);

This chunk should be separated from this patch. I'd ask to drop
EV_HPD_PLUG_INT / EV_HPD_UNPLUG_INT completely and call DRM functions
all over the place instead. You can do it in a single patch, which comes
after this one.

>  }

-- 
With best wishes
Dmitry

