Return-Path: <linux-arm-msm+bounces-67674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED0AB1A176
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 14:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36417188DE79
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 12:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB4325B2FE;
	Mon,  4 Aug 2025 12:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqxekJlN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1141C25A63D
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 12:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754310801; cv=none; b=cyuZyx23fjRzqVtRz6OmXc/c8kS9t6t7pPJsxNooxjMG8oyL0VyLvqjc3v7n/qBRMp7Vl9NkaBtPxLSKGSGfyJlSIBMvggqZDe4H34SWzVBxODkDUAjYZGzwHj+YV4CrIzAjM6qEdNdSi4yGu4PYqqdG8FjU2ZBtBuyg1a5zq14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754310801; c=relaxed/simple;
	bh=ANVmw6AeR0GHHCK/HKaHO5w+extSI4H+i3GF9Iz3jdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kl487YNZnH//hj7i/zQKOmdrLN1K82mT8TzZ0yTeTHJWPDGEWILnpIXpvXJThamMqpk1yOp6PbvmfskhNKimYYo1C2UTBEK75t4bn4Bl+iveLS9orkB7Hy4jtAJoUfYRxh3nNvXZ931XIj4KBZfv5ICdwyY1M7EidT5+tVg/UYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WqxekJlN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5749vQ98003913
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 12:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	46HAWgvv2MxgQgdpENwkPzAKGo1621//AEpZFMkCwFU=; b=WqxekJlNtED++Z3q
	iLHSuYwBGbF7pe7KzYohu6uNqSSJYYbYzafcZWS9UQXLPbpqIRg/Tc7xsa26i3zr
	MArzxNX5otzPpYwrdZu0CvGzPCra9Nwghji3mVvVBlfxXtXjL+t55zNZT2TrVavr
	7hkdUuvOfjDPaml7shA/N1BaOvBzIfFD0zB9uKVUHHM37RuJmvR13MOFzPhnGYAT
	Nhkj8XB1hA09ET1Cs+55oeJA6o01LO0mgWTFqIjSxwbp6wqKOd0N9x11cNoRTrti
	X/26e3/xsywbzRjx0lUTi51IKv80JSGs9d8/j+7LSu1NLeO0OeDFzQdsUEcaD6Tq
	oRkp1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ak5a1rvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 12:33:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e33e133f42so93870685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 05:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754310797; x=1754915597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46HAWgvv2MxgQgdpENwkPzAKGo1621//AEpZFMkCwFU=;
        b=L85QwZjeKtHfTs7Ta8F5mJBVyJocrlkcI4GwYST2/5Uo3qYclMUyUDLXQ+hiztrXnk
         QttVTvcpv2IxQeUm8RpJiZUN4HhkOBDuSfUOHthbu3NgG2GBeAlMMF25oLlrLFMoDtmO
         eBPJ7hc1CGYfEnvgEJ/zvwNXsddYYL9QP/7uc/MBuZVjU0Xnn/7RQ1Uv5pzWDwDkUsum
         FJitOQdT6eVqDP4LUuxmsRWtGttmGjqAj2laOOnpLfxRa+TgixgWFiLY7en2jhc7FR72
         CTacLPhi40tsfRDteDLnma5MySsVgqpSDTDEQ/a3Zt8Na1MRll+KUp67A+Eb85JwIDgn
         weEw==
X-Forwarded-Encrypted: i=1; AJvYcCWlm0XSZR8RvJo160qK2o861whwIEJYb0MX5K+fTnWpKerC5NSXfUP6N53E0YbkFV0wCEwL200jf8ng5TUR@vger.kernel.org
X-Gm-Message-State: AOJu0YxVhMYWilRHhhAvw253Ee78u3Hx6DuYmChyCXOu3xTqQvj91aNW
	hCGN2r9yoMKa+FvCwMquhUnFVtWYY5bMQGvyfcff1CkjxflJbOcH/tZX1EGu0Jfp83T3VOL4ucw
	5vVcttRmil/W07Zi8vqo6tpQfQwxuAZtWvG+jsrJXFo15JgE98zd8s6BGEpTEWbp8B/BF
X-Gm-Gg: ASbGncv/IeuHyMBcKutvkMv2B+sm+q9mDjxeyfnqbjiuT0UV7bIQ5z/oz720DAba1tP
	6dLvSgwtOysRED+7hnVuGBFQdev461eJWu5vCsV3Lv7MaofE27vdFbTuxsDCVvfFovJ3Rhw6InF
	ZAHfT7683sRJwp27tng7a7BA9pPbFVtFvMx3LRrqKXFo+eFqtgVS468Lg8Jpn7DG0f3/dnNwQ9K
	jQe9QkZCOZbFwYqKd3eMXaSWHwMpQw6D0agVd2HSnV5pxHDMn2/z7vl110Q9SU4kEz+zj4J+X8W
	1CpaBdSerWfahdEp0smyMq0mB8ba3ZEhuUqT7AMWdbngGMZbeEleA9WzBIxBGXM+o40BpCX441e
	HMevSX9NwwI9vBGji+g==
X-Received: by 2002:a05:620a:6087:b0:7e6:9e1a:1d with SMTP id af79cd13be357-7e69e1a0795mr468467985a.0.1754310796934;
        Mon, 04 Aug 2025 05:33:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIA4r05fZXfrH3ID5bH6u1l2Cc6ps0sG9WuleJWFvPFQHdK+8Dza/BZE8ttrEeY9KjyY/9Qg==
X-Received: by 2002:a05:620a:6087:b0:7e6:9e1a:1d with SMTP id af79cd13be357-7e69e1a0795mr468464085a.0.1754310796438;
        Mon, 04 Aug 2025 05:33:16 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af919e96050sm731035466b.0.2025.08.04.05.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 05:33:15 -0700 (PDT)
Message-ID: <4890c832-3b78-4294-aaba-b62735f7934e@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 14:33:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: ipq5424: Enable cpufreq
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        djakov@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Sricharan Ramabadhran <quic_srichara@quicinc.com>
References: <20250804112041.845135-1-quic_varada@quicinc.com>
 <20250804112041.845135-5-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250804112041.845135-5-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2OCBTYWx0ZWRfX8kkshLTatnIz
 LvFPszN/pLGgZD2aFaq0VSMqMd9GKAxn2Ao374VJulLH1QVSd/4GvCBqhS+/tSmF5DFPoKLqpHj
 0cHWQEP+xp0CIyzomDohSHHGh6q/TobJ5HG+i8iLyI4pG9dZHStNTJVQVZihxaRYkuORl6zCSgX
 YLgzbPTmWpy3IUOdPun+LrG042bxRhKaRaPLMAioKBMIcuKskyvXc1j/sWKnm1uN6dtFR/xxeuk
 XQfGOTkf4rxGFUARtygG7FzFPHzaI/8yMxbgOHQdAewpx3v2lH46TCfxrpy+W70M9WFHLsJtdSF
 EvLcxyslKDUrkv4eNIKau/OoEu8cbHHicom9cM3Md9YrQBvnXgPvEa4/DRoNhD4VCgmeX7rvjrB
 X8V6R2WlTTaizKEOfv67GZNqEi78CJTRyDRc3HqwsYD4aLtIDoC03lc56qHnlWncpLPQ4gt3
X-Proofpoint-GUID: xyU-d7e9xgBRkoDzCm-LmJOJfvH-c38j
X-Authority-Analysis: v=2.4 cv=LP1mQIW9 c=1 sm=1 tr=0 ts=6890a88d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=vuI4R3Do2uEHNfh2jzQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xyU-d7e9xgBRkoDzCm-LmJOJfvH-c38j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040068

On 8/4/25 1:20 PM, Varadarajan Narayanan wrote:
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
> +		opp-816000000 {
> +			opp-hz = /bits/ 64 <816000000>;
> +			opp-microvolt = <1>;

I just noticed this.. I don't think we have CPUs this efficient just yet

Do we know some real values for these?

Konrad

