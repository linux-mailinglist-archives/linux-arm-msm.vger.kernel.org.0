Return-Path: <linux-arm-msm+bounces-110144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPHTKmdgGGpEjggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:33:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F355F478C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 65AD5306E485
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80CDC2E736E;
	Thu, 28 May 2026 15:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tw7EWfSF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VEPZkngJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB1E2E7367
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981788; cv=none; b=rirGKza+mOUhkMBMi3LgiEsGOXxnrw90wPZriM6G7UlgkA/B0vHJrw6+mpPGd6Nu46DAFJGKqusqhQqOJq7puRvbGg+cY1e3bcvL2sH0/H1zvhJqYaa0iykrrigCn2Zc1r6FfwqohxZdzWqxLCOQf/wZgNF8Xe+yxr5CzcD0pok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981788; c=relaxed/simple;
	bh=9Wh1HqOaCm4lzYLPL8Zzp/JaGlffraRFpCSXQ4gxR+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/aN34xB1rHSLuviUY1c4fy4wUUztfqU0OpurnxphFEoNa5VjxHFjgHmOSnadmjpsYsubHPAc1NLF4GZfacV2QcKglYG2uQrSOD8FbPtyvGKwChZoHHIMRgCcfCbl41YP9VP7/BCe7MD/il7QFyc8yv4/l33QYSDZAH/pLMBfO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tw7EWfSF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VEPZkngJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vOxp3545348
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PEDqP6PRnD4f3w0pOYnhKn4r
	OzVoretJwgoZHP7f+y8=; b=Tw7EWfSFFA0va9E7Sln0BwnmKyNm+kMw6d0AyuNK
	xznaaxFnEG+XAew3WIa8LiCTIXF5wKPjd3/cF4CAjiRU+4cKdEsCC0DvmaHmQc5S
	25GAMJOoCx+RhlAAknYGOGk39tEg1BMJPCCJA3sq7rQpKRf5Wsj1BkcFPkpQTI7a
	1lYROLTxnr9k8UFyggCgzWS2jFf8JvqZM0/kNsJkLD8Jfm4kabZqjysCkzR4itAw
	FQ0yHiQCbpb/Kxla+VENdjzXUngT8YZng5k+T6DZDEsZQwXQ9E+SdI/qU9B1OH6m
	X9qF44+Pw47t9BZkTWxENiCeNENHulg4fNqs6YgCfDHTYQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y3ubas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:23:07 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5752c4a82ebso10297695e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 08:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779981786; x=1780586586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PEDqP6PRnD4f3w0pOYnhKn4rOzVoretJwgoZHP7f+y8=;
        b=VEPZkngJtA9HnEPXmE4h589IlkRTQxecX32IeZwkHr2is8Pj+JSZXhR9eJTzx87rgu
         w9NH0RLBKK/T3pvgrXaONkJ4+Ka28/1oPWkGzmWnaITs60Fyaml6qchclLTT/ivbiggB
         wclfrhNtYg4OHBFNDXmn5X3kvh7MrqPDSqWOUxcY50ZzjfCNMPI0wqb0s+IyKgaPrItd
         0LQdjs/z/eGkX4rJTPvWFDWdLU+3pfDuLYylpwnGEU2paCr6to26eaoR5qdho0xuxX+W
         3gTeH1ZR9RQFyg0K7NG4rZ/64f/9pbfiRqeEtcpHk2dm+PvZ9W9D54Pukd0zpMSHMVWe
         UgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779981786; x=1780586586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PEDqP6PRnD4f3w0pOYnhKn4rOzVoretJwgoZHP7f+y8=;
        b=JXuonkqnRHJM5MHv6sUab08T2DPevzT35XSqmrx13UGYXZ8TjPOqBWCVKY7g38BKXF
         +69JjjK1vxMegwu74kuA5Ie3b+qkC7tRvb8YuLlfPPZ+Ird4FoZc59UBlGDil/zYKq8E
         b/aNO9EiULOvulV21B6TChS9Nptk9Sgc6TK+kF7B8qBK0cmTH9AgoKqDap82zfiMjbTr
         miPOu9n/QMHqDu0SMAsxR5T5B9H7OHooADVsViR3NmS2diPB0YIIvcNl20uvC1Fr/A+6
         Xpl455ldIefZz2RM5hcIhF7XMB3cDyrMLbfatzPk+ZKTiSkaowZwDvCZUzP+HBQ7dMY5
         z1Bw==
X-Forwarded-Encrypted: i=1; AFNElJ+3Achq/xORS/Hn62YEJmsn3D4jL5018pYCiK4cOUuW/QJ8riVtEvXlLqiGEX/gLPpYGPsUkXtZM9xHzu3H@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0vMglxORiqRO9lDCJ9gtthpjRRD1sle4O6jwRJC5Ji3XTNLgP
	XJuVfpVx7eOwr83Fc9x4rsbQz7KvPbz0KxjcIvvVWgzRkqmQ2KDGmPt+wQJxJOfEVHL7NcAMOh6
	YMW8XJCnHwhv4ZefBMV/JnVX4j9iUDnNcs88TxMAvbZGDF6XjF293YYVONG/0CfJ2Qfky
X-Gm-Gg: Acq92OFXSMW3t0A02EzY1+LnxQXsjCyiOY670596j+7WgFZ6QPXYBYWpRF0ppQpEu5U
	kqJiSEAQgV8ZnmY5++tTaPXO/tB4z7a/tR+VG/ltWrT9TpqA+6rVCJwar3GHLRraYl+Npkb7AI4
	jMiEIglPpE2CvmoHD6vigafP8TjJp8YckuGeDsMjNlDJwCLrRnR6+UN3rWpDc4fs0OE3HqqdUPW
	lf60tyjsHmvMuQzjDqDiuOnYOBv11TJKCPG2nkPylnns0MuEJZDJX9qmoLWmyQ7QlOI6jz8VKKw
	XLKgIwU1X/2l0w8iFPUM3A8ERgWUMxlR2N41GXJHLSViXVUbEQ7+DngzHvORsYLjwnopGdXbW0B
	KwvRddBla3nyfk/eq0WA/viFzUjBJsYvTFtwO5CwIsfV/38SLRd3QKh1xbr/3nwNQRH2IXQospn
	Zft2x8yjVLUKalNFM2OtQ/hif4V3WdBF1NBN+lUc78KFYA8Q==
X-Received: by 2002:a05:6122:1ac9:b0:56c:da22:6921 with SMTP id 71dfb90a1353d-5865f621e09mr15146676e0c.5.1779981786408;
        Thu, 28 May 2026 08:23:06 -0700 (PDT)
X-Received: by 2002:a05:6122:1ac9:b0:56c:da22:6921 with SMTP id 71dfb90a1353d-5865f621e09mr15145915e0c.5.1779981777570;
        Thu, 28 May 2026 08:22:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4634d472sm2009767e87.77.2026.05.28.08.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:22:56 -0700 (PDT)
Date: Thu, 28 May 2026 18:22:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/15] drm/msm/dp: split msm_dp_ctrl_config_ctrl()
 into link parts and stream parts
Message-ID: <nop7uyplq643ps4naczmrqhukeiuvfxllutmaz2sbohrnxk6ko@pr7emfe5panj>
References: <20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com>
 <20260528-dp_mstclean-v5-4-a9221c1f1f3b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-dp_mstclean-v5-4-a9221c1f1f3b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ijELyBXA4Ysyr2IHK3kRHNL6RufNGcgN
X-Authority-Analysis: v=2.4 cv=JMYLdcKb c=1 sm=1 tr=0 ts=6a185ddb cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=NxVLH6Ql9juLhvLULPkA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: ijELyBXA4Ysyr2IHK3kRHNL6RufNGcgN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE1NSBTYWx0ZWRfXzY7NWmnKuysI
 aDp2yLAvF73xZ4xzNJ4A42yly4+W5Woe6bRcZ66KhQQNeew4VnsEyxtwpayH0TTZFBBvyJ5juis
 Dv3tdJtipxydqbfF3eWMM84pGRxoKBxiRHQ99URZWTyFJC+910WvEU74Dk1eO/JG2/HeHuTRYUk
 fiSHHwK/98Lt/9V01YAkvfeukWSdlbqwEjoZJnVNsGxoZF8xdrpa8dg5mu/Xc6AvljIwyatYUOs
 biTI9Tmmj1aSMHGqUTentJ6W9njdwwznvMcottNhFKGAZpahPnlD0UV99FKnBhqGB21jl6lNK5L
 YEWtKdJVbaCB7Dw0pXoTAF3FQKxcBoGNuJvLQrat0hr26gFtiuyEJAHOg7wWuDPTxmSIWIlgiNe
 i7CDRK3UB8lrvxYt2oaECqpGKwhM3ut+Y1i4LKbDqn8ofKn9J1zJSD++BCivvhENSVq3tCKqCpu
 s+7AcwzTRcB4sW/CmeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280155
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110144-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 87F355F478C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 06:40:25PM +0800, Yongxing Mou wrote:
> The DP_CONFIGURATION_CTRL register contains both link-level and
> stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
> all of them together. Separate the configuration into link parts and
> stream parts to support MST.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 47 +++++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 86ef8c89ad44..cc00e8d2d6c7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -388,26 +388,45 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
>  	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
>  }
>  
> -static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
> +static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
> +					    struct msm_dp_panel *msm_dp_panel)
>  {
>  	u32 config = 0, tbd;
> +
> +	/*
> +	 * RMW: in SST, config_ctrl_link and config_ctrl_streams are called
> +	 * sequentially on the same thread. In MST, caller holds mst_lock.

There is neither MST nor mst_lock. Also being called on the same thread
means nothing, there can be another thread, executing the same code
concurretly. Please point out that they are called only from the
atomic_enable() callback, which is guarantted to be executed once at a
time.

> +	 */
> +	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);

-- 
With best wishes
Dmitry

