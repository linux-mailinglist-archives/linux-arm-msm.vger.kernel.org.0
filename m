Return-Path: <linux-arm-msm+bounces-102992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI0xHm0z3Wl9agkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:18:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 767223F1E72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 20:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 47B4D300BEBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 18:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE89333F5A6;
	Mon, 13 Apr 2026 18:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqM8U2Ih";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BmUIzFCP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CFD33D4F8
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776104295; cv=none; b=bVxy9KCnUvBnYmAGTEcBML6QF5BEpJLm8Eye8AjvlaPMmzner9ihzHzadszBajKK6bY/Qt70xVVvTfLA39x+KTqrc41ObPkzg1L8zqx1X33ydxNIGUtBNg6SQtLMVyePhGjn2HbsNQQFodGu3Q/ABjeonT7ged6YUBwO9cgbIzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776104295; c=relaxed/simple;
	bh=iYM55YD/7sYZCNVWLnFbzI/iyGYn/jF+T/FGXDB1+9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+h+/HxG3K/z+Xm2HZBqZe46l6vLxRfzX4bQYf4P2U7nYBXc1q8vE6l9DJ0hMzGfMpoOxmlV6mNy/QmjEKa0g53Sl6BHcTXTVuG9RUdAb2eTNBRcMMoVYfXmEmYXSNTh5Ca503hW99GlF+7Gy7P2Uh2ZCBiNIQ1P21vu3oVL7x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqM8U2Ih; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BmUIzFCP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DH8Qrj2231040
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=12XNat6g+cc/zIEfoBGBX//L
	TYgOYu/rE8OpssDOmfE=; b=VqM8U2IhfULeH5BJ6dCm3pLntcvpyiM73qIS6SVx
	oZmOYURgSAaeAeCUYSCTh5YsTe04/NklpiW58RHSTCzTSZgKa80PKvmAysuK9Zbg
	+v7MgjRC9PkR1d/lQJUlxaZ8xC3+ptW0melopkf8/a7K0UozeaEHLc5tED3eHYr0
	wCQSjuWGVxwYMPTxBWnZEavafnSULeJOZGnnMqdyEBs6ONbhHTiD+HaBetzcJtn8
	x9B36+DpsktHyIt/6AHFmRJr6rZySzfsWgllm8EOZWHQ4J2F6/eaWJHH6e1IDMXU
	F/ojMPh0FjgDTSl1PX4BU2rQ5TwRX3Vx4VWBiHqQEx3wGw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dgxt61qur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 18:18:13 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60ff08dfb37so463035137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 11:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776104293; x=1776709093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=12XNat6g+cc/zIEfoBGBX//LTYgOYu/rE8OpssDOmfE=;
        b=BmUIzFCPUjaLVXXPo8vbj24r/DpQQIfrFhfrTwb4qdQvVXpmHvRieP92zrJVJy8gJ4
         xCUVzYDFGP6aFme4ScWBXhLlRKqVkqN/zle9yJ1QoRl9nnXbvhYnH/uqqfIbCGURflF/
         MSDH9GEvyal3xpGt7EQ+pH/z9HDubb2J4sWnz7U6Cdq+TkAxvw8LvYR3VEFPi49zXF3v
         xwt+xUzMKGbDriNF5JOXuITeXSXzerSww1ax+gv2Ti4Xe9rknORo+XetAW2Sxmw9/S4H
         kSbdreJhOqjefMYL1LQ8CRqHPmMxlFx9/lDY7W10VVpHTFK3Njh5Wr48w5vgOYBdXbHt
         OWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776104293; x=1776709093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12XNat6g+cc/zIEfoBGBX//LTYgOYu/rE8OpssDOmfE=;
        b=Ldoa4yYxXnFabhV8XCnm//WuRUbzlIWR9tIty2wgxp06Oe0pL8/xZUh8TJI9hFLWBw
         dQGU9hzhHm/T/jaPKe6Q1r5bZzpysjljKCe7XrEkH6ieZNzI5sA3Smb3Fcx5k38/RFdZ
         6Q+e50GPiYQiezvgGGKk2BvOpOGm0mU/CkSE4gTMJlYAHnTiKowvZhanPZaZZyFlsrEt
         tNsaF5WSk7rtccoX/S5vKzZVfewiEBNr9avnpZbJNN1CB67+iNnC7BsK1otWv2KxxUAZ
         fheVwld8XOxkxpkCnvf0BAdvG7feHxnPIuUtAv97Zu3VaeZaklFROhKJ95IBf4Vjyl74
         D5mg==
X-Forwarded-Encrypted: i=1; AFNElJ+imAWN5m2qcVQoS1gmVh20kubAV8E24pv7ONgiU7yVF33DHzggELzTXVw/qTk8GnDJg21s0v9ynsc/vKkj@vger.kernel.org
X-Gm-Message-State: AOJu0YzivH5MSI0XxOc189ZJhsyBAsJAdzDTej4DhHL1OZr8+d+81HpS
	wH1qC4ahQp9RTD7iDIY/I2T/KOeSvVzKW6nAXqyokzMh14jonJem6+g06iM1XmbrbCYkgMMMAQy
	HXWWERjG6slb4rjC+5iLx1jBXX4xtrE1E3L8y9q10lqDoskhuiht/NEmJnyoOaqhCYoxH
X-Gm-Gg: AeBDietHsZCzRiZhyA3AM471Vb34l1Pe8qwh5UWpa2MR3JkKOa2x2/MUwJ5pBqddVGx
	ljS8hTVRFHk+w3K9s/kqJ/rZOL15eISUhk7o8qLSArpoeaLtMbkAZ2cUL4MysCXaTk8gXnw9C0c
	RtUDS3I0YgxoOHCAtini0JIUqZGF9TK+1SRXHYcfwbLtUEyX/CEcPdTczUFn08MEZzteb8ATuPB
	uV9OofbQD37khI6mEYizj8Y3Kl0aGDTgVvioehDunGve5aohkh9qpCtvPjE6inrCbZpLf4jR/iG
	bykGiw2O4b1apNun89lqcQSGaqZLyfIfMH1xmJW7ty7CNgZxr/31LzmeHSIXDLv25eXDrZjk9PQ
	Hp/F56TovVaLsh6NFwhYl5N0yqL0iQX1Q+9aCuQp3CND9w028Mt0bLY/G03Maj31gEn1Qg8KbA2
	UmfBHQSsntIdaw50qBh6lExK82FpdJK9AF5cOj2sXmjcId4g==
X-Received: by 2002:a05:6102:c02:b0:605:5756:a515 with SMTP id ada2fe7eead31-60a0062cd7fmr5486866137.16.1776104292649;
        Mon, 13 Apr 2026 11:18:12 -0700 (PDT)
X-Received: by 2002:a05:6102:c02:b0:605:5756:a515 with SMTP id ada2fe7eead31-60a0062cd7fmr5486820137.16.1776104292046;
        Mon, 13 Apr 2026 11:18:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49298bbbsm25262411fa.10.2026.04.13.11.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:18:10 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:18:09 +0300
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
Subject: Re: [PATCH 06/10] drm/bridge: lt9611: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <ojinrxfmkxrakyczzkjx7wvx3je34t6emnr5ux6qbl47vyuzyt@3dbq3llvysei>
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com>
 <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-6-acd01cd79a1f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-6-acd01cd79a1f@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE4MCBTYWx0ZWRfX1QcbYUT5RKYy
 ofrYAFk9QX5zp3MX8ydWVJHrGNtvpTdPOWJMlKwpZjW8WK3MyfmeZt51MfTDSwvc/JhS3jfK87B
 C3PtqvGeR4zRi2SdlW81i5Akl1R3cX4pIznpgcjpXu6aIMGR1zQYpqZ+8gs4sNOykxv2ZjxrNWX
 nLlXsHBbjq+fQdIrW3a+kHmDBPZ64Fgd2jGp5zy9ENqzLtLTdIEQLI8pkhDSfEuQouy3ar4Kvpr
 s9ZNd4bHGWTLU9eR1y5gQLmnVGPpCF5JTn93oVsmX6mou1osFRyjLFLXWzrhGi1AWyPt2W4/cpD
 OE4jf1m2jplzCllCsYF4HVrunu4jfj3c5pFEvafR/9bxbQjPca32v85j1+jGa30iZZ5TTq7ZrK+
 rUy1M3mxm6RHS6mXA9R5LSkNXUzCyrSKmAKbgsFjfLEncDY1F9OPx0KG9978MjaGS2Yb0xtVJFN
 FsOEVmGIOHXMNsQGwBg==
X-Proofpoint-ORIG-GUID: S8ozZbcukR8yd42nA1U3LbSrrLhC7goU
X-Authority-Analysis: v=2.4 cv=br58wkai c=1 sm=1 tr=0 ts=69dd3365 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=sqxsbOWVCbAVHG9YZwUA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: S8ozZbcukR8yd42nA1U3LbSrrLhC7goU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130180
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102992-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,linaro.org,hisilicon.com,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,bootlin.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 767223F1E72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 03:58:38PM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal. To achieve this, instead of
> adding an explicit drm_bridge_put(), migrate to the bridge::next_bridge
> pointer which is automatically put when the bridge is eventually freed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

