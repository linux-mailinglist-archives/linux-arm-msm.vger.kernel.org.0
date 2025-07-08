Return-Path: <linux-arm-msm+bounces-64077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8179EAFD3EE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 19:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CADD7B4C55
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 17:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400032E6126;
	Tue,  8 Jul 2025 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aAFhtQBD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D3A2E5B15
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 17:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751994093; cv=none; b=HPWodKutpjkxV42XrcA32zcNSLqiWy1gcXqevwMGFQnYLVJQqOkAUTT1zFKAKuxC6MVo7/9Jvs41KmXoJpKDuObMlzlw8DYS/ZHtJSJ/Chpu6f4CYj2j0whsLuIHnU0dAox9uNa77IX1t8zVHCTaDQIfACBXDOAECwK0oeYiluM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751994093; c=relaxed/simple;
	bh=BqGM5a+qikZv6YmiHyixJJYfugYzxCcrLmI9hiVzEV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOVBTlrwu+GOjHvQL3Ev0LN2SFtodu4c5ST1/P/bjhXpEJe0OyiFQh+bQRThhzL63U59jGivwpbNEWtJFKU2YOyuTv5B156JCjyAxNbDs8BP6Dk1SnTadMSGMrrAh9toOTPi6jO/RhjO6NVGefmtEGOYl5hxCJoLJF93/8PZUHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aAFhtQBD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAOV0030357
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 17:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9HVP8PLVIqdMkjmRam85PKtQy8lGLeiTlplREZoT/Ww=; b=aAFhtQBDKUUcfX2a
	/vYCH7QPM7P3AEvgGOIRifYHnqWzwbHbUCDCsYi9gOXkc6uLlokrV2nBx8jVPKRI
	6Ge6MRoJzG3KXr54OedZeD2uyenR9fa7aw9u7EJfH35v9Qk1riJEO+FK17+yiUCH
	ZilC79JMnbMcXixLaLY9z8/Rk0Ijz9QV81zFZQ3m4bu4qHQ75LuXwbV5az7KgZAg
	7hgfoAmMLq6uI1sV7x/IjKyMVwJXS1UmtklJElLLaAKsNSyDkxlMC6NluJWOJTrC
	gZVIUts0JWShuoDA5xYfYdZDtoQH+a83Hz+Ed0YWhSnAf2yxzFTkvgu8XG4IBTSk
	m/uiGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0wm09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 17:01:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09a3b806aso42588485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 10:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751994089; x=1752598889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9HVP8PLVIqdMkjmRam85PKtQy8lGLeiTlplREZoT/Ww=;
        b=XATV+H/MavdpfTL10brvg5g6qRs3T5XyYldxy8gnH3H6aKORoOJbz4iPtlwzjyOYvs
         XZZRuAC7tZ9GP0h29jWxB/QXhlL4PKpGD497oKYjV3UgAEc7ld6o6N7gQNcL0KoxvSFO
         ry6jB3GUiHbY2Mceud33MMmVLQfC6VhAW5BUR10kBYtlkIaSfR5LKI5T/Ni11GtdtOkq
         ZV0HSLCC3oumriXUUUesezU+m/x36ks5c0fuayBh7ompeLVGX7UMmUS4Garf/ujjMv/l
         34SfRZ+F7zIz2Dia4m1nEA4t+eaMkNTos51DcIyLE3Ran/usHUcu4NWSC9cmRLrT/RKX
         +9NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFenBg/w7A41gPFpAUIx1fmVymBUx5SIeRUyxzbiJpFA+GvQ97+gMqjoUaWPnreZCEVI1cGP6nsM1cX9Tf@vger.kernel.org
X-Gm-Message-State: AOJu0YyH2YtIwrZecGrJ4AVbK9AxxE/a8oy0N6S1D6puR3TNwCmmujOD
	qbM7Y9ssPH9NSEAoMm2eTHWEPuHHlkZXsFdU5k90qeSsWQSLnPXkSn0NoM20Ql+SLoX5Umypd6S
	1aSPFOiLTvZltPTMK3LJ0drzfXnNa6EDTZBK5QZ4+oqLOI9wTQ3LksjU4XrsASEL5xkKG
X-Gm-Gg: ASbGncu6jJLK9QZvyEe9swqESiWp45G/9tVFOvG8dHoTLna6yKFatRIRXu63ejHztwL
	a5ay/xmQKuyMh1TdQKljQJnv/7LwJQnXKpSW15AbjQK+tWSnyFfPU/ou98Y7+l4C4nZ43dTYjDq
	4P+BTY+2e5jEOgpUIIvwZz077VEerTJ7ycmiZsOCDTVdNZl8kTkMXJeXVCjOgt1FYnBWCvNjanq
	t2L3ChhiUX7Z8UQr/cR/1cbFt8DBHRfbSjckxfEupDsVkg2S433iPmIcvTTSwdNMaCaAt1unbmn
	nZI5qLfOY5MQGWmOVZ6++e+qDKjEXcvVSQkdE/KdTc7Tyja+Nk8qCCGukExCsfolYBWRHtxJqpL
	ga+I=
X-Received: by 2002:a05:620a:2606:b0:7d3:c69e:e3b with SMTP id af79cd13be357-7d5ddc9c00fmr724139885a.12.1751994088958;
        Tue, 08 Jul 2025 10:01:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm8VaEIcGVpLYIC9btd5VdZrEByDUcJ1j1cqq4zNRG2aWqvXrcL2ih+rvzNvPZChhbhkCHjA==
X-Received: by 2002:a05:620a:2606:b0:7d3:c69e:e3b with SMTP id af79cd13be357-7d5ddc9c00fmr724137285a.12.1751994088291;
        Tue, 08 Jul 2025 10:01:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb1fa9b8sm7404785a12.54.2025.07.08.10.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 10:01:27 -0700 (PDT)
Message-ID: <548ce30c-941e-4ddd-9391-2bb5609e26a3@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 19:01:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: x1e80100: Add videocc
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
 <20250701-x1e-videocc-v1-6-785d393be502@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250701-x1e-videocc-v1-6-785d393be502@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686d4eea cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=GeF6aowdgphGmeW15skA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE0NCBTYWx0ZWRfX72EQ6XFIyD47
 /oWw8YBvanSXsf4Qcb6ZVDMop5hCSQe8R47QfMDB4qUTHZ/qmk1A6fCPjRUJqguB93fRBWvxgFs
 QFFShs6ZB/c8qBTWsNmtFlj9XndPTEp4D44JJJ6jwFfyRWx4Tyg7TSd8B+PUNJbCCNaMjzw1Ibi
 dFh/2OXnYYLXb9WCGFZuVj2WQQJzj9EyRqmFGQ2cqW/9u+tyZpAqnpaYCOXzMibOEWkynUJ/PA4
 kXVTOShrwsQZgLfwQ8YNtRzcoWJhZy2VNzpM0PSNE0PjTn1f4VS3/KE4y6p3yhC0G1MddG/QOa9
 OL14+P3vVDtVGf3UZSkCAHHs05XrdGBzLu6VAEt0C3UBNMPUlcyTVAsdeENZzETkG9QlG6XFXqg
 4MAU3D2/HbX4d3rdongUmayFB/TGlcj7AqP1Qa6dKU7XneLfc75RoGH95l/flCY/HP92zIk8
X-Proofpoint-GUID: EW_83pQ3sVWK0urVj6bTDOmNgTWYOU6b
X-Proofpoint-ORIG-GUID: EW_83pQ3sVWK0urVj6bTDOmNgTWYOU6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080144

On 7/1/25 7:28 PM, Stephan Gerhold wrote:
> Add the video clock controller for X1E80100, similar to sm8550.dtsi. It
> provides the needed clocks/power domains for the iris video codec.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index a9a7bb676c6f8ac48a2e443d28efdc8c9b5e52c0..890eaaa40184a18bff54f2d750968112a2546d19 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
> +#include <dt-bindings/clock/qcom,sm8450-videocc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
> @@ -5171,6 +5172,20 @@ usb_1_ss1_dwc3_ss: endpoint {
>  			};
>  		};
>  
> +		videocc: clock-controller@aaf0000 {
> +			compatible = "qcom,x1e80100-videocc";
> +			reg = <0 0x0aaf0000 0 0x10000>;
> +			clocks = <&bi_tcxo_div2>,
> +				 <&gcc GCC_QMIP_VIDEO_VCODEC_AHB_CLK>;

This should be GCC_VIDEO_AHB_CLK, you can refer to it even if
we don't expose it through the clk framework on Linux (it's
enabled through magic writes instead)

Konrad

