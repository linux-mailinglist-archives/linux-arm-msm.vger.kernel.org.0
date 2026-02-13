Return-Path: <linux-arm-msm+bounces-92811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFFYHKhZj2lxQgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 18:04:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8F713878E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 18:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA1653023E29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 17:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184772E11A6;
	Fri, 13 Feb 2026 17:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWGbedGk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hknI/bcz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22A132939F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771002223; cv=none; b=Es1d8dncRO2CFA33jMG20v6Z2np5oxVge2xlT8BDQMW9aNG/QZHQ3ZFeHb81ngbPP3m3ej7x1wPJtQ6wYlR3QtOTKcituJqin8lOgBTuLk3k8qwj/8AsUiZ6xOZQ78e1swEZXEFC1uDwEkHXjJMBurtV4R+O3IRweAAGDt+8XFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771002223; c=relaxed/simple;
	bh=ZQX2bjrBtYLmsFz1nwsHAQ+4ePkQFNrITNwpVruLy78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4pwwoJ/f0QTKaNfuj3qa2VrGTbp/Fommr/4xeiqXtQxH2sPp0oDwuyyWmeJlu6DDh6s2XtAcYOgkzrPr+WOdcEEcJpyIzS3I/9AKCzqRkxZqVjDaOOTg0ZJUH8atmHpQVIM7I+tLWlbODZkAkG2EGk3fm/czPlgr9H8Wgv7G74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWGbedGk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hknI/bcz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DFiMxV1642266
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 17:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YZdH6ExLJouxP5fU/TtsTdoL
	JnFhnqsdlD+R4tXVzho=; b=FWGbedGkWjAaYNkG70roD9icnTsPN5ESxS/YFIYf
	r5s9Ni6T+tUFImBNVwUppc0cL29KziDo5PpXCHbdl1YPd9MSr5CTE4LqbvwAUNDh
	+qqvyV9Ua8VP+sIYODj7pj6Yhig3HFgVxAXYCUAf0ceD91AHysuEKfOphpEBKvSs
	shV6wOZMFzr1G+jjgIDYieAECepyshv5J2qcaNtx5K614Z9+KZcinHSbSzHkItvd
	rezMqVKSlSvyu4Wje+hCd+GvDZa4Toc5HRJuPmZVE1/sRBAbgFTaROfx4JNoUWTH
	3VVSD8wYOLeoj+VXwoZ+mLHULDtSZwJTdcPMqzmJ+HaSXA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ptv3rud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 17:03:40 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-566371d11a3so6849620e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771002219; x=1771607019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YZdH6ExLJouxP5fU/TtsTdoLJnFhnqsdlD+R4tXVzho=;
        b=hknI/bczM0I70Xcb9Mrm+vpbi6nygPH+hUVCnUKdP1K39J8x8tW3BUJVlHNMjgv1nn
         huuYuu5+1quzUqoqd2ag8uiAGLX9TFaUPVFovny22mTSRdCxzt0NWkI4CPw3VZupp+Jv
         5GfQFqjySqvdp77TLiBvcNRnbIDa6+WGFV/ZflbIoIEZAY+WGfZNXgX8044xgSQyjLG3
         kjC9V3mTszi5xXHpEl5pfiZ9wdGtSSToIPL9sDtz0A7/JQhMUzArBmMpqM6NjtsL25X2
         c+Z/bWR3huUN9XKT5WmDgl6b6V+Uket67AwQx7F00lfK7c0zCHjq2UOuTECy9Jn9pU31
         +PLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771002219; x=1771607019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZdH6ExLJouxP5fU/TtsTdoLJnFhnqsdlD+R4tXVzho=;
        b=HJric0Ewdgy/lCaoufxEnIxoJNzxd5i8W/275uaBYLF+ACVbAEHcK7ZW2CkaY5RhTk
         JcKp4GWdUDB9BlbxAYan4Ip5Uw58biQAQNgUKe+4o6e+KVtb9KGMGhIOnx9x3WUo/VEM
         pacn83NO2BMxrdvY74SAFMdoixuSfKeKtPME4L0wapOWdHDYiInRxvHkAYtnEnlwjYXl
         52idi8nF9EHKQLCJ7fRYCBO+anZ+kRsxhN+nYpZLagphbi0uk/sDkQcI6EL+NpIJW3+F
         nA6K3Vqf5fP/Imkn44lQnJQRHwI7EaAzi2Ba6ugoBTY3ltWVPBf376unn8K2Cr8geiS3
         6Usw==
X-Forwarded-Encrypted: i=1; AJvYcCXLyQ1UmgNP15yGkMujj73GrKgit5BO57yl2ITwivafYPqv8lsGd1qsYyfOk3GFdjCEDlSLnHnJidvmz3qF@vger.kernel.org
X-Gm-Message-State: AOJu0YzAmhQ7bY7gEZEYGAham4klI1ewyOxBtzlkn2g1pUwc47tLvtEC
	+tfxvPwZZfYDpgqfTTEKkQ3la98yxpG8jGxznhf/FfG7QK5PBDvy5pv+p4ydRH5rVYRIjZf+F0P
	vRLxz1r6uuwxgUQZp4zOBdhmVjFjtWUYEJKCKumRbu2HnJVUjy2YFcwBYTGlqYSoE0Sja
X-Gm-Gg: AZuq6aJiahN8RHlAamS5KZGn+TZkTAoRsUaEKhQyqpjM2aLUplrhhf15tuZZr4WoV2T
	84ASdUTMD2/X0Eby3uiQPA1nb9g/62ysQ73PV++/6Y5LXZz/7I7jSodnSzWGLDMciXoSGOrbXyt
	3l4PdIBFNxpLLwT3uUaxp2T0MCPu/iUkUx5zTSVX7R0VwllSBqcjMd9NQWo7/Ky1aMGnvrmkprO
	hKHoZ9pqzElbCmhNlxXHqFc2EzBI3D9Z4vpxadIzU4yS0tdDMU2ng+ci9oOF26wIVoSPHgeGQAy
	xvxWzoIjFN1qXmNloUrDwFjSX8TRcKwpKMEBSjFbaCcq3tmh0zsucAIbqJY0v1k0aLY6BObvGDW
	jPsE2IrFYuwCOEI4+GWgQ1jW9BAfFqnHgtDtATIwEpVnFaNCeY6mu/uS2oQscsPxTASHT54UMDi
	P44EwPsbztrklVBF40hg+sGUPvnIrg0H50E/U=
X-Received: by 2002:a05:6102:2ac1:b0:5f5:4f68:9f7e with SMTP id ada2fe7eead31-5fe2ad39bd3mr51935137.8.1771002219169;
        Fri, 13 Feb 2026 09:03:39 -0800 (PST)
X-Received: by 2002:a05:6102:2ac1:b0:5f5:4f68:9f7e with SMTP id ada2fe7eead31-5fe2ad39bd3mr51857137.8.1771002218650;
        Fri, 13 Feb 2026 09:03:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5635a3sm1717634e87.8.2026.02.13.09.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:03:37 -0800 (PST)
Date: Fri, 13 Feb 2026 19:03:36 +0200
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
Subject: Re: [PATCH v18 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
Message-ID: <pufuo7jq4olww3ksyawqkoee34cl4fhtpfh3sh2kfuimajswod@gv4rp6wsnrhx>
References: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
 <20260213-msm-next-quad-pipe-split-v18-2-5815158d3635@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-msm-next-quad-pipe-split-v18-2-5815158d3635@linaro.org>
X-Proofpoint-GUID: 7C1NhrO5R1rTnzVQcOCvEKqEQpmKKx_-
X-Authority-Analysis: v=2.4 cv=eaowvrEH c=1 sm=1 tr=0 ts=698f596c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=KKAkSRfTAAAA:8
 a=sJjDOZd7UmfH7BeDoGEA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDEzMSBTYWx0ZWRfX0yPKJ5lfxTMo
 w8xmbckaxLe5QhNLsB4Sdn0L+rUOVTikloZ076HbXbko1+h1L3KouLmKhwHgaH5vkQN1kLzGt0e
 JF3P6Rq1wv3Ug/8N2Bdu9lKe/ObytsWhat7OaPIaHqayqtr/pEFUz+dKyQDQM3572zCNW8FJkT9
 7zKCgKrceISGhyo5ESzh6AmS2Ob/HyT04NuDQBWmwP0qey0H97TShXDx768PIqRCKzKv8DPbt9b
 5dBLcrtzv5tSeEi1zykMbXnd8kLTHUtPJqkw7gVY0Zy5H/tYGjUr/91bqRnFw8Xj+wtWQ9l8ukU
 hvMPlNUaK0FjxfHuwZrVxMHdB02WQm0OkNVIDAr85Yw9Npu+QcfIWQNBvemmr/bPhZ0ZvAfHzZD
 lzdLFtynhRqRkqM/6LMsbWp7pLuj6PSAHZZM6qUwraqJ6RdiBiSI9TIt2rB934jukCgJGiV+B1f
 5G5FO9oiOYe0LHlj7Ag==
X-Proofpoint-ORIG-GUID: 7C1NhrO5R1rTnzVQcOCvEKqEQpmKKx_-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130131
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92811-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DE8F713878E
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:54:26PM +0800, Jun Nie wrote:
> Currently, mapping plane to SSPP occurs during the plane check phase for
> non-virtual plane case. The SSPP allocation and plane mapping occurs during
> crtc check phase for virtual plane case. Defer these SSPP operations until

Nit: CRTC

> CRTC check stage to unify the 2 cases, and ease later revisement for
> quad-pipe change.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 155 +++++++++++++-----------------
>  2 files changed, 66 insertions(+), 92 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 6bf7c46379aed..797296b14264e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1534,8 +1534,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  			return rc;
>  	}
>  
> -	if (dpu_use_virtual_planes &&
> -	    (crtc_state->planes_changed || crtc_state->zpos_changed)) {
> +	if (crtc_state->planes_changed || crtc_state->zpos_changed) {
>  		rc = dpu_crtc_reassign_planes(crtc, crtc_state);

dpu_crtc_reassing_planes() starts by freeing all SSPPs. It should not be
used in a non-virtual-plane case. I'd suggest duplicating the function
and stripping out all code and data related to virtual planes.

>  		if (rc < 0)
>  			return rc;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 66f240ce29d07..be1a7fcf11b81 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1119,102 +1119,24 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>  	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
>  										 plane);
>  	int ret = 0;
> -	struct dpu_plane *pdpu = to_dpu_plane(plane);
> -	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> -	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> -	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> -	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
> -	const struct drm_crtc_state *crtc_state = NULL;
> -	uint32_t max_linewidth = dpu_kms->catalog->caps->max_linewidth;
> +	struct drm_crtc_state *crtc_state = NULL;
>  
>  	if (new_plane_state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
>  							   new_plane_state->crtc);
>  
> -	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> -
> -	if (!pipe->sspp)
> -		return -EINVAL;
> -
>  	ret = dpu_plane_atomic_check_nosspp(plane, new_plane_state, crtc_state);
>  	if (ret)
>  		return ret;
>  
> -	ret = dpu_plane_split(plane, new_plane_state, crtc_state);
> -	if (ret)
> -		return ret;
> -
>  	if (!new_plane_state->visible)
>  		return 0;
>  
> -	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> -					      pipe->sspp,
> -					      msm_framebuffer_format(new_plane_state->fb),
> -					      max_linewidth)) {
> -		DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RECT_FMT
> -				" max_line:%u, can't use split source\n",
> -				DRM_RECT_ARG(&pipe_cfg->src_rect),
> -				DRM_RECT_ARG(&r_pipe_cfg->src_rect),
> -				max_linewidth);
> -		return -E2BIG;
> -	}
> -
> -	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> -}
> -
> -static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
> -					  struct drm_atomic_state *state)
> -{
> -	struct drm_plane_state *plane_state =
> -		drm_atomic_get_plane_state(state, plane);
> -	struct drm_plane_state *old_plane_state =
> -		drm_atomic_get_old_plane_state(state, plane);
> -	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
> -	struct drm_crtc_state *crtc_state = NULL;
> -	int ret, i;
> -
> -	if (IS_ERR(plane_state))
> -		return PTR_ERR(plane_state);
> -
> -	if (plane_state->crtc)
> -		crtc_state = drm_atomic_get_new_crtc_state(state,
> -							   plane_state->crtc);
> -
> -	ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
> -	if (ret)
> -		return ret;
> -
> -	ret = dpu_plane_split(plane, plane_state, crtc_state);
> -	if (ret)
> -		return ret;
> -
> -	if (!plane_state->visible) {
> -		/*
> -		 * resources are freed by dpu_crtc_assign_plane_resources(),
> -		 * but clean them here.
> -		 */
> -		for (i = 0; i < PIPES_PER_PLANE; i++)
> -			pstate->pipe[i].sspp = NULL;
> -
> -		return 0;
> -	}
> -
>  	/*
> -	 * Force resource reallocation if the format of FB or src/dst have
> -	 * changed. We might need to allocate different SSPP or SSPPs for this
> -	 * plane than the one used previously.
> +	 * To trigger the callback of dpu_assign_plane_resources() to
> +	 * finish the sspp assignment or allocation and check.
>  	 */
> -	if (!old_plane_state || !old_plane_state->fb ||
> -	    old_plane_state->src_w != plane_state->src_w ||
> -	    old_plane_state->src_h != plane_state->src_h ||
> -	    old_plane_state->crtc_w != plane_state->crtc_w ||
> -	    old_plane_state->crtc_h != plane_state->crtc_h ||
> -	    msm_framebuffer_format(old_plane_state->fb) !=
> -	    msm_framebuffer_format(plane_state->fb))
> -		crtc_state->planes_changed = true;
> -
> +	crtc_state->planes_changed = true;

Why do we need to enforce this? Previously it was limited to the cases
when the plane has actually changed and required revalidation.

>  	return 0;
>  }
>  
> @@ -1261,9 +1183,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  					      struct dpu_global_state *global_state,
>  					      struct drm_atomic_state *state,
>  					      struct drm_plane_state *plane_state,
> +					      const struct drm_crtc_state *crtc_state,
>  					      struct drm_plane_state **prev_adjacent_plane_state)
>  {
> -	const struct drm_crtc_state *crtc_state = NULL;
>  	struct drm_plane *plane = plane_state->plane;
>  	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>  	struct dpu_rm_sspp_requirements reqs;
> @@ -1273,10 +1195,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	const struct msm_format *fmt;
>  	int i, ret;
>  
> -	if (plane_state->crtc)
> -		crtc_state = drm_atomic_get_new_crtc_state(state,
> -							   plane_state->crtc);
> -
>  	pstate = to_dpu_plane_state(plane_state);
>  	for (i = 0; i < STAGES_PER_PLANE; i++)
>  		prev_adjacent_pstate[i] = prev_adjacent_plane_state[i] ?
> @@ -1288,6 +1206,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	if (!plane_state->fb)
>  		return -EINVAL;
>  
> +	ret = dpu_plane_split(plane, plane_state, crtc_state);
> +	if (ret)
> +		return ret;
> +
>  	fmt = msm_framebuffer_format(plane_state->fb);
>  	reqs.yuv = MSM_FORMAT_IS_YUV(fmt);
>  	reqs.scale = (plane_state->src_w >> 16 != plane_state->crtc_w) ||
> @@ -1318,14 +1240,56 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
>  }
>  
> +static int dpu_plane_assign_resources(struct drm_crtc *crtc,
> +				      struct dpu_global_state *global_state,
> +				      struct drm_atomic_state *state,
> +				      struct drm_plane_state *plane_state,
> +				      const struct drm_crtc_state *crtc_state,
> +				      struct drm_plane_state **prev_adjacent_plane_state)
> +{
> +	struct drm_plane *plane = plane_state->plane;
> +	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> +	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
> +	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> +	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> +	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
> +	int ret;
> +
> +	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> +	if (!pipe->sspp)
> +		return -EINVAL;
> +
> +	ret = dpu_plane_split(plane, plane_state, crtc_state);
> +	if (ret)
> +		return ret;
> +
> +	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> +					      pipe->sspp,
> +					      msm_framebuffer_format(plane_state->fb),
> +					      dpu_kms->catalog->caps->max_linewidth)) {
> +		DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RECT_FMT
> +				" max_line:%u, can't use split source\n",
> +				DRM_RECT_ARG(&pipe_cfg->src_rect),
> +				DRM_RECT_ARG(&r_pipe_cfg->src_rect),
> +				dpu_kms->catalog->caps->max_linewidth);
> +		return -E2BIG;
> +	}
> +
> +	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> +}
> +
>  int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>  			       struct drm_atomic_state *state,
>  			       struct drm_crtc *crtc,
>  			       struct drm_plane_state **states,
>  			       unsigned int num_planes)
>  {
> -	unsigned int i;
>  	struct drm_plane_state *prev_adjacent_plane_state[STAGES_PER_PLANE] = { NULL };
> +	const struct drm_crtc_state *crtc_state = NULL;
> +	unsigned int i;
> +	int ret;
>  
>  	for (i = 0; i < num_planes; i++) {
>  		struct drm_plane_state *plane_state = states[i];
> @@ -1334,8 +1298,19 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
>  		    !plane_state->visible)
>  			continue;
>  
> -		int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
> +		if (plane_state->crtc)
> +			crtc_state = drm_atomic_get_new_crtc_state(state,
> +								   plane_state->crtc);
> +
> +		if (!dpu_use_virtual_planes)
> +			ret = dpu_plane_assign_resources(crtc, global_state,
> +							 state, plane_state,
> +							 crtc_state,
> +							 prev_adjacent_plane_state);

This is an overkill for the non-virtual case. We don't need adjancent
states, we don't need the array of plane state pointers, etc.

> +		else
> +			ret = dpu_plane_virtual_assign_resources(crtc, global_state,
>  							     state, plane_state,
> +							     crtc_state,
>  							     prev_adjacent_plane_state);
>  		if (ret)
>  			return ret;
> @@ -1772,7 +1747,7 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
>  static const struct drm_plane_helper_funcs dpu_plane_virtual_helper_funcs = {
>  	.prepare_fb = dpu_plane_prepare_fb,
>  	.cleanup_fb = dpu_plane_cleanup_fb,
> -	.atomic_check = dpu_plane_virtual_atomic_check,
> +	.atomic_check = dpu_plane_atomic_check,
>  	.atomic_update = dpu_plane_atomic_update,
>  };
>  
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

