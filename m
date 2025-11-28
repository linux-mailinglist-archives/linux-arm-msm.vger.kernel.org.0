Return-Path: <linux-arm-msm+bounces-83744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3098BC91C09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 12:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A64EC347228
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 11:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE3A307AC7;
	Fri, 28 Nov 2025 11:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p65ySBDR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eeg6Yqxd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E61D30AD10
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764327957; cv=none; b=R5bNWtE16hm0aWDOVWflf6gdM6OMY3hvDPzK8mkQSIwl2a7GlRPGSGLLY76x44AmqNaMt/Pnjrv8f1BxcAKJb2x7pgKy9rLiL8vcl3+fSx7ZOxCor0PPZFm+IjsTlF4dj6fiDMP6aIbvdLprbGut+dkwF1E8usWRVvPcRJPpIt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764327957; c=relaxed/simple;
	bh=xpMRi3j2bo+6PObhQvvVYEgu5zJQHQXFCO4C/9f1XI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZBmSTHvu3gzUkIEzerHa3Q7YSBzyXO1KTZs8v/SlwU+hO3HxfxAiNRBH2sm8mu/lfJTrUvNphrryuDCEsLXCmegxRr0q+Vu+kcjqxfdOoIHQaQblTHzaVXBiMYd0nx1znifbAqvjORn/xMs80Oq32CVZqoKYFVaSxbwoO9EVXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p65ySBDR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eeg6Yqxd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8Oq3q3621303
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xpMRi3j2bo+6PObhQvvVYEgu5zJQHQXFCO4C/9f1XI0=; b=p65ySBDRBxdx/4nx
	v+adkex0rLbitO0baa6I495xKd9q62gkDn4YtgKAe8XC+pBmcD+WNiko0zNd2pEI
	TtlNBHrAO+vfPFdUt7LRF1VhFtkmhPxgc8OfC23tj8Znt8pllph3NktjTX1h1WZi
	Hhuoa4kb3ePJlb02xK6rMRlU1qjIzmT73WgCF20kDtf4ajmd7i82sIHctXYAg/Gg
	seNdOzPeQVvlPKfBGXgXDtSTg+tEV96Hl3/5bQ25HdRgRGTkUzAyWKLVlZ8QlYFX
	je8eiALIjhMW0UFwIFu2q0cI2bBiXBddXm65ZK9CHZxTZvySn3XxySdZrr7gRFik
	SXsUzQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmjdb5g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 11:05:54 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5dfbe140bffso176241137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 03:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764327954; x=1764932754; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xpMRi3j2bo+6PObhQvvVYEgu5zJQHQXFCO4C/9f1XI0=;
        b=Eeg6YqxdJWVfgO7WZ7WJoWb37DrcRHCz5WhsJW4dbF9WlkqJdAHkM2FG/6eakiAeCQ
         XOve2rG6GGrLdRWPhBhbgl09zcp+4nkQr00sbxpPSibTj/QJInlWYC8Vf1z5SQDotWRU
         92nsm4FAUBJw9svAX7lpRTINXe3G4Wim03vCFTXq6MRxCUCMI20iwD9UTpkuQ5N9vVGO
         xFKFIBd2mdFQ9I3xhG0ESyezpf4TqfXNwi2e/dpi8yIdem/PblG8jfXkJd7JIE4dl9sX
         Wzqts2RLoy8F+McEPWRZybT6c+iw/K9P0kjogHENyuSzoYPQHacPL2EaT9FzKZTElhlq
         2REg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764327954; x=1764932754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpMRi3j2bo+6PObhQvvVYEgu5zJQHQXFCO4C/9f1XI0=;
        b=uhle1kEzKNIbajrkLE1BS6dISj6Zc1dYvs+VMzhl5jSVzbYzsF8ZjMY3KglEitr6tg
         6ZHwQRTz5R1Np4Lc90b7tyDySYvVRqCMi98XUFeBCWBrkccF3VHQrEsv+VXsOUDcSqUB
         haI5vcrA2WCxdqCKR9DoDbrIejDhU7WpiTWHAZEib+N1JctHiPdkxjVVgDUjNNprSJRA
         eRclVV4gPlye8eM7Cox0f29gIOjIH8Z9730loLYuO9SVmV3ycS1d3LJYx+sRRRbsEryC
         uWNQVfYXGMOD0PJuVH++2lTw+thgIEDfgvGJHa3fbo1FSns+6fHxGOPoxxUfpJCRC//b
         fTMg==
X-Forwarded-Encrypted: i=1; AJvYcCWoFgje1NpLGA6cyFWkJDUZbQ2BBPTG/B3EG8eNKVLZkCVkpNE6U7Gp9f2pWGOOtXepZV9NGrNLQ5ES0d5+@vger.kernel.org
X-Gm-Message-State: AOJu0YziEtCme4w5cec5OG6gQESvl/PJXzfGZTFJ2RKmO1SUnYV2/ykr
	/bUsNCNmnIHFdm6LlbREgPJ8byhUvUs1aF/lGlXaUAPH5rWCpXKaksWGgFavj0wwCW8gMUybbTC
	NhqvOq+C9yzNT2g3jHsarrB7ggkRYnHZX0jK/hcltlMGJcb1s0Ueuckux15h/XZ0odehSPU+wYa
	/F
X-Gm-Gg: ASbGncsSWKi7eJiEhIL1/bnVEH4SP8ieBsfC9sRXuwtg5V2/uqiAz1WtududGLwykgg
	zX7QNsheGo11o5RP6a+ovdej4CbTTw53Eev18sGhS6Sjz+awUk36mGiMskoLioJIbKQNxjqeE4Y
	VNfPZhROlk0JPj+OZUGU19Z0NSz4RlNiRgLsMz0iEMlAtIa/RCTRvJQKHFv6c4tY8jCucJSLaBZ
	JmQ3vqlVo/m3U6ArfFkYKHMtsLxLaKQqwGbhuh/hLtFPNzaPB1kuhIsnoF9kgZ3gjKN3sqiDECk
	wEjdh8xZ+GSaXunfQdasI5AZslSDakhgcMgwmkTh/yQXT3h3yg6agrHWb451EoHVZQRydmOH5qF
	E1icn9Es0XxiB6gM0+LYU/N2XyIcsmZZLDHdcQMxcn1mniAY3XzHHtpLsiat2nfQdozE=
X-Received: by 2002:a05:6122:91c:b0:559:9663:bfb1 with SMTP id 71dfb90a1353d-55b8d5c2d79mr5412229e0c.0.1764327953623;
        Fri, 28 Nov 2025 03:05:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGudpexyP0X/zmv3p9rERNMQ3AtObJtIj9hiMLbTfiCUjH3F9QaQCnekNYVsLOEWZ9Br6ffvA==
X-Received: by 2002:a05:6122:91c:b0:559:9663:bfb1 with SMTP id 71dfb90a1353d-55b8d5c2d79mr5412178e0c.0.1764327953221;
        Fri, 28 Nov 2025 03:05:53 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751062709sm3981675a12.35.2025.11.28.03.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 03:05:52 -0800 (PST)
Message-ID: <b85c25f1-65b3-4277-82b1-402daef6fe8d@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 12:05:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] PCI: dwc: Program device-id
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251127-program-device-id-v1-0-31ad36beda2c@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251127-program-device-id-v1-0-31ad36beda2c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E0-RV24eicaVHFu51iN0zMcC9Ul_wMqA
X-Proofpoint-ORIG-GUID: E0-RV24eicaVHFu51iN0zMcC9Ul_wMqA
X-Authority-Analysis: v=2.4 cv=OPcqHCaB c=1 sm=1 tr=0 ts=69298213 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Oti8CWU9ByRd_oxdf28A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA4MSBTYWx0ZWRfX9uGs2qOj8s1M
 NrB74vzzuNI6SbtNNk1bMbXA9z7mN5MO6C5XLFQHZh9ogdMjL4sRKFXT2QJDpm3m0JTWZatke9Q
 tX3JTgorGsz3Rqhq3pyJY0nZ2kuqjfvzHxMtozI9+qZbdoe+5+NgOoWv46HN421QAYbL0h2hn9Y
 AoSy/dgLrDc4B7teI/oexwEf+3re65yZT5rMxyEIS3nWDfLrh+/JXxX/2GOxzWXvvguxgYKEhnV
 wgQFLQmeqAdnTAEbJZrO8Y0xpK+5xitI/G5YY2IaagahcD7O1kdegFYiBt11ngegAzpHX/8wVdt
 saxVurBdBUKUG6CycAjjIIjWTQs/g3am2kk0WeOwANfjPZC1bTH0Gv4qjvGF9uuLc9zfgEdmg4L
 pYe6eNv0gAJiUTYf4i38xKLYRKcWcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280081

On 11/27/25 4:30 PM, Sushrut Shree Trivedi wrote:
> For some controllers, HW doesn't program the correct device-id
> leading to incorrect identification in lspci. For ex, QCOM
> controller SC7280 uses same device id as SM8250. This would
> cause issues while applying controller specific quirks.

Is this the only instance where this happened?

Konrad

