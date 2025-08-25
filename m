Return-Path: <linux-arm-msm+bounces-70734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C32AB348A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 19:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24AE5169CDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 17:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30B82FF65E;
	Mon, 25 Aug 2025 17:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBow2Tw2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86719301006
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756142925; cv=none; b=IqRKx0rtuPZDYITi+OFG+vSXqmOSEPHq+t7rSQX9rZPOkP8WDIJRO3gLNZC1e+QNNhwWsQ8vP8h2oYuG+yaxeHHomxRX12CAUUUEM2UsR8WgKr8SgJ494feclFNbZCflq/+l+dY0zyDKJP53JLa6YNtCATgz6NUccwZBYYl/Ims=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756142925; c=relaxed/simple;
	bh=M0Ou+wHUk2SOrtxa5Db8yCe07ShGV4deqOVkyB6hBPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxqtqfbVsq1tU9nq5oDhIlMfYnfjuSFqRd0bbEFje2ItBHwjrFFSRDxpPoLEMhUvE88hIm09n7CZED1HPAdQnKgeHNVNAscgPKZhOPhN6Cq00Jzu9btALnCi8Qk6/76IqY6ER62vwrmj+HLpMoNi7neQvob5qcfInCfsquKAW1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBow2Tw2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8gMjI021029
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a8nUyAPGjf8x9ikWVpGDqkIv
	+8rZqElYhK4d+QfYf+E=; b=gBow2Tw2JnrLZzOWisGdzxf6rKnKfn14a1JYIE0N
	tg9HvO8y5SMF/NKFCI+KJCjb3TaQ1ZzsvFC4kecymjcJBdgZVnQ031xlKsoxwJhu
	3Gm3aLgCmKcfihXGVGHeKULG6YZOs9INXlyeW2yYW3nH0pBccQWEGlDFqsHQGyEL
	NiCEvZLR9hwaAJ3sKEBqrg7Q3xQ7xI3OdhBgNgWH8tcN1s/n/CHS48U8FTWo3unC
	LdHp6pn7CTEP+JaKezD0CcpnAZJZuoqbTaXiFn3hoPz8t62THVp/bf4kKxQ+YSyR
	GGxevGj5CRzLlQEcjrFOxS9nzYM6n03CX42773UdqBnGWg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x85xgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 17:28:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109919a51so207435311cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142921; x=1756747721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8nUyAPGjf8x9ikWVpGDqkIv+8rZqElYhK4d+QfYf+E=;
        b=ObQPgpzPLGYc+SoGxuJM5u1HAWoID06Uqsd3j52rc8bAn6kiht5oWOcbx+hFXhmwoa
         EbBPWpsivn6sNERfXRIsYEcEoyKrICxz13K84b6iRvH/sIpzlF+mYJIKBCMSJUYduOVY
         5ULLq6zC7V+YBIeMr4igRyxEAPClsnn6H38QKRaqNa/w5UFtoJGwAXa7z8r5Kt7PP0V5
         Pi0dv/HD8O5UHlA3bDHJALYIYW4mMnYE6VKCiYPI791y5VMzx80Eh8idxpD4VeqaG5dE
         iRHIccEh+PHnYw2+Zpnn8CF/XK20VfT4qD7ZttMQt1QanzS2p/xvoeoxZw6T1ST713v0
         1Hrg==
X-Forwarded-Encrypted: i=1; AJvYcCVveTZ6X9L8X+s1X3xAeWn6SCSAYI9+AaPPupDEZZhK6WxANb9KZX2Hj5MnCJ737EYdZm88r9J2nbbp475T@vger.kernel.org
X-Gm-Message-State: AOJu0YzeHLdX/rKWxazbTm5kXqwidmVPrWGudDAonxzPlG/yE0ZSwjVr
	EmtkEIaKwmVUaLNt2kqlgFwPKWG/S0lVSeLSqT5LRvCKtVBRk+HO+sjSpgy4nt/UqosSHU3RrWU
	AJVu1YGF7SY0B3MtImMVeH+Wa2ALkgra/kQwQ21962QCCS39z7kG24q5EXwt+6LWko12S
X-Gm-Gg: ASbGncu6OZ40nGgDKpIFl2tMkWFmISlFGdthzUmkIKfv/2g8jXkmR6l7y0kkUuzayRG
	8K5pZyg7f9CU25t5jUtKBZF1e7VT2QSETn3CFeWPMsPoMitsjZ9QEQhvRYuJypvbJEDlkFvP875
	sDZqGmtoCY5mZ+oRuqG5j3mvAXbBAnKzAXgdwxHUXByWj5T0+iFa4XOtJMbvYY8/m1wwmb1LKyD
	R4q493yeF/yK9QkPBCBiZyqLgPNxutaA3Fh9JSC7pZcfAL8sKCZnvW8ODOGJXt/8S3/dhX3ZUNU
	jiyE/G1LmfTNoE+l4cUt5QIrtrPXQsbyOLgQI2MroAwEACD/kHkXFRXPZT/GqcrxiOhWSsnhJ3l
	igYTAjKEWdnw9j9bT1nizKLH5VKEtOY1G0zEoxHTvx1+KhtEmaa3a
X-Received: by 2002:ac8:7dc8:0:b0:4b2:d4d8:13e4 with SMTP id d75a77b69052e-4b2d4d8177bmr46741531cf.19.1756142920920;
        Mon, 25 Aug 2025 10:28:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElrTmsGh7ReiQT+rKWOGk73Md6WxupMETAj2QE15ZZrrWLzM1ZHzlak3lQmf4cmEkmQHgLYQ==
X-Received: by 2002:ac8:7dc8:0:b0:4b2:d4d8:13e4 with SMTP id d75a77b69052e-4b2d4d8177bmr46740991cf.19.1756142920362;
        Mon, 25 Aug 2025 10:28:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e20dac8sm16526111fa.8.2025.08.25.10.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:28:39 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:28:38 +0300
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
Subject: Re: [PATCH v3 05/38] drm/msm/dp: splite msm_dp_ctrl_config_ctrl()
 into link parts and stream parts
Message-ID: <vvemyg2t3ycjwb3uhwua7ow6yjvo2mnu5tdrqc3ed3iuj5ue3v@bfvgfhcxbgke>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-5-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-5-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: r_Zaz_hKbu3p-zmu8vfAxywZdIAI4v83
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX75qqh8FQ3jRp
 eNM8Nt0pNRYzGUGxeiihcYU6X/LlClVceas6G1L/OJKoBFjiG3hFA9L9qffSH5K6MLR9H/DZv+G
 2eONvYMnJ+IqKAdGzfD2Nf74L0uxqpAzk2Kuuhd11PWRPcw+0HPYMx4aW/MTLHM8ZOPPACxKCdk
 Im+z4NPLQDLpc1y/q2dzeR2PfkwBwNYQWDglZzeW4ySIQwOG8ih7PVespAWQjrYZXrVlvTUE3TX
 4XfI5eKVy6ITKR7C/Q08JsSCeD27D6rpDxJ4jz/RVt7hB0cgCfpXZq1nw3P/caV4Jh9eobKoQlC
 Qdh2MquvhPf0LGYvL+GH/JfjsqX1uo8Ra2Nq/DJukvo3l0/9VixpmMH0++YPnsqhfYMzkwPz/nt
 qBV7LpTK
X-Proofpoint-GUID: r_Zaz_hKbu3p-zmu8vfAxywZdIAI4v83
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ac9d4a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=irA99dXQLtNLEYesqbQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044

On Mon, Aug 25, 2025 at 10:15:51PM +0800, Yongxing Mou wrote:
> The DP_CONFIGURATION_CTRL register contains both link-level and
> stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
> all of them together, which makes it harder to support MST.
> 
> This patch separates the configuration into two functions:

git grep "This patch" Documentation/process

> - msm_dp_ctrl_config_ctrl_link(): handles link-related fields
> - msm_dp_ctrl_config_ctrl_streams(): handles stream-specific fields
> 
> It also moves the link-related configuration out of
> msm_dp_ctrl_configure_source_params().

Why? And it looks like a separate patch...

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 49 +++++++++++++++++++++++++---------------
>  1 file changed, 31 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index e1ff4c6bb4f0eed2e1ff931f12ba891cf81feffb..45d6c9a7f7ddaa049443253cbf4c6fc5feda3177 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -380,26 +380,41 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
>  	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
>  }
>  
> -static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
> +static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
> +					    struct msm_dp_panel *msm_dp_panel)
>  {
>  	u32 config = 0, tbd;
> +
> +	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
> +
> +	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
> +		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
> +
> +	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
> +			msm_dp_panel->msm_dp_mode.bpp);
> +
> +	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
> +
> +	if (msm_dp_panel->psr_cap.version)
> +		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
> +
> +	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
> +
> +	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
> +}
> +
> +static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
> +{
> +	u32 config = 0;
>  	const u8 *dpcd = ctrl->panel->dpcd;
>  
>  	/* Default-> LSCLK DIV: 1/4 LCLK  */
>  	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
>  
> -	if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
> -		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
> -
>  	/* Scrambler reset enable */
>  	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
>  		config |= DP_CONFIGURATION_CTRL_ASSR;
>  
> -	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
> -			ctrl->panel->msm_dp_mode.bpp);
> -
> -	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
> -
>  	/* Num of Lanes */
>  	config |= ((ctrl->link->link_params.num_lanes - 1)
>  			<< DP_CONFIGURATION_CTRL_NUM_OF_LANES_SHIFT);
> @@ -413,10 +428,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>  	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
>  	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
>  
> -	if (ctrl->panel->psr_cap.version)
> -		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
> -
> -	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
> +	drm_dbg_dp(ctrl->drm_dev, "link DP_CONFIGURATION_CTRL=0x%x\n", config);
>  
>  	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
>  }
> @@ -439,10 +451,7 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
>  {
>  	u32 colorimetry_cfg, test_bits_depth, misc_val;
>  
> -	msm_dp_ctrl_lane_mapping(ctrl);
> -	msm_dp_setup_peripheral_flush(ctrl);
> -
> -	msm_dp_ctrl_config_ctrl(ctrl);
> +	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
>  
>  	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
>  	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
> @@ -1614,7 +1623,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>  	u8 assr;
>  	struct msm_dp_link_info link_info = {0};
>  
> -	msm_dp_ctrl_config_ctrl(ctrl);
> +	msm_dp_ctrl_config_ctrl_link(ctrl);
>  
>  	link_info.num_lanes = ctrl->link->link_params.num_lanes;
>  	link_info.rate = ctrl->link->link_params.rate;
> @@ -2524,6 +2533,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>  	 */
>  	reinit_completion(&ctrl->video_comp);
>  
> +	msm_dp_ctrl_lane_mapping(ctrl);
> +	msm_dp_setup_peripheral_flush(ctrl);
> +	msm_dp_ctrl_config_ctrl_link(ctrl);
> +
>  	msm_dp_ctrl_configure_source_params(ctrl);
>  
>  	msm_dp_ctrl_config_msa(ctrl,
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

