Return-Path: <linux-arm-msm+bounces-71914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2025B42662
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 18:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E9523B7382
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 16:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B3F2BE7A0;
	Wed,  3 Sep 2025 16:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8G4ebPH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042C12BEC28
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 16:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756916088; cv=none; b=J1uvtbNbALBD77gRuHeimQcnlDBWEHsJBye57kPzDVXiWFbELOe+5axNRDdUYm8CN3l9uL0xmiTeDDlT2swFrR7+IFPPS21nrqvs1DCYIF60gO5qO8P8OgciehlRgRSAlLJrnVHHHQaYY+gQzDfJSU6nZ4faqkgdBpSiE7eX+hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756916088; c=relaxed/simple;
	bh=15e4KV2uKHJPOVsBfG9vaA4N6uUsqxcFksJxJYT4tQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jlMeETCkGT8Nc1YL98XCFQaPmbrEsvg7Khb+1Dkm5IENDlHTTPsK9J2bFAtWlUIwQ56TGO3CxzKXvrIgnyTHgi8G4FQvJo1zZvsWICuzugtReUkLN3sgIKmz5Z2BUfEt72xTQM2pyT/7drrByfWGc7N/7g0zeA2BRDD7MLO1crU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8G4ebPH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DwoBi029545
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 16:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p7A2A36WC5hNzLUFGe9+5GUr
	6YgZGXzB2kAzl3I+Zec=; b=m8G4ebPHfdBWbfEBqrnyIXVeXIkMcLttOwjhy+p9
	aESVUv+N3OBwniKB9YFGpLkV2PwYTywpf7MyIj71SeDf3kj8yNPBkT00pc41zXhU
	VCxJqpHjxIe/P3S2LmI+Xm1C6x7EZlQoftYl1Q2w1FFFdoW3u6q3B9kVBcvBjrS4
	mPTc7QQYjlIyTRZdDOa61TLUg8zSnmEQFHoBfrDMDT9NQZ4r+xxFwkIVZMKWuFT/
	gZeukkl6iEqfIKHBriMW4REe5Xn0OFVvAU9d3lXy8Dnb7VF1VbUY42CAUYWAoPHy
	QVbC8Idg5WMreuITfpxMbiLE/FldfFDY06dtJyktrAQrLQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpcghr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 16:14:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7724bca103dso51751b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 09:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916085; x=1757520885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7A2A36WC5hNzLUFGe9+5GUr6YgZGXzB2kAzl3I+Zec=;
        b=Ad82VO9rlRWEQjWtgD0RBmAYQaW09/6c8u0x1w/EjLUnTTrcwEOYofeUBQV5qW5q/5
         bCs0Jkt6Dano3d1cdKMyEEVbAa1oCIOszJWx8JyUvUxjtIslFWUVbQHFLebtaADJpvvv
         ptuDEsl1mGg++dm7E/S4vFd310oC4Wi/+r0YbknqUAXgRcTVwT/YCaU98HDwPej4i9Tu
         +hIR32fuvNmcfSL7u7kZPQEKfFDdcW/P9NCWvZaHi9/Cq7BoxZRBWEzxOp52NoOJifEn
         fJ7zHyBXfsBRspUcmw2oKi2OjNKFFW06dr8MR0nHa6jB57AAMjsBzNMSqUxJ0svyQ34N
         VhdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWMs2PBbrgLCnPeLNEEI+hIDNXX0O3Je8sVorrjMY26NtVHpRG1GG9PrNuasbmOIKITjLM9jbNtJHifuyn@vger.kernel.org
X-Gm-Message-State: AOJu0YxSYzKXbveN9SQ2HvSkUTOIKaOwHwNrc0yu9T7G6eFB8LG6xe2O
	KkXrW41K0s9JucOclaCj65KUF/mxUUf5jEIXCJHqIKERiWAPllvaqsAgNjMB2sHmMBd9KP/3LBe
	FsIcOa2qmXODa2uA11f2Y/os5oF1rmeWS/dxUnE9tmib+EUK6+O/C2uI4MZmoR2u3cxoP
X-Gm-Gg: ASbGnctLZU1/uAhPNA6rd6QfwZR6jvcKYysWEiPsGmniMrbSPIYVKEE5BrrlhhbMS2r
	nAbZvUilZvv/0e6p2yI+yLsOrg1G+kChaz6pz5F4MYP7FEVOsFw/77VXArL7jGdMQEwPWn6WxHn
	oo4/zhubo5oZsDuaG4rlAX+A2Aa5o1/ca6fBHF7zmMMgjY5BoE8aniYLjZWgNQy4F/ypcf16yWe
	nT2q4apj0r8D0/SvB/yWTWbc7t8WWuU4VANgeD29rFqS6sl1ys3S7TILqH/bPAO5ex9W4A/Mt/w
	jFeILkh4jwnDpvReofi94Eg/zw7BYkdDaslQRt9yz9oh0ipfqX80OhqzA+j1GO/lwr8x
X-Received: by 2002:a05:6a00:80b:b0:772:50c6:47d6 with SMTP id d2e1a72fcca58-77250c660aamr16685496b3a.2.1756916084626;
        Wed, 03 Sep 2025 09:14:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFN8Fk9FYilCvfsVTUpXK3eaQZpWzMaZJtyrt/idToT1wN7680TzLMcXUUYYpYB/Pxpe/CGg==
X-Received: by 2002:a05:6a00:80b:b0:772:50c6:47d6 with SMTP id d2e1a72fcca58-77250c660aamr16685461b3a.2.1756916084165;
        Wed, 03 Sep 2025 09:14:44 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77285bb2614sm1757820b3a.58.2025.09.03.09.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:14:43 -0700 (PDT)
Date: Wed, 3 Sep 2025 21:44:37 +0530
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org,
        Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
Subject: Re: [PATCH v2 06/13] arm64: dts: qcom: lemans-evk: Enable PCIe
 support
Message-ID: <aLhpbRL/mNfIMg/P@hu-wasimn-hyd.qualcomm.com>
References: <20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com>
 <20250903-lemans-evk-bu-v2-6-bfa381bf8ba2@oss.qualcomm.com>
 <facc2270-e700-49e4-a7ab-3b473e343ccb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <facc2270-e700-49e4-a7ab-3b473e343ccb@oss.qualcomm.com>
X-Proofpoint-GUID: 2mVbK1hzIcmjfs_5aerqcZz6jpv1Co9O
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b86975 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=5vNF0T9NdgVroHtUm1oA:9 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2mVbK1hzIcmjfs_5aerqcZz6jpv1Co9O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX5pnmjd1kVTcs
 WeEspc8s7MmMc+zYjVNHpeYS2Fo7TRHolUjwiEKXc5nv/mB1UM1nhP6T+BaiUXwIwhuMPc7DZky
 zTeAJZVNfXfnQTujSIrUq15ZRTRaB17bklE3jfBS4VuQcPBHJOJYwnGaRZqNG56hfS4x4Gi9GIp
 +uMiG5vEFh2cRnMp1kw3C18Rc4TevHw1QC8ilN5ux1fE3TAF3BzkxRAppQ4sO9wrD0gRulNBuPm
 MVVPlSvVPM+FQZfS90NgVSJu/fQYDZ2nVNLYH/6+3Ks6llWxTtXnzVFBOVNJeIMYJgfvHuc3tEi
 a8gOI/vEpgLZfrtKeqLl5tr3zC9Il+9LlvnTudn6sw5+oQ2i3OrcQOD4Mv0QlYbXRVN4YSayXxn
 TFkPll+x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

On Wed, Sep 03, 2025 at 05:50:00PM +0200, Konrad Dybcio wrote:
> On 9/3/25 1:47 PM, Wasim Nazir wrote:
> > From: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> > 
> > Enable PCIe0 and PCIe1 along with the respective phy-nodes.
> > 
> > PCIe0 is routed to an m.2 E key connector on the mainboard for wifi
> > attaches while PCIe1 routes to a standard PCIe x4 expansion slot.
> > 
> > Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> > Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 82 +++++++++++++++++++++++++++++++++
> >  1 file changed, 82 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > index 196c5ee0dd34..7528fa1c661a 100644
> > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > @@ -379,6 +379,40 @@ &mdss0_dp1_phy {
> >  	status = "okay";
> >  };
> >  
> > +&pcie0 {
> > +	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> > +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> > +
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pcie0_default_state>;
> 
> property-n
> property-names
> 
> in this order, please

Ack.

> 
> Konrad

-- 
Regards,
Wasim

