Return-Path: <linux-arm-msm+bounces-75653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF96BAFB98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 10:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 295724A5B19
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 08:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED3E2D6623;
	Wed,  1 Oct 2025 08:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MdaUvYks"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60062C17A0
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 08:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759308500; cv=none; b=MCptanbZKi7lxABsfYJWIRM9IP0g+Ugg3VXiS/XKawDkklKRaXoLfeTybQaEl9ObkMN4iGKzFC0dx+luwu3w4SV8zIiZLMpcVyscUi0JYcjrUDj5mzwQvkV6iJSs9qe/ii9upZGxp5oNFH/A2qH40zG44AKB7nDd7xHf7jHeHts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759308500; c=relaxed/simple;
	bh=cnYoKUY3HNF+KS4o9k4ts/NW154cLa0Rejq1ItDkND0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BMjRKD5stUKxDPl5ANEswXkZH9I+vTzTPFuV7QzGSP2rI0QruFimUObQUVOLl6BopVzIc3cZpC+1DJyHyPAs6SWog0ba9YNP1abLtfYMwP1Hrs+H9j3V4dXOq0y+J69l6Jw+VKZuQCFDGXxQnG3Y61EOzE9iQuZmf0UAgpTw6uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MdaUvYks; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ULZc4T014987
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 08:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvoGteqWZO/DNKSiamDYflNR1kJAs4QLzd699paRsik=; b=MdaUvYksRMISOUUn
	c3179kep1t8NM7nwGVHUdOxg1FRsaIpy+4ws06F1qSYZZfyTNxvqLIXK7ZdhXC4+
	PwzdJHTaaJgXdH/+SQhQuA2gK6ONlWLRVIHEXdDKHh7/76oabjgPtHRUUj414P4T
	F7cJqG8YKKH5IN4Z1KYfefBMFetVBW+lvwYeXtzwdy2zOerOKDrNf25PSf82ke5K
	9tqAZr6fOrtCl8zr1AE+OYm/2Elxadv61Z/8QofPFgckrjlyYrSyLB8wWt+Q5R7e
	mgN6FURL2QkKhgIr8ckY59OHwTXHB1OnWvoUpYH++p05DO1KUXBBWm0FCRO8zXkE
	b0rdtQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr3wn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 08:48:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4d88b669938so15561301cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 01:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759308497; x=1759913297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IvoGteqWZO/DNKSiamDYflNR1kJAs4QLzd699paRsik=;
        b=j0y0lTBlZIrHIucB3ensH3QCDONDlAEWhQwEeU+/o+9NCxqsi66jgY/p2Iolo7DDwc
         PIVIY+0AAXof8aCBFKWNEML0FICyBre0BAfVxUBuJkdV/8ya7ZE2eZydY7lLuPfJT1TZ
         3xU79JW+slURPQnzPAJ1F+0xn9pn1FydGawDiTgz3q+d17+9P86x0oQpy03w6O3xAoNK
         ow0+aiJMXliSdWxOtJKGIY875HE5uQRZATJWM+zKfEznYCv/qp5SSkeL9fSg6nMUplZ4
         /utOU9eU3P/p9+BNSulBvIwny/9pvtaq/S+rVajMricCwZauCnTj2JkUB6mdrddTqF8x
         fDRg==
X-Forwarded-Encrypted: i=1; AJvYcCW5bqBqttSQRS9Of3eK1tFaUQKe3/FmSSN+8LX7clf6YadWy5iOzt6InNlJbV1JtPEUAaTLzchT+huQkcwT@vger.kernel.org
X-Gm-Message-State: AOJu0YwMwzX/RPAqhAwtpxCGv6FZPKmrhOEatKnwcZ329p0zdadY+Gj1
	cQ8HhM6OsBiibkqwr6TTBs2p8aNzeuF52XPwoGVOOHLZDSoowlS/3+dJ1PCVZ9JI4yqosWzFKt5
	Tl8sgumw4NBw0OsRlxg3PXFG3rqdC2xdtq6OcrgzMtD55XgLSnihRvLb9EtgI2PoHJw7C
X-Gm-Gg: ASbGnctQAy/gNxfBEgO09kNJIyZMbNdbhayVDs4ErL7zc1jLkthttyh9fBC2VSx54Gk
	b4PXHEO9c6+wKYNDmCuj2PRLDiVih0ZXf7858n/qxUqAaIPf43CJ0hEQ0wYdjrTCafaRZFJi/Hq
	7DDgFNIvoifkNVvmdiGeU7XJ2+6lcr43NLShf1OoF/p60m1VPdJS/hOduRBWOeftVgGmYd5CCRW
	+5rQQ58ieHnoqWvfV7Rb9hcZuuUUEdHuLgeUNyn4IWlhwQAG1CPsDDVk0BTEBQD7WcaCX7GAo0n
	prfm+8BJo2Drj9cr2cLY9qkTZ56hmh1IjPsTZgB9OiB4uhyYsJGZpO/kYKsTuy5dar/JYsvKw6I
	RPiNU7p1t4R4Ph6ZdDXNr2gnw3uU=
X-Received: by 2002:a05:622a:1905:b0:4d9:7eeb:3f76 with SMTP id d75a77b69052e-4e41dc85fa8mr23565661cf.8.1759308496462;
        Wed, 01 Oct 2025 01:48:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFA7X+FvOsVCp/d2YehDsp16CTMKaYRaFciuDgavARc4hbhk88e8MW3DkaRiSisxhPZklkGeA==
X-Received: by 2002:a05:622a:1905:b0:4d9:7eeb:3f76 with SMTP id d75a77b69052e-4e41dc85fa8mr23565481cf.8.1759308495920;
        Wed, 01 Oct 2025 01:48:15 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b401d3d4124sm517238866b.75.2025.10.01.01.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:48:15 -0700 (PDT)
Message-ID: <425af7b2-2195-4a18-b14a-7b2871563b12@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 10:48:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8250-samsung-common: correct
 reserved pins
To: =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250928044533.34798-1-ghatto404@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250928044533.34798-1-ghatto404@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7qaMtk2ygtwUbrMcalcc3mqCMnl9wk4Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX06/9m+e+QV09
 9F/hcYxQQNWYwVh2ksNVbvYjXRFXrsXvIs34IS5ojR9T+X1xVW9zsvRPNKiBwvA0zghRQxY3R7Q
 B3lXX5K5IeOVezvStOhb/pWqJyyaYo6fskOMouKVnK1I1io8XjWlLfMnUToG4VuOtkibUgvQNhp
 KsHyGpgxOFZyaJ/xE3bVHHPDc14sqB1HtpzLZMIh9Cxj/IQJMBfBbJKymkEqlfSpYD0abCI+ZCz
 7+jyMu62GVdEcRV3zillxJklAWwY2JZ0GTAQHGJvvXZLaebn9shvjZLX11ZDbEnJGoLPau1TDWg
 g3FwhlFV6exEgL37CdjKyu6wOC4hKi0D7qO2n2I//XE8KuAlZj1JQolzZTlKcCKw2qGM992S+3Z
 gk8VjQyBVOgwvPXilZwFkTc7HL5tYg==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68dcead2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=wVdH400FnCx9Ju2W5JsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 7qaMtk2ygtwUbrMcalcc3mqCMnl9wk4Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017

On 9/28/25 6:45 AM, Eric Gonçalves wrote:
> The S20 series has additional reserved pins for the fingerprint sensor,
> GPIO 20-23. Correct it by adding them into gpio-reserved-ranges.
> 
> Fixes: 6657fe9e9f23 ("arm64: dts: qcom: add initial support for Samsung Galaxy S20 FE")
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---
> Changes in v2:
> - Fixed the formatting of the <40 4> line
> - Added Fixes tag
> ---
>  arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
> index 96662bf9e527..a87e3d23e3e2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
> @@ -159,7 +159,8 @@ &pon_resin {
>  };
>  
>  &tlmm {
> -	gpio-reserved-ranges = <40 4>; /* I2C (Unused) */
> +	gpio-reserved-ranges = <20 4>, /* SPI (fingerprint scanner) */
> +					       <40 4>, /* Unused */

Please set your tab width to 8 :)

Konrad

