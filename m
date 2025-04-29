Return-Path: <linux-arm-msm+bounces-56105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 425C1AA08EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 12:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98131189DFD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 10:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971072BE7C8;
	Tue, 29 Apr 2025 10:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2q8Jnx1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11959211A0C
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 10:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924077; cv=none; b=OtNSDGQIrDy6nEMrNIVZFdlgvO6Xa57/2TE78ppuTsRPFPfMo9NBTElfbov+Rmx49mFvy2md7y2H2nuX77IY+twUjjFc2jGP6D2PMH2VL/IYpUbx0iZE+HPOdInWJiH3eVAEUXiYTMus15dRT3AZYLUFEMIIzGPtT/k1KdMkoVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924077; c=relaxed/simple;
	bh=R+R5owaDqiRtDGdV54f3tvu5tpjQYX5gZAf48U5swnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/+ZRa0RonzDAEbBHUuv6r2KJ1umxnj3vPEKX3A/GAS1jkfSGkUkQ4kloLaoQ1Jy0M7lfg/lNlnexwtmo8snPr3ri4hiNPoDIBAasY67hAWuPNmHv62GwUCxz3T9A0X7H069h0ZV8rl655Tv7RKVypl94W7qyzS/Z7S3zOAJ1us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2q8Jnx1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9sp0s012491
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 10:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5rlwbv5Ny3csX6621th9RuiqaZUc7eazYNnVFD4rwNQ=; b=U2q8Jnx1g66evgcM
	gbO/avSqpnjlcmVTSII7Tyybd0oVrcuBwWnr9qx1SI0bX3nOyHY3g+KOUTnQfecM
	npMu6gbp7DhnTGeaIVIA4yeuenq1rV+6RveNVGKHFY0RnWLAPdrroU5uCW34xL0/
	GGtaOs3gim4SGEqz8RnkxvdnfYRlIXpVpguuqLd4v1UsDgfKCnbOkR8+taAYY6yO
	bp1XR+26PhviWWa2AdiplmoP59Y9MQ2aE3afUv+5v6wT7TBKhFP1pP1R8JgOvMGh
	Sw6gVPz/O4QKz1FNTXJGH+kehJMYwcRjDkseBmDGsii7+qnDxRgTCiyO3vlR/h6J
	DYu6TA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg9c9vu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 10:54:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ece59c3108so16079246d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 03:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745924074; x=1746528874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5rlwbv5Ny3csX6621th9RuiqaZUc7eazYNnVFD4rwNQ=;
        b=HG7+kGJ4zidVNSUmDRhh1WLTk/AvarT9NjLlGrHeABqGckmcYfl7fOf7QsUFYCkBjL
         zbE9hB9qbgOrB8e6EdcabCwm+PLBtUuQJQLfiM9ywwYnrLpT9Pv1Jy+3oetN76fF4gjy
         kbeC31LM606AuXrz12Jxf0m0tpAnuC8TXoZjvQjA/ewe1IiN/1VQB8nbt/H/geQzIeV0
         9ChQ8gFXbWdt2UrFPc+aTwjJCyf8TQbMWC2+KdbEHYtjR8uA+W4ljgThJDzFF3/HVbLy
         JBdQFH0nBGeNHuH0ua6KMFtPdths2kFIZZGiP3jAh9TLPgp+xHr6CgX3MXifv3j9SFmc
         MCQw==
X-Forwarded-Encrypted: i=1; AJvYcCV/qEe8dsWrN8qinourRjmFUdRBkYqYJkrUsVC3eOU2oEue5kPUN2tBi95IKogaITvSbAH58Gp2BwvUwh0Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwiZNwlwj8kVrvAEo9Dw9fyYN6Ywik12h1ERBUtKdNSu4YYkcIV
	LsTCZzo4EQCCR/Mw1bd6CD4Rbk9LlDjzVgNF6Hdri3a9H1UV6uOlLlmNGQgU5vUWhGnoNSle0mp
	4BzrP3v6mHpsq02ZjeqzEF24z+jeOkHlcRYYfKI1bDAo/SpKjDdIbdq+xZZxihx4SHfqqYKlI
X-Gm-Gg: ASbGnctbNzUnbA7wEsOfctPpM241pCGZg6kTKsL3UOX7X3aW1cCwoBOXNuDjE1F7MZj
	Kfk/siyVo7+5qYQ4InNqmECR3maGAT37KekS+SDWY4zx6s3BBM/2MIbykTgqDEKwzuTXOMk90FF
	Xn6w+TSM9+1tl29WroPDcGw1oF8Ihy1oydW14GwZ92q6WTTq9oIDxufOl8ucnrajbQSZplde/ga
	JU+HR4gjgBs6OJ2bstEpQe2QEA/M6NCfr7OHBU6sjTvpREKLhQU+PACOdHaygShdd5EMNG+JPMm
	ROsncWEYlKwrYO3XAACusy+gLftAgH90v+N1qBwhW3FJIQ9mp0ZakbghUTlabPPnZQ==
X-Received: by 2002:a05:6214:27ee:b0:6f2:c10b:db11 with SMTP id 6a1803df08f44-6f4f1c5027emr14214466d6.6.1745924073875;
        Tue, 29 Apr 2025 03:54:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn2N9lav3OZuTTsmb+XCemA8XnPPaA9TM90PwF3DYQcPvu+55T3OzOMzCwrbsGph9xAhK9OA==
X-Received: by 2002:a05:6214:27ee:b0:6f2:c10b:db11 with SMTP id 6a1803df08f44-6f4f1c5027emr14214366d6.6.1745924073541;
        Tue, 29 Apr 2025 03:54:33 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f703545218sm7152933a12.53.2025.04.29.03.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 03:54:33 -0700 (PDT)
Message-ID: <12ccf19f-10f9-42a7-b61d-fd54d5922bf7@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 12:54:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: qcs6490-audioreach: Modify LPASS
 macros clock settings for audioreach
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-4-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429092430.21477-4-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=6810afea cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=QeD8PW6LcMo_rznnNcoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: d_GU8_1-g2Oz68IBIgKVrnoizHvwfzF3
X-Proofpoint-GUID: d_GU8_1-g2Oz68IBIgKVrnoizHvwfzF3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA4MSBTYWx0ZWRfX9u11vNCf/4nL hkCaX9nkgz6nUbv+eQiopuDacevTHqr/j9YecM4SzdWi9Gk3xsQY5riRPto8Ue0+IgEI8FmXPYC RjGjCTxcRiDValxJ7tOmBSo1dI8iHL2JoONKkv1baU2YVXM4U8JnuFFFLitMCsUE536DrNGoOOt
 OS65yR5luFabXQ51JATv6sX0fUAdFiDyPzx22wqS9gRoT5N5splbk7eyDwQ9dFIQr70dVkUFRhI jkBHzESq3VZ25X0VIbybKlmxCM2U4ZZCnUpnhcOdW2SUmxUbcQYyR4sFBntYgYczl7AVy3QkVnO ftgJGpJClo3nvy/iRbM4MrfY6MPm/3q6sIdHQDmjWeN2KMB30E2djOtuuTi9LBLJkOOKFDdzl8y
 jFvPZOGLsjQSRhlsVKo0R4a1Ok17KUBVSCDD9uOl7+LGbjo2ebr4EJjPqvvszaKtdNau2i6z
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
> Modify and enable WSA, VA, RX and TX lpass macros and lpass_tlmm clock
> settings. For audioreach solution mclk, npl and fsgen clocks are enabled
> through the q6prm clock driver.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> index b11b9eea64c1..f3859d805ea7 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> @@ -11,6 +11,54 @@
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>  
> +&lpass_rx_macro {
> +	/delete-property/ power-domains;
> +	/delete-property/ power-domain-names;
> +	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK  LPASS_CLK_ATTRIBUTE_COUPLE_NO>,

TX -> RX?

[...]

> +&lpass_wsa_macro {
> +	/delete-property/ power-domains;
> +	/delete-property/ power-domain-names;
> +	clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +		 <&q6prmcc LPASS_CLK_ID_TX_CORE_NPL_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,

TX -> WSA?

Konrad

