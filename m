Return-Path: <linux-arm-msm+bounces-111582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f64IBcq4JWqxKwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 20:30:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 621DE6513B9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 20:30:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Uz1Zjp1p;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=clZQcJxj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111582-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111582-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1EB6D30073DF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 18:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C7E3128DF;
	Sun,  7 Jun 2026 18:30:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E53316905
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 18:30:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780857031; cv=none; b=SJenL4CTY34ZeAqWNOq6r0w8Z5M9puV3wUcqXuJIz/BCEBFjTvMnavDkkIQy8cMp8b4OPjY/K3xO52VA9OmYxYrciCFIk4VhX2iRf3PCoe34r2e7Z3r8qtakGGF9qFJNcI95waWlAtPrRiCf7/OpJ41O3rO/FoC4Uvg1uLRJuPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780857031; c=relaxed/simple;
	bh=m6t+49MP7uy5cAZxatTTe11MxFg2tnPW00sY/HGGnxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiS6KlSCzdG1c+26UysWzA7IqFimcydqO8fuvqrhp5+TSpQcH5I4tJMNeBvY9mGUvA7fgDJuHvNHfXjroGyOQtgssm1cajHaXOzLpNh56kK8daUZuZLPvCUqgl9O/97xY9K0YZzUQ+tdduprDLc05MOwYqII25IoX5wAAZr1Xbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uz1Zjp1p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=clZQcJxj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EjrRE440303
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 18:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zmozr6MMdfPUDaS8e/eCWoR1
	xOPrRCMQtMyGELf3lMM=; b=Uz1Zjp1p6qTYu9mtGwHAYALResZ/6gX6Fp254Gdn
	XoUflZe15R/kn/00n75mLDIv33AROORimVj8g5jfec/K4XinYwokKNliOXdsCR5f
	C3yWIqid+ba6HekqSIUBpT3xDtH5aB1F6AB4npnCOX33VGrYEQI51fR8xIsEcZ+4
	k2aZvqw90zRBjcwd8LX0xB/YwaDvhUW5CaML9KmqXpJh639orWim8cy8pCRpMdqd
	CzslnQ3npTY5Griiic8lZFmnHSCuVrXz9FpHolwtqFnVG9lCKH4YucSLBS/RF/h2
	uz0xJrczpz78ks2ApU0nbwTdzDGyIRN9Gfzde7g6UWykUg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4em98cw01s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 18:30:29 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5a7cbf971fcso2091636e0c.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 11:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780857028; x=1781461828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zmozr6MMdfPUDaS8e/eCWoR1xOPrRCMQtMyGELf3lMM=;
        b=clZQcJxjATyFfWg/ydD6sXuOhlH1W/xpF2cNkmg4jZ8x2lpP/LS4OwKo+4FYlh0J9S
         Z5VchFpB5gtZihaqs1LMVmK02kw1K0pLN714wMDd21D6pg/k1byXPUpEW/XqS1R4X3xC
         fEa6wf1GP3LSETmSYrs+rxSMQ6dRdgrOHrLiASj5oYRK+L5zrSzQjpZY5HUgEWM4J9FN
         bN6aeCGG+ojMiNwZJFj4jDQ4fglzlXsYVx48xK9HLGlaHr2JATqsNiPjIuwbQ66dZQur
         YoabI1iMKBLaLX8bo0YSuU7BljbGwc9dbrwBdHL6Dxu+XoFBlpSw3UJV5aU/6E5FAfWq
         q9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780857028; x=1781461828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmozr6MMdfPUDaS8e/eCWoR1xOPrRCMQtMyGELf3lMM=;
        b=OfupgMUSNKx3zaCwdTcbnjWIHW0hIMeXKdWj7JMVqnYhR3Kh3Je/p7bIb0S8RqUKJz
         Rw0Zk7PTzzOAuuoVVEAXcUI1Cl/bxp69dmXVKliqf/MxEkciVLIwOgMfN9R948x7MD99
         RCog2shnhpQvGbjKiklK/bpVba8g8pa5qZdwH5bq8w3KHEdmp6oFkQK3aj0oNNJGgYTz
         Ch8YKfRkweqEIXtax3pKR9SvAL3Tlz00hffO+knTZg3npMizBkhOT14EB8ffJoew/1FQ
         rzExg/fdDTqklX71ABLaFfXNiAwux5GCv+HcZzDiDZgTpPLsSe9tGgFUB8GJCBbkV2dp
         8YtA==
X-Forwarded-Encrypted: i=1; AFNElJ83FPvveEc0QIuoupihTjGlcIpt0kcemzwugG6jVKBrzDUuujOhVGaz9AuSeqtGaFcOVQrERvC4jjAWInAc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7nFGNg3aoaQsuHOQAjW7Twa9MgSNKNIMOGLIGZXBJLdu5ygGQ
	grUviR4HCDXoaXquqm/vN4pYrU9IUIp5LjoXmCrjofHtMSJDDUinI6nGOjB11gnYMixF5XAHuDU
	N0/KoXnO9SpXufYCnBWRRjDDPtMqLLD1C6P454GKAxXHu7/0MGc/FJBoeUG9FNUwx45yq
X-Gm-Gg: Acq92OFT8qfnjE6eO408FagJ3WdmWR+6KB0WwpfDZVPr5y/l8JfMp3k1YQ7E03AtgTV
	ZW6ALrs1rWL8UtMsL+ly1/Q89JsbWONmAWY2yzbzZ5JGk3NZ8TXtN/evNpN7RTzBTJfbFecLR9a
	wn/e21UvE5neoBZk0J9waN9f+NPyZfsBTnfDzvMySOAfaI5bC+D+1bPpn40qo4hEu9s8ZFRt9XR
	Zj7frV/0acTlCMNDgwUFBwIcqBCEmQaob+FqRSOEcX3OEPc1TOxatby5dZZbKOjsur4MVE24s4K
	vvBXQsrA+PrmJaxjrufRyCOuCCuTpfPKiS/0ztktHOi21ogooTeN4meE8d3cY/uLNPknwNi92va
	IuX0GxVfFPwlM3aj6oo6HHLC7qD6xGmzL8PbeSxCC4av6NOV9lbRMY2LDVaHod3PXDBCgyoS5pz
	SQBCuFsEDH5THZiNx04vTSKxC3p28AM2lk55zHC5vjl46UdQ==
X-Received: by 2002:a05:6102:5346:b0:6c2:e290:cc69 with SMTP id ada2fe7eead31-6ff05e2d9ccmr5876340137.23.1780857028296;
        Sun, 07 Jun 2026 11:30:28 -0700 (PDT)
X-Received: by 2002:a05:6102:5346:b0:6c2:e290:cc69 with SMTP id ada2fe7eead31-6ff05e2d9ccmr5876331137.23.1780857027872;
        Sun, 07 Jun 2026 11:30:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9862fesm3196569e87.57.2026.06.07.11.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 11:30:26 -0700 (PDT)
Date: Sun, 7 Jun 2026 21:30:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: okaya@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: qcom: hidma: use sysfs_emit() in sysfs show
 callbacks
Message-ID: <nsjfphscjzpxicu3spn6mcpyvmarqsb656lvflalouyupq5syx@leeejbjrohws>
References: <20260607163119.78717-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607163119.78717-1-dennylin0707@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE4NSBTYWx0ZWRfX/JApuvys2TTu
 cCCGEzuRZvj0tHl5LyRl6B+AecIj+iRTd+wFX+aHsruFY4hg0N/5y7pa5sGwqio9LbB/9tz9I1O
 ZH3GjSKN3A3ZGrTDla1zN15VUXeUMugqHGHBb8FqkzRMkgOZyxusbwTNpsnsiaFVO1QTX73QOKM
 5SmgObWxuiW4hzVFOeuqcXLtay5BGQTjOVrEsji/p+lnF+g+Du4xD6UXbXxLwWL5SxzVd8vKvxK
 engrHb1JkCArMaN/2cKlORX6lbjcLXNYEPcB0vQlO8/oBPLAl3KUJIPT8jPr1H1JAhCKVoBHohL
 X51Y2UY6LjEqm4rJYtuoyWmWnwlD0OHf8FQeyf87+m0vFAHxnn7jeqHB2jIWYJ2ngdayO8Pc/c2
 Y1kDYYnky1s8Yiz6XkHDolrmh6vYUJRBdt9qNhw4EM/dY4U0fIlfeMiiFB4XHIBx5e28zgzo+VC
 /MTeaq5czKARsTck5wg==
X-Proofpoint-ORIG-GUID: Ev_kvL4NQaiWaD4m3g2dAjEDrllczE8C
X-Proofpoint-GUID: Ev_kvL4NQaiWaD4m3g2dAjEDrllczE8C
X-Authority-Analysis: v=2.4 cv=A/pc+aWG c=1 sm=1 tr=0 ts=6a25b8c5 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=4Z4V4W3UNDWYKEzNDnMA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606070185
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111582-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,leeejbjrohws:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:okaya@kernel.org,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 621DE6513B9

On Sun, Jun 07, 2026 at 04:31:19PM +0000, Hungyu Lin wrote:
> Replace sprintf() and strlen() patterns in sysfs show callbacks
> with sysfs_emit().
> 
> sysfs_emit() is the preferred helper for formatting sysfs output
> and simplifies the implementation.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/dma/qcom/hidma.c          |  6 ++----
>  drivers/dma/qcom/hidma_mgmt_sys.c | 19 ++++++++-----------
>  2 files changed, 10 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

