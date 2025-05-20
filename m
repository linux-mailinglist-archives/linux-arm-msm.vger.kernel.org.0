Return-Path: <linux-arm-msm+bounces-58751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A06ABE103
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 18:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F03C93B8686
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 16:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B4A248F46;
	Tue, 20 May 2025 16:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IrPPePlG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C60211497
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 16:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759599; cv=none; b=Fw9TjetcML1MF4impUJooEfu5jOu04ZMEzsBxE4Z9WKXr5SHJWv8msvT5v0qJA7qYNsfWopKXLC71wPSikyaSbt3sHhxrrWMek0182CJts2jQbDYcaTrcw8JOheimgRdhJ8sFK8KsoDBooT+uhMR863GrmuuC4mgLbhuLGJrMZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759599; c=relaxed/simple;
	bh=JYuWzUoX7MLCjcuPF1+Weykm/cVeDwxvXI5zbGYVFj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kbeXvIriPyM0XY2Yyo3UlBpS155f2gfj8r5CJiunESChLowEkmgjmoWSxLDkG4aN8Yx8aRPXTsUeMlWp+fMeiOAEZpt6bAuFxrYCBZqFhXN3bMQBzEeQLwRi/JO7TZH8wxRi2ZgIL88AklDyrVBDTB1Uq1dC71Zchb7uvNUwt3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrPPePlG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGhrVw009577
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 16:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4Ct4wiEefckYsBkgTzgW3m3pXmORx80XleoaYKGlXo=; b=IrPPePlGJ4m7MPEj
	3nC8++uzCgO09nBQDjul26xpFTxt1rA8OFY9yietJ1/aIYsTQ4+MuV302IEP/38J
	F/c+PD1IV85OF911zVUW4o0VqHS110P++m4MFUAl5qYQ4O4n30PbjXRjF4xZZucf
	lReqqMoABJJeTwgJbkmrE+1ZyrPQiIQBYBD0cEJZgDdoYeZo6oDSewe6niG0dsnD
	YtaRU5ml565O6eMwoJoIWNhQUHHft2yNGvVe6ArLeQyqSCB+1BjJin5H6MJcR2T/
	9hg1VRZL6A5I72TqXUgtIjIhjR3z2tM5gglm/s7uPv9q956VrnQXcUwWmkEMAmnR
	F7a49Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0g0p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 16:46:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8b297c78aso11868876d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 09:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747759596; x=1748364396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h4Ct4wiEefckYsBkgTzgW3m3pXmORx80XleoaYKGlXo=;
        b=FAGqqtPolPkOvMC8AZR6j7l3AclD8rs5OHKZewRMs8epBHW4KsdJZFLv3zdKHHM9+4
         PIUt1ODOSFtFEGVQxI2rwsb9cWdVQITj4se/nBdfKmeVRaGiGe1hzQfrXWg/mKxPEhJs
         mxQiaxuFENA98JDEZ7Ag4Wq6D0EERmdfV2GWtctv3BnOnJUNx4Q2yYlLlH/l88mimMoR
         Lwmmrh0LU8BfrR7KANgKrQSaqjl6c+kkBl75LuXKdCGRmjVPWFyvDJrbMbRkYlZYG0rj
         OT8f4taqoNsKFbPK8YuFLF3CySo2FYTavirF77pxdih4d3RUf77GGAkNkdD/PqqRIuuy
         Um6g==
X-Forwarded-Encrypted: i=1; AJvYcCV70augKz0h0AcpepYU+261JBZDTSJpLR/0+q7eQCH6gupIIuUoc808wf5JMGuFuUuSqM0p6kLEDzxSIPur@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/6eYlnFI6n/BOkOC3OWlzifEgnBvTq5liIwyFYcBeLzSZ9Swp
	GGlmLJkZuKStTnXFEl+k7RqJA2+3UNOxEn7r8SmoXVhpZtSB94Iz7LjyVMSjtwvmBCKYKIeNGV3
	FCNesrnVu5hNMDRAvvmij9o+n2PCxd1TvKw0fbbgobrrt8mzye6x5twKKdHxJ9dO+td/Q
X-Gm-Gg: ASbGncvaUvia7m1c0umiqFYenf/I8pZMlsatuLK2LQdO//a2rNcyCfw5H903vFYdXrv
	+Vb+44+F81uY2ywjdZ1k8OGRVHnNug1CelNQNRip0bVoEVqlJFpR9IcDly1onTrpU683pWMJuHI
	iPEGAtH/mW3VpkDI0eFYt2iPlAoO4MLcK8bvb82b5tDM9tJfJ6hemTN7U9xWZLxUeyG2ak1AXeJ
	rokNRPTGM2TPphcl1ZvBZ9S5BHfr0nN1Q+UUfx238d2ymMoIocpdoOWqW96Gry+g1gqcoJ0fouU
	H4ZQ7HdG0+41geEIA7xBns5mYPNOB+PsCUdTSu2U5hfALhVpWixX/1ZJC7ALG9fNSg==
X-Received: by 2002:a05:6214:48d:b0:6f8:af9c:b825 with SMTP id 6a1803df08f44-6f8b0881b2bmr102628196d6.3.1747759596082;
        Tue, 20 May 2025 09:46:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxPXvNsYKjc25TVoJ90cf+E0IoL3/lG1Ga9evmEF3ga3G2iAP22svfPux9pmo+NWaDvNkwbg==
X-Received: by 2002:a05:6214:48d:b0:6f8:af9c:b825 with SMTP id 6a1803df08f44-6f8b0881b2bmr102627996d6.3.1747759595677;
        Tue, 20 May 2025 09:46:35 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm763377166b.69.2025.05.20.09.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 09:46:35 -0700 (PDT)
Message-ID: <f4bd3282-e209-43bc-9889-2a44a41a6194@oss.qualcomm.com>
Date: Tue, 20 May 2025 18:46:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250520062618.2765109-1-quic_pkumpatl@quicinc.com>
 <20250520062618.2765109-6-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250520062618.2765109-6-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3UK9PCNlUIcYH6fwKkLkZ3xwJZb-L3Fv
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682cb1ed cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ftiIbRw9aD-W0CiJHUEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3UK9PCNlUIcYH6fwKkLkZ3xwJZb-L3Fv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzOSBTYWx0ZWRfX5PeRyP9qNcYH
 b92m0u+VpP1XsLNRq/vniaTgICI7Kcn8qyUdYAQs0AXqhT8Tct3aBIPJt0+p4yfyqmvyXz63d4u
 DZUk41KjLRlGQNwRcPPIgGWvV9XM4I0lBNwmQw8HWIpSIvZ2k3F7GJQsuPQiBaFgisxBkroZ6uX
 54GLvdOmPWOHPhBRHvGI6LmGTkU3X9ECCtdz0B7x3TCHH72RjnbRgs68aY/Ng6M3R+orAoMONNF
 o3C59bPMxN1c8vGB+PmbmyuzUFtkXnzzPQsQ/bc9kYxmQtsfFiaHtsrF7Vj25atjJUNAV8fgY5T
 gbBkg5swLTuzswPc+xsHzknP7tx94VOAqXm/f62aDNIdyuv5mTP1R2RQgo/aCk3nlsMYRnVT2UC
 G0pBwM1Zh+MyYTltog81OMiKctNIn2j1m6bAaLD5f8nkWxJCKtF4KkxnN1/yPHTCu0kVS/Wq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=839 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200139

On 5/20/25 8:26 AM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add the sound card node with tested playback over WSA8835 speakers
> and digital on-board mics.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

