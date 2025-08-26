Return-Path: <linux-arm-msm+bounces-70945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8B0B3723F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 20:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 132D83664D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 18:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0835C2EA170;
	Tue, 26 Aug 2025 18:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rtyrd4Mo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F079D2A1CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756233109; cv=none; b=GtQ+6Z8uuifS9ye9nvAQ9pwtMz439G63eZ6EbhpgDANS/rMLJaS/4Nw0/iMCu7TMODfkDWKPxnMwBZdhNEksP866jfRwJoP4sf3Vs1GqVHEstabqE6CIDuHgdwvEYEn9hLAF89emc0ueZwYEF4uXbJve/JYB2eqHzSNm+ukbxBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756233109; c=relaxed/simple;
	bh=ZHnMC0Y57lM5boOv2yMjvh/1zcKkAYsztp2TFRXyVpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTZpIvUWu19g//71V+SWVXyQWyivZUV4ke8mwBNYZ6Z5iLGS/hN/8VfBaeLl7f7IuWkO1C/WYTC+nC77pAWIVsMNzjc1hGoJ3tvzWvlYMXweyUF6kBRZ8fRmLW/jdPdEj6rWOmtPKJVR83TIg5Cx1GywhT3/vhTPjGXQRXF0frM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rtyrd4Mo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QCKrEw010931
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EyFSf9HDqT3GLT8ygjPbgADY
	2vJYcyFG+EDnXY5XHPE=; b=Rtyrd4Mo+8CSL71yOrMiQwcgytWQvMYshtVjZnZM
	AeH9JgPETNvVwuTigP6MgWOMBkNhJ9PtohFxATioQA7c9xgbGrKG3u7hc3Ocdjsc
	Mb5wynXkUaFEs8SupJMNuKZwNyhILv6YNqH9//AqhCNBhM0R3lDBAn9+TCtiFU06
	dOiCJFWOhgBMU2Bho16XGAVQXNFLfTDUiaAjausq2bwGi+p89wkXTZ7WmkD/fMvQ
	FeUW5O0awUrfApsUnAgY66Y+tieJidnVxPUQ/5Lxmuqa/E91O/gM6mLbLC5bqf8D
	mTRWLgRXAjQKRTKo8vWX/z6cfpn2VKkYcXP6i1Ff5sdsfA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unsvhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:31:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b2d2cbbf9cso54333011cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 11:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756233106; x=1756837906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyFSf9HDqT3GLT8ygjPbgADY2vJYcyFG+EDnXY5XHPE=;
        b=NI14qxoXcf5KZ9UiZfDjkJtCBTpNvrE23B8fxUYRmuxY5P/chK/LmM1K/g1+eR3kPQ
         MMNyFiWqZ/i+XjuFfIBIzGR4wgPzpfgHADLgDqFRZAKdyhBS47HfiYkDpCTTNMYNvh0v
         a/K3aCwqoauNwk+ERSFde+3tNh+NtS582+FXF8aukDl/dmrVJRbEs9WU9g4jRkjr3Psg
         a0I+phLaPDxvccaWDmgFgAahvDp9+h0voMUbalMzECwHFvJfJNpDhrhHdM8Th+eerliW
         h2hTVfjiFdZPHmux66k/IIaXzi5SuJeoBVUttMHgq9e4V5qh30/IukFLwvFNaBwhbai7
         MuFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtQbSIWIpFG2l06RQ5enOCeUgt+Zfi3OCMuMAsPZbAmqX5TeKpJMDItxrSnj2liUzti8mR9T2O9jnXmHYh@vger.kernel.org
X-Gm-Message-State: AOJu0YxjEWQhvfn4DeUXBnlxvWAlBcEa9m+9NmC/DMbY5JW93vPBDS3M
	Gwy65T+yJtTiE0YLPKeL1idw2f+NluOkxD4rCumhsFDgdh49sRLxaTfT/GKGPAT4bT6apyX/eQD
	ZTDgViFVTy5FBoXS9LtJLNr54z0NWKjS88FJG07+wctfgiUG2UVzq8rV2BANbycRRC2Q/
X-Gm-Gg: ASbGncuvEDRCh+c2pn5Iz34TpGnjvN9dgGbunt/wijF2CZRJdvwrmdMCJ3qYNSw7KcZ
	3gC8JEtcAgs1vAk/tf4ChRprHEfk7i0KRjn3i2M40f0FwobAU1Z9pi0oJmeofGqPoIDvCMRg36E
	50Riu0OIkOF9zTEUWEhvLMvSBgS8glUyXhFJ/CNPTmVSGH0JbRQWg8XGfSHnFtKUQGU9lXq6sQP
	W/OtkzCjyYvJt58Tu7jhlbjYFnOnZOp77dDzexk3OjVna1sBsnqvXifsUGPUbIhZ9prdCEUtZq8
	DJgAxFxm9GknS8GO8Krr2oVJH3nU1SJ/hTowWXfyCo0ihijISer6n+8QFxYRLeKAMUa336V0FfG
	PSbzZ0P+5aEAdlBagGeogLd0BoivNvjY9rpw9xKIUdiuxG3OzlWKE
X-Received: by 2002:a05:622a:4817:b0:4b2:c78d:d07b with SMTP id d75a77b69052e-4b2c78dd273mr73820791cf.1.1756233105844;
        Tue, 26 Aug 2025 11:31:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8yFFVfAbYYxd/qTQk86OaQGlYinW8rFfhPOA/rMzCZZ2PzCCcTyKIFzRln1H9fLkUK3kglg==
X-Received: by 2002:a05:622a:4817:b0:4b2:c78d:d07b with SMTP id d75a77b69052e-4b2c78dd273mr73820291cf.1.1756233105129;
        Tue, 26 Aug 2025 11:31:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c1c32esm2441060e87.63.2025.08.26.11.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 11:31:44 -0700 (PDT)
Date: Tue, 26 Aug 2025 21:31:42 +0300
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
Subject: Re: [PATCH v3 30/38] drm/msm/dp: add connector abstraction for DP MST
Message-ID: <x72v67fsgmekfeebasggtiaofwlxw6ikqch4lxkrryior3yxxk@xiiw75bnj37p>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-30-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-30-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-GUID: 1pX-l9ImFCAq1MiJoDij_QSTxq5d7fjV
X-Proofpoint-ORIG-GUID: 1pX-l9ImFCAq1MiJoDij_QSTxq5d7fjV
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68adfd92 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=BYdbQh0Jf_UrhektqZAA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX27Ss+YTBgHTM
 BQcgkHykB2GhbHt4xLwyzrp4xnZBcrb69wDPBh6/uX5OLHDN/qOlpycGtJhSwgFL+GkK4HDL79U
 gzd++f9HDhMY1QnddrJLgFhH1rSBKPvlIuVpJLFm26qg9oGo+pBd57FBgPbEpV23+KLhHxcXmA3
 MLihflsypJ8QeIUAAkFamlwYTqag6EVxzXSUjERbfiGE9R9vaW0GKKOixMzx87QWYpxlPlpvFn8
 ndHyOxVO1z5QSZmd1foEViXPS22hAX+VZOnQ0TkdaMZIbzBbKwe4gl2JA5dvPCO0v/gEwXqNLt3
 n9IWaakM3FsjeuZhDpaZp/uhlDsHLkHU9MFJ7tvg6V8Azh31k9Lk10mlnJSDJRvS1Esfzpi5wDm
 V2CIU2mh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031

On Mon, Aug 25, 2025 at 10:16:16PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add connector abstraction for the DP MST. Each MST encoder
> is connected through a DRM bridge to a MST connector and each
> MST connector has a DP panel abstraction attached to it.

What's the functionality split between the connector and bridge? Please
explain it here. Do we really need a bridge if we have a non-trivial
connector implementation?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 391 +++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
>  2 files changed, 393 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> index 73de29136801ef5f45e0b2d09280fe113021b68c..b4f640134af544c77ab262d2cbe0b67e1e2e1b3a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -25,6 +25,8 @@
>   * OF THIS SOFTWARE.
>   */
>  
> +#include <drm/drm_edid.h>
> +#include <drm/drm_managed.h>
>  #include "dp_mst_drm.h"
>  
>  #define to_msm_dp_mst_bridge(x)     container_of((x), struct msm_dp_mst_bridge, base)
> @@ -525,7 +527,6 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct drm_encoder *en
>  
>  	dev = dp_display->drm_dev;
>  	bridge->display = dp_display;
> -	bridge->base.funcs = &msm_dp_mst_bridge_ops;
>  	bridge->base.encoder = encoder;
>  	bridge->base.type = dp_display->connector_type;
>  	bridge->base.ops = DRM_BRIDGE_OP_MODES;
> @@ -554,3 +555,391 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct drm_encoder *en
>  end:
>  	return rc;
>  }
> +
> +static struct msm_dp_mst_bridge_state *msm_dp_mst_br_priv_state(struct drm_atomic_state *st,
> +								struct msm_dp_mst_bridge *bridge)
> +{
> +	struct drm_device *dev = bridge->base.dev;
> +	struct drm_private_state *obj_state = drm_atomic_get_private_obj_state(st, &bridge->obj);
> +
> +	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
> +
> +	return to_msm_dp_mst_bridge_state_priv(obj_state);
> +}
> +
> +/* DP MST Connector OPs */
> +static int
> +msm_dp_mst_connector_detect(struct drm_connector *connector,
> +			    struct drm_modeset_acquire_ctx *ctx,
> +			    bool force)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +	struct msm_dp *dp_display = mst_conn->msm_dp;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	enum drm_connector_status status = connector_status_disconnected;
> +
> +	if (drm_connector_is_unregistered(&mst_conn->connector))
> +		return status;

Can detect be called for unregistered connector?

> +
> +	if (dp_display->link_ready && dp_display->mst_active)
> +		status = drm_dp_mst_detect_port(connector,
> +						ctx, &mst->mst_mgr, mst_conn->mst_port);

I think this should be wrapped in the pm_runtime calls.

> +
> +	drm_dbg_dp(dp_display->drm_dev, "conn:%d status:%d\n", connector->base.id, status);

Do we need this?

> +
> +	return status;
> +}
> +
> +static int msm_dp_mst_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +	struct msm_dp *dp_display = mst_conn->msm_dp;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	const struct drm_edid *drm_edid;
> +
> +	if (drm_connector_is_unregistered(&mst_conn->connector))
> +		return drm_edid_connector_update(connector, NULL);

Is there a need for this? I don't see a check in nouveau code.

> +
> +	drm_edid = drm_dp_mst_edid_read(connector, &mst->mst_mgr, mst_conn->mst_port);
> +	drm_edid_connector_update(connector, drm_edid);
> +
> +	return drm_edid_connector_add_modes(connector);
> +}
> +
> +static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
> +							    const struct drm_display_mode *mode)
> +{
> +	struct msm_dp_mst_connector *mst_conn;
> +	struct msm_dp *dp_display;
> +	struct drm_dp_mst_port *mst_port;
> +	struct msm_dp_panel *dp_panel;
> +	struct msm_dp_mst *mst;
> +	struct msm_dp_mst_bridge_state *mst_bridge_state;
> +	u16 full_pbn, required_pbn;
> +	int i, active_enc_cnt = 0;
> +
> +	if (drm_connector_is_unregistered(connector))
> +		return 0;
> +
> +	mst_conn = to_msm_dp_mst_connector(connector);
> +	dp_display = mst_conn->msm_dp;
> +	mst = dp_display->msm_dp_mst;
> +	mst_port = mst_conn->mst_port;
> +	dp_panel = mst_conn->dp_panel;
> +
> +	if (!dp_panel || !mst_port)
> +		return MODE_ERROR;
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		mst_bridge_state = to_msm_dp_mst_bridge_state(mst->mst_bridge[i]);
> +		if (mst_bridge_state->connector &&
> +		    mst_bridge_state->connector != connector)
> +			active_enc_cnt++;
> +	}
> +
> +	if (active_enc_cnt < DP_STREAM_MAX)
> +		full_pbn = mst_port->full_pbn;
> +	else {
> +		DRM_ERROR("all MST streams are active\n");
> +		return MODE_BAD;

And if the stream becomes unused, who will call the mode_valid? This
callback should validate if the mode can be enabled at all, not taking
care about other MST streams, connectors, etc. If the user overcommits,
e.g. by selecting 4 8K modes, then atomic_check() will fail, but it
still should be possible to disable all other connectors and get the max
mode supported here.

> +	}
> +
> +	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (connector->display_info.bpc * 3) << 4);

You should not be using connector's BPC here. It can be lowered to fit
the mode. It should be (6 * 3) << 4

> +
> +	if (required_pbn > full_pbn) {


> +		drm_dbg_dp(dp_display->drm_dev, "mode:%s not supported. pbn %d vs %d\n",
> +			   mode->name, required_pbn, full_pbn);
> +		return MODE_BAD;

MODE_CLOCK_HIGH

> +	}
> +
> +	return msm_dp_display_mode_valid(dp_display, &dp_panel->connector->display_info, mode);
> +}
> +
> +static struct drm_encoder *
> +msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_state *state)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +	struct msm_dp *dp_display = mst_conn->msm_dp;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	struct drm_encoder *enc = NULL;
> +	struct msm_dp_mst_bridge_state *mst_bridge_state;
> +	u32 i;
> +	struct drm_connector_state *conn_state = drm_atomic_get_new_connector_state(state,
> +										    connector);
> +
> +	if (conn_state && conn_state->best_encoder)
> +		return conn_state->best_encoder;
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		mst_bridge_state = msm_dp_mst_br_priv_state(state, mst->mst_bridge[i]);
> +		if (IS_ERR(mst_bridge_state))
> +			goto end;
> +
> +		if (mst_bridge_state->connector == connector) {
> +			enc = mst->mst_bridge[i]->encoder;
> +			goto end;
> +		}
> +	}
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		mst_bridge_state = msm_dp_mst_br_priv_state(state, mst->mst_bridge[i]);
> +
> +		if (!mst_bridge_state->connector) {
> +			mst_bridge_state->connector = connector;
> +			mst_bridge_state->msm_dp_panel = mst_conn->dp_panel;
> +			enc = mst->mst_bridge[i]->encoder;
> +			break;
> +		}
> +	}
> +
> +end:
> +	if (enc)
> +		drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic best encoder:%d\n",
> +			   connector->base.id, i);
> +	else
> +		drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic best encoder failed\n",
> +			   connector->base.id);
> +
> +	return enc;
> +}
> +
> +static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
> +					     struct drm_atomic_state *state)
> +{
> +	int rc = 0, slots;
> +	struct drm_connector_state *old_conn_state;
> +	struct drm_connector_state *new_conn_state;
> +	struct drm_crtc *old_crtc;
> +	struct drm_crtc_state *crtc_state;
> +	struct msm_dp_mst_bridge *bridge;
> +	struct msm_dp_mst_bridge_state *mst_bridge_state;
> +	struct drm_bridge *drm_bridge;
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +	struct msm_dp *dp_display = mst_conn->msm_dp;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	struct drm_dp_mst_atomic_payload *payload;
> +	struct drm_dp_mst_topology_state *mst_state;
> +
> +	if (!state)
> +		return rc;
> +
> +	new_conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	if (!new_conn_state)
> +		return rc;
> +
> +	old_conn_state = drm_atomic_get_old_connector_state(state, connector);
> +	if (!old_conn_state)
> +		goto end;
> +
> +	old_crtc = old_conn_state->crtc;
> +	if (!old_crtc)
> +		goto end;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, old_crtc);
> +
> +	/* attempt to release vcpi slots on a modeset change for crtc state */
> +	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> +		if (WARN_ON(!old_conn_state->best_encoder)) {
> +			rc = -EINVAL;
> +			goto end;
> +		}
> +
> +		drm_bridge = drm_bridge_chain_get_first_bridge(old_conn_state->best_encoder);

Why do we have it here rather than in bridge's atomic_check?

> +		if (WARN_ON(!drm_bridge)) {
> +			rc = -EINVAL;
> +			goto end;
> +		}
> +		bridge = to_msm_dp_mst_bridge(drm_bridge);
> +
> +		mst_bridge_state = msm_dp_mst_br_priv_state(state, bridge);
> +
> +		mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);
> +	
> +		payload = drm_atomic_get_mst_payload_state(mst_state, mst_conn->mst_port);
> +
> +		slots = payload->time_slots;
> +		if (slots > 0) {
> +			rc = drm_dp_atomic_release_time_slots(state,
> +							      &mst->mst_mgr,
> +							      mst_conn->mst_port);
> +			if (rc) {
> +				DRM_ERROR("failed releasing %d vcpi slots %d\n", slots, rc);
> +				goto end;
> +			}
> +		}
> +
> +		if (!new_conn_state->crtc) {
> +			/* for cases where crtc is not disabled the slots are not
> +			 * freed by drm_dp_atomic_release_time_slots. this results
> +			 * in subsequent atomic_check failing since internal slots
> +			 * were freed but not the DP MST mgr's
> +			 */
> +			mst_bridge_state->num_slots = 0;
> +			mst_bridge_state->connector = NULL;
> +			mst_bridge_state->msm_dp_panel = NULL;
> +
> +			drm_dbg_dp(dp_display->drm_dev, "clear best encoder: %d\n", bridge->id);
> +		}
> +	}
> +
> +end:
> +	drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic check ret %d\n",
> +		   connector->base.id, rc);
> +	return rc;
> +}
> +
> +static void dp_mst_connector_destroy(struct drm_connector *connector)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +
> +	drm_connector_cleanup(connector);
> +	drm_dp_mst_put_port_malloc(mst_conn->mst_port);
> +	kfree(mst_conn);
> +}
> +
> +/* DRM MST callbacks */
> +static const struct drm_connector_helper_funcs msm_dp_drm_mst_connector_helper_funcs = {
> +	.get_modes =    msm_dp_mst_connector_get_modes,
> +	.detect_ctx =   msm_dp_mst_connector_detect,
> +	.mode_valid =   msm_dp_mst_connector_mode_valid,
> +	.atomic_best_encoder = msm_dp_mst_atomic_best_encoder,
> +	.atomic_check = msm_dp_mst_connector_atomic_check,
> +};
> +
> +static const struct drm_connector_funcs msm_dp_drm_mst_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.destroy = dp_mst_connector_destroy,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static struct drm_connector *
> +msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
> +			 struct drm_dp_mst_port *port, const char *pathprop)
> +{
> +	struct msm_dp_mst *dp_mst;
> +	struct drm_device *dev;
> +	struct msm_dp *dp_display;
> +	struct msm_dp_mst_connector *mst_conn;
> +	struct drm_connector *connector;
> +	int rc, i;
> +
> +	dp_mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
> +
> +	dp_display = dp_mst->msm_dp;
> +	dev = dp_display->drm_dev;
> +
> +	mst_conn = kzalloc(sizeof(*mst_conn), GFP_KERNEL);
> +
> +	if (!mst_conn)
> +		return NULL;
> +
> +	drm_modeset_lock_all(dev);
> +
> +	connector = &mst_conn->connector;
> +	rc = drm_connector_dynamic_init(dev, connector,
> +					&msm_dp_drm_mst_connector_funcs,
> +					DRM_MODE_CONNECTOR_DisplayPort, NULL);
> +	if (rc) {
> +		kfree(mst_conn);
> +		drm_modeset_unlock_all(dev);
> +		return NULL;
> +	}
> +
> +	mst_conn->dp_panel = msm_dp_display_get_panel(dp_display);
> +	if (!mst_conn->dp_panel) {
> +		DRM_ERROR("failed to get dp_panel for connector\n");
> +		kfree(mst_conn);
> +		drm_modeset_unlock_all(dev);
> +		return NULL;
> +	}
> +
> +	mst_conn->dp_panel->connector = connector;
> +	mst_conn->msm_dp = dp_display;
> +
> +	drm_connector_helper_add(connector, &msm_dp_drm_mst_connector_helper_funcs);
> +
> +	if (connector->funcs->reset)
> +		connector->funcs->reset(connector);
> +
> +	/* add all encoders as possible encoders */
> +	for (i = 0; i < dp_mst->max_streams; i++) {
> +		rc = drm_connector_attach_encoder(connector, dp_mst->mst_bridge[i]->encoder);
> +
> +		if (rc) {
> +			DRM_ERROR("failed to attach encoder to connector, %d\n", rc);
> +			kfree(mst_conn);
> +			drm_modeset_unlock_all(dev);
> +			return NULL;
> +		}
> +	}
> +
> +	mst_conn->mst_port = port;
> +	drm_dp_mst_get_port_malloc(mst_conn->mst_port);
> +
> +	drm_object_attach_property(&connector->base,
> +				   dev->mode_config.path_property, 0);

Where do we set the property then?

> +	drm_object_attach_property(&connector->base,
> +				   dev->mode_config.tile_property, 0);
> +
> +	drm_modeset_unlock_all(dev);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "add MST connector id:%d\n", connector->base.id);
> +
> +	return connector;
> +}
> +
> +static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
> +	.add_connector = msm_dp_mst_add_connector,

No .poll_hpd_irq ?

> +};
> +
> +int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux)
> +{
> +	struct drm_device *dev;
> +	int conn_base_id = 0;
> +	int ret;
> +	struct msm_dp_mst *msm_dp_mst;
> +
> +	if (!dp_display) {
> +		DRM_ERROR("invalid params\n");
> +		return 0;
> +	}

Can't we just trust the driver?

> +
> +	dev = dp_display->drm_dev;
> +
> +	msm_dp_mst = devm_kzalloc(dev->dev, sizeof(*msm_dp_mst), GFP_KERNEL);
> +	if (!msm_dp_mst)
> +		return -ENOMEM;
> +
> +	memset(&msm_dp_mst->mst_mgr, 0, sizeof(msm_dp_mst->mst_mgr));
> +	msm_dp_mst->mst_mgr.cbs = &msm_dp_mst_drm_cbs;
> +	conn_base_id = dp_display->connector->base.id;
> +	msm_dp_mst->msm_dp = dp_display;
> +	msm_dp_mst->max_streams = max_streams;
> +
> +	for (int i = 0; i < DP_STREAM_MAX; i++) {
> +		msm_dp_mst->mst_bridge[i] = devm_drm_bridge_alloc(dev->dev,
> +						struct msm_dp_mst_bridge, base,
> +						&msm_dp_mst_bridge_ops);

This should have been a part of the previous patch.

> +	}
> +
> +	msm_dp_mst->dp_aux = drm_aux;
> +
> +	ret = drm_dp_mst_topology_mgr_init(&msm_dp_mst->mst_mgr, dev,
> +					   drm_aux,
> +					   MAX_DPCD_TRANSACTION_BYTES,
> +					   max_streams,
> +					   conn_base_id);
> +	if (ret) {
> +		DRM_ERROR("DP DRM MST topology manager init failed\n");
> +		return ret;
> +	}
> +
> +	dp_display->msm_dp_mst = msm_dp_mst;
> +
> +	mutex_init(&msm_dp_mst->mst_lock);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "DP DRM MST topology manager init completed\n");

Why do we need so many debug messages? They make the log overspammed and
hard to follow.

> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> index d75731ca2e5870377026e8ad1057bdcc5f0d4c78..1484fabd92ad0075eac5369aac8ca462acbd3eda 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> @@ -70,6 +70,7 @@ struct msm_dp_mst {
>  	struct drm_dp_mst_topology_mgr mst_mgr;
>  	struct msm_dp_mst_bridge *mst_bridge[DP_STREAM_MAX];
>  	struct msm_dp *msm_dp;
> +	struct drm_dp_aux *dp_aux;
>  	u32 max_streams;
>  	struct mutex mst_lock;
>  };
> @@ -83,4 +84,6 @@ struct msm_dp_mst_connector {
>  
>  int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
>  
> +int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
> +
>  #endif /* _DP_MST_DRM_H_ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

