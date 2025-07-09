Return-Path: <linux-arm-msm+bounces-64279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C79AFF06A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 20:05:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A70424800FD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 18:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D89846BFCE;
	Wed,  9 Jul 2025 18:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VkHrX/iB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB43235055
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 18:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752084283; cv=none; b=skNyQ7yXANZQh8ipQVrFgjwh61oiYqm6J+a0GPksIDYNJJA/FJVGgmB9WbnDoQi/AdzINMSyJLAzURyF97RoEtPnBxhph6wj2cFJ0zMewK3w05bbYBgY1DANMeAOzmNYuULx4FZFI0tS3cxGZ+ZRmcg8ZkJeeXo40HvK0a3Slcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752084283; c=relaxed/simple;
	bh=BwEHDnFF8g9BwbRZ7s5wgYOhw4vNQlfGkcQ79zkRIZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLVt8NIT9JrjNtOxQhqPamv8evARgf5Y+sJJSWo2ZQVAgeZNXIne6ISsxXArWXGpLlKcC5ob3rtOHlid6cVpx2aP52XNzMTdxnP2ZSz20gTchJkQAO4UuIwSyKHtvcltJByacVP4fQSurRrjNLTlaH/7AfNsC9bq5QkMYoJCjUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VkHrX/iB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569Cp9IZ016847
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Jul 2025 18:04:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2ietRUbMDbJ4mE4kCJF5gt9v+ZI/BJHpjh+AfLfssc=; b=VkHrX/iB1owUSxld
	0k+fbo6IcOvwtEYGSSRlKjHpAinC0RiWd73EPPUC6SOM4iBvvYejo9Hir/sSs1M+
	BimAHnZ5h1Bm7K6EukFdGpofuYt4/4mVpL2Pvk1zuKqdOPMAEA0hUXCuPSLOmkJI
	uxhP+dVMdAmPY42H33WwyFKvhLTjLI7hykoi46pR/kn5Hgzte68IRcBVaBSbbEgM
	cHTfSuCq3FFJOsKCluYO73ZuMuweN68F4RZKBYnZjt9JHLQRIPG83VqGx6D6sB7x
	NYtuDq+MO3CE2+WCNg0do2owYKfya9Fs8n2UT5JIvD2kgG7SZnFYVVqX1VOzqctq
	+OrFUw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap22ca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 18:04:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d094e04aa4so3597485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 11:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752084280; x=1752689080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A2ietRUbMDbJ4mE4kCJF5gt9v+ZI/BJHpjh+AfLfssc=;
        b=axwXevKuK+nF4NRYHXczbUmKArTPvJy6771PvSU8nVHtCZuYAWgYr7ewXIoOb/+CcI
         qOoyxsnR4/9iS2dt0ljxMeQTK3WYMT6gnOiUk0QpB7LSEwpt5GOE1cmP6LEDi4UgV561
         NgZrsr5n8AO9G3vq3rLb1d9m6iyq2nvm16HNMfcOeRVkbLCxpvYtSeTry6lY7mEOq1gx
         MupzjHvn0JcKBkklIk7nNARC0pYoJh95wK5f1DYJhydJBDmWeOxEdVyo/KHK5eGeAX0Z
         b4hhAYS7w6CCNiyfHgKBcoehiS+BCe3FZoie01plmO2eFWisoNSUo/YfqqtLAZ4cFdtw
         TB+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyC/CedC5eBF8yAY7t9CZ6b2BMOxqJ+3kWWQGRk5MltyHBm7t3Vij7FDEcTwZGjbo3veoC+OgzTIAfiPsQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzat8bIbCmcJ88juknl6PN26pKBDxyMBAinufInItCmVmucPEd1
	pkLf1FLkujRMCX05yA/fd1BMpGyG9AsIMlYvcvThtO1WmS/6BUPbDQq1RCOwn2NmiMiTMg9eI5K
	IcmfQPeMkqF9ie0/jdx2zQwRw/CJvugGYY/FJpecNUtJLSzhv9iZMYJ49GXZIJQiWWzYS
X-Gm-Gg: ASbGncv+uJAri/HrwwP9mnacV5CFGA8hMY3ealJkYVokaldW0fqDVhAdWTbCHABj1tq
	yPyWke/PzcAe6QnI79vR9jZXv/4Xvo9gsuOTggGriSEcwvHTtbMfdRWu81h865o3y5KzegCV495
	/pgdGyyirXDL2GXSCGSWgj6Hs0Pw73wZ6MkdkobwgPDHh29PxSWqL8mNJjEpoax2sDVqeBBUGQK
	K++xWCokIGowoZOjyO0KDz08yRGkcKEzbPgAFpQONvsAkx1TGT/v1bMiJYwWp9SV+IweQkfw/qA
	cu/gC8clMknluwt3DEf0yazTD1Sv2RUkqXzKAaasR+tOh2FS5C/1pch1LRZNyujaUnNC2nYIfhD
	8LBw=
X-Received: by 2002:a05:620a:2681:b0:7db:3fbc:d71f with SMTP id af79cd13be357-7db8b3307c8mr183722285a.0.1752084280121;
        Wed, 09 Jul 2025 11:04:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRdyICFCZxRrKtqyaPtAi/LxAqDz5IEHfkpkf3qpn9haIG2NUFS9hpsW2SKi6yjsOjwAtEOw==
X-Received: by 2002:a05:620a:2681:b0:7db:3fbc:d71f with SMTP id af79cd13be357-7db8b3307c8mr183718485a.0.1752084279403;
        Wed, 09 Jul 2025 11:04:39 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692f555sm1156700766b.60.2025.07.09.11.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 11:04:38 -0700 (PDT)
Message-ID: <256e01fc-fdba-4006-be8b-236fbbdf9f25@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 20:04:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] pinctrl: qcom: add infrastructure for marking
 pin functions as GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-10-b6135149c0d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-10-b6135149c0d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=686eaf39 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=NA2ShB3TTlD8ZNnRZVMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: PnLrkDE8zXq452DGVJSjJgTad0bjcu55
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE2MyBTYWx0ZWRfX6EdY+ZWIbMmm
 nv0t4Kji8QrNuZbb//Hyd7o+kF7LzAwGhJZ194sh430WI6QmSMt3WTTA7tS7hNhPCGz5qw/C+SL
 2FmkS/ZBt9qPIPcYywUhtnbfG8lHuhsTomw+mDHScvzAZqDWQTk3YdzoD+LlrJMGbOVkQ+WFM9t
 WIHytuvL4yYaL5qZAxHxiNqWg7gObVFxGNMvudjG3GcHjDqxUg6sRK3tR9s/Vr1b00BBQChnVra
 opRjyrv+YzJqJGIC4RaqAgOdcg4YpIYylt7wpIDVQYdw9bWE6H6S6RXmDtgbGDSZT5VMsFRUpfL
 /m0ZgS1FCLC8Mz2i3fOKs7yOjxMv0hWckrw/QuSjA228c4i3mjZ+LegE1lJSw3pq9j/SoWmjMSr
 6PP6a9rif3svPUjAwNz81XY+BYIXkZXW1vzLAd6a3mxTosUQ6Tde223yofznASHbUodKj1fK
X-Proofpoint-GUID: PnLrkDE8zXq452DGVJSjJgTad0bjcu55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090163

On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a helper macro that wraps PINCTRL_GPIO_PINFUNCTION() for pinctrl-msm
> pin functions and assign the .function_is_gpio() callback in pinmux_ops.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

