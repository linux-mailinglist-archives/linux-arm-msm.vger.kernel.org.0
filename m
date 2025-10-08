Return-Path: <linux-arm-msm+bounces-76407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA699BC50F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 14:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81D7A404893
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 12:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C5C261B76;
	Wed,  8 Oct 2025 12:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ioGIzFw+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81546258EF6
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 12:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759928348; cv=none; b=dcGm6rM1veIsvYkVVrpHGgAl22Oa1jNTqs4Ujk9MoE+as8S9k3QbKW1ZtT0eWUnPRJclf2fQmrqLzMkrM+bXfxiptmvvzK0u1xDc5CFoCgGSneP1PB41hX/4GdN0u491Nx7b8wOj8DWQdHOo/nzW4UlEk2swAbtekKQ5Vc65WJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759928348; c=relaxed/simple;
	bh=ZJ2kKaRdwvu8VSF4BFdpI2S0DF5Knvpt16rbDWhmgBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2tnN5tT3P0jcfTdDEOw9On5xwTxZNAEBm/c9grQ6H0xxW7nY/KfdAxJOqQ+Ieiy8DU4l2bClJItOf4go/4/q+tWCWqnvGKy9fhmax3QJqgGZUcFBToVNvYxuWXYQ9QCzjfNvDI6HT8+OAh45JoDQJQClrxsHHrRtSfupqQMGHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ioGIzFw+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890a0v002267
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 12:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5KgYauIrBbKoQVpQqVgNQnHP
	AyVbPvahAJXvv+HqRxo=; b=ioGIzFw+qKFKX/+2hfVRuFmgaRNZNkrPgT6MZH+L
	hdqhc1x3yaMy/pPG0rPHczcaXUsWual6WvmuANcLpREzA6UNrvsavEqVhxxKrC0s
	oRjncqNyrwelRM72QTTE2nPtQoCBCwOPYs7VteuByx/qgQj8EDZd4LNsA8SFU6wP
	EoLZUvf9NgFw4sE9dR6+1XfqNieztW/GmHCyOcxkLoKftcqJ8iNHQUy+35XDO9BE
	ztbs2gYlhJfkzitOgrkB8Q114iMWJtbzXuSZiDR60TfqclKvayiNRGArAEvnvGfN
	w0tWGXrblfl63idaOVFgVa1dBSYAnv1/2Lo1EqkViAiNHQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxnav9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 12:59:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d77ae03937so201325011cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 05:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759928345; x=1760533145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KgYauIrBbKoQVpQqVgNQnHPAyVbPvahAJXvv+HqRxo=;
        b=WIK3kr0Ms43Wa2iX8T4RMdp44geOgjkOJOYy1YA6JPxAe6F6JJIjOQGIj6EJkWo3St
         xk2jlaLlyS9s4Unu/a1gn+oacNE0P1i78szYpyBGDLmDjLdPYGw0sreXZxfTrCRcP7pY
         RG3HkhorqcD7yOzg6SPJXK1h6TOcQ07oBF/Ga4YFNZq1N4sfSI42kYjxR/YOyDYGmsN5
         ZSbi9+RKlyep5rJA20dIzkiH3pcB+gW1BoMXdkfDgOBKbO69ityNm7vLeRXpE2Ys2GvW
         SFIGiBZIoEwQJuxV+8PQV/eQ4j0J1DG+dE4BG/CWQPouCnMuw1gC4h9ZLVJJTQFh8XFJ
         lx8g==
X-Forwarded-Encrypted: i=1; AJvYcCVsyJlLW98/gmo+5CL+XfeHWq/tcCXxbERnMbGpOnoKA0jVE9+WQSDZ1uJCs5XppG2uo+I3RPDrbzlCSJZJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzTG1ljFc7e21sRA55dcNGpgeY8kw68BSS92cwwEhx+RN546p1Y
	w46vzDJ+YYBtMxWVO27462aizot+ZQ0a7GeulE4Oj1BhkJ2/ejeRXz51/i/6qooZrXU678UtS7Q
	qE1uq/hsXjdASzwza/QPw5gLghFVRpUPn+MJpnM0g4Jss6SyGevWmjL+h1pEEtwy8ADa4
X-Gm-Gg: ASbGncueGo2B4d9Saj/YiI8ctjLrmcaC02hMtIZDDeBOj0vbl1FSCCYU0/Yz56vXcuY
	zug63URgySbmUdNfmbzNDH1UJzYLRFTUYEcmUdXSjDOkjk6slA10W5O1xCPTuvoW/eQLm8CAhfO
	gG0zbcTe/XczM6GkY9dRsnSUNh3aTslg0XD5sjIMU8cG0raRCizF+YoT81GSqEp2VDxuXYKYDjB
	3ODIUY56wzmHTCZTggTeAnc6xIkX1srVwvu6pyaMW4OjlRctkHIwQ7Std3IWIBxqGcGonBZIktL
	jdRHP4xUDKPQaO7Bi+Rs06rjWvEu2Aq3oFfJMgYwlN5fbPDkH+hFjMTHyq6UaTVTmtNrpUH4A0+
	nwyV2qzMxEp04bQslW3EIB/2vOeB4xGwZ3Zg80lRv+Nd5FUoXFO4UibfSkg==
X-Received: by 2002:a05:622a:54e:b0:4e4:f812:20f1 with SMTP id d75a77b69052e-4e6ead85777mr42851011cf.55.1759928345245;
        Wed, 08 Oct 2025 05:59:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/kDjU9mNrWpli4fOGqzpllZTDEPDlABYWO/CgAWgxK//4LXGijoGQVXWueGutXf69+EneuA==
X-Received: by 2002:a05:622a:54e:b0:4e4:f812:20f1 with SMTP id d75a77b69052e-4e6ead85777mr42850611cf.55.1759928344801;
        Wed, 08 Oct 2025 05:59:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b011404a5sm7192234e87.55.2025.10.08.05.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 05:59:03 -0700 (PDT)
Date: Wed, 8 Oct 2025 15:59:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        tingguo.cheng@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Update regulator
 settings
Message-ID: <yjqg2xani47xzik4hrxcuaa4wwft4hyvf4dcjf5mosgdrrfxbc@fum65ap3zha4>
References: <20250919-b4-rb3gen2-update-regulator-v1-1-1ea9e70d01cb@oss.qualcomm.com>
 <20cb3921-1344-4e47-864e-ea99759a1dad@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20cb3921-1344-4e47-864e-ea99759a1dad@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfXyJIpG45O88kf
 giwNe2HjjA2IFBHLBo0qwZ2qpQhkbbLu2C02r2XmWrly29IBohFJe9U3mM0P1kUwENORw5Z/PY7
 lu2dQwpmPUDviJncaw3bXUYxWtPcxjbgLav/UIxdPta0WMlxFgzvP7xXi9Or26OPBUceYGhS8Xb
 lWAWYhcrM3OcwhKMfk8gJk0D0fxCjmt13HYWjgvVK4znvMnPmV0WfwZY3EHkcjRp5xDNas2LWFT
 KtJBXtS88p0DbVMNh1yEVWXvBw7itGz5UOOo29gvJVgf83Rz/uak85VwNNBMPmUYQLBE3WhMJ22
 uz6Vvn4G6G1hvzrRcEK3u5LODrAA54HHbv3ZZkE4+8T9chCYv2riIgsu2KuhRL3qY/vJDiUJ+cv
 2SfEItn9c/Yc93nOxjkajBVQdBBz4g==
X-Proofpoint-GUID: -gKiL1JOl7LUmDyua8YvHrYTYSsmxLgg
X-Proofpoint-ORIG-GUID: -gKiL1JOl7LUmDyua8YvHrYTYSsmxLgg
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e6601a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=wPZmJJNrXprZb9I2VNoA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On Wed, Oct 08, 2025 at 02:44:58PM +0200, Konrad Dybcio wrote:
> On 9/19/25 12:39 PM, Rakesh Kota wrote:
> > Update min/max voltage settings for regulators below to align
> > with the HW specification
> > vreg_l3b_0p504
> > vreg_l6b_1p2
> > vreg_l11b_1p504
> > vreg_l14b_1p08
> > vreg_l16b_1p1
> > vreg_l17b_1p7
> > vreg_s1c_2p19
> > vreg_l8c_1p62
> > vreg_l9c_2p96
> > vreg_l12c_1p65.
> 
> You should rename the regulators that have now changed their
> ranges.. I'm a big fan of stripping the voltage suffix entirely
> fwiw

I think it's typical to follow the net names from the schematics. Which
can include voltages. And which (unfortunately) can be incorrect and
misleading.

> 
> [...]
> 
> >  		vreg_l9c_2p96: ldo9 {
> >  			regulator-name = "vreg_l9c_2p96";
> >  			regulator-min-microvolt = <2700000>;
> > -			regulator-max-microvolt = <35440000>;
> > +			regulator-max-microvolt = <3544000>;
> 
> This change is funny, no one noticed that before..
> 
> Konrad

-- 
With best wishes
Dmitry

