Return-Path: <linux-arm-msm+bounces-89971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODolHfGgcGlyYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:48:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB2F54A94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 10:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3D1188875CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09DA3A9635;
	Wed, 21 Jan 2026 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MV+fDBIe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FfJWJtB3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982502FFFA5
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768987837; cv=none; b=dpvDOAox9tY/VgqBTtRZwlKnzVs2aLiV8lGdZTctOZcSz6VJroDa93p90c61jvCmMH9xmIddaP+/Kn+GzTKaiFXrLWo7tstBpuHb/zU9sNzAaQfml7NWRBtGEDB7N60tRoiSLB603/8Gp3uWBOEiu8m20xsB+ty2WqSAsWZ6MOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768987837; c=relaxed/simple;
	bh=BK/pRyjM+czYPT+DjehOBrEcB3QdIE3lvaNcc/c4DjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sk0VoSUwHS6yANM1izOclASn/WteSRXte2ziGhxdE8hlueVrz4OiNny5LwCgmvG/Y25AhHIknOF1ZueM4k6DNjCiG0YwvqzcztDAAIEbKX7FsJOpuGS7y8dfA4XPZF4E1JgByWjqT4H0himaEnQm795L4FBkW3KYZcT+n1y8lHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MV+fDBIe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FfJWJtB3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L4XVcl3229089
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:30:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jCcHWBxjANuzaZBT3V4JtDZ5
	YiBRtjVNWk49V/l3bSk=; b=MV+fDBIenesFOs2WDuyOQuI5Zfv3bqavypJYhFO8
	6RETgt3Yo4DrYdX6rn/OCGmZMr3b6D6CEcCsNpGpVCgyfT7nNaCdVfY1giBXLqon
	1p52CD8ay9gaadccWuV3tcLfQvOHHIGDH8eKs1pQwWqwAGcStv6ZS4tIUV43ZUWF
	kNRyW9GVKV+eKY3iIEgHSvEiZIK0ea3LCyawv82/15gu/rC+iBNpI71G7xg5pVZu
	zh1vSutpyM4Kt6S9gqjyuEUW9nQjpmHQqii1+31Ow7Lg6+QtKvks5+t8ByDDgKB8
	c/xNjvm7jcWGRTpnW5VvzfZEX9T2+6DZEz6Lzc6UF24i+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btqvp90b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:30:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52d3be24cso776272785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 01:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768987833; x=1769592633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jCcHWBxjANuzaZBT3V4JtDZ5YiBRtjVNWk49V/l3bSk=;
        b=FfJWJtB3W22vdQRJQLaBCWjnnVP8eMiGRwDH/RD0b99hNQG6745wl0HUK9t5XY7Mqj
         rH41IcpR6t/IgQmI7BVBV0vEbE33i6WfxtcSc6kiHueDigbVmd/iYr7sSQ/zZC0ETUST
         3o+jd748K9eHWT40wFPCtIAsThWRAr9kfty+/PNdew9bYSz2D9HWgHxbwNC5cfGke09M
         7Ndru2J2Bgd7/P3G4CFdEC1+rWDmNLyyi/2GJ8a6nJ96sZHtSnyg95Rormj15uGxsqqW
         A300ykuHhpNgdLJ/p2Lc9EnDWxz+dvi6G8lXOEasAAqlyORqN3HTv/DB7C6tiQlJIxfA
         7b3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768987833; x=1769592633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCcHWBxjANuzaZBT3V4JtDZ5YiBRtjVNWk49V/l3bSk=;
        b=Zw+4z53yt0FRF+0xv+sBCxixTtuUAUwRmlda+GF27AoWc/O3f/dhFevxVbWi4TqWus
         5iOBTXmSobHkpVlO0EIU8DNUHZ+bxc26DpqM545oinTs7D6l2L8D5Olo+LCpEZQ9k1Zj
         mGwUdpuwh+gnX6FXkfpwFSIQMPhBbHG5GebXXk2LG9CqGLNI0UBohg8h+VbOEEn3UGmn
         WVwKSubZF2DlEyToBK0WxemD51v1W28XLfTI0SM0yHl2Dt9O+MW3+IUzvGOzw0FUgmIy
         wmCpdB977SvjWFDr2smKVTuiY1vRO/aQPA1u7QUCoGc7XzPsFZTKjs8T2lJvgGBN4HfT
         my6g==
X-Forwarded-Encrypted: i=1; AJvYcCW9BhMBRzPrF/TOMvOyUhR4aOh3WyH7YOTFJRWOMi7hd3t2w4jTBBvjtpa0qWpa/zwbNuG9McKiDV8eL1f/@vger.kernel.org
X-Gm-Message-State: AOJu0YwMrZS0kHSC98yLYWMJrVLiWj0SKLEWdTjAJpd8ja3mV3T4Th4O
	OQyPjm8i6o0cjZ1VIG//uBIafkrZvxDqM41WOJ4ndRcr5NOPxgEIZsKVaKobZAF1AwX4Fm9nAS6
	9xFN5ihaDnNj3EFroBrPPAOlyvx0m+XljPRA4XAwsXzcrWgHXH2W7nutmLUX2FkX3trMJ
X-Gm-Gg: AZuq6aJWT+NWGMpWM2p/BHJ8o6p+kf6Tp8PW8EBmCLFt8Z4GehPpOysL0aK+maylBQZ
	bFb8tNGPN9ivVjQv/VqQNkLEdqMg9xgWi0MbQuCl0iuQW+UaOt2xIECijGBw4DvW1j3MQD8KF4h
	w7kXy/lhXJHx4Sok3rS4lVfC104od41rDJjuKtxWzPpMdLjho7Al+cumuly2Pj7MgG5xm3wlhCG
	p8dHsLFj8+KG3xbDKmWumv/HYNULIZ3KMPiSiwXGXMpZaPQn03XZ5ZBy+zfcXypXQj/htjYRmyP
	sKDgi8GQYM29PJ5M8hieJpjtse8PyNHxjkRQXIv2JJPKLD6pqek2UdBQFZXNPwqF2dgVNjLYWuG
	WlitFVRIdHS7PLiOR6Di8YhzuORg/T5QfMkdmHi/JIUntN8fN+BVg89e31TisREa2UeGNavcDSj
	lTFcA8Rcu8AdyesiE5cliqDx4=
X-Received: by 2002:a05:620a:2a05:b0:8b2:d2c9:f6a with SMTP id af79cd13be357-8c6ccf3f116mr542868285a.89.1768987833114;
        Wed, 21 Jan 2026 01:30:33 -0800 (PST)
X-Received: by 2002:a05:620a:2a05:b0:8b2:d2c9:f6a with SMTP id af79cd13be357-8c6ccf3f116mr542865085a.89.1768987832546;
        Wed, 21 Jan 2026 01:30:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385bc7d29fcsm344741fa.38.2026.01.21.01.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:30:31 -0800 (PST)
Date: Wed, 21 Jan 2026 11:30:30 +0200
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
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
Message-ID: <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
X-Proofpoint-GUID: 6FBRYvuAqrboCd9Hz6G3ZO72DcNBiypy
X-Proofpoint-ORIG-GUID: 6FBRYvuAqrboCd9Hz6G3ZO72DcNBiypy
X-Authority-Analysis: v=2.4 cv=cdPfb3DM c=1 sm=1 tr=0 ts=69709cba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=yhFmvX6FVyQK3JyMgscA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA3OSBTYWx0ZWRfXx8yEKY7Iaq5r
 8EmMbTfQNtnu9sOP/w/zQVbUSQZ64HeKjewh0LETez83cU3X/07ekpoTc/lY0FtwYKQ8ev87zbZ
 Hvvj0kwyCymimiOFCkm0m6nz+4SGGEcHd/XXXUl5jS6VaqLXBa/kUb5TZzsFZGi9G1uU+xGk3Km
 x5xrdU+Z23/wxqmg/Ou6veT0tPTGMuIraqDk7JAORCK12YyQUW4/AVph37dGuqkQ9XmksIrna4a
 D7ZHXYlpvhxaReRgGk1JssFG6KL7IuIKYXp+YUMYnUH51gBDfkhy9Xl65zxfMTecE8olyVltktD
 e9EoHhRj5O1UdOKJG5XbGjiEw1J2AV4Ds1hPrgn9QMKJBMUuMtLjQg9C3JbxyMnsFHMN6JaWaHR
 PCv5IIRpEgUxT6UyjDC8d1vz0G/vDGzlYosjTWjlBlkUMpApTfNETLVnxIexmoCdIi0l6kzXjJo
 BWnbkOcImNJt6zIK1Cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210079
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89971-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DAB2F54A94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> Currently, plane splitting and SSPP allocation occur during the plane
> check phase. Defer these operations until dpu_assign_plane_resources()
> is called from the CRTC side to ensure the topology information from
> the CRTC check is available.

Why is it important? What is broken otherwise?

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 112 +++++++++++++++++++-----------
>  2 files changed, 71 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 2d06c950e8143..debdbbe6160dd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1484,8 +1484,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
>  			return rc;
>  	}
>  
> -	if (dpu_use_virtual_planes &&
> -	    (crtc_state->planes_changed || crtc_state->zpos_changed)) {
> +	if (crtc_state->planes_changed || crtc_state->zpos_changed) {
>  		rc = dpu_crtc_reassign_planes(crtc, crtc_state);
>  		if (rc < 0)
>  			return rc;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 66f240ce29d07..3c629f4df461d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1119,49 +1119,25 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
> +	/*
> +	 * To trigger the callback of dpu_assign_plane_resources() to
> +	 * finish the deferred sspp check
> +	 */
> +	crtc_state->planes_changed = true;
> +	return 0;
>  }
>  
>  static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
> @@ -1186,10 +1162,6 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>  	if (ret)
>  		return ret;
>  
> -	ret = dpu_plane_split(plane, plane_state, crtc_state);
> -	if (ret)
> -		return ret;
> -
>  	if (!plane_state->visible) {
>  		/*
>  		 * resources are freed by dpu_crtc_assign_plane_resources(),
> @@ -1261,9 +1233,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
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
> @@ -1273,10 +1245,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
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
> @@ -1288,6 +1256,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
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
> @@ -1318,14 +1290,59 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
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
> +	if (!plane_state->visible)
> +		return 0;
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
> @@ -1334,8 +1351,19 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
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
> +		else
> +			ret = dpu_plane_virtual_assign_resources(crtc, global_state,
>  							     state, plane_state,
> +							     crtc_state,
>  							     prev_adjacent_plane_state);
>  		if (ret)
>  			return ret;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

