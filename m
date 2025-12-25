Return-Path: <linux-arm-msm+bounces-86611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 268AACDD5F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 07:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9934300AB04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 06:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBDF92D9798;
	Thu, 25 Dec 2025 06:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CY9CkMrV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JOayT+Ah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EDD2D9499
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 06:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766644127; cv=none; b=ltRFz5Q3NAadta7qRKC+PL6nEIM49LYMRI0dC5TUwZRJ8T5eXw+qRc6r0mXoDhJWSQP5qcLd6VFR3skrFzLdUBLyPvxWabsaD4VXedz7eWcjLrTSkhQdYTgIqzwFNdpZ7HVdQe1ORRecqi4CApL9LbeIq/SXw/7K2AdLAuIdWSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766644127; c=relaxed/simple;
	bh=Ur7SnQIJSASWBdZksx41yHoSOGr3iS9s+l3j8A/keAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VkyviK5Mk3KQzcH2twDitAmNTK1Vdky7wt4dsoDb1p0mHR1ZTig3aYdvFLzRPoRnaZqiVAgfzNU2bnbP6p16xKedcwtoddn6RjbocM/TCxQr6NPiau2j+wCNKEwCBx42RhHN6n+HadLY0FlpHtipL40gNLIL3ry3yl94GebOj9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CY9CkMrV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOayT+Ah; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOIhDx71429476
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 06:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+L36TQdaYvG5NZA7PWJObkpQ1NZJPN35UUoghloEMWo=; b=CY9CkMrVBrJjATGB
	EY07dhZWXj1xTWafccrY8WBrB///JnACfVz+DyctHdV3HEHcmkl0h+7fGabGaFJP
	0cLCRdyXc0mh9c0eIalou5wT/kVE8VIQsNTid2mTjKeGmAeejPcW6TJThYRDPDr1
	Xa6KcoNLjWLA/kcFcStThxAFmPaJG21i/PxN5/vVy+erzNXQw/IqbDojr21UDv0X
	7oI4poxkcznni6IswIgdkhdOz7MF3r3A2sFp0yHgl3IneA7VYMhneV1zGXC9HcMg
	9m+IzJ3Tg2e4Xq2+WM+ObRdWIi44vLXZmCkqWuuBCIOTlyiwOBGtr7xy/pA+Tdtg
	m+/AZA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8hwe1eaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 06:28:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0bb1192cbso129822795ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 22:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766644124; x=1767248924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+L36TQdaYvG5NZA7PWJObkpQ1NZJPN35UUoghloEMWo=;
        b=JOayT+Ahqhk/xGPalLM63AhpPj4BMBgq4tdIGSyo6bT3V2fTpznhEX4FN75s57rhRc
         h+OlErqXazmaShkbEtwhjfn6obbPmXJqjsbwIIdqSpB4mkMvEkdvBG6PimwUkzT32w3+
         rDlEuiW/RKRy3byDZwf24oHpZSVOBVKF1Z2QqlH+81bWNwWfyjMH/62faCErnf2C9X6/
         59Lf9KoovUfUtnt/s1PZ1cza4OXR7xbtO7IEzY3LtuJZcOAJL9y9IiHul+j9akDU8tGb
         WEJPbu0mofOJ4frl3iPBqsjId9dm0manePJBiiE0UjuYqyt3i6xXJpKACckZ2ZY2ekIE
         VlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766644124; x=1767248924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+L36TQdaYvG5NZA7PWJObkpQ1NZJPN35UUoghloEMWo=;
        b=A6UrawkwyPab6QglTZp2BU9YZ7+c6NeLCudvdIzWCIoOG2BoCGWo4UtN7uRoHWSomd
         ZM8MncDNkjrZvntBdfcbyTmkNFycBd1Z06f/as2wzCEwYkObamQvKVlDHPZ4Lxsvny4b
         XWXQ1+efZmb8aa9H11x1MzrtfKx+kjV0hwqoJPJP05xZC7qcY/0jdzv3k/9NPTzgUak9
         yIr8tBvOQPyWBQT/LZw4SInucC6VPoz5cC/Fr+sFAmQETVlKfCcYe1nvMGsWPL5ngnOP
         bojiRKXB0bqhPiIpu/Q4mqul+kXvYUf2V4XH/YGqLfFP+/LTPiuedwfRRMsFokG3ddl3
         BlfA==
X-Forwarded-Encrypted: i=1; AJvYcCWukk3dkuZaxiaC89b6iVMMsAQ4MgluV0ziGpeNxr8hwPjFO4UVldgZoQ+7F1G9UCywIZwqz4mLIdj0yaVE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzz9K6ekHD2PiWmC9Yq+1Fbz55+QzSF0SNvACNMQdutU/hMksL
	e2Lg94UQGej5AYEf0zYtGnr+szBJib1mW9yAczFkQ+37zWZq6zko1KCaUukLmMTefNj0LRlLIJ2
	UJTMtrFrPnIxdg+IPIeCbfLDAOL8r1VhUonF/gW5I27d5bUi0G1cdLHPPqKQp5hy+HTlK/Tv1iq
	rN
X-Gm-Gg: AY/fxX7q+L2lE8slZW3dCDezTxS5jUrOj3Nsdb0GzbH0V2EXm8ZbxtknAbJWzUYoAWn
	sB2pYDl2Bs+0hghtfIq62R0jXBOPW4J2+Xsa9gmvYfmT63vUIVAS9hKa/aR3WA10XMeBw4jQTK+
	Blt+xSnmAYOex87C+YgAEr+sY86D3ddc11hsrmTaVDMfY4WylfN7flsakBxeix97Lp1ttDmnZ4K
	7PZchncoIt1SqyYpuFlh4T5MNE+c0Cqgx8kqUzwbhVGVK9okBQWq93cJ/yknq6/hFaGUhbVcsOo
	MvJ+8wQnIMXvd0bLqIkqczSopyAzK96dFkd4P6nfQocLb6ry0u+psXkppzaUMKakKLTcjK9+kww
	9Yp9VOHREHRq0AbU7g7ApUUafT+YEjPgEEthRUKO1bDyZrxlA6PLbO30sDPQp6XXIBZ+Z9d5D//
	E=
X-Received: by 2002:a17:902:c403:b0:297:f527:a38f with SMTP id d9443c01a7336-2a2f2231764mr203724035ad.18.1766644124454;
        Wed, 24 Dec 2025 22:28:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHG0UvxEYhyR8hnGhLzCb3EHJqm+ZgPrd482GH9b3/wTEjNP6sjA3YoUbut5JctCdz7MQ7cA==
X-Received: by 2002:a17:902:c403:b0:297:f527:a38f with SMTP id d9443c01a7336-2a2f2231764mr203723805ad.18.1766644123964;
        Wed, 24 Dec 2025 22:28:43 -0800 (PST)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c820b8sm169959365ad.23.2025.12.24.22.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 22:28:43 -0800 (PST)
Message-ID: <ab7d3026-4172-4f8c-942e-e46d984d5f21@oss.qualcomm.com>
Date: Thu, 25 Dec 2025 14:28:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/7] dt-bindings: arm: Add support for Qualcomm TGU
 trace
To: Songwei Chai <songwei.chai@oss.qualcomm.com>, andersson@kernel.org,
        alexander.shishkin@linux.intel.com, mike.leach@linaro.org,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        Rob Herring <robh@kernel.org>
References: <20251219065902.2296896-1-songwei.chai@oss.qualcomm.com>
 <20251219065902.2296896-2-songwei.chai@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251219065902.2296896-2-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDA1OSBTYWx0ZWRfXyLxLFgTqMv0R
 sL2KifwdfTLM4wSGKLabnBWBuv+U3Gc/f91p7TPTty3Ecnr1copyXPrmxAT96TsOHz1QLRyo7VL
 L0DR2QfvEGqGhRZ/QLLEEp3tIQtX/MlSAbfLP47OavOJPtQX9ZIm2QlN0RbGpj2vD2SVkOGheZt
 47b2kYUfUNyG3FI4GhFZqhAXaSmz/4ZFynHnCj9DSIB3qfOB6t2d8zOqhd3PLWqyU4+fQ/gMr2Q
 M6/1gOYnNwNXTJ9ppnQUKL9yLojQ+oRYeNbfuY250nPhITW4rkvDHh0zUiyLu9yB2vqAugBHrY5
 BXKvEIw4duIxy6RbttzrcBt6tTYIf16OteRR2w9sCMZEw60WAPBisdZW4z9iTQB1QBX/sBfMwEZ
 g4KER+/qU2ZBORpL6miRj9FEyeL2phWUMTMGQRLX9VAQotML+OrMba1MQuCD4EwvvFTHB4bZQ5X
 Q8GHc2Dkd/F4hMNxIEw==
X-Proofpoint-GUID: ximOk5skgSariEGWNG0chO83SWJZNLGV
X-Proofpoint-ORIG-GUID: ximOk5skgSariEGWNG0chO83SWJZNLGV
X-Authority-Analysis: v=2.4 cv=P9c3RyAu c=1 sm=1 tr=0 ts=694cd99d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=IwjJGIUIzvyStixYlZUA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512250059



On 12/19/2025 2:58 PM, Songwei Chai wrote:
> The Trigger Generation Unit (TGU) is designed to detect patterns or
> sequences within a specific region of the System on Chip (SoC). Once
> configured and activated, it monitors sense inputs and can detect a
> pre-programmed state or sequence across clock cycles, subsequently
> producing a trigger.
> 
>     TGU configuration space
>          offset table
>   x-------------------------x
>   |                         |
>   |                         |
>   |                         |                           Step configuration
>   |                         |                             space layout
>   |   coresight management  |                           x-------------x
>   |        registers        |                     |---> |             |
>   |                         |                     |     |  reserve    |
>   |                         |                     |     |             |
>   |-------------------------|                     |     |-------------|
>   |                         |                     |     | priority[3] |
>   |         step[7]         |<--                  |     |-------------|
>   |-------------------------|   |                 |     | priority[2] |
>   |                         |   |                 |     |-------------|
>   |           ...           |   |Steps region     |     | priority[1] |
>   |                         |   |                 |     |-------------|
>   |-------------------------|   |                 |     | priority[0] |
>   |                         |<--                  |     |-------------|
>   |         step[0]         |-------------------->      |             |
>   |-------------------------|                           |  condition  |
>   |                         |                           |             |
>   |     control and status  |                           x-------------x
>   |           space         |                           |             |
>   x-------------------------x                           |Timer/Counter|
>                                                         |             |
> 						       x-------------x
> TGU Configuration in Hardware
> 
> The TGU provides a step region for user configuration, similar
> to a flow chart. Each step region consists of three register clusters:
> 
> 1.Priority Region: Sets the required signals with priority.
> 2.Condition Region: Defines specific requirements (e.g., signal A
> reaches three times) and the subsequent action once the requirement is
> met.
> 3.Timer/Counter (Optional): Provides timing or counting functionality.
> 
> Add a new tgu.yaml file to describe the bindings required to
> define the TGU in the device trees.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/arm/qcom,tgu.yaml     | 92 +++++++++++++++++++
>   1 file changed, 92 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
> new file mode 100644
> index 000000000000..5b6a58ebe691
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/qcom,tgu.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +# Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/qcom,tgu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Trigger Generation Unit - TGU
> +
> +description: |
> +  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
> +  to sense a plurality of signals and create a trigger into the CTI or
> +  generate interrupts to processors. The TGU is like the trigger circuit
> +  of a Logic Analyzer. The corresponding trigger logic can be realized by
> +  configuring the conditions for each step after sensing the signal.
> +  Once setup and enabled, it will observe sense inputs and based upon
> +  the activity of those inputs, even over clock cycles, may detect a
> +  preprogrammed state/sequence and then produce a trigger or interrupt.
> +
> +  The primary use case of the TGU is to detect patterns or sequences on a
> +  given set of signals within some region to identify the issue in time
> +  once there is abnormal behavior in the subsystem.
> +
> +maintainers:
> +  - Mao Jinlong <jinlong.mao@oss.qualcomm.com>
> +  - Songwei Chai <songwei.chai@oss.qualcomm.com>
> +
> +# Need a custom select here or 'arm,primecell' will match on lots of nodes
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - qcom,tgu
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,tgu
> +      - const: arm,primecell
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb_pclk
> +
> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    additionalProperties: false
> +
> +    properties:
> +      port:
> +        description:
> +          The port mechanism here ensures the relationship between TGU and
> +          TPDM, as TPDM is one of the inputs for TGU. It will allow TGU to
> +          function as TPDM's helper and enable TGU when the connected
> +          TPDM is enabled.
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    tgu@10b0e000 {
> +        compatible = "qcom,tgu", "arm,primecell";
> +        reg = <0x10b0e000 0x1000>;
> +
> +        clocks = <&aoss_qmp>;
> +        clock-names = "apb_pclk";
> +
> +        in-ports {
> +            port {
> +                tgu_in_tpdm_swao: endpoint{
> +                    remote-endpoint = <&tpdm_swao_out_tgu>;
> +                };
> +            };
> +        };

In Coresight driver, the helper device is enabled via enable_path, but 
for TGU, it's enabling via sysfs node manually, so why do we need 
connect the tgu with TPDM device? I didnt see the connection with 
Coresight Core framework.

Thanks,
Jie

> +    };
> +...


