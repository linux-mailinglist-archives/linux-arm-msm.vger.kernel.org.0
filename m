Return-Path: <linux-arm-msm+bounces-56108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 015FDAA0903
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 12:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C537845417
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 10:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E212BD59D;
	Tue, 29 Apr 2025 10:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lsnynrfk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A421E231E
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 10:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924290; cv=none; b=GCKFncU/YI18Gso/BdS+cJqCVGdkc4+6CHqHdHoIBWT+wWRZFMdrPy4vk+AnlVIKR6OsuOGa+qcUW7Gl3Qo6Au7zDlt1wvPW8PB8LkEnANKSSBFjj9RUtImIOD89nTS8LSyNzy6RvQFQQa1nAovPR5uFElpRky77Dc+Cp8g6imY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924290; c=relaxed/simple;
	bh=fphufsS75GYBBcFBWnCVeA34fEKRwNsxRNgx6yLY/T0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QM1MCmJjH4DzCYUazYUGjzpDySk8HYM+85yLBKzTqwlwdy3cE1BDB5qqB9uTxYy/oRn9iJ8s1YYPFmEJfQokCp2NSOhhlIikez1a64mf5n1GmHcXyIw7y8hiJWiIRI3S85clJ578ywYxeV2704xwYmKB7yOuLfWGf+sbnnQP2uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lsnynrfk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA2aci011881
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 10:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HT3dXf2eHLieMKHvIETGpanBPjJB3EafGATYzblRr4Y=; b=lsnynrfkYSExDHk0
	qC6TmENVBTmHEkJX7poM3MPvbsAWEnQksNZTLS2LL7TwWlEjXn/96eaRxZcVtiKj
	Jjw8GfLKRn3uvDjPiwq5rr+Qafc2L690S9J7FJTzQjBUVQ67GPo4tKLGoNqXGQYK
	7Bv4aN4YsTrx4rXN3wq41a5xJIhOSMz6Hzym2btIy8/+lKjAfztbyf4MD/H/4fPx
	6jdmjf/k2gwKsCCoRJccdN3Ds81eV01D8521cxvnVuSgmSQx/2Xa5QUDuNUEZ05m
	rG8se3gaswcHVWMAwmwoFN1uKwPEq9mYh3DZcf0X7kooYeO1/60Ixfvawop6ZLTO
	AIoZ4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg9caae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 10:58:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c76062c513so101492185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 03:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745924287; x=1746529087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HT3dXf2eHLieMKHvIETGpanBPjJB3EafGATYzblRr4Y=;
        b=sNlB8iA5U4MiCvbNNgvtQBzMWvrMGzziYlbYKKQjb67c1P/TWXyYs1ypV0ZqtGy4Oo
         4To0uTDCmWsc/JZ6iOEYhVpohpH1YO3de0YgxoQajDRcMnPVc9dYX9++OOYDcTWKZKgM
         Lg4Z8w0yLM7Hh8JszzhTCkvJSKk5lQFPWeAakewL1cbPfxltcgLZztfls6tWMYY5NUam
         IbLakWnjEG382Fs/MyVzYntNhgsLyHpWNulIxSL5tKPEMnYIYvf+SRPvEXkWSGnCJ1BF
         XzCjkm3i4BFPkDQZ4rDINmO349Upix6DFqU5+vyvGNmsDQVmKmDjFn9FeA21kf0jgZZU
         78KA==
X-Forwarded-Encrypted: i=1; AJvYcCXHIMOkG2Nanhe/jBKD2D7No+othyGLPsvgauaII16N59FyE+Ocnrf0CTmb2T4qFlsL8qV95HoofqVaPQMN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi7s/073uju8QCdy7ir5zBqnPg7f+ZegajZfVM1dvr1fcyasRr
	A1T/KSvh8e2dMmBzBtTN7hoYh0rz4crYFDs1alfuqrZ0uN1DrNLN7YC2F/cFlGMODYEVjv/WedU
	wcx0NTZpY2U9W4MUp+Zb+iGK1XrHf8f4en7o4Xy2hlodkCyL35WIj2psErVd59FzF
X-Gm-Gg: ASbGncsG7yzPjrensEgj7AUNVJA3Bmrt1EW5z1VrqksCNlO0ekVSqlYXlLwKV6R4YmS
	+BwT52X9OC/vqJPgsGUCHqkmjusVKqRiOmY6c2xncuron7kL4rFt34F9COV7JGUTE2ze6G2IrRQ
	Ft7vlJzLr2q1/gjzzfr0mmt4XWab6quD4tYPae4KSyroZXpkk8y7fI+J/5BA6GVM5KO/thL/s0I
	GViaP9Gr5OWRZCcWCCdu/pBkndy6z4WRdn+mNWl5uLlhial3Ed7ltSvOAYRugAmhRsXHUWsST3j
	SQc0R8f1FJACoN1JGMjduCfqH26qGyJXJQWxQTXjx/pSIZjWgbn+sjgEczK/1IbDuw==
X-Received: by 2002:a05:6214:c42:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6f4f1bbe3cfmr14938316d6.5.1745924286808;
        Tue, 29 Apr 2025 03:58:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFvT9qdeZKM8ZtWBzJM4XZYLNdlPQWbzdfnDzWOcBFG6syPrx7jRpwCUdNaPIAqcCLrSuRGg==
X-Received: by 2002:a05:6214:c42:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6f4f1bbe3cfmr14938216d6.5.1745924286435;
        Tue, 29 Apr 2025 03:58:06 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f701400565sm7365680a12.26.2025.04.29.03.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 03:58:05 -0700 (PDT)
Message-ID: <cffa3374-c88f-4390-af7e-d6309a870b63@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 12:58:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-6-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429092430.21477-6-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=6810b0bf cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=LhcYZv6hF2g8wJCaxG8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uiI3HFBXohI4QjpBBODOAJlxqukC8O7C
X-Proofpoint-GUID: uiI3HFBXohI4QjpBBODOAJlxqukC8O7C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA4MSBTYWx0ZWRfX0J1hOakrl5fo rW8AawaimaqD8oiNUfJ/5Ts402/Q1gMcShKVc7fTYTL+j5I/JCjYcFqcrUniOXtQPZUf8sRlnG+ SyDMBOGaM5JS3BQYf1fkfmB8jpRiQSCXmJLyR7l4jYbpgGsxynypmqq3gncVUpvJvScnJ+eHS0H
 IKUze/qhEbT3gMxGjQd+rANYXDfT2ba2MKeNyw/I3VTkxkAj6G74jID2so121iGkPnMKazlsgmj zcY1RamIYc53HywGSEdaHtvNygNxYO0N6PNfsrBXRDHjUjMQEFzkV+sj29M+AMNuSVRcd7aHLuW v6guCwfoF3XNUI/vW3DI1L5B5q5j4hQaNNDl5iRFWttKsWUcIqzBVyeu+0ZO8+EuZRQ5Qyt8cnC
 Zuu7m4QtkanAB+d0TsbcCa8azQaweBM7SL/4Fqn5Kt1EPIr9p1aapDMm6lDgKnoCpXJz9viA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290081

On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add the sound card node with tested playback over WSA8835 speakers
> and digital on-board mics.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 49 ++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 43cbdbe43afd..9cfe648e29bb 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -1078,6 +1078,55 @@
>  	status = "okay";
>  };
>  
> +&sound {
> +	compatible = "qcom,qcs6490-rb3gen2-sndcard";
> +	model = "qcs6490-rb3gen2-snd-card";
> +
> +	audio-routing =
> +		"SpkrLeft IN", "WSA_SPK1 OUT",

Please unbreak the line and align the entries

[...]

> +		"SpkrRight IN", "WSA_SPK2 OUT",
> +		"VA DMIC0", "vdd-micb",
> +		"VA DMIC1", "vdd-micb",
> +		"VA DMIC2", "vdd-micb",
> +		"VA DMIC3", "vdd-micb";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +	wsa-dai-link {
> +		link-name = "WSA Playback";
> +
> +		codec {
> +			sound-dai = <&left_spkr>, <&right_spkr>, <&swr2 0>,
> +					<&lpass_wsa_macro 0>;

Please align the <s

Konrad

