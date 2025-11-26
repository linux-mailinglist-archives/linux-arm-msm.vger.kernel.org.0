Return-Path: <linux-arm-msm+bounces-83369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D1EC881D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 06:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 731C6353E7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 05:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44A73126BF;
	Wed, 26 Nov 2025 05:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hcFAy0Zo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JIMOTTgC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A916B3126C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 05:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764133376; cv=none; b=g8h+HkEBb+7IjztHUaLkZ35uzZi0WrKaptV4/hD16ar9WxxoYCJnyiJQ1c3WwmrpPANBAbR2ZPhpX6jeVAklzAyHlNYsnF3E+rtPhQNBxaEVVktFrdmbqD47gEJYFq05NFZ73gXzM04ZhuV/sB/BjWuGqrCu0Hsz6gk7zJ+7em4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764133376; c=relaxed/simple;
	bh=R6z+JuNw17GWK2WWqNmceSWXaJ0ZYu0e1e3N7eCHe7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NvOb+L2Ne5/6Z1B8ZPYYq9uZjK268/f2AgIsTOizpCBXTag7cX0M1QYnJxiW3jvEVjT9YBmTSsbuhRaQh3hAzxcI0d/U4qEHUIX1RSAJ5rB9GfHXI0s2OKOSi/R/WYcFDMWTX8DreH9IjBMyiKddu7GF1oEF7z2XSebXmxMn5cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hcFAy0Zo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JIMOTTgC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APGKuR82655379
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 05:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mV/kwgq94/oUz0P92yA7lY/+42yYHAlMsyEagn8bYfI=; b=hcFAy0ZoWQIgqcQs
	TZg8yIrkioJ5Z4LlEaIsi1ikXzxVyA1l6ShH1+u6oZqWAA7OqIwSIUqEz0Fcb2qH
	I7BoSV4c4bNqrJ0adbxQ5bH+3UDoI2OWPUpoXSg9aHgi+QXDN3MN6iYzelnOHrHU
	olvGXJr4fv1Kx0rrYyBC+eoTT9okjF/LFFPHOn88wbav1JV1v0QFHZZmIcGlKFW+
	uL5+rzYvZi86YbwE2+alCY6TPoj0tG26ROw4xu2oBX3DWGvF1HcpysDYAlZ7SkcW
	Av1n0Zr6SncSNJzoF3D1VMgJZbNGshKekLepTZwFypbzSpC+RwbYKuf+oVHFbJL/
	5WP3gQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an9fxu36v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 05:02:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-343e262230eso7281660a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 21:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764133365; x=1764738165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mV/kwgq94/oUz0P92yA7lY/+42yYHAlMsyEagn8bYfI=;
        b=JIMOTTgCMfvkId2va3wFMfVGIdNbdaAmCOqcrdWyi6tS0bhdWnO4WnJaFk15RwsdAT
         1TIGWq9xAPvboEH5seexmWpKqpds8OJNl1/eDCmnSK7qQAVCiQUmSpwO1IOgQXLisWfr
         wJa9tEtGQem2HhIHSBdABUSvlY5M8dwaKSaFSUbt3REomJmfjxwWfym3vTJEzUhd/xbm
         wWG+r5QpSxutCsy304jqFgHN6G6n3RAb0nOb5bu/3BkXrVITGSZXFIaamEJRRogWLEkx
         Ac47D2hXD3co9pLn4I36/gBmviyib6os7tI44ksfEyx0LrM4VD2YNIajy01Csn+nU+o9
         aqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764133365; x=1764738165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mV/kwgq94/oUz0P92yA7lY/+42yYHAlMsyEagn8bYfI=;
        b=UndMHIHpRCchot6t0l08/718dYaA7v+pAkmT+P8aSr9wz1e/QFbb8Rr/Gl62bQ1xz0
         YO4luOmxZdjw8e04q6fubS61XYEgy0QS+o4P6a8yPVAfZ81xSVG+mCjfwp5o4c1eiSQF
         F0gKVVy46z1LueP/LpHCo8jhv889verM9TjG9IYx1IrtDSGXrD2b8oh4+TsfBwX2OXP/
         bNvH2BD2NE678ndVA353DFbJ837SctEx27LBNpNLNrVC43xWb7K0nEeQhv5DsGGyS6LT
         plvx5Tvfe1zHtYU1Rd4aYdmPELt9OPBfYC7W89/P6oLNkqgGHV65jaPsY+z5yggMTvZp
         eMtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhHf/BDYYNJ3vIs1jO0O/OfHKPP/POyhQOuzL4G1ky5TP4IsmVQNnDRTRU0BfFKQz7Nouo6SUe9sL3mAMK@vger.kernel.org
X-Gm-Message-State: AOJu0YwBbjzsB3dnnw86b9ZF6sMnGcTMXH8/Y0OkDcvntpM2emfZw1BG
	zelAlG4BXwiQwAEuebjb8PhsN24YD5qVGPPmNgyjJMTqrqmsUmOlPqS8d209BR8lekBEty1ESlI
	bitdEZ21gkwxFV8g0n0tDjdL6uTUiZjDdgdsMpyP2UfgNXOdKox3/HmS5Wz0yUr83vd4I
X-Gm-Gg: ASbGncsO/HVWletodrXyC8YaoB3hCst/uzU39kw3M9iBLCn/BR4qD0aiSU4eCQ7GVlK
	YhEW40e8vjID7ATgR1Pz05JwvevmYyHWl1+dR2NMHoLspwudx/hAEZxVRBuxjCqUKsJMNvoSBGW
	/+GMJCykDGx6/Z3iwt255MJYo1Y2WP1sovLNeUKVf01qnaigZnCX38lzFjqHy5mvXcBGdnFLykt
	vLVTId0l9IVmFhMKOEl3SSfhl8H6ECPi3qQIyQt6fIL5u11M1hZezHqt6v3N/snwzxF0UWfFaaG
	i/2kRD4pDnDwilruqkiBdudjQheVgko/02VZdPn6iFETx23Mdi9yofVl/32UdE27Sy/X+lg+jW6
	NAeorOSne/+9IG+LqcyIPyDmM/8PjiFT+MHPn5p60aQ==
X-Received: by 2002:a17:90b:1c04:b0:340:dd2c:a3da with SMTP id 98e67ed59e1d1-3475ebe6a55mr4902912a91.8.1764133364912;
        Tue, 25 Nov 2025 21:02:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFD5nE8fwNVpEgMkbfCnBkcSgEl++BprsbU95B/wKtEMLewWrDYFhTsIgaLcK4LEfjE1VLzLg==
X-Received: by 2002:a17:90b:1c04:b0:340:dd2c:a3da with SMTP id 98e67ed59e1d1-3475ebe6a55mr4902869a91.8.1764133364290;
        Tue, 25 Nov 2025 21:02:44 -0800 (PST)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3475ff34831sm1928487a91.5.2025.11.25.21.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 21:02:43 -0800 (PST)
Message-ID: <60487c80-c5ea-4c71-8ba3-e638ae3035a2@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 10:32:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/12] dt-bindings: i2c: Describe SA8255p
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
        quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_arandive@quicinc.com, quic_shazhuss@quicinc.com,
        Nikunj Kela <quic_nkela@quicinc.com>
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
 <20251122050018.283669-8-praveen.talari@oss.qualcomm.com>
 <20251122-rich-imported-buzzard-b7aae7@kuoka>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <20251122-rich-imported-buzzard-b7aae7@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I6tohdgg c=1 sm=1 tr=0 ts=692689f5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=T-be6ljfY82ZG89evtEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAzOCBTYWx0ZWRfX4RY1YTVm8NXt
 Dh4qlrvDLPDG7ADNOHvChG2RIH7U0IG5W6Mn1TnsMgGHVqqbV05z1hYNiQ9adjzhRrDc+xu515d
 tPeriuhuGmOVCXcxAe1DswKlrJGFtgXKTCnmChZf1NACSoE9zBaVIEUZCpZ7EQvq166nKNbGRBL
 fAzCyjVbH1Mjs/7Xo0mXVvzoa1Pxgwtlf3X9EqEL6PpQxBlCeM5of3qU7XS9DB2OQ+tyIvE/xT8
 f4bcwrvfub+h0ib6vW9CmL/3knWyWwhgkSrKD3b4qi7n9CwI53yNm2EBlwl8LL9JGay0x0PGDtf
 FUPzrt/IDiC4Wwg2NuDq8xTwjzTHyO3qapxLKu4jQ==
X-Proofpoint-ORIG-GUID: PTsP3kifoiQbgv_0Vrv2FReVLYcJ3VFQ
X-Proofpoint-GUID: PTsP3kifoiQbgv_0Vrv2FReVLYcJ3VFQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260038

Hi Krzysztof,

On 11/22/2025 5:10 PM, Krzysztof Kozlowski wrote:
> On Sat, Nov 22, 2025 at 10:30:13AM +0530, Praveen Talari wrote:
>> +  dmas:
>> +    maxItems: 2
>> +
>> +  dma-names:
>> +    items:
>> +      - const: tx
>> +      - const: rx
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    minItems: 2
> 
> Drop
> 
>> +    maxItems: 2
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: power
>> +      - const: perf
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - power-domains
>> +
>> +allOf:
> 
> So common SE properties are not applicable? If so explain why in the
> commit msg.
> 
>> +  - $ref: /schemas/i2c/i2c-controller.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    i2c@a90000 {
>> +        compatible = "qcom,sa8255p-geni-i2c";
>> +        reg = <0xa90000 0x4000>;
>> +        interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
>> +        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
>> +        power-domain-names = "power", "perf";
> 
> dmas and dma-names

For this platform (all Auto targets), we primarily use FIFO/CPU_DMA mode 
rather than GSI mode, and these are not defined in the Device Tree file 
as well now. Should we still include the dmas and dma-names properties 
in the example node?

Thanks,
Praveen

> 
> Best regards,
> Krzysztof
> 

