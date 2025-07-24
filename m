Return-Path: <linux-arm-msm+bounces-66589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A62FEB10D81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 16:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 600283B3B82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 14:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D674C2E11B9;
	Thu, 24 Jul 2025 14:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K0z4WueD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E362DEA96
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753367096; cv=none; b=K+8J2p+1awq4kX9QK6lthwHgrd1BGfMLj5+VDVmOs55ZyUfbViy6jv7/BCr83UK4AEhzIiEPppvD0FGn/adnzt7qk1XkPxhVfkl0kbyP0hHoeArtphbsh3oMTjVDwE+r/h5ZflXxSeL6g0E5L6BzMRYpMpM2JaQ6JI5tiGcKD3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753367096; c=relaxed/simple;
	bh=yMnNEljPS2VbnBAe7RDRoMrtiMmabtrdw1ZABRBlKGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYxPdHRhd8lezrt2F343PIJ2vY+j6zBoSi6AHybVcduQnFxMYwm9EW1gR4Fq4o9mJ9pKKH1jSG7whplLJqsDZM/iT0XSKgM8e6dKsTBQcLAdqoMrws5BNxdQZrMpIsSGp3NUOkJfumuDglTyufJzRR8mAFG61qqXE/6UOmnzuz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K0z4WueD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9pqSY018046
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PXQaN2D5/hB531+P97VDWMow
	svbj/zQKvLqKvH8lf7o=; b=K0z4WueD55xwjKU3Se6ihbq/2VCf3zfLo/B7fdSh
	1j+8LH2ycDmyqho6cCtX6qVdGT5m0yRzXD/rNay5RzD3Pd8rxgtfxnVnMdIIGiXB
	uxzB8AnxkzvmqrT/TA+pcDVEzwXolofDxs00ccr5mBKEGw835rbVga89a9YLHUu/
	MD/KsVXTWTRaDk9JsPEnXxHah8TBiG4Nfw5eEgl8dVQKlS2L//1b3/DNSiDc+PrF
	/m3u/2wrsLQ/XhqeA/a/CJ7usS1LqQieYQB05SD5L6iqQ0IwDQvbl1PI88qvBJXH
	u/VpcUbhl48QPg89KA1wwpz8GM3PP7vUGEsWA7PSzqvsfQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6u5gy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 14:24:53 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-4e9b4898ff5so251555137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 07:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753367092; x=1753971892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXQaN2D5/hB531+P97VDWMowsvbj/zQKvLqKvH8lf7o=;
        b=RwFqJxQOmT+mTCaIdrsaJdJVF9Y3ERnx0QK+KYLRSmRnRcBmQ8tEc3sebF5zVzSY3U
         3ZOymmNrzRpEgvAdrn55yuO6U2r43vcRHMpTzVIITCS/fQS/Ukg9EsGC62H1kLr5mbwN
         96j4PKSHSpggJIMLwpCoLYUFgeMlHsXQush0XW+EPshe4qRn34MhEy4fnmF5HS2cxg3z
         Ttrc/CAWThKitPva/nO78wJHavNb+vL3T3JVHkiL9bXSDEBAOULlr+XcinOjCQ0F4MUl
         hzTV4uyVEUpfTHG9lc0AMnpGLczmL1iy7met6Jmeh4Gwfn4tz5mFTL64+WUmihsAb30k
         J+nw==
X-Forwarded-Encrypted: i=1; AJvYcCXY4MFvEIIC47koUxwikzw+LApnZmLAR54XFd0Mjx8bBI/YyyQgAFra2LvCCavZ/WJ4+D5WfSzHCHAkLHFg@vger.kernel.org
X-Gm-Message-State: AOJu0YwgvH0PD3kUijYPew26XgRWR5xATJvrj9Ld/nm6W1sVO9uL5tkt
	1mFsOpUmQFpk6SnBCGkwReCqe0ZRBDutK1S85rBTYGThd9HxNLvXSjuzvR+PExoWVzyzS7f2xGL
	Fh+yHbdRCmxRoZV92jh5oL9y9csfDKht7mHDSGA5JldPu2DyPk4HUTWo4oDus+RY5pSHS
X-Gm-Gg: ASbGncuBgXp5p5/pvy4wtw0Q8Cl6N7ZcYkJ2b3d3rXluPftJOaGSPxa161NzwNitBy1
	NhBe5rqZ5z933NkaBsyw7BQLKTyDekOr74o/vxUwLGspv1K27FdCh1KnyAEg1ugzDfJGxPeq3xu
	P/+eaTHKTGV6O0ctAkt5D2chtDrHrAct2Bv89XGFrkVe3Ea4MD5bBrcUF15nja+CQkyEhNOUDwm
	GkQfh9PdId/zWnUBBunxnxwmrCPXQzfg/vlv/F5G2QbQsbVeNYpcl8P17g5RWtPjTlXAqeIQUGq
	kRmvM3m+MYHpLuMzqC9LD3zWBQOLoh7n8CsWymda7DIFkFtvcsygks/NowrUGKBKBTtJN+9rwSR
	FlFWyW8dLoWQJoi/0q5ol/MTVGxzXKmPbYEML9CnjOsVAJ2ubsWl/
X-Received: by 2002:a05:6102:1612:b0:4e9:8f71:bd6e with SMTP id ada2fe7eead31-4fa14d0678amr3840789137.0.1753367092177;
        Thu, 24 Jul 2025 07:24:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7ps+tMO3iXJTK79wunyZUIPEL7/LqtanKTlXWlbJ0rKzxmD03n3TemWcd8PsIKF5pqv7aDg==
X-Received: by 2002:a05:6102:1612:b0:4e9:8f71:bd6e with SMTP id ada2fe7eead31-4fa14d0678amr3840727137.0.1753367091417;
        Thu, 24 Jul 2025 07:24:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53b22b21sm382703e87.19.2025.07.24.07.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 07:24:50 -0700 (PDT)
Date: Thu, 24 Jul 2025 17:24:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, srini@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
Message-ID: <mwhxikivaxtz5px5e7jkqtuuk2iz457fy5drsnaj32j4o5qqk6@hwkcjso4jpsp>
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
 <276b7977-45d9-4b37-a4f5-1c65802ac267@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <276b7977-45d9-4b37-a4f5-1c65802ac267@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=68824235 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Q3_JIj6pLLKXvGcXXDoA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: aes5OlhgKCSByHvhK-CbMSrLeHJEbp7E
X-Proofpoint-GUID: aes5OlhgKCSByHvhK-CbMSrLeHJEbp7E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwOSBTYWx0ZWRfX/pMVCXkyyYKm
 ww1kSVpJl+BswRczgJFfxKUnG/3TgaXaVlolknwmDtdUOlO2OkpsEN1Zisi7HpRK8oMfNq9jH4I
 fa74rana/Lnr35sI4d4kGPP3Q4l+sxo9IXeigRpyhGxIQik54j46saASPJrJJ/fX1GsKWwWjVOR
 tfDF7polh6At+DdS6zAFfUwyhMTaBGIPZMj5+7wvrbe2hXEj+sZvX/vh9ellMQ0jS/iY5xu0DS8
 Fyj0mjmnh/JnjR+G068IeKajdkLHkNNr1gkaVe8Cs8R673Z9oX2i+s0yHOL3bHhdK/ILWcxHXr8
 DFiHzPeqqUHZCkwO78nGEyF/bsoTSgnpV9S4FMi8dFgeOUauajTcRJ7drSmRPjMMgOv5xtCWwPK
 MGZ8oUByrQ7mT8x0VMi9eTcCCzJwG/BuP4O9meISO6v4o1q0gBfv4uIkyl7M2fjetm2YdEak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=821 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240109

On Thu, Jul 24, 2025 at 03:31:50PM +0200, Konrad Dybcio wrote:
> On 7/24/25 3:28 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
> > From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> > 
> > Qcom Slimbus controller driver is totally unused and dead code, there is
> > no point in keeping this driver in the kernel without users.
> > 
> > This patch removes the driver along with device tree bindings.
> > 
> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> > ---
> 
> I *thiiink* this is apq806x code, with 8974 adopting the new hw.
> 
> +Dmitry, does you computer history museum require this driver?

I never had time to try enabling audio on IFC6410 nor Nexus 7. But if
the driver would be actually useable there, I'd prefer to keep it.

-- 
With best wishes
Dmitry

