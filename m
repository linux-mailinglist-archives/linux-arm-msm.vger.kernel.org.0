Return-Path: <linux-arm-msm+bounces-86411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DBFCDA52C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 20:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46DC4300BEF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 19:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53A4347FEE;
	Tue, 23 Dec 2025 19:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G38WDIly";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WcY3yqEU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ABB348898
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766517170; cv=none; b=AhFXCFdtg7LNcvgkizbbaTpyDFA/8M3wBUC6bV0mwysua2NOwyoh75WB9xmnS/yzgW7XlrlaY97Xgm7AAjsIO29iUQHkuzC4qxzQjwJYrmjMsUhrv5QQKqXbc3LIAYhpNWlf3WRnZGZIRF2Qk1gcnM74NmaQ/L51hQGIoHEGwkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766517170; c=relaxed/simple;
	bh=+Ca8JXvlzw32qC819wH6+qj/Gv0QDBrsl37HjLp4hlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQIWRys9ao0end9Rwx4nZg1qy53IleV0HPlnWtIeiNqseRKvhq7PLnDlF4ti3xDXzQozHCEUOwUkzeWwhxuyABay/4FwnlLS7yrBel489SEgqkzYQzJYxFpopNUo5UnJnt4mhh6iaEaWnPk9ZfIMz90dwzWWX/0IYCkVTcjCnzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G38WDIly; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WcY3yqEU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGOjqo1019195
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a6/CjYw7e6cozJpzWp9ah/nS
	fHG0EGfAivIG2TJ9WMw=; b=G38WDIlyBykQNtgoxRi0FRMT4O7XUl9BKmdLw1+u
	l4Y3vkkRiqzTwckq395DP3tv1H7XpWx0HOmJMWLfVzZr1fMi47c2uK/qjXRy1fEk
	DAXCEVbsgsNJJT5pNpMkHGld72m8nU97XUKV/UvWTmf8qwlnc9CBsw3rI2pFMjUZ
	FSnhmnBtccEaVENj77VDrTCRyrhjm2aZY7J848rHStsxmfQ4wwzTqCnPP4JTK8x/
	KQ9GH9Y5NisM63PFR7VArZgdnBRTyMMuBfoYTdh32O22IfWMBdr5j7tUbRPoWWaa
	C4vNoG2LvcO+qLnCo5WFYGwIkruEKL7Aj2hB18imPEXm3A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjs8fgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:12:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a366fa140so246490636d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 11:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766517167; x=1767121967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a6/CjYw7e6cozJpzWp9ah/nSfHG0EGfAivIG2TJ9WMw=;
        b=WcY3yqEUN7stNhzjmj4/453BItP9LkMpjg68/HtPG+I1N76SHtZWp2lVqTahN85L27
         4T7cwy2E77igu3zMVEPJcf704DNXgxUTdhXgWhoOkjYGvRYdhd/bMD9nLl4xONzMQNzE
         tQfAV40AGCJ7B0vyQsuKQVzRTu6t/pxNmS9+DRY/VhHzlceot0ozfEKk7/t5ZhpQKNc2
         uGROaXcpZdODR1kfatwV9NLHZMbCadUO9BOXxxB55iKu4FWRcbASWAB752B5B4KpQuAW
         P/vA6Lo/I5jWWdvPfBMjnpvXRBVFNBTiNBbIfmxf0szNYrxPjQG1d3qQbUui70OtTGk7
         Pp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766517167; x=1767121967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6/CjYw7e6cozJpzWp9ah/nSfHG0EGfAivIG2TJ9WMw=;
        b=sv66o/ToFSZ4/DA9xqlc1STnf0NGBnRfntIDuEJXpwF5i8jWcMDRuxfoL+fakv1wVT
         6HgANFYfWsw84wzvGq2mf96Tyx3HOqu7QNDTsGcmjUNp2s0xav73x+SE00/s/ahWyOqB
         VDQ6kOBYAut01qvcELHHeX9mhSLE1rE4LlHSiDKaXt3WVd3OGOhNZUEP9dH/aHSebDdq
         c0bSZJYjiVIAYQ8G1SnmFWsIiJrw8souQgwJQLndTP9mgj09FIMTmi4HKmVbfoCHIlB5
         eklDhJKVlebTdyt2XWRRxtwQyvwhOStFexggAyCD0V21jl032IWuiFXGFJ5avXHzAOXn
         J0RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdJHSsAty7Y/SkJK1NQ71oIiRm41AGUZLT2JIK9Mt9mzG7S8b7w7EFSJNsA92HVg3rTv6ngkjQJyuoeSx3@vger.kernel.org
X-Gm-Message-State: AOJu0YwCPnrU3Sbj7M+Hv1ke66LFxB1+sHi97ojKT43bTYB5fL2hIPuc
	pmtAkAgXKECwtXGiZ1Eo6kqcAfxV5R/8KbFYi8SKNC8cQI0wziHQlQATejJ/uiKzrwr9KfdrcD7
	sul1/wXY1WciuVFjX4PAs5g3OLpEoVYnoAfPZwloFquiwNncrV8140KC8mRIFCFlv9Lmj
X-Gm-Gg: AY/fxX4/xfRK9htiQ5GrmOfUQ8qMnUqlRkH/VyFPC9TZZsJh9guwjq5TJKpKnswQBYk
	OULcMySvNXgcDw3cBZbbrJ8ttH/F3zokTsctjv2VsWRw7J6DJmVS4PMbFgsLGp8CM057py2ZLkn
	5m8p0la7weCVbkD/O3d5VlIoJAkByNdUXXem/Or4/SGmoW9DYthdN9Zu1k2dy3j9rZfqR+eTC2m
	xpcf+BxkTkkyChbjgMDcy8kAxznWz4kthICzu5gD8jdsnVrjlHCRz3phy98wVZv36RtDdbMunKn
	Nswlr4XlyP5T98l9u6IpLE6a3nkcnQvQ2p6EWyBG3pC/KpT8auXWlvfao8izMX3/2G561iX/o2q
	MyDXMrEFvaHASpO5rbC3Y4cQZ4CUFiauvaUGT7bpcpOiDcx5k5JDpCkJfZaRYqt2AjXfeTpkKJX
	h50sG0tjC4o839E7YoINA9Asc=
X-Received: by 2002:a0c:f202:0:b0:888:3d48:23a8 with SMTP id 6a1803df08f44-88d8369e719mr238735656d6.33.1766517167497;
        Tue, 23 Dec 2025 11:12:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFd0YgUXe6UyYr6bzye8X8pEsOr1aAWcXSFeF/v9ijcXTKkmtSG4WvYOaXxw/7cBjmM6zbp4g==
X-Received: by 2002:a0c:f202:0:b0:888:3d48:23a8 with SMTP id 6a1803df08f44-88d8369e719mr238735196d6.33.1766517166993;
        Tue, 23 Dec 2025 11:12:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd901sm4346101e87.34.2025.12.23.11.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 11:12:46 -0800 (PST)
Date: Tue, 23 Dec 2025 21:12:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Use lowercase hex
Message-ID: <3oh42gzkrhnqp7i56of4bd6xtfegue7iwlijcxhuno3tffgifn@hl4wamkkzjsy>
References: <20251223152559.155703-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251223152559.155703-6-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223152559.155703-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE2MCBTYWx0ZWRfXwfHkyk88pzLl
 eTFk6QkxUZl906Agz3NXEKYCspAPcwbS5VSbiRZHuHY5ORTgIHrYhb+ub4j+t7PZKFof6147jkd
 LrUc70VjTvEjdq4HBpmIA1axDG4jZgDF5xAflc/MgODOQlYh+jlwPSWi8e8ipFbJhhx6/a/l5qB
 xTI64JqrTMybqMdsHb/hzz774JMk31LbGcyTo65JQ/8HoyIJFZE4AZt+1YfDkeDSiPUQKeA6jCO
 aDGhdWqwi0Rc+4A0kRvNI7THlDPstz3j6DbwWi5hq6RO4hwqma3JV9D61v1BNj0SDm+jaYCK+VP
 rURkp0X21KZENDer5eQTaYh4Pi8H6UMTdaLE8UzveontFTEhEY3fzwtVabxNGF2B4I0zAa//7s4
 F06qp60WSirDSiLxQw4uMjre/fgyirmP6zdVKxaYyYuir+ZFkGPDo+O55sln6gO/hCyZABs+aE8
 sjE9igYzbZUoFEsdidQ==
X-Proofpoint-ORIG-GUID: _1TJ5uFIGR9f5SI3K-rLUxsdK08qwqBs
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694ae9b0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=oByeqNVlwfztVJPeb9gA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: _1TJ5uFIGR9f5SI3K-rLUxsdK08qwqBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230160

On Tue, Dec 23, 2025 at 04:26:02PM +0100, Krzysztof Kozlowski wrote:
> The DTS code coding style expects lowercase hex for values and unit
> addresses.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi                  |  6 +++---
>  arch/arm64/boot/dts/qcom/lemans.dtsi                 |  2 +-
>  arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi    |  2 +-
>  .../boot/dts/qcom/msm8994-huawei-angler-rev-101.dts  |  2 +-
>  arch/arm64/boot/dts/qcom/qdu1000.dtsi                |  2 +-
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi               |  4 ++--
>  arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 12 ++++++------
>  arch/arm64/boot/dts/qcom/sm6115.dtsi                 |  4 ++--
>  .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts |  2 +-
>  arch/arm64/boot/dts/qcom/sm8150.dtsi                 |  2 +-
>  arch/arm64/boot/dts/qcom/sm8750.dtsi                 |  2 +-
>  11 files changed, 20 insertions(+), 20 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

