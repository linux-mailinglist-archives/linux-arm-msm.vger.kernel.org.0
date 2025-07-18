Return-Path: <linux-arm-msm+bounces-65703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A14ADB0A97E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 19:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD3A7A44E43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 17:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DB82E62B1;
	Fri, 18 Jul 2025 17:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hL3fYOQC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DD42E5B0F
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 17:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752859708; cv=none; b=uonILrjn1mkfx0G/H2lO3R0UWxDs3PLQQ3N9uImR83uu/CWexaGNqVOX53EmDkp3fY1lSHakRWt67+iagpGhp7C8ld5oeOtto8Ch05t4lu0Zem2G1VO4jZIHlqT8qKanltGkIb4Vk3kj9KSei3cjuWHsyXaYigyjq6lyIl0SWxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752859708; c=relaxed/simple;
	bh=90B31psnyuDI6zcbsl6GMlpN4O29mgnxLtJPusFpi1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GVHpnZNw3K6GYNyNssHqNfduEfCrIMxAA5fuLfS3sXAXFgNCb9aZTdDCg1SUN40gbRF2y7bRMAe6Vb5a9S2vy7lQNC8H1/1TAW395OqGxmjisjLF/yHukYs0cqUleyay7LfVC8vRc2WfHT0B84vSSGO8CeNQezESjNqnClPMQ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hL3fYOQC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IHOJix025177
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 17:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m3LoWx9DJ0TyeqCc/zXgNGefaOcySK/itM7vHhC503E=; b=hL3fYOQCMSzfdzZe
	ARYdewThhNQpHTxU9N5K5FEGaVx+b6EyURyjSKgeEY05Surk9walCPC6uH3da5kM
	moiRe8ECpMYOhbwKNv2N5EZQP99VZA8OMHEFDTFQkoM6/eThJPecHLpCq6DZWWt7
	zLe7E9CkPzejy4CdqKdIifKZEA6CUdob6+dbeWyHbNUXJyxyzuRpmYtrYWX8XYnx
	Jmv9Zq/6pNmnNLa2Tug6NgWZTA+7oXWZn90cUMOOkoFhaz8iYAL1xILGlbSG6zMQ
	vjuQwEXALfkTvBftllkkaBt9BreiI61wcEFH6BvwLbyNUl7JPgYwRBEnUJgifCGx
	XJbQ8g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqgkv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 17:28:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7da0850c9e5so353366285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752859705; x=1753464505;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m3LoWx9DJ0TyeqCc/zXgNGefaOcySK/itM7vHhC503E=;
        b=AkIA0pogfLdb3lZodtwt5qBsB7EoFf5+RUmn04NHuWjfuUSc9oss+qbfx2PtQtQi/b
         lougaSZ3xxxQ6/y8dQlDBTBNPYbXZ5lJvS4QQNwrh4l9h6OkMwVnmli2OQVPf4aS8Hgb
         gHKPaNSJoJmukasMYRp/Eg0slUWqSUekf27pv6pTj59UwaDmcjYRKIA9liPOVUaOgd3y
         LDZgNI6gpNso6swlSa3vWwrVX6AjO+Q89tXsnyGPf626EG3DzeedBfybapBSLYM+PKYZ
         9mN2gtgWasaDEdUmtidwcEqk4D+6XbPsj7efvZF06XFoOxUGVoHQTb1FOVsNCHlAvqFl
         8U8g==
X-Forwarded-Encrypted: i=1; AJvYcCXrocl73iTvKz2yy7rLTwfNooP4PWwd2li270LjEs7JyOvjYb0SHN34nnnn/34+VnW/kYLX6PWbTrfyAqD7@vger.kernel.org
X-Gm-Message-State: AOJu0YzcuzFJZhSGUCNpYsNQ0Lwk3cbJ4gnee3sUIM8OAs9O8O3vRNA+
	Rl0j5epSeXWavrrgHIDwzhrytSGcVAfVj4hMs70r2QMIqaNqM/Ylk9/gWVjeGesp2aGjUVHHbct
	u+Q7hDs4KLVk7O6YpQ6F8RvfpNX9LLeGjf7J8Nus9iH6XSywPYGyai8mDkSxpJrvzuSKe
X-Gm-Gg: ASbGncvgkpIczI8ZlI8Ex73s5/1/0BLZsj1zPGolXr9l4nhvYobc410wWKswSBZpASn
	G/bXnu7Z7uUQzNEUpUHBhR6Am9mXrLtQ9mPaA7m76sJL0Vx9XDHasWZGUA0xkt9OdWmKhv4hprq
	Vcqxt5YgUlcSGgf3QgYGwAw1Xhi722xkhvMUO11jNjxkKOnB3u1IbvtsXLaaRUMdsQk/kEHnR4S
	ztKNuKI0z9pR7+CcH2Cj9r7bk1fLAqmb3KcrkHfcOTqfcGzW5Ckwz6EsEUqPQawfq0k+OgMlTQe
	98j7mU8WX9alc7Ed2eUQsXKL6oR4hedFB4+tXdl1yyrgKsrktolkUs7y1LzCuDdmP/6z36HvVzI
	asOKAveuX8Z2+/UxlpLVSR/qOXCnWis0GnQPRedePHlH9Z9lSf8Ij
X-Received: by 2002:a05:620a:31a2:b0:7e1:ef9c:551b with SMTP id af79cd13be357-7e342aaa43cmr1705213585a.14.1752859704673;
        Fri, 18 Jul 2025 10:28:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHi1fx7XAxIa0TvF/aFCXfwm8ex0+eb4Ytu8ukrsy0ujfZiAFNB/UKSTVvQ3I4n6jhoSky01Q==
X-Received: by 2002:a05:620a:31a2:b0:7e1:ef9c:551b with SMTP id af79cd13be357-7e342aaa43cmr1705206985a.14.1752859703989;
        Fri, 18 Jul 2025 10:28:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31a9b71esm334910e87.30.2025.07.18.10.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 10:28:23 -0700 (PDT)
Date: Fri, 18 Jul 2025 20:28:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm: Don't use %pK through printk
Message-ID: <kb7m3ybmvpt6ywbzawjeqzzxpinc2k7b5hgm5333gay557hxrv@swg4dz4sh7ft>
References: <20250718-restricted-pointers-drm-v2-1-3d9f8566f927@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250718-restricted-pointers-drm-v2-1-3d9f8566f927@linutronix.de>
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=687a8439 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FzZ3ZiyTMWqXPo3om_sA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: mUWh7a3rD3Ih6Ho9SjarCTwTc50eBZ-A
X-Proofpoint-GUID: mUWh7a3rD3Ih6Ho9SjarCTwTc50eBZ-A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEzOCBTYWx0ZWRfX1SCMvjeRuhBo
 e+JmpSTIGSKA5TLc+8sE8iw4kWm3aMt+KPTsH+m3U589AgWoZSV1rcTSCwavbTpliCIOIxpAp4H
 VKUDiMejLLNMlKxFZZFzzBnR/KhLozbFYW1R3qoPhjQsgne82dbaoOLvAVA7h1lrq4I4VQbielo
 tGZyoRY1nMtKR+a5bvJxeg3/WIojNoATT+KOncpYWy0sF08jMju1eGT/JPh8wpsooQ7DMfK11Xs
 /b9FTq8rzmaFDzeDltAoD+wuMPu1kqU0RDgISOwpryHlT2LoLhgBPh+R3MFr6CDdIIcNDke+LIl
 y9NQUaqVrJ7kkVJzzZbVhqfa1PIij0Xdx0OinnHO44SH1CKNlZZlExZEmZV8iRtUXpsAx1qeOUO
 nQehCETRziV8JRi0tFp5GLPiK20d3lMVnnRZXWnP1wWZDSG1P5BaURBiy04ExnYxuZKbwhYF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_04,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=946 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180138

On Fri, Jul 18, 2025 at 03:27:37PM +0200, Thomas Weiﬂschuh wrote:
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
> 
> Switch to the regular pointer formatting which is safer and
> easier to reason about.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v2:
> - Drop already applied patches
> - Link to v1: https://lore.kernel.org/r/20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 4 ++--
>  drivers/gpu/drm/msm/msm_mdss.c              | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

