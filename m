Return-Path: <linux-arm-msm+bounces-60651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5A0AD20E0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 16:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3164188C454
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E83259CA4;
	Mon,  9 Jun 2025 14:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGlxAggo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F99171092
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 14:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479264; cv=none; b=NcWMZSp/ptR4NyOPIbs25jyZXxsOv9zH4+CbcjIbR9LkP+Pp6oAIhiSGo8NBS4oW8/ophXaCYsivcWyNeonIjanJQtb6Onb77CD7twRRQxVvQgHAdoUNVIc/f7n7KTwys9ImUjyG+/uZULfQyssL8kywRR3KvSlFe/WI93/VVUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479264; c=relaxed/simple;
	bh=LLzqVkhm3akqetdtHVs9jDypIRISAdJXK5ZFhM4Ok1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqGiB+qXSW422zgW4LSDFTMj3JfVQ5Sh/TXHYra8zwtxn16wZf54webzkolPfHcK7/ZoL17OCB5a6cuKPIg1CVW0jfqKvObZ0S56NDq4+T4wkJEnnnpUR+sl533B4VEnW5lV7S1A3PkKwLkGLjQKeak66Z6qwhY/qWcwPK3fMu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGlxAggo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559BMTTD020152
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 14:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f/of6TTom4AU2Dvwq6I7gBZ0
	T1k7Wh85jIn8qO8HSos=; b=PGlxAggo6JmRUYZlnbJIreFKI7ywwLexQnAwMDm3
	UfrYRr4rudsM8In0zflz6G8VheoNGziyS+GzNcxC/9brNVKjhtpdWKeGt9VGZsis
	CxUtIKazhK/1DoWawXaYKewuojWxLuImek6oGgC8asE32EVZ5sdC4xEmM2Ltblf6
	HK2WQM3LX2LFrs+hrDH7VMk4kNHwfsuTBgWLKoK7ljUSB19XGyFAMIp3sSqymJip
	tGJrIH8W76wzZViQ9wRIe6kbMMvpGdSJrOV7ifro9R+Sijhyszy4TQsQHcDWr7ko
	eXv1D8yEBAxqJ6Ba1m9X8layu2zZf4xSqKg5Y8oxMf2i8g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475qctsqpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 14:27:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb2293bb84so2687436d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 07:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479258; x=1750084058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/of6TTom4AU2Dvwq6I7gBZ0T1k7Wh85jIn8qO8HSos=;
        b=Cr1Zho7lX2f47CI1JEyLz5tw4ntMc12BrH3LfD6k3Q4BwoxAmOQrGeD1seWDEYlCSG
         pNEDau9h+rFp7039/jUzXbwMYep2VjPFzmRnkFC7v6BkqSOykTUCt6pkoVL1e0m1ZKnG
         3djekgR7S//zN2eal4FYillJ78ovvnY41MaH8VP207zp+Te+rbx3c7IrBJlbPWIOM3je
         MN8yvSslCgE+6/HLce9IuCvb4k6dvx4fFhINcda4XxCODMLy9Fke8KN40ce1Um2f3OWL
         iHe62usg+t4PQY04vEQF+1SZ1xk+hquzo2DzHXE40Uc25FVK/OkvVfLwPvlEHax8nwfP
         RBrg==
X-Forwarded-Encrypted: i=1; AJvYcCW9wijPe+6OtwHGdgJl839sS4/4WZ+vRgdb1QvEyJCQceiZWFcVU/XUnFfDX/SwnAUzhS298eMsKAyCm9DK@vger.kernel.org
X-Gm-Message-State: AOJu0YwcEi8uglf57l+vdxwDNXPmjO8qov/XNYgxv19L8/ObgkY4lQl8
	DEPz4tjCTWSIYCPgbEiiLnuXIgwC0P76DK0JqOXUhzjcLfAfqLD5uxP5FHtaWi1bFl9V9LAJH7h
	2bN48iOKZRdBsy++KHdNY12U3lOYcW7Er6cRNy99lXoqH5FfXrR2YGngF0scuQyHFdrEX
X-Gm-Gg: ASbGncuICo9HflXUXTh1u2Dl8J/xTB3JNE7wzGfybV5mjo6iGajvhKOmveuiYa2jGn/
	dRHpwufcELBtfVnqedi7cNxixsslh1Mlw/bMmRfkdsfi3/uP2vP6Cf73C/a/4bFUtz5HwOkOFMh
	BTiVsMieTOiB483ysSEjSNc3xl9747wiyXRwCm22EFcLFJPPrx9L9nKCjotnLEs/67PlKHVpfGp
	30hYgIA5ZjBOSeFfQieRFmwpr7j8mD12IvS+5rdZi/SK5HxaGPuAwYAteyYKLQGws9a0prqQxix
	CA8RqrwJUohMgMreFgsNFIfFldv5lXW0uTiupJqE0SF8fdoMqYAlcgfCXeTXFcu7y20S+NEoEiI
	=
X-Received: by 2002:a05:6214:c68:b0:6fa:ca81:4121 with SMTP id 6a1803df08f44-6fb0905b95fmr180867576d6.44.1749479258410;
        Mon, 09 Jun 2025 07:27:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENywj9pL8N2WDsT8WlwUxJkuPyVSuk0P83Ce8cs9bs9NhhCmWwbrm8PLpnm0ddvieJHs32lA==
X-Received: by 2002:a05:6214:c68:b0:6fa:ca81:4121 with SMTP id 6a1803df08f44-6fb0905b95fmr180867086d6.44.1749479257879;
        Mon, 09 Jun 2025 07:27:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553677222edsm1176230e87.122.2025.06.09.07.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:27:37 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:27:35 +0300
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
Subject: Re: [PATCH v2 34/38] drm/msm/dp: initialize dp_mst module for each
 DP MST controller
Message-ID: <oy4inbe4jg5gw77sgrkcgi7b442fqc4muiuwse5bffbftpmcbn@ajqbpxorszk6>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-34-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-34-a54d8902a23d@quicinc.com>
X-Proofpoint-GUID: T9DwHP46AfeEJV_4Kv1UVrZCTcCEFE19
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=6846ef5d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=ziSFFFU8-FvEhn5Yk-UA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwNiBTYWx0ZWRfX9+o9o9KgOtvX
 MEQxImcKv2BmSUCynYBCtpZY8lpTjU963hJLpoQQbLHLp0wO5i+YHZVCDQgQa4MN8E5nolxX5Fy
 LhG+z90gQUVFKYxiD/aeE5X9md2xgUhj8xVHKPsuiD3TPkhaSbummbLtZa23dSSywYkdU/jfI3S
 qmd+eA+tCNA+Ry12oySrL4EB4x1cZvB/PMsVUSy3UNdfPamc8BqrGkPnrI8gd3hTslkURwiAIts
 YC1B7iWZ25m4lVeXWIxet8YrNZSH8lApjapXR0MNFZ2fWHWEfQFoxvJqPMBa48hzt5E/PWV2CNw
 +ZBhXOmF9EPjuoDWxNILHU4+hEK40FFqFp4Vql2iN4kR41yYdgNkg16IGNSKdlTzCQSus7J+86e
 2DhGn75hD415ES281mIALcCcNfsW6SMZy6Qs+dB9wNFwiSUdQ0aFOcDZyoA6QxS0MlkXsplG
X-Proofpoint-ORIG-GUID: T9DwHP46AfeEJV_4Kv1UVrZCTcCEFE19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090106

On Mon, Jun 09, 2025 at 08:21:53PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> For each MST capable DP controller, initialize a dp_mst module to
> manage its DP MST operations. The DP MST module for each controller
> is the central entity to manage its topology related operations as
> well as interfacing with the rest of the DP driver.

I think there is an ordering issue. Previos patch has already registered
MST-related objects, but only this patch provides a way to init it.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 ++++++
>  drivers/gpu/drm/msm/dp/dp_display.c     | 9 +++++++++
>  drivers/gpu/drm/msm/msm_drv.h           | 6 ++++++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 45fedf7e74e9c6dfed4bde57eb675e3dd1762fc7..e030476dc4c69448886c29bcfe8ff3105949b129 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -680,6 +680,12 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  		stream_cnt = msm_dp_get_mst_max_stream(priv->dp[i]);
>  
>  		if (stream_cnt > 1) {
> +			rc = msm_dp_mst_register(priv->dp[i]);
> +			if (rc) {
> +				DPU_ERROR("dp_mst_init failed for DP, rc = %d\n", rc);
> +				return rc;
> +			}
> +
>  			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
>  				info.stream_id = stream_id;
>  				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index ab1ad0cb6427eb4f86ee8ac6c76788b1a78892a8..526389c718edccbac9b5a91e8dabf0d84ed1a8b0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1667,6 +1667,15 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>  	return 0;
>  }
>  
> +int msm_dp_mst_register(struct msm_dp *dp)
> +{
> +	struct msm_dp_display_private *dp_display;
> +
> +	dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> +
> +	return msm_dp_mst_init(dp, dp_display->max_stream, dp_display->aux);

Inline

> +}
> +
>  void msm_dp_display_atomic_prepare(struct msm_dp *dp)
>  {
>  	int rc = 0;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index dd403107b640ee5ef333d2773b52e38e3869155f..1496700c38ad73d6edcf56fbb0ebf66505c608bf 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -374,6 +374,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>  
>  int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
>  int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
> +int msm_dp_mst_register(struct msm_dp *dp_display);
>  
>  #else
>  static inline int __init msm_dp_register(void)
> @@ -401,6 +402,11 @@ static inline int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_e
>  	return -EINVAL;
>  }
>  
> +static inline int msm_dp_mst_register(struct msm_dp *dp_display)
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

