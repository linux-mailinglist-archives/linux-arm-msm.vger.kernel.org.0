Return-Path: <linux-arm-msm+bounces-53754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F696A83734
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 05:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9D7D3BF769
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 03:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E34F1F0992;
	Thu, 10 Apr 2025 03:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jK34rGyg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B0538F80
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 03:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744255486; cv=none; b=ogzz4H4oJoYAQevk66RGfIOnc7wahfeDIWo07ft8fKFPwnnNCNXP9Tp5MDVzADSrbOCpBdW0P/mMK18T/ZUtUadEpCSMhAHsIXJLz2vBP79/ug2zx8rTbBUeYznLey4CRzFeCjZBafoPwX+62jz2M+O2GVnzvD8re8bvIn0Gw88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744255486; c=relaxed/simple;
	bh=Gx9WFrUrUoZRLHEwwMdCx9g+x1arq+e2dFMezx9kXks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B73OUuuc00VTfptHL0Sjqia/3EpEXVPXll1PmkzrEYheWR9pf+vrVVHAMNIHm+wrbJgOU7GA59JA7uWkgL+QBG8yFQznuftWJpbv9hw2AD44DAkIc9oEwYecYo3P4G8wHB6szKu/WZOv/EbEEqpP327IcZqdGiiisldfBx6WUbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jK34rGyg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HH6II024169
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 03:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gWsEAg4HSwu4GGjiQmNBc1wl
	iCEzGfllW8dB+2zMyBo=; b=jK34rGygpV1o07wXXl6YeF0vzGw4keYdNUvuz0l8
	W5NeniwiH8v6kreY8SDngQ4qrFdk3bb7jpdknXBLs5WeFJ5qYvFPVCaSLtl0gQfL
	lRu6HAuGHp+1h2B+HvISGD36MpywEsT/c5VaZS3hA1olsGQQfnxHeA+0C03xmUc1
	sGl4HOEbloZSWXVf9h6JpO4p2MFV5q3y2bAsQ3iE9mPoomsVokgQc/7h+r/vXeqo
	LFTFQROtoAr5TU+s9TM16hWBRPmW7aCH9PZEdGBksrItLcoCF6C5tOjW6sXB/3Oz
	blagRcwYHbCnMB818sY4NZNMiBJKDlCAuKWHSaV4JEKumA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfknad8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 03:24:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5c82c6d72so66432285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 20:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744255482; x=1744860282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWsEAg4HSwu4GGjiQmNBc1wliCEzGfllW8dB+2zMyBo=;
        b=mLBIcaDGQM71MWvN5sU/zdIvtcVQiI5Ey+DsbN5EUk2puG6WYa5xtqZ1jw9tzjCjje
         tuTELEYOJ5vR+f4S27E6ZepgaZsXB7nOzQlThCfzXPE+aY6a6PvW7BDzpCvw6zfNEmlT
         H6Og4yiEv30SmmjNsK1vwEBI5AfnJ+hCFtfoW2hUGF3vLhieoAFKoskX3nqm74KPoJTx
         wlU6ouYZdGs/4/xLdIhf4uTtMB/24re1wPqK7FKHpZtt8U4NPG4kot+m8FNXWOMdAEPU
         oEBXNvKTu3ovHtHJeUfhqkPEhRd35WEoA0HIL6n6tu6uH2v3LNfhirAXTrdNr4rUaG2J
         JFbg==
X-Forwarded-Encrypted: i=1; AJvYcCUP6v2rPVNYzlPIQC28Jl1kVyF7+xud09HFE93wezHafXkNSa8pHbKBwMg60w8wQVHSggRgA9M/xLRBH5Rr@vger.kernel.org
X-Gm-Message-State: AOJu0YwMAKKj0w/ldPVfKw0Vb5OOLcMXOFYgwTQ5Rc9YsMNQmRtXWtIA
	v+Tt1zyFS80gYjWJr2fQjAFsGatmcPHzBFqpzDj/KDH+Z2s6w03cffUgPjfS8BQ5kIgq0m72H+X
	v1Hj0f+qwPJ70tu3V9qPGpPxxQZDno4R236LujTtEOwk66ifnAADkkjUCPmnlK33N
X-Gm-Gg: ASbGncs+VuMet8V348+gDIENgIXGMjc0r5pukKRK6MFvF/uJyN7E7yU/gMRkboNHIAK
	kbedo4csFS5GCwh1jSyOhtoOBCUUY/qyZueR5qwP1mrm5WDGLsCJYLiHum+qta7DP4+vh2v9CA9
	/sQFkqoRglFDLDEjmYORt7wP7r8/bujJpvCDi04A4Q29RhB9fV3jnHyrFANTPCI+P3PcdnLpwzJ
	6PpL6gfPOuTcJeov+aKLjwQXLcdx9+RU5Jo6/axNda8I+byJ1Uuw+f+4u+9Nngx8jN8jPtIssJB
	HyNdaanB1FJrwIa88EvN3npGYGwy63t3NuyqYxUmgp1VyoG9z2icuowZfYYOeX1IOcSYnkpLZV8
	=
X-Received: by 2002:a05:620a:2596:b0:7c5:55be:7bff with SMTP id af79cd13be357-7c7a81b1440mr115715985a.43.1744255482330;
        Wed, 09 Apr 2025 20:24:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGlA5AopMzhf0UWMU4MO9jamnTQQKqm2/O52vXr0UH5bQxSqNZx1x6dmOamtRNS+T7GE2a5A==
X-Received: by 2002:a05:620a:2596:b0:7c5:55be:7bff with SMTP id af79cd13be357-7c7a81b1440mr115714385a.43.1744255482061;
        Wed, 09 Apr 2025 20:24:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d239708sm27155e87.85.2025.04.09.20.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:24:41 -0700 (PDT)
Date: Thu, 10 Apr 2025 06:24:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Drop undocumented "clock-names" for
 parade,ps8830
Message-ID: <clljtvvelqdmmz65r4eq77atejxbh2r36xvaugdxdq3lz5y7ci@gxnqrrdc5xob>
References: <20250409204950.1521733-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409204950.1521733-1-robh@kernel.org>
X-Proofpoint-GUID: 1ITVauXGOtBp-lBvvom9lGTUe9bQYFmT
X-Proofpoint-ORIG-GUID: 1ITVauXGOtBp-lBvvom9lGTUe9bQYFmT
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f739fb cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=y5MgIiWDlmAYqCSZY10A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=645 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100023

On Wed, Apr 09, 2025 at 03:49:49PM -0500, Rob Herring (Arm) wrote:
> Remove "clock-names" as it is not defined for the parade,ps8830 binding.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts             | 3 ---
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts    | 2 --
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 1 -
>  3 files changed, 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

