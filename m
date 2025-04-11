Return-Path: <linux-arm-msm+bounces-54068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C773CA866EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 22:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 135A38A836C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 20:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D857283C86;
	Fri, 11 Apr 2025 20:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Du9FSdYt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C8828369D
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744402461; cv=none; b=rLWtu2iro15FU3O1ZNy6wGsfbHU1pP0V3N1UNTMZa8bc0oSk4w+5vI8CsDYZObZ5hkdtNqMUvvoWi05cAJCNKVq/PIZ03AxzYV8Sq5XQB7jwtpt+1GWjqsuI6tnSJ8EoYqaNu1+ipwAV0HdMNvKEHKxyxoo40610ii/Vsy2FDnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744402461; c=relaxed/simple;
	bh=aZ5XOR4b/IgaLq9DuiIrp4snw8Hhr6iyzEACFHVcv4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pdkht+ylfpP7ijKoLJWWYTky4QfYK228MPbtq0w1upBECWyyPG/glXHFdaMVnWcg2epz97az21UAyzn6Lp5mrRvvyPT2YbZDLVS4C1enhzCiJh2f3Y1oWWJv14+4K6H6AJHdu4oKMIsJqvv8J7M6WAWl5nuaIlIXprJf4mSmSw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Du9FSdYt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BB8DTP030523
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 20:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nRKMxs4PD+KnoQqGDOySfKgieFf8nDxLnTvx+NwRVVQ=; b=Du9FSdYtPdpmt4Ch
	lBuYniEmpCuSY+/7jBZ9NOKmqihhYF5+LPv3r1DEaMMhU02yctL59fNl5AN8vR7X
	5C8W9JRm9+EmAyk94ny+cFNL5ORhYKwGFhYfUVy5l5Q2mnvXfjvQX8cyUHfeBiyq
	PM/eChF1NUdiS+vc9nLZnmOCnxAjc+kUZrxWM5kIiXGhZnUU02tCyRo74M4r9MNn
	cvk+JOS0NZ3qqipXMjCVOxaQ9H66Mn1rnFt8B5sfuaH2B3lmx8YV5zBdOMDy4rQ1
	iT3MXoYSipYwVXaAs2PMK2pH3BtLGY/qfbYK7uT8YM7/sK2LgMVL+G/NTcE3YB2x
	S/lvaA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd33hue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 20:14:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ece59c3108so4117276d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 13:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744402457; x=1745007257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nRKMxs4PD+KnoQqGDOySfKgieFf8nDxLnTvx+NwRVVQ=;
        b=xMVGecFr3w5iewE/L6sgF82UmSKWytltfM38dfQLPR2ZF1y41oK2GWT/SMS0yWbRV1
         pCIKeBeoMZv8DFKtSzaPFrM+ODd06s0rosXb/M5wOQuBr+dJhfJxEjjeD93e2EZFR+Gu
         1IF2pr9HP2CGio/AAWbAR0PGGf+ZDnT7Flne9C1maSuaAyJCifcqHfeBfaJje/9n1+/4
         LeU3XaBDC/dEvUeTEYXdoPumlafYpcHb6hJXzxqb68g0rfwQX/8fdYPccm2zSheIug8O
         0auLS/KXNewL7QjV8S/V/8DSLLT1rQL/B4Kv0NlKEA2ctOON5xaAonnx6OOgK1QXrXlS
         5IyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPJR22Ah+LjFcfWwXSW/gWN2E5A6Wb9i27kkGYazl4xuDlXdki4Hg5hs/15lRRI/iytRlzkkZX5qpbEM8y@vger.kernel.org
X-Gm-Message-State: AOJu0YzHeWg92A0vKQogbx8/1hQejtV9RYNborYRGU79bCHNhX0OUi/7
	pzCxtmxkSnjrgABQGyT4w2/IT7uWtrD5oMpDo+F9YBdViBe7IpKp/N7l+xWbf1KzT7I6oaRYJrB
	YD+huzlX/B9HbOWufpZ3lBxQqJoOllZ4ATPGmHWeWJLU4Q7r1t9kUs2TxfU7Y1BkC
X-Gm-Gg: ASbGnct2OCJmWbslFgNX+bOqkl4kv0ky4z0EqBESNP5ifdyu10QAFl8Tytgmxqw6m5A
	Iv5WXSlZ88EFNVUDHeXxnJavekSsS4WVT6rW/vxqDKh9L29nVKBoDsErWRohyQs7mMGs4P4Oox4
	HdwrNkE0TCBbowVtxrQHq0zMKXnGKJc9Gm1h8IRtZMW0HkNp+7RczcZAzNluYkz3deMaVoCqTMY
	1TVYkmCNvn44WKDVWdKGIRsYKS+gCRBsOITpbLRmEzHXfj76/QkzNxQnmnL/tqshZwBZEH7rUxV
	sM2+NOoDvtOUpANOXZu2i0B9GXNwgqflrDuV6ArFrjE1L3Gx+tQ2faukkzTsGBIFSQ==
X-Received: by 2002:a05:620a:468a:b0:7c5:6fee:246f with SMTP id af79cd13be357-7c7af0ee0f1mr242774585a.1.1744402457589;
        Fri, 11 Apr 2025 13:14:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwq+5VQLqjQev0co+4uNLsPoLMOr0u0ds72aNYr+2pB2wGb498Fhw3ISm8Ze3I7I0OKlaiMA==
X-Received: by 2002:a05:620a:468a:b0:7c5:6fee:246f with SMTP id af79cd13be357-7c7af0ee0f1mr242772685a.1.1744402457216;
        Fri, 11 Apr 2025 13:14:17 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce7fd1sm486862466b.168.2025.04.11.13.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 13:14:16 -0700 (PDT)
Message-ID: <321ddc86-6ead-4079-8b0b-6527f0badeb1@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 22:14:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] thermal/drivers/cpuidle_cooling: Change the
 registration function
To: Daniel Lezcano <daniel.lezcano@linaro.org>, rui.zhang@intel.com
Cc: lukasz.luba@arm.com, Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Javi Merino <javi.merino@kernel.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        "open list:THERMAL/CPU_COOLING" <linux-pm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Wasim Nazir <quic_wasimn@quicinc.com>
References: <20200429103644.5492-1-daniel.lezcano@linaro.org>
 <20200429103644.5492-3-daniel.lezcano@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20200429103644.5492-3-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RsTRzY4X75LRLBM2O_I7jI2bvgimOFlo
X-Proofpoint-GUID: RsTRzY4X75LRLBM2O_I7jI2bvgimOFlo
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f9781b cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=jWAD08MBTVrP8qBQ8tgA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=790 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110128

On 4/29/20 12:36 PM, Daniel Lezcano wrote:
> Today, there is no user for the cpuidle cooling device. The targetted
> platform is ARM and ARM64.
> 
> The cpuidle and the cpufreq cooling device are based on the device tree.
> 
> As the cpuidle cooling device can have its own configuration depending
> on the platform and the available idle states. The DT node description
> will give the optional properties to set the cooling device up.
> 
> Do no longer rely on the CPU node which is prone to error and will
> lead to a confusion in the DT because the cpufreq cooling device is
> also using it. Let initialize the cpuidle cooling device with the DT
> binding.

[...]


> -int cpuidle_cooling_register(struct cpuidle_driver *drv)
> +void cpuidle_cooling_register(struct cpuidle_driver *drv)
>  {
> -	return cpuidle_of_cooling_register(NULL, drv);
> +	struct device_node *cooling_node;
> +	struct device_node *cpu_node;
> +	int cpu, ret;
> +
> +	for_each_cpu(cpu, drv->cpumask) {
> +
> +		cpu_node = of_cpu_device_node_get(cpu);
> +
> +		cooling_node = of_get_child_by_name(cpu_node, "thermal-idle");
> +
> +		of_node_put(cpu_node);
> +
> +		if (!cooling_node) {
> +			pr_debug("'thermal-idle' node not found for cpu%d\n", cpu);
> +			continue;
> +		}
> +
> +		ret = __cpuidle_cooling_register(cooling_node, drv);
[5 years later, adding some folks & linux-arm-msm]

So this commit changed the driver so that idle injection cooling is
only initialized if the dt configuration is present - should we not
always register it, with some sane defaults?

Konrad

