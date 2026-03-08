Return-Path: <linux-arm-msm+bounces-96069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMpECAqqrWmE5gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 17:55:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F2A231438
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 17:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83597301A7F8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 16:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656D7344DB5;
	Sun,  8 Mar 2026 16:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GbasPdSL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bs2Poc0P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F43A349B1C
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Mar 2026 16:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772988935; cv=none; b=a/NK0fUOQ8bLCUMhwdytfaDwfi0G1CGHVR0ar/XLbi6XIbDGwkImPANxQ2inRCUWc7YXF/QH6RYh/AXIxUlt+Yx1DMlbMkr9Ie89Tw6izdWpGj9x1u3SZ2Tlv2hcdbCcn7MkHpeh/nqfK8Gzw2Eszj3nZbp7iiM4hm0tgqrpq/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772988935; c=relaxed/simple;
	bh=mkdbw183u3drpbXIuf4RnlLyy3YTu92xx/cTa986zZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYgwJfbU7hKoGn+/RROU7Vzx3NKcQ97yWdBBxzGQteDtYFYNryMyoAVEMw/9Dv15zicc6Oz3tUgdjZY55txkJYlYxA8xjzdYLXkLxMfTo0PGf8lMZMH9HlsifE4VZlwd/mP4nMztG3XIV5hC/bh7fZk852prQcaBl4uURDBG7SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GbasPdSL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bs2Poc0P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628BbmfH2108105
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Mar 2026 16:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zR+AF/0MXFFus+Zm+XvGXicb
	OlDeqrhcCp/osYW0yXA=; b=GbasPdSLyOmfFetceiARVv2UIm0uQ9FY+GDyfQzk
	+X1CwpX27oBVWMw2/0yJbGm2EI1Su8w9I1XzAnmCAaTS5U+uGcI5KEQrTPN68vb6
	qpMnTFZISBVr5RF3yQ0SACknmdXq/gdKQW4zLsp4LurHjmb7HdeJCYUNdjT1ikk0
	dIefBcyw+SYCsq7Wh0mleJtxqgfIPh+BreZScBOWh6RWhGMohtoA6b9DgDJVtaWN
	tN1K3/OOZo25VK63nXr0VtiYZ6bX9FM6QMkcnRGWeatnQNh2dGPspPM4vlCRVILt
	6TR6DYNGyybNq7MdEhbGn7inKEMfjVOOkQf37QoImRDkcg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd8as0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 16:55:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7fec8d44so407666485a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 09:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772988927; x=1773593727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zR+AF/0MXFFus+Zm+XvGXicbOlDeqrhcCp/osYW0yXA=;
        b=Bs2Poc0PLKkqstEkJGsTgU1DMnPUx3XyA5UJ6u9b8dGHoZXPq5j3ee/WEyaCh0x0XH
         6zmCBTWZ6Nyc9G/6u7uIUumg2wVaPI6VroKR1Am8ldrxOHUKYLdoJDWexDAu39qL2aWG
         +ZYxiVlHPLUcQ3Eat4vYka8YEZSQKuT0TV24z5sOty7uwf22CdwptPSFpWqSHDV0H8uq
         +k1e7TP+xNVs1MSA9dOhvmRkMCaHloycr5+C48zIdBASoZhzqtX3tDpBm8hO2XSxii7/
         +fsAHM3fLq2TRVqa9rukHeHgKoljNTRfRpninRV/dp8pwE4HdhtMIOgaM4fOMkZIfkWB
         LXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772988927; x=1773593727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zR+AF/0MXFFus+Zm+XvGXicbOlDeqrhcCp/osYW0yXA=;
        b=ioQJ65GwoJThv87B8hlONXddAwKr5e03++dMm4+WGMvQE7s7/zNEmDxC4wUGzgV19g
         O2ZS4tlgiOdaFLMKQWrNLFogN40zFsDAJjJaMe+OkJfi55cKYx6bOe4BDNyWyu7H22qK
         Tlu1p+C1bURtF/tqcMKMkicvSS+g/cQMmwrFmrH+d+dNS7O7e5PoA+l4XUJHCeXhQR9x
         SIiL4JyI377ME1DYSULVTc4HdH0xxhmYZxgCouhi8AtlibOoWz9lLYqXf2qiBCfHgeo3
         NJBsCyDYaVKBrUEuU7eKsQRKPGPan1NOJo6wNSDaE8WihenvjvUOTtLq6lQZsejRcYXQ
         j4+A==
X-Forwarded-Encrypted: i=1; AJvYcCXTmCpLvF1ZFUDpV0MkYeA9c7L3cE55fbbErwJfW1JbH5lYuYSSTOFKFzRKA3yOl4h4Zu2GfgUdOfArlyFi@vger.kernel.org
X-Gm-Message-State: AOJu0YyZAgDAgEDA2xTzcJX797LYcqCKUkX/1xFHfXEFb1WruPi28AKx
	8/zlydkZIFemN/GBhmLAr9pos2gfjtAuIaSaI4VCS7WJFH44mTCESX8YH0RX8231J2HW3nVSIu3
	Lh/BL1fU1OcpSmWrR4+/qQYXajqfEuX79BpfdMNBYRMS8WLFlw4KBe73EtL06skiw21tq
X-Gm-Gg: ATEYQzzPoCFxPMZZGWZ9l8oh88II/CJXmab/RCUq6pGNLxYSNKGS2hCSxHNDmUC4N9y
	snnb79HjV2iVlbGEUt4fQVvFEBWSKZ27WTLImtI0vS5PgUxcFLxYsi6bA5k1qPtLGPJZgM3AIjo
	wOozNhg6KLdM3knL9S0nxspm9lKRHNb+msrOQOxpZTBQ2ew+o0hri8tHJctBUfHb54iyM/SqxtQ
	v9PbBRIAxl6EfuC9W1Bs4UyukYgwrUjd43tEyx+h0dXlAPlYuuNiDQgD19lOl6anY17iNjPbCt/
	lvHcHtVwrxqlHVEGRNZjOQxmuFP7/FErgTNa010C8LW4T/XkfCVknlEbkTdvBuX+/3VbUOTT+Fr
	yAeAaqR4yJ4L+jZAqudo5dL+3AGkbCvmyUCW0NDxZrJFAFCN9nXCS14D1dAG9LDL0LLygWaveqp
	///Ne1dSlyv8C6dnyRHYlLdJChPOqDwFWHPeQ=
X-Received: by 2002:a05:620a:46a6:b0:8b0:f2bd:4762 with SMTP id af79cd13be357-8cd6d4aa038mr1050258285a.75.1772988927083;
        Sun, 08 Mar 2026 09:55:27 -0700 (PDT)
X-Received: by 2002:a05:620a:46a6:b0:8b0:f2bd:4762 with SMTP id af79cd13be357-8cd6d4aa038mr1050255985a.75.1772988926629;
        Sun, 08 Mar 2026 09:55:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13f598ff8sm1219628e87.16.2026.03.08.09.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 09:55:24 -0700 (PDT)
Date: Sun, 8 Mar 2026 18:55:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dsi: fix pclk calculation for bonded dsi
Message-ID: <jcrcq23c4e47dcvrrucj4jqwtjcuaa5qxkbckwp73fqakpvdxh@r44ykjcl3u3h>
References: <20260308070628.482527-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308070628.482527-1-mitltlatltl@gmail.com>
X-Proofpoint-ORIG-GUID: EBbhSxx8fNf4WYlW_2j2lN4NeB8PZuje
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE1NSBTYWx0ZWRfX/SBABbvUowZY
 v2euywpC/XPPDKpBXJtwGoDzgT46xFje7+7SH3LmAhh4O7yYQJ3O/Pb/JW9iPOzSuT0TNCH59gS
 mtMZBRefDXlFbrZ9foLQY4FVsq7p0HGzTGD40Ai04WwrfzuObU15tHduZr9/79R0/XnyPQ/+UYw
 PHs7SRd8toGBRJf7w3O9w6p1M2e9OGYQSbE0wDcn3iRwmiZ0w3/+COfvhF6/FcEAXhC3OJE746D
 QVE2Bx7I/pbUPRbENOFtcq8j0W0H1P59C0sD24ICUJl1Fy5H7vd6mLpRfKw2UcgvSf4CVEpe27R
 xJZtPG3EHkKLp+iNPrWyzO7GK0njuyna7XakdknBvFiEBEhcZqz8Rk27PjrrhfmeY9jSnqpAapB
 GsV7hak4eFb2L+44GhIQcKLoN5jotxCxMQ2Op7uXGxIB8toDRgpjMpsLVAErh73VYlBkSbxt2HR
 8pdDCI7IzOSRbN7SRYQ==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69ada9ff cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=Fte5J7dvKBLabNbbCpwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: EBbhSxx8fNf4WYlW_2j2lN4NeB8PZuje
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080155
X-Rspamd-Queue-Id: 88F2A231438
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96069-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.973];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 03:06:27PM +0800, Pengyu Luo wrote:
> Recently, we round up new_hdisplay once at most, for bonded dsi, we
> may need twice, since they are independent links, we should round up
> each half separately. This also aligns with the hdisplay we program
> later in dsi_timing_setup()
> 
> Example:
> 	full_hdisplay = 1904, dsc_bpp = 8, bpc = 8
> 	new_full_hdisplay = DIV_ROUND_UP(1904 * 8, 8 * 3) = 635
> 
> if we use half display
> 	new_half_hdisplay = DIV_ROUND_UP(952 * 8, 8 * 3) = 318
> 	new_full_display = 636
> 
> Fixes: 7c9e4a554d4a ("drm/msm/dsi: Reduce pclk rate for compression")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> v2: add a parameter desciption to the function doc (kernel test robot)
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 32 +++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)

The previous version has been picked up alrady (before the report came).
Would you mind sending a fix for it, describing the parameter?


-- 
With best wishes
Dmitry

