Return-Path: <linux-arm-msm+bounces-40901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4D99E8455
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 09:54:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68858165558
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 08:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33AA1386DA;
	Sun,  8 Dec 2024 08:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H9feth1F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975B07F7FC
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 08:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733648069; cv=none; b=t1KXMcxISVYAllxk6P0JCBpuwb543lUhGg505rBWtMzekFh//IWIETW16aVjtr4mzGoUe3ihLHFZGLW+r4W8+aiHMrmHR36vPghb7yIKC1pA+1poxIEV3xtUUQpsa23EpWqtQu2xyXWAdhCqlIxjPUszlmvpdpUxBBrfxZedDMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733648069; c=relaxed/simple;
	bh=XdOxOGq7Oxv91ZOrU2z4fULdCkCR7zf70r7haq6YY9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbX+ildMfEMX0bKkvUpGNnZLWKqFXtYyhhle/cfAwPjDO6Jgp2NywfPI7MtuxhmS7+95Hwtxt3/01hxvrWPk4z1y4RPiJ0HpRyJhYaHZ3J9XfXDIAyeuLFLx0AadNVYDvwwRJpr/ZIHXRj6Hj8ZkYabRiu/Adpha9m3puj95tL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H9feth1F; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so286767e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Dec 2024 00:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733648066; x=1734252866; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h+wYH3NLtKDcllQeZE+7GVIO6KpUPzEiP96cJ5YgJ1Q=;
        b=H9feth1FqzPDtRvRwLjHEqbzjqwX3gFVcX8H0sHDbTR6qZi/HvuMQ9NmVSDh95vrNB
         9h37oWWSAqKyIHiIvj8WKv+M4eNveCcA0HbzZAM6p1hSVg29zqbbz5eccRIo5eNbwM8u
         HRVOwK63nJfKhfVa63lTTfiPoWR0C2gXvg5wxcpS3rzlpk0zfDS6fAACF087mmvL0Rph
         MvW6fqAt6JCXGGjv9NgJ4s+127SdcQ/dMfMxy+Y6Ogfm63Kbxt44iy7fIKbx4XfRcyES
         VzL37Z/U2LfcRMzFBoBbzXD6PODGfmeY4HHAv2fBINDwL2ZEdrPFOt7OJJ1wUM6H2r9+
         yUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733648066; x=1734252866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+wYH3NLtKDcllQeZE+7GVIO6KpUPzEiP96cJ5YgJ1Q=;
        b=GLbjs9hZBhsMugIcbKOfj1lh4x2oxBKB/DAiItQIL1MVfo8e9t914/psM5cu4G3dsT
         bi4667OKDCP8jvlaDJVZYWcu/puud/RYPBmW8JpI1SuGiKpZLI8dH5kIh40ZnRy4O0MX
         vzt8TXmjzCGxgAZzIr9WBlE925wfonrXiL9Q88wSFq0MiStHvhy4zZmGb2WVDoay/6zc
         Cmz8k+Sx7IoqV3Mb7ZKbZUdRrfSa6YHAwC8QDnKubCr7nnGm/G+CUEpMkTew5hokuyVP
         NCUkm23hdhUbHZ+W9saNmClnuSV25rRx1WNBgabFdNhP3Jk2f7dWLnM15OdJfLHd3gk3
         SeWw==
X-Forwarded-Encrypted: i=1; AJvYcCUYgn/TL5rtX99oHimss+zGs45xVtmn0apW+w1wBxW95pu26op3XZgqTDgyQOb2IK8RdKKaEa+rVChrw2Mn@vger.kernel.org
X-Gm-Message-State: AOJu0YxgpnzhuU8/Lq54ozUT5EUBvTNSEyrTZ8Ws6ceqjSwYlJz5mBD0
	n0LFiS93Mds9mAzOGJYOMqNZOJvTjWU6mcpdCDVYHibMPFNh1knQp4Z7e8A5Ioc=
X-Gm-Gg: ASbGncv9DLBiTgj/rrd0WwuzGZkuGuDm551wSdlBUyotIWAr/nS7Ci4k7bMOX+FyolE
	OaiIEujqbYY1f351f3HFn7rCsOQ/a3RKo8vKNN39lUkbNSabvKJdjFDoss1RNIu+9Jzd0kxyKJO
	K6h86H3m3+LUYlBDzorychJxt9TFq9xlBLwv+KF+1o9EFBhwmqHl995RlwWajnv+3xH7md5eOq2
	CoI+BK0N41bO/rQKP7viXLycHzBhcXR2Q8J2QTeN4AfsEM2hrPJlAKBajlFC8fYX1H7nCzFdZqr
	q6msszTazIaQJ7M/oxnUwxXj99+fmw==
X-Google-Smtp-Source: AGHT+IEwD9OdVC1tUP2ZvsB+PkxO3Q1PwQvsQ272fZrOTDr4N5TQbKxsqYd1nLpVdaFhkndKO0vNWg==
X-Received: by 2002:a05:6512:3a82:b0:53e:2b77:9f04 with SMTP id 2adb3069b0e04-53e2c2b5ce3mr2772826e87.17.1733648065669;
        Sun, 08 Dec 2024 00:54:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e94f77f3fsm385463e87.217.2024.12.08.00.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 00:54:24 -0800 (PST)
Date: Sun, 8 Dec 2024 10:54:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 35/45] drm/msm/dp: add a mst session mutex to protect
 bridge ops
Message-ID: <nmrzydtcn4d3imhanxbvrmydvavarckcck3we5phzimd7l332z@gqfencrtaksn>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-35-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-35-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:32:06PM -0800, Abhinav Kumar wrote:
> To protect against concurrent access of the dp mst bridges
> introduce a session mutex.

Why is it necessary? What kind of concurrent access is expected?

Why wasn't it introduced together with struct msm_dp_mst?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 20 ++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> index 15c61fd37c418889074222c0f576778adadf51c9..313eb63b9a35cbbb36db2d7d8f0a85e4441f2998 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -344,6 +344,7 @@ static void msm_dp_mst_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
>  	struct msm_dp_mst_bridge *bridge;
>  	struct msm_dp *dp;
>  	struct msm_dp_mst_bridge_state *msm_dp_bridge_state;
> +	struct msm_dp_mst *dp_mst;
>  
>  	if (!drm_bridge) {
>  		DRM_ERROR("Invalid params\n");
> @@ -353,6 +354,7 @@ static void msm_dp_mst_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
>  	bridge = to_msm_dp_mst_bridge(drm_bridge);
>  	msm_dp_bridge_state = to_msm_dp_mst_bridge_state(bridge);
>  	dp = bridge->display;
> +	dp_mst = dp->msm_dp_mst;
>  
>  	/* to cover cases of bridge_disable/bridge_enable without modeset */
>  	bridge->connector = msm_dp_bridge_state->connector;
> @@ -363,12 +365,14 @@ static void msm_dp_mst_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
>  		return;
>  	}
>  
> +	mutex_lock(&dp_mst->mst_lock);
>  	msm_dp_display_atomic_prepare(dp);
>  
>  	rc = _msm_dp_mst_bridge_pre_enable_part1(bridge, old_bridge_state);
>  	if (rc) {
>  		DRM_ERROR("[%d] DP display pre-enable failed, rc=%d\n", bridge->id, rc);
>  		msm_dp_display_unprepare(dp);
> +		mutex_unlock(&dp_mst->mst_lock);
>  		return;
>  	}
>  
> @@ -381,6 +385,8 @@ static void msm_dp_mst_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
>  		   drm_mode_vrefresh(&bridge->drm_mode),
>  		   bridge->vcpi, bridge->start_slot,
>  		   bridge->start_slot + bridge->num_slots);
> +
> +	mutex_unlock(&dp_mst->mst_lock);
>  }
>  
>  static void msm_dp_mst_bridge_atomic_disable(struct drm_bridge *drm_bridge,
> @@ -388,6 +394,7 @@ static void msm_dp_mst_bridge_atomic_disable(struct drm_bridge *drm_bridge,
>  {
>  	struct msm_dp_mst_bridge *bridge;
>  	struct msm_dp *dp;
> +	struct msm_dp_mst *mst;
>  
>  	if (!drm_bridge) {
>  		DRM_ERROR("Invalid params\n");
> @@ -401,6 +408,9 @@ static void msm_dp_mst_bridge_atomic_disable(struct drm_bridge *drm_bridge,
>  	}
>  
>  	dp = bridge->display;
> +	mst = dp->msm_dp_mst;
> +
> +	mutex_lock(&mst->mst_lock);
>  
>  	_msm_dp_mst_bridge_pre_disable_part1(bridge, old_bridge_state);
>  
> @@ -410,6 +420,8 @@ static void msm_dp_mst_bridge_atomic_disable(struct drm_bridge *drm_bridge,
>  
>  	drm_dbg_dp(dp->drm_dev, "mst bridge:%d conn:%d disable complete\n", bridge->id,
>  		   DP_MST_CONN_ID(bridge));
> +
> +	mutex_unlock(&mst->mst_lock);
>  }
>  
>  static void msm_dp_mst_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
> @@ -418,6 +430,7 @@ static void msm_dp_mst_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>  	int conn = 0;
>  	struct msm_dp_mst_bridge *bridge;
>  	struct msm_dp *dp;
> +	struct msm_dp_mst *mst;
>  
>  	if (!drm_bridge) {
>  		DRM_ERROR("Invalid params\n");
> @@ -433,6 +446,9 @@ static void msm_dp_mst_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>  	conn = DP_MST_CONN_ID(bridge);
>  
>  	dp = bridge->display;
> +	mst = dp->msm_dp_mst;
> +
> +	mutex_lock(&mst->mst_lock);
>  
>  	msm_dp_display_atomic_post_disable_helper(dp, bridge->msm_dp_panel);
>  
> @@ -444,6 +460,8 @@ static void msm_dp_mst_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>  
>  	drm_dbg_dp(dp->drm_dev, "mst bridge:%d conn:%d post disable complete\n",
>  		   bridge->id, conn);
> +
> +	mutex_unlock(&mst->mst_lock);
>  }
>  
>  static void msm_dp_mst_bridge_mode_set(struct drm_bridge *drm_bridge,
> @@ -1072,6 +1090,8 @@ int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, u32 max_dpcd_tra
>  
>  	dp_display->msm_dp_mst = msm_dp_mst;
>  
> +	mutex_init(&msm_dp_mst->mst_lock);
> +
>  	msm_dp_mst->mst_initialized = true;
>  
>  	drm_dbg_dp(dp_display->drm_dev, "dp drm mst topology manager init completed\n");
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> index 5fe5dc7596086467e9a3b3d7d04a665853fbb3d7..b1adb8a61115d4809107553809206bb2ed3c6c3d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> @@ -80,6 +80,7 @@ struct msm_dp_mst {
>  	struct drm_dp_aux *dp_aux;
>  	bool mst_session_hpd_state;
>  	u32 max_streams;
> +	struct mutex mst_lock;
>  };
>  
>  struct msm_dp_mst_connector {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

