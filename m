Return-Path: <linux-arm-msm+bounces-118603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CqD/M4QNVGqWhQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 23:56:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C1C746129
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 23:56:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="pND/cEdk";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UVcp6Q15;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118603-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118603-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDC04300A121
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 21:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27684369981;
	Sun, 12 Jul 2026 21:56:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80782D47FF
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 21:56:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783893378; cv=none; b=LSg3XP07aEkI8gQKOFxNqu/cURR/TJuAcQZDBbuR0wAeoRVFgI3FYMT+fmqxoB+oXREPb323EYY6LQQ7paodBMAwm6ICmR34mIqq/kgygx5BZ2POCfEaDyeuIeYyCBYj9hbHW0otREyLGy8Y08bVZVKFdP2NzVultvzl4gXUL+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783893378; c=relaxed/simple;
	bh=kvysx3bbjsgqX+kpja5j8KUppQL/nIgdr0Jt16KPxcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hIyNYyUk1JETCDqENy0dS3j+pUzFEiqG3IzR8UHtQfcrnY4Ok2T9pxTuczd57GoNr+Qaw/RVeb3qM+3s41xU8R2uA3les8XA5AooKh/0mTJ6xjk7MVQ+shDdyFMKdSNeX2jUfrSwnwalrVE+WMCQATvbAYHNgYVxbNoG196I46A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pND/cEdk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UVcp6Q15; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CK8LJu3501934
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 21:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=miBRTRUcyF4er0wPQFfEz88S
	7Bst8TkGlZ4fEE+O0R0=; b=pND/cEdkdz4o9/ckHycSjI6mkfzl2tOw4Fd7IbCM
	1N7YSZPnb65MXyc/t13sRkEJMeuWFezYk3SQOR+zwWfgZM63ZGUmVFWrxrzaqtTy
	/eGm/FNy8m0nxzzNw9e9QgzBftKZgtSdaU3IJOF+ebZKERmRBhcSjGJGKhzYZFsB
	reOoUpH21/eD5gVo/FggbnwB1j3tilqW3T+DJSR63SGwq/mbfC9IVUGv0uWq3Scd
	Ce1FPWqnncPNazR2Ldx8IKgO7D3FwD83DjoaE8trGqX8+MMAWB0Cto8/AJW7qBTJ
	/J2rLCJKPdBRpkGbSvlj12y1skN4GYASqjwJFYZSmU/a7g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeamum47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 21:56:15 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bfbdb5e610so1458999e0c.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 14:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783893375; x=1784498175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=miBRTRUcyF4er0wPQFfEz88S7Bst8TkGlZ4fEE+O0R0=;
        b=UVcp6Q15nqAdAD+YrG6wXXke+AzN5hFfR95S01f5K5L/8F9Zeos0MFBber6wQaFdwE
         2+dCJkxDFswMAVgLtwM8ckongzGYhBfmwT6cvRtnXV4A3fGqyz+XhDiOiGJvkODqg8PC
         d/eab+Ikv4yjcrOvkBSe9qDRgmyZZDpGWwhW+qQymkbFpsHRIVTc0UYppP7NQ+ruhOak
         vMbkJ2NuzqSmJDKhtcFKW3kmyvYlWE8P+m/DAKbwssxPdONCqmG4Fqi4D6qinwdUpU02
         rFTR4LjZjwPu1x3DVZeb1FbPQwAuxKAZSsoQwztaxKny+eU3m6Y2WG63iJHs6pIdeFlD
         ri0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783893375; x=1784498175;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=miBRTRUcyF4er0wPQFfEz88S7Bst8TkGlZ4fEE+O0R0=;
        b=E1rzYmEjRpYHVikcW3HUXVymcNkzSl6GHgI2SXvTxDwLPBWBYXMpeokxOdzMLUcQQL
         7myvMWr7V+4SP7RkPUe2HYEp59f9KzEK2dJZg2wPdd9mohSXWhyXEQ04Tth32Jmm1aFI
         WhbVlI3XcSfr2kCn0DmGuQZ2DLOeuXRnkJQpOh8sQOOQ2K1WrBGRiDL0Z8jek1bulUvo
         u1YkrjqDc95TPtqESHmLV7PeCGhhOJRN//OyhqNcF5QCs7EdKr3Czuh+z2TNSvPAMSFT
         BmmOhNH08VX20iUZCRwtgc+sm9T/erKXoY9+byf8lLyZY1euzpKmp7si7QKhTia19mmA
         vRSA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+vZTOPPtDOScQJzQzaHY+I8N3TzYSmxS7cjuDP5qJ+pb0Etw9EmeeAimN/vOwzJIItb04XgQllb+Tf9Lf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3pn6wC0fDAT2a3JBCfbf+wbgReZf1QC60oE3QFqjhD1Ws3Cef
	0F8mpECFcaiFTZJ5QesZXx4L/IhUAyQO+beywN1ogmQEsXPIOumiD1X56UJCJWlteOci0xelAMF
	4zSj3DijMxOfqqxFCLwM0IRqeNVgUYDasAUzNRZNYtiFCrWYFwkx8X/T+oTSzZVqaTHkf
X-Gm-Gg: AfdE7cmJngk3acNJzrraqy1d7Epa5RWDoBl3iCRDQVEf+jt4e7gxjLabyM4VwUKn1UL
	VHH80TSdtIJFBe4yTa88kdXQhZ+6R3nmw+QG4Dm6lfFJHyH/MnKuNru45DYjNcbrsoFDwmxB413
	U9kHAEqkwhb5kLqP4cSo9elYHR/zLo/UMoME6vigpX/goPY8D++Qt1UWHYUYakXiwLxY+durfGN
	3kZ5fmBa3aRsdZnsfq0Y5gCNBJR3iGPCh9hJx31lUVTxjUAWVeOIyEeRbX1WZNKo2EJ2mIfBcuE
	/WaKU1TnJUWh15BviFwSOrMFm0EokbBxOKQIvKCWJ8vjXUF3op1xK+GCLajlLYUKmnh2/X9a9XZ
	7IW354NvcMb9tlj9x5UI8znnuOPpuwLWjF26GWfjrajJy/zS5Z9Ibx2K2tyKmmt1pqVhp7C24EN
	D+E88KUmdFC9lJbrC7lcuNkvTs
X-Received: by 2002:a05:6122:1818:b0:59e:feb7:8a5b with SMTP id 71dfb90a1353d-5bfbed5ff4cmr4688821e0c.0.1783893374968;
        Sun, 12 Jul 2026 14:56:14 -0700 (PDT)
X-Received: by 2002:a05:6122:1818:b0:59e:feb7:8a5b with SMTP id 71dfb90a1353d-5bfbed5ff4cmr4688807e0c.0.1783893374562;
        Sun, 12 Jul 2026 14:56:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b1a164sm23484121fa.16.2026.07.12.14.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 14:56:12 -0700 (PDT)
Date: Mon, 13 Jul 2026 00:56:10 +0300
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
Subject: Re: [PATCH RESEND v5 16/25] drm/msm/dp: add
 msm_dp_display_get_panel() to initialize DP panel
Message-ID: <x73tylpiatrtwm7e6zomd4awwgoqdzqnbhdtd2cwxh4s6zlp33@6cjnrita5ypq>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-16-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-mst-v5-16-2ed6aee1867a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDIzNyBTYWx0ZWRfX3Ju6jeRAfMyA
 +UlZ3UL4UwXyE6yqt2rg6wS7IlrDp9vajy0j5aQC1ITZkqmuBE09rtuicgxn1mrWIS5qwGjf88F
 uvNXrscXUx273Pje38XQUQrxtM3RqcI=
X-Proofpoint-GUID: ta6BMwfDd4kn0j7LyJKuPor8a7GdUatn
X-Proofpoint-ORIG-GUID: ta6BMwfDd4kn0j7LyJKuPor8a7GdUatn
X-Authority-Analysis: v=2.4 cv=dJSWXuZb c=1 sm=1 tr=0 ts=6a540d7f cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=qYs0ZBLfSisuqDwih3YA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDIzNyBTYWx0ZWRfXyIe5eaLuNLeZ
 XrjfpZ/jfPfea+js/n/gzHhlvDPga7L9gY1P2NwtzSGzWui+dRJQ1KpQEgQFT1snuGUyJcIQz+W
 4Jl+CZLozrY5n5tddSjY3PDFBlIosvENyaLCOolVcJnpVkuKC4R2KuhToeY29A26ZAZxjijTea9
 yuH+gC0A8ZFSZTQ2z+gm4yxewXOPIA0y0kwrKMu52/0ie0fUY5xKySZPWL7iPu2N5Tv784ax0un
 uSxNC+CXehQKtxBAdku2L43zjLvdLJQj7Eisn3/M/189aOtcrNIr9MnWl7/TsYBjkBM/xshPfR/
 GheXlpfvWwPFRdjQ0KlKFcGmNZdUSLKoo/+PqgVg7F+tbSGhDvfl48UeuVyFMCsjrTH9CUCI3oO
 PLM7xmrR8Cw+eeYS66DYZord8SUmkjN2/gYtop+Ei4zLAjAhY0j4ZH7egKXTRHsVWY8PjRPbvLB
 K3a0wxfyKrHAdE/sF9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_07,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120237
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118603-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim,6cjnrita5ypq:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20C1C746129

On Mon, Jun 29, 2026 at 10:14:37PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add an API msm_dp_display_get_panel() to initialize and return a DP
> panel to be used by DP MST module. Since some of the fields of
> DP panel are private, dp_display module needs to initialize these
> parts and return the panel back.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 27 +++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c3be656f10ee..2a74302bcb7c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -565,6 +565,33 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp)
>  	return rc;
>  }
>  
> +struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
> +					      enum msm_dp_stream_id stream_id)
> +{
> +	struct msm_dp_display_private *dp;
> +	struct msm_dp_panel *dp_panel;
> +
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	if (stream_id >= DP_STREAM_MAX || stream_id >= dp->max_stream) {

We know that max_stream is <= DP_STREAM_MAX

> +		DRM_ERROR("invalid stream_id %d\n", stream_id);
> +		return NULL;
> +	}
> +
> +	dp_panel = msm_dp_panel_get(&dp->msm_dp_display.pdev->dev, dp->aux, dp->link,
> +				    dp->link_base, dp->mst2link_base, dp->mst3link_base,
> +				    dp->pixel_base[stream_id]);
> +
> +	if (IS_ERR(dp_panel)) {
> +		DRM_ERROR("failed to initialize panel\n");
> +		return NULL;
> +	}
> +
> +	dp_panel->stream_id = stream_id;
> +
> +	return dp_panel;
> +}
> +
>  static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
>  {
>  	msm_dp_audio_put(dp->audio);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 75dc40261723..676213a48089 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -58,4 +58,6 @@ int msm_dp_display_set_mode_helper(struct msm_dp *msm_dp_display,
>  int msm_dp_display_prepare_link(struct msm_dp *msm_dp_display);
>  void msm_dp_display_unprepare(struct msm_dp *dp);
>  
> +struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
> +					      enum msm_dp_stream_id stream_id);
>  #endif /* _DP_DISPLAY_H_ */
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

