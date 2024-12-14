Return-Path: <linux-arm-msm+bounces-42241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9D89F213A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 23:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B51577A0FA7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 22:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F123019CC0A;
	Sat, 14 Dec 2024 22:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ufr9PJ6x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF511AF0BE
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 22:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734215163; cv=none; b=juLld+aS1tv1BhEwgVu1+51YcAKpQlQFrHUl/4ZfUidlKNObtL/A6+d/QpdxZRm7MPyJtjMcsX1djXZyaWc+BPaoPLb9xzEBW6MRQ+OAARBQLKsomk1immjOYHZ94iXIw0pdnFsqq3HoJNI4Hzt3yeTRCXHf87gh+E6PbmFo/Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734215163; c=relaxed/simple;
	bh=8gpA1dHw2n8NArQXqHK+4y2LvNdeJ3FMqOgEQItAtik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qnLBdbyOfCK3bBdN62DrKbPwUdeKpF/eWJRNUPSjG4ThqlqGeMLMRaoxRSa79nTpg+Dduww3+qnZchHfR98s7hseu+REHfPbEN94alb+jfVQqunNDL4cFs9YoUZxqc8VhVWvN6kWdMr0pxJDF/UZqLp0bLudoqRv+mS/4vC8D8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ufr9PJ6x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BEM4DDx008210
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 22:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4cYf+fIp6O0tYi333GxKT8sngxhGUwjhZfc52mhhGiU=; b=Ufr9PJ6xTKSHV3Sc
	Fqaqf8oDU04FYQDH6mv4oLKe0Ai9SZoFhkqZtdnfshmtjYRpnsN3xv8fgzz+1KJu
	Ts/0leJRSYtAJcPNGAvjE7O3c2x9pzCFkHh8PIm3e2zwG+e0hIuBAOf2kJA3lNBz
	+dRYm5bjMmDJPh3NUS5OgqX0cB9a2kHmMwJYRE+cmlHJUpI/7LvXepDf3sJX2RE0
	dF22vREdA9swUW5AFiK8j99Uhy2EdfBLdwd1J357UoQiI+vtpS7N9FUvmASvTLTB
	RtTKgnIaMy0aPHehUX2/EY87NJ09t1XsR7nfSISJ15r2SiV97yJYByk3PiCsC76s
	lj+xeA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43h33u135p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 22:26:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467975f1b53so8169871cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 14:26:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734215160; x=1734819960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4cYf+fIp6O0tYi333GxKT8sngxhGUwjhZfc52mhhGiU=;
        b=LXA2stcEM/Kq28OHzEowKSrhTElF61UPjreg1WK/hvQeskqPgKVa34SIEZN1Kf3i95
         OM/Ye2B0D/go88jIiAVbIaxJOLiO1SaLbbwqMKqkAq6CT0UYilpnbpnbpcMuOOj1pSKg
         RNwTgsP4GaGft0Vsxb9YJwc+IAElWj0RGmF7a7QsuyBMZrvNRkyV6nO47CseJf9v0Grb
         P1KEn7WgL4x/8cBbdX8vHgM0Cu2sNeIWDvgb/Uwi6dC1uc3m69z5nc7RCcZVnxcfSuJx
         7g8ptKhJHaEZkEBNKdW/yBD8t2KOoit/0btjQllSRlkS78PO7u7tCM0JJGODaz6ESN6p
         u/ng==
X-Gm-Message-State: AOJu0Ywx7qV12rqW6fsRqPzUjH5dcQewLPwlN3kEnt8wlJ05Tdeof6wT
	4gaulo5Jc1E5YpgMTxLycFGazD7b2YKbpTVb6Kg0Zi2vgosogxjZrDAtWRw+bjXNy2tl76WLNsX
	wduUmdg00eJdEv5Fm2q9GCYhJMhO/qcuMaLutD5SvUQXO+6DTIy5fdDWpiP5vJxAp
X-Gm-Gg: ASbGncswj+jxeFsYhO7mTJ9kDddq9sv0jVT/p2laI5jrmihN+jZIh61Bpy3rJI5pOqF
	YJFJIONZQlBKSwVQ3fujhYyaWdTNVd4sAKyeOzbUr8WlKN4cfqhTwRN8P+J4450kWZcdBXoQqAX
	VXMSlnUleKTVtHm1xyV4p6mGaWDHl9UmG01MGe5qRxCAixCi4MoiQD3T9Lk3LH9upCnISIf1EM2
	ycE/e554WhLlfZMN2A8Cke835C8bEO6ZLzxDKXH0irK98LSctY6zHYtjCRLRh7KNcbj/UOXgvb7
	c6Euoi/IdzknEQ6Da4ZzLPkW3eaQfhzpxzA=
X-Received: by 2002:a05:622a:606:b0:460:9026:6861 with SMTP id d75a77b69052e-467a578e2cemr51182171cf.9.1734215159811;
        Sat, 14 Dec 2024 14:25:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHy3CQjGTQldVtLkouHU5cCLTpoXg+9TRQXEIp9dtfbaLJ0YpWV2irQdO65sKCWWIcHWP2RfQ==
X-Received: by 2002:a05:622a:606:b0:460:9026:6861 with SMTP id d75a77b69052e-467a578e2cemr51181841cf.9.1734215159274;
        Sat, 14 Dec 2024 14:25:59 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9638ac49sm139824566b.144.2024.12.14.14.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 14:25:58 -0800 (PST)
Message-ID: <3fa6e136-b59f-47d2-9ebd-9040f422d25f@oss.qualcomm.com>
Date: Sat, 14 Dec 2024 23:25:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/8] arm64: dts: qcom: Add initial support for MSM8917
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, iommu@lists.linux.dev,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
References: <20241211-msm8917-v8-0-197acc042036@mainlining.org>
 <20241211-msm8917-v8-6-197acc042036@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241211-msm8917-v8-6-197acc042036@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Qt6Wf_z5dYv4cpcPgL0ELTJH6n8lMnfp
X-Proofpoint-GUID: Qt6Wf_z5dYv4cpcPgL0ELTJH6n8lMnfp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412140185

On 11.12.2024 6:59 PM, Barnabás Czémán wrote:
> From: Otto Pflüger <otto.pflueger@abscue.de>
> 
> Add initial support for MSM8917 SoC.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> [reword commit, rebase, fix schema errors]
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---


> +
> +		cpu0: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x100>;
> +			next-level-cache = <&l2_0>;
> +			enable-method = "psci";
> +			clocks = <&apcs>;
> +			operating-points-v2 = <&cpu_opp_table>;
> +			#cooling-cells = <2>;
> +			power-domains = <&cpu_pd0>;
> +			power-domain-names = "psci";
> +		};
> +
> +		l2_0: l2-cache {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +		};

By "under CPU node", I meant as a subnode ;)

See sm8650.dtsi for reference

[...]

> +
> +			sdc1_default: sdc1-default-state {
> +				clk-pins {
> +					pins = "sdc1_clk";
> +					bias-disable;
> +					drive-strength = <16>;
> +				};
> +				cmd-pins {

Please separate these subnodes with a newline

[...]
> +
> +		apps_iommu: iommu@1e20000 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			#iommu-cells = <1>;
> +			compatible = "qcom,msm8917-iommu", "qcom,msm-iommu-v1";
> +			ranges = <0 0x01e20000 0x20000>;

'compatible' should come first

[...]

> +		intc: interrupt-controller@b000000 {
> +			compatible = "qcom,msm-qgic2";
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			reg = <0x0b000000 0x1000>,
> +			      <0x0b002000 0x1000>;
> +		};

and 'reg' just after it

Otherwise looking fairly good!

Konrad

