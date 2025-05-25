Return-Path: <linux-arm-msm+bounces-59340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 670D2AC35D1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 19:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30E6C3AF5D5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 17:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2830D1F5847;
	Sun, 25 May 2025 17:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkLbjRu+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754505FEE6
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 17:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748193195; cv=none; b=j6+xIgzw0rFLSXkncW/CkemuYXznAwnKuUothVRU5R0RO/CF5siSu/c1heRh7DB/z8r6wQOyda/5fCxXizH25mpBE98gP2LeMDNtztIwpe4sKyrw4CBmMnJs+fmE67gRGwuRvCPww0v0BgASVTsKJMS/c5YFkQDzYzIW55LHHRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748193195; c=relaxed/simple;
	bh=I5ZR3FF82SsvspTEqF2Ta82jGt3jr3/1NWy23/LVojM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TpjGtbyM+tNoaCi6NvvENjKiF4rDuGBfEuz/CsbElfJ4DUkuT5kuewu1ojjfRjA1qwSrB7mMSB2Je3EsuOAOW1JKF98fQjhy7n6eBSPTLXvSTGAN8h4uLk8RS8jx0uBKbEpDg3FHvbXtKYGASe8n3n4ZGwmPudkUrXNF9/9tTaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkLbjRu+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PFPKmw018705
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 17:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8GfQcrit3isg1rD3lf7/k9AB6FJ0WubhCzrMkEn3mXI=; b=LkLbjRu+7uyDduYT
	1aTdldON6OIg8yuZ4p4HjgcGiomd48EnBwE7vJqoda7oSBUNWXFkJ6veEyQXvJac
	7cOKQGI00HiGThk9uvRJAhTm03RYDdRlpehmTreLyQFJfPX8949w9Rut84pZdOD6
	0uqSsouoovvxZX6dZdC9fT67o0cziPBbzWZ5igMAgGp2/alDTmU0dKdkVDWk95kh
	5hQ55JmLa4RZkI9GhCLt49nIS0MRx1eH8BRgeGDfsI6tAqEZGYSiwbqX6Em7PvLj
	sjMTHlHg3F+lW+8PGm5WoDRsVi1OiTkju2WlTZIYZb7N7Hc9tvy0lbDJs28Km0H4
	CBPrZQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549a9r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 17:13:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so27589336d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 10:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748193191; x=1748797991;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8GfQcrit3isg1rD3lf7/k9AB6FJ0WubhCzrMkEn3mXI=;
        b=sbkHfKs2rSEIFYYl9BWIvr3hpgSLsUawAPr4f0JIYWdoPU3i0Sgjk/oUsb7S9eHpJT
         sdb8TMtXhZ7KNBl8NZ8lboYIwYKHxpcExVQUda8Vdv5b/x0tmpqmWV3s2ZRKMZmwTGMG
         ASz3ingtylvEe1NyK9Z8Wgec3xR7XyapmYf1lf0eRlm9PKpXiKUAJveYbK3Sg5WFugnw
         ebTtelGkIYAojTjtsfFcJ9ryqRblawGlI9KiS8wD6+AN9DvG6JhqposLxCIS28Ik/ZIr
         JndlUyBOpSrPeBBiLGI2SYxtqOh0Nn3aE5X1uNWe7SaKbnK0rfZ/4fKWZ245F0L/RI2s
         BPpA==
X-Gm-Message-State: AOJu0YwVEVwndRkJWDIAmvw3W2cmaE7xsx6z6qT5WNpZHrWY4tbNMi4T
	OJg3RJkEgp/S5wmYnK2VPmwPOL+cqm0LlQ6yopWNuTOKrcyySyz7fHmOshHUIXv76XfofLOkyR/
	P5DtNhdVJeizG31/2GZDs2ukLcQgzIHCC62s9hHJBvfFPiYKtcDM1cCNt4PxcJi2qk5Gb
X-Gm-Gg: ASbGncvZSWCk9TBUq2JT3z+04nhWhptwocTf8071ziriUH5GEpMGdw1EI1SbLyMZj5U
	rT7hUkFNAI+q1l2RQke0UEe3lhJLP/waVXpDHKsDIz5xZmMbwBqFxdhNtO9ymrfQwfZIEX3ns8V
	DYgpnr86AjvPInuSLPkLTyUQUo+lF/yMJ/FVzqt8ECtaex1QkqpTVA3yvNQ079pijrRdSz22ZMP
	9AGxm4gFNf2ev8OBuejg2ggwkn4i2S9gVkpJp1jp+4xn6taWOc/a71BFlNcdPIqvCfJI3qQJLqH
	xINTCpbJwdn+6pp7EZc1AdVYDxvy/zKAxEab3ysSeWPFTBdg7oMr3h9J8BbcHw==
X-Received: by 2002:a05:6214:f2c:b0:6e6:5f28:9874 with SMTP id 6a1803df08f44-6fa9cfd2912mr112515286d6.2.1748193191161;
        Sun, 25 May 2025 10:13:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLy0QUxrOeWfkESnbDjqayvG3igEvUkE6sR/3TpigvF16g5Xho+6TvOHh9oCRLT8RtmZm88w==
X-Received: by 2002:a05:6214:f2c:b0:6e6:5f28:9874 with SMTP id 6a1803df08f44-6fa9cfd2912mr112514936d6.2.1748193190710;
        Sun, 25 May 2025 10:13:10 -0700 (PDT)
Received: from [10.117.217.18] (194-204-13-220.ip.elisa.ee. [194.204.13.220])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc7d8a77sm2795716e87.186.2025.05.25.10.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 10:13:09 -0700 (PDT)
Message-ID: <cfd4f557-7f97-4da9-8eff-fe3749e336db@oss.qualcomm.com>
Date: Sun, 25 May 2025 20:13:06 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs9075-evk: Add sound card
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250525155356.2081362-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250525155356.2081362-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: joLyyuR3N-CCscZ8zrr-d_9sMadV2Gni
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=68334fa8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=zsrLd+foqYdeTGXumyX8oA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=J2ExMKW3eQPLhXUHgQwA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDE1OSBTYWx0ZWRfX60FDHFiJECkV
 LVQYJxz9r2xQUgsUM3t6fMwWEopKOXgqdFWkc5j5aFDeSL5EUeLhBuJESWwiDi9gpc1W8ImSAQy
 O62dfuec80MW8U7+GibDpF9fJj3N8maG8FjzO4OjAZqiGTqojvFAzrhJ5zwOPARmOgyt1LUV5sm
 f8V7BrBvO/WvrU2J5sFXRa3NhbTPJK3IZaKuLc4crFbbV3Q3kxq3zAhphNmktC9znui5q/EY/Nx
 k6V6hial/5qXLMGjnyniYgrxviUa7QEqZzg1MheZmXTFjdvI10OQnwe8ZYa3HqKTVF/ed7WJbdy
 hhZgQDIyVVNNGt+qVc48vBVIVDZnXFSaKuoS9jsP4MmW8zbOXl6eq70+EYdatkquooJqmSGh+vQ
 0VVDr3D0r7GZ66mmoahAmPcxEpOU3iDp5AT/M+0NboNpulJilX+uR3HxDABi0+w39sGyJ2OM
X-Proofpoint-ORIG-GUID: joLyyuR3N-CCscZ8zrr-d_9sMadV2Gni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505250159

On 25/05/2025 18:53, Mohammad Rafi Shaik wrote:
> Add the sound card node with tested playback over max98357a
> i2s speakers and i2s mic.

I2S

speaker amplifier

> 
> Introduce HS (High-Speed) MI2S pin control support.
> The I2S max98357a speaker is connected via HS0 and I2S

speaker amplifier

> microphones utilize the HS2 interface.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>   .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 +++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 14 +++++
>   2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> index 0e44e0e6dbd4..1ebf42b0b10e 100644
> --- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> @@ -6,6 +6,7 @@
>   
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
>   
>   #include "qcs9075-som.dtsi"
>   
> @@ -20,6 +21,57 @@ aliases {
>   	chosen {
>   		stdout-path = "serial0:115200n8";
>   	};
> +
> +	max98357a: audio-codec-0 {
> +		compatible = "maxim,max98357a";
> +		#sound-dai-cells = <0>;
> +	};
> +
> +	dmic_codec: dmic-codec {

Just dmic or audio-codec-1

> +		compatible = "dmic-codec";
> +		#sound-dai-cells = <0>;
> +		num-channels = <1>;
> +	};
> +
> +	sound {
> +		compatible = "qcom,qcs9075-sndcard";
> +		model = "qcs9075-rb8-snd-card";

Were the bindings and the driver sent? Cover letter doesn't mention 
them. It is better to send them as a single patch series (this is the 
case for all subsys except net-next and trees maintained by Greg, e.g. USB).

> +
> +		pinctrl-0 = <&hs0_mi2s_active>, <&hs2_mi2s_active>;
> +		pinctrl-names = "default";
> +
> +		hs0-mi2s-playback-dai-link {
> +			link-name = "HS0 mi2s playback";
> +
> +			codec {
> +				sound-dai = <&max98357a>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +
> +		hs2-mi2s-capture-dai-link {
> +			link-name = "HS2 mi2s capture";
> +
> +			codec {
> +				sound-dai = <&dmic_codec>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai TERTIARY_MI2S_TX>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +	};
>   };

-- 
With best wishes
Dmitry

