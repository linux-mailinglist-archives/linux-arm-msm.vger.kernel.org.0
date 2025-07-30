Return-Path: <linux-arm-msm+bounces-67145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A48B160A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 14:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA63816576E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 12:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FC2294A1B;
	Wed, 30 Jul 2025 12:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3GRwrrn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4088639FCE
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753879807; cv=none; b=ekog9m+uCak38zv9I4j7djYsTabqYrxykv0f3d78fprLrYacEYbaO2aDrIQ9OXHJdd9YJGauFY08fhitFi0oHe21a8KvXwdR/b2POEZVjnvRwBcJ0wzLZsB//h0nfKjAvHiRgVP7YusNwe6ZIELAPdOKZQifnKX+P6m2McmA9gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753879807; c=relaxed/simple;
	bh=BpUYlsgB1VKiMf3apeY4LZdFHLhgtdup26V6g6fFdCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=idavXlQvMT/wXQkrlapASxD2suOBUuGLphjXybzeYRnFmJHjdvXR2MqBjOC+FAX7qzShbF1p5rNRf9UNYTGNunO0i5pVvMzL05nS4dpEdD83XzG3EztTmy28OLKPvpzhZGGaJ8oRyYFV/X84473AEdGWtWHhRsot0ZXOYe4Oo5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3GRwrrn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCb976029203
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UpBcco7Rc/8Xs2/JgYINmRGquGxRapaUeGLl6KzOuKs=; b=V3GRwrrnj8w7/48q
	azJAclTeMzjNrYrQ9P0YKiEDCpRgnRrWrnSpeNDsSh0K35XiQuYffGkrA8+k163b
	kRVrP5UgjSrp1L2NIDslENYW0LMzoOJtgtJ0n/NlAe89Bo/jVVUgJ0bjfRUkN/v+
	cP5xeX6XKepNfCHheNgR2m4R45AcnLIbBVAII8X+Wa1Q2f8d7RJ1EPXsGYUkp5WN
	uG2XTGF+70C57/Yvum6qozE/5uF79oWCAPSUdkKGtZPghn5fS5BvHt80aRx8+v+m
	UDgvdYEIvNqwc2KcqtO42S9Nkiu+UCFjn2lnhTtWzTSbj7P49W6FKf9Pn7cuukFk
	XNVlbQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcrby0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 12:50:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab77393308so17902071cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 05:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753879803; x=1754484603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UpBcco7Rc/8Xs2/JgYINmRGquGxRapaUeGLl6KzOuKs=;
        b=DEMjlbPZs8uS87+AYe4gi0FM1WXTw9ZnPu6VJfVFqa/0NkYO9eq5EXolye1nIHkQtb
         hmMIncpa285iz0rx5CKeXAKv8T0FiRhnpJPZl3aepb5tpIxaMzaycW9r5a8cd8VqYBSC
         +3R6lvuzzSD3ks/XMEaQIvWq+c7Bu71P+wiIwOpTvZGpcPpXLCEDBgllO3SK7OEMUwZU
         /NPz4zGYz3oQ2jbBqsXVqPZ1l/wyOt2r0Gb0OJjUw/47VuCJEMLc8SGfj7R2iN5Xn58D
         qVjySIylVRhuIBIl7rOzgP6/6hLguzUd+mfa7rVrn3ZFwBEnr0LpARATWOH7dCCOUlfc
         ztJg==
X-Forwarded-Encrypted: i=1; AJvYcCXqxO++WTydUk+Ux4x4gAHZNJ0zqQutmz7ZESm5Tdej7/alsrgADFAeAKuISeI8GRDTWfQ54quD1kYSYNsD@vger.kernel.org
X-Gm-Message-State: AOJu0YzC14HE1cjWxIQgUx78SFdpW1Nuk+IOJyPrOpJJnzTkatq6cDNE
	3rLH3EBR1rhWLpaS+pLcTeqnPQO+Vk90CKcCPprAPSNMoWyTpy7o7BVKEvC+c+wPJfZ1er1FFpf
	jhXZcSo3m6hZxj4lpF2FZuD0htlriftCQVJEqy9ho+9dFZxkrUJ4gjQTIbcE2bwSU17LF
X-Gm-Gg: ASbGncuZId9yw97RGSZocNo+R+zxCWadGyBOQJuw/IPD1oMrVwakTGPokZSvb59lGlO
	Rll3wP48k2xngxB8kssKb314Ran2SJxMcJv+pBbaeoD3HH35ZhGY20jcUDZgX0ccfn+3vUvDt3Q
	Sn+rbcpRHKc2O6fSRvNhGKVJb1LXfDqmxjWBsc+YI1KENYEispuwKEQnNS0p8k7POu44GBwh2IV
	gnUCPZSNaqI7oKflEWlrUXdELCdqufH220kZNM3cW6Q3x0bdgQl4kC1FzbD/Ye+4X85NZMxODQd
	leW7PanAjR3okOSZdhhN7OgwxSQZjeRgZxZw8OVsACHqqxFlsIRvM6yUO8g5rr2fzCwugFxZXsN
	UIFYC99B74Ur+FyGdAQ==
X-Received: by 2002:a05:620a:2546:b0:7e6:3c48:408e with SMTP id af79cd13be357-7e66eec65e9mr235046085a.0.1753879802899;
        Wed, 30 Jul 2025 05:50:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwdAedMFfC/vSjWnLqys1XKVORwaWYuyYe8ZEXZWxtB9QHRD0jufBhueoA4BhBCTqEig+Glw==
X-Received: by 2002:a05:620a:2546:b0:7e6:3c48:408e with SMTP id af79cd13be357-7e66eec65e9mr235041485a.0.1753879802196;
        Wed, 30 Jul 2025 05:50:02 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635aa42cfsm737413066b.103.2025.07.30.05.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 05:50:01 -0700 (PDT)
Message-ID: <b51305cd-0e4f-49f9-adc1-fbe83b539e98@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 14:49:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: ipq5424: Enable cpufreq
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        djakov@kernel.org, quic_srichara@quicinc.com, quic_mdalam@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250730081316.547796-1-quic_varada@quicinc.com>
 <20250730081316.547796-5-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250730081316.547796-5-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA5MiBTYWx0ZWRfX3ZpFsiP4m2Dp
 lGgxiC03UjfcdQt8jmvJE4NswBkQBDV5C7Y2n0ZZ0VA08A/koz5G+TqjPwNZPBvYdrwS84pIn3x
 0OLHHJ2l32IlG+fVV44IC04SlUbauqvUwR6cDtCeqtJU1j7VnkC4AiH+jORmYnlFj6MBQ+2owHO
 Su33MZaCUJeuXBOwiIkYmzt0mCfI0cdim2e2NPX5of9gHpKc/MtMvKTOAQAUtyWQilJndeT4MdK
 ZGGlHDxfYAd8x7Qq3ubfVicqnRsgf1Tt4S2TLbkzv9CSr5RKrRmsog0vtSVRP0qh8AyL8q7eeWn
 EMQpGEiPnAmZsSvAaabXldj7hdTP7QiHllpqSfQ/FxhQxtMxkdnZ7aP8I78icpQfncqG8Fgqxyn
 awhDB7BX0zZ4ypBdq4bslVTNGRr7pQDwmgAN+P+a3TJs62aLjacjKlkJ9AAX2sCTL7+4aFhj
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=688a14fb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=Ba9YZRSbcvaFTVxKLYEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: PYjd6rO6VlxJemjlXfFHdACCQZv545YO
X-Proofpoint-ORIG-GUID: PYjd6rO6VlxJemjlXfFHdACCQZv545YO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=854 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300092

On 7/30/25 10:13 AM, Varadarajan Narayanan wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Add the qfprom, cpu clocks, A53 PLL and cpu-opp-table required for
> CPU clock scaling.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> [ Added interconnect related entries, fix dt-bindings errors ]
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

[...]

> +	cpu_opp_table: opp-table-cpu {
> +		compatible = "operating-points-v2-kryo-cpu";
> +		opp-shared;
> +		nvmem-cells = <&cpu_speed_bin>;
> +
> +		opp-1416000000 {

These rates seem quite high, are there no lower fstates for idling?

> +			opp-hz = /bits/ 64 <1416000000>;
> +			opp-microvolt = <1>;
> +			opp-supported-hw = <0x3>;
> +			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <984000>;
> +		};
> +
> +		opp-1800000000 {
> +			opp-hz = /bits/ 64 <1800000000>;
> +			opp-microvolt = <2>;
> +			opp-supported-hw = <0x1>;
> +			clock-latency-ns = <200000>;
> +			opp-peak-kBps = <1272000>;
> +		};
> +	};
> +
>  	memory@80000000 {
>  		device_type = "memory";
>  		/* We expect the bootloader to fill in the size */
> @@ -388,6 +428,18 @@ system-cache-controller@800000 {
>  			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		qfprom@a6000 {
> +			compatible = "qcom,ipq5424-qfprom", "qcom,qfprom";
> +			reg = <0x0 0x000a6000 0x0 0x1000>;

The block is a bit bigger

On IPQ platforms, can the OS blow fuses directly without TZ
interference?

> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			cpu_speed_bin: cpu-speed-bin@234 {
> +				reg = <0x234 0x1>;
> +				bits = <0 8>;
> +			};
> +		};
> +
>  		tlmm: pinctrl@1000000 {
>  			compatible = "qcom,ipq5424-tlmm";
>  			reg = <0 0x01000000 0 0x300000>;
> @@ -730,6 +782,15 @@ frame@f42d000 {
>  			};
>  		};
>  
> +		apss_clk: clock@fa80000 {
> +			compatible = "qcom,ipq5424-apss-clk";
> +			reg = <0x0 0x0fa80000 0x0 0x20000>;

Let's make it 0x30_000 to reserve the actual carved out reg space
> +			clocks = <&xo_board>, <&gcc GPLL0>;
> +			clock-names = "xo", "clk_ref";

1 per line would be perfect

Konrad

