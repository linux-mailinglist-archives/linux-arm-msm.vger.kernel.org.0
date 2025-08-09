Return-Path: <linux-arm-msm+bounces-68156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8206B1F29E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 08:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D815B16DCE4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 06:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD3F1DE4EC;
	Sat,  9 Aug 2025 06:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VmVEU8wo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D571624F7
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 06:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754721980; cv=none; b=jSqIl5+ODJil664R1F/Zw7wnsIlG7yqaHYT3Oy+UzmLLYUF1lQCxaXE1Pv2JSbgTo8fBaGHu15e6qT3a3F7/RTTM+fQJwez7clrKuX19GIn3P0mISXXdEM9WUKKR6xUvksAf49IHCTSCgoLg9KH2s/VZl3LwVfVObL3Cas28bdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754721980; c=relaxed/simple;
	bh=yhJEpZc9/+rKyHYywabR5inzJ5a8t3/gkXf9XM1kwlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onc6kdufnRC5WSS8aGNGM7S5ODyi10z8KCfOJsYtveKad2Bs2Po/i34j6Ffm2ggHicuPrKY3V3KzA8I51KoLj5DGdm4Bryki0CNzPAbE6eP4XNrkJxGNs9ky0yDwdidlsbF8S0iMSEX0DIqimzf+CcJOzX8W89arKbY9BJc+iUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VmVEU8wo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5793UMKB003036
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 06:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XqIzyO03+Zog8XVeXGSU4+9P
	xhsWU2JVSDy83gBx3+Y=; b=VmVEU8wozQFb73br1lONVGOPVLjL8QIsmsaKBUWr
	UX55++1WzarJEEFxbE1+VxoS+FOJUoxyHKTX9CS/pbaNrBcfo3keJ/hL95DD7nHm
	ZX0evIO1T5/C89z7BflaWGN+C0m5MNSuoBnlOZ9GGSyK0i9nW5Nra0dwKjyHuYD9
	TKCkJ6rtiUiZtl/CZQ35iWMv/E1PnPCDagpkkyfaI+rdudoT9zH3LdK1QjZ+jjxA
	Ou7y3XptnFeLALCxWWnfnnW64IFRR5ODzY3qDH+q/2eysyaweCYQSxhk/0/7kiCW
	epWcBZQzqQ28PKMPdA36oJUbV42vjpMyDiFDG2Aa3c+wQg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dwb709sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 06:46:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b0add6d192so30527211cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 23:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754721977; x=1755326777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqIzyO03+Zog8XVeXGSU4+9PxhsWU2JVSDy83gBx3+Y=;
        b=f2ieZEmBaWPwhvotelIZcfq4y/FeTYu7KJ7BsvG9Zz5FBHPJGQ/BCUVcvQ8xHeDRN5
         KOEGIn5EIVaS8vHjEgrS5+X/hVszFceQvlT27nuvS/17BOWn0ItI7SWJ/M6tdG2WfseW
         Ehcwa7k7qhRu/qNhem99zWoQ4NzjVNYkKEaY4AfcQHCImRoKTKmA13ibqbNN6Ub8dYhb
         G/zD8RQ14Yh0rie2zhdjRySlaakEaT23PN0LrlG7n7SyFPQ0Z1pMF1D4SfHtkeg5Keg2
         LGo5F9eiMoHbuSH6w6PTtJM0eyW2T9T+YNLyw5q8wATDTeYCs6mLbbK5A8vypR4CKozI
         ivag==
X-Forwarded-Encrypted: i=1; AJvYcCW2ru8I437Dz7hOEinu/XEOTQu7pJettKlKAXGLxjOzAB5799uFEYNXeAc4KRUYsG+0rb6PJiNPy7YGZ0ml@vger.kernel.org
X-Gm-Message-State: AOJu0YzVmrGGOhCWXncz26pSIsbfT24DjRvtG+L7NiKaLqK1mUmLbC/j
	aEY13vu4CgQ6HjF7PGa8sMfcV2UWBGltfmws1LvfxvMdetM2f0+fw4bsgoSI0ekfMOCAvXEZtjV
	yqIoNKmNAePgCJlJ0Itoun2EY0+DbxpIXch8uvxHPcVd1iVfdLeEwObq4W5l06WYu1XLV
X-Gm-Gg: ASbGnctv7a/ioLI5FcmR4HyLz5SGBa0mW4NxEeZIOBCw19iKYkBxAknBlGvgaGN3Mc1
	VFkzyn6DrkVFtFklI1JneIYQYV4KEoeLLreVHYYstrTrqkk2sAUXcWlfGNssAbNsrcw/qZYEqfr
	ObYLTh29pzTq/WSPVu4GbGHEoIXBoySFM1o/kfSogww67z4uUSiBAk6Q+YKjA3/RBlfFfAGPi9M
	+0xJXpvGXMfW+LLaL/cbbShWeYj3g9x3DoyOIJgiYWJC7ZzEN+Q5mWWmBtsBfXKBnlWU5wCTQ1m
	lblGxzSmQysgrqr6lCXjQ05gTiEF5wLOb5rJPGS8Q00Zkau41d4n4VlFmUirad3kVMXfWQ0cz4G
	DK/E7F6xPfG43ThzVx7yRJxGHYXzwl5G+yvsxLnJGu32ZbIGB79Z7
X-Received: by 2002:a05:622a:1181:b0:4b0:7620:7351 with SMTP id d75a77b69052e-4b0aed29dfemr82029811cf.13.1754721976614;
        Fri, 08 Aug 2025 23:46:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7uzAueb/H2T7wTR91arcTcUMFSM/xMGIdUJ3vbQ8Trxnz26AgjAqlfb42BhcAP9WpwSKUYw==
X-Received: by 2002:a05:622a:1181:b0:4b0:7620:7351 with SMTP id d75a77b69052e-4b0aed29dfemr82029661cf.13.1754721976092;
        Fri, 08 Aug 2025 23:46:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332388fb356sm31344371fa.61.2025.08.08.23.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 23:46:14 -0700 (PDT)
Date: Sat, 9 Aug 2025 09:46:12 +0300
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
Subject: Re: [PATCH v2 06/12] drm/msm/dp: Use drm_bridge_hpd_notify()
Message-ID: <6ve3hpbcki7k2erktnaxkouyxxzeuii46hgeqscqrmurya2cld@e24gp6viluhd>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
 <20250808-hpd-refactor-v2-6-7f4e1e741aa3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808-hpd-refactor-v2-6-7f4e1e741aa3@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=K6oiHzWI c=1 sm=1 tr=0 ts=6896eeb9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=QNbhuYZ5RTNpGKTg7GoA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: DDSv0xZNWkBREjgX49AGBCWEj2uvHafp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxMyBTYWx0ZWRfXxEFQh98MRPa2
 mojf4rYAp7/WcJI0vLV43tXEnXAnsXellB4sbeoSsruXH2I5OGh3+UiQq9rv09fyaDviDzAFAfs
 mBTRVpft30q+kmiFgO1IE23ZvucOjj9UPRgDq6xo0Ri1YTDXSnzODeyq/J19zKbDTdDR+OiNT7N
 ktE1yDTA61Bw0l4o5TV0ynyKJP56z9nOqHYESv6SkAjjO3gfyugd3fjLEFP9cfyqHJkWjTLUhlr
 G/ZDl6GauHgHjg95nVgTua8NNkp4HD7Gch8QJ8bjbjCgrlxmedPrXg5iJU7tMbG5VGqBOMz0TU4
 PDmNCr9NN7B9nrzQDbwFgfpZyxezAf6U6szSvXSB3Kl+JwzOrOiE8wF5Gnx6jcX10GSCGsEEx1B
 kxjK/zQt
X-Proofpoint-ORIG-GUID: DDSv0xZNWkBREjgX49AGBCWEj2uvHafp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090013

On Fri, Aug 08, 2025 at 05:35:18PM -0700, Jessica Zhang wrote:
> Call drm_bridge_hpd_notify() instead of drm_helper_hpd_irq_event(). This
> way, we can directly call hpd_notify() via the bridge connector.

I can't understand the sentence.

Please start by describing the problem and why do you want to perform
the change.

> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  2 ++
>  3 files changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 55fe8c95657e..8779bcd1b27c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -333,17 +333,6 @@ static const struct component_ops msm_dp_display_comp_ops = {
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
> @@ -367,7 +356,11 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
>  
>  	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
>  			dp->msm_dp_display.connector_type, hpd);
> -	msm_dp_display_send_hpd_event(&dp->msm_dp_display);
> +
> +	drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
> +			      hpd ?
> +			      connector_status_connected :
> +			      connector_status_disconnected);

I'd really prefer that at the end drm_bridge_hpd_notify() is called
directly without extra wrappers.

>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index cc6e2cab36e9..60094061c102 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -16,6 +16,7 @@ struct msm_dp {
>  	struct platform_device *pdev;
>  	struct drm_connector *connector;
>  	struct drm_bridge *next_bridge;
> +	struct drm_bridge *bridge;
>  	bool link_ready;
>  	bool audio_enabled;
>  	bool power_on;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index e4622c85fb66..f935093c4df4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -340,6 +340,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
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

