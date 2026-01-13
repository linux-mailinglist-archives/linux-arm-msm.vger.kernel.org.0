Return-Path: <linux-arm-msm+bounces-88643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EF6D1620B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 02:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A23E3026B02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 01:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A88262808;
	Tue, 13 Jan 2026 01:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGPl4eRX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="htjowIl4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB82256C8B
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768267118; cv=none; b=WWqL6PDr3mYzPWA9rHAnl2j2IFC7cbKX30Huf/zCw4A5bnGJ+vxw68zdx5qNi7wGTakPzZwv5yjaE1Xj3XOZ5VPKdYNVyXTkPAb6QELojBHMdZyxIhsCfuCGOjf3DjE5hInzEgJIR4+4LMuDbITWTtWiksViuLthuRwJJHtVV5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768267118; c=relaxed/simple;
	bh=DcdBU8InJgMguQ2iTSiZxsVXaoWbbEYqvuCyyEOFkOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrlmUU+8/Ue1+uwTfOH9HqCMzRIKUyg22sDzh8D0UE3Tqv8UyQ0gd26q+wChyimYOXiIDvjYuN4BWc+VMT/0yeZ16cafjvNbloaf3nTFWeYvoSEvx/lhosPStrj6kzZ37qU1ukTQSmYRdxjwh6LzYeZW93WPUg1qLR5ZR1U2Cbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGPl4eRX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=htjowIl4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CN5k672811898
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wTkdGQ8kKP6sKFT1qADeBrtyvC4PpVNNcTkxvZ/+Y4k=; b=aGPl4eRXZXe11A6r
	UgI45mqq3dzacSv9kaXo90migfZsXmnytU+6nwHiX3xV05eFH29N149Jf6qFpse6
	MYULFic3ATw5ArZHf2+/x2sYF9f210JV6UsGcHAJNdOJgAoJ/mGYpEsaRimbILQ1
	Fj2kgqZFPwRxR2ixlhqC7RkC+w7btd9HQ62R9v2Itkue7JowqAu4AOdsFjYWCPAv
	QHiN87hxzISUuy03dm2ovZt4UOedQ3loSEtVc95h58n8ml44W7ZxWU/6+cbC2MKF
	3adhwbDsYLmbJbmw3exBj4hMavaZZkCpnqihk+r6Ei28QruSnwNXHPqslTz1CXrq
	HpowZg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6fbrynr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:18:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2f0be2cf0so2168748285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 17:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768267115; x=1768871915; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wTkdGQ8kKP6sKFT1qADeBrtyvC4PpVNNcTkxvZ/+Y4k=;
        b=htjowIl404LE6kxmYJqSDVsFz7w50gV6bLcgVujurhKWDQXXBIB/RxQNnLFREX8pEc
         U7N3Izn7PR7KnnzG6b416DDZWT194qV1pI7QRvP7zJkZyh+J6XgItn19HstxWdJQonTI
         DxRjbi8z7ZsCKZdXXPNjQdvcRssGkzh1Gqt4PMUnDFxnRUAX9O64Z99PFvugtBko/eiS
         UsDznJs0QOUhFdGAuw16Xr/q4WtfCF94t9O44u+LxyEGMdgapNgPfdfQPJMoO1JhC8rQ
         srRjP0xhAV39/K9s8KsdAPwCFeJLBU4rgGt51amwq75owAv9rh7Sil+KQoTTkYFJnESF
         4jHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768267115; x=1768871915;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wTkdGQ8kKP6sKFT1qADeBrtyvC4PpVNNcTkxvZ/+Y4k=;
        b=KZq9UTgn4yBwRm7c/KYJX4OE7bnqBBgR3DMjS21FA5ZlXVwS9cfrL5cN/uiNmSUkzc
         q7+ntQBhtyMoUPKuvDh2d1TTAqf5Nj6IUoQTdo41awRq1qXa8hUASzypFnlNOMFeI3w4
         50Jp2SkL/Kmzrk/UW5+GT1Mv5LGyDYMK5y7qHgrp7H+UnQOsVMm3Z6YiPuXuugffn2yz
         Wg0k6kAnp/UY9a7+w0n/th6cfILzze24vWaKZjWXnLjKJbe4aaqeGMCpu4Wv7Cb9W0ei
         LN04CEDw5rqcJ3th2+JDSmsIONhHVUR5sR/AxUNc4toLpFk2P5UGH7i2wPn6oSoMGzeC
         eqow==
X-Forwarded-Encrypted: i=1; AJvYcCVVgBr92K9srZz+uYdmXfIn8+tvhRwEE5O+Jw8cYqojAwGgA8I/u+mbPgEFuDiS5MvJCsofO9UaN5YwZz9z@vger.kernel.org
X-Gm-Message-State: AOJu0YzhLvIi/FWQAAPTkiLWWPzziKoLkfBrpL3XDpKrSYzIs0F8GKZq
	FZu5UQS6nt4VDGp3kkndEyBMEgFKedCVhPgt4ZmQIW2bAIan2azzP2leWahNqD4zFZeAP+BouLJ
	teCNCcMmqgtpN71naA2Mp+uuQ2Zt2HpF7/OHxt7XC4MIm8FTJ+JsfhT1+THDyMyORa/iL
X-Gm-Gg: AY/fxX5YKsBT7ozw3yjtUhBdgMwW3V2MvXhUAlnSO4IUl8nyJoyhvMGzDBQ0eofJ64n
	thiipgHOI2+wcVrCh5QuQFeNX7gJDh4EoR/TEfW9KLM7S1xPEo/HALih/ZKV9YHX8/GB9FZ7cld
	7A0wu9afTBmQw3tO+DW4p1nQ0ks+u5RUjze/H2idyy74XG+2BFNCJgttGz3Oi7yLUCJjkssi2/a
	QPsIdAelyGz5zZwirbumFz/aoWz17rb97Wm1H4DW7uHOWsbDprbbs4TB+dir0ZwPzUTMpE73Iq8
	QuxYtReHkhogeqj6P4vI3JpRIXoeYYDvNLeHpUXw5zKxhLFiV1/VrQMrLLlkVIQFmIXvA/ipc8Q
	Mfpx9kBHqqXJ7UqE6RT6DgVWN0EZEFTgFgIlemv7m04PNqqJyDEYeXuGEoy6aVJ3TnqB8cmJZLu
	HQ+54nfG3p3asDduDxs0PcRO8=
X-Received: by 2002:a05:620a:290c:b0:8b2:a0cd:90ef with SMTP id af79cd13be357-8c389407515mr2700221085a.70.1768267115377;
        Mon, 12 Jan 2026 17:18:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLZI1hd4woXlXq+FYN7ag5gwJwSjpT2Ga+pQiFR32NkRsBGaCGTDamRbr7UbZnimayaujyqQ==
X-Received: by 2002:a05:620a:290c:b0:8b2:a0cd:90ef with SMTP id af79cd13be357-8c389407515mr2700218085a.70.1768267114909;
        Mon, 12 Jan 2026 17:18:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea275sm5094320e87.1.2026.01.12.17.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 17:18:34 -0800 (PST)
Date: Tue, 13 Jan 2026 03:18:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gabriel Gonzales <semfault@disroot.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Biswapriyo Nath <nathbappai@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: Add Redmi Note 8T
Message-ID: <2da7ufltv6xfek62j7r33lrgppd2zm6oahhhiwz57w3ckcs3fn@xcclze4oalo4>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-6-8e4476897638@mainlining.org>
 <3d2qboek2kzsnsjmn7rqi6xkfotfchc7vdmyeprivu27l3rw2b@i5lbwsvxfwdb>
 <aa8d5d6f9301d94b56af4580210ffc88@mainlining.org>
 <nrudictx64m24ydh265c4ma7txfdmmncjqfl4xq6zxvk75lkzq@wu6vnehc3dqu>
 <abd31188336b3322b9322f1e6791320e@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abd31188336b3322b9322f1e6791320e@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAwOSBTYWx0ZWRfXxPRpqwQD6RYM
 Y51bdJczoT3+AjXQp7iWkw+dyF8c4wfmXgbX+RBtMySnyWvUH23+cKFvwqpw5oXQHsABkUpP2Zz
 lCg3y7Uc3mUxkODwidNzcgtmmeYn3f+DfuJyhaQnqj2U4JzMIJU+5A/FLlpr1CYhWKqltY2vQvK
 HdmqGcKOtJBS5jBJwASAasnbAGSjdY0BefRmz96WlF2mQbR8MYwIh5dA0oeMCgY1g3CmrzVam0t
 3aJga3nMhv8PUg6S5mEl4qUHv+5bW/vKir6aByZFTMKT0iqP7ktqh3M1XLAkhdKGdKVMEH2jjmX
 taJFulrGE6oReqaoTy81ZFoKY9gDGLKlazPFEFEjgeX9ROxO2iD3S+Eo/K2tfdcc6KNM1JWQX7Z
 qA5KlG3ppO8drnyZIr1f0TUTJRJPjvCeh/aWPP4yFJt635rf53bZ8c+hJr1tCAM1ZEi10csBCNl
 c6QIuCLn2FlWfZzqwqg==
X-Proofpoint-GUID: t5-nQl3tFnq56zbiYGVxM8mBnTdF3KWy
X-Authority-Analysis: v=2.4 cv=ZrLg6t7G c=1 sm=1 tr=0 ts=69659d6c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=OuZLqq7tAAAA:8 a=LpNgXrTXAAAA:8 a=EUspDBNiAAAA:8 a=GsNEW2zrF1RCk_DmH1QA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=AKGiAy9iJ-JzxKVHQNES:22 a=LqOpv0_-CX5VL_7kjZO3:22
X-Proofpoint-ORIG-GUID: t5-nQl3tFnq56zbiYGVxM8mBnTdF3KWy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130009

On Tue, Jan 13, 2026 at 01:49:58AM +0100, barnabas.czeman@mainlining.org wrote:
> On 2026-01-13 01:22, Dmitry Baryshkov wrote:
> > On Tue, Jan 13, 2026 at 12:41:43AM +0100, barnabas.czeman@mainlining.org
> > wrote:
> > > On 2026-01-12 23:15, Dmitry Baryshkov wrote:
> > > > On Mon, Jan 12, 2026 at 09:13:29PM +0100, Barnabás Czémán wrote:
> > > > > Redmi Note 8T (willow) is very similar to Redmi Note 8 (ginkgo)
> > > > > the only difference is willow have NFC.
> > > > > Make a common base from ginkgo devicetree for both device.
> > > > >
> > > > > Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
> > > > >  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 302
> > > > > +++++++++++++++++++++
> > > > >  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  | 296
> > > > > +-------------------
> > > > >  arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts  |  13 +
> > > > >  4 files changed, 318 insertions(+), 294 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> > > > > b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> > > > > index 163ecdc7fd6c..70be19357d11 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> > > > > @@ -1,304 +1,12 @@
> > > > >  // SPDX-License-Identifier: BSD-3-Clause
> > > > >  /*
> > > > > - * Copyright (c) 2025, Gabriel Gonzales <semfault@disroot.org>
> > > > > + * Copyright (c) 2026, Barnabas Czeman
> > > >
> > > > Hmm?
> > > Original file was renamed to sm6125-xiaomi-ginkgo-common.dtsi this
> > > is a new
> > > file just the file name is same.
> > 
> > Following Konrad's advice:
> > 
> > Would the following addition to .gitconfig help?
> No, only until i am not creating the sm6125-xiaomi-ginkgo.dts and adding it
> to the stage.
> > 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

