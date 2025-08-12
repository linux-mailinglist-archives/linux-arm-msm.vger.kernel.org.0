Return-Path: <linux-arm-msm+bounces-68746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 638BDB224F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 12:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1D051B6671D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798302EBBB0;
	Tue, 12 Aug 2025 10:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SaCptQg8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585212EB5B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754995889; cv=none; b=r3Na7jePvr+oLrylnkzdDtm7aePVh/GyNEmiew3mtoCCVwoq3bWiyVOjF/G0Nd3SeSgkqUoxNw6Mb+fb5okFGqobmH3nq8iqq+TmZwrkSqyIljY7PIklft3AAL0Vwir99W6XjzUiFNIClSdOYbgqdtxRHcTqaAoSlUVTsegXU5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754995889; c=relaxed/simple;
	bh=KgnjkLOYLkDSwC0GXwfOBN4C4F4nJHESxIsZ3ha4nMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDkttjxoorj94sUw31qBXZKjensssC0n0jN91LAwFPaT4JO8UzDmlItDD4tM4Fx+CDUyuWWIuW0jqOmO+AJVYYlRokRRmC2tmfn+chBA7/hQ63zJC+6UCfv74fu/LG6cwrdG6ZpFs3Nc3pgRYNzPU6kGNb84umQnFVzKAZwO5VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SaCptQg8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5Y0Pj028829
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bhG7bDwD3mvvB+arfoW2xQRe
	XiSpPUNHdkakI97zRUg=; b=SaCptQg8OXr1fB+vzrIxE0gIdTuUI0OSlqiSVAo6
	hv4hYpHddXMK4iTZYGmZ8+1Lako3QGbjomeNsCXme4kAX/1sjY+F1/N1OF4jrRiP
	zOvg9fWQv92SawDa3fmv6U47AtfmwoItcptGQlG/kvI2rzkY09rivUwjxBNCqRzp
	kCs4TW6w4MrIveaRol49orOXOPs72DmRCL9wjyU8w/TlR+Unlv1UFybeROkf1bde
	uAjOehhWjcWN2le9Z11GKckLtSi9sY3tmD7JRlA2V5taolCJhDrdSW0w5/1oBDzO
	HvGs/J94Zqsp6Ceta8DBr8qUSRi324lFr8xQGgi0/CDetQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sr0du-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:51:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7074cb63bccso104703386d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 03:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754995885; x=1755600685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhG7bDwD3mvvB+arfoW2xQReXiSpPUNHdkakI97zRUg=;
        b=qbBRYlyJxkuOuVBm1/yUs1L3clsnGfoaFh9DdQbRjJaZLoEmjX4SnxvzJ+g0HzFo4Q
         O6JnzB2PUW6yEwJlzL5FDKLZ4snWlJ0b1+y7EkUQLBTCarpTJ7gYsDZR/gQ2d60SVngm
         wSTsTFnHKCkScoq+k31L5P9Lj1SerY+j/BrHJLSp049BMDWyGGyU1GZ7AX7Kf3Ff05PQ
         91yy1ygC6xZI2R+PsbUpmJrxreNCNDfot0RW5nYkFNgPgezZAqHIOUn7SFIniVD/CGvr
         z44efHEQAJCIOZdaRACdV9MlBQouLFFzZJGJXXgkQuHsc0F9i1LfUojWNRutRdfV0IYT
         3hXA==
X-Forwarded-Encrypted: i=1; AJvYcCVlOIDnUr2vX5uyL7NUwoOdigZCl0To09OkGdlncHYSlVhE2VzMhIdbfUbFOvoScrGe/yq/nsgauNQtWLjI@vger.kernel.org
X-Gm-Message-State: AOJu0YyrHHBvJFXPxLKdFCCd/4aYQxjw5ASd+b8lEAtcKKjB73qkmqgv
	+40AFZm4d5WUxD8h1DDo78HmbSLLVPhWnC7xdtKfHeHSlN9/S/PJIrnS3L0Na10eVAtD8iQmGNt
	NTI05aQgleeAh3WdLNHC6R4M6eplesrvNV19Rpag15//BYbP21axpFBEdUkY7HYxXx+D6
X-Gm-Gg: ASbGncsMrdnGeLBd9eCpbfq3pbw22zVZytOkJZ7m6nr9iqL8jwJKpLIyHCZv5Q3wVsT
	GhPN4O++UWg/iuIbEddVnojIOMSGqNtDA4ItQXUBeB/8Kf++SBmIs64ykKwW8+430jyz90o29vr
	V/UnPPpZlOnz6Dr7HmyfdEIThTjkrhgkwY170kyzzsrJTDTsRL/jHTLGgbGKG+qLC5Ai0U1YdLW
	Q1ZYU54aXMAWGWmXoTqn2LBaBDkfllNoidMmHM0hjGg7YH2mKQAub7xeF6z5f09MoFTPc5dXMnL
	SzvU8axtYLqfDA+FpPt7glJr+D+vwVNkXFXpEXakQxbMtOv7sMPZObyL6yobXojOciHKVnRt255
	+fTz1aDl+v20gPWfkD6I7rpWkio90WgyNVKHqvJVqHeaiR4Zsm6M4
X-Received: by 2002:ad4:5dea:0:b0:704:8db8:d3cd with SMTP id 6a1803df08f44-709d5c76484mr34563936d6.8.1754995885266;
        Tue, 12 Aug 2025 03:51:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDlfuS4Nwz3fIMIuFWUdbpX9cZH7Wuc6mH++YEeE7VTQQtOIc09mesMedO5BiAjMUO345wxg==
X-Received: by 2002:ad4:5dea:0:b0:704:8db8:d3cd with SMTP id 6a1803df08f44-709d5c76484mr34563536d6.8.1754995884789;
        Tue, 12 Aug 2025 03:51:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889ac341sm4628423e87.60.2025.08.12.03.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 03:51:23 -0700 (PDT)
Date: Tue, 12 Aug 2025 13:51:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v4 3/3] arm64: dts: qcom: msm8953: Add device tree
 for Billion Capture+
Message-ID: <b7qczborzhw7slea3mpmwp5lbcawurvgkdhioqener5ph3hbvg@kdvyoqqv6xy5>
References: <20250811-rimob-initial-devicetree-v4-0-b3194f14aa33@protonmail.com>
 <20250811-rimob-initial-devicetree-v4-3-b3194f14aa33@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811-rimob-initial-devicetree-v4-3-b3194f14aa33@protonmail.com>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689b1cae cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=N6ARxV_FePN732dIbUEA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: j8kw6vnlzXfdB6aNwWUhn9Ku6oXIBmtP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXy4XtLxJneI92
 ABA6iXVS+2wM5ONhO9FMxmbGsdcqYI7nYHmqk59/oc88GxJiw7LlIFUx/gLhVtIBuG36O1f+Zh/
 a5YmHBgV1Ij/M/DqtfvJJY79uiWjyRP6/r6K3rpR08ntd7gzvvZ849IjeB77rZx10SknXV4N247
 HEB1Cyo1U6x59fiTC1FTSDl+xQigV1f1QYFEO8SNQtU2g2iGnCfae5DvZOfMdX+RYmVe3aCHRXj
 2RPqNMfO6qlNkRBCMCRSC2DwlHnUpAPBwNqLHAxnrZqhcTyjhaqH0i9oD9tcLleT2TX8f+Izt2/
 mDJhPbhq3qZiV3UhP0gBX98r3gWKriEtjN+/Ron+aL2QqYB5lT1OXUET7iL086xKCZZAbs2gE6P
 nWOtb1up
X-Proofpoint-GUID: j8kw6vnlzXfdB6aNwWUhn9Ku6oXIBmtP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_05,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On Mon, Aug 11, 2025 at 11:08:11PM +0200, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Billion Capture+ (flipkart,rimob) is a smartphone released in 2017, based
> on Snapdragon 625 (MSM8953) SoC.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - SDHCI (internal and external storage)
> - USB Device Mode
> - Regulators
> - Simple framebuffer
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 255 +++++++++++++++++++++
>  2 files changed, 256 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

