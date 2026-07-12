Return-Path: <linux-arm-msm+bounces-118598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CHryFLnjU2q4fwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 20:58:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0B7745AC7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 20:58:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pPrKTqsr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XnXVMUB2;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118598-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118598-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D5D63003347
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 18:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B86F3B38B9;
	Sun, 12 Jul 2026 18:57:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F9C367F5E
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 18:57:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783882678; cv=none; b=KT+btjfLf9R3TeNFq4C5E4X6ghlsIZ2hMM/+phU+BMjRoas/LQI0baQJzTeDW+QP/sAnyvaJy2ycpB18qlgW0ISPXsVHKmizguO0Ptayd/74W55s3DvK9srG3gd7w21/DBJEB31kV6aMW7HZX91mQ4tTUT15DNM6jC9KfbslVwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783882678; c=relaxed/simple;
	bh=JBIz1Mx5OVANL6gvRZvCR9jt6sOfQH11LgswyP5tnDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hWR1ExYK0sYTCqZBGvFGreUEOWg3hpsIGUAEu5byIaTs5gCAMhbVPrehqG9/9exfQG9S4/x7lJBBuuilGHz4/4i6v25UK3QL8ghbu18dv+z5EAXdEmMgNh95+Dz18ww6Jo5Q25ppiuWFHv9lX1+e4ovUTSg3AJjpBga2rWs8BM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPrKTqsr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XnXVMUB2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CGr34W2968584
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 18:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w6rTuW7m4GbqimJa9S6Rpgye
	cFj0VMXh93x8iIx4JYI=; b=pPrKTqsrto0eWgC17TPNrxCX9XlXoA7lkgEWvbrM
	ccBnvT8WaWRDXylFX60D90/4yi+LBKRm4wqRIkqGD4zQm8iTBGrn+0qd9+QC4QZ+
	ZOa7ieMd7ePYcA6IqVpmrM1XJFT5pPyHrLnaIxApzMuBMQF//oPaHjMCy551nEK+
	wSKPM/8I2g4oRr7oh3WTYhtvvHfMf7Pb2ZWGfx5qzzogWRKT8nyXcMfoOSM1JuRK
	Lbkq8gT2x5h1aSob6l87D7OLT7vXhHquzmGphfMPwhl/2CS5Q3fgNNQZyzf/QghV
	nUJ/RBwYzsskgy0kbaSGE3yoboxjAoL6vuA4QT1JI0WDrw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf4837y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 18:57:54 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5a787be4ee9so3541311e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783882673; x=1784487473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w6rTuW7m4GbqimJa9S6RpgyecFj0VMXh93x8iIx4JYI=;
        b=XnXVMUB2MzuJuDJAyPCzPrBAxvjlc0mao8ozXqwAeWmF5lwSki+73ja8gSI5jD7KoZ
         Udi47APHu9JLBemTxZaZWUjCIUA8A7Ryq/mqZk6iZpc9/P3rkoXQ0ndtfRgf/5zh5nQE
         OgF2h1PtNVwlGRaHVKcCJ+oQ3mv/V6C/6izqMP9Agat943yS1FcGfucGL+E7Jn6mGWjj
         RoTQhSysgB3KVs2N7MQXFDVviv/vxTRf5gUyuOUwsqzEExpyvTnHiVXCCeZtHDhRFMox
         UmmbaEq5DBqzQ4k6nPXShZyb4gc8CwRo4eIuQP3HCaCt0nw7PFEEozEbijrAIrP7WLfe
         HgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783882673; x=1784487473;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6rTuW7m4GbqimJa9S6RpgyecFj0VMXh93x8iIx4JYI=;
        b=kJuBJBHrna0Si1LgevsgAG5Sa+Hh9xPPxk0Jb0V1CCa6KP/aqVDqadszIN1a5PAVzM
         BPhKMSPvKBBYPhorLocaZlQ16nIwOTET6Wmflx2Y4Gp8f6GaGKBHlfNZw0ZM+J/AJ3SV
         80q+gxpy2AXR5psykHukpBgaT33CBgZNVWlOj3jv8ulJP7nnYFVxfnHmm3i1ld64ByDm
         MqDnjOlBdPWt3dmPlPrDY59VlJb7WygEpWHCQT9oKPUWdrjwt/vfmDpZ8A0A8eSCbh+j
         NDP2fi6leE69C7B+1e/85p5eFU1sdnz1++/atvAX9dCYshJCy9+1B3i9uZGCuqDHxnn4
         IPfQ==
X-Forwarded-Encrypted: i=1; AHgh+RoDESm2dmreP1tSbutEt1hnNdGA0N/3JZFbLeRZRMiGmsnOk/UzMwzyPff/u3rjGfOS3BgmM49iw30f9mo7@vger.kernel.org
X-Gm-Message-State: AOJu0YwB/s3KinafbsuSimPyUm3OkkXOQV47D61c5xWRuhNCYGt3iaPA
	TP9vAhUsYtMaOBySV3uWyoTGo09BF3EHCdLsQMGJPvZB1BPTCA9GmWg1TPlPjQtnbRDSVZwW6kl
	I0qotxxNDEUgxnmopj7X3+mRKsYmHUkx1IuvvSqtO6znGWzyh1Slw5yVwimzg05EbP+IH
X-Gm-Gg: AfdE7ck53RYVWeOmdwWy0owZNWGleZYG31RZCXWKuCQ7culbanquk0AWIisGhO3WVKf
	WmYbEsYEUSnYgA+UuvzZLcN7cwVpJesHa6uhZ3pkp0aofs40RfniXIHnhuDo/TenYkE/9eDXU/O
	1kB3Jl6Ob23pmKsitoXy4CLg7MrBm8HQlRox4OW8leBL/k3iP4J7nNqVp9Ve8vGLacDcX8h9oW5
	kED28lgSHrBxMqHv4sA2LBjY6ExH8l0a1S0dGC+dZaLi1a31h2UqkqdEBIZ4/CFEzLoVQ8/ZKFW
	wt7LJioIbW97x3+PKa7AAv+4/y4QxRXliXXnUscJa27mK7rCvdk4inEyDtUrp2Mo/EfpszqkDWc
	a1JRcWsZ2xeyMGSB04RGEHaNKPrv5E4OjfedJswIdgfxgPjX9lTeW6hT2rEWiQtDmIev6CMsqwf
	0NdmkEtAyI/Xqu0F8BSPQIiVYw
X-Received: by 2002:a05:6122:4f84:b0:5bd:73b5:6d2b with SMTP id 71dfb90a1353d-5bfbf28b0e7mr4018234e0c.8.1783882673304;
        Sun, 12 Jul 2026 11:57:53 -0700 (PDT)
X-Received: by 2002:a05:6122:4f84:b0:5bd:73b5:6d2b with SMTP id 71dfb90a1353d-5bfbf28b0e7mr4018208e0c.8.1783882672762;
        Sun, 12 Jul 2026 11:57:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b9fb1csm20218571fa.34.2026.07.12.11.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:57:51 -0700 (PDT)
Date: Sun, 12 Jul 2026 21:57:48 +0300
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
Subject: Re: [PATCH RESEND v5 08/25] drm/msm/dp: Add support for MST channel
 slot allocation
Message-ID: <3mj5fuv5gdoxjqquyllzk2tzbvyblh77yj2dttki3t64krljfm@cwpua5mtfz2o>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-8-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-mst-v5-8-2ed6aee1867a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDIwNCBTYWx0ZWRfXzaci4UbiN6P/
 f3fDAgPmaoCzKuiH7tio5nyxhbOCgjSHjSe4gCIIvBkzKlAupKpg2qkS4qMlpxkyBKhbHAavUBB
 uhUUDi3oi/vdWef2aNk2HZUm+ycPi8w=
X-Authority-Analysis: v=2.4 cv=OsJ/DS/t c=1 sm=1 tr=0 ts=6a53e3b2 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=ZPAYyj_aMj8Sa1k9G-MA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDIwNCBTYWx0ZWRfX3fGosEdS0CA0
 LVjqdMs4LbAGp2RAl7KOfQpXxCZB29si4h37NnySi8WAN23p0ICAwIfCfSMPk2rN6lyo3k9CaxM
 PZBZJfsyZ+IHmLsI89ku6GTm5211XykeaS1B3wvSd+69OYckcKi0BZarts321I7mNKcomTCZyLE
 fN8NPjMCI++skyF0Oh07ZWmhoJc5qZlbu0jj73exGiEAxCL2rAPBYC1pA4Zafi77BGbl2BIUY7G
 Zxwpz/mhNnx2liCtX5PRx29E/fbC3QZsuyB0K9LEC7hE0YwkAD8SDCbjoyyw0C50gc4tDNPYi6z
 f+yT6tn86jhSotL3596+FpeX+s6X3fMFvjHr7QAe1HdeEfzXexB0GXz5tB2TyCcRnwzWkJvrbJB
 qqvvIwfLrleybgxqIKJjna2U0P+wPgT6ejAp9CcG+IMyLpiDPvgDIjnwwjxRb3qejUevAGlRYov
 Cdxx4Sw6lf7MZuZ9WMg==
X-Proofpoint-GUID: ryPMMSUEsVTdToZEICim46JVhj7PuQtN
X-Proofpoint-ORIG-GUID: ryPMMSUEsVTdToZEICim46JVhj7PuQtN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120204
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118598-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF0B7745AC7

On Mon, Jun 29, 2026 at 10:14:29PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> DP MST streams share 64 MTP slots in a time-multiplexed manner. Add
> support for calculating the rate governor, slot allocation, and slot
> reservation in the DP controller.
> 
> Each MST stream can reserve its slots by calling
> msm_dp_display_set_stream_info() from its bridge callbacks.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 192 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +
>  drivers/gpu/drm/msm/dp/dp_display.c |  17 ++++
>  drivers/gpu/drm/msm/dp/dp_display.h |   2 +
>  drivers/gpu/drm/msm/dp/dp_panel.c   |   6 ++
>  drivers/gpu/drm/msm/dp/dp_panel.h   |   1 +
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  10 ++
>  7 files changed, 232 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 5b5149b160df..15df82a0caca 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -73,6 +73,7 @@
>  #define MR_LINK_PRBS7 0x100
>  #define MR_LINK_CUSTOM80 0x200
>  #define MR_LINK_TRAINING4  0x40
> +#define DP_MAX_TIME_SLOTS 64
>  
>  enum {
>  	DP_TRAINING_NONE,
> @@ -109,6 +110,11 @@ struct msm_dp_vc_tu_mapping_table {
>  	u8 tu_size_minus1;
>  };
>  
> +struct msm_dp_mst_ch_slot_info {
> +	u32 start_slot;
> +	u32 tot_slots;
> +};
> +
>  struct msm_dp_ctrl_private {
>  	struct msm_dp_ctrl msm_dp_ctrl;
>  	struct drm_device *drm_dev;
> @@ -143,6 +149,8 @@ struct msm_dp_ctrl_private {
>  	bool link_clks_on;
>  	bool stream_clks_on[DP_STREAM_MAX];
>  	bool mst_active;
> +
> +	struct msm_dp_mst_ch_slot_info mst_ch_info[DP_STREAM_MAX];
>  };
>  
>  static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
> @@ -289,6 +297,44 @@ static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable
>  	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>  }
>  
> +static void msm_dp_ctrl_mst_channel_alloc(struct msm_dp_ctrl_private *ctrl,
> +					  enum msm_dp_stream_id stream_id, u32 ch_start_slot,
> +					  u32 tot_slot_cnt)
> +{
> +	u32 slot_reg_1 = 0, slot_reg_2 = 0;
> +
> +	if (ch_start_slot > DP_MAX_TIME_SLOTS ||
> +	    (ch_start_slot + tot_slot_cnt > DP_MAX_TIME_SLOTS)) {
> +		DRM_ERROR("invalid slots start %d, tot %d\n",
> +			  ch_start_slot, tot_slot_cnt);

Is this an actually possible error or is it defensive coding?

> +		return;
> +	}
> +
> +	drm_dbg_dp(ctrl->drm_dev, "stream_id %d, start_slot %d, tot_slot %d\n",
> +		   stream_id, ch_start_slot, tot_slot_cnt);
> +
> +	if (ch_start_slot && tot_slot_cnt) {
> +		u64 mask = GENMASK_ULL(ch_start_slot + tot_slot_cnt - 2, ch_start_slot - 1);
> +
> +		slot_reg_1 = mask & 0xFFFFFFFF;
> +		slot_reg_2 = (mask >> 32) & 0xFFFFFFFF;
> +	}
> +
> +	msm_dp_write_stream_link(ctrl, stream_id, REG_DP_DP0_TIMESLOT_1_32, slot_reg_1);
> +	msm_dp_write_stream_link(ctrl, stream_id, REG_DP_DP0_TIMESLOT_33_63, slot_reg_2);
> +}
> +
> +static void msm_dp_ctrl_update_rg(struct msm_dp_ctrl_private *ctrl,
> +				  enum msm_dp_stream_id stream_id, u32 x_int, u32 y_frac_enum)
> +{
> +	u32 rg = y_frac_enum | (x_int << 16);
> +
> +	drm_dbg_dp(ctrl->drm_dev, "stream_id: %d x_int:%d y_frac_enum:%d rg:%d\n",
> +		   stream_id, x_int, y_frac_enum, rg);
> +
> +	msm_dp_write_stream_link(ctrl, stream_id, REG_DP_DP0_RG, rg);
> +}
> +
>  /*
>   * NOTE: resetting DP controller will also clear any pending HPD related interrupts
>   */
> @@ -2619,6 +2665,117 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>  	msm_dp_write_stream_link(ctrl, panel->stream_id, REG_DP_SOFTWARE_NVID, nvid);
>  }
>  
> +/*
> + * Calculate MST Rate Governor parameters x_int and y_frac_enum (HPG 3.8.1.2).

HPG links are pretty useless.

> + *
> + * The RG paces symbol delivery per MTP via: M = x_int + y_frac_enum/256
> + * where M is the target symbol count per MTP across all lanes.
> + *
> + * min_slot_cnt = (pclk * bpp/8) / (lclk * lanes) * 64   -- slots at 1.0x BW
> + * max_slot_cnt = pbn * 54 / (lclk * lanes)               -- slots at PBN limit
> + * raw_target_sc = (min + max) / 2                        -- midpoint (~1.003x)
> + *
> + * Quantize raw_target_sc to 1/(256*lanes) steps, then:
> + *   M           = Chosen_TARGET_Slot_Count * lanes
> + *   x_int       = INT(M)
> + *   y_frac_enum = CEIL(256 * MOD(M, 1))
> + */
> +static void msm_dp_ctrl_mst_calculate_rg(struct msm_dp_ctrl_private *ctrl,
> +					 struct msm_dp_panel *panel,
> +					 u32 *p_x_int, u32 *p_y_frac_enum)
> +{
> +	u64 min_slot_cnt, max_slot_cnt;
> +	u64 raw_target_sc, target_sc_fixp;
> +	u64 ts_denom, ts_enum, ts_int;
> +	u64 pclk = panel->msm_dp_mode.drm_mode.clock;
> +	u64 lclk = 0;
> +	u64 lanes = ctrl->link->link_params.num_lanes;
> +	u64 bpp = panel->msm_dp_mode.bpp;
> +	u64 pbn = panel->pbn;
> +	u64 numerator, denominator, temp, temp1, temp2;
> +	u32 x_int = 0, y_frac_enum = 0;
> +	u64 target_strm_sym, ts_int_fixp, ts_frac_fixp, y_frac_enum_fixp;
> +
> +	lclk = ctrl->link->link_params.rate;
> +
> +	/* min_slot_cnt */
> +	numerator = pclk * bpp * 64 * 1000;
> +	denominator = lclk * lanes * 8 * 1000;
> +	min_slot_cnt = drm_fixp_from_fraction(numerator, denominator);
> +
> +	/* max_slot_cnt */
> +	numerator = pbn * 54 * 1000;
> +	denominator = lclk * lanes;
> +	max_slot_cnt = drm_fixp_from_fraction(numerator, denominator);
> +
> +	/* raw_target_sc */
> +	numerator = max_slot_cnt + min_slot_cnt;
> +	denominator = drm_fixp_from_fraction(2, 1);
> +	raw_target_sc = drm_fixp_div(numerator, denominator);
> +
> +	/* target_sc */
> +	temp = drm_fixp_from_fraction(256 * lanes, 1);
> +	numerator = drm_fixp_mul(raw_target_sc, temp);
> +	denominator = drm_fixp_from_fraction(256 * lanes, 1);
> +	target_sc_fixp = drm_fixp_div(numerator, denominator);
> +
> +	ts_enum = 256 * lanes;
> +	ts_denom = drm_fixp_from_fraction(256 * lanes, 1);
> +	ts_int = drm_fixp2int(target_sc_fixp);
> +
> +	temp = drm_fixp2int_ceil(raw_target_sc);
> +	if (temp != ts_int) {
> +		temp = drm_fixp_from_fraction(ts_int, 1);
> +		temp1 = raw_target_sc - temp;
> +		temp2 = drm_fixp_mul(temp1, ts_denom);
> +		ts_enum = drm_fixp2int(temp2);
> +	}
> +
> +	/* target_strm_sym */
> +	ts_int_fixp = drm_fixp_from_fraction(ts_int, 1);
> +	ts_frac_fixp = drm_fixp_from_fraction(ts_enum, drm_fixp2int(ts_denom));
> +	temp = ts_int_fixp + ts_frac_fixp;
> +	temp1 = drm_fixp_from_fraction(lanes, 1);
> +	target_strm_sym = drm_fixp_mul(temp, temp1);
> +
> +	/* x_int */
> +	x_int = drm_fixp2int(target_strm_sym);
> +
> +	/* y_enum_frac */
> +	temp = drm_fixp_from_fraction(x_int, 1);
> +	temp1 = target_strm_sym - temp;
> +	temp2 = drm_fixp_from_fraction(256, 1);
> +	y_frac_enum_fixp = drm_fixp_mul(temp1, temp2);
> +
> +	temp1 = drm_fixp2int(y_frac_enum_fixp);
> +	temp2 = drm_fixp2int_ceil(y_frac_enum_fixp);
> +
> +	y_frac_enum = (u32)((temp1 == temp2) ? temp1 : temp1 + 1);
> +
> +	*p_x_int = x_int;
> +	*p_y_frac_enum = y_frac_enum;
> +
> +	drm_dbg_dp(ctrl->drm_dev, "MST lane_cnt:%llu, rate:%llu x_int:%d, y_frac:%d\n",
> +		   lanes, lclk, x_int, y_frac_enum);
> +}
> +
> +static void msm_dp_ctrl_mst_stream_setup(struct msm_dp_ctrl_private *ctrl,
> +					 struct msm_dp_panel *panel)
> +{
> +	u32 x_int, y_frac_enum;
> +
> +	if (!ctrl->mst_active)
> +		return;
> +
> +	drm_dbg_dp(ctrl->drm_dev, "MST stream channel allocation\n");
> +
> +	msm_dp_ctrl_mst_stream_channel_slot_setup(&ctrl->msm_dp_ctrl);
> +
> +	msm_dp_ctrl_mst_calculate_rg(ctrl, panel, &x_int, &y_frac_enum);
> +
> +	msm_dp_ctrl_update_rg(ctrl, panel->stream_id, x_int, y_frac_enum);
> +}
> +
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
>  				  struct msm_dp_panel *panel,
>  				  bool force_link_train)
> @@ -2708,6 +2865,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  	if (!ctrl->mst_active)
>  		msm_dp_ctrl_setup_tr_unit(ctrl, panel);
>  
> +	msm_dp_ctrl_mst_stream_setup(ctrl, panel);
> +
>  	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>  
>  	ret = msm_dp_ctrl_mst_send_act(msm_dp_ctrl, panel);
> @@ -2760,6 +2919,39 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
>  	phy_power_off(phy);
>  }
>  
> +void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
> +				      enum msm_dp_stream_id stream_id,
> +				      u32 start_slot, u32 tot_slots)
> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +
> +	if (!msm_dp_ctrl || stream_id >= DP_STREAM_MAX) {
> +		DRM_ERROR("invalid input\n");
> +		return;
> +	}
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	ctrl->mst_ch_info[stream_id].start_slot = start_slot;
> +	ctrl->mst_ch_info[stream_id].tot_slots = tot_slots;
> +}
> +
> +void msm_dp_ctrl_mst_stream_channel_slot_setup(struct msm_dp_ctrl *msm_dp_ctrl)
> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +	int i;
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	if (!ctrl->mst_active)
> +		return;
> +
> +	for (i = DP_STREAM_0; i < ctrl->num_pixel_clks; i++) {
> +		msm_dp_ctrl_mst_channel_alloc(ctrl, i, ctrl->mst_ch_info[i].start_slot,
> +					      ctrl->mst_ch_info[i].tot_slots);
> +	}
> +}
> +
>  irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
>  			    struct msm_dp_panel *panel)
>  {
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 6de028da85fb..e1d10ae20f70 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -61,4 +61,8 @@ void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
>  int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
>  int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
>  			     struct msm_dp_panel *panel);
> +void msm_dp_ctrl_mst_stream_channel_slot_setup(struct msm_dp_ctrl *msm_dp_ctrl);
> +void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
> +				      enum msm_dp_stream_id stream_id,
> +				      u32 start_slot, u32 tot_slots);
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index acb581a8a541..36857d6ed313 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -749,6 +749,20 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
>  	return 0;
>  }
>  
> +int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display, struct msm_dp_panel *panel,
> +				   u32 start_slot, u32 num_slots, u32 pbn)

Why is it a display function rather than a panel or a control one?

> +{
> +	struct msm_dp_display_private *dp;
> +
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	msm_dp_ctrl_set_mst_channel_info(dp->ctrl, panel->stream_id, start_slot, num_slots);
> +
> +	panel->pbn = pbn;
> +
> +	return 0;
> +}
> +
>  /**
>   * msm_dp_bridge_mode_valid - callback to determine if specified mode is valid
>   * @dp: Pointer to dp display structure
> @@ -1489,6 +1503,8 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> +	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0);

Why is it being called in the SST case?

> +
>  	rc = msm_dp_display_enable(dp, dp->panel);
>  	if (rc)
>  		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
> @@ -1509,6 +1525,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  
>  	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
> +	msm_dp_ctrl_mst_stream_channel_slot_setup(msm_dp_display->ctrl);
>  	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
>  }
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index e987de80522c..45e2cc2d6add 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -43,5 +43,7 @@ void msm_dp_display_atomic_enable(struct msm_dp *dp_display);
>  enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
>  					       const struct drm_display_info *info,
>  					       const struct drm_display_mode *mode);
> +int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display, struct msm_dp_panel *panel,
> +				   u32 start_slot, u32 num_slots, u32 pbn);
>  
>  #endif /* _DP_DISPLAY_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index e0c0e8c9178c..ef2ded8ec4ea 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -57,6 +57,12 @@ u32 msm_dp_stream_reg(enum msm_dp_stream_id id, u32 reg)
>  		return is_s1 ? REG_DP1_ACTIVE_HOR_VER : REG_DP_MSTLINK_ACTIVE_HOR_VER;
>  	case REG_DP_MISC1_MISC0:
>  		return is_s1 ? REG_DP1_MISC1_MISC0 : REG_DP_MSTLINK_MISC1_MISC0;
> +	case REG_DP_DP0_TIMESLOT_1_32:
> +		return is_s1 ? REG_DP_DP1_TIMESLOT_1_32 : REG_DP_MSTLINK_TIMESLOT_1_32;
> +	case REG_DP_DP0_TIMESLOT_33_63:
> +		return is_s1 ? REG_DP_DP1_TIMESLOT_33_63 : REG_DP_MSTLINK_TIMESLOT_33_63;
> +	case REG_DP_DP0_RG:
> +		return is_s1 ? REG_DP_DP1_RG : REG_DP_MSTLINK_DP_RG;

Get all registers handled by these functions at once. There is no need
to keep it being patched over and over again.

>  	case MMSS_DP_SDP_CFG:
>  		return is_s1 ? MMSS_DP1_SDP_CFG : MMSS_DP_MSTLINK_SDP_CFG;
>  	case MMSS_DP_SDP_CFG2:
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index dc046fec24fc..3e78af9e430d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -50,6 +50,7 @@ struct msm_dp_panel {
>  	u32 hw_revision;
>  
>  	enum msm_dp_stream_id stream_id;
> +	u32 pbn;
>  
>  	u32 max_bw_code;
>  };
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index deb40ed24654..f2bd96f3bbd0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -338,7 +338,13 @@
>  #define DP_TPG_VIDEO_CONFIG_BPP_8BIT		(0x00000001)
>  #define DP_TPG_VIDEO_CONFIG_RGB			(0x00000004)
>  
> +
> +#define REG_DP_MSTLINK_DP_RG			(0X0000011C)
>  #define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
> +#define REG_DP_DP0_TIMESLOT_1_32		(0x00000404)
> +#define REG_DP_DP0_TIMESLOT_33_63		(0x00000408)
> +#define REG_DP_DP1_TIMESLOT_1_32		(0x0000040C)
> +#define REG_DP_DP1_TIMESLOT_33_63		(0x00000410)
>  #define REG_DP1_SOFTWARE_MVID			(0x00000414)
>  #define REG_DP1_SOFTWARE_NVID			(0x00000418)
>  #define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
> @@ -359,8 +365,12 @@
>  #define MMSS_DP1_SDP_CFG			(0x000004E0)
>  #define MMSS_DP1_SDP_CFG2			(0x000004E4)
>  #define MMSS_DP1_SDP_CFG3			(0x000004E8)
> +#define REG_DP_DP0_RG				(0x000004F8)
> +#define REG_DP_DP1_RG				(0x000004FC)
>  
>  #define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
> +#define REG_DP_MSTLINK_TIMESLOT_1_32		(0x00000038)
> +#define REG_DP_MSTLINK_TIMESLOT_33_63		(0x0000003C)
>  #define REG_MSTLINK_SOFTWARE_MVID		(0x00000040)
>  #define REG_MSTLINK_SOFTWARE_NVID		(0x00000044)
>  #define REG_DP_MSTLINK_TOTAL_HOR_VER		(0x00000048)
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

