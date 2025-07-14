Return-Path: <linux-arm-msm+bounces-64811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F360B03E8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 14:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C952D7A4BEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 12:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13139246335;
	Mon, 14 Jul 2025 12:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cnXUyW99"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800BC3FB1B
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752495941; cv=none; b=ndD/6DB+MIXKrJZ+5ic98SCTN/z79YTvwh03OKRqNfjYTn0thNvjkcL0f/wFERj9ltOBTPRXZ/Fl4VL+LkR/Q37kML0n2zmSIfNBe7MoNevTmUv7ucmShfohfDC4ass+hOku+nPBnsmnxR+TcSeclEvweOYouMxGwGFBJnT5wPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752495941; c=relaxed/simple;
	bh=Y7qatP4+GiVSsdJzmSg5JCDPFshBcX8d27AnDjFr5FI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjXrC70yZ8wpXleyy1OxChra+YHdn3iRE2Kqn+eAvoeMjH9GLG66y5wlzpu4GE1HhqvyKEEZW5QHHLMKEHD60nqf0UDJ+yl2rIItPNd33jgtRKt9/7VDKH7paHXAZ+iL+6DRdPn9wqcq4OlOkyRWyFvtkExnMBBcQ/jCOdqGkQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cnXUyW99; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9vBK2019474
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uvgo2/+G21cKg9t2+XS0pBef
	4DAQ2zGn/cwQ2SSIW/c=; b=cnXUyW99VBlIQ99FaT+/YXZ9BhGRL0zpME5JqxPw
	VfVy+mbrMTnT3GlTA9fRcrQ246XJPuTcWYYXQ2+7+Ifixv3vUKWAE0YD0NrZLwdA
	BMHTn5DIDLpY73Hno2GKnSQb2DfJvEi6skVb0AllVUbWSar4CvpMBg3iVikqTQhU
	7NNwiVwnxK2vYHXL7Omo2kwCL6X1TcxkfyrifhNYX7WtBfg/e/6ahke/4o4shYHR
	WUv61qGy4MahiGBVcYt0i+YKp6PdKCrJGQpS/ZW5FzGe6CnkXHWvvnaTkydfcM6e
	+zpREAl00uSUl5Glx/hJ7R8vBs013h4DebuywIk29qan4g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugfhcnj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:25:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e271738501so252365185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 05:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752495937; x=1753100737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uvgo2/+G21cKg9t2+XS0pBef4DAQ2zGn/cwQ2SSIW/c=;
        b=MgckXmjRhJuvhm2AhcpQkYeZZ8FoAg7lZ4xAy8fnYxfQBt1B2QRahKohV5NKqn/rjP
         EsQkmCqsZN0csLr0I0ByIZMrnO4A3+s+iR2b+B8uzyc5h5UHzSvZf21ZxNZqRAdYZCjZ
         cgW5aOuY98WSGl97FFlpzovAD7++0pwaKkGTIrzaRm6pws1ZrW3tdiqhpWH/Lai3UwCo
         OIrcC2rME5CqGgno4eh4fHeiej5YYThR7RvB3cNJyBO8rU9kMWzVa+pcxYkSixExO6R3
         5/XlpX14uVJfxx4xYCbis9/TPBG+lFQEfbZK13XGe0YiXiFKxeiIpGyUnyEqRh9IIDUp
         GUxA==
X-Forwarded-Encrypted: i=1; AJvYcCU0lyB8ZME/SjR10Gx6Pv3d/VszTRKz2UsRwDOx0yAbhWivU26W55axrLtseyjAE+9aB6fCrvyVed/zRkQU@vger.kernel.org
X-Gm-Message-State: AOJu0YxterIu3iRw4AwmzY73mgSlvczuC+zerGVrRL/F0ADX5bJKNp9D
	gJBjzKpSA0aGWrkZlPQgkqZYrrJLnRy64FvTF2Bn+EKXf+DIa9BqYiF5B/cW2958GM1/cJzx+vk
	09uVqYMub7Aj4vjzz2y7QZ9cxXcxgiNLfLvV/FtT5/iXXzOqmLgRVHLIDPxCE0wDAaZ6Q
X-Gm-Gg: ASbGnctIBjNxqah6laYym0O67uDuWmV9szAwUCuCHDqJnr00XRT2L2QaFRFtqDzO9L1
	wfJ2968F889/rwdQYKEpQCA2Mj9RWeLRDfOlyGE/1USRHiKRRgQs26yB7cUIRrIjOcSb78irONp
	sAAJ+q/0V5GGkHMO4w2PI7Xd5+SEG6QHwDH6Na35Z4kXOSZbdSEa2hWvUs5zQpUGIHvtZB7Zg0L
	96haG/KAm4AIZ5LUArDFXUvXrexMmvS/uIo3EgoFLJWsg+O+OcJ2hwd8F21r6+TwGa+7SHUb5AC
	UZe+xup+hnbOpdwlnKKI3tSea+mSYfByBXGXdKCCbgpYInAuhIYiBeBH+gXdwblWuqCwJjHUFeW
	nBZDWQJ5vATwPFxdd5eVxKdl9x49DacXiwSNCbVQQx5tdjZ5xcYoS
X-Received: by 2002:a05:620a:4405:b0:7e3:2c14:231f with SMTP id af79cd13be357-7e32c142744mr378809785a.43.1752495937101;
        Mon, 14 Jul 2025 05:25:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcd4HKe+PFCgEHZG7nrqRuYfVDMqnxe5piG1IIkUMCsKQIHLQIbL1N5PpU+BI2Xdue/UzvsQ==
X-Received: by 2002:a05:620a:4405:b0:7e3:2c14:231f with SMTP id af79cd13be357-7e32c142744mr378802985a.43.1752495936409;
        Mon, 14 Jul 2025 05:25:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b7ba23sm1941079e87.238.2025.07.14.05.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 05:25:35 -0700 (PDT)
Date: Mon, 14 Jul 2025 15:25:33 +0300
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
Subject: Re: [PATCH 17/19] drm/msm/dp: Use drm_bridge_hpd_notify()
Message-ID: <yd3myqnh3lbaafckdevn5mv2bvrobpisodocmwj5ngnntd3c7g@pixnwcdjbecl>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-17-33cbac823f34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-hpd-refactor-v1-17-33cbac823f34@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 18OccfYkzJbsbdPex5UYQkE-bmnuG5Sw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA3MyBTYWx0ZWRfX2pw6qM8Ns/7Y
 rWG9xl5oxZ6dc/gXtJ4FZgYADSwz0A7gNeHvtfu+Vz6BHo9vLimk4FzrlXrst05l6IVGlHwzIWr
 mEHrlHaQDmKBzFlzJeIWcklM0pdHgOebeV3Ym8ubY1E9wg/Kib+taGkMYZswFHgJU+DwSGSgE7g
 KDFBj2iL8VUcHz3f48JS8kLdvi6gVPcfxDTu0zxYfdiu3kgwdPOTliOKzBBNlU/3KRm5B4u+8+9
 79JjYOHuKq0zudy4c3i8bLd0n2Sq7z2F2rRoPewY9kQlejLzQpbfqD+XQvxjXb+D2MoKdha2hoA
 DJOmiHVqsq+B2PCysNLLAvgUsVNPi6HiljoZPXlh0+Z9HtIb3284YTDrewTbor+O1FKKXdWyZKl
 jmZ50XGO2d0KzuqAPYbnPGw5GOoQ+BXPfDpUojuWysFH7LmCBr4jKOmIauwP7UvUmDeJ2UdF
X-Proofpoint-GUID: 18OccfYkzJbsbdPex5UYQkE-bmnuG5Sw
X-Authority-Analysis: v=2.4 cv=HYkUTjE8 c=1 sm=1 tr=0 ts=6874f742 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=POgxf3QGRWwV6KP900oA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140073

On Fri, Jul 11, 2025 at 05:58:22PM -0700, Jessica Zhang wrote:
> Call drm_bridge_hpd_notify() instead of drm_helper_hpd_irq_event(). This
> way, we can directly call hpd_notify() via the bridge connector.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
>  3 files changed, 8 insertions(+), 12 deletions(-)

This patch has some issues. Beforehand we were just stating that there
was a HPD event, now we are explicitly stating the status. This might
confuse DRM's status handling if the status here and status at the
.detect() differ.

In my opinion, this should become patch #4 in the series (connected,
link_training, EV_HPD_PLUG_INT / EV_HPD_UNPLUG_INT, then this one).

And the correct way would be to call drm_bridge_hpd_notify(bridge,
msm_dp_display_detect()) from the IRQ thread. This way we should also be
able to drop EV_USER_NOTIFICATION from all over the place.

> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3aaa603da4f9..87f2750a99ca 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -324,17 +324,6 @@ static const struct component_ops msm_dp_display_comp_ops = {
>  	.unbind = msm_dp_display_unbind,
>  };
>  
> -static void msm_dp_display_send_hpd_event(struct msm_dp *msm_dp_display)
> -{
> -	struct msm_dp_display_private *dp;
> -	struct drm_connector *connector;
> -
> -	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> -
> -	connector = dp->msm_dp_display.connector;
> -	drm_helper_hpd_irq_event(connector->dev);
> -}
> -
>  static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *dp,
>  					    bool hpd)
>  {
> @@ -358,7 +347,11 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
>  
>  	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
>  			dp->msm_dp_display.connector_type, hpd);
> -	msm_dp_display_send_hpd_event(&dp->msm_dp_display);
> +
> +	if (hpd)
> +		drm_bridge_hpd_notify(dp->msm_dp_display.bridge, connector_status_connected);
> +	else
> +		drm_bridge_hpd_notify(dp->msm_dp_display.bridge, connector_status_disconnected);

drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
		      hpd ?
		      connector_status_connected : 
		      connector_status_disconnected);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 68bd8be19463..6e12694d5a64 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -16,6 +16,7 @@ struct msm_dp {
>  	struct platform_device *pdev;
>  	struct drm_connector *connector;
>  	struct drm_bridge *next_bridge;
> +	struct drm_bridge *bridge;
>  	bool connected;
>  	bool link_ready;
>  	bool audio_enabled;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index f222d7ccaa88..b12a43499c54 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -358,6 +358,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>  		}
>  	}
>  
> +	msm_dp_display->bridge = bridge;
> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

