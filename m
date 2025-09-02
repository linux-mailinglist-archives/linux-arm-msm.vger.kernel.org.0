Return-Path: <linux-arm-msm+bounces-71638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46407B4066F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB7A2188B28F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE84630496B;
	Tue,  2 Sep 2025 14:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idsb4DJV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D41FC8FE
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 14:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756822543; cv=none; b=iVkw2VGgSRYpawSU1lzvrPzhdB7RGoFhtqsm/zuZV3JAP3Jn/JGro68AnEFejF8MmDyJQcHwPLZWSgTJ2wKoEk53KMoFeklL5//FMOtB2UWIsRqs2CK7eKED6bMq4EFJzb49J685T2OvsRMGCG9uNP5wgwW4FTU+W+GFgPN/CP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756822543; c=relaxed/simple;
	bh=akGpi+QtTCgfYTofF4Pk4tpeZByYbVJ+RjDKLpVnM6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvcDAXjlp2MmindyxUVkUQD8SDDRq4CIAX0jgBQgxyeb6xSc4iS1EnkM1GIzeJZPLhkKMMeKk1gywzLHZ/Ip92sZsfvTjJZva35PUbLw5BErsbqGRYzfXs9ixUc3Xv/t7/w/kn2k8VS4DUPrHqa5BLvMgbJVxCYMv3IJji5XYnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idsb4DJV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582B68sU020757
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 14:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mlie5F52Ht3HYOWTj4ogGL6rzgMYQ/jMzQdCkcJA/LM=; b=idsb4DJVLCwHX/wd
	dLBEgRWQ5XfjnjoPCs7vnuCRGJDdRCLaAbT5T9svXWbSJnjAlyb3/SWGWuOXj3nU
	Qf062q356QCUP7EggKRkCFJpFN80p5bOLKePqvMQ+knYwQUYRK4AOeYvjlNkcp0B
	Mc0bbXRe13v93zHGHvugMaUGyLlbRd+iWqVdOTLObCSNW4oStfcXJFow81/iP6hy
	oTt7Qq42AOjVxo4tLmcNly88otHG5A1q5+jjW/t6ic29337YqqsxkJ8cJ8NkDG21
	ReeAlq5PVBOhG5ubWXO+i1jNO66SVUvqRx9IF/hi/OGahlLGwyFigblyPUyCj8B9
	XN0p8A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s0567-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 14:15:40 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-52b51898eb7so368439137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 07:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756822539; x=1757427339;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mlie5F52Ht3HYOWTj4ogGL6rzgMYQ/jMzQdCkcJA/LM=;
        b=FbbID+6mLizIrz6+Gx97UOQbqUac5P8pw76zUDrFZDtwn+j6bDe24nydfN+vZe0ygO
         M8jrPkHLQr6Yq8mYo11k8N9ISlgcBKRb2z88Lawti27OwWAA2Mo1eHRc/qPJZ483azwY
         RK8WiEDyx0gjmE4QG0TlV56XuixUji2LsNDL3VWMME+82TVx9tquvCNeY0fMCS9Rorck
         cTULGRTMElpi8mklNB2yD/phLc/cGSgbpZv1q1oUlQg1+iva0ZTJwRhr8A/J9R4enUpJ
         YWyt1TcOfhO1MkRz2fjjF1ELCyar1Rv0kvB2mISnuaNa4mNB1uy85lUQU0iwDfzrQYQA
         8PLA==
X-Forwarded-Encrypted: i=1; AJvYcCVY6pi7bifFV7YXxfFkovHPwJZt28Cg0w56z1IyW/ZoHy/mnN/iCi8GU6sgCreUsU7iwqpgtGEMXmO/DW3H@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4nbmTWDSK+FTLhTzr/1HC18RvOKxrIsPfSw/lCbCega2iEmld
	+WNmq3KTLP03pb1op584MCP7k0ix0lcrNx5VNMz5ek0TJMmVJ+QMivLS+sVWEg09VT3tp89mtBw
	M+4kGItaHDXzC9SS/WvKxhqR670UzD/eS6Ww9DGd+jiRIr+k5xLNcesXKytoBeBuzpM8K
X-Gm-Gg: ASbGncvE9jsZ4is28vbuts2C4FI8Xkbu+kPUYHZQQhpjmVUZqJuMMnabsXcTdSipbEs
	4n+XW1+s5hDxAAvi31EM95EIjWp7nnIGhXZmaKN2zcCrPWaEjJ6Bi06L337wU/Fer5waNFsAMBE
	Ot4PwV60U9zlm40myaty8ghbQJG6qirywDHv3v22dZg7IXgy0XQxLnpRDT+MQx4hOJgpOn7GKS8
	omg6rUcnYkUVcMX06Ao7/goyLjSCtGMZjfqdAEhkhrpRlDpTVrjug2XYv5ICXKKBla//PxO1CdZ
	KMthl85Arf+u+HnVjOfzlQkHsk3lVOyQV7J91oiToHl7exIz5ZerXlcg6p084/temxz9d+a5Ai7
	5NBc289oZiwEFY4p/MgjEKQkyx5yccr9koFdcSQydmbK4A4rvKQZI
X-Received: by 2002:a05:6102:4613:b0:530:f657:c5d with SMTP id ada2fe7eead31-530f666561bmr570534137.20.1756822537105;
        Tue, 02 Sep 2025 07:15:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNjsqepLP76zUIqTQQBX9Us4UoXPo5VPCLW3VzTnrFgAj+u/0dS6AteoLKyMgNUBFdMU3pqQ==
X-Received: by 2002:a05:6102:4613:b0:530:f657:c5d with SMTP id ada2fe7eead31-530f666561bmr570468137.20.1756822536291;
        Tue, 02 Sep 2025 07:15:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-560827b1df6sm730194e87.143.2025.09.02.07.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:15:35 -0700 (PDT)
Date: Tue, 2 Sep 2025 17:15:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Dang Huynh <danct12@riseup.net>
Subject: Re: [PATCH v8 5/7] arm64: dts: qcom: Add initial support for MSM8937
Message-ID: <gkkxxd45xclwjs6cp2loj4male7wobeacbshvjasolr4accz64@vux2ou4wa2wa>
References: <20250831-msm8937-v8-0-b7dcd63caaac@mainlining.org>
 <20250831-msm8937-v8-5-b7dcd63caaac@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250831-msm8937-v8-5-b7dcd63caaac@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX+1zOIDrfCdmS
 R1yzbwXlEU9dPq7CIBIWT1DjJ3yrlcmHPUnzQ/BZK5ZqsOuk15K0x06EzCTXcBCsJVgnzXtJ2Cw
 aq8W4LjF1r7jYK2/htP4AKz1CTVAE2yCdZ+QS5NUzj9MCUvaIXFITTjQmzEOvV20uAfEUQOxFa6
 F+XxZwW5zmGrCe17JvpYsMrUhbz/6igKivG/wLftzjmvejQQ/Vod8o/ipGq7RtzISxV4e1sgldb
 ZpLGXV2hW2p7IwT55qK2NAh0MPYekIPwhIeLtxAiBl85i1DCTDv6NzFHp7hXeO0mobYJzj9zCjp
 qx5qevcsebk7apWw5lmcbfrz0RNCjepcHy6kb5vTvPCEATyZYeqP1AH0YhyrYAiTOzOzL919jfN
 4MIHA6bs
X-Proofpoint-GUID: 7TcbxkeaJ2CgHgcf_SpfSkN4SSWKoA56
X-Proofpoint-ORIG-GUID: 7TcbxkeaJ2CgHgcf_SpfSkN4SSWKoA56
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6fc0c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=bBqXziUQAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=9HHfay7fNgEZ8udxRwkA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=BjKv_IHbNJvPKzgot4uq:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On Sun, Aug 31, 2025 at 02:29:28PM +0200, Barnabás Czémán wrote:
> From: Dang Huynh <danct12@riseup.net>
> 
> Add initial support for MSM8937 SoC.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8937.dtsi | 2134 +++++++++++++++++++++++++++++++++
>  1 file changed, 2134 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

