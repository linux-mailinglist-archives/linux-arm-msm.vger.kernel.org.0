Return-Path: <linux-arm-msm+bounces-79590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A755C1ED5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 08:45:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 195474014F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 07:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0BF3375C4;
	Thu, 30 Oct 2025 07:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dLiN7lhi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YA5H2Tjj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E3F337BBB
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761810281; cv=none; b=om64CnpN4hpSj7iwZ7B2oBnmp/Y5lYemo0uYZKh19MmnNKS7m4kJAusNucxIPFFSyH8I/drB/d1m/enBP3OjFy1whcyE9+Y5LEGZXfuaRtJki3lS5zHHcBgN0BZS4VJqNS715XpfOjKVp6hnozNfuQzpMsW97F+KBwakbUAPHpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761810281; c=relaxed/simple;
	bh=8tJPcTxT9z4IDaliirHoX8XXZGeflw5rPWBfvBf6BgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sRWmq7xIkj37BCUT6Y/m+xLiuldKFOiqnMTdtbuXwU4KVI7wTgBN4e3+y58LgEv97FnVaTXN3EacCGb6ZZAmhEQM2nKt1T7O1Me2lWY3KEO3WKDY4TqjbDB8Bqr3ZUg/5GnIezw2nnTWbECkq0plo5Ldtf+FpAKt+MVrRvNP50I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dLiN7lhi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YA5H2Tjj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7iLMw1693360
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i7EANkPIY6sJ6MNVVUUWWsaDcMkF831KMsY4DWyH9a0=; b=dLiN7lhiVWqOpJOr
	rI5nRSYGoFkjwr0oHNj5Rf2sE4rHeB5iw4HDQjbvoQGwJp1CS0L4bAhhdJWms1HU
	ClprxVWlmqU8Q2dChW7j4t0ATfvWYE1peabnGRi6ks2kZ2gWaYby/gVGCfpQnl90
	Wm1pEXdRgOre+b+uZw6mpQBhKO25XwcmS8HiuPsqSgjac1UFo0RlJnV8GHdBv3We
	96u/aEalTaag6kOp+vpofqY9k6Nab9cKFQfNAeEZ+a+zmaFoJMGVOSRv/Jw4zA4S
	J8M15aJtizxc568sRBRgjH4uDNPAGRgH5RNJS4Uaav3PJdBCdNfUFRdDGNF0ZvfL
	tMxEog==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3trv1fxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 07:44:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32ee4998c50so578048a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 00:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761810279; x=1762415079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i7EANkPIY6sJ6MNVVUUWWsaDcMkF831KMsY4DWyH9a0=;
        b=YA5H2Tjjg4jCNxh/VzMqd73NJZtGacVNt+kor0WESky0Os3IJiiIxW/RdmozDrda8N
         NmzCwJXbsE7Fwd4GN/OpDgJUqogwlg7NIijaBnf9/s/PaoXjIr+AaTv000X+iXSFV8W3
         sFdqUkZmMFLXCAWerdRigzOvQvvJmhe0ZpjyzqLXZm204p2+XVYp2yRP/ltq2atWaMwc
         sgAEXph6AZF/kf7VzjmqvD6zEvGtofwbYxXqXgL8grWpGdK2DWWzXuqU1WkO2lMW51xy
         1MtKd2h6aiKoqjTFc+MQJZjnRpsf1DzXka/9mobzZzuqdM6C32yIcEOC5KbchC3pAdTn
         hzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761810279; x=1762415079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i7EANkPIY6sJ6MNVVUUWWsaDcMkF831KMsY4DWyH9a0=;
        b=TAL2UTmxfp66/fg3j+4sVkTmfxIsxM3DFuen0E4FTwU6stlZ86bA9RqWUL5mZTNZAD
         Y7289gScGhy/4h3bJj282B79NW+j6qyFWJ0J6ybW4o9TTUyePU7vyXBny2OXTCpC0PnU
         sqmaxzyKSBlHHofxYdvWG04+7EEey3SNbd+Oj14rP2aW06mM4hLLgWRgJ/kfA7QiccxT
         xecx511RE5Cj+FW0aH3ZwgVupAKC9X+H/iah//Ox3LXHFomqzgkGhhh5HDc0CzfP0LEX
         6FSna7OIzv7hYJBd6LyLgY6gX0+J0X69gZK2hH1N2YQJcSlrXMeMNQHS7Gi/rAXX7YEl
         XO1w==
X-Forwarded-Encrypted: i=1; AJvYcCUWYnNbHmPM1Eo72EmagUdQyF5HXNhcZ5SbQJKvx19VL+V6YmQWW3XAzfUX5qXDK0xEtN0NJE7g8wo7HBAz@vger.kernel.org
X-Gm-Message-State: AOJu0YxYuKpb+8Ti3DRM35kMNPD7E42ek+zerlAQxJzKTToXjV1BV1wQ
	ISivUVeRqeiauZX6mNxpaJQEkQFCceIuYRiX255Po3Lu+F8gt8+G1rrDXJEzOH4d3a1bt02sUFZ
	0Ds7PSOt1uSvKKLqkuRDw9JWMR6D3CVJSKDmci8mu+ebC6njBHfMuR7a0YKfRpS5M8DT1
X-Gm-Gg: ASbGnctKo7s5Ly/ZYQYROQG4g0FsLykUZ9I1ZEBOtaJ+3HJdadMfNT3bSxsrQ1rsZVH
	MPRqgxwX8y5rJUahxpEpOGnhCA1kFH/UUmbuwQaQQC0KYPbJS7DyexJnF/RunzM847bEAxRQeDz
	HjNSYpBVZTPuGs9lREHXXxLeV/rYz6sy5IoY2dldS/O47Oni6THGZ52/vjUMOQnnCHIMGRmK0rG
	VRIQz4D8WUZpO8x+fdNFhNPxUg3N+45usQTa6Ap9z+GW0t59eP6BMsYRwrO844ZJK60ey3ByzKL
	F00+a2ZOCSpB9z4/u6Z968HRGH4XvqlJyr8EwHVuI1zv/qiWH4YlCkST8jaU6n6b/snELEoHhZ4
	B5rr54FLrIZNreA02s9bTYwHME4NAsRTOCmvtAcq1OFaVec9jhHVwYOMiBTMfB620XB6K
X-Received: by 2002:a17:90b:288a:b0:32e:7270:94aa with SMTP id 98e67ed59e1d1-3403a2a1f3amr6000449a91.19.1761810278537;
        Thu, 30 Oct 2025 00:44:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8+RjaKPwX93XaghYF7p0OFEzUtX/TgLWbygByweBSTnZbrgOlvjY9WXUf3vek6MQ9KgF6Vg==
X-Received: by 2002:a17:90b:288a:b0:32e:7270:94aa with SMTP id 98e67ed59e1d1-3403a2a1f3amr6000418a91.19.1761810277931;
        Thu, 30 Oct 2025 00:44:37 -0700 (PDT)
Received: from [10.133.33.37] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340509e940bsm1554547a91.17.2025.10.30.00.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 00:44:37 -0700 (PDT)
Message-ID: <beaa89d2-c8b1-4c3e-8e04-22caf753570a@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 15:44:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] dt-bindings: remoteproc: qcom,pas: Document pas
 for SoCCP on Kaanapali and Glymur platforms
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
 <20251029-knp-remoteproc-v2-3-6c81993b52ea@oss.qualcomm.com>
 <20251029132212.GA662078-robh@kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20251029132212.GA662078-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DC614rx-StRd85NvtkFX9Bg72OQWT77j
X-Authority-Analysis: v=2.4 cv=D+ZK6/Rj c=1 sm=1 tr=0 ts=69031767 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=-wIiT4SIM-LFa6w3TMwA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: DC614rx-StRd85NvtkFX9Bg72OQWT77j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA2MiBTYWx0ZWRfX6E5+R8kJ6Vpv
 NQUuBvrxYVn03liDT/5+jBZT7VJoHhU71iuHlpR6DDEojhDYLi6QjynAhK6zjmzPfk7slkUQx9x
 e9KSaU3QkEUDLmDlOQcBiReLMBirW1VydP4EcO3wN8VNZOd7VB/0lL47/gGoRNi+ifNmG093PHh
 enNt40X/kLlQWsfz8DH+c9SnvZ+M9dlUKDZVCFZpLsH8BpjS8mX1o5HRcXXeatdC/lJqzva1igq
 qQhPgKQ27Ebk0nZhPwufVemfmicrPXbh4cGfd43mlHAzLE5ueRbc0rMy8IIQDbjk22aXf55mmTj
 7uTEyduYhBMORIEqIczUcQsDnpFjxOd6DAMms+zKL30BPgN8q9/Q/IYAl00P7bD50CGzDAKFk1j
 f2k+/tVvRd05RLZ46XCPOrxLYorlyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300062



On 10/29/2025 9:22 PM, Rob Herring wrote:
> On Wed, Oct 29, 2025 at 01:05:41AM -0700, Jingyi Wang wrote:
>> Document the component used to boot SoCCP on Kaanapali SoC and add
>> compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
>> the "qcom,smem-states" and "qcom,smem-state-names" properties and
>> add conditions for the "interrupts" and "interrupt-names" properties
>> in the pas-common.
>>
>> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>  .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 134 +++++++++++++++++++++
>>  .../bindings/remoteproc/qcom,pas-common.yaml       |  83 +++++++++----
>>  2 files changed, 194 insertions(+), 23 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
>> new file mode 100644
>> index 000000000000..6b53121eede1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
>> @@ -0,0 +1,134 @@
>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/remoteproc/qcom,kaanapali-soccp-pas.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Kaanapali SoCCP Peripheral Authentication Service
>> +
>> +maintainers:
>> +  - Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> +
>> +description:
>> +  The SoC Control Processor (SoCCP) is small RISC-V MCU that controls USB
>> +  Type-C, battery charging and various other functions on Qualcomm SoCs, somewhat
>> +  analogous to traditional PC Embedded Controllers. This document describes
>> +  the Peripheral Authentication Service loads and boots firmware for SoCCP.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,glymur-soccp-pas
>> +          - const: qcom,kaanapali-soccp-pas
>> +      - enum:
>> +          - qcom,kaanapali-soccp-pas
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: XO clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xo
>> +
>> +  power-domains:
>> +    items:
>> +      - description: CX power domain
>> +      - description: MX power domain
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: cx
>> +      - const: mx
>> +
>> +  firmware-name:
>> +    $ref: /schemas/types.yaml#/definitions/string-array
> 
> Already has a type. Drop.
> 

well noted

>> +    items:
>> +      - description: Firmware name of the Hexagon core
>> +      - description: Firmware name of the Hexagon Devicetree
>> +
>> +  memory-region:
>> +    items:
>> +      - description: Memory region for main Firmware authentication
>> +      - description: Memory region for Devicetree Firmware authentication
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - memory-region
>> +  - power-domains
>> +  - power-domain-names
>> +
>> +allOf:
>> +  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>> +
>> +    remoteproc@d00000 {
>> +        compatible = "qcom,kaanapali-soccp-pas";
>> +        reg = <0x00d00000 0x200000>;
>> +
>> +        clocks = <&rpmhcc RPMH_CXO_CLK>;
>> +        clock-names = "xo";
>> +
>> +        interrupts-extended = <&intc GIC_SPI 167 IRQ_TYPE_EDGE_RISING>,
>> +                              <&soccp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
>> +                              <&soccp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
>> +                              <&soccp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
>> +                              <&soccp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
>> +                              <&soccp_smp2p_in 9 IRQ_TYPE_EDGE_RISING>,
>> +                              <&soccp_smp2p_in 10 IRQ_TYPE_EDGE_RISING>;
>> +        interrupt-names = "wdog",
>> +                          "fatal",
>> +                          "ready",
>> +                          "handover",
>> +                          "stop-ack",
>> +                          "pong",
>> +                          "wake-ack";
>> +
>> +        memory-region = <&soccp_mem>,
>> +                        <&soccp_dtb_mem_mem>;
>> +
>> +        firmware-name = "qcom/kaanapali/soccp.mbn",
>> +                        "qcom/kaanapali/soccp_dtb.mbn";
>> +
>> +        power-domains = <&rpmhpd RPMHPD_CX>,
>> +                        <&rpmhpd RPMHPD_MX>;
>> +        power-domain-names = "cx",
>> +                             "mx";
>> +
>> +        qcom,smem-states = <&soccp_smp2p_out 0>,
>> +                           <&soccp_smp2p_out 10>,
>> +                           <&soccp_smp2p_out 9>,
>> +                           <&soccp_smp2p_out 8>;
>> +        qcom,smem-state-names = "stop",
>> +                                "wakeup",
>> +                                "sleep",
>> +                                "ping";
>> +
>> +        glink-edge {
>> +            interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
>> +                                         IPCC_MPROC_SIGNAL_GLINK_QMP
>> +                                         IRQ_TYPE_EDGE_RISING>;
>> +            mboxes = <&ipcc IPCC_MPROC_SOCCP
>> +                            IPCC_MPROC_SIGNAL_GLINK_QMP>;
>> +
>> +            label = "soccp";
>> +            qcom,remote-pid = <19>;
>> +
>> +            /* ... */
>> +        };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index 63a82e7a8bf8..f81d088c2bad 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> @@ -24,26 +24,6 @@ properties:
>>    interconnects:
>>      maxItems: 1
>>  
>> -  interrupts:
>> -    minItems: 5
>> -    items:
>> -      - description: Watchdog interrupt
>> -      - description: Fatal interrupt
>> -      - description: Ready interrupt
>> -      - description: Handover interrupt
>> -      - description: Stop acknowledge interrupt
>> -      - description: Shutdown acknowledge interrupt
>> -
>> -  interrupt-names:
>> -    minItems: 5
>> -    items:
>> -      - const: wdog
>> -      - const: fatal
>> -      - const: ready
>> -      - const: handover
>> -      - const: stop-ack
>> -      - const: shutdown-ack
>> -
>>    power-domains:
>>      minItems: 1
>>      maxItems: 3
>> @@ -55,13 +35,21 @@ properties:
>>    qcom,smem-states:
>>      $ref: /schemas/types.yaml#/definitions/phandle-array
>>      description: States used by the AP to signal the Hexagon core
>> +    minItems: 1
>>      items:
>> -      - description: Stop the modem
>> +      - description: Stop the remoteproc
>> +      - description: Wake up the remoteproc
>> +      - description: Make the remoteproc sleep
>> +      - description: Ping the remoteproc
>>  
>>    qcom,smem-state-names:
>>      description: The names of the state bits used for SMP2P output
>> +    minItems: 1
>>      items:
>>        - const: stop
>> +      - const: wakeup
>> +      - const: sleep
>> +      - const: ping
>>  
>>    smd-edge:
>>      $ref: /schemas/remoteproc/qcom,smd-edge.yaml#
>> @@ -80,9 +68,58 @@ properties:
>>  required:
>>    - clocks
>>    - clock-names
>> -  - interrupts
>> -  - interrupt-names
>>    - qcom,smem-states
>>    - qcom,smem-state-names
>>  
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,kaanapali-soccp-pas
> 
> The point of common schemas is to not have if/then/else schemas. If 
> interrupts is now variable, then it is no longer common and should be 
> moved out of the common schema. Or just have the widest constraints that 
> covers all cases ({minItems: 5, maxItems: 7}).
> 
> 

Thanks for clarify, if we use the comman schema, we need to change the
constraint from "const" to "enum" like:

  interrupts:
    minItems: 5
    items:
      - description: Watchdog interrupt
      - description: Fatal interrupt
      - description: Ready interrupt
      - description: Handover interrupt
      - description: Stop acknowledge interrupt
      - description: Shutdown acknowledge interrupt
      - description: Pong interrupt
      - description: Wake acknowledge interrupt

(define "maxItems: 7" will cause err:   
hint: "maxItems" is not needed with an "items" list)

  interrupt-names:
    minItems: 5
    maxItems: 7
    items:
      enum:
        - wdog
        - fatal
        - ready
        - handover
        - stop-ack
        - shutdown-ack
        - pong
        - wake-ack

is this okay?

Thanks,
Jingyi

>> +    then:
>> +      properties:
>> +        interrupts:
>> +          items:
>> +            - description: Watchdog interrupt
>> +            - description: Fatal interrupt
>> +            - description: Ready interrupt
>> +            - description: Handover interrupt
>> +            - description: Stop acknowledge interrupt
>> +            - description: Pong interrupt
>> +            - description: Wake acknowledge interrupt
>> +
>> +        interrupt-names:
>> +          items:
>> +            - const: wdog
>> +            - const: fatal
>> +            - const: ready
>> +            - const: handover
>> +            - const: stop-ack
>> +            - const: pong
>> +            - const: wake-ack
>> +
>> +    else:
>> +      properties:
>> +        interrupts:
>> +          minItems: 5
>> +          items:
>> +            - description: Watchdog interrupt
>> +            - description: Fatal interrupt
>> +            - description: Ready interrupt
>> +            - description: Handover interrupt
>> +            - description: Stop acknowledge interrupt
>> +            - description: Shutdown acknowledge interrupt
>> +
>> +        interrupt-names:
>> +          minItems: 5
>> +          items:
>> +            - const: wdog
>> +            - const: fatal
>> +            - const: ready
>> +            - const: handover
>> +            - const: stop-ack
>> +            - const: shutdown-ack
>> +
>>  additionalProperties: true
>>
>> -- 
>> 2.25.1
>>


