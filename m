Return-Path: <linux-arm-msm+bounces-60650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF69AD20B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 16:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2DD4188A74D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B49253F31;
	Mon,  9 Jun 2025 14:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgGY+WkX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEA125B1C5
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 14:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749478630; cv=none; b=t8KJMyh1D/ugGAZgT3LTdEBbsExz/8vBKlKEnOAHp9QEPmwk/2A2hrVNC7H9i7RkdExAxtquvNyY8GBdBX3g6sz2jzyxw5c2Q5exQ8+kyZgtt5jDGvSbPBk7Ee4P9x5bTvV9fS/tiqiDSafBTHXNOZr2S0lSbBJTOtagkaVlGiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749478630; c=relaxed/simple;
	bh=7TmqjE/3J68+p8PHnc05cQgPrrCp1xhthCW4Jma5mj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aTkkY/3DsBsKcrBFRK7opuQbW/2sN4C4nyfyXGB5HojPIbTKo5YGQWh12ExQRtaG+H/QTK+PHv18gSYiVLJC01kIJL2i7EHUgJ2r1z+xhyAL+kHWQlbKSiofawQpMjc2B3QmvaherNcVackynonAzWozl3kYIkUHaA6FXz+twHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VgGY+WkX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55999K5d013552
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 14:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aVI7bwlPGVd8Av54c0R1XNDW
	MOUYLmY37xlJhTSHOiY=; b=VgGY+WkXGoS8+3WLnJDc+9R3ASU1McKGz4DffR/v
	00K9+8PYYRTeFvLDBix/2Q31EYKhCmWogRfcfZrpQrbfXRKTS+mazgfw2anFgB1R
	BBTOrLcqvl28eQGhdfHCOc1v1ACGQv4npIxJm1w/w5xh229o5WvMX6iz7ulUuIK6
	O/1UokFeta5pvrujRqGRjTsZwzRAji9r3XBVTTYq4cZ9m3slcmIyij2rhr3Vd7I3
	bhMpfeDcAlxWNgE/YrYOpiRNS9X+77EJQxhPsTh4SDnuyu3ZL81lIeR1EMPaRccP
	yEPHcWvVos7adGwyqwWBBxY80iRTRRh11E+nsDNQTYj79A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475g75tj7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 14:17:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c760637fe5so834326585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 07:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749478626; x=1750083426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVI7bwlPGVd8Av54c0R1XNDWMOUYLmY37xlJhTSHOiY=;
        b=RjnOXAxQx66Fx4ALuhg0xCoiu9H9k1XDtxlmeYp0rTP3xOOzBypkb8cGlGDtnOurEX
         eNuXJ6kBHZPYnVDj9ommENT01oWd/YuFXEsIC+UW4P8PV+2jGRki6CAnxb6s8efAFiEY
         FTyQuv8KuvAA+fV7L2qEpvbCgiO/xaOcAukp1nhMrr/tD8NKF4lU/dgs0J2ahzu89aP3
         A9ULVYVavptq8RuK+iFz3+YShYAsvvcUq7liAXTcoKFh+d8jssDbmLubE2tCZkh9xweU
         ciKrVkYIlU2rf6bJLb2ojOpn9L2FosKzEylbBjGdTztsVb9qf70LllF/MFfiQGrWYs1G
         KJTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJdtNdO2kXZ4K0pfz/J+glyyeOszo9SQ19bc9tBDUoh950FPgQm6XWxF6Sg3TR+ZmHKbb8TInZSbMsOttZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyVyXGSVjNq2WM51o8RbpWvnNLMf31RIQwA+nJnxDHCmn1fPkfC
	4wsL8z9Q381nWmQVUPZCd+ZCDyumyj8I0NlObM7YnkhS7f1ea2eXnRRmUjWnmSpDtukj9gacs+f
	p5/4lhzJurPq6fw/LLF0jRsVCC+XCkYdORoJKQU8yMJh61BeeQm6hzZkEapgQw7x0EzXa
X-Gm-Gg: ASbGnctfJVVco4G5v4x2H/sC2vMuyXlfOiiFA6S+q7OPzbvGjUkNO0gd6MvZnj5HvaL
	5JpPrdCA4iphMz9ZwhFZSbYUqknXgXlPG1+zOhfAItLyx/C0BW70UsJo+CjIbZ2lCdmgEaMYKTS
	+Xs5MbXn+XPzVSrgbKRKLcr6JjBAC9bvELx/cDh7bze6g4ECeNyWkZiFwdyHUPrSNVzKKezDba7
	LiK6vGIDxS8eGs5t+DfDgXQdo29pdXI1v0dxq+015GA4jkghNENEhDFLy/XDJ79e3PfMW/PN1rh
	RuUsGPvTxqFKd+yI/svqDcn8n6O6ZlTAqmaU1TCkKGmLvR0PzLmLeRR87n08zgjYZxOiHFlWXjM
	=
X-Received: by 2002:a05:620a:28ca:b0:7d0:eac6:6df8 with SMTP id af79cd13be357-7d22986ec80mr1995014385a.18.1749478625640;
        Mon, 09 Jun 2025 07:17:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVnzslQ94N1zxxegjmppOQmspczMZd4IHKM4NH9MnXEl7WiguTQ9BljuHGN9i9ooyXLGUUCQ==
X-Received: by 2002:a05:620a:28ca:b0:7d0:eac6:6df8 with SMTP id af79cd13be357-7d22986ec80mr1995009685a.18.1749478625147;
        Mon, 09 Jun 2025 07:17:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d7118sm1173826e87.54.2025.06.09.07.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:17:04 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:17:02 +0300
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
Subject: Re: [PATCH v2 33/38] drm/msm: initialize DRM MST encoders for DP
 controllers
Message-ID: <hxqeilu5fcgsykghxwbhp4r3exu3o45n5lftzeupjxam7r7ux7@wdrfc6lor4gl>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-33-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-33-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: t4jhRbW4Yq8HtSD-g07ITgcQXt5bbTNg
X-Proofpoint-ORIG-GUID: t4jhRbW4Yq8HtSD-g07ITgcQXt5bbTNg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwNCBTYWx0ZWRfX+24cJssZgWqX
 t7Br+LVYmVkyFrI8sdCuUoyrBYFS8y1GwF7Q+KFyL+vTNu7uX63hhpf009jFYjC1oI96fzO5E6M
 OCagV9ZE6544J3tyuy/cPLb7SRZw9IzDpjURHgt0COBv+HurcsTEGOhVRFNdA3/h8rxNUBVa7Dd
 UgtFP4pSqPPJiUZiy5wHTOx+ZTh1fGYhyefswFI/GJeIZfdUXhJq5xPhznhz+Cj2G68Ewa9GI3G
 6c8Xay+oUqqFRNl5EQLLrUAeQQoypXfUjYnh9je0/RrvzxKKylK2e9Y5aRk2L7fVJXICZ51t5sa
 iiFaHOe6SKpSOwAn5hABVxDscH5z3q07v1zaFmeB2nMcDA1qLGU9Fbyavcxz+CYVB2jJ1v/wu3z
 i/AICHzebna/WIIcIfAuaZhAAPFVwelrTtw8SDNU79RNPvN3A2+p3gOIeuqD6jwfu7Gn9JIl
X-Authority-Analysis: v=2.4 cv=TeqWtQQh c=1 sm=1 tr=0 ts=6846ece2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=3qYReTC3F8QknLo2NzEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090104

On Mon, Jun 09, 2025 at 08:21:52PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Initiliaze a DPMST encoder for each  MST capable DP controller
> and the number of encoders it supports depends on the number
> of streams it supports.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 23 ++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_display.c         | 14 ++++++++++++++

Please don't mix DP and DPU changes in a single patch.

>  drivers/gpu/drm/msm/msm_drv.h               | 13 +++++++++++++
>  4 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index ca1ca2e51d7ead0eb34b27f3168e6bb06a71a11a..2eb4c39b111c1d8622e09e78ffafef017e28bbf6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -28,6 +28,7 @@
>   * @h_tile_instance:    Controller instance used per tile. Number of elements is
>   *                      based on num_of_h_tiles
>   * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
> + * @stream_id		stream id for which the interface needs to be acquired
>   * @vsync_source:	Source of the TE signal for DSI CMD devices
>   */
>  struct msm_display_info {
> @@ -35,6 +36,7 @@ struct msm_display_info {
>  	uint32_t num_of_h_tiles;
>  	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
>  	bool is_cmd_mode;
> +	int stream_id;
>  	enum dpu_vsync_source vsync_source;
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 1fd82b6747e9058ce11dc2620729921492d5ebdd..45fedf7e74e9c6dfed4bde57eb675e3dd1762fc7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -652,7 +652,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  	struct msm_display_info info;
>  	bool yuv_supported;
>  	int rc;
> -	int i;
> +	int i, stream_id;
> +	int stream_cnt;
>  
>  	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
>  		if (!priv->dp[i])
> @@ -675,6 +676,26 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>  			return rc;
>  		}
> +
> +		stream_cnt = msm_dp_get_mst_max_stream(priv->dp[i]);
> +
> +		if (stream_cnt > 1) {
> +			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
> +				info.stream_id = stream_id;
> +				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
> +				if (IS_ERR(encoder)) {
> +					DPU_ERROR("encoder init failed for dp mst display\n");
> +					return PTR_ERR(encoder);
> +				}
> +
> +				rc = msm_dp_mst_bridge_init(priv->dp[i], encoder);
> +				if (rc) {
> +					DPU_ERROR("dp mst bridge %d init failed, %d\n",
> +						  stream_id, rc);
> +					continue;
> +				}
> +			}
> +		}
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 9dbcf4553cad70c9e3722160a87403fc815765d7..ab1ad0cb6427eb4f86ee8ac6c76788b1a78892a8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1417,6 +1417,20 @@ static int msm_dp_display_get_connector_type(struct platform_device *pdev,
>  	return connector_type;
>  }
>  
> +int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
> +{
> +	struct msm_dp_display_private *dp_priv;
> +
> +	dp_priv = container_of(dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	return dp_priv->max_stream;
> +}
> +
> +int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> +{
> +	return msm_dp_mst_drm_bridge_init(dp_display, encoder);

What's the point in this oneliner?

> +}
> +
>  static int msm_dp_display_probe(struct platform_device *pdev)
>  {
>  	int rc = 0;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index a65077855201746c37ee742364b61116565f3794..dd403107b640ee5ef333d2773b52e38e3869155f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -372,6 +372,9 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
>  			       const struct drm_display_mode *mode);
>  bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>  
> +int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
> +int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
> +
>  #else
>  static inline int __init msm_dp_register(void)
>  {
> @@ -388,6 +391,16 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
>  	return -EINVAL;
>  }
>  
> +static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> +{
> +	return -EINVAL;
> +}
> +
>  static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
>  {
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

