Return-Path: <linux-arm-msm+bounces-68015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8716FB1D864
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 14:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 347AF625BD4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 12:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1A223A58B;
	Thu,  7 Aug 2025 12:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o13u3Q20"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D972566D1
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 12:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754571454; cv=none; b=FCvQUXRR1A8y+ccjSDoTSNHUO2BgJkQjPH3/8P48jMRalCAB9fNwpc2d4htTVdUCpHADrlVzBKk4ESz6KU2OPRpJ1TaslrPnk3wOdrozy7FlUcJS8qT46OkVghUqP1xTm2EsyWgzPy33GI+fSj/RxzXvobsSX0S4c8cMKGTOaQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754571454; c=relaxed/simple;
	bh=953AY+7dSbH9wHF+PhJo4FVLVHqsLsP5sdwZQ8vgZ6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kRmEJAdD8UXkC5Ii7DvuepbvJq9s4sNsumZ24Cg0ySBeSuBIEhTq4fLRWjVseJf4TO20iNZO8VQCpBE5Tq0TClV8sTtstryOIx3EoqdpU4FYjZ5h4aBIr9RS9tOGH9m8muQKC3lpePLd26wYrYHVbm1/8yoo2zu8Rqe+Gc8sYmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o13u3Q20; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779D3p0007955
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 12:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8OIXeaOB8flxhwBtUk7y6V4kuUsN1FGyAko/S4lculo=; b=o13u3Q20IrjAGfVJ
	YZysEu7KzM9biitSFTyHmsCptr845x9RRaQT5Xhk/b8+4kq/Usl1U0TiulQ5Ku98
	tfXw0VhmEKMyskYC0rLL3+Ko9bNc68zj1EfpOpYuxSy31/aFeXbfN2kYn1yPWoJO
	sVjyGZpkf5wZiUTVchZJh8Pf9LIZ8Z0bAQq4f83im7odXa4cA0YZceByzsd/wFQK
	YJwM5WErKEvdiJAwtDcGIeiJK5iCRTuVoP8TsUi9oK9KJ1NePDumReaz/QjCP776
	kfTSRtNDyq4JgMl0Hl38biK4os3p13A4dGOP54+qchJJJ8IMtPxbaOGvlWYrDt/p
	04wHDQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy6xaku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 12:57:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4aef8afd26bso834451cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 05:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754571451; x=1755176251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8OIXeaOB8flxhwBtUk7y6V4kuUsN1FGyAko/S4lculo=;
        b=WRmYqycadSOHZnomyxGXaLwU7stKLWc8aytWxNEO2+VpVwtxoZbj7FHBYZSpr5Waqf
         dhHM5vLZTgZq/MwXm0zg0FDges2/2+Ty6t4JJu6DBxKXB0fPeW7Vk5KWpTVGgnIwbanv
         o9ypkbWO827m3GE+9ZY9VwNpetITJ8GIh1sAtOZBy0sRvgJNmxPbdgGO7fPJjHrrajGU
         k47hqbD9s759wFwMZuD8X8uoo3YYQCKX2OIDaJelN+cD/YLxxJByayz5EVvNceKofFyN
         fjAfn1vghrCLir0DloHs45qICySJCuiQlnlJnXD3Rzli41VoeNifmBIT3Q+ArGbBhdFR
         E1fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgMbw/BoCyBIKQxtQmK8a5jFxGh2R3qDdH21j2aTlqcGwEey+cF1B0on6Yy2MXF9QOI9mSABd5jk9IvCSr@vger.kernel.org
X-Gm-Message-State: AOJu0YxRbvfrybyQh5FDpTwXe7GlothoAIKktgxisKxAR9tJdkrimtAk
	90iPMBrKuB18TVnyIlVGe6IZhQ15uAQa65QbpYHX2C0iHwGs+b2g593zKrf8/RaMWEb+8ylKNe+
	vutWLFWHqvuCaunCnwlULwwQUICQzBAos62VzKECsLqa3s9VykT/zGyam3LauJHWL+x/Z
X-Gm-Gg: ASbGncsB0y0LF/JbYfdpuHPWYMtnjnc9qwn8A259WQ85hMvQEriVSC3zNk6bzoiqw39
	Nu2r+iTSAcjQWp/9KB1voNcx9fwtE92kCkFC9fDOU2mV2L9jpciqW718L99vMQf/igeTA54wzgo
	0fhndYd3rPUid8x9LWJXx00mQMRWazykn9T7pjiH4BbhFRP8djUPbjFanLawBllKlARhwHTRFGh
	1qYkaNuG0w8U/+eCVaY5HM257bjQjhh/z4I74rZsqltGBe9KqUi8hsBNNWLt56FiW8uj9I1yReo
	O6ns7/YGiqCLRSziBq5BeyCRNY9uVoblLW1gG/0vqX5Bj3Gv5Ivg/H5/kj+543q5+GOs/KmU7I3
	fB0c/hF6qiZBT9D5/Ug==
X-Received: by 2002:ac8:7e83:0:b0:4ab:67a3:ec09 with SMTP id d75a77b69052e-4b0913bb1c0mr48010111cf.6.1754571450470;
        Thu, 07 Aug 2025 05:57:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk/SDii2Ay4cMUIPxE/YCmiA3Zx5HlsYuCta0Bz3NHjAwJALVYuo7dGy/xCJsgW4ItoZmZtg==
X-Received: by 2002:ac8:7e83:0:b0:4ab:67a3:ec09 with SMTP id d75a77b69052e-4b0913bb1c0mr48009871cf.6.1754571449847;
        Thu, 07 Aug 2025 05:57:29 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f245c1sm11833035a12.22.2025.08.07.05.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 05:57:29 -0700 (PDT)
Message-ID: <41a0e236-2637-4a23-b4ad-4c8d87595334@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 14:57:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: ipq5424: Enable cpufreq
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        djakov@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Sricharan Ramabadhran <quic_srichara@quicinc.com>
References: <20250806112807.2726890-1-quic_varada@quicinc.com>
 <20250806112807.2726890-5-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250806112807.2726890-5-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: myomoqfk2Cc5WH1dihaTIdKLvPVIg1Mq
X-Proofpoint-GUID: myomoqfk2Cc5WH1dihaTIdKLvPVIg1Mq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX40mjlU+hezTq
 jS5HNVCypDYwjoPY5eNQQaJMPwlEAAdxg/qjVZaQc2iUdhbKEqzmbVg8Jg65ISGPsMFGJzTUm38
 oLNBV+7DOD8zuLSahv2HU0hCkIcljbdO05FKNjKvFQfku05VoTGGPnmI7tg78GQPOKPlo3v7e0j
 ejKnt/6X1UyQkIz3lunMvUmZEjf6dwb97XRAOxhfgbIcJdxo7HGcD5o+16Ujy5hhuuRe8TKRANJ
 YOlhqYrir7JRAfjiVRB1elGuMXUE2QVyDkDnvZRFMlbCtw5iKZ2YJd8lbj0jInuTxHVLY4BcQ0b
 2miZWMbEY+vsn8k/CBbmboHY7BXG7kE+pq8rpx9zA0T9OLeZS7ZKrwZypqbmbp+mljV2IUtbBUL
 9TPZ8ccm
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=6894a2bc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=vuI4R3Do2uEHNfh2jzQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009

On 8/6/25 1:28 PM, Varadarajan Narayanan wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Add the qfprom, cpu clocks, A53 PLL and cpu-opp-table required for
> CPU clock scaling.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> [ Added interconnect related entries, fix dt-bindings errors ]
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

