Return-Path: <linux-arm-msm+bounces-104968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JqmMKii8GlAWgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:06:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A5A484865
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BFAC93136EBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221CC3B2FD6;
	Tue, 28 Apr 2026 11:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zzdt1xeZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3os9y6I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883DC3B27CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777375848; cv=none; b=Idc9t3LUfkvggQ9cGGK2uBnh3PUWEh3V8C6ZH5Jj8bHp4c0zS690N5glCZl4dUwDr6TBIKvsmpA6+u01jUW1StxEZd4KrMFLi7QEeBBIgssXH5+KJ1QmnpiVprK1wNOPprY14i+p9a5Vpt94W4Bt8amRAv+b3v4zpYtW9jrWZ6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777375848; c=relaxed/simple;
	bh=dewODiL3Edjm3hIIWXqWXgD7nasanDO1IZxobYYCiFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jAc+AqRaLE6wnqwFnan9QnpnyrWAkLtkfyR3yWbI5ISRziFW63K27DatHoCemLQao/iQXqReE4CoLLXcHcJbhT/i14k/Q6cUO8fEiUwGUpS+TbpHq2lS/cvAv+jHj4Mm6OVNOO1DHQ4ekl2g4QgqEz3YVh+Cedx0Hl/6rtj2mTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zzdt1xeZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3os9y6I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SA1ncN1329581
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kLXO0lfyU+XcYQwDhmvBELIf
	QT2ztbA8E5R4omjgiCQ=; b=Zzdt1xeZzWtTlz491A/UL2+x38bbtZYoavONT5xa
	Ywrxd4JDyGvzPXJTjKL8+Xsg3hvRObybKlx9+DElkHUBrn0C82dNfOr1vmCMxYww
	P2dEItfHO6m4owRRo9L3XadgneWcHyzk+LWR3QVwyu1F2La+15RtC4gRm+E0PVO9
	q09VnWcBROAPQbD3Idv99WNTQi1alkVaGcvSfqxK2Sr2EYISlqspNDVqhMAKns1X
	XTpuoIR68xVlap6s3wD4GY9Rd6iKIpZWApA4QpiCq3TAkrE3A37g2VFIj5CLW9vJ
	Bz9wUU+qZNXM+V3JUWvhaOxk9X6KrK9klaHNbTDg0kXmYA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtnhahkw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:30:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-605664a1046so6723301137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 04:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777375845; x=1777980645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kLXO0lfyU+XcYQwDhmvBELIfQT2ztbA8E5R4omjgiCQ=;
        b=O3os9y6IZ0WAUoI7plWivQluLYZGhYorwucGXD2WcnINpFgOVDlRSw9xw7g8/4riOP
         d3EZxQc3wb0aZDT2+Oo37mU1xWNktlLHolocKVR7cHv/ehjAu75srau+5r00DsRdc0pb
         SKFFcQjA1sLJx4oOubVbXMDKEcCJazkcbWXkVgh9fKCJ6oGsidYEy6NVl8yakawKu+rk
         Fxvy3zxZX5vGKIhq4aTGj8j8IAqnIcj5mFy2Pgjmdf2MOZvigFffULiLiGU7Di9VAT7i
         W7COBaO1+UGsoEE7W4C1C6hhUonUZ98/8xmEM+nHQSdUW1ASs1xaS4qZECEJwPxZD6Z1
         uZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375845; x=1777980645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLXO0lfyU+XcYQwDhmvBELIfQT2ztbA8E5R4omjgiCQ=;
        b=L8/snydPkzFlJ+ztfeHy4SHDMvv1AeEGE2Gvtn2jAaDYHjvs2Y7BTy8bcLZCQvCAXf
         xEYtM5H44Waad5rIKcIntbmw2hq0m9XouWdvrLcpFKnagILujHMsBL5CLLBmrUPI0Mvz
         znJDgtPFezqgPRgYIj4eB0xjp1wtmtmEVqOSQRLLTJSvL8wQimpGvYLut+VJBls8p1UR
         qA2KLL593JHfLJSaFttzpVQOtz8M9Dn6tjqmUdHq9PG31SIVgxzgNc0CY+abXviNmdX0
         y/i3Sb1CSPNmH9f0VSaf2Wpp+bITeoysrQ3dox+rHSP72WjrYPaAm8tSLmdd1XUzZGD1
         0p5A==
X-Forwarded-Encrypted: i=1; AFNElJ9tg0g4OkmVHuEwhV7iJOOAIKEXbA90yj/UCr6DB/8qmjlIAURYqMvsNK5g0oIxyqSsvYT15JWa2S/1uCkC@vger.kernel.org
X-Gm-Message-State: AOJu0YyWiCu9al3GWfyrHVXp0Y7MOGGqEWsN717oXhOoD6h+J10pZ608
	7gNxjl/qCeprGDYKgQzgJYT5WEkg1mO0QjPOEMXikDoHjk5lgYvLPBq6dVx+Smxr6+4tgI4gYQc
	rGNhFvMhRXzN8HjlhIH4kRL+mb3RfyX6CNPI5N6Vbv1pbjBcftD07gIkMXUbAvXodGMZz
X-Gm-Gg: AeBDietQD3QQJH8zPADdhsyy4eWtNomqAzAQI2iPLIfVX4yU1QEzqj2q8921Wy0eeXy
	LBQfdXS18SqXcT4OyfY36lqtBzmpv7V29/uqnICS2nHhFLCZ+aMpIdsYwzaZdfWgWZFlIabqLkJ
	mH9Z6K72WZztmMLiiEdEX1zf+PJDRbyPLya01dtObGLKTDqPXGI6qGITMfMbeFf0Ve9XtJgnpFb
	dU0cGOFPWTQG/ADR6MhnL6TDf++dC9wcAjJOEovvIWzXpewMYQaKKX+bJ/LOpuW5VJbPsWGaWEu
	gc0pLPVEIhHMgYK8mcnqlM9q4YXjhbFCSdgt47wV9cg24VKJ961NHRpTMjKSh3HyBwGoROrtMmP
	FeIaH7e3wq3HCYnvXClLUv6svLASzRKiwXvxGz3s76/3iweh++uMhJ8mlYtZpgHo1nhYf7Q3Ohm
	dkma969U9NHLdN9LylGnN2pMIK4Lm1RLCtM5Ehsf23AEIPHA==
X-Received: by 2002:a05:6102:2c1c:b0:602:7a74:fbbe with SMTP id ada2fe7eead31-6280957715cmr809861137.9.1777375844120;
        Tue, 28 Apr 2026 04:30:44 -0700 (PDT)
X-Received: by 2002:a05:6102:2c1c:b0:602:7a74:fbbe with SMTP id ada2fe7eead31-6280957715cmr809797137.9.1777375843385;
        Tue, 28 Apr 2026 04:30:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3923f2e3237sm6235331fa.3.2026.04.28.04.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:30:42 -0700 (PDT)
Date: Tue, 28 Apr 2026 14:30:40 +0300
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
        Tian Tao <tiantao6@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <jstultz@google.com>,
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
Subject: Re: [PATCH v2 02/11] drm/bridge: add of_drm_get_bridge_by_endpoint()
Message-ID: <3csl5orvlakqg7sfqhitlrnag4u6onrs4mvinkezxyxdw4whrx@ee2hrdhspfn7>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-0-4300744a1c47@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-2-4300744a1c47@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v2-2-4300744a1c47@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNSBTYWx0ZWRfX1WYmJXURc8DO
 +8oQc/7qxd2I5L0jXXVQzrd8RbE+zI2+fkb26A4xGDcwE7+VMg/GRrVvjx7Dchf4ZOGvSGiDAWl
 Rhqxk9LNbkJrISQ8qaQXecnF35Z3SzgZDSGloTAxjhj/Mhurm8IRkkdP1SEqOygRcYs/cfhNlF4
 brnVqGu+YcH5AWyilc3ijfyrVfPSaJJnj37hiByaIGW1rCazXTrJVgtgYw+yIebea0hU/ZOp7PA
 V4FcTRQFQSCwD7n2WjnfnYODJRaNEp4AZoERuzTKDqhDLVZbfNf3vPGee6CtjqhLdIXVJlw914R
 AUMNHl6ZZ0qF6ysKrvHKSGQ2+MXkaRGgJcwLvkCfGmLnkAhfyXXOJuQfbPZ9YRpgdS0qpm5gAnT
 62SlR0e7kdqwJr1cfR9V1QfYSnhZF7G9l8KL29AaWfF2/yQc1CPtpbSfzH6kYhcOBUVs89ZDxLs
 XSzpOQ6wyZt2ut/1R0g==
X-Authority-Analysis: v=2.4 cv=JoDBas4C c=1 sm=1 tr=0 ts=69f09a65 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=cIC2YJPMRTRrWvxiOScA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: QOYyeYQlyxJJ8Ne8EgQgMVqJf66mX4GS
X-Proofpoint-ORIG-GUID: QOYyeYQlyxJJ8Ne8EgQgMVqJf66mX4GS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280105
X-Rspamd-Queue-Id: E5A5A484865
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104968-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,hisilicon.com,linaro.org,google.com,intel.com,ideasonboard.com,kwiboo.se,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 11:15:48AM +0200, Luca Ceresoli wrote:
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
>  - is simpler to use: just takes no @panel parameter, returns the pointer
>    in the return value instead of a double pointer argument
>  - has a simpler implementation: it is equal to
>    drm_of_find_panel_or_bridge() after removing the code that becomes dead
>    when @panel == NULL
> 
> Also add this function to drm_bridge.c and not drm_of.c because it returns
> bridges only.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

