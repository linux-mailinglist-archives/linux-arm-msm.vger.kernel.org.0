Return-Path: <linux-arm-msm+bounces-107408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBowNYy8BGrrNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:01:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E301E53880D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF3C63034B37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DAEE397347;
	Wed, 13 May 2026 17:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mU1hYuZk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/kt1BkB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD224DD6C8
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778695063; cv=none; b=WnBwP1sR9Yurc+4PfXGcdIMdZb2iluq7qWpl42z03AMgor5LHuu42MJLLGvT7oRjDd/2h7+QHqeiUb+IQAKPTcyyVNqMuhOjUh0xszFnIyRPhFiMbv+o/AYK656yiH16ig5ipq3t/rc4CS+QUCLIqLaxlOfp88Tmh+7Jw0P07rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778695063; c=relaxed/simple;
	bh=JRtvbQ8QxYw13braQVEr2wIckkNTLwmQHTaR9vDx178=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOMAs87UJJLteiwezF6K6ar0FJpeyPK6HG9RO9sztKE+HR+fKRPzdOKI4AT/JGlDI51/DLLTg25crOtlHQWODEkAbh/at4XLXxqnHGIwyOAX0aatow2LHu5o/Xm7mhMjHwIJaVla43GnrcZw2HgJ5MzlNzu22IezH6gXLX2+GqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mU1hYuZk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/kt1BkB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DHA63k3430122
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mMie+CI7fOWywl6kF6h6N96e
	rnFrXS2fN9VjDSUGY4s=; b=mU1hYuZkcOu4TnVf24ssSjxq0iGXPCqiK9fhfpFw
	/nR4/pQhm1S820fJd12uRFzF+R/hseA/A3r+HqM9SRa+JCktFAVaL7VgRipAsukj
	9Rj59tw4tjuUJM8TFMajl75npH5E4wpsAwRfpNszIf3gGUE6Kc5Gn+PDqNAd2V5G
	cQs16fJO2t7sUoFvyC/huzNgYTrNsIg4GIJj+rb97+RDmJciN3MLe9Q1ZqE+oeEL
	ZoPpUSZ/mDJLGLwgon1oWrI7JlT5Vs+GUjTMMt6gHzryF4S+8s3mRMASej0KjhDr
	Ih9i5msLFZodVD8ag4L99QlXLYloS+ZzDfnQDffBs/+j+w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmchrkj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:57:40 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6313c9d983fso2945262137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778695060; x=1779299860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mMie+CI7fOWywl6kF6h6N96ernFrXS2fN9VjDSUGY4s=;
        b=P/kt1BkByT/Obw+Zj+HDUhQJuyJ803J4RJfK/p+Pt8WyJ1s7WWsT1W0qaD40//if2f
         c1LXo/tJOZ+5OSbyQ89H5WkARh5J/+DtVgwfXYkNi+8Z2NxgMMYNwkjSmoDbu+MEFHgr
         ATbTUOgeuV1XId25l6gGpOzVya9kwQnCUMW1XCXEcYKZyUICQIO4NDS7itrbvESOzukD
         cgIhi2q/iPgRQ+fnt6CyPXgiZskGmUPDdXYZ/qSyPlDW/8q4gJqepbNWOWkP7CxdnL5r
         9u5QX634i01Iyr2yp72ctDxJKLgxjDBZn6ZIb48yVThbtAFvieVIWKS972NGWcI30Pvu
         Ua9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778695060; x=1779299860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMie+CI7fOWywl6kF6h6N96ernFrXS2fN9VjDSUGY4s=;
        b=ipohmVkqXLmArAePl5JQ2t8GVeo8AYX6JKG5afh0LXBmMtlsos1wnm1TFrbw0Izy0V
         fUt4fk9t+k0Im90IVHUcg7x2hxcum4wS3itEb50WOC0fLFjBApz9bjGvLHDLWjpMboLT
         P2M7rcNOS4pcg8DXNcmJgVBaP98THKVw8oa/AYp1Q9vq7bBO2q9lFErwmkeVUgooAdPk
         WIj5d937qhSb80XFyVB2O9IHGrfCSABBxvHbf8n4V0fJdZONWeAh6ywreLlr7FUc9aga
         FghAEOufEAKyqZUNUTyCbiYw2+oNHDb8CdQuyBAPzp52T/ZCEXTYnhShhVxhgXqwxi28
         AqsA==
X-Forwarded-Encrypted: i=1; AFNElJ/4Wib8fYmTweAgU1gEV5fctNXZYZdj13UwM62SkfN0VOPKaDyQHkOgAAXyLMEdOHhisyoFFJlmMtIiBiBZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzlKTNFdAMJsph2IoooMn9/QldOMl9q6/5MM+DoQwexwY5rGWdC
	QsxPIVIlso/62IOnoTWmStv9peMNgxGNkefAyCOG9SLZhIN+C5rdlTiFfov95Y3XSo2H7RAz1qR
	aRiVaDygB1lB7XZEcTDFC2Il1BD9pc0KyXESvQl+EBIvHAbdEunIMz9WkuKGpm4gGTSg2
X-Gm-Gg: Acq92OG12OTQ/FGrkdIqB/ppqBTU5WnWwnNI/C/fnwKKOTSYP58XT+QAC4OPGpqQm/q
	agi/tZ9Y6+oEcQj9Sz+fqAAIrDNBFjK2XNvkySoc46VO845zvklYzyx1JV7pVcLvwlYkb8S14uC
	hUnO/FE5H19SGyarXkJx59RAqqqXrm4mQF9p47DlmHqRTJsZIvjfQTy/msssZ9w7XIkt49s8ilU
	5gTNcmqYC6WZIlhuROeR5Fru005XPqijtNZjjT/eyn9HE59JtSdo7Ofre4dKn5W1nmOVmS9rpzJ
	9tmYj8oDA0WauzYK2Yn8kilTPQuM72i1IZG6X66XRna2MekAv4s4/yNYUWf34zTwdcyimwVNE3F
	Su3XwoCgXHuVPJQOS8/0lD7Kt4J94TXFqTxLp7/xsfOXMYro4MCn6qzgQBDZadckGo4QNCyeyEJ
	8c6I8tfcR4l2r60b3g8T3rPGlp3cRKfLO+d3EMbtyorgEG9w==
X-Received: by 2002:a05:6102:b07:b0:631:e729:4575 with SMTP id ada2fe7eead31-6377156b7b8mr2460637137.5.1778695059852;
        Wed, 13 May 2026 10:57:39 -0700 (PDT)
X-Received: by 2002:a05:6102:b07:b0:631:e729:4575 with SMTP id ada2fe7eead31-6377156b7b8mr2460622137.5.1778695059390;
        Wed, 13 May 2026 10:57:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8bd7d8974sm3167182e87.64.2026.05.13.10.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:57:38 -0700 (PDT)
Date: Wed, 13 May 2026 20:57:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
        Yifei Zhan <yifei@zhan.science>
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: sdm670-google: add common
 device tree include
Message-ID: <fz4llnqzz4qx5xcp6j6xswtkfmalzyxm3jwycl5yfmn6qhc6n7@wa7mpngjeykr>
References: <20260513172549.1345-1-mailingradian@gmail.com>
 <20260513172549.1345-2-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513172549.1345-2-mailingradian@gmail.com>
X-Proofpoint-GUID: hVEoP6mnjqCufdkr1h1hm2pCU1QqDUvb
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a04bb94 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=byJCrBVNwhKw5jrXw44A:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3OSBTYWx0ZWRfX7V/qCblN+jDN
 eSCXdtfF0tvxLFVdsgboYKC0cRu8QSx9MbeF1zRH7Vt2b1hH/hHDOBGvSolEDKN+NQHpv6MzCaR
 3Ww5tNMBrokHPvsqOCnC9uSvBH/pMSr5r9XiDttPHFJAQcxwUOm12HSbj4djA1xMjVTH/MIO3Ko
 tVudjL/9yK7kOXSHnHfj9sKW9/UeRAsstEXM+UcVZ3T48d+8OhbgmSUZsjpUZKJySQx1CRmoCDk
 svVEfkmTCwPxzptZtRrHkz0zbv/54e7HtXX83M8Shy6RgRnDpcvNELnHbUWoqwQEjN8wVn9dyBo
 uGYfkGpgA+e6NbGHw/J/j9HC72ojXH4q+P+eygyaMwGOmYpWn79asCoeC8C/EPg4FvNEtDsCnyd
 hJnSeouDUTyoLFVZ/4tAevsIF4dJ+Tw6EcfNw8Gl/od9fbbckgbGmmRQjF566iiICwRNgHbbrQt
 pwYVpAdBvvA5cIRlz0w==
X-Proofpoint-ORIG-GUID: hVEoP6mnjqCufdkr1h1hm2pCU1QqDUvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130179
X-Rspamd-Queue-Id: E301E53880D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107408-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linaro.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,ravnborg.org,lists.freedesktop.org,zhan.science];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 01:25:48PM -0400, Richard Acayan wrote:
> The Pixel 3a XL can be supported by reusing most of the device tree from
> the Pixel 3a. Move the common elements to a common device tree include
> like with other devices.
> 
> Since the original devicetree should only specify non-XL properties, it
> needs to be completely rewritten. Also change the SPDX license
> identifier from GPL-2.0 (which was deprecated as it can be
> misinterpreted as GPLv2 or later) into GPL-2.0-only.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Assisted-by: "Claude Code Review Bot":claude-opus-4-6
> ---
>  ...le-sargo.dts => sdm670-google-common.dtsi} |  22 +-
>  .../boot/dts/qcom/sdm670-google-sargo.dts     | 714 +-----------------
>  2 files changed, 20 insertions(+), 716 deletions(-)
>  copy arch/arm64/boot/dts/qcom/{sdm670-google-sargo.dts => sdm670-google-common.dtsi} (97%)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

