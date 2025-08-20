Return-Path: <linux-arm-msm+bounces-69871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF3DB2D402
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 08:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 388D17A55EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 06:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6525B2264B0;
	Wed, 20 Aug 2025 06:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WTvN35Q6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F2C23496F
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 06:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755671083; cv=none; b=KOFkldBZoNcI/FFqlaWjvPm0SxrQY4b5sGM8yUTlZcqD5w/coGcc/RWjhx7lcle3pxwQTYLTqt73QnwhNu1BkdKFq3unGtjqZEdiIBauCqmyDKb9nrB/NF25o+jgHumVvNwY8YXU9RiYFwc/p6hJWz7PqSN+tFbPn26NgiP7cTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755671083; c=relaxed/simple;
	bh=LrH2WofXG6NubTOIL6SYNgxotAxylQjxzNFtKq5UgGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NAKr5k8dMJ+zLfXZpWuIrcZOUezaB2mVf0lpwAWPULnNkJ3UlOXYtl3EXc6hRiLgoPmlpUWmHjLidhwsMHO11JFUEvqagV4zDDzVNFyJuKX6L9C1d0Cnryxn3njZHO45PDQxAFulSPkIhce8QJCTCtEewcZ+VVpdDpF2gFg7vSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WTvN35Q6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oUNs010407
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 06:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iKDfblzDNT46YZA30uGR6v1f2o7XXcul3XVrMddX/YY=; b=WTvN35Q6cki4NjFv
	C5dybd5+82zGxiD4rcGhPQQ1avtwaO98mO6sOW4g2DKVdKj79cZ1fsyUW7j7xaLI
	h/c1+tEUyDS7uhXswB2G7bJASsZ5Psoy8OQVE3ZnoHIcHtrNbLUffcNf5helDQam
	602iIpsi0r6yM/Tctw6FZsq6jG8WnQr8NlKffGAjz8H7jADQu8xYN+Ojon8BnIvd
	jszcof3gc6JGkTuOGskFg6VtkzL2x22p/umtw5L/ks1f26fSmu9cEGWKZIWV5WYV
	sEngmni5ywi1I9QSwofXUHzgE0YqSTPEt5WYKPzaaIsqrewX2toB2hIZtgfxrOWl
	MIGg1A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528rmsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 06:24:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2eb787f2so6111551b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 23:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755671079; x=1756275879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iKDfblzDNT46YZA30uGR6v1f2o7XXcul3XVrMddX/YY=;
        b=VKi5tL+4BXyLsS7p9olhXT+1vGBqs/dc/PSUZtpph/8zh8j6UjzLAaVi6mIJpLAFce
         TchS4/N5njGWiTUEeWSTAC8Dq5W7UlsmCVxMCYVLhi+81gdpE0fUlKrNZ4JmrTejNWI7
         Z+LtefKXYTo1bSXgRbWV1fNssmCViG2NTVx1A4r9a4RM9HYHLmUskx0LwOx0mn9jUcgA
         l/chbz9mVfpV5RWRnqbr/n4Kgp6ymEpqsYl4/ejNnLuc2V5uldB2tOiv/pm5xhWYESvh
         If4rrip5gnx/Xaw/Xgvj6H1FFljzI8OkgAil6c1A+Vrjk9dBScve7k4S256iHn7xGyQD
         iEUw==
X-Forwarded-Encrypted: i=1; AJvYcCVGTFuw//NthjD2bgNn0z/inOBMptpSg3B2/UVV2GY7lF3KxDQsgv9Q0GrZl3Sfs9zz/w6SZEVKHhrO//DS@vger.kernel.org
X-Gm-Message-State: AOJu0YzU/cVY9W7U0lhJZn5AAFGQiuEUwt7vZ/WekVTQkVvjAqps0f8F
	opaK4bcubcJd9uYRFD/S1NBgY18wWSrqSgvIhSpK3zvVq2QOvEmoRrvk68xOT8ZLIfreIBS+BOz
	yDLqI0pKfuUQAzNlYjtSN/Af14ytE9ZhW7L+S55qWe4fs5lsFQTio5r3r02igy5HLa3Gb
X-Gm-Gg: ASbGncvbJC3DUv/ykDNZ5kjUVzH8K8Ow5gjyH4E0lLGRw/PVfCvVL3YukqRP/ebbOLc
	MBrdqM6CwNuhh3UmIWjXk1JcI/hz2dZu9X/GTO1eBoq0n8WQZTWodrFEQRMq+AFYJV5R0gy4S5h
	7+SJCjxsEd10z3lpY2OE90mHIJTT7kyYX1WvG2++XldfuteaemQc2JD62jINJldo4kceAJXmw2q
	CbMgBpNjw64X1y7KSFl7QgkFCKkZLSFZtFhL6DHWBm4I6qwUzOBGve5yCH3r8j2JcifDhL5ZNHC
	8vbZ5wQlpa5sS6V3cfA0Zph6JMn2t9Sasp0hUOUOFRfmvdydmhaFhoEhcSKhLc4zqVh7Ff8aFy9
	U7eX3THORevzihYfhlw84BrhDtRtVhyHv
X-Received: by 2002:a05:6a00:1486:b0:75f:8239:5c2b with SMTP id d2e1a72fcca58-76e8dd255ccmr2038338b3a.23.1755671079374;
        Tue, 19 Aug 2025 23:24:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfH/JRqULP7unNKt/bNqp2cJbEU4cxpppDZWazMbkq05YCUx/tWuR3V1ofH2rijz+Dk6oT6g==
X-Received: by 2002:a05:6a00:1486:b0:75f:8239:5c2b with SMTP id d2e1a72fcca58-76e8dd255ccmr2038315b3a.23.1755671078900;
        Tue, 19 Aug 2025 23:24:38 -0700 (PDT)
Received: from [10.133.33.73] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d9438sm4271920b3a.21.2025.08.19.23.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 23:24:38 -0700 (PDT)
Message-ID: <60628e3d-0a59-453e-acb3-acfc6dfe62af@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 14:24:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Add Coresight Interconnect
 TNOC
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250819-itnoc-v2-0-2d0e6be44e2f@oss.qualcomm.com>
 <20250819-itnoc-v2-1-2d0e6be44e2f@oss.qualcomm.com>
 <20250819194538.GA1214644-robh@kernel.org>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20250819194538.GA1214644-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a56a28 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=q2rpgh4P1k-zP0bRiPwA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: g_N17WRPak0cRvZ2J405KUNUUIxZypcV
X-Proofpoint-ORIG-GUID: g_N17WRPak0cRvZ2J405KUNUUIxZypcV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+jcY9UeEB9i2
 j6wnPLsizao/Xw417CkRJHAIZdMbmGq1WISnZK6T3x5k+vtUlekQtL2fRknIeu32KvlC+8JtCCj
 H1mmncQr10miFuoVjEO0atjWnBtVrjx52rQl+FtYiZzmsjUdork3slSiyVdcF1wV6alEDkW3vnY
 GWk0BQrc7eR6i0VhSXxRYnN48eJ1TEPHHbRDHxfEohAa91s8DaCxKaMe/j5pawC82xIJv3b/xnf
 a7vpySwiSIiX6PUSWc8Z73lUVhIXN4gJ0mnsX+52xMWbJN1NyYPt1iECOPGu9Y58HA6Piuht9X/
 TrutVQB8IEpJV+LF9DVBSH08wNJ44VQGbCQxdN48DPLoHnmH02kDun0toE6HyGdmVEBqqfrU+RK
 WAmggLczbXhtGzOHboAcWJGSo9UjSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 8/20/2025 3:45 AM, Rob Herring wrote:
> On Tue, Aug 19, 2025 at 03:27:43AM -0700, Yuanfang Zhang wrote:
>> Add device tree binding for Qualcomm Coresight Interconnect Trace
>> Network On Chip (ITNOC). This TNOC acts as a CoreSight
>> graph link that forwards trace data from a subsystem to the
>> Aggregator TNOC, without aggregation or ATID functionality.
>>
>> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>> ---
>>  .../bindings/arm/qcom,coresight-itnoc.yaml         | 96 ++++++++++++++++++++++
>>  1 file changed, 96 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..a3b5f2b949f69617a014d0ae2831c9c767178f8c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-itnoc.yaml
>> @@ -0,0 +1,96 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/qcom,coresight-itnoc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Interconnect Trace Network On Chip - ITNOC
>> +
>> +maintainers:
>> +  - Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>> +
>> +description:
>> +  The Interconnect TNOC is a CoreSight graph link that forwards trace data
>> +  from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC, it
>> +  does not have aggregation and ATID functionality.
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^itnoc(@[0-9a-f]+)?$"
>> +
>> +  compatible:
>> +    const: qcom,coresight-itnoc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: apb
>> +
>> +  in-ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
> 
>> +    properties:
>> +      '#address-cells':
>> +        const: 1
>> +      '#size-cells':
>> +        const: 0
> 
> Drop these. Already defined by the above ref.
> 
sure, will update.
>> +
>> +    patternProperties:
>> +      '^port(@[0-9a-f]{1,2})?$':
>> +        description: Input connections from CoreSight Trace Bus
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +
>> +  out-ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      port:
>> +        description: out connections to aggregator TNOC
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - in-ports
>> +  - out-ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    itnoc@109ac000 {
>> +        compatible = "qcom,coresight-itnoc";
>> +        reg = <0x109ac000 0x1000>;
>> +
>> +        clocks = <&aoss_qmp>;
>> +        clock-names = "apb";
>> +
>> +        in-ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            port@0 {
>> +                reg = <0>;
>> +                tn_ic_in_tpdm_dcc: endpoint {
>> +                    remote-endpoint = <&tpdm_dcc_out_tn_ic>;
>> +                };
>> +            };
>> +        };
>> +
>> +        out-ports {
>> +            port {
>> +                tn_ic_out_tnoc_aggr: endpoint {
>> +                    /* to Aggregator TNOC input */
>> +                    remote-endpoint = <&tn_ag_in_tn_ic>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +...
>>
>> -- 
>> 2.34.1
>>


