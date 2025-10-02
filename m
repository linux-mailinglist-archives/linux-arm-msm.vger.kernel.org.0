Return-Path: <linux-arm-msm+bounces-75743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7EFBB22BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 02:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DAB819C4CE9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 00:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD6BDF76;
	Thu,  2 Oct 2025 00:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVEd9Hyi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5098F5B
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 00:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759366317; cv=none; b=j/mvxWG5uH5++DHr95vTTrke9XzbTFUlTArNOhaehbS2oVwZ+aW4nmANDeuSLc21fCbu35KlXedfxl5FtIkE6kbzWhQcfqjF7q4wKmPSrizIc2v96ADk7rWAM80IB9naek5S0Gc/OJgKXhjx7aM30frpbQubcs15DyiNR8h4ous=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759366317; c=relaxed/simple;
	bh=xXe71YIonX/mx6fgkbEFp8qhQU4Ld2BTPUxSllwc/As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLnNo9DRN0UvaEZeDMJgzFL3hirOiUPeh+wXXxZ9Ix6UvL2X8sfxOCYqOhfa8TeE7haEMv3X+GUCsTQyfvo5MHuRa9++al9aeMyJdMCVECFgfOWfYRoLpzKNvS5ddgybfH7SJe1Hspya9lfssdPiQnA6xL0Oj8SVBTb8UGXDv20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVEd9Hyi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcD6F012562
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 00:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=93heGJe2ZgckPIR8dkGPHK7H
	vBK4psoY2YpacrDOB7M=; b=CVEd9HyiwuMsIJ86DLi1VBtReg2aL5Q6khNwceFp
	pldsTYldByQ3UG/VrXe/rVxR1PzP2/h8hHipiVoMnzyL5ZX4uxRO2z4lIjhbG4A4
	HqLZb3nJEHaR8owB9ZZ+hly4GQISEmT7tQH0OacvJ2j/febF/GmI6lzf1P6x4Y8F
	CNZvWfGLupQuDPcMDmbXiIr9raRtz7M2qL6ZyRvPpZAB3yL8wz1JR2txUTW0rJLU
	bcH2ue97LDR1n91lFerirAgR31qS/r01H2pUmoZVs91OxXeOw+Q9VF/6TNMycbNg
	nWkKf7O/xLvw7YEFOtAQmYau7jZd0BeCxwa9jOlsDnRHBQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80txex3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 00:51:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de801c1446so12330921cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 17:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759366313; x=1759971113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93heGJe2ZgckPIR8dkGPHK7HvBK4psoY2YpacrDOB7M=;
        b=pS7LGhD3lqT/hfTN0WH0Ysf9MeUY0Uez0XiEz16MNteKBbec2pCFw3DUclU+eQljgJ
         aSvgFp4NAMyLGWa6OJWA+hmDbsd0wKh99/NSFK9msP5rXFusHNomSVzA4fx6flWZP0h1
         0a+WV1r5WwsKsPXdUKizTuuK1hVIgPNSYGpzjE/Ou9zSugWXW09mpNlThrApoaxyKSMa
         btO5UsVo5B3llU+ULPe0dUDvA27FThlRWfEFquKGrtgPAGaN/umgnCSmZ29RoEpJxxuf
         Yalfqghxeh3BcITU4lLPFEllQzFHMios+XKBz8zkfafp4EzcGrwngL4ahmy5uImD2ZHP
         htAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3ds1dnZTH9Qyp3o1Yjzi2CA33Gj56RZl2cAxCBZl4j0UAbP9JHSJFP9xGRiqXgAOM1AXGOtRjxJ8HIHF8@vger.kernel.org
X-Gm-Message-State: AOJu0YyhVmm8idX5OG5rEn8tPGH8ml2AnyB4lE2jcFDyKvbKCMs9RC8R
	4UWQKTLV27hJmtaHC9yQhDD8s6O+lj32AMgvEQdb7vsldA1Xp+i0I2o+5dLMKsQly2yJ1QpRtE5
	WaQG8xOqBcNbEBOUYgoCWm2ECSwgDifInB6FV7eN830NyWq5quivVl5NFxkV06JRmpKG4
X-Gm-Gg: ASbGncs35kJOKTDBaqD7ne6f4VYppkhGZOZIsklzrMCh/Jd3riyfNVHxdDv9ez14/Hs
	eVJlic43VkrXMmtevvOzY6hhBSP3Zga+3wogpVsB8ANBwagXPhQcD02ZZNYYDUY0JITmUIQ98Z4
	XaLOOjhTLIz6yAkZacalGfMA4613Cg0xqDmd68p2wOhAgkpwgb6u3lSJHB2CScAln2clz3q2dM7
	AbSVEIhSRLpN2e/6kKrHfw+IkgGt5h9+gHIBK8L9x9cbYsnBmC+dfvI0ZO28q+8k4geKDvnPxny
	oPEzK0ZqD+yi4n7LdRiv7Hm4topFH8prtkOgPmxKPWftIz/o5p3lGpZGCtBYSgMPs1HhQXwCSmE
	UT8buPNT6xSeqFUYLxB20vqauZRTYDyEdwb8WgdRWrzrdDqvn/vF456uunQ==
X-Received: by 2002:a05:622a:54e:b0:4dd:e207:fd0 with SMTP id d75a77b69052e-4e41ed0256bmr72706211cf.74.1759366312938;
        Wed, 01 Oct 2025 17:51:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXI3nWOwvyiG/7c7UPYGB+PIhFFGHfgFBcRu47k8DhIj/7J/AoI8j88xAGAc2I79bW1Uyxcg==
X-Received: by 2002:a05:622a:54e:b0:4dd:e207:fd0 with SMTP id d75a77b69052e-4e41ed0256bmr72706041cf.74.1759366312534;
        Wed, 01 Oct 2025 17:51:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b01124a05sm342036e87.16.2025.10.01.17.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 17:51:50 -0700 (PDT)
Date: Thu, 2 Oct 2025 03:51:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] pinctrl: qcom: spmi-gpio: add support for
 {LV_VIN2, MV_VIN3}_CLK subtypes
Message-ID: <tkbhfudaa6oxo2ox6l76vixcznfohwmditqj7nsc2zdb3rxqkp@lgubwu7j6v77>
References: <20250924-glymur-pinctrl-driver-v2-0-11bef014a778@oss.qualcomm.com>
 <20250924-glymur-pinctrl-driver-v2-3-11bef014a778@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-glymur-pinctrl-driver-v2-3-11bef014a778@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX7n+T43zjDX5s
 1LolGmlKnsdAC83sA5uU5U2b+p+d9Tp3KXbBzLXTcvzJtdOPWzI1GkvEUgB79nsoESW1cTWc1ZH
 u2ZO+JSlm3Eb1sFLY02a7ClTpibE9PRObBNJgW8aJWCbpxtN/mJXuT5FRjp4N9rWMLnSvQXms4q
 ksA7EbKXp4zPvanA+XVPGDvCMfbpiI2GzCZ/WjFGe/9X+pKzszehwINFA1bGEzKZDpQRUkKxMXN
 g2vpJ86PFHjxQ22K35SQmCoxn2fYVwhp44a+guR/mv/iLepGMLMPpt9TW0ExrZTAr4fyOS5XIbt
 0glvQy4GB3ARNVIkidQf75F6pvofc0ZGcGpxhhMCWf8bkCoOcAUpqDtggVaev8OhHI818snfWKk
 5SUNxXt/spmNhTV0IPYXXOEq2qSJ8w==
X-Proofpoint-GUID: xcmBenyTW7gvEqCplbdk7OIyToAgPQ6x
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68ddcca9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=_mxtXHsW1hB_9kt006IA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: xcmBenyTW7gvEqCplbdk7OIyToAgPQ6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

On Wed, Sep 24, 2025 at 10:31:04PM +0530, Kamal Wadhwa wrote:
> From: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>
> 
> Add support for SPMI PMIC GPIO subtypes GPIO_LV_VIN2_CLK and
> GPIO_MV_VIN3_CLK.

Nit: Please describe why, not what. What is the difference from the
existing subtypes?

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> Signed-off-by: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

-- 
With best wishes
Dmitry

