Return-Path: <linux-arm-msm+bounces-76294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 38216BC33AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 05:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 165634E5293
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 03:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1442BD5B4;
	Wed,  8 Oct 2025 03:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LO4bZPhY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12DF2BCF7F
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 03:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759894171; cv=none; b=IYuch85bTUnzbre6awWM4M/05fonjVyFw6t9bewWbOd2JMi79qJeqRBXx4hBLi4f32+PLo0kmeR6DGtwiOwhszhW5kKDHywQfKmcy9NflvgMDydAD/pAi9/syR4Fc3jqihYrAuDt5430ItDW+Z6zMqCSwt1BLhA64rGwToDVeQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759894171; c=relaxed/simple;
	bh=PhC/2B+2mSbFA9P1cevxdTv+G9a2xtf0omNJybKc1wU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+qLto96E97RQzuN3ALLITis8Ts+1pVWdYgVWUjjJesHeRwmoDR0U4gJww0DXQ2VJsL1exbirm8Q8LQVd4rvOmVcsNntS5e9K4f/t86qtCH+q6kh9HR15g2nPCk869tE85JNjsafTbVhtqz0kCbbYtvyp1JI58AyhmXQK/eTIWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LO4bZPhY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5980456k018762
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 03:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hb5DjFcBZ/27YR59szZGZtjq
	+9HN8vs9l1pnCZa9knw=; b=LO4bZPhYIUWjzodfMIGxtaOkz6y3sCxainM1BKWI
	R8vql3u8rKdDuIPiFKSuEXYWCFU0Bnm7dhoTsLxl/ZmpnuAjcGOVmA1lC9XeQbfB
	5Gmxhmspv1CdZFAKG1Wv1SX3Iz4ZA75kPBK1YdIDZ1Alx2qO9TSGldVFCJw3/sMa
	avcenaQUTcR+x+bg5SMAeALK7Tiyiq9GGmbOqWzpK9DpjzDYNTF4LLH8bz8EGNKF
	PkLBLshs1NpMff43sgCr7wZfhzU6I/rQxHgk28U+0fhM+MTFeca2N0mj7kc+psK5
	sZSHlyu82qsht+4YRsrAy2DJlzwudzYT5gCLKlw33YxMAA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0my1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 03:29:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4df10fb4a4cso256663931cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 20:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759894167; x=1760498967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hb5DjFcBZ/27YR59szZGZtjq+9HN8vs9l1pnCZa9knw=;
        b=Oda6+/thB9XI64DiD8UdJDpvvAlySoxPKnpxNls3erx4UX8m8Snbv7HhXEEY0MHc34
         azALO/nzpRz3EumaaL8VepAF3kSNV/xKHpSUyOkDKYo/IDvvFw7A9EcOEH5+EPPFc8M2
         QAhdL262i4dxfu2WioL6+4wGtJyvETCHKImERTqG22O/wBsYIlZnbICLfoNUCBNhGFJV
         LR84VSP4u9W69hiqewJ6heA2avtvnLhzkPZSTYaIIYYlPzftBz41ukFhMbIC+d6FMYxG
         EV0Alio8H9XBK64Jymq0klxfl5c2qv81xk2B2IMA/1cxUosA/xg7MpucTQ04YulJ/hlu
         TviQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrGn9Wfycm2BiKDEiERg9mj+vlpO3wtVQwMtcQ+CC5AhPpPm1JEUh6olwyz6Oo5jhjQjwg7slDcAaLgKzA@vger.kernel.org
X-Gm-Message-State: AOJu0YzROtLBsds7ofttgb+skuhlYbLh8obQx/Z4XuRgcQ1sZzs/seoT
	dF0fhKzWpdd8fT9u6127Yfij1D018DIid8nrWNiM2hvrIHF81r6FBWRwsP8o67ZVwZkc8o4HuGn
	KffCCBP8Qw/l0c0fYwvxDGusuBFdQkQMICDtzA3F4148FA6wu/28sqXvc9kN/EkwKbANA
X-Gm-Gg: ASbGncuBneztlUpd2k5/v292etBEzhaFIbfudxuVqJbpaInmxCxpF4965VgoD1FR49o
	5KksRsITG8ZestlYK7CFZk+61CN8OO990o6oToOC9hq5oNkPYFvYtrEST+kwddTvvEZivYHNW5R
	MnQmVg41wf5dqrQVj4tlWUSvzmMRK3uCq0o8TENh3apBDbQEMAqAXw2qtZDJDltvqu3O4nJJ5YJ
	xJNn/betx9S0wUCcQB+hX0gPLscKOnMxyvIZ3HIINKQG3X9Ae6Od0h7Oyd/AlWyBcZwz2rBTGWS
	SZxhtDSANwLFVP5eEz7BtYHzxxNYcUrmXU3xgEJojdyKJkzn5le5qd9dHfyst/dAS0sSYbBSIxo
	aM4EDhc89eIcu5c+vKxZAOjNG+6MeCpEDgyzGzVTL/irYeQyL/jYlWcsAZw==
X-Received: by 2002:a05:622a:5a08:b0:4d8:67fb:4185 with SMTP id d75a77b69052e-4e6eacdacf4mr25643421cf.15.1759894166675;
        Tue, 07 Oct 2025 20:29:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0ym17qd6d8i8m9rZB6O5niP9nPtV34vtdf+6ORfgYkgZ/ZUEANvQEfhGIf/ybRQkhY43jCw==
X-Received: by 2002:a05:622a:5a08:b0:4d8:67fb:4185 with SMTP id d75a77b69052e-4e6eacdacf4mr25643231cf.15.1759894166258;
        Tue, 07 Oct 2025 20:29:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011ab25asm6715686e87.119.2025.10.07.20.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 20:29:23 -0700 (PDT)
Date: Wed, 8 Oct 2025 06:29:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8939-asus-z00t: add initial
 device tree
Message-ID: <cphv74xpoaltdlk5qjksmfjmsdk7fvpu6dvpo3bz2wdhtshaai@dxzk7qxro4tx>
References: <20250930132556.266434-1-xerikasxx@gmail.com>
 <20250930132556.266434-3-xerikasxx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930132556.266434-3-xerikasxx@gmail.com>
X-Proofpoint-GUID: cu4DbtBmfhtqyB8rL2aRhy3MSyGNKd2t
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e5da97 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rlI1ognr9DFfacYL9GkA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: cu4DbtBmfhtqyB8rL2aRhy3MSyGNKd2t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfXxA6Qia8ou8Jb
 otkFCCssKvrmeoP6no628g/7ln9D+vgiLpqsuRiUdDar2+zZ/avrOrgjFOrYttwf9Zhe9UClqIu
 MGn1gol6UVpT4OMqmuc2LYZIn3UTadwqw2d9uNdyVHsY899K/p4iUny2uavFp79r1NDQYhmJ8P5
 7SRb84SYBwRXyHdaChyZHDx0ymsGA3Nb0ySh3hMoQ5pafB1hYNnPBRY/pr2/szCwTdj9Ll3EwRs
 5uqg5IzNuvuAMtWKmIEIPx+RGhzRod872zfwAf+bjI5CkHNr8ArDooJ+J/R/MZhRNaQmPfc6krw
 aJuabm/I/fPFLBMRQYvDcnhxb8NNMgwBvnj8Ep8ceaQQjtXOag7XRff3ns7w8O66xL21LsS0fxN
 mvj4Bx7GdxMiiczwq0HviqjZeN7LFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

On Tue, Sep 30, 2025 at 04:20:10PM +0300, Erikas Bitovtas wrote:
> Add an initial device tree for Asus ZenFone 2 Laser/Selfie. This
> includes support for:
> - UART
> - USB
> - Internal storage
> - MicroSD
> - Volume keys
> - Touchscreen: Focaltech FT5306
> - Accelerometer: Invensense MPU6515
> - Magnetometer: Asahi Kasei AK09911
> - Vibrator
> - Audio input and output
> - Modem
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 255 ++++++++++++++++++
>  2 files changed, 256 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

