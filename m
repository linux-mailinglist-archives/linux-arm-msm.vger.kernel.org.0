Return-Path: <linux-arm-msm+bounces-70768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A66B34DB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 23:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B184189325B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 21:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C4A29A9E9;
	Mon, 25 Aug 2025 21:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DC4YZkLM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B216E28469C
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 21:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756156250; cv=none; b=PC2fqn+KRkVywPpthTv7B0nihO4OpAhQcQJYsC1y18CvvoVPY6gp31ekfIBV7197WwoR8QJsRyWviicpjAg04SfjgS0F032PVr7DrUHd/mTH26N3R7BpV/sdC+kuVLWxKvmZ3LEVIiMdXf/S55ENMHmDkTpsAtsm04xl1tuRDnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756156250; c=relaxed/simple;
	bh=tRXcSyUU8d5kUUS1FjVKUtGu+jckfg9kuVLeFg2aT4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6C1nemylc7SNE++2B5ECHZEpvdejYMmShaosQ7CdVPaokr0qIo4npuGTXD5sxRW+Q/idjRVWHqyXWSCltvrjwFtmlHWE9O1rZQzcB8O0jD9ujcNSAD1WZd0RArp4QxlLPMRZJKu0NgLNYlDkz5uSHyXNSFjN+J+i573i+3Cf34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DC4YZkLM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFuFMp020705
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 21:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o5NoSP+kvpf4oCKEIwkFCPBr
	ErrR3qlyUVN/G6WnM1o=; b=DC4YZkLMVND8ne/s2IQo8cjon2ytCnBP/FLRTRcT
	IiYyfsb0jaqG6Tob0so8DryTQo4nefIN/tAANhpd9rfYEdzF59h/Ii1nnYW0jbZB
	m/i95Xs/dr2h+O7uhsbXheqPKd5G4i2sbzG4dMzemLbYvt3hEei9LXsBHi4d4I0d
	8q4BdCuCuiD48GxzJGkTzb3jsXjtHPsFUBsvcVXto5JtnrlFgFiYJlxD4332jOx6
	ehtIquPaPbrGDYCvMFWz+Jbus9G12Z1ZtAFQ3c/uLA8NTKZp+YYQLw4+d4UyYlb8
	Qf9tJgZLid4qNrClcfQdoYuwUxVX4f5ZryhtiObcrskPZw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x86gm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 21:10:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109bd3fa0so48986631cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756156246; x=1756761046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5NoSP+kvpf4oCKEIwkFCPBrErrR3qlyUVN/G6WnM1o=;
        b=g+Nf8m9SNs/jl+TKTIDjcVJKXceXXNFmxkvpvygccQzBkDIblXQBidrI7kao0DjSV2
         TneLgEoF5dGG8a0yAQ8HZZzDTX8t/Ezejyhd6xHUtcjySbCRzUiAyINHnmAFYMyiShtI
         nIXYu2NjXVlDfk7XoavNboKIAymZR/C0Ua7dsFDuySXF8eoQMB4wNu2qe7IFvmguKe+4
         YggSyo3K+ZiN+b20ZN/uYmrVS4h7x353orCX0DZ6Afn1qNYiaDenncJofeNOxGro2Izp
         xEAJfFldol4GmgW/UASJe4VARmqdr+7DMU3WMVd0o1qp91siHnrNkeXpzAbwmXZ2Z0AO
         RI6w==
X-Forwarded-Encrypted: i=1; AJvYcCVKPsYmxof+8eh1CKWiuaLuAkqgq4yFNMXC8zvVts30kqIDWf0R2w6usZfOJyjUFUbT9hzTHX8F5+3eB46q@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt03NvBMkWjCKcepept8Dp4UzemYoX20SgtMgugoHEjbveM3lb
	+YGT8aajktt2vQfQsoFYi7p25DmNY4umXCmKIXRvfg/86eX56L3Pz/RBZka/GzlbCmWgVafAVTS
	w0O2GSp/bcxjwRX1hkII33WLbCXF7t1eSV+9b0kpmejeMDe6jEvhfIm1c5/SOgmDXCDmI
X-Gm-Gg: ASbGncshcfSUpMwKD/YMYiD8ZrWRALw+EwdpcvXOAgFqZJ9E8GcjUakZp5ZI0YU/pK8
	+tqeRRt3Mxb7CU+3ebJMFlF81ZPDEIMaImJZulpdacnKncxHRoT2NXBcYWqi1mmOln/t7PmVaOo
	zRLl2p4+mVY+ZJmNHln6JPmrSPUzx728D1Kg3sLTpxAU6m93HmV4HK3YlYpKX6hYsckLbhz7rFV
	bzDt1HZXDMV8ecG77+JZXzwiepj8RnG6ipQwpHn6AN60oJYmKWa5/kf8cqV4Lmcf2dA/mSC0n5J
	pQTG8VUMau1lRRC/O8z/b7oumm6Of/XQRgxqQJp7jWGlIEdZlCnHk5vIoyOLI9DMfZcWa8qb6PB
	f/2v7jiRBiX58Dqy3t8X0Gc/16jGQEmNFKM3AMv856Y7w1pq9tyMd
X-Received: by 2002:a05:622a:241:b0:4ae:cc75:46e7 with SMTP id d75a77b69052e-4b2aab44eb1mr153288491cf.57.1756156245457;
        Mon, 25 Aug 2025 14:10:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo1/N0DbFsRaUXJYQAheMpfHeFkegCfsbtibM2neyB5yZ+Wlh3+3JMp7GtjIumnjz3kcEsdA==
X-Received: by 2002:a05:622a:241:b0:4ae:cc75:46e7 with SMTP id d75a77b69052e-4b2aab44eb1mr153288021cf.57.1756156244734;
        Mon, 25 Aug 2025 14:10:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35caab61sm1814974e87.140.2025.08.25.14.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 14:10:43 -0700 (PDT)
Date: Tue, 26 Aug 2025 00:10:41 +0300
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
Subject: Re: [PATCH v3 17/38] drm/msm/dp: add support to send ACT packets for
 MST
Message-ID: <mtli7kelybfot6ai3lqjagy6hahnpkimqjnjbk26shaoekqoht@cbycvfsmry4o>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-17-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-17-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DDO8TH0s8_tC2epZes4oNCfn7AOoeIX4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX9d77LNxxCiVY
 3zu8PYyOVOdg2nuq2KH84R076ff7P/j6UV6MhqPAgZTTWqU04672xYYvD683N1a7nhGrXYsLcIi
 0iBpexJ2zo6y1G2fljqIXZblylsy87wMBJGIaMkeNJlaXodKvhlEj/gERtlqqgA+VZKiXOlJFGP
 zdK3+KylZL+JsRYPhq/1n0ckEGloQbuAFqGkLTJolc8Zy3EZiEjE3R1dUbTl348CvVY6dpo/8E9
 8lmIY8xm/K3TMFjSZZbXFtQHsKpADnjqs26MKI93YccYZYmyQt01csi2EB5CIL8GxbDvCo3Tj0Q
 UoBLY1YzfW8L5FXLz+e+wKhfGUXnb8/bIXl6rFXr2E/gIdnL6SvIBwPvJ6Bke+O+sGIICFzDEwx
 QCzvrKbB
X-Proofpoint-GUID: DDO8TH0s8_tC2epZes4oNCfn7AOoeIX4
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68acd157 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=xirQvcjanROXNmDBG14A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_10,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044

On Mon, Aug 25, 2025 at 10:16:03PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Whenever virtual channel slot allocation changes, the DP
> source must send the action control trigger sequence to notify
> the sink about the same. This would be applicable during the
> start and stop of the pixel stream. Add the infrastructure
> to be able to send ACT packets for the DP controller when
> operating in MST mode.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 39 +++++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 ++--
>  drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
>  5 files changed, 44 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 608a1a077301b2ef3c77c271d873bb4364abe779..16e5ed58e791971d5dca3077cbb77bfcc186505a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
>  	bool core_clks_on;
>  	bool link_clks_on;
>  	bool stream_clks_on[DP_STREAM_MAX];
> +	bool mst_active;
>  };
>  
>  static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
> @@ -227,6 +228,32 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
>  	return 0;
>  }
>  
> +void msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +	bool act_complete;
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	if (!ctrl->mst_active)
> +		return;
> +
> +	msm_dp_write_link(ctrl, REG_DP_MST_ACT, 0x1);
> +	/* make sure ACT signal is performed */
> +	wmb();
> +
> +	msleep(20); /* needs 1 frame time */
> +
> +	act_complete = msm_dp_read_link(ctrl, REG_DP_MST_ACT);
> +
> +	if (!act_complete)
> +		drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete SUCCESS\n");
> +	else
> +		drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete failed\n");

Shouldn't it return an error if the register dind't latch? Also,
shouldn't we set mst_active only if the write went through?

> +
> +	return;
> +}
> +
>  /*
>   * NOTE: resetting DP controller will also clear any pending HPD related interrupts
>   */
> @@ -2079,6 +2106,8 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
>  
>  	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>  
> +	msm_dp_ctrl_mst_send_act(&ctrl->msm_dp_ctrl);
> +
>  	ret = msm_dp_ctrl_wait4video_ready(ctrl);
>  end:
>  	return ret;
> @@ -2275,7 +2304,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>  	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl, ctrl->panel->stream_id);
>  	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
>  
> -	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
> +	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, false);
>  	if (ret) {
>  		DRM_ERROR("failed to enable DP link controller\n");
>  		return ret;
> @@ -2355,7 +2384,7 @@ static bool msm_dp_ctrl_channel_eq_ok(struct msm_dp_ctrl_private *ctrl)
>  	return drm_dp_channel_eq_ok(link_status, num_lanes);
>  }
>  
> -int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
> +int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active)
>  {
>  	int rc = 0;
>  	struct msm_dp_ctrl_private *ctrl;
> @@ -2373,6 +2402,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
>  
>  	rate = ctrl->panel->link_info.rate;
>  	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
> +	ctrl->mst_active = mst_active;
>  
>  	msm_dp_ctrl_core_clk_enable(&ctrl->msm_dp_ctrl);
>  
> @@ -2643,6 +2673,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>  
> +	msm_dp_ctrl_mst_send_act(msm_dp_ctrl);
> +
>  	ret = msm_dp_ctrl_wait4video_ready(ctrl);
>  	if (ret)
>  		return ret;
> @@ -2682,6 +2714,8 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
>  
>  	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
>  
> +	ctrl->mst_active = false;
> +
>  	dev_pm_opp_set_rate(ctrl->dev, 0);
>  	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
>  
> @@ -2849,6 +2883,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
>  	ctrl->link_base = link_base;
>  	ctrl->mst2link_base = mst2link_base;
>  	ctrl->mst3link_base = mst3link_base;
> +	ctrl->mst_active = false;
>  
>  	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl, max_stream);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 2baf7a1ff44dd7139d2da86390121d5e7a063e9a..abf84ddf463638900684f2511549a593783d2247 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -16,7 +16,7 @@ struct msm_dp_ctrl {
>  
>  struct phy;
>  
> -int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
> +int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active);
>  int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train);
>  void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
> @@ -50,5 +50,5 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl);
>  
>  void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
> -
> +void msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl);
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 562a5eccf3f08c5669cc7c2ad1268897e975d0c4..eeba73f81c5ce7929dac88f4b47ac3741659864b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -709,7 +709,7 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
>  		force_link_train = true;
>  	}
>  
> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> +	rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
>  	if (rc) {
>  		DRM_ERROR("Failed link training (rc=%d)\n", rc);
>  		msm_dp_display->connector->state->link_status = DRM_LINK_STATUS_BAD;
> @@ -1557,6 +1557,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  
>  	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
> +	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl);
>  }
>  
>  static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index a839d0a3941eac3e277185e42fddea15ca05a17f..9442157bca9d63467b4c43fa644651ad2cbcbef5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -21,6 +21,7 @@ struct msm_dp {
>  	bool audio_enabled;
>  	bool power_on;
>  	bool prepared;
> +	bool mst_active;
>  	unsigned int connector_type;
>  	bool is_edp;
>  	bool internal_hpd;
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index a806d397ff9d9ad3830b1f539614bffcc955a786..de3d0b8b52c269fd7575edf3f4096a4284ad0b8d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -158,6 +158,8 @@
>  #define DP_CONFIGURATION_CTRL_BPC_SHIFT		(0x08)
>  #define DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT	(0x0D)
>  
> +#define REG_DP_MST_ACT				(0x00000500)
> +
>  #define REG_DP_SOFTWARE_MVID			(0x00000010)
>  #define REG_DP_SOFTWARE_NVID			(0x00000018)
>  #define REG_DP_TOTAL_HOR_VER			(0x0000001C)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

