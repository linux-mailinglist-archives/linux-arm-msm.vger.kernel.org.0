Return-Path: <linux-arm-msm+bounces-100433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JYYB2DgxmnAPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:54:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B60F34A7EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D49DB30F73F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989FD3815CC;
	Fri, 27 Mar 2026 19:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDfH9+Cg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+NGW3J9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB1537FF4C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640871; cv=none; b=BgcCn8C8b/jqmViHKEz1uFjqzHc46TvDCQuiUehHIp6TEg/x/2nflirFVRrgFae+OpiOm9EycMP7hA5o1ds38NaDplA6UF5tT+KTnV1fKYCKZM3v66nMjun9Hk8MGE/Kyc7FcLdtAW4SAcikx70Lm3lSPqC41Gzy9o7aKOFCkO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640871; c=relaxed/simple;
	bh=q/6+vMvA2E4OZu3sbTJUXlFO5fj+YmxcRVRVtOtAQuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nBFTJH6yOYtj/ZohhSnhq8zT7otAy9rm6+VuJiEOV/BcXlIm01D5aP7YIJ/thVqZHBPBfAuBY5m9F/E7b0MxG/oYF/+tICiHnyoPnOacCT0WztM7blaBR574pbFe6qk3a7IRucjPbpY6Wse7zGm3CzwRy4KbuKLTtQBEL8V0Uh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDfH9+Cg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+NGW3J9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2bFV3137108
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K6XR8VEr9ypixa6lsMOHaJVt1KW3Mhm37VQBvXFJnis=; b=nDfH9+CgSmUTr/Jy
	DUyPM4HxcFXuCvnrg1gW8YY5wolyL5bmU/VZq1nOWa5t9lRzcrYw6t+Jjn7eJtj8
	qZ9T6/A0ZhwuZY026SGhK6xdzMrLfrFsvQHcEr0gFLIVbmOOMNbSAXBW2XRLpvFz
	huHSaUAAyBISbik4HoET5P6dwPYbxpv5lAPCzPY3oaPgiQCdo6wxkaf28n81rgJr
	pWIfGcCqezlnvSb7pfEqo9aGaTXCjgkNp2nfD5rat/r455oWdE/5XnftMV3Rr6Ye
	HM34D9oCwEjHsHUjUhUtTRm9IIbneprd3hDswPrVXKYQICCMPB4WssTfijCQ8xXG
	j+OPrA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1d02p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:47:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b878a8c07so37189261cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640869; x=1775245669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6XR8VEr9ypixa6lsMOHaJVt1KW3Mhm37VQBvXFJnis=;
        b=Q+NGW3J9hHjegF1W4aEp+nrlIxN7xgGWhRwtwt5C/3q+8l2h0NWKcngBG1FlWb+uaW
         gqlOXuFikKA90iyOXY/marqbLkaZoVi9j9LI4h1sf/mY0eUGwBf+jj8xatux0PjgYFES
         i//wq9eTHvfIoXYc1pYgqoTnKYt8iT9DPY4ZrU3pghVg2Q/9KDbItWBwfAEGZ8Smi64D
         zh6iQLixQp5pWgAJ5yDnnFmw1j27cP0AEQCSICZCqSPhIg4iWKE8QxC8QBN+e/+dxFhG
         ECj3s1edSXXaLZqbEjiBOyVryfZiO02trFR5/+EbPuGE/dKVeuuiIrCosv8l+QGIKPN3
         V4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640869; x=1775245669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K6XR8VEr9ypixa6lsMOHaJVt1KW3Mhm37VQBvXFJnis=;
        b=EIYa2/4Y8a5yZ4sCfYBkLOB/xV90GlMkAClnKZgqMlfDogPxSAVeQM4C74hmXrVFWl
         veM6/ETAaU9wRnAWWBzP0IXlBfxaFyGdz5h0Latxb0kq12BavNB8HzjuO0Eex/zd2opj
         rtoGym01Fb5JmjkxLDIwOwh+5uzdZ0aOYm8tNLP6fJwYd6RdtOFthkb8FL07RrW0VZ0F
         JV/f+USG4U2ozb3BZmwd5NlTTF5gW+zUWF9VCOndJSf0kRPjjWEe29g6k44qWrtSlm97
         3e+aU/wq57NgPGwxY/yADwbHshcNbPlm4OsVyhwDwnzPsFLcrZ+s8s21QoMrSfNW4xUx
         moqA==
X-Forwarded-Encrypted: i=1; AJvYcCX+Jc4V7AiAaGMdoO7Z+IWN/yTUvRKYOvjPUdVTL9pySaH9PzY5JAcXmSJDKgriv50i3H55UX04UkEDRmix@vger.kernel.org
X-Gm-Message-State: AOJu0YwObGMIlLB27iABrj/T4FmUJ07jhPm04eA7w23rrwNskY8pZ4lN
	18vLx2MmyYlBJiozUUfMh8AkxrUb5y2Gs/cSQS7vcxDHVbRlNIwsgNuDPzE4wEow0BCDDQRRDYM
	vuXC3ezOfWcn9Cz0rIcjY7u+hu2rZgMppO7f0/kA9Q48+xH1hVAxJSxwj1KpDogFo1Sw5
X-Gm-Gg: ATEYQzxUFeJOwpgam2fHxTWboArTFDmrylRRZyUopG+T0DqraSDHf9ojnbieft09383
	xJxoUfcDJlb0AKRcyI51GJH5H6FpHJjUBWdBwYtLx4VTdenJhCeJDGATJPomeYEo6mGLbFI46AG
	zyQl9ttQzAm0ZCTg4QaZcM0bkIxvLzVflcicgPv3/qck5rX2EW1eu4CtPp47gyzsqI1Y7PKngZC
	C7GS8eqtYTUs2ZauWGATG36Q9P4OPJl98mFHGADqB5fS91JkSGTMCyttyK0ai8VxmXB1UCKZrGK
	og/Ivsnm9q+DdKmO/Jw73NO0uiw+b7oWaj47ptTNjkwxnMx0OGzHb7FrkFSjJc2QgYCScSCR4Hl
	9T3wLCuTeAssFXbPbnPXIKTQFQl4QT8RSC1ido8KYwcMpT6FdktkpNumqDbOF6WBuxMV/RFMS/F
	dFR2yqY4GpfN8zddE/wzfMScIy6tTqa4OY
X-Received: by 2002:a05:622a:4812:b0:509:31bd:3de4 with SMTP id d75a77b69052e-50ba39780fbmr53426901cf.56.1774640868709;
        Fri, 27 Mar 2026 12:47:48 -0700 (PDT)
X-Received: by 2002:a05:622a:4812:b0:509:31bd:3de4 with SMTP id d75a77b69052e-50ba39780fbmr53426511cf.56.1774640868259;
        Fri, 27 Mar 2026 12:47:48 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:47:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com,
        =?UTF-8?q?C=C3=A9dric=20Bellegarde?= <cedric.bellegarde@adishatz.org>
Cc: lumag@kernel.org, abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix vblank IRQ registration before atomic_mode_set
Date: Fri, 27 Mar 2026 21:47:39 +0200
Message-ID: <177463970790.3488980.11725092140153098793.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260318171700.394945-1-cedric.bellegarde@adishatz.org>
References: <20260318171700.394945-1-cedric.bellegarde@adishatz.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX8BX3bXgWTH3C
 iPSF8+KQIPoKv8xBJDwkgdIkqWefARd9Px0fdqOF4RSXaTyWYjP2QneNjEhD+AxrTSIBL3xdyyR
 Vfiip8ferKCFf1vzSgJjYynrbN1Lmf59duFpwazUmMptcwGvbm/Ry3pkh2EkXpOtHOWOw1FpLQV
 ku12UtI42QDtm/QDEHpr4/qP4Qt0mHgiMhsNrMv8MRu6TwQbkwEOBXYtUCbW6ZorpXikL+kE0i0
 qobxHbUoWGAFgJXFR1S0zT31RVo4lEOsV7aX71ZDMksoaQ7TMNVlqqhIbCAv8wbvNjOaznGIswH
 k3z0G40V84wTlIoWFx65KIFaI1aoUGpVRYN3NgSYbyZOIgsxAGRRyAVpAtmhbLBJWzDE9EJj+Rv
 /pfgo8VzoEWjNfK5QT8P6bYsz4FwepNzn288upg2veD7r57tizsxzu3Km71bNlxOMCGeIxbVHdU
 Ux4xcZ+5ToittJTbC4Q==
X-Proofpoint-GUID: 1xBNmtV4OIltxc668hnkY-CISuGNJl8A
X-Proofpoint-ORIG-GUID: 1xBNmtV4OIltxc668hnkY-CISuGNJl8A
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c6dee5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8
 a=3Bny_bJLngoGic2QnrEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-100433-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,oss.qualcomm.com,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B60F34A7EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 18 Mar 2026 18:17:00 +0100, Cédric Bellegarde wrote:
> dpu_encoder_toggle_vblank_for_crtc() can call control_vblank_irq()
> at any time in response to a userspace vblank request, independently
> of the atomic commit sequence. If this happens before the encoder's
> first atomic_mode_set(), irq[INTR_IDX_RDPTR] is still zero.
> 
> Passing irq_idx=0 to dpu_core_irq_register_callback() is treated as
> invalid, and DPU_IRQ_REG(0) and DPU_IRQ_BIT(0) produce misleading
> values of 134217727 and 31 respectively due to unsigned wraparound
> in the (irq_idx - 1) macros, resulting in the confusing error:
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: fix vblank IRQ registration before atomic_mode_set
      https://gitlab.freedesktop.org/lumag/msm/-/commit/961c900628fe

Best regards,
-- 
With best wishes
Dmitry



