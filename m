Return-Path: <linux-arm-msm+bounces-97827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHTmIHF2t2nxRQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 04:18:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F05B2945AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 04:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ABEEC3004DB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 03:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CEB3191D0;
	Mon, 16 Mar 2026 03:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgZY4e3T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f7DWqD3J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B95217A309
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773631082; cv=none; b=poeSmCnv42kqye4SI3gxFzoDSoT/o9X6Qu8PhI6ZrmMPHfFWTR3nLM99D2unTurU8Y/B/Bs4U0FjwEgrJJasXCG5Uy00+PUpLH4P0CLPKdQwhoBlKYeDBwXzQvbRLGP4jpQdfC4c9O6p3rN6ysuOYvH5whLyJQuLhqVLEspJQc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773631082; c=relaxed/simple;
	bh=MQIo7gOyraSVkhGD0+E4X1EBQG6EFoJcEyMsVDYUAJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkkKP3H4S4AbRQSq7n1VjypW0q435KEeNsmDJhgtBWQznll0Ane1378dVtHXgImJPvN9ripECL81dReEXZvXTyDPwMjdu0ablfMNZvUqgJq/pGpBFgVJnbkus4JiIyCrMCTqw2TxF3tV6JFECcFq04bPEI/nEbobDJur0RjwZwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgZY4e3T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f7DWqD3J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62F7UPKX3165736
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rCtDtvcMPIIzhmO3lBZlD8BEAmaAtTPECV5u+wA+9e4=; b=UgZY4e3TeFQKHPMO
	r6LQfQJeV3Qn53k6CAeodM36D4WHGJUBdYzlZIXc/BaPfW8a4pgN7bjOfVsynI2N
	4Gv5Li7Rnv2mB0OkuRDUdqsLM0oG2nJSwc3vrGaGbaMWsDCt4ZUb2H8htU2KrH25
	iHaWq9Tayse/EPVAwFxjFj1ZN+amDyJfKe62a/OSx7yB3Tj2Wq0+djVKl02iBTLu
	+V+RoXafAEIan1xvli4t6tVnn3g/ZT48KW2+uGJh1t1MN87tuxjK2pg2nHZF29pM
	sAuB6k7L09ullyq6vsD9bM2Pqk6cWtoTq1R8YcJsI03pxTjWg9taQOUuAwY29Mwr
	JbGu1Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udktf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:18:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd781c0d90so3016623385a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 20:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773631079; x=1774235879; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rCtDtvcMPIIzhmO3lBZlD8BEAmaAtTPECV5u+wA+9e4=;
        b=f7DWqD3JjD1nxrnsM+JR80J+ZzSVLlmmx0/CRK2A9AB2nBjq4/j4pKB2rCO1PL+5WE
         Ap8+fqh5pN+Ddgui3EYCQXhZSeg8UUyPhhEGdFlI+ZA4hY8bF6kwf9yqWYu5FzD//7eD
         pQQ73SEBPwmTR0fBX/+YdMUS6STy+aPp5yZJ2sBeA3sPFnfOKKClOeu1bJMWWC7lJNTY
         MFJsgsPwAK3KxtzpbbNHdJln395C/nFg6whXhX8OLcvYoRVB2di4eKLVd7eahTgBadDb
         E09Ymi2W6wOLCTX6zIfrgfavYTUCQ5LWFhAfhSG39xO7e9EsOgRh8XfMuVhHAWXhWB+P
         KNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773631079; x=1774235879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rCtDtvcMPIIzhmO3lBZlD8BEAmaAtTPECV5u+wA+9e4=;
        b=HwfPCFWbjrpEPHDqkLXvy8czmxkcp0Tq0aSzJ/pUYMGGIPVilHm0TvkG+hQ9WQAiTw
         L+b1WgUXzqkEYxIigczyu7/uS29WwfaXKpnraBsAnPuXYz3UaJoZ+mDj3cjiQZNhx3Hq
         pivv8tsEM5wqSJjfP3/nPGBPrInqlZrNHgdyVotf6tBmqDwpd83Lw1JLN/LVUF7rEH4Z
         pOJcVjQZNsb//u8qfACx9S+1mRvEWYdo206nalVn5MDSTlNSiZNdMrvnJPK/cslBStpe
         /+SE69caVHG6tQFx59m1Bkr5tKPn22iGX40ONb8Qc6iB/UQ73cOB24OuMPLPYORvphfH
         L/vw==
X-Forwarded-Encrypted: i=1; AJvYcCW4qYf1IpDN3G0PeacTmIA6/xs88/tVfXnlsHf91PLT69UoX52Zp9i4wcHfWu1QU9BbwPIdwfzeI7V3IuLb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3B2FTF5yylfv8OrJlp8a6zwCSLtpMVHitD+D2S7J91tNzgDPq
	uSvA27TEMehs/g2uOkiY/w5Ix00SfEvnJorjJ3XTyTrHpuSrXQc36PHoMjAwy+EJTRdQPZI+KLw
	8XMLQjfc3PycjbWhGWifYQEvHtNSai+FHrHHwyr1AEd6ycmemNBMv1pi0VIxhVUd4BB9G
X-Gm-Gg: ATEYQzymWKyEsZaVWqVv9OGUF9J1STFUTDnAZALo1goGMho/knc4LdfsdA0m5Ob57Yi
	+UFGOOrKAsatxkES0Qx34skT+7gVRmgdHfHG7TWj34ls6SQ9sGBuqpiAJYGYF5cULORaaUe/dAZ
	NlohwRlhpjNJPsm2K5FLxr96EnbpP3bZ6Yxw6nagaUe9/QQuHklLOzCxd/HHEz/+pO9XQ7EIU1R
	jKxeH/arZmRAMHNCpqtj7seGOFxRZO/8WBpjET6DM1YM0mwyXxWW7hHpoMG7f86njf15pJLYAjB
	OrStXoNlxayYFi3vqXkUlSO74Lv1WtHmaJalQm9ktfcH1O50GCqGywVDfT803LwA657LrDF+M5+
	ocSxg4IAwsWHzlrlvTZnF7go2UligScGGPOUx0D9r18z8+k18vUwtTa99s+5Zv8srdxBQAsq+cV
	lcaW5ENa3hgz+lhOVVHsiF/UHjgMkqtEaxjH0=
X-Received: by 2002:a05:620a:29ca:b0:8cd:85a1:d136 with SMTP id af79cd13be357-8cdaa7793a3mr1718925485a.4.1773631079323;
        Sun, 15 Mar 2026 20:17:59 -0700 (PDT)
X-Received: by 2002:a05:620a:29ca:b0:8cd:85a1:d136 with SMTP id af79cd13be357-8cdaa7793a3mr1718923685a.4.1773631078859;
        Sun, 15 Mar 2026 20:17:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e47csm3234895e87.28.2026.03.15.20.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 20:17:56 -0700 (PDT)
Date: Mon, 16 Mar 2026 05:17:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kaustabh Chakraborty <kauschluss@disroot.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/3] drm: panel: Add Samsung S6E8FCO DSI controller
 for M1906F9 panel
Message-ID: <36cglvsoch5vvlyyanyh4zuqbpb3mxlb463dh4zddr2ceu6kwt@mbmcwckg4meo>
References: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com>
 <20260314-panel-patches-v4-2-1ecbb2c0c3c8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260314-panel-patches-v4-2-1ecbb2c0c3c8@gmail.com>
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b77668 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=sfOm8-O8AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=8s1cotv8QL1OgUCTKcIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: giQLA90rVIORzvolyL80IYsNCWAiDxVb
X-Proofpoint-ORIG-GUID: giQLA90rVIORzvolyL80IYsNCWAiDxVb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyMyBTYWx0ZWRfX559uT+CLJcwG
 qfu49PztOlq3moNwWRvAb4X+wZh5icxPtw8DegqGJa720EGbVLl80soKqCSTgnqQrZTgmHbksW+
 yu/JzJVhc5yJopDn6i9Cn2FT2kyj27d5n1XC/tJt23aAgzsan57kj254esSEqEaJSGt4ze+/XqK
 c8JkgI6eI+1Iijf2artQiNEVd15IMlC3kVh5A/bcicWgvMS0s9C9PrEPJ2pPP28hbWdeRPiv2ku
 LoD2q1A7wGxXADgLGd8GAeKI2JCGUwV1W/wVVx9YxqueBot7R/QxHCM4DiRHHjHPOcX1TNEnHrd
 2SuQDNBmxUckXtd1gyp2wBKmEWb9S/VvDtpwPNmiLTRDzmAfVL88iORk12MNP70GuFpF2a5HJeb
 O5wqsG1xvq02U4+x42YdLWCLRnrBQGSGUmCLQeESX7wF9mNHjZTWLFlzsDzsetHPPWOafC9boC0
 lIAuROw8nI2zBrCPM2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160023
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97827-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,disroot.org,lists.sr.ht,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,protonmail.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F05B2945AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 11:46:22PM +0200, Yedaya Katsman wrote:
> Add driver for Samsung S6E8FCO DSI controller for M1906F9 video mode panel,
> found in Xiaomi Mi A3 mobile phone.
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> 
> ---
> 
> The downstream dts claims a max brightness of 2047, but seems to ignore the
> MSB.
> ---
>  MAINTAINERS                                        |   5 +
>  drivers/gpu/drm/panel/Kconfig                      |  13 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  .../gpu/drm/panel/panel-samsung-s6e8fco-m1906f9.c  | 301 +++++++++++++++++++++
>  4 files changed, 320 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

