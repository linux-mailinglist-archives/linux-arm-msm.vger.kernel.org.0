Return-Path: <linux-arm-msm+bounces-46766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A65A2A25BCB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3568918834CE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B957205AC4;
	Mon,  3 Feb 2025 14:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kNHl9q2+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01BE1EEF9
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 14:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591576; cv=none; b=mmLY2qxhDhNqMPdVtiUgZfRV2a0K/wQEDHbguBYq7HLK2NZ5wUniXbUImaH1+dPRjBXquhfo7DN94sZZsrZsAV8ef5q3i9sNdG597/0XgiSvyMmq5pS6BioAr186dIYIQl8Bn+h46mVu4Iqns+ek+ynnX7YMdbuoj5vJmLs2rV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591576; c=relaxed/simple;
	bh=f3nhNeQhnqOkT+ZMVNhMI11XyUbk9ojwQ5TtjrtWkXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVGWmZmpcI/l4UOLX7/jWufWbtnK7qTSv8sd29VA2/H71uuJlCv9/cfkI6PEH0Y4CLn6qUtiG0oXs4ttZmvCE1fHbyxHRbsSnPcHZRRxrJRX+bGBlCY3f77T4dHDYN2L3iHCGYAsKCg8SJ/DQheFlCFhob8+eTIvC9nugHhNvrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kNHl9q2+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5135NYEd031401
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Feb 2025 14:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZtNFCZgeL0FWLDNzLfu63fu2KsbwaM5gDoXUO3p8uU=; b=kNHl9q2+5MJEFKfI
	t27DYFOPYhpguZy0evjQ5sPVCVjtNyzSW98Usht0gghVk3yW+j+uVlFc4/z6gQik
	I2+xZNrj37DBpFzZJiD4NX9sNvUDihzF4IUbcCYk0oighf+Z4RQpBvhGAPvV3pK2
	P1x6TYJ9ZS8FoeplQYDVc5QTDRlebVe3MYzoaZTPU4oNzVUxvfVmsC3ZjsufUkcl
	a8IjPGvvLyfaTlGnRceUBg7n3ZY1u/wfa97373q8B4dJ/2rsaB+qzzvfELQ2tvkX
	6VTYUZ8EcVa8Cw0s0qppZz1Ku+gucgSInDR4k5zTBeBA6h1Hbmappb34u7orG63M
	3tuAnw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqm41a21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 14:06:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e19bfc2025so15751556d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 06:06:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591572; x=1739196372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZtNFCZgeL0FWLDNzLfu63fu2KsbwaM5gDoXUO3p8uU=;
        b=nFxFvEsyvQ+oSI39wdMK0OCn4kkviRYseZM2o8/5sm4vK0B+8Zge5lhXLVxQuQNEjP
         0bABLm/qcPp+pJYfdKh/LLsxsbkjFxti48i/bhlYSBtXq1EqS558HbgDU6mDIx8CsORG
         l5X9iLuAxRUYLt0B5txsewDpw2By18tB16jIj0xlpQhjbCRRkjAJZdWFtR1NOG/xvSzl
         dDPoyUCzKKmkAHDZScyLIr/4m01k7xwYB6flum3rkYjxd6+jN1MHCohEX7hQpy1mtA/D
         lGiW28gQHHb+e/cw6HTbMPMnhHTMhyiyTJ2e1TgsO78dByQ/IbPzSO6js3eLKR1pN836
         XqCQ==
X-Gm-Message-State: AOJu0Yxyb3vLVXiSUXY8xo930LKO/24FO96leZH1ceOX5J8SeVRF5ojH
	XjMprnVbim/Fzxo5Wo6qn8Mo0N993LPHrkIQJoqF74sQCo675HXoRvOITHd2oJhDzecyNMSYWA/
	0rirGtLyrMGqV5r4q2zms+lLpA3/6kZaqNWg756mWyocuswtFsHEeTyVWGlsKKUgW
X-Gm-Gg: ASbGncvDWbBgHqJMSXEE3sSLTaxeAYqNftgKh8q1tXwy7lR76AEYAYGrBsqeqoC7ziK
	Ue4fkF13tv3nFzG2RLq4ui1sr7uwmnr/1mFHqZZtTTRo+zNuubBYWtjGlw1/HzmXSPkDRkOPJEe
	mYG7AN3MpK+mDUwY6ZaiSOcRbRoXJkD/0FMbkb9r+XfMJsAsijolVpe5OktRrVs0zY2e9DuS+Mj
	+AOP6OPun55AjBzCyYI0dfY0HA1xI+sb/Ji2H0VPDNSpINanjVy+6OmTDsqnFRXIsSXbRV3+ssk
	KJdn1Z/JS7tKuBscUop0o2MRQGHEQw3I1L9OFb8qj9riU/c4hUOar3YByZo=
X-Received: by 2002:a05:620a:2894:b0:7a9:bf88:7d9a with SMTP id af79cd13be357-7c009b82e2bmr945576385a.10.1738591572549;
        Mon, 03 Feb 2025 06:06:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPDP0qol6PEmtndJ/qVx5GfFuI5eDR2ztN60QRNYMzKfDc3SNz9DsOhMZSkcbvAKF0wFjIyQ==
X-Received: by 2002:a05:620a:2894:b0:7a9:bf88:7d9a with SMTP id af79cd13be357-7c009b82e2bmr945575185a.10.1738591572176;
        Mon, 03 Feb 2025 06:06:12 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e45ccd6dsm757393166b.0.2025.02.03.06.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:06:11 -0800 (PST)
Message-ID: <fe3424ac-2429-429f-a2a8-34b9a7f06b06@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 15:06:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650: add all 8 coresight ETE
 nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250129-topic-sm8650-upstream-add-all-coresight-cpus-v2-1-c62549307e01@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250129-topic-sm8650-upstream-add-all-coresight-cpus-v2-1-c62549307e01@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jw6lBSMDzyAkYTOR8VUTkWx9Y9DdHAiO
X-Proofpoint-ORIG-GUID: jw6lBSMDzyAkYTOR8VUTkWx9Y9DdHAiO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030104

On 29.01.2025 4:08 PM, Neil Armstrong wrote:
> Only CPU0 Embedded Trace Extension (ETE) was added, but there's one
> for all 8 CPUs, so add the missing ones.
> 
> Fixes: 256e6937e48a ("arm64: dts: qcom: sm8650: Add coresight nodes")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v2:
> - fixed the 7/8 cpu wording
> - added the sm8650 prefix
> - add review tag
> - Link to v1: https://lore.kernel.org/r/20250129-topic-sm8650-upstream-add-all-coresight-cpus-v1-1-96996d37df8e@linaro.org
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 163 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 161 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 86684cb9a9325618ddb74458621cf4bbdc1cc0d1..d925d5e2c8182d522dd5b8e1fa0e253f5de2f7a7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -365,7 +365,7 @@ cluster_sleep_1: cluster-sleep-1 {
>  		};
>  	};
>  
> -	ete0 {
> +	ete-0 {
>  		compatible = "arm,embedded-trace-extension";
>  
>  		cpu = <&cpu0>;
> @@ -379,15 +379,174 @@ ete0_out_funnel_ete: endpoint {
>  		};
>  	};
>  
> +	ete-1 {
> +		compatible = "arm,embedded-trace-extension";
> +
> +		cpu = <&cpu1>;
> +
> +		out-ports {
> +			port {
> +				ete1_out_funnel_ete: endpoint {
> +					remote-endpoint = <&funnel_ete_in_ete1>;
> +				};
> +			};
> +		};
> +	};

These bindings are kinda tragic, imagine this on a 128 core chip :/

But alas

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

