Return-Path: <linux-arm-msm+bounces-95912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNgmD6Egq2mPaAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 19:44:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A88F4226D09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 19:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A48DC303E756
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 18:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE45835B643;
	Fri,  6 Mar 2026 18:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ghg6QXlt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ed1KUZab"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A383433BBAD
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 18:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772822685; cv=none; b=ZSUv6AAhIGwX5V0hLHx8nkTlMtW6fXbOUfc4v6Puaw7Ir4pcxWJxuOyseqZm7pngafOVxOeLQqU02PrP35vqaSUkhr3C1FsLT7cPI3uqVy+tbqxZQ1DazbnnPKjzQ0M8bA+BZdXHXoZG8jwGQgPenfaegHO3NlVKQTZd4YlMg9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772822685; c=relaxed/simple;
	bh=mT3HEWct7JyRx3VcNPNXJg3NBicF4+uVs+nNTjP3c+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzL0dRZ8t+Ykaevem6nQegNFqQz1+kJHqLmDVce/c9lDNlyepoyYZh+/cN3zYynhlPNFRzOXLm1JWKjjjpBtHg///1ylV6E6KrpuL2lIhKW51qwz9UEtKxoYk4zCuqksyCz1dGyXRPEsg0DTzPjhecX1Tm5DE6j72ru/W+te0yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ghg6QXlt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ed1KUZab; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1Yt24115466
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 18:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SXae7MF+NIlWmWbGFuu3hxNp
	9S8gG79FuDF7b6zR9E0=; b=ghg6QXltSswHtys4mqfAEN0j9y9i4HsJMCMviBMF
	XvCwYabylbVbYDui+oVkO3Cs0uGxcbFQjhsnAtORzbCtCcP370ydqywejawNsWlO
	npaBaKrxz8QZgsVBdsE47i1VY0SRqDkHmwIQnHSVmnSay69bmNhAiejyf6eG+qO9
	cVF3VPWZzIpYyI8FAX7yvhDbmpHY6+35Tyr4xFVQDz9b1kOi20gV7D7K55yqzCxc
	YfmfmLKUTOgeaZ1LcigfshIjAlQnacq5bygeScBqKQaDoaPU3RGlR4Z9crWOE/V8
	QGKholIzgA3Pk5ZAk8Op03Bl8yBIcXatuXMlqUbhw+a6fw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9u9t96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 18:44:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5033c483b76so671823591cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 10:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772822683; x=1773427483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SXae7MF+NIlWmWbGFuu3hxNp9S8gG79FuDF7b6zR9E0=;
        b=Ed1KUZab6KvCqmkxN4fI5qLaOLTB76ZvojAHjNmFUX8jCfxverohLKfVZ4O4JLjmNE
         Aj8RIo82VDBXPTx4wsz5kpeH5sDdpjEpPA1FXD8Jn7rnzhwvHKRrMPewMn5CkplbKIUi
         qeHSYQEUxQFGvSJYBWPs+99F7bYVYVpbaHdLEB41YoCSvs0MGbHkBuIEUwFRiMPsRAsC
         wDV5DW6UvWebkctW6bGZ0SPQLF0WkS8v339JlW3cf1h+R6NLCRZRRWblyZHlfGrsjNyq
         cb7Zb/3EnqllAITGjd03XNZdZRSVasJHWJ1xgUqnn1Y6vD/mzemHYeJuPrxJ+h+Bsp9q
         CUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772822683; x=1773427483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXae7MF+NIlWmWbGFuu3hxNp9S8gG79FuDF7b6zR9E0=;
        b=PRWqMvTjgFVTWuwETP2e3mTXi0w78dgq0xViLaKtVYtKwGAlskcQuvaNcpOjQVCt5Q
         N0cYHesoj0Wtm/f6o854/YcGTP0RwbgKHip4qwivRb2uBoUmnNky3OZBXLHyEGeYAinM
         KBEb50MKUFl9kWKAy1+go7ZN9AoHz6Ml7xTNCPhlSt+oy8+3n88PrdApE+qSFlnLTEQ5
         4guMvBr2V5K2dpsYG7bMwrUqgXIgQ78PABGkxqpDhiTD6pzIA/9k5dYaToMn9W/z5h2j
         dbcWO2b//tRrrwZTBf5TNLaOg7HjgmWsfFcmgpzb+6r8y+MLgnqhhHQLuS5mvkALJ6+L
         /AzA==
X-Forwarded-Encrypted: i=1; AJvYcCXAQiBa2+QcwpCnuTFjmOILBRosQmy1N7rOMUJdnFr/j0J/fZ3t661Y83oTqeuX3xnPQo9qhhbAVnirwK9t@vger.kernel.org
X-Gm-Message-State: AOJu0Yznh3/nffafGi61SeLbfRpoSfr7sNpSIDMoLrmCoRbqPE5/RNAs
	V2erak3t1RS9v/4c1ONPeWNdFzJJShERFKQsbaxiQzIlVuIQVsbdE5cKCelkHT1epSIj4ULspXb
	mRuOwJVCQEtj9lS/bwlXq0tzK0w4tFCIEJxtUMVt6cnhvK19Wi9MACKFnTB5GUZ+wkMpa
X-Gm-Gg: ATEYQzwj76H+nOE6FD4dWc+15kDGg/WWmrUhsY+VV2TrGqcl8jV3ZLqsp0fdncyAzsT
	2gmvewDMfMN9RefWDseIt37u/Z9TDOgKzrjyCfnSlojgoS2hcRVdPN75FVTuNnK56YMohD7ogxm
	CRt4K6n2/hKZpI4+5DJ9i+2WzfGoG3vhmkKuFK7aGHOVtyRX1saGJtPrVj1ESHlsDflUjNFmmwr
	eX3/jnkCbdmrFxOWZZt8q4eUON0VJRDzYkWHEkDavkb/XvlrUDNk5CZS70O1Q1qUWZ7suc/SNWj
	zOF9o8vPBsl+fzarycVl5qYG/Wssn0ciHR1/8PkzvO72UMyNoParSxf7tFb21cTGA5lZmOUfLYi
	PeARPCh3gIt4ypJiimOcZESsZp55dNNIzU/3qOnk2lu+idVVQtYQsBS6YGdb1mK8sL+eCclIYnq
	nv2IKM001zUIbZkL448DUtaxz3cs4cZ6MR0MU=
X-Received: by 2002:a05:620a:4588:b0:8c7:6f8:ae4c with SMTP id af79cd13be357-8cd6d428b2fmr400723785a.43.1772822682785;
        Fri, 06 Mar 2026 10:44:42 -0800 (PST)
X-Received: by 2002:a05:620a:4588:b0:8c7:6f8:ae4c with SMTP id af79cd13be357-8cd6d428b2fmr400720285a.43.1772822682063;
        Fri, 06 Mar 2026 10:44:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08603dsm491467e87.68.2026.03.06.10.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:44:41 -0800 (PST)
Date: Fri, 6 Mar 2026 20:44:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: setup RC model properly
Message-ID: <n4ytt6euoeh5igk7a4rn4zawpr4psckahc76375ls7a4qqcty5@7bxj7otyuevw>
References: <20260306092553.37973-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306092553.37973-1-mitltlatltl@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE3NyBTYWx0ZWRfX+dKK2+hN/R0m
 HpMCF4RlQMzygMoxl3KEUvwLEOfEXsf6FREd41L3bNbpSU/sxeV02l0MUxSG42P3/yKaZMiPInS
 TY043S/A4Oxtb5q/8PofAiPlaKrD95jUrVh3wdr97+ASgJVsAsIoYJGhbbbLk6ZIVzCVZ0T71FQ
 O+Jj68+KlKktleassVYNYUtXp2ZOuPI5hvhsbXfa9BYD1ZNNUsIDsWSS8YWxY4SCI2LMW93vj01
 7z10lQunDh36QcNjzhxckAoZVYzGWsKn3O/pjVx7I2K10juVi4lEZ0lHA1DIZLtSzdzxVoRMEyv
 rh8DkD8jaljAyJSbfc8uqHooXM2Zu5jOZZ5pAMsOpzo96IFMLm7Zpgg28x0LkmnLsKDOuUmp5oU
 B/txf7jwZJC9rZuIAjm6aXcBw/vukY0tbwiecOX1vnVFBsu1XcbgPAC9msZC4VG9ivvTwhK17PL
 8WXT1lX6oF7QNrxQFQg==
X-Proofpoint-ORIG-GUID: TRWpKBivxqJTIgjjRHs8WHSg_XAAHTLx
X-Proofpoint-GUID: TRWpKBivxqJTIgjjRHs8WHSg_XAAHTLx
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69ab209b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=-UYvGVBEh1dpRB4KFAcA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060177
X-Rspamd-Queue-Id: A88F4226D09
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95912-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.972];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 05:25:53PM +0800, Pengyu Luo wrote:
> Using incorrect parameters does not seem to affect the display, but we
> should use the correct in accordance with the DSC 1.1 or 1.2.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 31 +++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index b60b26ddb0..276c63d2ac 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1843,10 +1843,35 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>  	drm_dsc_set_const_params(dsc);
>  	drm_dsc_set_rc_buf_thresh(dsc);
>  
> -	/* DPU supports only pre-SCR panels */
> -	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
> +	if (dsc->dsc_version_major != 1) {
> +		DRM_DEV_ERROR(&msm_host->pdev->dev, "Unsupported DSC version: %x.%x\n",
> +			      dsc->dsc_version_major, dsc->dsc_version_minor);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	switch (dsc->dsc_version_minor) {
> +	case 1:
> +		/*
> +		 * For DSC1.1. the upstream lacks SCR parameters, the downstream
> +		 * parameters are unverified here, we support pre-SCR only.

It doesn't. It's the same as DRM_DSC_1_2_444. Please send a patch adding
the comment.

> +		 */
> +		ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
> +		break;
> +	case 2:
> +		if (dsc->native_422)
> +			ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_422);
> +		else if (dsc->native_420)
> +			ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_420);
> +		else

It's not that we support 422/420 output... But yes, it's easier to fix
it now.

> +			ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_444);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +	}
> +
>  	if (ret) {
> -		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
> +		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters for DSC version: %x.%x\n",
> +			      dsc->dsc_version_major, dsc->dsc_version_minor);
>  		return ret;
>  	}
>  
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

