Return-Path: <linux-arm-msm+bounces-90728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCdDIKCfeGkorgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:21:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D804D93875
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC8B5302BE1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95EC4346A18;
	Tue, 27 Jan 2026 11:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZOmoAHbz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LZuUlaCd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4B230C348
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769512855; cv=none; b=KhfqN/oZLU5xKWaOJeEYnf+a8sYE2NK7S+XSzc7twWwLQ2bplMpmebXWUjDJpGkqmYV4UIlz/ZoXkmkXKq7V+HsfjgW8QljE7HkUZNZYjhgLo7FzL2DQ2bn46UWuZIurmGqteWm4gHMeQOiI9Z0f+ZNKIxids6O3xX1nGcUHx20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769512855; c=relaxed/simple;
	bh=oeBWwUuV0jeiE3ipYjKd79LqD3RSO0Ms3tWW/Keqnfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ND+O+jUsPHXVWwEPyoEZfkFet2HTFegkoAQC2a7aqlKAsDN0C7catwyA4+rY+54Uom8pFdESEqDdZJdWoO8uCnHwvDzC9SwPVbuyDSe1M8dKEp9USyDHOK2uK5rjEN8wtLWui5gUVR2aH9ry3muXyemERvHXhQoO7DhZ78bt0Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZOmoAHbz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LZuUlaCd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RA4PJN171390
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QHcqP74r9VhaV5/cZgET4JduR2x2H6zcTZIlVplq3nc=; b=ZOmoAHbzG7TQYghP
	Q/+fbofrkL7z1l7f55oU9lCHS5tFUbwHxZdoNe8x2Autw64GNBVGPZfGheI2QSXv
	FLteKO5fStxqgUtuFGTqtUmc3bhwpXiwUTAZq+eiWL9XCEl7E9oBmFcwcII/R3A1
	XIXCwti6ZrVikX3lgE3m+BnoMabUKfRhd6rX6vphMzGx4wHMLshJAZJClrQDYRtc
	V9wdwul5Zz53ucOdClomE9fcqt3xWzzcwLuJR/aoXdZY0kjqRw8azEK/efE5heiY
	9HP7tGuOK4teYFXiS9Y1Hx43Up5X4TKZSsUszoo+KyiOSAcSekrY+FTAMewIDm0c
	ocgIsg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxf3a2jvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:20:52 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5662e5d9a84so6100124e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769512852; x=1770117652; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QHcqP74r9VhaV5/cZgET4JduR2x2H6zcTZIlVplq3nc=;
        b=LZuUlaCd5HBLX+shYZE7AEGtjiV5EBdjqa1ZmgI2NShF4uQjgB2zZB+cpNymByAJj9
         bv3MwMTcCz3wfwif6JpNXmY82eRWH8LYRalC8bQSXUiEhHcG0v8KgzjndAHmLKah9+Mu
         4OeDA4dnre9/qyE8KHG9Z1F1zb4n5J9YeSYR2CcEHPb5Hms7Sf4eW32O6YzeLMqbFLBs
         JnUA7Ck/iqJ0FTa01UaGPzMRRDgzj5yenWCKZff68p4mkW7aCoruwfnQtYDk1vNENuEU
         utFSUlYufCg16o1FOmoU2+qCsQ87TNUUkoqT3Cjg/GzZH8c/1WRGQwWe8//ebod+nQnW
         i0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769512852; x=1770117652;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QHcqP74r9VhaV5/cZgET4JduR2x2H6zcTZIlVplq3nc=;
        b=r0oCacSeCyXp1IT0F3hMI8JWnTI3UMc8lMPEiJnhArc8JwiV42Z5/BxjKHraVWEL88
         lzCYC7ToBUUtvNA39QQu1V08X5OMrBNdbzX3JAVaNqoaM/AZbKVScejZvBOVWlzpaouJ
         IEiUFIc88o7SLz0YzsYT7HeNayi9MPP+cszU4BnP3EYRrvz4waspHPr7FZVnHioBmB2s
         CkZ/+2qhnSW2mZZE/c1SO0DG61BO7e3p/Y0gxT5u9rND496+Sz4ISWQhR8GZmvwJnZ0a
         5dUT7AjFA64WoeJPHrIKMwgectJMwtrvzzOPctrq+Yc/UcPcSL4rptWwgrptsI+clcxf
         3Z9g==
X-Forwarded-Encrypted: i=1; AJvYcCWi1OUscGaGdGFnZkcJ1FPHmjlNyEFlT//5uyBWX4EwcNeeMe7059eHPWAyuCVD2jjV1W0IlWfB8QXZRzsv@vger.kernel.org
X-Gm-Message-State: AOJu0YyDYGAxQVaafVNe4OFzBCu1bnHgCJMMHfjXAK0WPTEfvavo3xHL
	vZ+Kx/B7s3C9r+nZHXVySkup+AhuYEHd7bY6jleWGFB1XOfBxsS0NPR/zn+nnu/DoSTlr6YavAE
	6qNG+pcMvOfJakyXU3Kc2kxhuY+CXdGVZjjbSTAz/3l5dJ7hWPWMeQqNnVlUjqM261n7S
X-Gm-Gg: AZuq6aK4OjcFBoksuVJPTeUu7Bqih48DzXEQXINhglqf2Gbye/VGXx+HAltCf6Afrfs
	4lc3zh+FX5WXL4LAMN6fIhKkSDGjQ9RzdHhfNgvKEN6trHSdbfVvf0vRQMzOLI2u4mkVlP1kGfl
	R4sP9keoRyslMC0RCYaqRSoV+ifqgOpAB+NkFfeSG/B2QtqIs5L+gfAZUKrQmcLtC0Y0Jvbm6x/
	yRVbJxJ7+mz/rhIdXL2QaLHBoQgLtzXzcfXJrFzPYa7+/Bc6Hx9YM948bGm41Z+71Oe+Rny6HeD
	ihhPpPZ5ODC1NACLHfJWrtoIHFb6fH9Xav/AzYXJXUFnheDKviSX6JcC5egr0KdTMPxj3XxybLe
	UsWeDxFkD2xveBqR2apWy7C/9HV5aqs/V4uQoPnvvmmiD076+9sSsO8U0ElnfOecFDUBf7da2VM
	A3M6Fvvyw2XzAcpMCp4ihTwdw=
X-Received: by 2002:a05:6102:291f:b0:5f5:35bd:6fb3 with SMTP id ada2fe7eead31-5f7235d4e59mr521468137.5.1769512851686;
        Tue, 27 Jan 2026 03:20:51 -0800 (PST)
X-Received: by 2002:a05:6102:291f:b0:5f5:35bd:6fb3 with SMTP id ada2fe7eead31-5f7235d4e59mr521455137.5.1769512851297;
        Tue, 27 Jan 2026 03:20:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de48f0259sm3368696e87.45.2026.01.27.03.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 03:20:50 -0800 (PST)
Date: Tue, 27 Jan 2026 13:20:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
        guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
        valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/7] drm/ci: reduce sm8350-hdk parallel jobs from 4 to
 2
Message-ID: <ftkgk4xevcfe4dyx2pqi3gk3bqm7jcv65qvn3ypgrwls5dyx3m@srsgbmsteifw>
References: <20260127104406.200505-1-vignesh.raman@collabora.com>
 <20260127104406.200505-4-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127104406.200505-4-vignesh.raman@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5MiBTYWx0ZWRfX22UT23mNphJk
 +tastwmP9nMKXmuw064C+x2MLk82VfPb5JKgHVSozPev58sXrTwfCEm/2Q3MGFW2zYo2vI4AlgQ
 a8mjMVCLCpHP+sKskd+lfpuShgl31UVYQPCHnl3iBFEkUpyULfGf+BrzrJuaQPoFj7XER+pzhSF
 EY+ME0l+SfKQtV1vnaViHYVSz8FbK7JJl1i9gNpKhA2hauAZ5F4hhMLVK44h4I/+CFgU/sBh+1v
 VtgXzKqHuT12rzndBf96eYQJheyn/XNqR9s/V51XNknVsvjUSDc+c0ZP+edSm677yBodIL594LG
 NyKrfhMuXkeVj5IO59/9kdMl4bD+cZ7wzfDyq7byNkj1klX+FmQGYDYQIt3dnFnEjsweln0kI1+
 rXdcxJShQXJJxxH7F5ABWUZ1LdO43uVsGLvOpBtQVi8FFJj7Ta+nvsHQo1dJKsgcnINPfyjZ7Vj
 kHJtNqWKW/gd+lr6n/Q==
X-Proofpoint-ORIG-GUID: hibq31ZQ2ulo8LTQB2pfMJM-GFh9AAGl
X-Proofpoint-GUID: hibq31ZQ2ulo8LTQB2pfMJM-GFh9AAGl
X-Authority-Analysis: v=2.4 cv=a6k9NESF c=1 sm=1 tr=0 ts=69789f94 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=_49z0RMimKR0Jg0_r6oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90728-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,collabora.com,gmail.com,ffwll.ch,kernel.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D804D93875
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 04:13:58PM +0530, Vignesh Raman wrote:
> The sm8350-hdk jobs are short and each test takes around 2–3 minutes and
> the full job completes in about 10 minutes. Running 4 parallel jobs uses
> 4 devices at once, which is not needed. Set parallel to 2 to reduce
> device usage.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/test.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

