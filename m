Return-Path: <linux-arm-msm+bounces-84554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83179CAA044
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Dec 2025 05:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32EC3302048C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 04:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9824129C327;
	Sat,  6 Dec 2025 04:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UWJ2TEud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JwNn4fy5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A64284898
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 04:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764993671; cv=none; b=crJD33iXivFEx2vI+5hVkNGrJ8Ip7MgnrM87Ary7c6qPgkt8byXLPhOaiz00LTfFhIpF/Hj2oH0zqt2h8o2WngfxCOEYF4v8x9VSioQh0ZyQYS0Y1CLV8aU74S++uYmcWh1q6hnwu/IcgCvRKcPiXmDacFvN9LO8y0ZrftITc6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764993671; c=relaxed/simple;
	bh=6KE/O90SuvMEo4enrrTUYpc+vNL6ePAtPO5q7GMZVZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5vRajktwxqLiNYsp4ZMURlPSZf4x5lzWtYJzacKN3kCxQtDJjEPv2is1j/xvEEXY/fZ8kfLpiGuQ+dj5V9x4jvWA13xsrSwiy7kFiXZ5VMKE5rjnMoyePtsaxi8DYu7UG0QsraUz6QUvw/sK63dWZpDuRzAIqDFM26xOH7QBFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UWJ2TEud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JwNn4fy5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B63kLqD2570961
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Dec 2025 04:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rnE18AvkCRDZgapU1S48szRj
	b8G/8DtuMY0zt/3Ql5w=; b=UWJ2TEud9kTNLd5rQQ+6BYwKvX2jDDU1H6Ot4tMB
	8re50pBra/Ve/nIxdTDmTLPh1JAljv9bGWO6bLl+2D5xCQDEyl5/X68EagAbabjq
	SQA9N9T/mCjysIRR3kS2uQYSbqP/ZZwU1RmXt0KLKQ1IVDh/RoiWVCNzIaOLGHPf
	98s2xmqKsdp//k9+JHf0wmgsCRfhOnwzkiR2dztqsONq05vnzHYg8UngzdXA6eyA
	67LugwUDW6N4xXeARup70TN4lWyumfpWXIFWothalplVBEw+KhAAkqLe1ggPObu3
	Yp/dPnYgmX+L1+SmLKdWLcDyeF3muOhz4rK29qdEMFUaqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avcv800ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 04:01:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b51db8ebd9so865929285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 20:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764993668; x=1765598468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rnE18AvkCRDZgapU1S48szRjb8G/8DtuMY0zt/3Ql5w=;
        b=JwNn4fy5ojKJRiKD5ByN6JiCyBLko47HoaZliFZKLi3YI6fQjZeza1epghybXbC7Jm
         hPFtGGIFiF8TH8pOnHcXVKTGUQccjf6PzgZzCIFqwWf9elmfrLpQ45JYJfNJRIDcAAuR
         U8ikFOfjprshxCvzoHfWkeYdxiqebKrFPGYrixTwqzcI1xrF0AE+K+tFU0wE0tAzcqAU
         Kppi0hYtVUIL6lnvw6d6lGBM8dBMvVPTEiKnY6UbWfSIMoX99jbuJgUQdg/yKyaYSFmt
         +m2AxhyOt4RRLBpb9eSGQXSxRGljAm/7QAENoOLUjRVK0SE0+4j4lIwHX7feXG2Qb17k
         +QNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764993668; x=1765598468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rnE18AvkCRDZgapU1S48szRjb8G/8DtuMY0zt/3Ql5w=;
        b=QvIlMCflA8lb+QlP1lBL9fbyMh6db8Gj6OERJLmC1o6q4uOsuUwVMIeRwiX5mgjfwc
         Qp9d50/GI7I5LdU0DpCMjUxjSkLAA8moMQRqC4v2LHJOz1ygHCWCvVJt4SXjLKvM0r1a
         0R/FkeHEcD6TJ8KD3a60vqT89sH2Ceb2GFCOk/UTxO77I1xr6KjDfAhxkcy+kV3CQY32
         IfJba0m+iSmsRl5Kmfye76XiHrF5myd6zWFY6BALJR4ugVG5IZaQmpYrFMQ12RBs8zEr
         +HJCsMoA8pNDQd2aSyRsMNQj6AudloEPOih9jDZnbCnb32mBvnGMTQzh/85uMZ7mC5n6
         sJjg==
X-Forwarded-Encrypted: i=1; AJvYcCUnRS62Z/8QkQD2Y6EokYaBJ49/KfawOSYu67LZnJsHnbRH09O873TUvh36AutpCiautLjqsuEpJ5TMPLPp@vger.kernel.org
X-Gm-Message-State: AOJu0YwqhNVZk7DDzSdn3HNgyk6AHRvMNeHd5LrQK9YxbP7l/8htPDLE
	VBkNB6weHXXgtRAjZEGdqpD6XH0rKVXCl6SvtXOT3FU2F7rg5kWB0CnQXIuvp0wTaBJX2P7YsXm
	tj3YdFbQLFy/ViUOThvkc7s7OGaFSpCDBEab1jnVRs/JOjH8z8cAWA6MN3nLLisqqD2ap
X-Gm-Gg: ASbGncsV/ZaDMIq0ZNgZX61Zb9s7RnTvo3GL7e7GmUKILcp5hDAYUSbWlJ7b3ZS9yai
	RZKhW5iO4DhUxdnSjFUhz5V8wgrJUjVhVMclbbei4inRDkTvwVfzO2Bnzp0iUCYJRCJUP511uQu
	Qlkbate+P2Z3mp7Fba0RMcu7SGHPd5CDFC4O+zjRi1Sz2AcTRmTqP3SBVdilmMQzGaq5o5285Dc
	mg0leugFBK9c1uAFqXosl1QgMjk4Jkc6nQA7SK+Pmgj7B4ZdSVMzowh7OhfpAasF9AsF789WEX1
	lcyX4kVK8k83mZmkshfwjslAa9fU9l3k4K2QAwh4VjZKAvNmfbyCj3Q46KTLijzCVEBohzlG81N
	IIBm5YQiClRbv99vAHB823t50gDTWYvgClDu2zBONzASegrlRvCXvIbeFMnGk5mFAxfoYd5IiZ8
	32zEdk0TMleLCnpb6eoQt6zGg=
X-Received: by 2002:a05:620a:4152:b0:8ab:8037:509c with SMTP id af79cd13be357-8b6a23fbd91mr199735685a.12.1764993667901;
        Fri, 05 Dec 2025 20:01:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSd26GRbO1OTykOL0YBkWeamtUf5O//EDyVfvnZE8aE6rUiAapf96pBDWYEQbO8JcAOCZDBA==
X-Received: by 2002:a05:620a:4152:b0:8ab:8037:509c with SMTP id af79cd13be357-8b6a23fbd91mr199731985a.12.1764993667386;
        Fri, 05 Dec 2025 20:01:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e706634cdsm20105801fa.48.2025.12.05.20.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 20:01:06 -0800 (PST)
Date: Sat, 6 Dec 2025 06:01:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix compile warnings for SM8550 and SM8650
Message-ID: <bafwqulppesamj2y5ogpd2shtdzt2e73zoo6stw2qypnb3gawl@6757lsim4adv>
References: <20251203144856.2711440-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203144856.2711440-1-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: brSmeyTxSJP82wWJA_8qXCiaL-1wj_sA
X-Authority-Analysis: v=2.4 cv=KL9XzVFo c=1 sm=1 tr=0 ts=6933aa84 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=W_W4GMoGrKgtJPV1LKUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyOSBTYWx0ZWRfX1oPb48hUq8yC
 bnNDyt4d67ItpmcSYMvmmeLeOV1+J4ZH0tAXNor/ySwVWl7/QwMtr+bBsqESPtcMesogcoQZGlB
 CLspjFeUQm5WjdGqxQM7aXG+STuqhYQIBUriziP4syb4uqOPo0mVuvcbOTNjZ5MQ5v+Qx3hSmef
 ZEQRq06FOCnqPFl12FM8Mt6L6y34BmnyedKlS/cTkVTzTSIaFwHGIsPfUjeM7i7sE3hg7HMVArN
 4K55OD+F09Z741zdCmO0R1hk9ddsqA7Ze1QZznrlG0rwurwWYwM26+qpxgUePjkuQ48LoU/DQ8y
 0i/43E6xkxtxXfnfpxtqs1DbVzIX6aNcPNqIN7C9E+hp/IzVGD5gs3PSJ+daUwExN+r+H8UzOuM
 GJMT4wG14sa0pvNS9h7mENBd7kHR1A==
X-Proofpoint-GUID: brSmeyTxSJP82wWJA_8qXCiaL-1wj_sA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512060029

On Wed, Dec 03, 2025 at 08:18:54PM +0530, Krishna Kurapati wrote:
> arch/arm64/boot/dts/qcom/sm8550.dtsi:4133.22-4223.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
> 
> arch/arm64/boot/dts/qcom/sm8650.dtsi:5086.22-5177.5: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
> 
> Fix them up accordingly.
> 
> This series has only been compile tested.
> 
> Krishna Kurapati (2):
>   arm64: dts: qcom: sm8550: Fix compile warnings in USB controller node
>   arm64: dts: qcom: sm8650: Fix compile warnings in USB controller node
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

