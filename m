Return-Path: <linux-arm-msm+bounces-89970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNR4JpWfcGlyYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:42:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 446CD5497F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:42:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 52F1F5E089D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98315477E3B;
	Wed, 21 Jan 2026 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aokDvuBx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jWkCdUUv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44B547AF42
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768987745; cv=none; b=PBf94DbW5oc6+g2chRYTPCifVei3EfOFy8l44rYcOfttJHJQ4cqfVw3UDA26Gi6m1VswQ6gcXwWCjbJgUjhbtVPeMmXen0vp1oX/uyg0LG2q/2jBFTnCJfnyv3OzL+m6ZbRMUCDIjKKAJ3vStfMCfeuDi/DRcXZ6kWL+zBdwetk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768987745; c=relaxed/simple;
	bh=G7pX9SzudWOGRjUn5EXHItnQXULLCLZIFNoOGgOkFjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBtnROdbpDIHwZ3MRKeTsPJSY1x1VA82OiVbR+b2SdjYXa2H35dPnlnv/tNxyz67xSIHnLXluMP85gzWtPWd6vie2269YNJ2JSByCb1IsfYgnG94BimW0NpyERnh30Zab72gW1I3GQvRKz8y1j2jj6/RRRB4lEWIJUlSKkrL+Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aokDvuBx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jWkCdUUv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L4FHGT2840494
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EU8GGywpPwmeslWc7q2GR396
	jvB+VDAt7UBOjt2XIIw=; b=aokDvuBxxzCQMBbYzTW2SkuYwF9Sj0Qn87jqegS9
	QH7DAk29D8Dt3yH+1fxQrrSIkwT4V7QRZeP6sa/sMu9hr20cZJUVt6Zc2ScImRyF
	WmRQXqWGdqk2iTYI/NWwEoAXSwh/bivfJXhYg0q3Mshe6jM3NjqHi7DojOrihdQB
	XnF1hBiWlDytCbtmow0WzFH2ljTVt/gRQPkbl+3xMtIenHLm/4XEhq98LMGjg97O
	5Ai4EZaM+n/H6BmcL8DBAJTNPvyodfLsqmlDtuRSF7PdjzZrEMbe56lgT8K8+zy6
	ZeCUIJp0R63E//3ug6/t0IEymcUx1KpuxwJcXVA83gSRAg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btqm1s6fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:29:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5311864d9so332760285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 01:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768987742; x=1769592542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EU8GGywpPwmeslWc7q2GR396jvB+VDAt7UBOjt2XIIw=;
        b=jWkCdUUvGrp0XsGFc3BIWcmnybTIA9CBFTOtxwdhlCqWZsxz47ekY2IMavGyGiFqhA
         FroFJOYdGwCoy5SHedS6ltcmqS/8zps9kFzQd7V5a1RQ21SxPgtJoewvmTmB0UDKtAUl
         uy8JTWLX6CGpNhcl7Bz0kGTg0zIRgmVPUgnYAwdye4z8yhs/YRBDVNL2rjS9K467j/uM
         0PGqwUzKkFCyzK668JyaIEjtFdyxmGl+isGDdrH+UZQmnTsxYjQtGrHRLkEE/uv4j4GA
         ee3AhPM94xitROjN7Uys7IeN9RbzSQ0IInKAS2WGzGMJCQ7eCyIDfBY72wlwlk9STWV7
         daGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768987742; x=1769592542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EU8GGywpPwmeslWc7q2GR396jvB+VDAt7UBOjt2XIIw=;
        b=WWu1No/xELUyYIrwNQYWvV85vTbAm7dfJP9v+4K7TyqdzQsRh8OcoKzZE6Mg2N05AI
         wDQMxq/RqX8oHrrg45beYuQrsqPFosrMyXaaJO/7UPONsXPh4Y9mCF0Cb2a89OEkXTRx
         FXqvx7SVJEYJosAGw+cgY8rzJsyAVo9DhIGOaUXWtYoWMs8I4qfpdzVaALveH9Qgm0f3
         rR9Wo7wMXXeM+/nwQfuOG5GnF5THnsUT0yJfQYVaGXn6FSaiqCI5SyNDbeFqayvlGSiP
         sSW8N9QXvjEkZUfk0qtMq/Y+JAtzcn90JR8DDDUMoLAuxd7CWnOkGyhAdkjmlc7iGn0u
         TkPA==
X-Forwarded-Encrypted: i=1; AJvYcCW+Ya3xVZ+B+vfJw6HMDwEHryJNW8gF4RNMJ9/lFfZkvF3l4LM9bbw1hpfU6HJ5phTz78A9xkPfTuWt8GNP@vger.kernel.org
X-Gm-Message-State: AOJu0YyfTmMNmPYTJnpHSfn4tGgtIeBdH/qFDNNeYr5gBktcxFy57Kb6
	MQfihqMlVhw+VUv1jXknzRbOEKHclBJ98O0f0050OV25qeHPQHlMTYNm3j8LBU8nVp6w4vz8N5m
	SAHqcqjNRVu2n2MPnAtzXGjqnfXsgesRhSta0CdKusK3vjCFb75XAjVE9aXWql6JJNYVW
X-Gm-Gg: AZuq6aKDJs7T0jai2d7T/ph5YviXVvdms+VlmtDVOfcoZFW1OB9E/MBkZqVhIy65Tma
	63SY46Y74D9VUeF5plOrSCbRcpDIo8o1XHxk+2GD24cS2BbDYiJTlni3C+UesexUYgjErJx2t04
	6UE0uMzV8YWk2eE3Dkv2yBM0fHRIDTVadOgaVYe4kHujnRimxYhbo1LvAByWjBtb/82FtxvAMgW
	SGB8DVZVI1CU5362CAOhF0XGS2QZ3+Qh3On1k8XTrtGCg3tkkFCVokdZNSN670mK08kDuhckRw9
	71QH6QfHZwgNxP+9l6zQ6m8rSTds4xkipmAgfQje2jc1Syd5ztX7q2o1uZSvtEo6z23zFRE/zeE
	ojs2y0uDga2uvSy9ky5TPdzxbgSoXfoe79W39m0SXU+TaeoCFG28HRux/LmMioznjyIcCd0ZbwQ
	UCRmP7lcF+K2hJZpiKmbTpdP0=
X-Received: by 2002:a05:620a:44c6:b0:8c5:38b3:fefa with SMTP id af79cd13be357-8c6cce4ffd9mr585409285a.79.1768987741629;
        Wed, 21 Jan 2026 01:29:01 -0800 (PST)
X-Received: by 2002:a05:620a:44c6:b0:8c5:38b3:fefa with SMTP id af79cd13be357-8c6cce4ffd9mr585407785a.79.1768987741207;
        Wed, 21 Jan 2026 01:29:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384e788d5sm47898771fa.31.2026.01.21.01.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:29:00 -0800 (PST)
Date: Wed, 21 Jan 2026 11:28:58 +0200
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
Subject: Re: [PATCH v17 1/4] drm/msm/dpu: Extract plane splitting into a
 dedicated function
Message-ID: <6ymh64lnipo5pncnrlipbb6zl5xyxxnaqieg52hrylmknqumyj@ovaspuihqzy6>
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-1-6eb6d8675ca2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-msm-next-quad-pipe-split-v17-1-6eb6d8675ca2@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA3OCBTYWx0ZWRfX000hoET/Q8Zc
 j0UVKAiKd4dnDZsHPG5TChoJNKuhT7/9digKtz0aTgBxfQP3XFibXvLqJVTC38waYX5MI0gTDHs
 zTO/soNDWvghcxp+h0A0hyEKfULaSRc2FmB/hUhtbMiU3CFhY7lobj2a8w1DS32zQ9nLPRv76X+
 MVRGChd+zVikKf8yE89wCcOttVZvN7WKrYk2H7c76DyFztH72Luwp+RDU+H/S/k7d8KjtcE86EW
 m1I6hEw5CPdNRI4o9/n8p7p1lq9lT1OPLD1Kik2ucj9xOFf8IWoFLDo4hZit/BmTDluUrUoGm8T
 nEa1UhPxtzcsvrL/CRXqV+O3pC/O/vPWvQajCaSTxQvmpp1BIBt/AnH5LCUiaxw+UXNAJh83Jfc
 VdFZVLS4ni8YB/Nt3BmtdAa7jOTnsTfql3wr2JZ5H3xCim+S59ywF7TjH3gkcDzFGjmujcXHOAG
 CG/sS5MueBRjE+xjg/g==
X-Proofpoint-ORIG-GUID: p2O2ZUqDAb5S4usNAV3O4tq0sDbFQZgk
X-Authority-Analysis: v=2.4 cv=dtnWylg4 c=1 sm=1 tr=0 ts=69709c5e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=3lNzBIq4ENDdFANmQEIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: p2O2ZUqDAb5S4usNAV3O4tq0sDbFQZgk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210078
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89970-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 446CD5497F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 04:01:50PM +0800, Jun Nie wrote:
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
> @@ -879,6 +866,34 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  		if (pstate->layout.plane_pitch[i] > DPU_SSPP_MAX_PITCH_SIZE)
>  			return -E2BIG;
>  
> +	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
> +
> +	return 0;
> +}
> +
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

Why can't it be moved after !visible check? It's the first check in the
function code.

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

