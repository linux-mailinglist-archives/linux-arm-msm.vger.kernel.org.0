Return-Path: <linux-arm-msm+bounces-70927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DFCB37072
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 18:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D4D8188BD2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 16:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5389D2D7BF;
	Tue, 26 Aug 2025 16:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsmTrUHG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF84435206F
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 16:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756226015; cv=none; b=XVaofX3o5fX1BnD+E8E3RNJWi8ATXTrimg0nuh9d/QZrml943korxq5GY3j01p6PiC5uL/353XU5IV7aNw6kFV9ZNJnnvWVIl32ieht9lHX/yCOvq5tf4ZgEh6dQoDGpB8md40WV3lePwQ1/igKYUETMcVfgTNh4TO3iuxAChFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756226015; c=relaxed/simple;
	bh=Cnz7D0UPWrRhgGtUPKfg6pk2BWK8ICoo9Tvq1LmKrVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7h+5zDpKMF9lrc4c8P0mZnZRis2PHmLkOjecErtS04x49ZqgcnaWPtbxsikVr4VCiL6WnG/wPTNsFkt5WxFmZm1OX6PRFLvvTb6ikhk6X2zc0SOVLE2snGC4HBJKcuOcKD3aUEyuVe3nqvZN+yks2RB5W5FWPuHSjxHy5JIlhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jsmTrUHG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QBjZUc018404
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 16:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o0JNkVhBc++JdNPVvj2G5Tj3
	VEOgkLl+3jrDv6VD7BE=; b=jsmTrUHGvaBkNoJMv6AJPlvdxeSRoOXScDgdF8H5
	yXOY6bOIi/t8o01fuV9IO9u0u9bMxb1l21mNd+/Jb30e07scPF6cc/eWbSFWLTFd
	Q006RaI322lcHeEaHgQsi0TQBWmN+eszFaZZixyp+V3QvFqEJNb1j3LmONws8q4+
	+VzKEQ3vxORktU3MqJWeQTYwmkY1tNBSC0awih42NN4k7NxJ60O/5t23HT8aLGoO
	rxJiAeDAImklFPUzmy1ZwWGjzgCKlGXzt2h+HZBYdNfcJruN68YReBM2hNG+Ofx+
	LnHV77cIJplKO1g4jyBlcstYoQ3Pj5x1HXx1IfWYWGv1nQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpssr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 16:33:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70d9a65c386so89342786d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756226012; x=1756830812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0JNkVhBc++JdNPVvj2G5Tj3VEOgkLl+3jrDv6VD7BE=;
        b=PEOoSkSxNnaz2oVUI70di4ke2KqKRzddJpVqAZLUa23eEglFQgFRjYaQEMg+sqh/Ka
         dRPpPp3p2RLeuH4ryfQyh5gf9myylywg142n4zkw1/63RCAUSLdM9JhGgyRokG16KXNP
         /xtdjAZqitjj1gIna7sKa02xiGhMg/x9VbbGDAFui+/F1nZH4+KFPiX6heqqNCTgTUEy
         ZPRfuDwOC3r3vAA37R9Ore+nS5lbPIdKfS11nOjEkaqnhUeRXPq27j650c2wkpnXNM/V
         fC3EVIHtMmvcgVk6gcJf1irvqC2BhHkHDtG/LiShOJV7xFLP+YM0LO4ArkWJwm157yNM
         B0aQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1IqKUvj1ZPQEs6b4tdlR6R2ALsg8Mh24EShP3xIEv3hSXr11tAA7XuLcewQ7gMtI+c9okm7zuUU3SDCmi@vger.kernel.org
X-Gm-Message-State: AOJu0YxAXocxQ1y3+2C7KoGBPjqX503pJVuTCjJ2z7MV8b8zzTaESFbj
	pk+yO5V+SLTAzZghvWNgxHcH5FHKO+HgaHyDxRz5/WJYvJzMk1DeAwRFRFxp908Yk6blEZgeioA
	SroQSq7Xic/OfDfkmMW5nOcNNb+x/TC69ttY5gPtc+rsM3Zsa3cEe+gTSRCHWUtx1KXTn
X-Gm-Gg: ASbGncsvJ/e0urUCtmigwwQhqQlibkLDVA+yQHL3DQL9SPzvS1/j1gg2iG3OT/nhPF3
	eVRUmnKL/KpNQ7iAcSQfo/9nuV/9NNKuq5yG5n9f/E0SwfqELem5F+cM+e75oh3FiyKSJ4eEwMX
	ar+nY2mQI/WAs/Eg66Wct/lxHrjKJMoUr90qtRbOgLafKZMP4q/uh26IPBEqXYbH2L6QONLwkEZ
	2KURbqvUK3w5gwedV8E6KbgR4PKgb4a2Gzbl0XkHBKIeMGfsRI10LJwEBbhLSxOK3YaeOzREHip
	H/2V6i7CPwBxat5fQQjLq5xDi58vcGk0u1L+ibX/HcIBhFe8Pu+khoFAuhHpufdYQ8tFroA+dl/
	fe/9rG+BN2Fjh6Qa2UfwKTQ5t6M6/SpKPBYzWm0V+G9gljrMn6uD8
X-Received: by 2002:ad4:5cc1:0:b0:709:ee07:daaf with SMTP id 6a1803df08f44-70d97102f17mr190928296d6.19.1756226011457;
        Tue, 26 Aug 2025 09:33:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ7aaOomBumnrq1rhi9jEEdDGg0wr1dDNic05npTTurzd/gV21cCPu8vrLKpDQ36ehil5Qyg==
X-Received: by 2002:ad4:5cc1:0:b0:709:ee07:daaf with SMTP id 6a1803df08f44-70d97102f17mr190927636d6.19.1756226010771;
        Tue, 26 Aug 2025 09:33:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35b27683sm2357303e87.0.2025.08.26.09.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 09:33:29 -0700 (PDT)
Date: Tue, 26 Aug 2025 19:33:28 +0300
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
Subject: Re: [PATCH v3 27/38] drm/msm/dp: add dp_display_get_panel() to
 initialize DP panel
Message-ID: <smvfckejheyi7oehubdkhnh6pxokn7yugvlrynraypsu6kssj3@6vinswn4yku4>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-27-01faacfcdedd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-27-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ade1dd cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qYs0ZBLfSisuqDwih3YA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: V644WeWnHXvlyhQ3TtPTixPFc-Xpbn3l
X-Proofpoint-ORIG-GUID: V644WeWnHXvlyhQ3TtPTixPFc-Xpbn3l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXzN2srlsDnpBR
 J+00QpjrWnldtEeWiLZDmJ1Lus42KguDDuxRhnFptXBq2MREMoBTKfCUUPAA+CRThYlYyLsjjP2
 Fva35EVZGqaVrni/HW+CTZ3k2JbdGldxm2wqlw/X3Q2/S3pUgp4XjO4X9BOEytAI94DZc8BfqsE
 q4lUlKnF2i9zANMF7XIdD0KtxSWegtMVxTYnlxEAG5/saFIOQr8bWdHMrSGlBNWcVTwXlM2i8wd
 CaYwzcLHgsxJbN3jbjSP08E8NyU41HlaSP44iF4DH3BnjyCRkkHECs3pUJP9Erm0OX3EFismMGy
 5scsWDM14s6bgTHonjaya9YKEo6SMdp9zwogf18WobcI2uKiMKC8aEQaO9VU4m9XrUK7Bs+4ViP
 iUU0f2ts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

On Mon, Aug 25, 2025 at 10:16:13PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add an API dp_display_get_panel() to initialize and return a DP
> panel to be used by DP MST module. Since some of the fields of
> DP panel are private, dp_display module needs to initialize these
> parts and return the panel back.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 84df34306fb557341bea288ea8c13b0c81b11919..abcab3ed43b6da5ef898355cf9b7561cd9fe0404 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -632,6 +632,29 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
>  	return 0;
>  }
>  
> +struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display)
> +{
> +	struct msm_dp_display_private *dp;
> +	struct msm_dp_panel *dp_panel;
> +
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	dp_panel = msm_dp_panel_get(&dp->msm_dp_display.pdev->dev, dp->aux, dp->link,
> +			       dp->link_base, dp->mst2link_base, dp->mst3link_base,
> +			       dp->pixel_base);
> +
> +	if (IS_ERR(dp->panel)) {
> +		DRM_ERROR("failed to initialize panel\n");
> +		return NULL;
> +	}
> +
> +	memcpy(dp_panel->dpcd, dp->panel->dpcd, DP_RECEIVER_CAP_SIZE);
> +	memcpy(&dp_panel->link_info, &dp->panel->link_info,
> +	       sizeof(dp->panel->link_info));

Both these lines show that link_info and dpcd belong to msm_dp_display
rather than the panel. The panel should only be describing properties of
the particular sink.

> +
> +	return dp_panel;
> +}
> +
>  static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
>  {
>  	msm_dp_audio_put(dp->audio);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index b1ea027438d952c94f3ae80725c92e46c631bdb2..d5889b801d190b6f33b180ead898c1e4ebcbf8f3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -65,4 +65,6 @@ void msm_dp_display_unprepare(struct msm_dp *dp);
>  
>  int msm_dp_display_get_active_stream_cnt(struct msm_dp *msm_dp_display);
>  
> +struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display);
> +
>  #endif /* _DP_DISPLAY_H_ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

