Return-Path: <linux-arm-msm+bounces-75645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84541BAFA0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 10:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03BCF19417F2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 08:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFEA2773CC;
	Wed,  1 Oct 2025 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5HW5zA0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ECC1DDC1D
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 08:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307423; cv=none; b=HXourOZGt/8laOwxDAW+c51KpPknaYfO4kOuZ/tz07HVbk3gDWsnVPQIq7JXcU8eWHmUsX/vrVuQZ65G+RLspjIn0l+WkwqUJjbQ96nqi9ebznTIzfwUUzVVXsJnzXSWjXXy6D+A2veuYGLXfkdtupUw9ek6HrwXNSdxiQJ22KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307423; c=relaxed/simple;
	bh=UDw9fFof8/RcJ1kPbVY+sQqoq6I7U5xpbsVTYPMeEQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ifTd6Gj+0UV1ysjceN93J2wlWh1OvuSdBbWYc0eilvqXrHEl478dyMNEApu5FFGuO0R6kG/l822x8qXfA8p4L0ov2So+wXSOQ+nt7i5TYo3YMIZKGBxVpjAfOsGUjRlkF6WLmMLKJ3fchd5muto5apaGRsIXXDAIWhweiD7UL3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5HW5zA0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UMJ0jS001259
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 08:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2X6tqOnkZCqc9sQ2fgf+wm6GtNt0ebr+SQzxsxlSdHc=; b=k5HW5zA0ar0TIz7i
	XbxPZoCMmoZHXcXb/R7VIRbM/3YJQPqLm9jkIJCw+aJzX9XT5I2vLeDVvBdUWPiI
	uKjz8sQqo8qs1VW6e1MwbVkNhx9Qrm99z1PY0BQUO+bWMjgtKd52L8xVCssqEEY0
	rn30RiZiDx0zMFicf+4Ooj9HZ4x56hmvSG9tDj2Rf7mX6Hvxmudyt9m9H8CmWx+t
	eTNu6emQfnv9XJ3vHeQQAM88S/VEpdbBqEXVKfpH8rsJh//JQWzZ40OfrAS09+uf
	K1MqU8XME0eldagxHn43cuc18nCzEjHXRg4jrJJLDd8kzr9Tlt2X7WwheOz+CEUg
	31tSsQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr7bpk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 08:30:18 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-798447d6dd6so15373096d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 01:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307406; x=1759912206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2X6tqOnkZCqc9sQ2fgf+wm6GtNt0ebr+SQzxsxlSdHc=;
        b=sSr1QtDFrcBn8G8xEnt9Z2DrSezxNT0pSm051oIWbExqaQqIz0yyy6+n0864uiu3++
         vDLfP+H1uzJNH1E8y3E8S0RUQUOxtWKgfNHV6mPbxE9EAE+uX7djFfcZH4GQInuDF9U0
         lkxV7q0cQGBcaghVEr65oxzPKq4Lhog3fv/P7zbRw29x0QFnzSjUjiOawOgpkw4WsYPk
         IrFNtwmoX6LnychqiYpPrv4pf+W18fOyalIO2AQ1rMjfJ1JnXS2U5ViUc80OEx/ZSfEO
         1YQKty4FU5j4aGEtIPBCV6Zlug61MiVrl+xLvwLiM2zvNblUDFR00Ao7+3e2d9cPRjDE
         9lzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWy36v5ydkbSFHVUMLJLxDa+d2LFBygIbYZO2tq8g88+6CIk9Pb21UQwH6buKDTx4B7tOcu/rpa9XA0Bue@vger.kernel.org
X-Gm-Message-State: AOJu0YzjE2b2RmtZjVFfM30VGqgjCW5Hr2TY4zXQ/S1djgGwajKpLiqP
	ddos/yFaNuWl0TKcJVzB2P3gXXXe425mVIMsMolF2h1sw1t8ddOX1Frd6ku6j6LEr/cGGuMcqk9
	dfJgMKzXvcYLU2N6cbEOAPgLaO2mL8gREU8KP+Gst/Apgbr/uV7cGc9dzwLzBi/k2IrmJNr48NB
	EM
X-Gm-Gg: ASbGnctBt9kHFSc6JJ9S3lIogp1/pdDKarI9YlrRFbDoOy+T2ca787XtCvYghkxsQUf
	/wHFoF5r3IVBt2eE5d+S19hDOGQ7UojYJXbiHqAIklG9WfugMlEfio5+64YWxuyQzUCNr0q1Gz0
	teLz+pB4/CUXnDaA3T8vpZae1G6IoQaezLG9S3nyajIPOey4+ircgxKJGSkYNTjfaMnYNHU1ZYw
	R5ecaaFFLjv6mppsTHXju/xcUymXZe0Vf5svwfyZf8IBhYZ1fZWokiit0Gz9pGoqfwvRtRh/0mK
	n6iZg3kDt24fXuFuNMJ97EMrt6Y7xHiUTIXFZ+jWQM/27l6MsSTYqX+EKXeUsjfOPqUQS+aSS3N
	JeofL3TPG+esJ7b5+9GvcjAl48yw=
X-Received: by 2002:a05:6214:f6a:b0:806:d113:3f87 with SMTP id 6a1803df08f44-873abb0222emr22127536d6.8.1759307406454;
        Wed, 01 Oct 2025 01:30:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC8KNsHxDoPXMUkX/fvgyVmTEiJDo+/TI3l8mHrrYISyzN5SbngHkWWEk4JHQhpymJZjMEYg==
X-Received: by 2002:a05:6214:f6a:b0:806:d113:3f87 with SMTP id 6a1803df08f44-873abb0222emr22127286d6.8.1759307405922;
        Wed, 01 Oct 2025 01:30:05 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629cb2sm11171448a12.11.2025.10.01.01.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:30:05 -0700 (PDT)
Message-ID: <3483a7ba-7248-4358-b65f-356743648c92@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 10:30:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: qcm6490-shift-otter: Enable flash
 LED
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
 <20250930-otter-further-bringup-v1-4-7fe66f653900@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-otter-further-bringup-v1-4-7fe66f653900@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfX/3npjVOaWe4w
 mKLbSZ+hF5gVVZPEuroL+rM6wPYs2uJ1QF8HGGc6h2KzQwoagNgtjHc9revSLp01KUtdPpPbNjw
 yggeNH9ZH/Zu2U30iw6JNihAnGC3FX6wsdyi+zN8WuUfDY8iPDA+fSrdfxjbQw+2mCM7HKu8hZi
 nkoFJjXMzznrK6KaFwCj0iy6r47RayIrKIg+7j7fnErw/zlE9a1jJFE6G6DS0CtFVv9QIRfyHDQ
 KUqtsazXWPQ/5iujY63LcU9B2HueABBs8SR0+PKAQdDOOB6Ay+7hahALgOZ9VASEF6yZi/7PqS2
 /53mG4jIdx9o3++pL+ds1HnrkEOwBuLkAX8njMbN2B87O4BYR6QHo4gC7LPPfuUnmUT2QYHtk33
 g1a6PW3255yj8GM/s6HcBJ5Q08m1iA==
X-Proofpoint-ORIG-GUID: ALEO4_ch_10T5UlOL1-KslbhjG6LN0JC
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68dce69a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=v7dz08i6nHTDO6dUxXgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: ALEO4_ch_10T5UlOL1-KslbhjG6LN0JC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082

On 9/30/25 4:32 PM, Luca Weiss wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Describe the flash LED on this phone.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> index ce794ca724db6deb39f7fae47912c3fefe974573..36cc67469615974c193ea3a9db1b2362869d56bb 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
> @@ -619,6 +619,19 @@ volume_down_default: volume-down-default-state {
>  	};
>  };
>  
> +&pm8350c_flash {
> +	status = "okay";
> +
> +	led-0 {
> +		function = LED_FUNCTION_FLASH;
> +		color = <LED_COLOR_ID_WHITE>;
> +		led-sources = <1>, <2>;
> +		led-max-microamp = <500000>;
> +		flash-max-microamp = <1500000>;
> +		flash-max-timeout-us = <1280000>;
> +	};

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

