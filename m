Return-Path: <linux-arm-msm+bounces-111699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tKNyB6xnJmr1VwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:56:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5EE65346A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:56:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=h1NpwClZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GL4sKPFZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111699-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111699-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAB8830063B6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 06:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289892E7F3A;
	Mon,  8 Jun 2026 06:55:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB66F314D26
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:55:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780901727; cv=none; b=K0tBn1FgPUgF/KC34rRbs0WfyNO2aMPoK4ICp//nYYNQHpMnmgRHv3FU+LkFYCHRl7RiYTICtpC7CSvupk9ESYI6oJG8ykgM7880j61c/DhMgiN4kdgwYi2LQ/1fUJZOTB107gkB0BlRq0Uqx+XW0TB5d7GJlg7COI+8Z20aRE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780901727; c=relaxed/simple;
	bh=v0OZdAoikPnaH/rOWdn0SmmNKkvFindlZhwu/M0YxJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RIO5JYCBCCiYZbKVsjI/ovMyaXJTVvazQdp+/II3tSFXQtxK3g5NdpS1tFRbE3dt2aHUPkcs4mF/ujrjY0KGlpXsDyjoY6rrLD1JFgMxW7mOVP3bXb6cBf728nVNZQiAl/vl6/cBIm/ya9c3o1XsDGH9csbOwP8vk6NLE86PgMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h1NpwClZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GL4sKPFZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PUvm2808226
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lAb1aizM6FPZXAuhv5xV1KHu
	AlfDJtLdX6Y70fKJtdo=; b=h1NpwClZJo13lTi4lZZXh6bXoMiAAVcTHkbnn9vV
	NAGy4ELbZYZHkSTMzE+46E38LMRxEUaRNl4MCLASRdhM5qidETNZyOB0yqosjK7W
	gVjZYDRNCtfQl3P61kMzK8r6VpPdKACTnBJBnfV/uhGcOjyE6PJMqKuH3ATzcDjl
	so6SiP6bjbDgTHNatuJK9rs1Uftq3voWNybGV3WUr8SY2aduYZxKzMj5YgpLGL+N
	ieCx4PVffpI/8m4qDIARrz8XJCZQ7ULAwYoVPQxcwbPj/iKqXxWg0lUJ7QqDYb8e
	uPVLggoaBTSPevX1qu8+tM0E7+LxCs3Cn/2aZTWVqQGTIg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w6dq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:55:24 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963a96abbb3so4744357241.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901724; x=1781506524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lAb1aizM6FPZXAuhv5xV1KHuAlfDJtLdX6Y70fKJtdo=;
        b=GL4sKPFZNG2pgpi2GkGxMrbg/xmr2zXy+nDM9PJwZneDkkFJzBhwAA0wk1ewt4mqVj
         AfprvynNXPusvX8OPGNBqB/Vv4XkgGQgQlAmkLMDkTBoz1TvdXUCi1zBP0wXYoICylFU
         UGvnkf0lmtHXk5OqH19tzCrlCDqUCFWEkX1jJu0MmS83fMfvIrcArRT6nNAYICgi/L/j
         aWCg0GF/zFemNh2TU+/rU64FWQwHqMosQWUPqXd7L6NLOfueTjLJwqwcyTBWKDSaJJi1
         o2Ql7JjmfEZ50ImZ3AuqA5jV8dNxzE8w+85nUcbjKuX4eiMMrUOnFXEwj3Qjhs/aGYzu
         lyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901724; x=1781506524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAb1aizM6FPZXAuhv5xV1KHuAlfDJtLdX6Y70fKJtdo=;
        b=Hx4k0dF1xEolUJn6EUs0KaKkt8hPftQz0aEAl1FMIMABsM0jB1TLHoAoJbJdM21eZu
         vGEWDV1+AiURgJGiKS34YW4gevOwbMWerYJyUEl4bGDg1cFHOh6ztk40IIm1XHdQIoo0
         fB0rKMx0Oc1SMgQQ95YRRFzQO/vSuwG11ODdI7ovt3PZBC0F0nfy8FvsnHLFivOE58hO
         yDHkAjpj+duMLW8gh/yJdBt3S4AZJGGeNeJeGZeBlnEgoIvhiN1QDmt5O98nNbqDH3jL
         gmbge53ZXMjr6tuSkuug5dfdXcsxw1dRI0J0tsVVt4LwtWivuFyeIV2yQHNGfUyAT8p9
         cAmg==
X-Forwarded-Encrypted: i=1; AFNElJ9KzZPNXr9shJi04Al+nomGx9h1Mbdly1mntQhXD+LECuqQp9JfyEDYEM9QtbPhhwngdrpYPAiSXIY1gFdP@vger.kernel.org
X-Gm-Message-State: AOJu0YxAtFpqEhtwkSXtxG80ZYmXY2AKAhdGmkn4cwPu6JdN737GQHQi
	RfF4IwjITHI5S9/9QzS9Mhnp4VTXtxQxaLrVJU3x1OP7c2frnWyyD4AIh90A6H97AYi+K6xxmqi
	ewPP5jMtz7rY73i86mLxFksK/BQFphbB96fCpHoawv5xrynq3Ru5zP5wV4haxegSgwo5M
X-Gm-Gg: Acq92OGYckgDfI0OlbqSy7L+l4qcHTDWYe3YtgHwB81ID1YxL0KMzcsDrnUWMjt8q37
	f612HCgzqvHgm4krBoyg7L+kzYnFkVov9a5cslr5kwxYoFWX7p5IYuzxFqSoK1NoQ8Ym4ZHOre1
	LxNjxO8mJhJWP96VWUfnl9fro9Ov6Fxrhcdo7HHwHUF0PM87mm5Upr/w5+lXmfbi2KmI9WLxJsQ
	au6JXZb4F9ONuOilrq+b9i01IwHLq+qKIBlJnOvBM7oJNs3T8cyUtJ068aIEKNPjXglfHkUxdeI
	59xdQu+OKxkVRjPfYEGJO/jahCMyNjgLb16/trqVDwnSoilZx7SB/clz508w396kbKZIzt3pnYm
	ZTsaPR7FSnVbm6kEQ35zdJSToxgLDohwbAqIo7Od4xZkjH9dkxkN5anKQdH8Sfbat9FVXCPdTBX
	nhTtSGz7i0tSH87Qwp5mEG9ds8shvoUi9e2YNrQUH+w5h/2g==
X-Received: by 2002:a05:6102:390d:b0:6c3:95ee:73b4 with SMTP id ada2fe7eead31-6fefe3bea6cmr7099930137.29.1780901724388;
        Sun, 07 Jun 2026 23:55:24 -0700 (PDT)
X-Received: by 2002:a05:6102:390d:b0:6c3:95ee:73b4 with SMTP id ada2fe7eead31-6fefe3bea6cmr7099921137.29.1780901723936;
        Sun, 07 Jun 2026 23:55:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b9c4sm3588080e87.48.2026.06.07.23.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:55:22 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:55:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v6 10/15] drm/msm/dp: allow dp_ctrl stream APIs to use
 any panel passed to it
Message-ID: <vom5rxvlz6lf2roh66c7li4zjunewy32p25xj3cpcvx66lcxzg@yo5ch5qy4l6b>
References: <20260602-dp_mstclean-v6-0-2c17ff40a9b2@oss.qualcomm.com>
 <20260602-dp_mstclean-v6-10-2c17ff40a9b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-dp_mstclean-v6-10-2c17ff40a9b2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FGPFVGrJpMCWaKMPoorPB3PQptX4rDUT
X-Proofpoint-GUID: FGPFVGrJpMCWaKMPoorPB3PQptX4rDUT
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a26675c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=kW0YW-xf3kM7CBANKvcA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX2nsiNOl+n7KE
 ml+3qJYAhe4FpHFVy5a5oev+hVxj4hlJSMclaQ2iV83DilhqeJYqfn1HrmcLwCxta1ztb9/KNtW
 aqL0s3QU75mB+IZHy4EjEhO7wNG3Bj53oIcXXBnEQ+Wam0g85AmoNXzrZIV4kQE2XqMtjcmgLBL
 HoO6ul44oiBSeOU2yPFHIGxoEm0VRLIjizaC0DCqwTDIT28rKsfxSpdubPwZt8t/XW6ZX+CDxDg
 pOjXL0ep1wm9M7v9tYEiXZrx+0L5R/8gjSmx11cd0MusgQjfmlUY+6w6mL+As8IOriJXWG2dtlw
 oB1ZYB8S4ZFguPPmtD7GMnlyPX0Wfdd9A8oGVvDl/TwBkYxnUPHjEReXjxhE2hqnB3Kv0eOpbIR
 VKHRiuEM4KY1nKU8XbP99gtSiGSsYS4sbAPJEb+9gSbUzH5NZvdTjhZjIKe/F0QsP1VTHb9fOrq
 vpooUdmKOEIUlvp3UtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062
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
	TAGGED_FROM(0.00)[bounces-111699-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,quicinc.com:email,yo5ch5qy4l6b:mid];
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
X-Rspamd-Queue-Id: 7F5EE65346A

On Tue, Jun 02, 2026 at 05:11:22PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> With MST, multiple sinks share a single DP controller, so a cached
> panel in msm_dp_ctrl_private can no longer represent the per-stream
> sink. Drop the cache and pass panel explicitly to all stream-related
> dp_ctrl APIs.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 196 ++++++++++++++++++++----------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  28 ++++--
>  drivers/gpu/drm/msm/dp/dp_display.c |  24 ++---
>  3 files changed, 140 insertions(+), 108 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

