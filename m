Return-Path: <linux-arm-msm+bounces-102811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJymMwCO2mkc3wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 20:08:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 263FF3E1374
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 20:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8741C301B90A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 18:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181281A681D;
	Sat, 11 Apr 2026 18:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GOgrOWgv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M0IJ4md4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57E317B43F
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 18:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775930878; cv=none; b=Vn1ExSFmVdhp2YQk6O3tYz95In3lOmKPfHyQti5H3J54uV+aHuzXl4BV/Mc5uE/KqCgdii1MomcWYh1gngS/+2nqtkNAAAPB38jcJyPKOl8cyBWglY8d59BqJZ8imBWUqsJYBvi3dFy0UZtzqfMjsXq0IR2p+3PArMCSEgUSSmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775930878; c=relaxed/simple;
	bh=GV+iZ2+iVmuDZ7pj+9dZPJHn7Qn+RoUE4ZLcHeCsgQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbNp+CR7jP1/9iAlleALa6EvqWINHpPko2wTX+2/sz0UEbKZj8Acfv8r64rAgIKyN/UOtB0aq87q+5eV2iWqKucVv0MCGii8skdlF+eBrFmXaMh+mhyFHzbSPHtQin480H87TRu03hVAHiR84Nqx1hVl7vkyWX7pOAr3vqtwslw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GOgrOWgv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M0IJ4md4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BGMKYU167791
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 18:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQDuX/vawvkYbkeyVpkFhSB279SWYSpgK1fT4HJGYbU=; b=GOgrOWgvTDtt3l1S
	CXhZZ3ukiDU6FJcJKY80vSNz6Y4p1NnpJOphLTdcutMMTW++h5mXZyLe9uHiSpTL
	DEwetqOmwsdOqFbAy116C8GDkOfTCttSlI0Ja+g+yznJNA3miNWNpdUNH+67tQor
	S/sY53bSU6rDDvRC4VPH5/U+nn2wF9wpoe2M9GSBg+hjlG1vDc+2OGMN8ZzPjDtX
	WCTmE78KdpDPgPG7/T5mhfITienLhkMJHUq6Ky/qAJDHPT1zjiSTA38BI+cZACSR
	pmMjDitYLXssMs7qK0TAAvxPKzp5YyZdrR8ZJ/1nlBEurWJUXA6IHoyq/FR/7zhf
	Tpvugw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbp8usy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 18:07:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50da529ff48so79009741cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 11:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775930875; x=1776535675; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yQDuX/vawvkYbkeyVpkFhSB279SWYSpgK1fT4HJGYbU=;
        b=M0IJ4md4BYHdhke0YhWkSGOr8iNDOaQwHTYRts0HDdpwB/tT8U2a5y9bceZ10LIx96
         zQUSwNCT/BdhNsJPvri/0pGPGqmp9kn7jW/epSW8vdORYDEIJqMJ762KnIiWtDWp7FPh
         rHPdPj/a6bsbzIG2vxVeHdSMu6BR6inDWsuSaugumY9irDcFevCK9PmBNWapHfM/8ydb
         0zYLeW4BNlgp5ynxBl+WmdWeDhBRWBWBnwNt0D99/J0/uGpgxeJQU6R78/hZTzpzaCEQ
         yjyfNI7Uzzy/1MeVLoUfWuboQxrIgYT63ypkGTj2F1x0qSK7mmCMWq0ozlf7PS64JKbb
         FPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775930875; x=1776535675;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQDuX/vawvkYbkeyVpkFhSB279SWYSpgK1fT4HJGYbU=;
        b=RRZrxaXDX0Mkdr/xzRpFf0HIFVa3HZsa8ltpSS3hyOPwAaXw930j82q0z7hg2OeUmS
         OJ273rRDoureqqzPp62mPXQCbDjTCBAkf9kSdHZ3+nVzSF1Zpwcd83qE/0oe25EWVnXh
         oerAML0wS9WoDSFyvV77Jj22beD40XRw6PJl/ISV24P41n0T55ZKsxnwdTJBTkfwJf0W
         M02WLs7oZz9xJgQM7qq6sJBxLbmD1NE842V2TixwAM+uqrUtd21mH6F7RvZ1Hhxzyrnz
         OmfyyqPJX6QnYbGjmrdhWMZxoygMwI0M1fvIv07OJBcGuN/HCLsBlNdZKttsktwor/CW
         y7Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWD24h5PGNr8Cd+EUJnwGXbmX+tS618+cnPWkBJFLGtU4BcI+hYltTVVLTmudFtBw0LOA5UPOIDOZnIWxFb@vger.kernel.org
X-Gm-Message-State: AOJu0YzECXqsQds51eklPPa+fL5XI0YRrFJEx+fqrVnT8JMJKsK7nic2
	yY+rFB26Hmy5g+BF42VJF1QCQnWBEFJ+6yTYL3cDpBVqk6K6C8yb/O2Prhvcg36K7MHDjQ6kKLV
	P4FkmAFOLHLM9TbOeBEtfJxp/9NYaud8Uc9CsDDvaNNdeO6qh6wCGH73KJwrIXOLBXadq
X-Gm-Gg: AeBDieslTCMAehk42/XRoUODsdkgRZUzlOq7WIPQsXsu7FcPbGLaV8QVH9ukGh4Dn3D
	5t8C5lJQ4PaUBmZqQxTTzRjmoe/aZdHrfIMdlvbd0dxVGgorAlNv2PLwwdPThm4+e4nW+9p9HBK
	ZdfOQPMK8eZE/l03d3EHpl7a7aqDYH9cSzpIYyU/XNMzTsrIffyrz7sMYoHBkfhTbLi9r86ynQ5
	8qGpcRn6pW6qYODjWMLKi167mO5t3xR48Tw5Ltb2jx2gSJja+42++BlVloyna473xou3By8Z1wp
	wMfcD6srasaA2zTFy1Dt4u3glHzX2Dq5DF7JK584K9ObQYUvysJ4KDJMA40ZE8gSLRSJ2WfQTJg
	x9J4nz/LVBYcXVals/wQA0Ks8TqLVsy4XSk81pQL22HQ/1lIz2ElsHe6nrGYOqOM1/8n/jHRme2
	8fKK57yifpcoKd+fHV7IxczlvyTpFPyqHxctE=
X-Received: by 2002:ac8:590a:0:b0:50d:6557:5cb1 with SMTP id d75a77b69052e-50dd5aed289mr127199921cf.27.1775930874743;
        Sat, 11 Apr 2026 11:07:54 -0700 (PDT)
X-Received: by 2002:ac8:590a:0:b0:50d:6557:5cb1 with SMTP id d75a77b69052e-50dd5aed289mr127199631cf.27.1775930874276;
        Sat, 11 Apr 2026 11:07:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495ae96fsm13148481fa.39.2026.04.11.11.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 11:07:53 -0700 (PDT)
Date: Sat, 11 Apr 2026 21:07:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 15/39] drm/msm/dp: Add support for programming
 p1/p2/p3 register blocks
Message-ID: <zputabw52nsba4ddwg7gd22tyouobkmlpq6blos7w3kx457otx@gitmjwroo7ou>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-15-b20518dea8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260410-msm-dp-mst-v4-15-b20518dea8de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69da8dfb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=vYM-Xb_pCo5HwlhjwkgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Z8ZcBCuADN-aIU85rRAfZY5GsvexeQRG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDE2MCBTYWx0ZWRfXwIzGE0RwsOAT
 eYJvQjaQOvHQs6oYk4AUEDMsEnFtvIKKYNeK4euUmnEIoo4rHNZDxGg+WWQxYYG28xXDBVU2RxV
 JGhzoHFr6ZRFKx7suXJSxfRaW3wW6BUNPEgD7RsMRSh4NMppXEa4vxbn412udFHuya4gQP5yoHJ
 sUAi5WiWQrrWQ37ne4kzE8vGtQXstf9E231iqlVdjAJr3l+nhrhY4mJXGIF2GYmw/Hi04arc34b
 sxwWN4ajPOqWnXmqUQIbn/tKMzEGmJQ8lNm6MfGPjQ64Uv1XZ9po7WhSVsRN3ZG+bH3rjUWsnVY
 5W7NXrmRWCPELtAougixkG8N4AY2cQafDhx5e9wryHETEIrAkkpLsgyzU8Tc7D/CjX80vOIi/UH
 +BPrcgdYHJF0An/VYL7VfQq4vtNIQ3c9TtZnK55IveuTwgnAzsz5Ghp9TVNuWfBl8UxR+54D09m
 LvHYczYthq2v50drsuw==
X-Proofpoint-GUID: Z8ZcBCuADN-aIU85rRAfZY5GsvexeQRG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110160
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102811-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 263FF3E1374
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 05:33:50PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add support for additional pixel register blocks (p1, p2, p3) to enable
> 4‑stream MST pixel clocks. Introduce the helper functions msm_dp_read_pn
> and msm_dp_write_pn for pixel register programming. All pixel clocks
> share the same register layout but use different base addresses.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 40 ++++++++++++-----
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 89 ++++++++++++++++++++-----------------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +-
>  3 files changed, 79 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7984a0f9e938..ff506064a3fa 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -85,8 +85,8 @@ struct msm_dp_display_private {
>  	void __iomem *link_base;
>  	size_t link_len;
>  
> -	void __iomem *p0_base;
> -	size_t p0_len;
> +	void __iomem *pixel_base[DP_STREAM_MAX];
> +	size_t pixel_len;
>  
>  	int max_stream;
>  };
> @@ -561,7 +561,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>  		goto error_link;
>  	}
>  
> -	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->p0_base);
> +	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->pixel_base[0]);
>  	if (IS_ERR(dp->panel)) {
>  		rc = PTR_ERR(dp->panel);
>  		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
> @@ -769,6 +769,7 @@ int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display,
>  	}
>  
>  	panel->stream_id = stream_id;
> +	msm_dp_panel_set_pixel_base(panel, dp->pixel_base[stream_id]);

Hmmm.... Would it be better to set it up differently? Allocate one panel
per the stream from the beginning and then simply get the first
available panel when required? This would require some minimal resource
manager, but then we won't have to pass dummy register base to the panel
code. Or actually allocate a panel when it is required? Do we need a
panel before atomic_enable()?

>  
>  	return rc;
>  }
> @@ -882,8 +883,14 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
>  				    msm_dp_display->aux_base, "dp_aux");
>  	msm_disp_snapshot_add_block(disp_state, msm_dp_display->link_len,
>  				    msm_dp_display->link_base, "dp_link");
> -	msm_disp_snapshot_add_block(disp_state, msm_dp_display->p0_len,
> -				    msm_dp_display->p0_base, "dp_p0");
> +	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
> +				    msm_dp_display->pixel_base[0], "dp_p0");
> +	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
> +				    msm_dp_display->pixel_base[1], "dp_p1");
> +	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
> +				    msm_dp_display->pixel_base[2], "dp_p2");
> +	msm_disp_snapshot_add_block(disp_state, msm_dp_display->pixel_len,
> +				    msm_dp_display->pixel_base[3], "dp_p3");
>  }
>  
>  void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
> @@ -1163,6 +1170,7 @@ static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_
>  static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>  {
>  	struct platform_device *pdev = display->msm_dp_display.pdev;
> +	int i;
>  
>  	display->ahb_base = msm_dp_ioremap(pdev, 0, &display->ahb_len);
>  	if (IS_ERR(display->ahb_base))
> @@ -1192,8 +1200,8 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>  		display->aux_len = DP_DEFAULT_AUX_SIZE;
>  		display->link_base = display->ahb_base + DP_DEFAULT_LINK_OFFSET;
>  		display->link_len = DP_DEFAULT_LINK_SIZE;
> -		display->p0_base = display->ahb_base + DP_DEFAULT_P0_OFFSET;
> -		display->p0_len = DP_DEFAULT_P0_SIZE;
> +		display->pixel_base[0] = display->ahb_base + DP_DEFAULT_P0_OFFSET;
> +		display->pixel_len = DP_DEFAULT_P0_SIZE;
>  
>  		return 0;
>  	}
> @@ -1204,10 +1212,20 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>  		return PTR_ERR(display->link_base);
>  	}
>  
> -	display->p0_base = msm_dp_ioremap(pdev, 3, &display->p0_len);
> -	if (IS_ERR(display->p0_base)) {
> -		DRM_ERROR("unable to remap p0 region: %pe\n", display->p0_base);
> -		return PTR_ERR(display->p0_base);
> +	display->pixel_base[0] = msm_dp_ioremap(pdev, 3, &display->pixel_len);
> +	if (IS_ERR(display->pixel_base[0])) {
> +		DRM_ERROR("unable to remap p0 region: %pe\n", display->pixel_base[0]);
> +		return PTR_ERR(display->pixel_base[0]);
> +	}
> +
> +	for (i = DP_STREAM_1; i < display->max_stream; i++) {
> +		/* pixels clk reg index start from 3*/
> +		display->pixel_base[i] = msm_dp_ioremap(pdev, i + 3, &display->pixel_len);
> +		if (IS_ERR(display->pixel_base[i])) {
> +			DRM_DEBUG_DP("unable to remap p%d region: %pe\n", i,
> +				     display->pixel_base[i]);
> +			break;

No, return an error.

> +		}
>  	}
>  
>  	return 0;

-- 
With best wishes
Dmitry

