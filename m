Return-Path: <linux-arm-msm+bounces-56768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A1BAA905D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 11:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68A871898552
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 09:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2245D1FCFF0;
	Mon,  5 May 2025 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gEBvWWkD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAF91FECAF
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746438949; cv=none; b=Q6ZYk0wIafkTQL0vCShYbq7getRhAkFbFD/daPSUUTNcO4CEVBXvbXxtYOQ5DK1tHjek9+RngempLMtl/vYpd3V0PEwgPDY2RlJepndaaRwnrtKBE51fP/D12DuBc/wB4kMVUnLoJ/oDsu7NTA9qtjYO4RXl0e7DLTzgbI+IHDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746438949; c=relaxed/simple;
	bh=4fXXGQzfUtKtkKuKQhES1f00tVzlysT3cxFwz6vRIHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFTcBJf3uGoq81T2FZyy9EKWNwGzyZA3Bv4R6UNiKfPyZve0KNUUYQo/aJxZeYExCsmvrdSAI5e0nCNR2JnJ/lvE/e022AmyVhfwpgfqKAKNBCHnjCe20qCE0KOnjY/topZ4s2G4wZChox6tZ3UCH60qeTHO/0Mmz3T8D+0ap5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gEBvWWkD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NkhTP016247
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 09:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2/mHzBkdkIdu/XMlXL1MKLhp
	gnZzaTuY/YtYOHlKf3k=; b=gEBvWWkDAkH2mH/o/AVZkrUpWTD4uiNsgHtK99c8
	AvUfzmTcVjreuEAaeGXJ/02eEIQVkGXFDalkYM/5GLCSAn99rML7YNX/pC50nIsS
	ARbmezpJL6NLNvoI3xhEWcqOXRB44X8Q8sidxWpM8ISrkmYsS9k+rRN9UuHyU3jP
	A0G+3psf8E207D7s+ToOAFiLPZ63rTuWfnr6jTdTV37lmBzKyhOSU+mogdFjQU0r
	JWA8PEzy62ISv8yXGXeBuGteAJsCyKuFcoMvKC9GMlth9GJOmbaJ86zYnIXXRJdB
	ZlY3rRmqSodzYAYI6sr0mGzsxaT7lWLHiiD3/YwD8mPf2g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xst70g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 09:55:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f4b72d4ba0so80733236d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 02:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746438945; x=1747043745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/mHzBkdkIdu/XMlXL1MKLhpgnZzaTuY/YtYOHlKf3k=;
        b=DfUZG+RkQqbWCKMwxBmWR/7HE1Jc5Frm0Qseag/6YdIyx8Zo2N7G/r8Gw8G5NDyPgI
         B0RYjZcuu2Ed+2vWr9V6ZWZVHsyS/Kaa5sJO1SNFvzLFMIB3hI7SsZpMQhc4QAbxH7h9
         7oTe8bT7DquHWakoJ3dKSNyMYzO6sD3P7XUCEga7LiiF/HwOPZgojUq8Dtubr7hz1gkq
         hFvtletFobm2Pwfq4eYdLwQUUAYYKYiO6dm0cD+fNRuf0kFvJloyc94OehNZcNp39nWd
         gqtANgaS+weiP4QMXmmGiBLaHI3J//NjYN9j6Rg8gv5HH/uUaaxct50eSQkOR/iSwfD4
         SA6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOsdG+RmzLlPf1A+qLDjYcQ71vlJPceVTMWDNbTSw8+a/Em8Syd5E959d5a/0/dc4FP98b0/Ycb3ms6Giy@vger.kernel.org
X-Gm-Message-State: AOJu0YwPGIxfXLaCycrbA0KqC8AG47sn2JsF3ruamaCukIUJmnBUJ4oW
	Wmv2SNMxwQSn7iDybE2EY3+zaBHYwWcKNTDg5Bz2LpminZBm9uABwoaigYF5gjwLIkxXTl9pjab
	WJ/ONNaHJ9NYPdz6cb4SMJZLO4bejTtBmIIVV2YcgcQtc1f3b0qpsh7F2itu9nVaf
X-Gm-Gg: ASbGnct9OnGe0vkxnIvyG9DtMesN4Ga9Wkv+jJQU8+SkMJRjBeL7Xd93WxDhkwG/GEw
	rGyxDZunnUsV40RoZKHRyn+j0yq2332Wmyx1ri/aUiHBLOrF1psE78BQmqlcSN5Vwx8Jr+uqMqd
	metZAJV2xG6HO2iBE24vmBYNmHhDmVvvZ/eAJ9kHCRUpglNh9PvL98i/usGY+fSmTec6rBgroaU
	N9i7ZMXvAg2SToLCTpV6QCKn4KT5u3EpdiMkkYga4UFkidZldK358vDLz/wP0XDpoZJpydftUIv
	lAgWgasl++1usRrfuvgVNcYM//UId/uHf7oWnuIeprLFvxwgb3XXEX2fNGhz/mSWbxp4hBoSU1g
	=
X-Received: by 2002:a05:6214:1c0e:b0:6f5:117c:76cf with SMTP id 6a1803df08f44-6f51580c00fmr168424586d6.40.1746438945413;
        Mon, 05 May 2025 02:55:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGknyWbznndebKntrV92c9APdUuAC3oqeLq7ISMW2xppAZupC/c68JL1jEz5Pc9uS8Y/NJ8Dg==
X-Received: by 2002:a05:6214:1c0e:b0:6f5:117c:76cf with SMTP id 6a1803df08f44-6f51580c00fmr168424416d6.40.1746438945126;
        Mon, 05 May 2025 02:55:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6a9fsm1658248e87.234.2025.05.05.02.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:55:44 -0700 (PDT)
Date: Mon, 5 May 2025 12:55:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] SC8280XP SLPI
Message-ID: <xwuxekxqqt76xi5vitfwp4juwm7vowkdn7zjniymup6pmcwwef@rkr366xgetxz>
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
X-Proofpoint-GUID: vva-EDDz5uKZVnfVKzGQNSsL0MaRwtX1
X-Proofpoint-ORIG-GUID: vva-EDDz5uKZVnfVKzGQNSsL0MaRwtX1
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=68188b22 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=x_-MvMI86miFrt3VAdAA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA5MyBTYWx0ZWRfXwcetlvbucavN
 2VmXjzmFmrjhaC1N7MkJxC+bQE4tRnMX7nfy2TB4dBMr11nNhq+/idjxs4Hn6aSK2zlKiHFL+nN
 fdJxRrVHiCArO3xTLoROxF40OaUwLjHiUTTsMkQFbNmAkAZRLhP9DA48RCb7qLskYWqIr5U/g28
 ReXue08nFMKiUsUzuFDxlFgcqoqHn8tSq2hoooLDFJfOtQAJIvYUJ3S2YTstdAgsodcPAbZLg8T
 CREOZPGNlclWW9kVBPPE071nUUJ7uXP9TSbB3sffKbIdpACatg3cBF0ciukW3+1oOUyZGfNpP80
 aCa74ipnsF6r2QbJ2yZJP2w3z91k5c7ExFIAaNrcbUgWVox1cCDYJVBXCHZIZvms+bNgeZkgJyb
 XwaKSJqFB8C130qH/uN2aBLxhQ0Tx9E7FyeUDl9QtTLR8eux/9ppDhj/Ey2rMwn1GPph/fWC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=608 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050093

On Sat, May 03, 2025 at 12:37:58AM +0200, Konrad Dybcio wrote:
> SC8280XP features a SLPI, much like its distant relative, SM8350.
> 
> This series adds the bindings and dt node for it (also cleaning up the
> DTSI in meantime)
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (3):
>       dt-bindings: remoteproc: qcom,sm8350-pas: Add SC8280XP
>       arm64: dts: qcom: sc8280xp: Fix node order
>       arm64: dts: qcom: sc8280xp: Add SLPI
> 

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # Lenovo X13s

-- 
With best wishes
Dmitry

