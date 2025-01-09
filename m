Return-Path: <linux-arm-msm+bounces-44662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BD0A07FCF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 19:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A8E6188B44D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 18:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65181A0712;
	Thu,  9 Jan 2025 18:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZlydE8GI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEA319A297
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 18:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736447415; cv=none; b=gK1gZtAEtE3a+//JfB8IdYoLyTOL0RgBfeQdhxGZfqlSWHWNMBbDjtJTdJCA3O/a5vnc/vIFBaeLLdkvzhPosZ12J1Bs3zWG3UjRAK7z9KFLykrjp6LY9TaqArK0g5OjglwzEDADM8DKeFUZq7vbHVDXS8RFiZlm5i/TuwATD9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736447415; c=relaxed/simple;
	bh=+bOeBnMux1aKyHiwqipqrY906xUkVjq+52Y9xTB8kG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RH6Z8C1vvLTfF7CDS0vL2/Tj5fbaxXqLvJCA4L8AkRdHUzJKKD2lXRUwGsxGz8e3vPiirUYnxvpbTW09oENdpYibHEtHw50StFIAmsjRMeL8EYhEiDw4EHT+HC7QjG00sTDPAv53x0VdWAlhriqobY1leUBFz8yMVIQ1sT3ncsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZlydE8GI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509D7ptf010229
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jan 2025 18:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Az4FrLJJLkJnOLuo1NG40YkWnp7xeX9Jd4RxWaboHcM=; b=ZlydE8GIqFTKxWEr
	vKnoP9bElJithiKlctVM5cDaxzBfzQHamAmlVippIIZFy5aZ8qpWH1Gs8B8735Ue
	Ot6SyFA7APCiu5x6xQGnP0jwqky7DxBZXnhrnlu+IkRi6DdL7wPebe1unrjDvwpa
	Na0+yu/JWtUQn8TTazadHXPPPdkNy9I12JpAl4UVSGMSonWHzFCxO1sg9gbRb2oY
	58ILZHx5eUmYp0WFEx7aGQzQb9FeQorYMUnahFUiRG/0TmRrfj7/i98ucXEQBEAX
	vGlQoq7LgLNaRxK/8mSmYYDQYzawd/sfPj+FQNf4Tid9xTAeH2NYAb62UxXkvMyY
	bkkG4g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442f2krs2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 18:30:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467bb3eea80so445781cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 10:30:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736447411; x=1737052211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Az4FrLJJLkJnOLuo1NG40YkWnp7xeX9Jd4RxWaboHcM=;
        b=PrOJRof4RPco11eRxc9UIFWk6Hj4JpbZTF4RmhzkL41qrKrfW0rUZPbn7+whZfrmc6
         OHaLS0/Cdg9dKKdqtIGUQMLvkAXWzY1JPr2O8SYBgkDQi8IWFz3q6D2L0akXx06SdT5R
         E86RBcoYi/CfVl6islaZw9JGI0JxoW2gONlXwqIyuCX2OkSjTc9KrUXdojzcCBSEKO+k
         LExg/0Uoep+AX49Xz2VzVqbYjxJ2OaQo/18+l83kjBXdfqr15bt0ndfqFFdpRVmkwKNU
         rqYB1dg463pI4yi6eWCfEke6FYiT+m4ff319dW9FpJH8AY5dXmDiRemNOAMuE1uz+s3J
         ImAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMnjJFn0nUxqTFh3Bcgs0Ku+gmoKVlbB14TnFPY5sxpiESOiPOwYOlyiT7ix0QnNl6ScTZThB+k7QY3qjE@vger.kernel.org
X-Gm-Message-State: AOJu0YyMI8dZO7tYthnw0XQfirCvzPR/CBtYkrvnJtk+OynRPTmJsYQa
	23aeHoeY7pKUq3t6K6ovd+XfJLf5Q6xbghL3nLWG3DMTw7Imv6121eMmFbKnGN5Ii8LtDJZRGhC
	SziJ3chjygWai0cUPm2ZdQQQLtH2WbrebrSqyp5n/DfNHW3vnAMAby3A0TuQiPiScV4fLNFdz
X-Gm-Gg: ASbGncthqSdDL5wbPd+eyoMXN76K/CCAC9HCobobdN0ZNDGbAvAx7PizNtnmfUH4LAE
	KbCsyHQXgAKjk3alkAHb1vfPIgEDSL45PunSw7K+/Y5YnoVcOgfAMhj7LgPzWNvE4nnRIlErT+q
	3XsWGtnxRRDyPqFLqn8i3fuNvdSLexlIvv3471U4BqbutILP6C0u5d2/GeNHIFw9s4hl5PloUzE
	KYbJkLwz4ZEP0508lABpzKufxJ+0v74kBhNZ1f7DvQjaD1Ibm/MYdsLzGZAMdQ0t4DAWvUteISE
	E3ZY8B1mTtEPaXHFII2YXOHFzBUEIs9GbL8=
X-Received: by 2002:a05:622a:4c7:b0:467:5b1f:4060 with SMTP id d75a77b69052e-46c710a9580mr50098481cf.7.1736447411225;
        Thu, 09 Jan 2025 10:30:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaxZkwsOvEfVvmB+//TCqef+XaWWDJlkByRuOVeg9Iz8MpV6l6e9RzIhhfXg3Gr2O3fy/+hw==
X-Received: by 2002:a05:622a:4c7:b0:467:5b1f:4060 with SMTP id d75a77b69052e-46c710a9580mr50098171cf.7.1736447410708;
        Thu, 09 Jan 2025 10:30:10 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9563b32sm93430066b.122.2025.01.09.10.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 10:30:10 -0800 (PST)
Message-ID: <549d15ae-34db-497c-89d7-c9b9c18d8681@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 19:30:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: add missing cache node for cpu1
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250109-topic-sm8650-cpu1-missing-cache-v1-1-0e85148a48a8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250109-topic-sm8650-cpu1-missing-cache-v1-1-0e85148a48a8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GgNfVHiLJ-TnOnWujA82FKBlxwLKri2F
X-Proofpoint-ORIG-GUID: GgNfVHiLJ-TnOnWujA82FKBlxwLKri2F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090146

On 9.01.2025 4:24 PM, Neil Armstrong wrote:
> Add the missing l2-cache node for the cpu1
> 
> Fixes: 20eb2057b3e4 ("arm64: dts: qcom: sm8650: change labels to lower-case")
> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

subject: missing `sm8650:`

>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 86684cb9a9325618ddb74458621cf4bbdc1cc0d1..832f3a2c400e8348847bc24b27397e2a0dc08db8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -119,6 +119,13 @@ cpu1: cpu@100 {
>  			qcom,freq-domain = <&cpufreq_hw 0>;
>  
>  			#cooling-cells = <2>;
> +
> +			l2_100: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-unified;
> +				next-level-cache = <&l3_0>;
> +			};
>  		};

You likely wanted to hook up this new node to CPU1 as well.

Reading some Arm docs [1], it seems like with A520 specifically, both shared
and unique cache slices are permitted, depending on whether they're
implemented as single- or dual-core complexes (not to be confused with
multi-threading)

[2] suggests CA720s always have their own cache pools

In 8650's case, the slowest cluster has a shared L2 cache, whereas cores 2-7
have their own pools, so this patch is incorrect.

Konrad

[1] https://developer.arm.com/documentation/102517/0004/The-Cortex-A520--core/Cortex-A520--core-configuration-options
[2] https://developer.arm.com/documentation/102530/0001/L2-memory-system

