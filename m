Return-Path: <linux-arm-msm+bounces-54453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEF7A8A984
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 22:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7D0E7AD09D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 20:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32650253345;
	Tue, 15 Apr 2025 20:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GEZVEokG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1352550CE
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 20:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744749871; cv=none; b=aIXccXZifVDidSBvV8Jlwbox8/yUs/SsWdyCObIkxdD6PXnJZIz7ubk3vWpXNM9dbfV2kNp825qugJtmXT8WmljxbFNhgJUH9wrwRV1HnGigxgkKlgIfukakv3SRPdzndbeL742Ci0vtnJ3ma0lW+D/2xuupoGPoisRF9wvRWCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744749871; c=relaxed/simple;
	bh=3Hky3VM+4JjapqUY7cn5G98RWX49+pbBZqsiggC7wdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tw0Jt3d0Q2AXlkx9qBB/0s602xansMgRVWKCvhcik0lXFxIhHjIPiSZ6sgNPynVzbUaSOvWWZM5yPy7w+q+kMOhggZS4kYE2ashGEL/5mifk2+H+umHi/phMLIVTIoBry7WPsg7VEEEhUPm74jH9wS3I5kGAr0R9LYiQcu/9gtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GEZVEokG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FIKcqV013341
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 20:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3iYh8x4j7pll1qdXNxRlsV8aiYA7Wu+q1V+bKZrVFss=; b=GEZVEokGb1/sIQn9
	3eB85tNbU//iXTbysYvwvKI4SDos4KqVhNIHSiLIylQRN1CbzAfy6zEKdh3xBdy5
	pYXRSGq0kMgvg7QYpIGqNNvPveVVq381hjMJCGMOXpjrI265gAuI0HyruZqAezOr
	oRJVnyNa5Ml0XovDZox+S8oh42SNLX4SO6qbskIjXK067Wi8ikbW1FwTphU3z3TP
	nStWwiod+5FoD1xAwGkY3a6z0NUv+pJJZnz3pv2a0IhQoywoMvmbLinST3UZnM3U
	T9CNpKlsTGVFIUW5Gmeu+iLxQ36vJes83oHygHf6g8aJhlNL5hIQkaUbFiG06QGn
	2AL1uA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6hdhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 20:44:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c547ab8273so78042185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 13:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744749867; x=1745354667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3iYh8x4j7pll1qdXNxRlsV8aiYA7Wu+q1V+bKZrVFss=;
        b=QSozjbZKqXVDgn4owP+HMj5jxvEzEUu27y7j5rTQZYLnt1tYfejt4phObR72HFfvT4
         uzqQsrMio5aphM16a6eH3TwJz75sDrMnYw1Y3/zwwsNIwa6DnUsvyOHdlAu+7UL1qUTL
         AiI/fgdYPeVLxS9heerU5TUhWzYb8Nctmnxou03/g3QJna4BiWSSZXga9hp9Gs94uZYE
         vmWSBTKODUdIMUunJ4mUdfE8wF9bpLmYkd88+MmjtQNx8cJjRo9DeFTI3jVhrq9tmTyi
         yi8FaKDgiGmnPwMBobo1+o8WgxgwSP6hctB/QqRCLkEnywx6Tn6TJvquRR82IuVgmHdt
         9kWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMeboJlmUpXmeanEQLYJg/hY22eVT5m1dmm+FgP0loV0J5HkVHZyw2FA2RSZu78Z7EThBXlFhZgeqG3UXf@vger.kernel.org
X-Gm-Message-State: AOJu0YwVbkv4PubBpfrG9yuG722FnyWWJXTMU68R5W+J2jUJXzN8FFC1
	OAH6xTJW6NH7e7khzyCZmxSfsm9Lm5mwJltVkMCYrNcoU7Y+9wWzudj/AH/r6atAr3DNxWm0zQr
	gR0I9JO+l2SJabLi5K4a/NT7UFJdtBMixPzDgFdACp1Zv2Hfj0Y2f6N8EByBMJCMH
X-Gm-Gg: ASbGnculVEryy4Ttf5Y98valkAJvcOI9Wm9i9xKL6KNds334VHho2ldwZtwaCKEvLt7
	+0Yc8VCuhKj+KdDzCK7B6SQyA71ciAuPcZnFIETVNvclGdlyZOdfJIZDckWoXiVO3y49S6QvOYY
	HdVOzpmwHpVQTvQMtT18c4DFGW/m588p7wD0jhqqwWIcMtf+iCrYjJpVXsgja7Rlt2+xQZbT7CF
	i68nk41NVyk6oyLnpTY0FZw96HjVH5fxxSfBfK5xccLCsXrkyi70oFQCakf5bP7z6tJxDPcIxM8
	bLuo9FoPmvnLt0Zau0MtznBjrlXYjCqyLMLXiQcnESngDVLUi2ODI5LZJxgMa8kZp9E=
X-Received: by 2002:a05:620a:3948:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7c91446145cmr42359785a.12.1744749867522;
        Tue, 15 Apr 2025 13:44:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNAmm+Nsu1+i6NMNPpiCxCuo5yorpSMFeDlVllWB1nRU+D/UM58m4iMW4+QW/WPBFPp1icJQ==
X-Received: by 2002:a05:620a:3948:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7c91446145cmr42357685a.12.1744749867191;
        Tue, 15 Apr 2025 13:44:27 -0700 (PDT)
Received: from [192.168.65.126] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce6fd9sm1125506966b.161.2025.04.15.13.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 13:44:26 -0700 (PDT)
Message-ID: <5a6715c3-d82e-4f9c-9296-a8fe07251278@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 22:44:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: msm8916-motorola: Use UART1 console
 pinctrl
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sam Day <me@samcday.com>, Casey Connolly <caleb.connolly@linaro.org>
References: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
 <20250415-msm8916-console-pinctrl-v1-4-a1d33ea994b9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-msm8916-console-pinctrl-v1-4-a1d33ea994b9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iMdKVHs-p0kmc_XtxYcNup5x4968HRME
X-Proofpoint-GUID: iMdKVHs-p0kmc_XtxYcNup5x4968HRME
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fec52c cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3tw8hlomtGf0Dfnn5nkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=755 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150146

On 4/15/25 3:52 PM, Stephan Gerhold wrote:
> The Motorola MSM8916-based smartphones all use UART1 with 2 pins (TX, RX)
> as debug UART console, so make use of the new &blsp_uart1_console_default
> template. This applies the needed bias-pull-up to avoid garbage input,
> bootph-all for U-Boot and avoids having to override the UART pins.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---


>  arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi
> index 48134e5ff524fd5708db7b9c3a567ec3f751868c..4e202e7ed7db1921f347ca8b4a01ccec593a8d8e 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi
> @@ -69,8 +69,8 @@ rmi4-f11@11 {
>  };
>  
>  &blsp_uart1 {
> -	pinctrl-0 = <&blsp_uart1_default>;
> -	pinctrl-1 = <&blsp_uart1_sleep>;
> +	pinctrl-0 = <&blsp_uart1_console_default>;
> +	pinctrl-1 = <&blsp_uart1_console_sleep>;
>  	pinctrl-names = "default", "sleep";
>  	status = "okay";
>  };
> @@ -132,14 +132,6 @@ &wcnss_mem {
>  	status = "okay";
>  };
>  
> -/* CTS/RTX are not used */

Yeah, no raytracing here

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

