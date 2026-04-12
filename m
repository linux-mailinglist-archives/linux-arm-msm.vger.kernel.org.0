Return-Path: <linux-arm-msm+bounces-102832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BRoIEvi2mnA6wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:07:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4F73E20DF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73252308550A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 00:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E6F23BCEE;
	Sun, 12 Apr 2026 00:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACi638hn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JvfFYGJP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CAD219A8A
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775952343; cv=none; b=RiCFUnw2WE1aJD9hnsrMirOsVyDSmHibAGUfKYf8OXM3RmX5JuDaLnp6lndiIF0dJRjBkm+9gxZHR6pYXoxR72J14/6j7asom5i6z6CXwYfZjmV5T4zwIfzM+YF87Ms3TM00Aizx0iwlERufTW35Q131ZQnztLK5C9CMBuFKaRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775952343; c=relaxed/simple;
	bh=dYe1DhXTXO+SGAN1oqvqu1q1vh1hMCm4PkpFOA+EHjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwxnv/Jf+CNak5X5J6zwBIJ2Mr5ecLtX4nDQHsOXMcf4mMjHHkoGAzLvqwTxXdMvA5XB8bMx6+po5pTc07ASXUuQT2SdC0UsRvEKrOByKjGbyhRQ2+GyouelwU3omGc8nr9rjJ8XuTgfUq4cj91HxmmQBHNpYAdY2dWKhJaE0Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACi638hn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JvfFYGJP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BKUcQj1191923
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aqO0icBg/ZpRZ3dRKkqaa/3i
	zcSqhytJU77i4TeGTwQ=; b=ACi638hnetjYWr2XA1NYh44ll3Y+k89zSX/fZj3Y
	KActKdHr0DEfWzD5n0oIerQ13Ry5VChpHKVLHSZAJQteUHSVWgePCL7ZKNp+3+4I
	xf3q3ec388zUzdQBMR0+BLVaswkg3LSaGZ5lTRNI0Uu4/U6qW15v7l+wRXRLpyyn
	KBw+ln7gxRsNC0ef+slEl4YDiyoryyHYIwxLE6wimc1x04pNSIolIkuXUo48QWPk
	HSK1W89/B+r3EMTg4N4Z3IUJTRjcPyNK1Ffhn1Wjx50qaJxeU+Me9abXy8OI+cWb
	1u/BMJ2eHlHifCkP4/TvD2iUyM9y6D4NsxAInRqD/c6f4A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewkshug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:05:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d9d52ad9aso13604161cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775952337; x=1776557137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aqO0icBg/ZpRZ3dRKkqaa/3izcSqhytJU77i4TeGTwQ=;
        b=JvfFYGJPDRaj1axjQgmIBEKJZUcrX2ywcUG7gGP1BpKUeMbE8J2IKOIpytkni+kRW/
         2Fzq7QcimGXO4AbnxJK7gaxEXy9YuIUQdgSurD4Jprp0tXMcDjZJrdjHWsb3ByPRiybb
         7byEeNjc4y18Zf0of7phf2UALFTbSx+LDDSt+qkEBtUNBI4Sp40PEByf2Wu32e/JzEbw
         4FoqYrqIiZl6noIYQqogNbHAzIIRjNEMsxYAFkqp0wwHbiaZOaR9sz4ClflMsqN4qIZf
         k0JWYOhmKg/3KSsGlrcu3RY9YcSIOdUNrj6GJNvNFh48cK8PLRNObR8hqTZKSQqVbXpn
         xE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775952337; x=1776557137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqO0icBg/ZpRZ3dRKkqaa/3izcSqhytJU77i4TeGTwQ=;
        b=ZSr00grN7cMMTkT9QPdmmD1I8KSecEI0RYYEyjZB7chfPdG9l07yx30iPSXchlodhx
         kDShQlWKTpx2xsmwhmh2xDPx5aziU7bhjIvU0hpDCHp9nTwHJRM/owCfxgVCvMGs9EzL
         kMACWeVLDvwxt3D9GDn5DdtESpZ4RRuERrt90bBxhkV/rx0GkXmp1W/Mz4i7YUmgnuvR
         bDPfe+/kpeqyy6rmOhYigYCILyKHshPB3XefWZTkF0T0FmBP/4YfIGpv0fUBMHiS3H5T
         RCQA4maP9gDhVIJ0A3Ioxzz2zc8K39p+0FYL5Oiu45DzU+iTmdiKOZF53yZqvV/tkckl
         Pz2w==
X-Forwarded-Encrypted: i=1; AJvYcCVg+8srz5gsOCoI1KZk6UzinliosNUeK/gHlhLdU39gpSU6EGXQhoaJhvV5huCrfeC+9ixT401yk/C3CIiQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzZAvu2s7d2ZgxxgfbyTWU7Rsm1nTm7Izik0MCGSFvNux6ccLE5
	bLzsaKTKw++aU8gCf0UeVkixtsO8JJmEV9TCg1VlEmi5STPnbBAoTs3gDCVl9PMFfezLzpPW1xM
	ayQix7pJHRkbuWcF88ETx6onZQo5MOYPJGln1Qe5E9ncLyJOK4fraojbqIQZ4fgFIWtj3
X-Gm-Gg: AeBDies6kvBvjhOtd+itc6fBRcx7tmNsJfpFxYGaD9utKayCFVfONcbDVedTcRklb9m
	xqx01ccA9gSVYCmuWvkxCuSeAt7esBOpjlD3Y10n5ECYg3jkSxGWU4Q3/CiOQkwQBKm7TWJY2TF
	DpO4JvCkvKXvLWpDltmyhcyrmxpDVJ0A9RoT9DYu5zecHRbmjsEoN6F+2wDt77OAaUkeGGfccmi
	oF3bPEpvzIXRmtUNvDda5VyB2mRXTJ0z79fGpi5MHB8WRv/OW3CNtwCx67zQsI1Y7gYs9++Oace
	WGiEwDhtqI55f1+3Qpe9gVQF7Pg7HzgGctqk5qUbqUQrFp1mSY8AicZ1LUrLeStG8PyI97sPu7u
	xk1fqpZ2qbUVJTbcV9vNQ1pNNBqBGGeJR8Thh/JvxDt/jqu8+odGz6dHWBiV2kXaBVqxYs0XLNh
	P/Zjs+hahLYPoq8t7fHG6QNhf6+R8XEwknacw=
X-Received: by 2002:a05:622a:5883:b0:50d:e45a:a3fb with SMTP id d75a77b69052e-50de45ab108mr62360631cf.51.1775952337074;
        Sat, 11 Apr 2026 17:05:37 -0700 (PDT)
X-Received: by 2002:a05:622a:5883:b0:50d:e45a:a3fb with SMTP id d75a77b69052e-50de45ab108mr62360231cf.51.1775952336603;
        Sat, 11 Apr 2026 17:05:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee9342csm1644069e87.31.2026.04.11.17.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 17:05:35 -0700 (PDT)
Date: Sun, 12 Apr 2026 03:05:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 25/39] drm/msm/dp: pass panel to display
 enable/disable helpers
Message-ID: <7dxlzm5hm2uq7ai56lmvzyjntn4kprdg5bp6qr77cqetku4hgu@iom7kqnfn4eo>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-25-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-msm-dp-mst-v4-25-b20518dea8de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69dae1d1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=LgG4ybvrVFF0rsqfD0EA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDIyMSBTYWx0ZWRfX8UnQe9hEI4+H
 SEQIqBd0gso5i8Ygdn5Zwh1L10K/BRBL/Tq0K9XtDiYKQYorCaf91DWgZUxBlR8ZoImu212FJNZ
 9J/Q6RBuZbE2vp6WrrDfOVLqVrzp9LTHkPEskZQuB2l5XyFMhRDUnwmsBP4Ogyc/vOCAJ1eEC/e
 mg3DrNPoNnEQVAKEZVrPE8V3EP194PQox2Iflwg5dQjNDvTmIzwUW3ta0PdF6b40FCo2yUZJ+Oj
 zfOqkc5nGEt+VnxXM/AsOFjno1gslD5BmyFZI1mJElYD3M8VQgGfEGfGHzeaQutWDVA63k9LpUT
 dNWqkRUBlvosH8vc2lO9rgctPsyn4NFHpfmjOJgfFmmWxSbMjo3GT/9f4NzolTpxGhV1ZYWUQIA
 TdyFRhCt8uR/ZChm83xmxDp87klHuL3/Wht0oBWv9jzajfS2bcNLMLy8w8e3wzCd/AFziS6x+vx
 eLJe1a82wCD9rtWdUwg==
X-Proofpoint-ORIG-GUID: YFogrqpqR-3loAAnqxf1CLcaR_h_gPGn
X-Proofpoint-GUID: YFogrqpqR-3loAAnqxf1CLcaR_h_gPGn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110221
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102832-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE4F73E20DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:34:00PM +0800, Yongxing Mou wrote:
> Pass struct msm_dp_panel to the display enable/disable helpers to make
> them easier to reuse for MST stream handling.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7b3b9160e005..88a078e53dc1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -668,7 +668,8 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
>  	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
>  }
>  
> -static int msm_dp_display_enable(struct msm_dp_display_private *dp)
> +static int msm_dp_display_enable(struct msm_dp_display_private *dp,
> +				 struct msm_dp_panel *msm_dp_panel)

Where is it being used?

>  {
>  	int rc = 0;
>  	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> @@ -725,20 +726,21 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
>  	msm_dp_display->audio_enabled = false;
>  }
>  
> -static int msm_dp_display_disable(struct msm_dp_display_private *dp)
> +static int msm_dp_display_disable(struct msm_dp_display_private *dp,
> +				  struct msm_dp_panel *msm_dp_panel)
>  {
>  	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>  
>  	if (!msm_dp_display->power_on)
>  		return 0;
>  
> -	msm_dp_panel_disable_vsc_sdp(dp->panel);
> +	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
>  
> -	msm_dp_ctrl_off_pixel_clk(dp->ctrl, dp->panel->stream_id);
> +	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
>  
>  	/* dongle is still connected but sinks are disconnected */
>  	if (dp->link->sink_count == 0)
> -		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
> +		msm_dp_link_psm_config(dp->link, &msm_dp_panel->link_info, true);
>  
>  	msm_dp_ctrl_off_link(dp->ctrl);
>  
> @@ -1529,14 +1531,14 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
>  
>  	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0, 0);
>  
> -	rc = msm_dp_display_enable(dp);
> +	rc = msm_dp_display_enable(dp, dp->panel);
>  	if (rc)
>  		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
>  
>  	rc = msm_dp_display_post_enable(msm_dp_display);
>  	if (rc) {
>  		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
> -		msm_dp_display_disable(dp);
> +		msm_dp_display_disable(dp, dp->panel);
>  	}
>  
>  	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
> @@ -1573,7 +1575,7 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
>  
>  	msm_dp_display_audio_notify_disable(msm_dp_display);
>  
> -	msm_dp_display_disable(msm_dp_display);
> +	msm_dp_display_disable(msm_dp_display, msm_dp_display->panel);
>  
>  	msm_dp_display_unprepare(msm_dp_display);
>  }
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

