Return-Path: <linux-arm-msm+bounces-60653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D05AD2138
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 16:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76F103A5673
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1936E25E452;
	Mon,  9 Jun 2025 14:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FxgdwTJ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E25E15DBB3
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 14:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749480254; cv=none; b=Ks2uJTt2cCMuGBRoVf5yKuun4A3FT8bm0Sn3ylbvxFNr4GJMoBK8z3IovYobsV1RJU/kFzYnQFWyPcaFSVLpPPNO3UgBiUR0kcPHktpeqCv8ssVM6/BtoMVTzd8H+UqN9I0RZw7vvmvVs4Hj/XoCfWX7X/yi9XCdcVoCYJZuDSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749480254; c=relaxed/simple;
	bh=wQjEsSlZfkHE70GZWZGvTokM1OCVTLMGItd9QPeViwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAItbLSu+T7yfmxBJiDwo5JSqivbXr03qsasIAItJXSLIfifsNQeKwIlKB/bEQ8qBJ0vzooNHpobMPQZCxtu06/J2wGUvlhPaARHYXs2UcqZ82wJyn6ZblWCOo441xdR1X8F5s87E30xff0CD2cG3x3up9gWa/cKzzXLfiPfhX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FxgdwTJ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559BVboI020195
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 14:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6lk4qXVb6U7k62eOjUPKQPHc5tHe5IFjj55NY1+eMTE=; b=FxgdwTJ9vXIkOJKe
	uQSbiulWmFuqiuc24Ppr0U7TQiW+TWXnvCL07zOWelsZJO6W4/IV7Po+y4jmy14P
	CqRPEKs0zKgKLCSxNN65xg73JQwLEZQ3wc1TXQAlxgFqNNzrxH4eOUFEq5+vXak5
	2sdwgck43qG1KM+aiqqT3QqSJf8Z+fQW2kAXgzj9Hqsf+65+7vRcdE8DGOW2WzF4
	LDIN/iC3HveZtQBkGiEd2I7solFO6m9gojSvzPfmpdmJkEO1r/P7kUlVb1GwTRMO
	tCCvq+wYoq/LLyHU9zpuYUG9hfSnGiIG4iSicL8AIGLwNL78kbqgnZ04U3BRr5Fw
	pl81cA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475qctsshx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 14:44:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e28d0cc0so684233585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 07:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749480248; x=1750085048;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6lk4qXVb6U7k62eOjUPKQPHc5tHe5IFjj55NY1+eMTE=;
        b=qqJHBddo3KnJSVdYm8fOH9VEHzYiSjWjrzwR98YxdIUkxs+fuIDop/fjmTK7U0S1/0
         z2jNi7FVxCMIgDfqoPumH6bcjXMQZBvhNUdD433i6ydKv/CxEekXHd91DM3BFnC9DKJ9
         ilftZ5+v4y+tx+kt0l+ebI0w3nScFq/FIAHqsyOnCAZElMxs9sQI1opy4BGgmKuAG4Lu
         lirLwiDnSG9TnHoHbkQbwhCFOnkPsgRCpnfQUVMIjcHWbwUFLjVP7R1rBszATjh/vx5b
         lw0IjYqmZTSol432s6VzzlQ4/sXlY4ujj5vwXTqnvRZgghJDreU+2EFEpHWQpr/2qRYf
         oBGA==
X-Forwarded-Encrypted: i=1; AJvYcCXk7U7BCLpRuYXE8j/Owg2TEiDhBEXlRAeS5j27/P2MJMD4RRjHi9kE39q1gifjxuD5Fx+DDjdSzQGlVoUY@vger.kernel.org
X-Gm-Message-State: AOJu0YzzZxvcn7TF0bQRA/SahpNLOIkMfbKmXO+stZYCa4CIac4W78+1
	hHfjMjalW/djKe1q8Vbto1rLJwRWl1uccjkOdsEI1BWTDCWkb+kr6dPquiVIqdmiPEzQr+MVUcK
	lguTeUeO5hlcvGjsKUa8YFGR6mYUh0c67/wLCyKfbt8WaknA5VjHOccgpei5JG59tEVVY
X-Gm-Gg: ASbGncv8/6hD0K9k5Hp8LjR6IttiFF1ZiTY3LUU3vrbxxoupF5bYfp3K2rJorn62ViW
	kOh25D5IJnFx8KSXTVIFaxWSbgshQ2/Y8RIGIwaX9/yQ8zKgE3aNmZcmlNCHULpwRwimILTFwwJ
	lv2d7ye7zEHReI7vbI6YSAS3kiiA/yjvz7aP8BhhXWgyyWWPRyy/feDkRX0aCwmUTEJjtzRR7LY
	hk8FuKzi9H2pQxKCWqhWIHaRzRjO7FhbPPh4wTzcNrmV8WsISg1mfxnWONSiHiwlznx2aP9VvXN
	0fmVYVgiIfJ5Yp6SCXTj7AhGsN+PN39PA5te/ERdfTSTEFc8DxlnMGyhf7hJzRVKIczSyAAxOW5
	CUlHNgkRfnQ==
X-Received: by 2002:a05:620a:2a03:b0:7cd:3f01:7c83 with SMTP id af79cd13be357-7d2298d6eaemr1815632785a.39.1749480247851;
        Mon, 09 Jun 2025 07:44:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgsEWFGVkDlPTwmsMHbybN20i8t3PV7oDWgFQp0aJTKLiHA9vwJmMx+0ImeLu5tsgrrcimiw==
X-Received: by 2002:a05:620a:2a03:b0:7cd:3f01:7c83 with SMTP id af79cd13be357-7d2298d6eaemr1815628285a.39.1749480247414;
        Mon, 09 Jun 2025 07:44:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367722445sm1170794e87.130.2025.06.09.07.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:44:06 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:44:04 +0300
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
Subject: Re: [PATCH v2 35/38] drm/msm/dpu: use msm_dp_get_mst_intf_id() to
 get the intf id
Message-ID: <75k7tekvps6227tagfn6z5medhqn7zzkhii525aao46hndk4iw@6bto2vrqkgih>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-35-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-msm-dp-mst-v2-35-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: l40QCs_uq7tbbmpVxzSmc5ExJSKTWIW5
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=6846f33a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=ax9iHmw9lJn8B8Mg6a4A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwOCBTYWx0ZWRfXwf3k698c3VCS
 iCva4JwDMOfy2KccioeBIUHKKWXNG3qYwxx8Yjkd101IHMcLh/uGI4p+45BgTMTySJh0T2QhPqH
 N+Jb84q1Oqcu/W3mZM0FsVGbgblt55OO+KOwruaLHhO25bDmEeRshVvIluUr5ORu0b1jFQijyu9
 mpyAuvvb6bDJBSKDSEit9bwpuyyRgMQMaO4yB8ek8ByyTWi7bib5xto650ZpxXPBJCGxGPgk+gx
 SZ8d3htQvLrtKvh0LKkoEgZqse/L+TiZbncGb+eHCOYJVUgYeqL7GF/8D1E56MOABcvJ/bRRRa7
 5jOMEmrtPkY8an9US7x3Ikw/ihHGpBwexNMdKl/cp6KwTcZd8Lm3YNL+Izmv+1LXTUlCcuuF8IE
 NsBx6/eZSDO57FbHZDFW7gTLQ5iKf0DH/9+/ksClUfuXeX/nK0kVC5xL0tm/wAXSnZTpHMtT
X-Proofpoint-ORIG-GUID: l40QCs_uq7tbbmpVxzSmc5ExJSKTWIW5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090108

On Mon, Jun 09, 2025 at 08:21:54PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Use msm_dp_get_mst_intf_id() to get the intf id for the DP MST
> controller as the intf_id is unique for each MST stream of each
> DP controller.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 21 ++++++++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 43 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  2 +-
>  3 files changed, 60 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 7020098360e474ee149824a488d912a7ad8ed06a..75cc2d475440fcdc941aa9eb19e78a87e83b5f5f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2611,11 +2611,13 @@ uint32_t dpu_encoder_get_clones(struct drm_encoder *drm_enc)
>  
>  static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  				 struct dpu_kms *dpu_kms,
> -				 struct msm_display_info *disp_info)
> +				 struct msm_display_info *disp_info,
> +				 int drm_enc_mode)

Rather than passing additional argument with very special case, I'd
prefer if you expanded dpu_intf_type enum.

>  {
>  	int ret = 0;
>  	int i = 0;
>  	struct dpu_enc_phys_init_params phys_params;
> +	u32 intf_id;
>  
>  	if (!dpu_enc) {
>  		DPU_ERROR("invalid arg(s), enc %d\n", dpu_enc != NULL);
> @@ -2658,9 +2660,18 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  		DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
>  				i, controller_id, phys_params.split_role);
>  
> -		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
> -							   disp_info->intf_type,
> -							   controller_id);
> +		if (drm_enc_mode == DRM_MODE_ENCODER_DPMST) {
> +			intf_id = dpu_kms_get_mst_intf_id(dpu_kms, controller_id,
> +							     disp_info->stream_id);
> +			DPU_DEBUG("intf_id %d for disp_info->stream_id = %d\n", intf_id,
> +				  disp_info->stream_id);

If stream_id was a part of the h_tile_instance[] (e.g. by using high
bits of the ID), then there is no need to patch this function at all:
pass DP_CONTROLLER_n | DP_MST_STREAM(m) through h_tile_instance, then
parse it in dpu_encoder_get_intf().

> +			phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, intf_id);
> +
> +		} else {
> +			phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
> +								   disp_info->intf_type,
> +								   controller_id);
> +		}
>  
>  		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
>  			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
> @@ -2760,7 +2771,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>  	mutex_init(&dpu_enc->enc_lock);
>  	mutex_init(&dpu_enc->rc_lock);
>  
> -	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info);
> +	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info, drm_enc_mode);
>  	if (ret) {
>  		DPU_ERROR("failed to setup encoder\n");
>  		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index e030476dc4c69448886c29bcfe8ff3105949b129..f82dcf7c6dd31f078bbe4afe55d4667a4867f0b7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -574,6 +574,49 @@ static int dpu_kms_dsi_set_te_source(struct msm_display_info *info,
>  	return -EINVAL;
>  }
>  
> +u32 dpu_kms_get_mst_intf_id(struct dpu_kms *dpu_kms, int controller_id, int stream_id)
> +{

This goes logically next to dpu_encoder_get_intf().

> +	const struct dpu_mdss_cfg *catalog = dpu_kms->catalog;
> +	int i;
> +	int cnt = 0;
> +	u32 intf_id = INTF_0;
> +
> +	/* The intf order in dpu_intf_cfg matches the mapping in the DP HPG.
> +	 * DPU_8_4_0 - DP Controller intf to stream Mapping
> +	 *
> +	 * +-------------+----------+----------+----------+----------+
> +	 * | stream_id   |    0     |    1     |    2     |    3     |
> +	 * +-------------+----------+----------+----------+----------+
> +	 * | DP0         | INTF_0   | INTF_3   | INTF_6   | INTF_7   |
> +	 * | DP1         | INTF_4   | INTF_8   |          |          |
> +	 * +-------------+----------+----------+----------+----------+
> +	 *
> +	 * DPU_9_2_0 - DP Controller intf to stream Mapping
> +	 *
> +	 * +-------------+----------+----------+
> +	 * | Controller  |    0     |    1     |
> +	 * +-------------+----------+----------+
> +	 * | DP0         | INTF_0   | INTF_3   |
> +	 * | DP1         | INTF_4   | INTF_8   |
> +	 * | DP2         | INTF_6   | INTF_7   |
> +	 * +-------------+----------+----------+
> +	 */
> +	for (i = 0; i < catalog->intf_count; i++) {
> +		const struct dpu_intf_cfg *intf = &catalog->intf[i];
> +
> +		if (intf->type == INTF_DP && controller_id == intf->controller_id) {
> +			if (cnt == stream_id) {
> +				intf_id = intf->id;
> +				break;
> +			}
> +
> +			cnt++;
> +		}
> +	}
> +
> +	return intf_id;
> +}
> +
>  static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>  				    struct msm_drm_private *priv,
>  				    struct dpu_kms *dpu_kms)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index a57ec2ec106083e8f93578e4307e8b13ae549c08..388cd8f84fd579ce30a69989be5ac116bb727878 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -168,5 +168,5 @@ int dpu_enable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
>  void dpu_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
>  
>  unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name);
> -
> +u32 dpu_kms_get_mst_intf_id(struct dpu_kms *dpu_kms, int controller_id, int stream_id);
>  #endif /* __dpu_kms_H__ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

