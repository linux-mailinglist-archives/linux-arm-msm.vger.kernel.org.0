Return-Path: <linux-arm-msm+bounces-92810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sARsIAFXj2lqQQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 17:53:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC91413864D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 17:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F3AE5300B581
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 16:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BA116CD33;
	Fri, 13 Feb 2026 16:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvqAtH6N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H7zhlWj2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B7B2989B0
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 16:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771001598; cv=none; b=W7b0KS6VRcNMbwrTRbSZxfQHVJIocoFZ7fujJ0Ftw4h0DGWDMZAs6AfVklAvWEu07j0a9elQ+y/czvuMHBPRK+tOE7jmTreHSNEH2ddWuUIKNDdqeK75gOUuJClTYNQbDt28MA+Ym5nczdkibIJChyhqVQbRIV5lmVcFizIfkC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771001598; c=relaxed/simple;
	bh=OxdWZl2hq5RXjoNnJ3aZKH3EsodMrWzHmdwSKv6NdZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mml705NBgZCQPbVH2n/4OPfnkL3IbZgt3xyQUuBnPsLWy1e4UasMsCRkww0wS1K+DjtFOhWfKua5ksxWNj1tGMVa8BejBARMwkW54Xoo1q2bJtchHHDQGuJnPwKQBUB+/lsNE5y46oKxX6gOb3gFYQCwidtVCiD9I1kSIQVG59w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvqAtH6N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H7zhlWj2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DEGmBH4034677
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 16:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/oVMsUgTLZaMOKBsltA80ghS
	BNzy1i2pQtxl1eCTlPU=; b=SvqAtH6NS+fUPv7uVXCQOUVe5si8dJZBBLTMgWRR
	Hs+giu0D0us+9mF3WBlEZfLeGRmObN66c8Ls5I7sS3/MrsbC1tjeRJPrQ+k/ATZh
	of/KiouMcxh+F+z9PrRJ8EUde/3xVkyZhzuD1FfUT7Hv7IkceWf+KB2Nx4YOgS9t
	yyq3Zt/rQMZPfhLxltG9qKb2E0pXYnbuezKagq2PQT50lE6HV5D8Uzcj55N2xHTT
	YK+JUFhJFBEX/LhR+uRUWHpvGUzXLonsnAU8hKfuqDgysRvkqkJMQ4P+KhT+9Bvs
	HOyyqJEjcYfE7HKzhzQkQxMIUxeFCvJe+VdJgCszDjTgsQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ca1hn1hu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 16:53:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-896ff58f17aso58546746d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 08:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771001596; x=1771606396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/oVMsUgTLZaMOKBsltA80ghSBNzy1i2pQtxl1eCTlPU=;
        b=H7zhlWj2TkHMqgAHlR1pUyRD0BcJ899qE9S+xA/k76X8MYjMWSjn+yF17Ihjvre93W
         hZxn+ltRdqSi4BV1uwptAswuewgiCow84jx5N8BFpLPNHsZka5WSTr5gaV92xctk0GSN
         gfk0TWWSl1wZaDMM77fo0zUYf/5O9rx9pM2LUxnLrlqkmatMQbmPrORj13Tx17ANJnVj
         VXaQR7cwr6dn/k38J8qk3HsRrYbzWSZ0+a+SAm52lLb8b5S/scXkb7fDRG3j+Dyz/SJh
         PzV69D0//BrT35rSGiDROUn4I7juNVYWuMcN8Q+Qq9BsKuhXZ4EM954CMoPIGVT6M2pa
         8a9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771001596; x=1771606396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/oVMsUgTLZaMOKBsltA80ghSBNzy1i2pQtxl1eCTlPU=;
        b=imDkysHHYw2/5CJSGahDmbFToHChnrWflYuLM5dmyAW0j3UQfzj4xdUd1JvWnm85F3
         D8SWe/sxA93O3vHf0I1THvIAb0VuQdJzVQDXumsDicmLTOENh9VIa0k4gKLu1cxxjIaT
         3FEmMOrICFAn1ymJ7ORhHTkyJ+oTTfR7N5GOcIOh9PRkSPT/GCQDbCsH+orC7ooEbKeo
         nDPUB4Kv0uSOrIwN0Y2jBnY/MnhLOE8iZTUe+LtOPHox8R6ZH6RMuf3/0FPFmkiC3sSn
         B6p4trUfbbJ8h+ul+nilmUHyD00vTGDybCDETUfYYR8nJy/dpZ70gTAl0bEQzOQWh/Vy
         Vyzg==
X-Forwarded-Encrypted: i=1; AJvYcCX2s+KiYqPprWdHVbT9R5FztPBk0dXB1CYjxCvG+vkSXqT8Tsy8mzUQix1EalyOBfGDcKk/fOUxG7fd6Mw3@vger.kernel.org
X-Gm-Message-State: AOJu0YyNoNJpmbnd/7rrqDX/Ev7UZgla1cLqJqTfUkw51RqqDQpG6RDM
	r/1E4VPX+xXmPGBnrHIG48w4xnR3w3xmDr+tTJjUamTRZ6ptDbpaHFxOco5+V6YCdQxyLAk1bpK
	MJLMKTatG8gxiPaEWskyKOxs1ZlRY+c/EW0G1PfxR1LlBUkJGxyL2j4+veOaFQwEJ1hP9
X-Gm-Gg: AZuq6aL2PX194kdpbtTnjA+R+nCU15+/28QTao52qvQ153Rc/9CsuGdXXvCjENYPm9R
	DE7nNQvIEYvyVp4m69hBmoducGr3Wk8nfykvMy5bK2d7NeOmipnVGPOuspp+tm8LyIv6eIqL3Sb
	ekP7sjWxCmqgrte9SVCUu61e9hOfFF9kmJO/78IhW6LuADl4/v8H9MRIuEw68UlD48+0Uy7vK7e
	3SjzWfGVj+rPMmdC9cw4FTvNMupqU9Ra6vlGuwbOFpYi7EhOyXtagHeEXYAV5cKpQN5j1nLMd8/
	kn93ZJdPS7/j4MOK8yurATSZUn3eEgHe7UhiIE4UBVWNAWNMfnzjpg8T8dQnAqn/FaX4ii4gyxt
	0b1qu2hx8X1BTWUydf5Xbyrvxx1Cf3I7TEe74+BZry13ljwgFeZXBHi6Kw2B5sAQgLNukMMr3dH
	wTbfLmlxGv/A3ZPWacdkdZdWi82rFO8lP3j3M=
X-Received: by 2002:a05:620a:3187:b0:8b3:14dc:4821 with SMTP id af79cd13be357-8cb4225fe2cmr301758885a.3.1771001595650;
        Fri, 13 Feb 2026 08:53:15 -0800 (PST)
X-Received: by 2002:a05:620a:3187:b0:8b3:14dc:4821 with SMTP id af79cd13be357-8cb4225fe2cmr301753685a.3.1771001595056;
        Fri, 13 Feb 2026 08:53:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b6cb1sm1673648e87.84.2026.02.13.08.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 08:53:14 -0800 (PST)
Date: Fri, 13 Feb 2026 18:53:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 1/4] drm/msm/dpu: Extract plane splitting into a
 dedicated function
Message-ID: <jbd4snirozad7u673dofl34xhpulybbmsyibijohecazhov6gc@5k2xqea6ofci>
References: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
 <20260213-msm-next-quad-pipe-split-v18-1-5815158d3635@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-msm-next-quad-pipe-split-v18-1-5815158d3635@linaro.org>
X-Authority-Analysis: v=2.4 cv=Wt0m8Nfv c=1 sm=1 tr=0 ts=698f56fc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=KKAkSRfTAAAA:8
 a=LT1BtIMsji7uXtgOJFYA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: JuUgFQ1UhIpg_2qtrttNCs9jomxWHkm5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEzMCBTYWx0ZWRfX/SdmOodlzX24
 kfBMWdtITFoTw6GsLQ/S1I6f+t99o8UDUrpIQsAIJqtecSpFs/kivF2bxCk+xD9BU0H1VgtTING
 Wan63EG+6LVn66jcMlPUiXli3uCB2iLSC+sUBfHSbRtnAaMuH/xmPuDwtj7QaYs0bwU5uMg305T
 TXueerS/NekDNZ+uFrpbJJK4K4o+PCjOSH9EU4d+kzlVovK4m4t32FIK84Dgeepj3jNKr4/v8oe
 Pq4vuyUJM9988HNPVSmhJYROSlLd/YamGbrGQclhzgJtPrHn0h2lmNqOGiWxzVojGiw411sxuYm
 w4c8ayZFQGV9fAnSZBJKZWviTppG5QYkxTFWNXdA2CdrgwbfYXnGeKlBFktdbrj0V/aX8YbsXYt
 QzOb2EKXh0jGXvPgAHiVg+xsxC8LRVCv9AdvFjs5zymvImKFA8x7i0EZxxjDIHj+KvwMJglr5Ti
 b2LSnSwvSWoCuP2V2rA==
X-Proofpoint-GUID: JuUgFQ1UhIpg_2qtrttNCs9jomxWHkm5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92810-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EC91413864D
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:54:25PM +0800, Jun Nie wrote:
> dpu_plane_atomic_check_nosspp() currently handles both plane
> validation and plane splitting. For better simplicity and to
> facilitate future refactoring, move the splitting logic into
> its own dedicated function.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 51 ++++++++++++++++++++++---------
>  1 file changed, 36 insertions(+), 15 deletions(-)
> 
> +static int dpu_plane_split(struct drm_plane *plane,
> +			   struct drm_plane_state *new_plane_state,
> +			   const struct drm_crtc_state *crtc_state)
> +{
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
> +	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
> +	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> +	struct dpu_sw_pipe_cfg *pipe_cfg;
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +	uint32_t max_linewidth;
> +
> +	if (!new_plane_state->visible)
> +		return 0;

Wait... This still isn't improved. The dpu_plane_split() function should
not be called if the plane is not visible. Move it after the check.

Yes, it is currently a part of the code which is called before the
check. But there is no need to keep that.

> +
> +	/* move the assignment here, to ease handling to another pairs later */
> +	pipe_cfg = &pstate->pipe_cfg[0];
> +	r_pipe_cfg = &pstate->pipe_cfg[1];
> +	/* state->src is 16.16, src_rect is not */
> +	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> +
> +	pipe_cfg->dst_rect = new_plane_state->dst;
> +
>  	max_linewidth = pdpu->catalog->caps->max_linewidth;
>  
>  	drm_rect_rotate(&pipe_cfg->src_rect,
> @@ -910,8 +925,6 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  				    new_plane_state->fb->width, new_plane_state->fb->height,
>  				    new_plane_state->rotation);
>  
> -	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
> -
>  	return 0;
>  }
>  
> @@ -1129,6 +1142,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>  	if (ret)
>  		return ret;
>  
> +	ret = dpu_plane_split(plane, new_plane_state, crtc_state);
> +	if (ret)
> +		return ret;
> +
>  	if (!new_plane_state->visible)
>  		return 0;
>  
> @@ -1169,6 +1186,10 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>  	if (ret)
>  		return ret;
>  
> +	ret = dpu_plane_split(plane, plane_state, crtc_state);
> +	if (ret)
> +		return ret;
> +
>  	if (!plane_state->visible) {
>  		/*
>  		 * resources are freed by dpu_crtc_assign_plane_resources(),
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

