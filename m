Return-Path: <linux-arm-msm+bounces-118552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ozMVC1B5U2oAbQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:24:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 647997447E2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:23:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EQpo3+5f;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YUDEztsX;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118552-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118552-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01D223019520
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 11:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3715F3A6B78;
	Sun, 12 Jul 2026 11:23:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1983A5E84
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:23:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783855437; cv=none; b=qJiy1i4GUHILhnQB8YyJCaWdVbz1OGtn7N4uSfhraBrrs9IKLF7yriEwEIg7guLQhlJOJLGz7OeWdz8aM6BECZtA8xo+COiT2FCL5e4hDVK0iQsdGu5/vbuJbog1FRlnPQg/osWVOONx5OCfSUXaIW7TFNr4gcGoUCggrm1TSnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783855437; c=relaxed/simple;
	bh=19YUX9tjCvOA0XcxhmJpoAcxx7krMI1l9WkhX3eUBDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnjxcvpWRXs2GlZsnE2lrOT7efJMdq5TOL5ZLRe+DHq9AoO3ubdi9EgRYU8FEcuUjLkS7y49mcUwOvVDC4IFn8+xq6cgXuQCj7EHeQNwoV2M1u5tzSR25s8aFHKLTQXYE+m/6/zP3F4y83Y6y4mxuIZWgLEK+a7dLUN3Za01kHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQpo3+5f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUDEztsX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAcNsj2332417
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	al+c4HA1/mkq1/e+JdUUTQZ0NNKkY/oSTg09WKvnFvA=; b=EQpo3+5fW/2kK3o4
	9BhYKb9qyXxnaiBNf2roa5NqkgGe0L9xnCQd6ihJ5uvhgkxLacpXOUHsOOZ/3M+V
	3rWDP17Au+Akj1WAE4bTVJ8AkrfQuoYGe+/syqFU/naxmSvV6fB/tr6Xr1ia+PJ2
	tsnGMXFsQknfivk09gV+D5GDvyHsKB65qoOtvgfI4Q4622UotE3sCjINKHNX5FKq
	JJyaDT3YUicfvh/NvHxXzZbH/Sg/t7VyiMOmQJvcMNFm81oZtt6QIDc9Be0JzA23
	N8sa7zZBBjuqvyrvZUIWaPKSGKOatrRCtHWTxP4zFgGEmXgKeCP569r3+6MvYzmL
	mRpQJw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeamtq56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:23:53 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bd7905b135so451400e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 04:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783855433; x=1784460233; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=al+c4HA1/mkq1/e+JdUUTQZ0NNKkY/oSTg09WKvnFvA=;
        b=YUDEztsXjvrjP6udo+kioGTf4Y1DsjjTHHO4xesGNZlkMtQ8HuxnUxQ3JjWkvJZZx0
         5D/t8jPEDpY5wF4mdiLyy9t2I/ZLG4VDaCnDvJyV+zOZkhmgE7PLv0PxNhcxc8lyEMwW
         nckc4bXFUekBMdbkuN/WXErE+J0+kSc4MPEG8th9nFXt4glUBJUiCBCzwsS3Z1uRma56
         AtEM+gPUGxB5n+vme2x90Ig8NOuVNNA7rukxjjimsWhOPc42FSiLWIqbPQ+DGRt6kt4B
         WnxLx2s3DSNkVMhmpzizuadxC2wMybb/vwli6XHETGCbXo7y5aj/xqREsY6H5s7EHoGq
         OD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783855433; x=1784460233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=al+c4HA1/mkq1/e+JdUUTQZ0NNKkY/oSTg09WKvnFvA=;
        b=ZwRpmEORoaHbf2sHYwOMQUOb4KuRtiFK5JU6QtODgi4+rx/Dyekv8RPqUOr9Dt9Ql/
         cRqx+MJQe5NaSP0ewS/f7g4jejdDs7dzN1E8hnpjb1Hu/6zBXXYmNBLmw6UggynGrL7k
         ZS5BPnGImdY4zEtqKp+uwwnakYoUYRsy26i6nZqaSy9L8zsxdj2xMLsrMHudC73Bo0NE
         CeFwiw4SyysT65NQt6sXW0M6VVavw+1k5ajf9HNp4sOwtRdN7/COVRvCDwzn/JWtI+cy
         axEGFXl+kgHS19IPQXEO/ZEylaJRtFkV74JCYY7IfZLc//nDIe4KUmpREXwukrAt0ZbZ
         HPEA==
X-Forwarded-Encrypted: i=1; AHgh+RrO2NM4zL+ooahA6+LUu5kdL1Byf6/T6FcOFN3vVg45Tanc/+BXmrx2Q76cPrB54TCQJxAbZGIwwrluYvZL@vger.kernel.org
X-Gm-Message-State: AOJu0YxnPCgwA8NwnzNfBvWbfQSmfYZwSbku73hH5oMU0ufMspBOWQEH
	zhcnD/RnV7aeX03NKhxwtrG+eUfLKLGI9v+r8A/EdUb0Er9+xc/DpxflMtZBA4v7llCrOyqcZRO
	3GgGIUNfkhn9mTg1kWEDqqaStUnPVKLE91dOaUUPfglGqnNx2bzB8hni5ZKkO6Cwh8yNr
X-Gm-Gg: AfdE7cn9gt+rs/lRrKYjox86NZTBrY6Fj3/e9IXlVvrhgWcTCK23C7UtiQ1KLf282RK
	Ic20BiHgL0nfTt+0xI5yjMI+Qvv0ljn+KRCWaA204I0P5IpIwkOJ07GAdPULGnu17H4Apila4H0
	uB1eKF/njd7xX0jsYnd4bHE+JCfoeRbYsEOz8GsI3uTkrl9qYsnl/rdUyXw8VwvGCirpZsF8vXb
	kSydttlPMw5XyWhReY1rQZTAoiCuFNcdMfhouvOOD9B/d4F2QOukxBlV4nBekVpNKXl4z8XuPBD
	eUo6e3X9PWq9FEP7qNYteaE4Y7cM+L9436M25a+Imqo806K8DaNDTcRTMPLjOZmRRIwKXixT1+M
	imBST1n0oY6jeZ34y+luVnOOMrW9yvXfe9Asidu1VudXD4YhlFU69iX11ga6wL1m+xZeQoysP4w
	95w/pMbixvIrsWsQXJlfMMYpGd
X-Received: by 2002:a05:6122:3790:b0:5bf:9f77:477a with SMTP id 71dfb90a1353d-5bfbf18ee3fmr2933471e0c.2.1783855432635;
        Sun, 12 Jul 2026 04:23:52 -0700 (PDT)
X-Received: by 2002:a05:6122:3790:b0:5bf:9f77:477a with SMTP id 71dfb90a1353d-5bfbf18ee3fmr2933447e0c.2.1783855432152;
        Sun, 12 Jul 2026 04:23:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849180f3sm19740161fa.4.2026.07.12.04.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:23:49 -0700 (PDT)
Date: Sun, 12 Jul 2026 14:23:46 +0300
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
Subject: Re: [PATCH RESEND v5 03/25] drm/msm/dp: Add support for programming
 p1/p2/p3 register blocks
Message-ID: <fvbqltre4qqdf3ss6huv3wz2exd6lin46pykp7ualvr6att4og@4ti6htrtcnlm>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-3-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260629-msm-dp-mst-v5-3-2ed6aee1867a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDExOSBTYWx0ZWRfX2amH6s9G/RP4
 tGM+h/lNSNOXqbFpeWFezLFKmR/9dSq+ZoSVukp73MCRSyCM745ICe/RPrkuq6iDB9gYwrV6gJz
 oOiMwcfDSDv/PKvJ1a1fhjw6lpD1ioA=
X-Proofpoint-GUID: YAU9MT8l_o4TMstSTJhax_mfECAi_RIK
X-Proofpoint-ORIG-GUID: YAU9MT8l_o4TMstSTJhax_mfECAi_RIK
X-Authority-Analysis: v=2.4 cv=dJSWXuZb c=1 sm=1 tr=0 ts=6a537949 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=uj3fcQ3Jo-9mkThLgboA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDExOSBTYWx0ZWRfX6XcS725b3l9I
 9y6Ddbmd9edRI1SQr+NSsQ5DXPEy3In2N7gS+fTSjnoeBBPx0nvyxQ0a/38O7Ev3ypkobzFQwY5
 i42hZAvk8swDt9izy3hN6FKi2Ft+8S1c7XnaVx/Dz2BnUO1tQ+XtzNzir+kwELo2WuYatHEuV/u
 tCEZ60BUFvcV/+hQQ4s7XflHjmJlywPu2jJPstcGb7eS+nx8bj7+TTTaeGSO4gEHAMlPRVMDRDa
 C6KYscoA9Dqkf2Qb7GC9Fp+ESvngu3hxW81Y3TO4/pvtb+73iZiTP5wch40mJqtFZQZxETHp0bo
 iLoU27Bx2+e68uGQ7Q8Qoa02Mg732M5LaHzaumFXstKx64ymWvq/HmuuqpbMM159mgB2BwnagZp
 5NOelJ27Q0QUAH/4ThWvRP5T1MSUKXfl+s2LGcC81mvtMc72pGspbrtgy5VnSgTDnVLSldE9S+r
 m00KHWYJ71FwhXs7HYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120119
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118552-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4ti6htrtcnlm:mid,qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 647997447E2

On Mon, Jun 29, 2026 at 10:14:24PM +0800, Yongxing Mou wrote:
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
>  drivers/gpu/drm/msm/dp/dp_display.c | 40 +++++++++++++-----
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 82 ++++++++++++++++++-------------------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  2 +-
>  3 files changed, 71 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 9cd243411e44..74f481a18164 100644
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
> @@ -564,7 +564,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>  		goto error_link;
>  	}
>  
> -	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->p0_base);
> +	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->pixel_base[0]);
>  	if (IS_ERR(dp->panel)) {
>  		rc = PTR_ERR(dp->panel);
>  		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
> @@ -850,8 +850,14 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
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

It should be:
  for int i = 0; i < DP_STREAM_MAX; i++)

Also, you've just added a NULL pointer exception in the crash handler.
Check for the address being non-zero before adding it to the snapshots.

>  }
>  
>  void msm_dp_display_set_psr(struct msm_dp *msm_dp_display, bool enter)
> @@ -1131,6 +1137,7 @@ static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_
>  static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>  {
>  	struct platform_device *pdev = display->msm_dp_display.pdev;
> +	int i;
>  
>  	display->ahb_base = msm_dp_ioremap(pdev, 0, &display->ahb_len);
>  	if (IS_ERR(display->ahb_base))
> @@ -1160,8 +1167,8 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
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
> @@ -1172,10 +1179,21 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
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
> +	for (i = DP_STREAM_1; i < DP_STREAM_MAX; i++) {
> +		/* pixels clk reg index start from 3*/
> +		display->pixel_base[i] = msm_dp_ioremap(pdev, i + 3, &display->pixel_len);
> +		if (IS_ERR(display->pixel_base[i])) {
> +			DRM_DEBUG_DP("unable to remap p%d region: %pe\n", i,
> +				     display->pixel_base[i]);
> +			display->pixel_base[i] = NULL;
> +			break;

Here we should differentiate between the address being not present in
DT (which should be ignored) and any other errors.

> +		}
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 745ee6976897..238920c45261 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -25,7 +25,7 @@ struct msm_dp_panel_private {
>  	struct drm_dp_aux *aux;
>  	struct msm_dp_link *link;
>  	void __iomem *link_base;
> -	void __iomem *p0_base;
> +	void __iomem *pixel_base;
>  	bool panel_on;
>  };
>  
> @@ -44,24 +44,24 @@ static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
>  	writel(data, panel->link_base + offset);
>  }
>  
> -static inline void msm_dp_write_p0(struct msm_dp_panel_private *panel,
> -			       u32 offset, u32 data)
> +static inline void msm_dp_write_pn(struct msm_dp_panel_private *panel,
> +				   u32 offset, u32 data)
>  {
>  	/*
>  	 * To make sure interface reg writes happens before any other operation,
>  	 * this function uses writel() instread of writel_relaxed()
>  	 */
> -	writel(data, panel->p0_base + offset);
> +	writel(data, panel->pixel_base + offset);
>  }
>  
> -static inline u32 msm_dp_read_p0(struct msm_dp_panel_private *panel,
> -			       u32 offset)
> +static inline u32 msm_dp_read_pn(struct msm_dp_panel_private *panel,
> +				 u32 offset)
>  {
>  	/*
>  	 * To make sure interface reg writes happens before any other operation,
>  	 * this function uses writel() instread of writel_relaxed()

Hmm, so the comment talks about writel(_relaxed), but the code is readl.
Is the comment wrong? Or is it not applcable and we should be using
readl() here?

>  	 */
> -	return readl_relaxed(panel->p0_base + offset);
> +	return readl_relaxed(panel->pixel_base + offset);
>  }
>  

-- 
With best wishes
Dmitry

