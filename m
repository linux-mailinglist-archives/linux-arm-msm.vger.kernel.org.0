Return-Path: <linux-arm-msm+bounces-102976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCfkKH8G3WkZZAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 17:06:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7AC3EDB77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 17:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 625E43093DBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 14:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA9C3AE6E6;
	Mon, 13 Apr 2026 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgwDecpG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NuIrg/am"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3333BB9EB
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776092328; cv=none; b=oEs7DFDrLDljCimlpGgaggKNPeGKco46nNfmO0jkScbeCD5H/My0dKpaZdLva1UQAiWjsRE793J8bQhjK8F3CDOjVNBtY5dSloaWsAM94BPvOna6eCEB+/b+zS+hyMKPHCi6hl+yqe4KPkM8v7ueuqVBRXhEEzYAW7ADWhaGHmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776092328; c=relaxed/simple;
	bh=jpMtUcEtYQbQ3qmYa8+gO3YLICHK+l7Zfpokl2ZRS9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kw3SQjGfmeIJWYxU+ss1Uv8ILikNqjDubcrS6LcCgWnbsmZW3KLpJ0++8cce8ZB4Q879DTj9LPYTVyJYxa94j6FcFZY/POzEDrRwlHEOC5Qh6He8M7dVDV9F7K1vpKT+Ja2T46JK8rJs8dzSZO5VSBjFbNoDPhfUMNDD6sxtgY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgwDecpG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NuIrg/am; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DCZGF93989442
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 14:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=00DJSzTx4OYnNszTMCzO4Ng7
	MXEjLPxiBpeE0uNJD6k=; b=mgwDecpGYk1IEbv5RhvjNBijJN3DKbCFeO9mk0mR
	6xzlx0jWn9lAgIXzn0rwYWUTi1IvjJZxN6AfFsSzLvgXonH1dAclmOsyoUHZG1jT
	KFHWpPF7aGkxofgz9GpLSxtQqmZkGWXfLzIPsaAnuOu+LS0TCR8w6juXFTdQRMIP
	r93NkAOrzu9m9PolKDcdIKcA+/qWJCPSQuGpztJw0woes1OdZL0dQLH0K3BXz2/6
	2bJXcHlF2XWia9JsPoYk+MQOW9XKwW/EXuPxmjnMP2Pa0vKje/IJuSoQmtE9Aggz
	wLJzBC6+bCcgp988cc4NJN9oCe38Wxa0bLaMqAByNOa8VQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh0mfrk3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 14:58:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4987c698so118612241cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 07:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776092324; x=1776697124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=00DJSzTx4OYnNszTMCzO4Ng7MXEjLPxiBpeE0uNJD6k=;
        b=NuIrg/amcRUYQwrKnJvdPJ1SlXToWsCmVMIdat5bF17QWPaZLdOajQ+FCBlGGjYjk8
         J/zKRvcpJs4iXh3CTJv/Jzl4fcm9wDcFBNQ5P8DckkahStvE7KP9jMkdgppfVt1qMOih
         oguWDcCq2CMpLWhZth1RKNt/dWGf4XFkZPquf55FVEyK5Bc2buOzN7CgbJdVwy1XQOl8
         1XITUAPm9Z+lwuEoJHBZ0r5OPgL9Z4VmSkdV4zLOqOkfHXdssW3s4n2byh5+sOLJ2Qty
         tNaq3PKGTsz/+eykJZtOsTfC0rn2xNSeqpAqqfnOmP9kln0ze5O0dWOU2omU2ZfxQ0t+
         Pi3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776092324; x=1776697124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00DJSzTx4OYnNszTMCzO4Ng7MXEjLPxiBpeE0uNJD6k=;
        b=Udh5gkeD6eXPNP/tCXcz79CycU1qwWJGBXYpxDTAmPFT/qWWEAF1DMi9n3bbRJWiHX
         ehjYenKqeOMXnKLurOiihGZsfqH1z3YFcgr6pdlGpRIDZFzB7A0COaD96eGGZT4p/0TB
         YyQu4ZccDHyxWWfjBmxlsNR0Rxm5MR2xE4CWPniDPmro4Fx+a2PoFKpIec71bPYgPfzJ
         qxAfFHNUJEuMh5h5HDYD3hzbI4Orr4O2aK1ruxfkl/BpBKxHxn3dBiYIV5GkuntTm6/p
         5DHGyad4yN2Ue80VyTY4UBZUa01wyqEKxvCIWaOUdkywqQF5Tt9R+zewUr4Na+DgwOs3
         hMCw==
X-Forwarded-Encrypted: i=1; AFNElJ/0o1rxYIGcxN8BgycNTytFDsjfdwpRHsRaJwNiVNDsZ7mHlmtE/C4QIkPKFFOZNpkfIiz6lhrYEvmQ3Wkr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2NoJYySPLjvQ0hdsFgwOsUVD81kfOC0KPsuWqQ6BOsQmz6vRe
	qSkqrahUqBbgA17JLcNIrIdLXFzxjnz28x0afFvqExQ6S7G0TbBFm2gY0a/oWqvbn3In2Zcrb+6
	pm7++xVNFIoLrL8Q3+yrYMu7mQl43pPTCts0rBMWMzFkw+QahQ/hExv4NsoFFtiRIdtg2
X-Gm-Gg: AeBDies5L8HVmTQn0uSdGkEbIyZHuprKbpwJpqvA139HEvjHAShUx5VAwtl3bvZ5PNR
	V4x/gzlcm09MZsdV8yjZAoZLhAT/fhNAe96ew+mjObl9UnIImodch6UOpXk/CMAllrXUbjVdEgt
	u0VzVHUEsTcq0z836HmGV8gDBB/+JCL51ZOWN+vlBHoGcZ5SDDBavkbIJmz0mLj0KJQQYHGgjfO
	IWqDtToEYsSg+Tf9foxmzgZzQ+Jc24d33XM7abSx7efAQYv6Tz/f4BsEqfRy4Dzgt5KLDs/U7VP
	0pQ+3EubnqFe2R0pffFjiW4hhOd8ufzstqLTWP+53I9qMXv3R/u7MU2PskTqqFvnvw/Ecx7bC51
	X3mFio94WFmBMcUgsPwM3YaCo//9VCvp/MRMqJBIjITdkGZXrfTZufP3CcGQtsgFattbnCAfOGJ
	zWgjD6YpVoEgyyTU6AGdG+GmUrprNqcI4PXlw=
X-Received: by 2002:ac8:5955:0:b0:50d:84ce:e339 with SMTP id d75a77b69052e-50dc1acd899mr255338901cf.19.1776092324121;
        Mon, 13 Apr 2026 07:58:44 -0700 (PDT)
X-Received: by 2002:ac8:5955:0:b0:50d:84ce:e339 with SMTP id d75a77b69052e-50dc1acd899mr255338201cf.19.1776092323512;
        Mon, 13 Apr 2026 07:58:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e4956a839sm24467831fa.32.2026.04.13.07.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:58:42 -0700 (PDT)
Date: Mon, 13 Apr 2026 17:58:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/10] drm/bridge: add of_drm_get_bridge_by_endpoint()
Message-ID: <u2awvqh2uoc2acuuvyavwwtuvtiaidhbkkj5a2d2wwph2s7j7g@b4j73kwzblgk>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-1-acd01cd79a1f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-1-acd01cd79a1f@bootlin.com>
X-Proofpoint-GUID: 6vjuu3sJJywfR7aF2mTtRiIZaLhLmesu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE0NyBTYWx0ZWRfX69C4RxTzqGtC
 SYsGjyT//m/t5ArJqxr8YgcycAFxeGbk/f4FsgMBz9wU+aykRN39kvBu01ARBI9hnEeYwPus8fr
 XuEsz3cIWNMenKi62OSBvLCd5KlDKMHCjlrmkS7HBT1T6kSz5sCzhgexrULGUaoUgHSjK5zf/Ab
 ZjaATLBp4JTOI7AAizlzHzgvMd91igS/K3Qx9SQ2uFcL0g3R5140Imw9lyPzAk3PWnnuTZtbdXr
 A0zCmBHnZSS80AduJ5KQsX0CyM3nDHwftaQIoKfSMylxjDgzu2N4yi37kt+a+a0Qk2ZUOE8RwVQ
 ABltcsvNDNPCem7Zo0QPGwX6Tre7R0vxxqv6u5v4PzL5WVTpZn3ggPTiq+MseGHLBoOSFttpdjz
 uBrgqLIZw3UnJ1wnOiUeidjhPzhM2NlICM5lgk6biKBbHr3dcjjsDFb3gUfkeM9lqHLX7AMDqa+
 ZBBc8Oycz9W8aLini1w==
X-Authority-Analysis: v=2.4 cv=cMvQdFeN c=1 sm=1 tr=0 ts=69dd04a4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=P-IC7800AAAA:8
 a=rZHl3HjT5p_iJrZpzTIA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: 6vjuu3sJJywfR7aF2mTtRiIZaLhLmesu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130147
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102976-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,hisilicon.com,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF7AC3EDB77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 03:58:33PM +0200, Luca Ceresoli wrote:
> drm_of_find_panel_or_bridge() is widely used, but many callers pass NULL
> into the @panel or the @bridge arguments, thus making a very partial usage
> of this rather complex function.
> 
> Besides, the bridge returned in @bridge is not refcounted, thus making this
> API unsafe when DRM bridge hotplug will be introduced.
> 
> Solve both issues for the cases of calls to drm_of_find_panel_or_bridge()
> with a NULL @panel pointer by adding a new function that only looks for
> bridges (and is thus much simpler) and increments the refcount of the
> returned bridge.
> 
> The new function is identical to drm_of_find_panel_or_bridge() except it:
> 
>  - handles bridge refcounting: uses of_drm_find_and_get_bridge() instead of
>    of_drm_find_bridge() internally to return a refcounted bridge
>  - is slightly simpler to use: just takes no @panel parameter
>  - has a simpler implementation: it is equal to
>    drm_of_find_panel_or_bridge() after removing the code that becomes dead
>    when @panel == NULL
> 
> Also add this function to drm_bridge.c and not drm_of.c because it returns
> bridges only.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_bridge.h     |  9 +++++++++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index ba80bebb5685..e51990b74417 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1581,6 +1581,52 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>  	return bridge;
>  }
>  EXPORT_SYMBOL(of_drm_find_bridge);
> +
> +/**
> + * of_drm_get_bridge_by_endpoint - return DRM bridge connected to a port/endpoint
> + * @np: device tree node containing output ports
> + * @port: port in the device tree node, or -1 for the first port found
> + * @endpoint: endpoint in the device tree node, or -1 for the first endpoint found
> + * @bridge: pointer to hold returned drm_bridge, must not be NULL
> + *
> + * Given a DT node's port and endpoint number, find the connected node and
> + * return the associated drm_bridge device.
> + *
> + * The refcount of the returned bridge is incremented. Use drm_bridge_put()
> + * when done with it.
> + *
> + * Returns zero (and sets *bridge to a valid bridge pointer) if successful,
> + * or one of the standard error codes (and the value in *bridge is
> + * unspecified) if it fails.

Can we return drm_bridge or error cookie instead?

> + */
> +int of_drm_get_bridge_by_endpoint(const struct device_node *np,
> +				  int port, int endpoint,
> +				  struct drm_bridge **bridge)

Nit: can it be drm_of_get_bridge_by_endpoint?

> +{
> +	if (!bridge)
> +		return -EINVAL;
> +
> +	/*
> +	 * of_graph_get_remote_node() produces a noisy error message if port
> +	 * node isn't found and the absence of the port is a legit case here,
> +	 * so at first we silently check whether graph presents in the
> +	 * device-tree node.
> +	 */
> +	if (!of_graph_is_present(np))
> +		return -ENODEV;
> +
> +	struct device_node *remote __free(device_node) =
> +		of_graph_get_remote_node(np, port, endpoint);
> +	if (!remote)
> +		return -ENODEV;
> +
> +	*bridge = of_drm_find_and_get_bridge(remote);
> +	if (*bridge)
> +		return 0;
> +
> +	return -EPROBE_DEFER;
> +}
> +EXPORT_SYMBOL_GPL(of_drm_get_bridge_by_endpoint);
>  #endif
>  

-- 
With best wishes
Dmitry

