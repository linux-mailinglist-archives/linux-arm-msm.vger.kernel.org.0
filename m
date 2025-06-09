Return-Path: <linux-arm-msm+bounces-60642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D472AD1E86
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 15:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D43EA3AC4DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 13:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE332571C2;
	Mon,  9 Jun 2025 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WctXkyXQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2239C257429
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749474732; cv=none; b=iSr2882z2oq0TdPiKYoZ5r3mu5TnUii6WsTAvK929LLk8wIzvvGbacs1Q4M7csSB3eszHqZ3GVut9EL17//EfnuCgRKd3rqLSTS7g/cjUMl42Y+Xzphf3nwPkb2qLno8U7yjDiZfZh9pCWewh74ZbxPRnTFvEvaZaBkRE25gvCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749474732; c=relaxed/simple;
	bh=SZpxnjd2IOeK+ba0PRjOHXObbCUbVIe0VAlP7jOIjjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQlXRiOyx6UF9gWQpSDJ2LYGXp7ptVpdh17auoQUXWjRxF6zHid7pYSpgwvNLVRFEj7+Ezz6bAIWK8SRbR/cVL7gq6zrBsmY2rbR4NT3RxpvGmQx4L2QrhigEd3Wg0bI5+4fJYYrQLEU2v6kcb/VOTt3pIFwMUr2Y3PNc/4ygTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WctXkyXQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599RWgL029969
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 13:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FOpsxLPmOINjsuGr1I7IBXmn
	WyCK9q12mWLPW1d5uMg=; b=WctXkyXQ1GWm1ll/0C/ovSm2yvllNcnENNJfjowH
	2X0YwPtKhUY2auwzh1NZie5aez3HyTBHrAgrudCCAkklwh2rLSHsVLo9/plITF+u
	VazN1R9WqaRHg7YfCMR4tQzmdzaktsv70hry564CyDWGSu7//xrPx6K3Q4n25q65
	PCDNHh9sKbs5NQrFWJyJeM1+RLK0CSgufFM/xL1c6yC0kiBZp/p/krL5R2OSzQAt
	HSXOUZX3p5jWwX58FI0eTmeAqKLi+FRlvt+WloFDNKxBfMfacYiSnTy0E80AmRek
	W8/Fkw/oOMhYF2xO5qTXvXFcJ5fGSByoWtrtgTuvSEfYvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11x9xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 13:12:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7cf6c53390eso402307885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 06:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749474727; x=1750079527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOpsxLPmOINjsuGr1I7IBXmnWyCK9q12mWLPW1d5uMg=;
        b=Cqbu3da8isEqjZjUJLICrd9bHY3TiG6y/eG971gpjXq+/hzEree2KYRnYg9vLX96gr
         iAuA+iog1iWNCnSFmgAhoLoJ5XUCZbiVfrsSMgG8AY5AXuEsIUl94ipC/tmdtlKE3KSn
         mqBlw0LbI5xJjMRWCfxfdnDrhu2NOUisrauGYnVk2ipEBUY1fPrN9qE1Wfr3RDWGEjKx
         6ggloWt4E+UsMeN/eYr09SFqLg7FZVG6HF8MMt4KpojhRrA/ksGYxBIwjWUMfqM9zCa4
         Kc+ciyvKUIYKTLtIEnC4Y3MyjB0tAKXVdHu1VLC7O7DCPAaFhfxkBiXnP5+6fa1j+8VN
         mSVg==
X-Forwarded-Encrypted: i=1; AJvYcCXmmqKDzSRGVBOEsZPufCRzG0ap0XOJsSlSXaPAiYjgqnmDiaNIKVNAWLTTKegP9/m1vZOecbg7pOiiUWWl@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8TSw0hEkafM1g1+v/4CqOXoWwjoGbrWYRTF9/qNzv5ucGu38Q
	kpEGbomf8QKuH/UaeeDhngJ8Mbj2WgwRZPVIEyoXI1MmZzPLcFrYzHDMH5fFO/4Orul0U2KiidG
	BBN6Q9KAh2DjX2GHjb7FcGwVyJP50HOtP6ua9GDRPOY07m3W1RMB5+++T2W5zR8KNAPpX
X-Gm-Gg: ASbGncvI7Pgt1WCYOenMcjRKPUZjYrD9dsKdT0QrmzlSgzRFi0A8AZWxJzr5zGXUHtv
	sE72ZqiUmL7gKwvNIjKfgDnZlnSMmyigBY69V371uoowuY/o3B0+g7hRGBPjZZwLFNxc3QTDE/p
	P5XMM3Ii2fm846VxV1KYd1dziPh8RpxMoFi9t2oYxuSpW1Ya+3NvApSjObCbXuqwJMgDglp6Tbz
	Qkqy4gT5iorhZShSo81gbd++plyyszyy3phfPwT+s3i8Jh1k2y0o59qjfid/svIj2sW0Nf6xdBX
	EfUb80G4DDTj5k2IdXc0eT5K2UA0A38uL6D96XiuqzpF3TtMyXZ/PaCECHirhe4kwyfr6mSmGxM
	=
X-Received: by 2002:a05:620a:44c2:b0:7d2:cc6:b485 with SMTP id af79cd13be357-7d229948f38mr2144939585a.8.1749474727087;
        Mon, 09 Jun 2025 06:12:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHESnVv73YVftbc2/YdUfNVXNdVjJoxAKeurGP3vwISE7BuF9Ru9g16gRgZZ6itG71paJL+qw==
X-Received: by 2002:a05:620a:44c2:b0:7d2:cc6:b485 with SMTP id af79cd13be357-7d229948f38mr2144932185a.8.1749474726525;
        Mon, 09 Jun 2025 06:12:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d78casm1157534e87.66.2025.06.09.06.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 06:12:05 -0700 (PDT)
Date: Mon, 9 Jun 2025 16:12:04 +0300
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
Subject: Re: [PATCH v2 05/38] drm/msm/dp: allow dp_ctrl stream APIs to use
 any panel passed to it
Message-ID: <5emeno6zpefewmysmmfb6s64mme32pzatgpzeu6hnuzgfi3q4t@i6zpgj5am3ie>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-5-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-5-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: SnbEicuW0o_RTo1JV5uw5CwZvl3e8gYu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NiBTYWx0ZWRfX+OVjPNVzdX+R
 1rxIV3q3PXi7KSssgslYWqLNjqxzbXsM/hoq3+yyLfw5GKjdAu3MKcjzFPKGODbNZ//Mb39PBPc
 cvQCQDQR6E7RuJ/1dUmMaHVizJP8bkAAMSwWCi5MxZ2b2UvZ/qGHUVr+k5Bl2G7NBinO21H92/q
 4u9aq13qqhXHGzD0SuebrVWbz59vpR6KXiHcl5ryjp6+lR/EtXrGDGNHaH+EWDzVfiM6DJ/RgVP
 5EX2wjtAyNqNdL+6LjkF2K6dRxN2Wg4dCQco4DUIUuInNDEpIXM8rSaNXkOso64J8TVc2Lrt3a1
 EKlUgeVLDgk1OTT7YLgsDHncG9I2jBRgyjxX2Ah7g094YWwS7feJYiWnVLA57LtsRcMDkajB4nv
 6hjLDJmRm0lkbqd79h2eKTvZLgz5f9Tt3VrtIY2Ncl/Kh0QfbApOjX/Nw9pj0LxiAL2TkxTs
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=6846dda8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=yWvXen9SXRj_5qcsLu4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SnbEicuW0o_RTo1JV5uw5CwZvl3e8gYu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090096

On Mon, Jun 09, 2025 at 08:21:24PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Currently, the dp_ctrl stream APIs operate on their own dp_panel
> which is cached inside the dp_ctrl's private struct. However with MST,
> the cached panel represents the fixed link and not the sinks which
> are hotplugged. Allow the stream related APIs to work on the panel
> which is passed to them rather than the cached one. For SST cases,
> this shall continue to use the cached dp_panel.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 37 ++++++++++++++++++++-----------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 +++--
>  drivers/gpu/drm/msm/dp/dp_display.c |  4 ++--
>  3 files changed, 25 insertions(+), 21 deletions(-)

I think previous review comments got ignored. Please step back and
review them. Maybe I should ask you to go back to v1 and actually check
all the review comments there?

> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 1ce3cca121d0c56b493e282c76eb9202371564cf..aee8e37655812439dfb65ae90ccb61b14e6e261f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -135,7 +135,8 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
>  	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
>  }
>  
> -static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
> +static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl,
> +				    struct msm_dp_panel *msm_dp_panel)
>  {
>  	u32 config = 0, tbd;
>  	const u8 *dpcd = ctrl->panel->dpcd;
> @@ -143,7 +144,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>  	/* Default-> LSCLK DIV: 1/4 LCLK  */
>  	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
>  
> -	if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
> +	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>  		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
>  
>  	/* Scrambler reset enable */
> @@ -151,7 +152,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>  		config |= DP_CONFIGURATION_CTRL_ASSR;
>  
>  	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
> -			ctrl->panel->msm_dp_mode.bpp);
> +			msm_dp_panel->msm_dp_mode.bpp);
>  
>  	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
>  
> @@ -174,20 +175,21 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>  	msm_dp_catalog_ctrl_config_ctrl(ctrl->catalog, config);
>  }
>  
> -static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
> +static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
> +						struct msm_dp_panel *msm_dp_panel)
>  {
>  	u32 cc, tb;
>  
>  	msm_dp_catalog_ctrl_lane_mapping(ctrl->catalog);
>  	msm_dp_catalog_setup_peripheral_flush(ctrl->catalog);
>  
> -	msm_dp_ctrl_config_ctrl(ctrl);
> +	msm_dp_ctrl_config_ctrl(ctrl, msm_dp_panel);
>  
>  	tb = msm_dp_link_get_test_bits_depth(ctrl->link,
> -		ctrl->panel->msm_dp_mode.bpp);
> +		msm_dp_panel->msm_dp_mode.bpp);
>  	cc = msm_dp_link_get_colorimetry_config(ctrl->link);
>  	msm_dp_catalog_ctrl_config_misc(ctrl->catalog, cc, tb);
> -	msm_dp_panel_timing_cfg(ctrl->panel);
> +	msm_dp_panel_timing_cfg(msm_dp_panel);
>  }
>  
>  /*
> @@ -1317,7 +1319,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>  	u8 assr;
>  	struct msm_dp_link_info link_info = {0};
>  
> -	msm_dp_ctrl_config_ctrl(ctrl);
> +	msm_dp_ctrl_config_ctrl(ctrl, ctrl->panel);

Could you please explain, when is it fine to use ctrl->panel and when it
is not? Here you are passing msm_dp_panel to configure DP link for link
training. I don't think we need the panel for that, so just using
ctrl->panel here is incorrect too.

>  
>  	link_info.num_lanes = ctrl->link->link_params.num_lanes;
>  	link_info.rate = ctrl->link->link_params.rate;
> @@ -1735,7 +1737,8 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>  	return success;
>  }
>  
> -static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl)
> +static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl,
> +						struct msm_dp_panel *msm_dp_panel)
>  {
>  	int ret;
>  	unsigned long pixel_rate;
> @@ -1759,7 +1762,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>  		return ret;
>  	}
>  
> -	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
> +	pixel_rate = msm_dp_panel->msm_dp_mode.drm_mode.clock;
>  	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
>  	if (ret) {
>  		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
> @@ -1797,7 +1800,7 @@ void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl)
>  
>  	if (sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
>  		drm_dbg_dp(ctrl->drm_dev, "PHY_TEST_PATTERN request\n");
> -		if (msm_dp_ctrl_process_phy_test_request(ctrl)) {
> +		if (msm_dp_ctrl_process_phy_test_request(ctrl, ctrl->panel)) {
>  			DRM_ERROR("process phy_test_req failed\n");
>  			return;
>  		}
> @@ -2015,7 +2018,7 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
>  	return ret;
>  }
>  
> -int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
> +int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
>  {
>  	int ret = 0;
>  	bool mainlink_ready = false;
> @@ -2028,9 +2031,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>  
>  	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>  
> -	pixel_rate = pixel_rate_orig = ctrl->panel->msm_dp_mode.drm_mode.clock;
> +	pixel_rate = pixel_rate_orig = msm_dp_panel->msm_dp_mode.drm_mode.clock;
>  
> -	if (msm_dp_ctrl->wide_bus_en || ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
> +	if (msm_dp_ctrl->wide_bus_en || msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>  		pixel_rate >>= 1;
>  
>  	drm_dbg_dp(ctrl->drm_dev, "pixel_rate=%lu\n", pixel_rate);
> @@ -2058,12 +2061,12 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>  	 */
>  	reinit_completion(&ctrl->video_comp);
>  
> -	msm_dp_ctrl_configure_source_params(ctrl);
> +	msm_dp_ctrl_configure_source_params(ctrl, msm_dp_panel);
>  
>  	msm_dp_catalog_ctrl_config_msa(ctrl->catalog,
>  		ctrl->link->link_params.rate,
>  		pixel_rate_orig,
> -		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
> +		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420);
>  
>  	msm_dp_ctrl_setup_tr_unit(ctrl);
>  
> @@ -2081,7 +2084,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>  	return ret;
>  }
>  
> -void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl)
> +void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *dp_panel)
>  {
>  	struct msm_dp_ctrl_private *ctrl;
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index edbe5766db74c4e4179141d895f9cb85e514f29b..fbe458c5a17bda0586097a61d925f608d99f9224 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -18,7 +18,7 @@ struct msm_dp_ctrl {
>  struct phy;
>  
>  int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
> -int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
> +int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
>  void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
> @@ -41,7 +41,8 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl);
>  int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
>  
> -void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl);
> +void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl,
> +				   struct msm_dp_panel *msm_dp_panel);
>  void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index a5ca498cb970d0c6a4095b0b7fc6269c2dc3ad31..17ccea4047500848c4fb3eda87a10e29b18e0cfb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -872,7 +872,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
>  		return 0;
>  	}
>  
> -	rc = msm_dp_ctrl_on_stream(dp->ctrl);
> +	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel);
>  	if (!rc)
>  		msm_dp_display->power_on = true;
>  
> @@ -925,7 +925,7 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>  	if (!msm_dp_display->power_on)
>  		return 0;
>  
> -	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl);
> +	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl, dp->panel);
>  
>  	/* dongle is still connected but sinks are disconnected */
>  	if (dp->link->sink_count == 0) {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

