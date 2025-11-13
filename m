Return-Path: <linux-arm-msm+bounces-81509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A84C55995
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 04:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3A6E24E5AFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 03:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03A42877DC;
	Thu, 13 Nov 2025 03:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RDeWLHol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXfl8gn5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374AD2853F2
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 03:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763005890; cv=none; b=EeZxam2g9dcThjAOjR2If2mPQ6cR/V0JHA9LAwpZ78V4doZt2tNY6k3COu4fULY282NWOd/9+XrlrT1Ar7elAZT8lAXiB2Xexs/4Vwkad++XAjNTl0mnuzXtmx1KYfvUnmpcAVokNAJddljkyiUoWPcXk/LjbQJ33K9kBRKJj/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763005890; c=relaxed/simple;
	bh=dm43yIpUSUgoHYBigryFpNRAR3gcbeMI1TqEb2Fu2sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FdRgOzvV5UkPDntrIpXG5wink30EBo0wQoa4zQXVqbnsVX3gugn/YtcOs52UibpCPdOnmgItCA4Hb4pfjnLyiotYEdRqaL2YYDoDRieq+48aVecMMbqtUnzTgnCdzh66kj1LdibWjll4bDNn6eWQJoIr6lLoP124ZvOQsgoleZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RDeWLHol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXfl8gn5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD11DmN3117455
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 03:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZDUWVc1JY/664oQBKeQMoM3n
	vN/xoHehdQznDtdVxG4=; b=RDeWLHolPT3PFQW0nlEH6l5up3UkLYvljkJ0v57q
	daRgs0WzBHUlIUCuaY5bVuQqRnpzUcSw6sblkWnkcGrJVaISXL7BcxmLQEslXdzq
	d01Emb35TTEXGC1V0qgWZDPSAaLhrQnsaqJgrvDXWsAYSde90R+SjDFydBeuqOih
	qmLOcvB9M1ftf2ldVnWHdwIXpPT/MKaijfOn5G8DdQiS0Y1uQOYg0j8FxZU0+x9N
	+kylKNc3km4M2bnVdy5pB9BCN8DF2iBVm83JavnW8nkE2Howlvt+1B/1RxOMd+Ef
	NSLWKnJNtnyUFx0lqsBcqbun37pHg7ZgMNmodEuDFR4jJA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuhg2baf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 03:51:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8984d8833so14483731cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 19:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763005887; x=1763610687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDUWVc1JY/664oQBKeQMoM3nvN/xoHehdQznDtdVxG4=;
        b=hXfl8gn5iBoDrQVdc0esdofJ2bAuHZccQEMQ2S8pzt0BazaTr0XQmdtSeY9ACP8QzH
         fXt6SqBmpOHXhtjyz7htHJeeOBoNGd2uuz495i761At7Am72EVlTUn/h+vgYjO+VxBkb
         DsbdrgFEQ68D/A8G6ZcgTeRrdbnXvAZB6l/5GIaxM30RqyRMqHCE8TvPBzwypq4fdjWI
         7QJ84RNt6I4Zc13a6c4OhRlW2JXr5Lv+L3w5HxE84UJ6YylsUkO4WZJ+2mudKiclbt4U
         mKr8r0ALaTz0rNPz4YOjKzCns1Pulum534HWJiHMeoM4SyeOCyRrErLlvZk3PNHEUa0P
         fNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763005887; x=1763610687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDUWVc1JY/664oQBKeQMoM3nvN/xoHehdQznDtdVxG4=;
        b=whrUGdtOICkJC8VSWaHFGvUx33/lIswoLn55zyH4RAVDChSyrK5Lx4T0duFOo78hi0
         kF1jOjKM1lFk7TubmfWh5mnlGrLefifMtWxb/iclCWlEH+8Wa5c2I88J3VS1Y1Azw8tv
         sCCsYi7OuBau2XyYNV7VvF3ydib3H38bapXkPpoaR8JmN/uSZrq20YXL1frh48k6ybe1
         W/eTER6U6nAmxhTtodVtk/KCAfF+WkmdlvRw8B1D9EO6q1WUKpBr1/TYLXo8DKR5HsGw
         mDJmMZrkjkhCLdiafm5HngHtPV4nft6D7ZFDPd41hUcFYOmA739gX0LjIsGVxID8YrH3
         Z3qA==
X-Forwarded-Encrypted: i=1; AJvYcCUi/GGrGAhj1tT8VobljCQTLj8czkgdU/PyZ7Th+cvzu0ohmy1kojpTjyd/yApKfD4obJfrZl4w9u/FlWV9@vger.kernel.org
X-Gm-Message-State: AOJu0YyCiEgcwQwwB09G+iB3G2jsGtZqqI+LkaLimfHCKFiEGR/nZeaM
	MrHjBXTerkxzPzGF65QnxdBUSNdb5Ed9QgZgTzQWQ8W9pJHR+ROcJHF5VH/9zFh321Gnfpb92Id
	L0QoBtVYlJ5btxhqdn1NHYWxxGzp6AXrgMR9CsmkTKSj6A1yv9T1vJfLoA9XuVGaJnUd+
X-Gm-Gg: ASbGnctxxUvtVfhszs15NZWc2zk6qFJ6VfSd5uMMbqbpb8NVoMH2nj1RJDS4fe/P9pu
	R3lSfBn1GErzO/T93EImSFJky9mZvAnujrNRAq7K8k3Ger0dIx2pW+bJ9oOQezPpPpV2mPM6jhB
	EQPdGcI0d/h/DFvLbJJNZu0XOVEg2u8MF7RfN599CLcSgVeKhJmVlkokGt1FAxK2W3Gi8nafHxC
	ZAXu+WM04YnUkbze/xUyTUX5/FO4lntYawrtkDRcpRKV2NzAkxBcElEP0KK2RjIUV6UVwKxb1aU
	6kTjf34UgKTw49url5CJ+wJ/D/BqhdE28U8XK8i2vGiJlxbOVPJ8jkoNRpn87xWlfaiSqxyg03o
	2vhEsWe3eSdy3w8vGBi2OcwnFwYZ7qoBdqAQY6g3j2aOV1D5oCpOwbHuRU4LWZibKdZ6+lW15PK
	WN0lPnFqt2+apm
X-Received: by 2002:a05:622a:14ce:b0:4e8:93a1:7464 with SMTP id d75a77b69052e-4eddbc7cb25mr77817631cf.15.1763005887323;
        Wed, 12 Nov 2025 19:51:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJN2gqOX1ddSoKJUvNUzwvFvUiXlNlk3wSnrYzlQ38UsqjfogumyR3FzMthbJmM4v/9TlSVA==
X-Received: by 2002:a05:622a:14ce:b0:4e8:93a1:7464 with SMTP id d75a77b69052e-4eddbc7cb25mr77817401cf.15.1763005886862;
        Wed, 12 Nov 2025 19:51:26 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803ac925sm125731e87.10.2025.11.12.19.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 19:51:25 -0800 (PST)
Date: Thu, 13 Nov 2025 05:51:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jesszhan@quicinc.com>,
        Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: sm8750: Add display (MDSS) with
 Display CC
Message-ID: <ehxnrpcidyt2v5x6nv6vjkxekcvc7tdyks7hxsytqfbh3gnqq2@yffpopklqbyd>
References: <20251112-sm8750-display-dts-v2-0-d1567c583821@linaro.org>
 <20251112-sm8750-display-dts-v2-1-d1567c583821@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-sm8750-display-dts-v2-1-d1567c583821@linaro.org>
X-Authority-Analysis: v=2.4 cv=NbnrFmD4 c=1 sm=1 tr=0 ts=691555c0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ztn4_cRxgtR80OVh4l4A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 3uoPT2tMIYX0Ad8hdxPWdg70O-3NWhNu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyMyBTYWx0ZWRfX9paBV4N2LEm8
 5DLOilULpz3pIcZpNyU/eHKu0LtVAPQjpXnNogUoa0o7ZDATZgsHV7c5Nidv6KtlkxucKA2Dq+P
 QNPyNiSiYOyqQXSEOHeu8Uokjemj5WvAz7DLROR5ISMk9W03ORkpHWryq5vW+fPf8qcccGvP53t
 LZerGgaE5WEuBss8zdqx8M8injQ7V0dTo+mrzL95zShXOFewWYDuP8vq8iVLksP++mp0M8T4A+u
 6/+2LOPR1cZwxqFDya6x5C7NuiSm2iDtf7Ks7b3G7CVnjbNewnkElRf5eL2zedEhFW446/E6Yg3
 2AOFWu51ZRHbgFgC9fU5076Vc+fslhzG022ly1eTXNhyS+StGiAZ9WKmEbVNhVl4i+RjUqZfSD1
 9vGMGmOLyPmNzkMHSzd1PSwEujJv/w==
X-Proofpoint-ORIG-GUID: 3uoPT2tMIYX0Ad8hdxPWdg70O-3NWhNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130023

On Wed, Nov 12, 2025 at 04:02:38PM +0100, Krzysztof Kozlowski wrote:
> Add device nodes for entire display: MDSS, DPU, DSI, DSI PHYs,
> DisplayPort and Display Clock Controller.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 437 +++++++++++++++++++++++++++++++++++
>  1 file changed, 437 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

