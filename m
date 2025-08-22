Return-Path: <linux-arm-msm+bounces-70434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C5AB31E02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 17:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 268C11894865
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 15:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2378F212542;
	Fri, 22 Aug 2025 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AUpcF0lo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B462B20E023
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755875637; cv=none; b=bKqbfs5vbB7S8PvGI86xLcUMahyjpcrMxM2Qkz/M3xvqZ/vEp/k4Usl69kfpw0hiVn2a9IuGjJmrcZQmKgOxCB2c7YBYf7abub++YsXIQag2tnO3L6l/sHwZl+TjL8XLm3dSp6OM1lATzBHlW9tU/BVm/5V5MGm1NegPnJuI4Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755875637; c=relaxed/simple;
	bh=eG/orwKFQd1AjY3A8QCa+7dXaRile+fE60M6k3sicdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CI+8eaqmGBRuenVVcOENyVon68c6eQzwyBdI7k5TptG3cVerKduMBkH6ah+yJibXKV9APblUjYkRbL2b5sWxg3GplsaysgeN4H5X/rcytFtEtKAi9zD9zuVYa15FcjAyDRBChmdxhaiH/fyY0IdCmwH75I1QBmYGz2+MiZ7s7q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AUpcF0lo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UIFI027221
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 15:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=btt2DyzNMiZ+hzGRt3lGD/YX
	b5NjsYZqPLvyhJlPzp8=; b=AUpcF0loBdg+2hN2wj1mTQszGXeQ5mgzuKDd9etU
	85AGUMVg1Dm7Afnh2OqxLo/0rljJTyq63lapDWjPA1xKeati3rbGhhguaeVWQ6M3
	+UK44FPqkpT9dqXN+NvYloX6Va6Gm2h35aJMHFbwk+hcm3ToNm/ruMrTJR3jmjrx
	Kv8dNervN8YgkPoIkpcq0mH4Zch+TdypeDsLJh3neu663JlMcwmJpQ5+8H+MqyJE
	6Z6dsuZdtyTIenbGnd98QU9xKxsO1f4rFfC9MJM7ehFbWkBzuZHkR9BYX70Pn5nt
	wYFbm/1/l3rSGvH8WQcSFqs4/uYAxZHC966EnDhyO2/wsA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5299mjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 15:13:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-324e349ef5fso2510787a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 08:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755875634; x=1756480434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btt2DyzNMiZ+hzGRt3lGD/YXb5NjsYZqPLvyhJlPzp8=;
        b=fTaRu96Nt+G4NrzZPxJ2eHEySnlLp0yOsEa/KPDM1ktKraz8lzStgXt+mnh/jsakrz
         nFtfD5XbU1k+Uz2SKafl54w0TkxQZomfs2jHXVRvYEU8Lkc2RYp64Zr4WDKEw2Ygueng
         K+ICBOngFpXVnBw9607JhzG7+Bq4NxCHHQg/dDyAVYPjX9jd4QLDUih6Z6Jo54yADFCB
         SHjArBndflau5nZAU3jX538CPMNRo43NhiY4wXOXMITNmCKF5XzlRLovAQdEa1Tt2d1Z
         aCV9IQUcv+CtdZqNpCQ2J71gd5pz6EibvvKzNUX+3lfe4fx2CGNl4fl3l1k3oFOCNcTL
         9Ccw==
X-Forwarded-Encrypted: i=1; AJvYcCXC5h3N3SP5sd0Sa3OnJIuZaOoijaxcecbr5EO79NrKktwrDjBrfy5HObseOtvDxMk2qgS9RzEakE1RvVvj@vger.kernel.org
X-Gm-Message-State: AOJu0YxnqTceNfsWRVyPhouDyqu5+gOO7658SGWx9nT2jDTbIdtKLVx4
	Tgl3T0yGb96cUuOTYSs9sf+yq1o1pFWRXP9WCdwgw6ly8OiVDCJiFua1AACpD7RykuNJxUXWL2g
	Z2JxXVqWQkoBTh1BdRQmZ9/1MR3T9TRaYnjEGX64pKkaj9AKIvvknNdK4VIHtyoF0kWvr
X-Gm-Gg: ASbGncuL/rGM7ByacK12bj061FGAK0CR7j134ROjQeA4W9ydFHtZbZz+8TD2+WLSraE
	Y6Z1TqlTm3ElAx08UwLAdIhRaXmUpufuSOE2x1XFEgZqJPg5j1lW9ZS3E0gtJHTBqX0S+2Jq8+B
	i5ORetlj8+jgYFE68/8MtV2rfuRffAB2Q09Sz4vXwRRFZgSLAB+0m8XcvkSiHQrcFIoiMaspNv2
	GTDIG/wnwt2Uv5Y+30oAuijdbrULtu9ihfltwvHXlKsWR0ah5eRh7jMaQ48zWnNpDea0+mWbith
	jmbs6KdPvig4AS0kWycD3ah4tKyGGpHhsZP46Wmt0Cmt2gs7J1SP6n7Rmst7vhWhkfs=
X-Received: by 2002:a17:90a:d2c8:b0:31e:ff94:3fba with SMTP id 98e67ed59e1d1-32515ea1368mr4981999a91.24.1755875633778;
        Fri, 22 Aug 2025 08:13:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErVfxzrJPOTigg78RZW9N+FXdSqfUm7MGCIOMf3eK9WaXKtIbmqRfkb5E1AROeKKMcfEPdvA==
X-Received: by 2002:a17:90a:d2c8:b0:31e:ff94:3fba with SMTP id 98e67ed59e1d1-32515ea1368mr4981906a91.24.1755875632892;
        Fri, 22 Aug 2025 08:13:52 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324f3d37c51sm2122053a91.5.2025.08.22.08.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 08:13:52 -0700 (PDT)
Date: Fri, 22 Aug 2025 20:43:46 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 11/11] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <20250822151346.skwtsh5abr3tmrjz@hu-mojha-hyd.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com>
 <e18ac460-dcbb-4ac0-9c5e-3aaadf3485fd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e18ac460-dcbb-4ac0-9c5e-3aaadf3485fd@kernel.org>
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a88933 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=LBsFnih5B16vKGK3eWEA:9
 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: NuU-JIGLUDMbnErPU5bn3lYsH0rajRgR
X-Proofpoint-GUID: NuU-JIGLUDMbnErPU5bn3lYsH0rajRgR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX96ooRUTsikA+
 0GfutHDovx1UYJwlCRcqNsnZDiBe6bnMpobPPUn6kMkso11bFOVLlLPM2hg3OIM/f7kl2RhElkP
 e9qWcOM3i3VOO9vsqj/JIudW2lyAK/tqS5QuOZCVIHYzibBrKZkU1RpZfR+quCWaa7/PKHm73VS
 GA7RxdxkLhEV3o+NmnfIiYcMBLqqrPXqZ/Vcp+isjj/nvjAAWcsFehkFWuWGye0nqPdwANAlCMZ
 8lM/qEkYx/ZpJhIsURa4Qw+HobLdLjgh95SHWwZWnIoSoYdsJTXMNDsQnX1cN0t2grbJCZMnGcS
 MFutpb0HkKfLuNqFX/wVLLbng4MxObfiKXji7FCI3Jw1zQSewJ1nB/t5aTJXy/Km/Fqm5n64GOi
 jl6jovPAWMddLK4i50NCNj/MXCt/JA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Fri, Aug 22, 2025 at 10:45:50AM +0200, Krzysztof Kozlowski wrote:
> On 19/08/2025 18:54, Mukesh Ojha wrote:
> > +int iris_fw_init(struct iris_core *core)
> > +{
> > +	struct platform_device_info info;
> > +	struct iommu_domain *iommu_dom;
> > +	struct platform_device *pdev;
> > +	struct device_node *np;
> > +	int ret;
> > +
> > +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
> 
> Undocumented ABI.
> 
> If you tested your DTS, you would notice warnings.

qcom,venus-common.yaml is documenting video-firmware and getting included in
Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml

> 
> Best regards,
> Krzysztof
> 

-- 
-Mukesh Ojha

