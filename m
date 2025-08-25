Return-Path: <linux-arm-msm+bounces-70766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CB1B34C1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 22:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 515B23B2897
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 20:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AD2280A52;
	Mon, 25 Aug 2025 20:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PgXu6Sjt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A422367C9
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 20:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756154138; cv=none; b=Mf5EqPZUbsYwIuUIQXSN33Anzp9rxFFFEZ/PbFF0j71A4A1eoTCWRV7FtvzYNDiIEHRsRBOiQcW6054q+/FLfuZtnojYstPkwDqzXj9elHd1/aArN8zeV/lMYbIrdqgU3YbAAmv9S0+ZkLOGoybckzz2WEw1HKg1ITbFVWnNoog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756154138; c=relaxed/simple;
	bh=fEFPGPX7Ak1AVPIOq/Btl4VjT7rgGxXSbBJTumueix0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8kzov4RAxn4t491/icBCW1km41f3RNYN1DS5HXo9toDrs/Z2K0c4o9CVHyIRzRcr3wdgq1AFhN9jye2awqrCIBKXJdk/GbvUSpHjGylOZZ32Wv0xr7yam/hnpqm+l+mrpxb/pOEscRGUta5NALxvMQtWkvNHbpiJBrYuPLWzAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PgXu6Sjt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFs7aR007038
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 20:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yAvDexHvFvVoJW4KVsl9EQO3
	3UW9a1WIuE20kaTFqaA=; b=PgXu6SjtXcpQPUtmEFuPi341ur7MZqRobaTW5GXF
	uSUp7McW1hSPDkGCJh1Bjb/cJ3lDrDeB+7H2ID0j5O/82iICQbCLcUEJX04UEk4y
	0jaX/1CSNLIiCb8XF3I5FCwj2fYopopFQnRxodjjkIF2ymueFfs6ZdsRu3slGorf
	w4D5FnAHThKIfkRdbS/3ztFvrvTwUnp0K/xcg3/oqOFZon/Sv6ViMnJzc1Sp5pgd
	r7GL7cmG7mX4qjI4/SCInXBjEmHuT3QGm3Z6TqUnmtvnVsObo2I+DpwcfNzAXblZ
	K0J/5ChIsFvdOYLKIa1K+KGZC/Md32JJfSm9HWPZIBpu7Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um6g8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 20:35:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b2955f64b1so132882831cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 13:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756154135; x=1756758935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAvDexHvFvVoJW4KVsl9EQO33UW9a1WIuE20kaTFqaA=;
        b=ntINcTQ9cPEc/BuCyD3/8W43WPX7ScAWv5UydvsFcMc02QEb0n7eFT85fmqBMYY/Ug
         Q4v8GOdxVp60RZqYST0QLLXn9vwlDNOwnqFJf/X05uaA5UoZ/uzinZJYPKoxPoIK7RPk
         L64qmxdk/jXtBaM0wRQgG7032/Jwlm6k3uSzczLmoMfDAO1cosfj6S7mz5eF90eLQ1k7
         D7QPj5O3RZf/AsWTDEa9ry97V7tNAyN2kNbM3pmud1EGZxT1j18J2t5IaOQU/hx7ACiE
         UA3Keg8YP1iJuU0jLx+4C9DlFAxFjDgRvxj07k3+pP8SaVa8erpIBROaOVc4/B1yb6r+
         XXvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy4m1mIXXPIJkzB9FkvcWfbgC3U2NYrwbU5ri1/WsSY/InTXOrEMy8uBPgzQ0TBuae+dgaOREJ5d7lU6Ii@vger.kernel.org
X-Gm-Message-State: AOJu0YyDC7sk5gjwknVDUSLu0j+sIQiXArSEYFwfcmiUBJHsj8bvb1Z7
	KvVuPw/xlMd5kvahd4vCKTHkcK3EuS9pNh8Dew5tWd+5xScPYKaKv3qETcFA0uKBRvhB7dlGbl2
	J6P6aNoCqZ6F4vf6dizlbH9TrKnYtCIDMokCV5YvNEio5kY0CuN8rJ9FLCfBXBp5pbz3Z
X-Gm-Gg: ASbGnctUtsaBPZSlrph2pXO7/82oSjzHkNI8k0a6//qoOSbOh7xKXSDnYV8yn51j/si
	fPn2FmKgN5r9rWO6J9rdBGEphNGBSwKwgxm306sGpwcYvvF4Ngqw3nuYpGkePR6wI7sLolViQXw
	pyHo0I4cT3l2pkkQxHreZm+cK0XVumrVYr/tS96srxgB6s35D4boMTScXcpxTFQgwf7XF0JJBgT
	Ya+6gBlTOCEWDJDaDopiVfx8vtqX0CffY4a3Eh6/9CPMX6Tqq+OQR7X5R+5/gB61RiY/IlX6aXH
	TBQ7bjL+hXmj2BgaC8Y+QJzLIBtApEzNR9cPjGKjy9/vUNjYsSI9OLCIdNMTdPEct+Fv9s8/xO5
	2Disxu9lRcE05y/JoiMUACB9gHJoZ45xAgsk6OlomUGuAfmkguNA3
X-Received: by 2002:a05:622a:4c7:b0:4b0:61fa:19b4 with SMTP id d75a77b69052e-4b2aaaf9fd3mr148023101cf.46.1756154134848;
        Mon, 25 Aug 2025 13:35:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTxiwt2uolX8Aw9ZSuuS6XRndHBCwOU955PX0YNpOUiIwP0WQiM9f0I04RKUylBqfzH/cMJg==
X-Received: by 2002:a05:622a:4c7:b0:4b0:61fa:19b4 with SMTP id d75a77b69052e-4b2aaaf9fd3mr148022881cf.46.1756154134337;
        Mon, 25 Aug 2025 13:35:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c99ff5sm1778909e87.117.2025.08.25.13.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 13:35:33 -0700 (PDT)
Date: Mon, 25 Aug 2025 23:35:31 +0300
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 16/38] drm/msm/dp: Add catalog support for 3rd/4th
 stream MST
Message-ID: <j6n7jntsapy53ojyackylfctouuyu762pjf5dsbjhwoti6cos6@5ppukry35xo5>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-16-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-16-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68acc918 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=-oqhLQCYqG34RGAAmHUA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX8p3e5v0vb3b5
 6DdcIwPutV/3HpBNOK2EVkEu0F/6t9gPvK+4wpNqJNqdjx6Po0VaimTqNs1zT6FvBhYrny1u/nj
 Ump+EBSbHA9aFLJ/0yHJRyzX2W2J4DiG6ULFXYKCNzSXkcMOekPBJ+22gl5dAxQhIJ5RD/kAtwX
 gyGEh/U4fpxQmDn2S1yfLWIXfo8dQ+LDjEpWgbrmi721ozq4qdsbqi0rPmBoRMpl4ElhLMwstKf
 y4ViflQULocYgaL1ox2e8Kz0vpuMIWo9KoSFV1ogoA7tB+U214iOUeMO6fzJ5/DjwbukLQdQ9kY
 CUzUXfWeEZWaKDYuNljdkp0eG8reRLVzKZIT/rCV+1Dxy6NR/XV6DtWhhWma36Ba8UHCiymFg+b
 lyDZuOWH
X-Proofpoint-GUID: hkkwTaAgnIUU3f-9tblCX3F10k1lORyA
X-Proofpoint-ORIG-GUID: hkkwTaAgnIUU3f-9tblCX3F10k1lORyA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_09,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

On Mon, Aug 25, 2025 at 10:16:02PM +0800, Yongxing Mou wrote:
> To support 4-stream MST, the link clocks for stream 3 and stream 4
> are controlled by MST_2_LCLK and MST_3_LCLK. These clocks share the
> same register definitions but use different base addresses.
> 
> This patch adds catalog support to enable programming of these blocks.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  82 ++++++++++++++++++---
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  24 ++++++-
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 138 ++++++++++++++++++++++++++++++------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |   4 +-
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  14 ++++
>  6 files changed, 230 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index b8b6a09966aed96f705bdd54cb16ea63e5f0141f..608a1a077301b2ef3c77c271d873bb4364abe779 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -118,6 +118,8 @@ struct msm_dp_ctrl_private {
>  	struct msm_dp_link *link;
>  	void __iomem *ahb_base;
>  	void __iomem *link_base;
> +	void __iomem *mst2link_base;
> +	void __iomem *mst3link_base;
>  
>  	struct phy *phy;
>  
> @@ -172,6 +174,40 @@ static inline void msm_dp_write_link(struct msm_dp_ctrl_private *ctrl,
>  	writel(data, ctrl->link_base + offset);
>  }
>  
> +static inline u32 msm_dp_read_mstlink(struct msm_dp_ctrl_private *ctrl,
> +				       enum msm_dp_stream_id stream_id, u32 offset)
> +{
> +	switch (stream_id) {
> +	case DP_STREAM_2:
> +		return readl_relaxed(ctrl->mst2link_base + offset);
> +	case DP_STREAM_3:
> +		return readl_relaxed(ctrl->mst3link_base + offset);
> +	default:
> +		DRM_ERROR("error stream_id\n");
> +		return 0;

I'd totally prefer having a single set of wrappers which can handle all
4 streams. Having separate call sequences is not a good idea and it
makes it hard to change / extend it.

> +	}
> +}
> +
> +static inline void msm_dp_write_mstlink(struct msm_dp_ctrl_private *ctrl,
> +			       enum msm_dp_stream_id stream_id, u32 offset, u32 data)
> +{
> +	/*
> +	 * To make sure link reg writes happens before any other operation,
> +	 * this function uses writel() instread of writel_relaxed()
> +	 */
> +	switch (stream_id) {
> +	case DP_STREAM_2:
> +		writel(data, ctrl->mst2link_base + offset);
> +		break;
> +	case DP_STREAM_3:
> +		writel(data, ctrl->mst3link_base + offset);
> +		break;
> +	default:
> +		DRM_ERROR("error stream_id\n");
> +		break;
> +	}
> +}
> +
>  static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
>  					struct msm_dp_link_info *link)
>  {
> @@ -386,7 +422,11 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>  	u32 config = 0, tbd;
>  	u32 reg_offset = 0;
>  
> -	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
> +	if (msm_dp_panel->stream_id < DP_STREAM_2)
> +		config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
> +
> +	if (msm_dp_panel->stream_id == DP_STREAM_1)
> +		reg_offset = REG_DP1_CONFIGURATION_CTRL - REG_DP_CONFIGURATION_CTRL;
>  
>  	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>  		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
> @@ -401,8 +441,11 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>  
>  	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
>  
> -	if (msm_dp_panel->stream_id == DP_STREAM_1)
> -		reg_offset = REG_DP1_CONFIGURATION_CTRL - REG_DP_CONFIGURATION_CTRL;
> +	if (msm_dp_panel->stream_id > DP_STREAM_1)
> +		msm_dp_write_mstlink(ctrl, msm_dp_panel->stream_id,
> +			REG_DP_MSTLINK_CONFIGURATION_CTRL, config);
> +	else
> +		msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL + reg_offset, config);
>  }
>  
>  static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)

[...]

> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 43a9ce0539906e1f185abf250fdf161e462d9645..a806d397ff9d9ad3830b1f539614bffcc955a786 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -142,6 +142,7 @@
>  
>  #define REG_DP_CONFIGURATION_CTRL		(0x00000008)
>  #define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
> +#define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)

Please don't mix registers from different register spaces, it's
confusing.

>  #define DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK	(0x00000001)
>  #define DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN (0x00000002)
>  #define DP_CONFIGURATION_CTRL_P_INTERLACED	(0x00000004)
> @@ -163,12 +164,19 @@
>  #define REG_DP1_SOFTWARE_MVID			(0x00000414)
>  #define REG_DP1_SOFTWARE_NVID			(0x00000418)
>  #define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
> +#define REG_MSTLINK_SOFTWARE_MVID		(0x00000040)
> +#define REG_MSTLINK_SOFTWARE_NVID		(0x00000044)
> +#define REG_DP_MSTLINK_TOTAL_HOR_VER		(0x00000048)
>  #define REG_DP_START_HOR_VER_FROM_SYNC		(0x00000020)
> +#define REG_DP_MSTLINK_START_HOR_VER_FROM_SYNC	(0x0000004C)
>  #define REG_DP_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000024)
> +#define REG_DP_MSTLINK_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000050)
>  #define REG_DP_ACTIVE_HOR_VER			(0x00000028)
> +#define REG_DP_MSTLINK_ACTIVE_HOR_VER		(0x00000054)
>  
>  #define REG_DP_MISC1_MISC0			(0x0000002C)
>  #define REG_DP1_MISC1_MISC0			(0x0000042C)
> +#define REG_DP_MSTLINK_MISC1_MISC0		(0x00000058)
>  #define DP_MISC0_SYNCHRONOUS_CLK		(0x00000001)
>  #define DP_MISC0_COLORIMETRY_CFG_SHIFT		(0x00000001)
>  #define DP_MISC0_TEST_BITS_DEPTH_SHIFT		(0x00000005)
> @@ -236,9 +244,11 @@
>  
>  #define MMSS_DP_SDP_CFG				(0x00000228)
>  #define MMSS_DP1_SDP_CFG			(0x000004E0)
> +#define MMSS_DP_MSTLINK_SDP_CFG		(0x0000010c)
>  #define GEN0_SDP_EN				(0x00020000)
>  #define MMSS_DP_SDP_CFG2			(0x0000022C)
>  #define MMSS_DP1_SDP_CFG2			(0x000004E4)
> +#define MMSS_DP_MSTLINK_SDP_CFG2		(0x0000011c)
>  #define MMSS_DP_AUDIO_TIMESTAMP_0		(0x00000230)
>  #define MMSS_DP_AUDIO_TIMESTAMP_1		(0x00000234)
>  #define GENERIC0_SDPSIZE_VALID			(0x00010000)
> @@ -248,6 +258,7 @@
>  
>  #define MMSS_DP_SDP_CFG3			(0x0000024c)
>  #define MMSS_DP1_SDP_CFG3			(0x000004E8)
> +#define MMSS_DP_MSTLINK_SDP_CFG3		(0x00000114)
>  #define UPDATE_SDP				(0x00000001)
>  
>  #define MMSS_DP_EXTENSION_0			(0x00000250)
> @@ -297,6 +308,9 @@
>  #define MMSS_DP_GENERIC1_8			(0x00000348)
>  #define MMSS_DP_GENERIC1_9			(0x0000034C)
>  #define MMSS_DP1_GENERIC0_0			(0x00000490)
> +#define MMSS_DP_MSTLINK_GENERIC0_0		(0x000000BC)
> +#define MMSS_DP_MSTLINK_GENERIC0_1		(0x000000C0)
> +#define MMSS_DP_MSTLINK_GENERIC0_2		(0x000000C4)
>  
>  #define MMSS_DP_VSCEXT_0			(0x000002D0)
>  #define MMSS_DP_VSCEXT_1			(0x000002D4)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

