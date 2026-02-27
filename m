Return-Path: <linux-arm-msm+bounces-94372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EI0GEfsXoWk9qQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 05:05:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5AE1B27C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 05:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 312A63049731
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 04:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FFF342CAD;
	Fri, 27 Feb 2026 04:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONcJveXH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ffj+As89"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2C233E353
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772165112; cv=none; b=kryiXdZDKKEMTN3ZjgUhhSGHtF5NJdq1RqJiwQbYaYVxobL6x2uIaHVAzYc+H+UcaVFUM1I9rkB/58GK4izGX7HK+giUqo9HoOab6cV7bz3ghDkBOMSdbL2B9hm906UHouTZ/0t2S7M6eIb7nkzvN3ua9m3asAvhEgKeUEceVIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772165112; c=relaxed/simple;
	bh=DS4FtQMVzpYlm/advZvB1fGXfdr+9Wvs10XJurLTQMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTr/Dw9ifaq3WLEoOIcbvteiXFemEtXMS1Xh0fjthwhMAy6TNmNUCwxuWNTDnR5TzWCE/5plbd73ynJPiQM24ZxFPjQBHQ8dBoCjnjTtjMMdGBUKR35i+1GJZ+UWjZofIOLXXh8SggAsEQeJKTZnhNQKUTo9eTRlkhOHd9gIDJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ONcJveXH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ffj+As89; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2K1Cw2413947
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aiD+WIJ/4DuL+WWSgSV75vtj
	gYSQFtjkrfw1dFQwWJc=; b=ONcJveXHd8QgGfEnYdh40lzZIUo5KO6WAx2jz/1F
	kwDYmXd9Zgz2yq51hS62AJRU9YldniH1kA/MieDutASQg6PDUhO8tDzDbc27Wwee
	k79zpypiFo4hyxSgeSmVnxk3BsxbRpcemKOxrADeOrf+TrEgCs2nlh7h8h1RC0Yz
	KEw9DuUeFp8Ugo4Pu/fP7Yrh0kYjvAG9SEOpd7FoK5bINfx/RlgCTQIl70d/q30x
	eL8Wv1oZEVm4k8ZENNjB70SkYp1wOWQGAWb6CrzC8f8WA8eqSQnUmehBczaAgZ76
	qetJi6IVKgxzl0zfuFgS3BaO/Ad0Puq8C/xS7ro/qhJY2Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjc0gcw6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:05:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899bef1ea49so296401506d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 20:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772165110; x=1772769910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aiD+WIJ/4DuL+WWSgSV75vtjgYSQFtjkrfw1dFQwWJc=;
        b=Ffj+As89vy0W8g9dTbb8KfwZIDuA+R9iI3t68fV+MYwWk7SeBJiBiCv2FPcvUxJArP
         rWDKrQTKkeYBeQpjwuq6UmEgBwrzCmJCCdq6TdA8JQbfbJRU0AEjIW3q8k3CCN5zfEyA
         4YNdAcV7/FnGYwztNeFnlBeVEBSyQSoow5et5RniYOP0eLsqDIqd0JOpJiAei23mjRkB
         XguQlBKBQl8MwS4Ddwbjlhp7kE9ZrkjJUbmeBHFvvtZ4RHOO/a4fFIW8pyVTISQPAL2Q
         TiLq5ut5d5AprfMBvvsfIQaqF3iKeHYz84qCvSncNiSotMyg6fqxc7bCCulsqKXs27oI
         /Rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772165110; x=1772769910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiD+WIJ/4DuL+WWSgSV75vtjgYSQFtjkrfw1dFQwWJc=;
        b=FAMrUhrmOUJ3XP1qLGkEwA93tbQvytyaV/LDDGbKiP6W+DCintiabKA6ANU59DzmtY
         JrmqSy4cSl6d4/sJnrWUfa0/5rc2ZpxbB3Vb2DwBoXDkCVDVc1BZrt4qoPduukJg4/5V
         lxkplk9wQU1Ljn66XAQQ4qYOo09MOx+F0PSnBCcG59ZP7o5bytbZW1SzzRkF09yLiJ4A
         ijM3/BfLCM/UdT+MVJMi4+LazfCb1xclqBHjna/WhDIzBk78Kj82LccJgn2QZtEQekoq
         ltrumcY2wrU22jWioqBkMZQev8PlTLBJHFpKKZwFPvEOrz5iWlZfilOCGE8PcTnvmj7N
         ndbA==
X-Forwarded-Encrypted: i=1; AJvYcCVDeTOQKKKMwy+/g+jf9ZHybIXvHdndRToSOv/7s/5X1IB/VJw72CQUOdmCddBG5pPXFg2ZJDU+01v3KUT9@vger.kernel.org
X-Gm-Message-State: AOJu0YyKdui84WeRB9mHrYsw/7jG9lp0HrhbwGciohbbguYXmvhfnpNB
	3D40uD72J67WDpZBAN0MjQx/Of5E7EGMzNe2l7xGflNZcdMHGfsWX6Tq61p7wCjn8QJkjfCAUb5
	BCRMGM4OrGWDy2KNVJTLhLIw5Bul2R+aLkPL5F0+VKKM7RsWzXG5+aJj7/uL1nlWl843H
X-Gm-Gg: ATEYQzwWr2GmtwHgoRKt1UpdNwrCIBdWQO8yKWbmsxfXqO2JdaKbtO5I6KbLrKee348
	bzmpkpc63eBXDtGdE4EyVBW9gK+wT3rw+j0/WdPDkXPxFrJniIuL1w4LU+Muu5dctiI+BrJFqSp
	UFCzKun1th9MjXCbAoyiwscBotuO1ygyx1mG/+bWZYihFavvVanWZlkUogneNVa8ggfNUkzLm7U
	UI8pqn/7xZ7/G0mvtRtHcoFqwz3d5ouPhFWIP4jUi1iybwgOBuyWMIW1hx1K/qz5jsq0eg9R+Ir
	djgBbexJkJsaPHczYqjCMmnoOx/4mxSldBfJv+TvvaXHlCXd0bWexEw0PeObl9+mygudRECFdQi
	5R7Ev3hkdG+3Z5KlyOljWodcHF0SMKx0Ok32XgCXtMhFlLZQYE7Y3HrBhflPhRtA76HmAV/676X
	iqzFuYqTgHe6JCZmFkyKPGqVNYP1QTeoEY8Ws=
X-Received: by 2002:a05:620a:4015:b0:8cb:4d9b:6b48 with SMTP id af79cd13be357-8cbc8d6f18bmr181037085a.6.1772165109947;
        Thu, 26 Feb 2026 20:05:09 -0800 (PST)
X-Received: by 2002:a05:620a:4015:b0:8cb:4d9b:6b48 with SMTP id af79cd13be357-8cbc8d6f18bmr181033285a.6.1772165109483;
        Thu, 26 Feb 2026 20:05:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a10a30d9a9sm1563193e87.52.2026.02.26.20.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 20:05:08 -0800 (PST)
Date: Fri, 27 Feb 2026 06:05:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dsi/phy: rename DSI_PHY_7NM_QUIRK_PRE_V4_1
 to DSI_PHY_7NM_QUIRK_V4_0
Message-ID: <2n6kr37xbovx77o43nk2j5fuktbes5v3itsiw3lzk5wxupfkb7@lces3sokaonr>
References: <20260226122958.22555-1-mitltlatltl@gmail.com>
 <20260226122958.22555-3-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226122958.22555-3-mitltlatltl@gmail.com>
X-Authority-Analysis: v=2.4 cv=XI49iAhE c=1 sm=1 tr=0 ts=69a117f6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=CDaHCIWj6aTna2qagqwA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAyOCBTYWx0ZWRfXz21BOk1GTSap
 bgLVYoyK1h6sAq440KfakMI7kHxPc1UL5zZUJ8oKtWoOVK3Uzdb7ikFh25I3jPZwHvO6al/jfPK
 PbylL8BOMrgGpVvUmMuaBcYFk4wJqotdR+ktuma8vGnquW8KmnBQpu7ZpFXtxoqCP1Wg8yZoqA+
 y3a/H9KN1Wix4BIyzwKZUMpK6kd5o96QNYwhSqDsTwtmPNeTm0HmfUiWY/uI2t4HGB/43PJfpGY
 diREHbEcjf+224BfbhGXPEl8eYnZtuw/k6k3qMXz4oiQh+qLFgCXGpHYtHsLG1tkJ0KoTDfEigR
 YuTIDsfGPfzPt7zJdTMQ9GTxlE5tFWU0cM7cUN5S1WieWxLcoqr2saSaJP6iK13rp4G9pYLK8mA
 iuCzCGAwsiB/tlxWnvznEEF+lqMz3tBQLE8gk4pHz3NyjqLqQENc+le08tTeImsduSLEWil20I1
 cxzqoPq6DWE8MumoXbQ==
X-Proofpoint-ORIG-GUID: gS1DE8Sw4rLAnfrKR-V8Ut3gaGHaJxFN
X-Proofpoint-GUID: gS1DE8Sw4rLAnfrKR-V8Ut3gaGHaJxFN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270028
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94372-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB5AE1B27C1
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 08:29:58PM +0800, Pengyu Luo wrote:
> The quirk flag DSI_PHY_7NM_QUIRK_PRE_V4_1 is renamed to
> DSI_PHY_7NM_QUIRK_V4_0 to better reflect the actual hardware revision
> it applies to. (Only SM8150 uses it, its hardware revision is 4.0)
> 
> No functional change.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

