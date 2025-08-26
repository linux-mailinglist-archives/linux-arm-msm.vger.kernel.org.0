Return-Path: <linux-arm-msm+bounces-70863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D0CB358CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 11:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0ED40164569
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 09:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADE82FF144;
	Tue, 26 Aug 2025 09:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOuHedPu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3662C301461
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756200377; cv=none; b=WFGuZHvz5ol89hwpaQ8fuIKn1HzXf16ZjZqtxYESk7VoXwY04t+ZzV14CFykcx6MOP/jnx2OFNKp6Nh0iN8CF+Vq1wucwCTJqwHPsu3VxXqUXYEW9jxk8qT+5SuicZvIMp6YaP2xn8jdoxJDbYiDtBQtbTl4wuRjdSgGWqfyDxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756200377; c=relaxed/simple;
	bh=w20xTJTLkS1bRL9QlG5IoYd9EhhYPVaLwgYFKYLFwLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARbfpcEAKN2CzWAuaCAuraAD+QFcICZ7qgxPtiKvS/8Rv2dp9eTyJnyRkv6q/1ar03vqwURrGmH0WznApqJMQLPAt2Of+ICESEDzc7hvYELcrkdMOMyDgPeuNGpvSr4YoUagphsSrvYHfnS94sHH4MILcoavZq4eD0JIz5dAXTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOuHedPu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q7o29p011572
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7KgDcKLK3b159g1W/t3sHnMu
	AA3fp8hQ8bh2XnHJ4Gc=; b=XOuHedPukwV2WWTwQlYfxX5/a2iR0+oJ8xUiQ9En
	OjLXPMJPmxWkkRBeWoSd6iFocYiVWJ6YmTOlpvYTig5msjnVJs3LGupRh1XlM5zw
	wM97wUlfeYI8ygDchqRFcpxyKsQUdislQIYS9BVMk+j0vR3QO5eSrjTT5qPl2U/A
	72Wnm5UhJd8qciTwCnpxH5HJ3t0/k1FnB/5dhztcv0nPoPPxGr3Lxs51xy7Nfxoy
	pXDVCQD3ALX76UUQk6nXkasTCcxDqGrEVicPI/Twh2Gqr8JWGtFN3gwpFQRfYTPW
	6c8yq9kDp3/e7JjHnZpZVTZSDyyMminjrhsnSJ1uRdIcxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615g55j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:26:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b0faa8d615so164789711cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 02:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756200374; x=1756805174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KgDcKLK3b159g1W/t3sHnMuAA3fp8hQ8bh2XnHJ4Gc=;
        b=v1xjIpDzdoQ/3gboEhXSx7m2gYv7NZ6v+3JcDG94pVBW7g8z/ACVzBdPUaS56x7enO
         DZx04ISaF4jiZ71POmoyre1rM5lMT7sa62dp6cWspJDtJNXVTnGZgUnlh8ZVhgF16kcp
         WsOXILXPD4xZmDVf5m5sZfZCATgxvEGx5wHYm33uQEc1eEqopA5f8dSIMoXyiB5pXMrG
         geo9hzEUeidt5x8rq8dJXuMqOqarx36Zi4zV/aiLkfPKmv25PVmMXrskwmCBpu2sGorx
         oQib6eon0+z2emHY3a7Sdhmxp+bTTF/mnb70X/bESDX1UPwZvgqRG/nS7y5XK6qqjP6C
         lLFg==
X-Forwarded-Encrypted: i=1; AJvYcCXh72hEeRR5oz8lFDQI86JYUzXjBfIdIOi8D9FmFakSlOQOs6jGAN3M8MdmYCPF5jWVI309/IY+nUbJInes@vger.kernel.org
X-Gm-Message-State: AOJu0YxAyA8ge7hoOAHW2kj9UNXa1XN46UuQGSwOEUhfh7htg/fe5EJW
	Q20CCwR/rgn/u/ClFEMoK016+a9tFhY45K8azj5AtN06exU+nRcxEorHzMqg2Uvd9V5c/vuoL5J
	37wAL9JZAeu8pEdpw/eecRN5XWhZC74aMm9GWMvkta+xVf49u1QmXen5y97TgaVTk1b4r
X-Gm-Gg: ASbGncsJlZI2Yr82n+IzP4jQx1DlsYZSMlco1fgy4F9XNmjKrfffRuN6d93mx8lA0Fg
	C7BG0u0m4/Bs9ZJmMHMJp65636B9Q4E12f0e6EIyQANt7t3f3QRzmMpdqNKNwGNI9hxMSIzzy79
	mIS+ubSy6ohxY8h9O/+246AiSme6Sta8FokLJ00EBm+xMH/zaUAX1OwxUV0TarE8mYpTezD8tz9
	2xTdvQOybi8T406UHvQo0U9sysi3u1WGkQqpL8FnxWJfWCt9GO0TPAKNTiuNYai23NNGgcX60p9
	LgT8wN9DC8qJghUtXWXyNF2/v3haH14DFeNaigZB+tBgjf63UtQIiOVasN6QlnX+nHn64XmizYa
	80SuQ3JAAAx/Ksslfk8hp3+hJQXQLaY2BV9CyZlAKTO3Ya/F2Pf6r
X-Received: by 2002:ac8:7d0f:0:b0:4ab:958a:6003 with SMTP id d75a77b69052e-4b2e76f6c0emr6050951cf.27.1756200374131;
        Tue, 26 Aug 2025 02:26:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLI2pBmaxUZlk2JfGZiIZiLVPRGKwKddxYmLZBVub9Mv5V9yCX6KNDj8QRrTIRv5+E0q1Vzg==
X-Received: by 2002:ac8:7d0f:0:b0:4ab:958a:6003 with SMTP id d75a77b69052e-4b2e76f6c0emr6050811cf.27.1756200373545;
        Tue, 26 Aug 2025 02:26:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c11ffesm2214856e87.40.2025.08.26.02.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:26:12 -0700 (PDT)
Date: Tue, 26 Aug 2025 12:26:09 +0300
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
Subject: Re: [PATCH v3 26/38] drm/msm/dp: add an API to initialize MST on
 sink side
Message-ID: <4u5bt5y4suecanvxni2fnljdzrxnkjrg2dgkwzpj4pztvyoef3@nopu6m7w543n>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-26-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-26-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX21hFIuJzy+r1
 XX5U/Id0KnQH/cRM07+cwXBVelIXfCxfnvtqK+TM40L0Xe8yRxEqFcI3Rk06mmePCr3Tw4wEUuB
 bhKhhLTNf23gyhh64HXKQ+vL0eNioXnmaZ1bzcM/7hRYYDwtpaOX+ThthfEvTiw/t/oRV8WSGo6
 b8n/J4aKHccKT+SAj+c4V9B1vdBcVBHymVyKesvz3RpcKpTkB5piAOYiFXetxLZTyAeOp3eRerX
 XV62zXnC0c3ayy+JOT7vJxfVIkymEaRrZtJDktaHP5B3SqaNJDqtyMH/Rijd28kgO9djXSD7ctS
 ofsgczg+uFVIcRJIWCrOGCTnXMgBSvcuTpOKmoMEnDOMxkdHKMDFleywOOnaBU3q6x9SWvdr53Y
 yWFWlp38
X-Proofpoint-GUID: TEQJeBhCjUCqY78jVsgqcT4q3__DrJKH
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ad7db7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7z2oCe98pf8tU8XqQ0sA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: TEQJeBhCjUCqY78jVsgqcT4q3__DrJKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

On Mon, Aug 25, 2025 at 10:16:12PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> If the DP controller is capable of supporting multiple streams
> then initialize the DP sink in MST mode by programming the DP_MSTM_CTRL
> DPCD register to enable MST mode.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 55 ++++++++++++++++++++++++++++++-------
>  1 file changed, 45 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index cb433103d439ac6b8089bdecf0ee6be35c914db1..84df34306fb557341bea288ea8c13b0c81b11919 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -14,6 +14,7 @@
>  #include <linux/string_choices.h>
>  #include <drm/display/drm_dp_aux_bus.h>
>  #include <drm/display/drm_hdmi_audio_helper.h>
> +#include <drm/display/drm_dp_mst_helper.h>
>  #include <drm/drm_edid.h>
>  
>  #include "msm_drv.h"
> @@ -297,6 +298,35 @@ static int msm_dp_display_lttpr_init(struct msm_dp_display_private *dp, u8 *dpcd
>  	return lttpr_count;
>  }
>  
> +static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
> +{
> +	const unsigned long clear_mstm_ctrl_timeout_us = 100000;
> +	u8 old_mstm_ctrl;
> +	struct msm_dp *msm_dp = &dp->msm_dp_display;
> +	int ret;
> +
> +	/* clear sink mst state */
> +	drm_dp_dpcd_readb(dp->aux, DP_MSTM_CTRL, &old_mstm_ctrl);
> +	drm_dp_dpcd_writeb(dp->aux, DP_MSTM_CTRL, 0);
> +
> +	/* add extra delay if MST old state is on*/
> +	if (old_mstm_ctrl) {
> +		drm_dbg_dp(dp->drm_dev, "wait %luus to set DP_MSTM_CTRL set 0\n",
> +			   clear_mstm_ctrl_timeout_us);
> +		usleep_range(clear_mstm_ctrl_timeout_us,
> +			     clear_mstm_ctrl_timeout_us + 1000);
> +	}
> +
> +	ret = drm_dp_dpcd_writeb(dp->aux, DP_MSTM_CTRL,
> +				 DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
> +	if (ret < 0) {

I didn't catch this up in the previous patches. We have two sets of DPCD
accessors: the older ones which can return error or the size of the data
that was actually read / written (which might be less than the size of
the buffer passed to the function) and newer ones, which return error or
0. drm_dp_dpcd_writeb() is from the first group, so if it was
successful, it should be returning 1. It's all a pain to handle, so
please start using newer accessors in your patches (the full conversion
of the MSM driver is on my todo list, but it's intrusive, so was
delaying it...).

TL;DR: inside your code please use drm_dp_dpcd_read_byte() /
drm_dp_dpcd_write_byte() / drm_dp_dpcd_read_data() /
drm_dp_dpcd_write_data().

> +		DRM_ERROR("sink mst enablement failed\n");
> +		return;
> +	}
> +
> +	msm_dp->mst_active = true;
> +}
> +
>  static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  {
>  	struct drm_connector *connector = dp->msm_dp_display.connector;
> @@ -315,18 +345,20 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	if (rc)
>  		goto end;
>  
> -	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
> -	drm_edid_connector_update(connector, drm_edid);
> +	if (!dp->mst_supported || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {

In several previous patches, the functions initializing MST can
return an error, leaving the user with half-initialized MST. Are those
errors a safety coding or do they have some real-use usecase? In the
latter case, it would be nice to keep SST wokring if enabling MST fails.

> +		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
> +		drm_edid_connector_update(connector, drm_edid);
>  
> -	if (!drm_edid) {
> -		DRM_ERROR("panel edid read failed\n");
> -		/* check edid read fail is due to unplug */
> -		if (!msm_dp_aux_is_link_connected(dp->aux))
> -			return -ETIMEDOUT;
> -	}
> +		if (!drm_edid) {
> +			DRM_ERROR("panel edid read failed\n");
> +			/* check edid read fail is due to unplug */
> +			if (!msm_dp_aux_is_link_connected(dp->aux))
> +				return -ETIMEDOUT;
> +		}
>  
> -	if (rc)
> -		goto end;
> +		if (rc)
> +			goto end;
> +	}
>  
>  	msm_dp_link_process_request(dp->link);
>  
> @@ -349,6 +381,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	 */
>  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>  
> +	if (dp->mst_supported && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
> +		msm_dp_display_mst_init(dp);
> +
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
>  
>  	if (!dp->msm_dp_display.internal_hpd)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

