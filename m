Return-Path: <linux-arm-msm+bounces-70947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CECA1B3726D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 20:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18E318E3637
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 18:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086992264C0;
	Tue, 26 Aug 2025 18:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNh+i9om"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5164931A577
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756233805; cv=none; b=NDxl7HGU4NlNHeUjEQRW22/6EntZRPhdlVhIfoQONroayFzPbVfNKTyL4anQ7vBeMOLvKAgHqjVA90q1TKPDpgN7DOSJ24/lQjuMMtpm7KpbWHjhMG4/43/EZVE1i6dqL6PZPzobuwXgkJuP9Ffpbs2DPY9opU96si3/6jwyjIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756233805; c=relaxed/simple;
	bh=ggRaJLRo5UeUdBFtV//bF7fKUiC60pw5VhN5jconsLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvHpN8UJ3KUhbzrKAl8p65OQEfrxPcUw9SWxkBv8DPfCO8Ig20m2O3OX9cQMDlPVcB20cqrhtDH9Dvn/bDAAuUcyxZD4IRHRJ6TZ0fipNG+GkJwhBaqGaWQm5OQ1L4eN2gQCUypWVwlfwz/43DQe2FPLTkAKX8CLQlZHDKSjEhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZNh+i9om; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QFg8qe032216
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hWvpoDjNTLvT9P7wnT7Jb3O4
	DlLy2jCuWuzYdjcW+9Q=; b=ZNh+i9ome76gk3UWE/kiZNeB8GgzN0paBILqu5zt
	n8BNOSSHRRoW0YWKf3ccCJysB/6a7Z2WR4+0opjwkdIydpQCOWBWNBAzwiESsuTE
	24hg0BKO/sc3jOzUA7N2+E+zKWMX09l3GGVgvwXfJ6x6kEq3nTp7tR3ux+aCQhA9
	MhJxafW3LTm9oOuVGYSThjrSzLoQrjS1XkelLsXs6Jt5JzBxOZy5rNsQkqoqiSR4
	1Hhz45c7pi9cBsMEZb8Z2nD/7rriX3+Sji/nu/PkmLflQQm7owpVWtqo1EZM2JTG
	1R0HxQKZwz4616BUyfeFF6ccL9EhfRreS03hwIUJZv9xPA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfj10s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 18:43:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7f73235c84dso9683785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 11:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756233802; x=1756838602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWvpoDjNTLvT9P7wnT7Jb3O4DlLy2jCuWuzYdjcW+9Q=;
        b=lnOq01EkWFy7qVaK7afAj6iYN9iXbSd+pWsITXfbzQkwwh8l23oWU/0KhJHfEiEzIL
         o2m6EFtygt5FikCLSCGE6gFnsKeH4AmAeO6RECotIh4jsaH7yMq9/+XY+5FzOqyqVqL0
         05KDFeYQbAQuqT5ESWMTZkdg9QyJEtY3MTXSZjXuxeB9oYXrUxL164XT3MwTSmGR/Lk4
         MAoyteF3xzQkAng1OLhSgTfolSPWGyCalYG2p16oC75oux1EsGc8m1O/LsRCOGpZUN5y
         xCk7Yh8pNEcVBXdIm6rj4gd/oLQArjeYqRshjTtXTw9kNoAi+O/hbAgo+1OwUBTI065g
         xQ3A==
X-Forwarded-Encrypted: i=1; AJvYcCX52c0K9A7D0Fn9nqAzlA/dB3Gba4XPQpc9kKSULaltyC3oJDHt6taEzHfItbtNOwsCy4rBNpHlrKCSOir8@vger.kernel.org
X-Gm-Message-State: AOJu0YxSL9UM+khP8QQwO6al0b4uohrQ3Dvb5l6mKv8UOFXd5enDtbgp
	KrEXvCUIdfv6/+LTE7p1U+ffuHgEyPhbxpr8r18LtZU4mWFWcBlCkBtBWPA4/TEDhLkhOsSWY2J
	//mNi1KyTa8dQ+bux9YBkV8pgu/+JFyCF0CgGOuazXBvFLiApDNQUZ1rYHJABK55oLuqg
X-Gm-Gg: ASbGncvZLXuXNCRB0DJD8O1V+RE9WeASNCNalBeutveOSvHhM/yEVMUeDcIXWJ+gXsE
	SRfQ9vK+mZOrG2VNqs1pZfcYTiC1zVw3h4EO53jskPZ3DcqF/tV4szmHXbBKBv9HcQ+OFhko+Pz
	xXAaUQJGKSJG9FkVmz+VBZ9BZheWoxlgHb5GrnQ5B/pmlvYUO3sUJjfGX8y0dc9fSSpWlYc748P
	cUaXIaMK19AfnOknnpZu1GikjtaMKNIPZwSTdXSL0+lAkDeE0EevdleOKLydlgkDeGMGm7E6zil
	3SFFh7nz1mqbYyqGHZBblcz+lxOyAl1GdB8dysS7PHlFTO6//o1k5pJsE/qc7VJBN0lwj75Z5v4
	FXXtfNultsf+xlkgO21QwLOfZVXJGSlkvEFbWIX7BTQRdEc+ll2al
X-Received: by 2002:a05:622a:588d:b0:4b2:ee95:6c54 with SMTP id d75a77b69052e-4b2ee95851dmr3728591cf.43.1756233802290;
        Tue, 26 Aug 2025 11:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6IfNHCoBBouEBY9m2TV/n1ySuwPSthCvJdO6LrRDTTfuS+b800yiqyuWzOwKIizgebXIBOA==
X-Received: by 2002:a05:622a:588d:b0:4b2:ee95:6c54 with SMTP id d75a77b69052e-4b2ee95851dmr3728131cf.43.1756233801582;
        Tue, 26 Aug 2025 11:43:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f42101509sm1719052e87.106.2025.08.26.11.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 11:43:20 -0700 (PDT)
Date: Tue, 26 Aug 2025 21:43:18 +0300
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
Subject: Re: [PATCH v3 32/38] drm/msm/dp: propagate MST state changes to dp
 mst module
Message-ID: <bmni5a57d5c6wu4zwlu3uokscnrmgsuvze254afwqcfdlqplzb@fss6ewfptdvv>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-32-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-32-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXwozlHDL3Xxkc
 Ii63hYx1K2GR0Q/BETVIy7g8RqTkr6k7gd10EQoeZaLnrJQvKxItS9KpKMTdkNhbfT4b4tkYamu
 r+G+WxythhM3ldUbaB3V1XiMdXVgbNCYvV8QWFzQot/hiQTCT6J1ubkaTDPZbamJejVtO9i30Hu
 D7wa1nGdVHdJ93rfU/NVVOUMIsIIYCd36EjXJL76oL3qgEJyRsabilZPT/yE64KO+XndEb2XfFx
 xjEiaUm7O6H5e5JCPu6rXKYDsgyVFaWmVkMPlZ8yhlnVjaePmismqxLN4fJHbssZS/E3YVzWlxT
 0rkH+og6emtgCqAIXB/st8I62/EDnuL8g5U8S2IcOHaYQNj4Ih9IvXW2W19e/LpI/irXq/V9Lca
 5UyoeawB
X-Proofpoint-GUID: z5eGTf0dxEEY1OpOIdR2mcXs0nJ-f0ne
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ae004b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XT7MnVG-IMvVsVpEgAUA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: z5eGTf0dxEEY1OpOIdR2mcXs0nJ-f0ne
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

On Mon, Aug 25, 2025 at 10:16:18PM +0800, Yongxing Mou wrote:
> Introduce APIs to update the MST state change to MST framework when
> device is plugged/unplugged.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++++++-
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 15 +++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
>  3 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 59720e1ad4b1193e33a4fc6aad0c401eaf9cbec8..909c84a5c97f56138d0d62c5d856d2fd18d36b8c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -28,6 +28,7 @@
>  #include "dp_drm.h"
>  #include "dp_audio.h"
>  #include "dp_debug.h"
> +#include "dp_mst_drm.h"
>  
>  static bool psr_enabled = false;
>  module_param(psr_enabled, bool, 0);
> @@ -269,7 +270,6 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
>  		dp->panel->video_test = false;
>  	}
>  
> -

Unrelated

>  	drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
>  			dp->msm_dp_display.connector_type, hpd);
>  
> @@ -386,6 +386,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
>  
> +	if (dp->msm_dp_display.mst_active)
> +		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);

I'd say, this should be a part of the previous patch.

> +
>  	if (!dp->msm_dp_display.internal_hpd)
>  		msm_dp_display_send_hpd_notification(dp, true);
>  
> @@ -608,6 +611,11 @@ static int msm_dp_hpd_unplug_handle(struct msm_dp_display_private *dp, u32 data)
>  	if (!dp->msm_dp_display.internal_hpd)
>  		msm_dp_display_send_hpd_notification(dp, false);
>  
> +	if (dp->msm_dp_display.mst_active) {
> +		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);
> +		dp->msm_dp_display.mst_active = false;
> +	}
> +
>  	/* signal the disconnect event early to ensure proper teardown */
>  	msm_dp_display_handle_plugged_change(&dp->msm_dp_display, false);
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> index 331d08854049d9c74d49aa231f3507539986099e..ca654b1963467c8220dd7ee073f25216455d0490 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -924,6 +924,21 @@ msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
>  	return connector;
>  }
>  
> +int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
> +{
> +	int rc;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;

Reverse X-mas

> +
> +	rc = drm_dp_mst_topology_mgr_set_mst(&mst->mst_mgr, state);
> +	if (rc < 0) {
> +		DRM_ERROR("failed to set topology mgr state to %d. rc %d\n",
> +			  state, rc);
> +	}
> +
> +	drm_dbg_dp(dp_display->drm_dev, "dp_mst_display_set_mgr_state state:%d\n", state);
> +	return rc;
> +}
> +
>  static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
>  	.add_connector = msm_dp_mst_add_connector,
>  };
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> index 5e1b4db8aea4506b0e1cc1cc68980dd617d3f72a..8fe6cbbe741da4abb232256b3a15ba6b16ca4f3e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> @@ -87,5 +87,6 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
>  int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
>  
>  void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
> +int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state);
>  
>  #endif /* _DP_MST_DRM_H_ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

