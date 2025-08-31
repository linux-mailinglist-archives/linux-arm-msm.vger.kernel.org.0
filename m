Return-Path: <linux-arm-msm+bounces-71310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 250B8B3D1D1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 12:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E48383B712C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 10:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019A1225A38;
	Sun, 31 Aug 2025 10:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ni1a+nfF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879951FFC46
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 10:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756634714; cv=none; b=h7+9vSQONDp2m09auP5z/8qSgZOZAPK0vNeYGFbwccybPw0FpitejpNyg89WykntRq5nWNRcdRkl+lE8PTdOF3i1/4uzMzqHVd6V4vzESFYHlHgcsXWJbwLALLpP0wQnyQy/Q9y8ra+7RZR8SvqpcXz7gewcSLg1dVojp/bBb9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756634714; c=relaxed/simple;
	bh=qgZOJ23E7GKrRrkmvhIvbpHwFEbyncXhUWLXTsvOz7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Owk2y2SydDVnsw/YKDTVPOM/ZbGzc+0GUh1QLLuAT/QLd/QHfRa/ZWUzrEZZV2oy54genR7lTH755cvtMLWPAYs3ApCZ8lhXz9AUsNmOYcXqdAkHwqM7lgOOxUCo6Cm+/8Avvi/8fKET+Kp77sQXoJaUsMREzOTUUyjFGGxxclk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ni1a+nfF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57V8sV5j021569
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 10:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WtmVK7p/SotPayBLtQrG1bWg
	qezjRJbwZ0ptisq/x4g=; b=ni1a+nfFBepFZIUGTSVLat6LgmRUrjZdFjbzB7fL
	TCcZLbzXWz/J8sSwjtc4VqCUG2/yHcV9oYX5Xz6gZ21Ouw1BXyzfWMMpbtHhlaZz
	mojI06occsqeRs5L2TQDU/xlDDbuCZcZcS5YLFu0V6TGvNFmM6UooS291/2pi51X
	f2Xiak/bHNEV8OPO8bYUl4AiYB+zNmxj76aBWhkiduz38qvQWysgeBco/Sff0aFE
	J8pg0ylTrC9DccUS3nDzZPWSGzk72/CBropCQdd0jzhS2TRrVUMGR7b4mocRgHbJ
	dfPrfcPnn8IdH57tBMQAbAs/RRDD3IOb6IBVcsdliTMsgA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk8ssex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 10:05:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b32fe42b83so2439601cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 31 Aug 2025 03:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756634704; x=1757239504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtmVK7p/SotPayBLtQrG1bWgqezjRJbwZ0ptisq/x4g=;
        b=i5i3LQu08nyHwR7juGZCfCy6gjwWcWl9mu6QYe7/aBvZ/9zkrMVSTtHerOoNWGBlWC
         fCse5n3Eb3I+8YNyPbDQayG0pGcUg8OpczOJdFi0L14nRrMN2DTD+DzsikDQgHiYiHFP
         HC8n0V2T0yU9du3/GfkGsfc9/XlOj1Pp+ZNeK9RKfWCPeHjBWE7YvAvQrNBUmAnoWSky
         iq0JNHBVeTvXTQMP7vpMvMg7lxGilsr3rGZ3U/lGiByTHh4amGIsZCbEdPPGxKcyXwzy
         yMwRZbPuxPC73uLMV0O1up3HEN08ikVWp/rJWDFPrplvkatul8x0g9kzDaZlW1PodK2p
         xO6w==
X-Forwarded-Encrypted: i=1; AJvYcCXf+eZjGOiJRZnxj9lmuyOZ2KOLYNrTFcxrDZoBVOT9Hvjq20PEY1xgh44TSutXQ0f3Cgacbhi5ekPM7A3q@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+KYfwSuitozqphVOuCvzTHyTw7yHxKQKnpl5GRTtGg7OtWmcB
	R35BLtrtFdmJv/op68/DFUY/fg9UcEO2CM+sx3gIpo80dqjlJpC5wMsVhW4bi/5efZ7dVv8LVXh
	1tlFYM9oJK+hwHs314RU0lzE+rErxHN8hNkt+v75fidLrE2q2TPQ3kK3ZfGekEF1XvQuA
X-Gm-Gg: ASbGncuY/uRWjm0AuvoKEmPfub68SD7M06qE6hfhbyNAdAwpcKjk2Whwd7dJkLDs2yN
	HGa6Xl2OIlCF3pmvhk4vZKOAwopL+Ev3lZ9SPwtJZIp908v+ozOgru0qYE9oGqU6bPJWQ1rfmCu
	uPhGs9/NyF4sICPisR7ya+KqsoV9VKeYjb/jPuPVKHhO20oe2jSBxV2Jry6mIRhyaxcfnBIW8fz
	mYa9rOPri0itgiBNyVrQYoGad5BQp/3isd13a4/2QuwcNY8c7L18KzGk0pvVjURwzI9JW+oTNQU
	CzKxrQpKPlwS56PmoU4G21wTsrKaJ3yMrVnaDDmVum8yftz1TOIATToPUOEaLc6SqU1WZIdsYnQ
	fDgO98Sj7ZX2fD5SFqPVwfS8MU0fo1mZE8hW2ikKYvQT7RwSGngxX
X-Received: by 2002:a05:622a:259a:b0:4b2:ed82:29d5 with SMTP id d75a77b69052e-4b31d8526bcmr50235261cf.33.1756634704033;
        Sun, 31 Aug 2025 03:05:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb2lKo0iJNscirT3bEFWvA/JJp5w1yC0Ywe+zyzyU6LqWGRFeZc7bNUVhMX/eTELojDizGSg==
X-Received: by 2002:a05:622a:259a:b0:4b2:ed82:29d5 with SMTP id d75a77b69052e-4b31d8526bcmr50234921cf.33.1756634703397;
        Sun, 31 Aug 2025 03:05:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f6770d9a8sm2101064e87.40.2025.08.31.03.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:05:02 -0700 (PDT)
Date: Sun, 31 Aug 2025 13:05:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: add mfd/max77705 definitions
Message-ID: <4atqwegfaq5ivrd6oypsfev3xpgfjhqw3hooxh4mit3fl23rtq@a5vbqtts46vv>
References: <20250831-starqltechn-correct_max77705_nodes-v1-0-5f2af9d13dad@gmail.com>
 <20250831-starqltechn-correct_max77705_nodes-v1-1-5f2af9d13dad@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831-starqltechn-correct_max77705_nodes-v1-1-5f2af9d13dad@gmail.com>
X-Proofpoint-GUID: kKLhhldIyKWc8Z2ANCWyqC7MwHkVI7O2
X-Proofpoint-ORIG-GUID: kKLhhldIyKWc8Z2ANCWyqC7MwHkVI7O2
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b41e58 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=pNwjqshDI-g99FjbY1cA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX4tudGXn4a7uf
 Vg6fUKEx7Q8cCi3D7kUAkSiZptfej8osZWWlV1LS2E2bIkvmHgMTSh0R+1zqKrhqf5Ts9hXpBpF
 XQrEpkBaC7isCDVKrjCyedSNf6HRQcpzD/8FyJ4MyOAY4sQro47kGL7sl9EfzxfVadbREUjS0QM
 ak6orGDbRrPENnX5hqatcK0MxJnUdZOPBehl7FXpqStYIglAVvrpqlStMu+ZLYhRHwamykAx9bm
 02JZVHpxEH0isF0jQgj9mALHpE8UerwIsDq9wGy554Urcf93CWXfTF0vqeKaLRw8HsXZvgLJNVz
 ICrAx3M8wzrUVSSZWBtV8tDitg88uvIpOmwX5mc0zmJqC6ltZVEOBrnam0hfsihQ+l4IXfTenSn
 9mHW8KUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-31_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On Sun, Aug 31, 2025 at 01:21:21AM +0300, Dzmitry Sankouski wrote:
> Add a dt-bindings include file for max77705 devicetree definition, define
> available irq numbers.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>  MAINTAINERS                        |  1 +
>  include/dt-bindings/mfd/max77705.h | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 020d7aa13188..82f500cf3c02 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15166,6 +15166,7 @@ F:	drivers/clk/clk-max77686.c
>  F:	drivers/extcon/extcon-max14577.c
>  F:	drivers/extcon/extcon-max77693.c
>  F:	drivers/rtc/rtc-max77686.c
> +F:	include/dt-bindings/mfd/max77705.h
>  F:	include/linux/mfd/max14577*.h
>  F:	include/linux/mfd/max77686*.h
>  F:	include/linux/mfd/max77693*.h
> diff --git a/include/dt-bindings/mfd/max77705.h b/include/dt-bindings/mfd/max77705.h
> new file mode 100644
> index 000000000000..34fcf1642e2d
> --- /dev/null
> +++ b/include/dt-bindings/mfd/max77705.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * DTS binding definitions used for the MAX77705 PMIC.
> + *
> + * Copyright (C) 2025 Dzmitry Sankouski <dsankouski@gmail.com>
> + */
> +
> +#ifndef _DT_BINDINGS_MFD_MAX77705_H
> +#define _DT_BINDINGS_MFD_MAX77705_H
> +
> +#define MAX77705_IRQ_CHG	0
> +#define MAX77705_IRQ_TOP	1
> +#define MAX77705_IRQ_FG		2
> +#define MAX77705_IRQ_USBC	3

There is usually no need to define IRQs as bindings.

> +
> +#endif
> 
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry

