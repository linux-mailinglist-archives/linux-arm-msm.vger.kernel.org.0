Return-Path: <linux-arm-msm+bounces-59094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A63AC131A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 20:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E433416DA99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 18:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D151A0BE0;
	Thu, 22 May 2025 18:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m9+C8ZOq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421761917C2
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937630; cv=none; b=Y8XAlMmguvx5vE2fSR6MaZ05xiVS9mlzLkKSdcbyw+qHwHIWnAXkJOwQdClpan0KhGJxu6p5CjxOHbFTTwo+biTPEocxZ35uwV2dlMJqE/qEXP8dLVnfbvMzgX/I8WM+K/W/5Ul4q/vLghPBZ8EJfJnFTGS0nygGtGRnICbL6K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937630; c=relaxed/simple;
	bh=91toqZEphZKmE9o/rBckXJd1FNa8ApcyPXqGQ8XvA6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFS89djJv7OV/obfhf5JzghlhTt0IPWBPXBG9GgAHpQwzKY77PKa5th4EimhMB6kSBfRjrGfmQJefDuWmaGec7EyZZGejpswnN/P+/TAHbU1/Xh7/dy9ChDRt0xcFoiiuXCGt9ksROgC622QUTLsHQevbZB73gd8E3VXe8hXgkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m9+C8ZOq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFSxoL021016
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cJTXM+7S9NgTzSFFl+A5KpdMXXyd0FhjVTeFKwQdXKU=; b=m9+C8ZOq9cNDiEje
	5wxs2n8HsrWNecyEGl8XPaenZ8l/TfNUGfgDOLHH4O+ymVYY0lcn2F3CHzO33uS/
	T3WKZoKFLDhZ+Cl20uXtYL2HkeIKUNr/pWrRS0SFnpOyOOKEZa65GR2PMTPkegft
	nBSnioF31A6ywD7+UmqSuT+4+C76LNK4DU6queo2R0Lf3e4jICLhTFeiKGwehKAO
	oxqZvWmED6FJua0Bq1UwlzjHSzF9J0snSGtG3Og1o/fKcS8Fo5Qk/2nQ6Azf85+u
	yS9Mj6EJFLE6aH+2py6z1uZlugJB4zxQ5TaLNOP1bRg420ujQgcEJ+3olKFLYy4w
	pTt/0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf07g5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:13:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c552802e9fso204314885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 11:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747937627; x=1748542427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJTXM+7S9NgTzSFFl+A5KpdMXXyd0FhjVTeFKwQdXKU=;
        b=UwWo49bLc8FhuPfaDeogkpyZNgnnONXEZj1Z5QhPqXc/hNtFQyClOZH8QkGsmor/nS
         31kbHfm1ozDZFhBycH5RW0I0+MOh9Yrl1EV5QdazxY9Dp2K1DvrfwpNxXeT2Oy6S7qsc
         4qh0HHRDfZzX1PX5yp+gzE2AcdqaPYxDZdDiZg0u7Gmh85L0nCuY1+cFZjHJho9yKp+z
         TpoZ/rFVpDqPHgPT5VOEjwO2Gu+mz7yrOGyqeF7IaOkgGa5xUwbiAlVonHCj2orWZg/u
         2CHCAPGWLrg2Cwmv+Fc/CIaa9z8cUNAMoIujExrLlZQ4J46J4P8HTujX0IjOwDHRyYBw
         8hlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0OgFB9k40W2cfc3SYcldK3PptlwlmAFyGp9qzVA1cxgVm2sUrG08xZumgAuB178r+sz/+TvqtxA+DpRxq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp/za5As0K2LWWokGcogmwBhHFsmfLEFzRVJUOvcG9pLf7MvQd
	8Xbc/NTRXsFj6Jm0nVs5I/eQX5I/fjYSD+k2FcpAmnjDJXZbc/7zB4ryaVfjrPhXVIQIlyau4fD
	hU9EkezpWEI+P356aEJHAPJHIoJVUesOv3OY8t5gTey2smxH+04uiyLNAANoqJIInGshe9DJETv
	sp
X-Gm-Gg: ASbGncv/tKbDJ5jiHr7rGZMpGK9JMF3ibEFIRXO8VPT2XQIQRKVah0APJHjBEYuzGin
	0fkCuSexsZivyuecYewjn1IKG2ZcKmR8Z6mXbCW1EF0aeFzrZbyJImrRl8Lf7XZ1bLI4vr/NztZ
	GvB0cswoT/R3X4bmbbPp14atUVIsf9NarUccyLD8SyExgLdtH4u+nayS3wjDFGlRcPii0SW6NtL
	A0K4BlpXK9567JGD0M/s/Rd2tzviev96ifOZWR2ToEj0RAS1ck+X7Lq4RGtXLNPXyG1JfD2G3Xz
	mlUar9t/UmMqiv3ZQqX4/yEIFjX8ydvGnFY1URwD93BZOYgeBhJAd7kgn/46fQQTRg==
X-Received: by 2002:a05:620a:6506:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7cd46779c90mr1645451185a.10.1747937626843;
        Thu, 22 May 2025 11:13:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFG1s5LWcfdRcLuprDH7NRf4cIMqfzPMsVHaGaLchl1HpyhV9P/PLyDyxgUXuVubSzGN2Rrhg==
X-Received: by 2002:a05:620a:6506:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7cd46779c90mr1645448885a.10.1747937626412;
        Thu, 22 May 2025 11:13:46 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06cdefsm1130366966b.52.2025.05.22.11.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:13:45 -0700 (PDT)
Message-ID: <c7d5dbab-0a51-4239-811e-dc68cac18887@oss.qualcomm.com>
Date: Thu, 22 May 2025 20:13:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] arm64: dts: qcom: qrb4210-rb2: enable wsa881x
 amplifier
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-10-9eeb08cab9dc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250522-rb2_audio_v3-v3-10-9eeb08cab9dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mTK9yG2ovgErbmf5sgmy3-py3OhEj7oK
X-Proofpoint-ORIG-GUID: mTK9yG2ovgErbmf5sgmy3-py3OhEj7oK
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682f695c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=75nCLt9WaoCjErCtZgIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4NCBTYWx0ZWRfX4YHT59WTGnTm
 hBuHkvaLnTnkcB8MuhmanJE0XftF23lfuO2U3AP2qCRR8aqkxa5/WALgb09dkWBT5Rsh3VFtBh6
 jKm1iTXOyxfWnq8RB5+m3/kVKUjZ0zh7iaous3fI6+DC5jian7lZMmQKUDQocroO1wH0kABPTBL
 fbFIcKF+Czq9xC7e/fgm5V4VjBiHCGg4Y+NO9wEbu6opQ3mMvyv609RYgH11jkUsGgW1yECxZLn
 DZKVaWonbGX3s1uyT4c/BZ86VEDyWAgfSDFc8NgGr1JpLEcKb/aDb1iFVufU16fAYSYgmbe02Mz
 2kOUfUWcvu9HtD5pX0Xqm1No2XjSxD5QKz4NGQSPbYPgk+EqSbVU+KV47FBR2FD+wn+A20/UWXh
 BaV2+hdZGnL80JWIuJ96JIXpNIIBrAUQeeTqNnFQHMeo4xPzeNybcR5U+tinSmWUs5LGgwmu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220184

On 5/22/25 7:41 PM, Alexey Klimov wrote:
> One WSA881X amplifier is connected on QRB4210 RB2 board
> hence only mono speaker is supported. This amplifier is set
> to work in analog mode only. Also add required powerdown
> pin/gpio.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> index 6bce63720cfffd8e0e619937fb1f365cbbbcb283..4b878e585227ee6b3b362108be96aad99acba21d 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -270,6 +270,24 @@ zap-shader {
>  	};
>  };
>  
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	wsa881x: amplifier@f {
> +		compatible = "qcom,wsa8815";
> +		reg = <0x0f>;
> +		pinctrl-0 = <&wsa_en_active>;
> +		pinctrl-names = "default";
> +		clocks = <&q6afecc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +		powerdown-gpios = <&lpass_tlmm 16 GPIO_ACTIVE_LOW>;
> +		mclk-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_HIGH>;
> +		sound-name-prefix = "SpkrMono";
> +		#sound-dai-cells = <0>;
> +		#thermal-sensor-cells = <0>;
> +	};
> +};
> +
>  &i2c2_gpio {
>  	clock-frequency = <400000>;
>  	status = "okay";
> @@ -736,6 +754,14 @@ wcd_reset_n: wcd-reset-n-state {
>  		drive-strength = <16>;
>  		output-high;
>  	};
> +
> +	wsa_en_active: wsa-en-active-state {
> +		pins = "gpio106";

Are there two separate enable pins? Or is the powerdown-gpio something
else?

Konrad

