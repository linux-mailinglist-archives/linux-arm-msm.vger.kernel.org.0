Return-Path: <linux-arm-msm+bounces-63518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 481CCAF7373
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 14:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 535B51C45F5A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 12:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CD52E4994;
	Thu,  3 Jul 2025 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4UhgkLL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0912E3AFD
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544880; cv=none; b=LrcwZGCClIpgwFQUHJdjLyLhDSsMA1OYGw889lmBzna5okY7y7IYQS6nPlRH66OH+f68Yia+4oZLShFVsVtXs2kc1LK4RyOhKn/LaqWX+yXksTIhs0EzpMuOS5OXc2P921e83aowG7lMPHji0dvA0O2PPT1HQ3GJgCVJGr0wo3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544880; c=relaxed/simple;
	bh=NxTRFXEOSM97xS6sYUrK3OZV1E+9Shcf60A8QqXUvPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HJ586iDFjOSpVP4lnr86bRBzsPMuWmhwPoI6AZ1KNGs1/kKd/9qj/XhPFOmuDzIikP6zGzvBf5bt2f/CQ1WRev4KEMn5R9sFtCLAwQoLDcLFXxetKQzjMHhRK8XwWZmkxo05jfxJUbIj1Y++lka15DeNeYhbjbTDqEy4RVmSO60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4UhgkLL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5638cBZR024817
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Jul 2025 12:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h2x3WpVgowQyzY4em9pyKWoaGXSc06FpOT7YW7pB1lw=; b=g4UhgkLLr1VlwHfN
	wVL7Bj3Q5Nn7x1YdMiQ8oMgKdzy6ldIZ6NRpj2gkV+iNalwLwG7i9fdK4T7vngAn
	wACxt2VbL9ruvTNdep6qvs+C0Y2RwbjWgzrQ6AiDC2aWbgIZgsybjlq5ghkSwJ5D
	ncPDMQpGvB4pn4WB59CTmF7PVflGFuFnyRI7ZvwLMOAb40j3D7WkFBl1+G29gKFD
	F+zBuhoCfuiIioBvCay5n1p9XXk0tRBjKx5We1kWHZLsS5E3pZfoGhqackEMXGYB
	qfTtkbeSZ9DUUKJcdqlTzPmpX9a/b4hg+ZFQjUcGMg6cqePIirVa9NYOa0qqHBJh
	KJ4iMQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9rd3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 12:14:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d097083cc3so202885885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 05:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751544877; x=1752149677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2x3WpVgowQyzY4em9pyKWoaGXSc06FpOT7YW7pB1lw=;
        b=mIVEAsSrd4E2dijfZz2fbtX0IPw3unBMTpKbVbnvzKrasDUw4lgHa9m4vhRSj075Sm
         JxNUGXDq4mix+6FuI/q5XGSsB3cvngy9RmJzS5JlgkzThwH73t2TKqhRrJfGgKwVSvAt
         GoRZPheT3gUmxejqw/7rbstKQ+yRm/rrfhEpaDM2MSJrK+IRhPOwo0Kp57uzLsjyb0Fh
         pJpV00hi2pI3M/9vQZ7+BfF5YNaKHg1D8DEYRquQ68eVyD2wGpoNf5vzQS1Qyt2HuyYa
         wCNGiQ4USAR0nj9X++W2nPiarqRRgqBZOIuxx7Zntp7BH23E2RuvnGuONV8kSPAPaDNU
         K2kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEj9aha+yKwbzN+H01OcgQhladj5Z9vQNbcCjU5F5r6YnVcSDoF/1o4vw/virEO7a+v5FAzHiitHbqpuXK@vger.kernel.org
X-Gm-Message-State: AOJu0YwQAvyzCn5StV+yUtUwQ0/CAK8rIWMv6oppmz9CjmsiIHGlTlsQ
	3YJp7012bvKgbJ91jJ5D6V8zV53ZJK1LkG/0qApqzwSjKPQdxo9MOatTooIB1EasXfgrROPLVgA
	BiWlBU1GfBB3pcRhF/q6QB/Mxu5vE931g4E1l0WZF7eDwWCbVLXI8X9EbyB+7O82DUQlZ
X-Gm-Gg: ASbGncvAC+AJcYdNO4Pb/t5JmjGKk1b/5tX/tskxY5c/gHYmjf4UZOmd0y5ETqk0LE7
	+9hOqmWQzM/kym/K/dA44LZvUSmo1UFDn3yDbg3FQvQo+eJBMGuvxB0g48gobjrqpb3UBf6HFgy
	cADHHuUU9lHWueXXgvdm7F5/BKAEGER7Q7mn/15ldeUVhJcQycwi7R7OL2A3ytRY+YRzGscd1iW
	5dcjNr/AsOXLPltBEQw4haqNf9h9RKslspypAH0e3FeEu1bN0WJtm2TzBzASStaFZIGGfCCh8hP
	q9BjIYQMDGbPAQp3LDlWaZU0/bpgriIf5YtIO6piNl8LnnuZNK3EHgiXSu05/kAb/d0D0UEfg7k
	s2q3oYaZA
X-Received: by 2002:a05:620a:4620:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7d5d3f957abmr99411985a.12.1751544876891;
        Thu, 03 Jul 2025 05:14:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMv5CgId/QhgXJ5gc0O6c/YrTGP1GxnRv/PEaNbJnkJ4hBNjdFtHUDliUBepNzEy+MEM5IEw==
X-Received: by 2002:a05:620a:4620:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7d5d3f957abmr99409185a.12.1751544876461;
        Thu, 03 Jul 2025 05:14:36 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c013b7sm1244061366b.80.2025.07.03.05.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:14:35 -0700 (PDT)
Message-ID: <9217c52e-f0c0-4e7e-a2c2-bfb580c7cb17@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 14:14:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830
 speakers amplifier
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250625082927.31038-1-quic_pkumpatl@quicinc.com>
 <20250625082927.31038-7-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625082927.31038-7-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6866742d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=ZTnHXLMoH8r4M2ZBRPgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -T71n-au6ZBi8aBlcTyTJT5-vQAlnkHC
X-Proofpoint-GUID: -T71n-au6ZBi8aBlcTyTJT5-vQAlnkHC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwMCBTYWx0ZWRfX+sD2E3aNtgAa
 VyIZJ6DqDn+bJCiQkdRN0Tv41cn8svNHBMDzQ3wbrOHTfEGSwzQAtz5bp9jO81DXEXux5yBJOLC
 ngMqtRmJUbvceTM4acQ2iO1msk6npBQzDFygs7jDJgjiZVT6A8XXepRWTce4fxxleXvDD3Ud4N3
 wPXdFGFu8k7u3eGtkzlgJgnmiW3+s6yZ5FMyyCwpAMnntsD5JEC5IqIwbeHYX9C1hJbwqs8qrGG
 LCDxTv0kVE+iQmnwRLYrHWIyrweUzGG0617hjffcP5omv0WZu2Bu0O7J/8oSfyN/dvgYgwfp8fk
 zExhF84uY+S5XalLaahgGOIi9CBppK4+yThciISpF8tqLWClSkU/LWpXPVMdPXHgeCj0iiMYSeM
 L8teDoAAK7m8k0A9Qc8z9Uet4YtLG5G83rrnoyG9Hushh1eg/Tq32E/ZZ5cONwPIE6fwff3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030100



On 25-Jun-25 10:29, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add nodes for WSA8830 speakers amplifier on qcs6490-rb3gen2 board.
> 
> Enable lpass_wsa and lpass_va macros along with pinctrl settings
> for audio.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  .../boot/dts/qcom/qcs6490-audioreach.dtsi     |  6 ++++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 35 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          |  6 ++++
>  3 files changed, 47 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> index 6d3a9e171066..078936237e20 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> @@ -58,6 +58,12 @@ &lpass_va_macro {
>  	clock-names = "mclk",
>  		      "macro",
>  		      "dcodec";
> +
> +	pinctrl-0 = <&lpass_dmic01_clk>, <&lpass_dmic01_data>,
> +		    <&lpass_dmic23_clk>, <&lpass_dmic23_data>;
> +	pinctrl-names = "default";

This can be moved to sc7280.dtsi (and removed from IDP
and chromebook DTs as it's always assigned when VA macro is
enabled - they also make the same changes to the pinmux
properties that you make here) - perhaps in a separate
commit to keep things clear

otherwise, I this looks good as far as I'm concerned

Konrad

