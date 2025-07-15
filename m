Return-Path: <linux-arm-msm+bounces-65014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED72AB05770
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 12:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F8843A98D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 10:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F4F26D4E6;
	Tue, 15 Jul 2025 10:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PhZVbFib"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAA123A989
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752573949; cv=none; b=MioU92Cdj5uWyx1bfVYygxMhk2OsNwn8vGxWMCMmHztDTidIM6Oj9CocICXdVKLJQOOCzxSpFn2FG4+Gq6RdH59c+lLZoz6D0Gd9gLlxNcxGAW2Fv0AM6Dl4uYbsHUkeq3Wtbm+Rs1tKNQa1ORugiF10y7CtpVl538woX+noFxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752573949; c=relaxed/simple;
	bh=wcoEe8qNq7qcMF+Mu+Tw9LIFInIojyMTm7uEkxvUrFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbQRLcgnMqLqL18WSw11k3JnI6wD4ZolcchyHrevz7w8VeZ0lQZPrDS0W43FK+9wkXrzi3oItR0hNiU1oDoJ7FAksqRLPUMCe4rQU2EWO3OLstWwJFuMZ81TL8BoG8wBGvAbCac4Ppzw3lI4eEeDCqKLMg3HkulEFOSZs9stYTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhZVbFib; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8kVve027447
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xoD2R1SjXv1eRy5P+7pX3hNP7MpiMaL2xSBXTAGGJ0Q=; b=PhZVbFibWdSZ4YVe
	YbQSqaTGDvqH5BPqQazTg/P9lVpuBGj9aKMGpykFRgccqyPrZzPRdYJfi/6tLASx
	kWH84gZjv8RF3T/qV4hW/rOjGjxikmIA3M/sEQlVmdqNf3zgIdbyvQKq949UdZxk
	FYGJBe7RB+R0O9Yf84zdbF2QCMH4YUszN5uahI3SV4yDYF3kQlrxdIxPQlsFQsDD
	qFgujS3FEGjJwvzopuDkSO/6oRq1jWbAJhvssah70ryvzs5y3+LbWGwATj3AA8/F
	TeauzW/QnlulkSuswpW0B6E8XthReHj83aLiRam4uWlGbC/j2oKT2s+g1P0sVRN2
	BqEUQg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wkrugaad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:05:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e32edf8dcaso3679285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 03:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752573945; x=1753178745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xoD2R1SjXv1eRy5P+7pX3hNP7MpiMaL2xSBXTAGGJ0Q=;
        b=rw5pzfm+K7BvnSf7v1hEsEJl2m6AwoygwReSqdq/Bibbd2umGhUVkCRrLFenYEEukb
         zKCwFCGw0cGqXiLoP+htFIblZrUaYnlnbmC0WigpIZnizAwt5OY4yazCBEn3ra01mJ2s
         OUbxPGKYw3EGeQwToQH56ng7fZDZRyau/M7Mt9+z8CYr6IFm8NsYwXevDODBfQFHBZDZ
         OqzUthYPWCCRZQ2kj83iLYrYPG5S5THP3+ohyoc1wsxNrM8t7WPZAgjr3txtn25snvkQ
         62UpetZVzUUfDr9/otZ9LoscZEXRshAyPDLb/VrnNETIHM24bHXzmu86BUv5ZDj9DlZ2
         K3Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVrq/hScmAeDL1BQw4Z9AIXia2yxC8ctlrwSWfUmCdrehSzNU6OcZvAlS8YHjZXZGJldIpIzGtL7cx1JTfo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6J9Q6OLYxc7iEe7Y7EqTQkrN/J0v3q/3CZdr0OGeggJl1agg8
	wPXW8moLJ44Uc22U3fRM0KHWCergpFeGJquUKatYbrBFK8yWN8vG0qH1BK9pIqRP3BjYjr84Ycb
	mtgumbtrq1BVc7CzKLMegt5ouzZCLSjkX+s9AaSIfe3PrP4a0bd08NJWahcY7Xom1kS2JvNuZf8
	bJ
X-Gm-Gg: ASbGncts0IrbWLcVe1gVUuVUzgpVyBmfXpgqtubUvI2ySYHqeK1BxrDC7FN0XKQ+8mc
	G+p7sjFzkjkZ+6/feD1/dkYiaVRAeigD02IlTLSlFkMEq37JBZMVqs+8qFhEYvgYqYSTlIY8FiB
	TrH66rgSM9Vbaxu+GypW2jN3aj/cLZHwc4LswZwn3tKIdsz/Q0QCFxMnK2JXZM5Iesl82nTVIQT
	Ez+xpbeXU9x6M1D5F0GXNhmvPmH/aFKIbNTunSzjk1Tu4oMbuliPRDstkViTUDgkXrFHwzSZSCH
	P7kPeYtaa3rfuwnmnPXjzhyzDQmMvtrBbed3OeKAACcweNec+7kVRQNc2mcxUFhwnb+kjoL6S/O
	IJv2IxKIG19D745WBvEub
X-Received: by 2002:a05:620a:17a0:b0:7e3:3a8f:ab1d with SMTP id af79cd13be357-7e33c7321c7mr41631785a.4.1752573945326;
        Tue, 15 Jul 2025 03:05:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfltLcnZ3DJsRe4H0bNNgmV8fu/FyMBl4oio/EqiA77AbLronXmD8m8JQ1m83ZrCm3MBiZEg==
X-Received: by 2002:a05:620a:17a0:b0:7e3:3a8f:ab1d with SMTP id af79cd13be357-7e33c7321c7mr41629585a.4.1752573944895;
        Tue, 15 Jul 2025 03:05:44 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df311sm962103666b.165.2025.07.15.03.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 03:05:44 -0700 (PDT)
Message-ID: <8b54d58d-1b0f-43ec-912a-62edff10922e@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 12:05:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: Richard Acayan <mailingradian@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>
References: <20250714210227.714841-6-mailingradian@gmail.com>
 <20250714210227.714841-10-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250714210227.714841-10-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GZKDNDKXZ1hsmXiMy4ZMLKOlfc2c_BnP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA5MSBTYWx0ZWRfX7Br4MJHrfbqB
 cB1QlBaDYFYGIm56gyqYmWdJ2gvJrUGHe+LAY39YTmaInVrdK70nQwrhukXGdKSZRJT0HwLef5J
 8Q47qRNfDQOSnQDD898qaBnRYJ1Hd4fXI/6xxTtBzpUQu5ccf0L/7k46fC30Of31Q5sTsWkJQb8
 P8YdHETKr6Gvb1KVD1jUzrdaeUYqrLJo/LQ2pY2xaIo3SvFMPac+YHMGw8+QYsmT8432E+XHIeS
 sHnvI2+Q3inLWuItSp5lJ4aqui+NZqav5YAA2mQDPPeKpqJ/a2r5ParKSzpEnV59rphcmGVFsC/
 1kHANG8UitE4GYvthVf94i7CuK7JibK5Eorm5OyAQYhScqLpDAK4A8V8xlNLYxv5zMRKF8i3Zqa
 J5uTxpYGR7MqvSKyvIT/mgVs/lOvXM7MywQnahPMkICS+wa96GtrbBB9irz9xa21sN2D0MGO
X-Authority-Analysis: v=2.4 cv=WqUrMcfv c=1 sm=1 tr=0 ts=687627fa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=pGLkceISAAAA:8
 a=uTbtQnSn72Kwyy-wytUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: GZKDNDKXZ1hsmXiMy4ZMLKOlfc2c_BnP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=756 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150091

On 7/14/25 11:02 PM, Richard Acayan wrote:
> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> support for it.
> 
> Co-developed-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---


> +&pm660_gpios {
> +	cam_vio_pin: cam-vio-state {
> +		pins = "gpio13";
> +		function = "normal";
> +		power-source = <PM8941_GPIO_VPH>;

This define is actually specific to PM8941.. I would assume that 0
is generally bound to VPH_PWR, but eeh, this is not what you want

Konrad

