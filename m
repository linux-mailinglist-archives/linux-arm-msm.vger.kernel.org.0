Return-Path: <linux-arm-msm+bounces-71234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAC4B3B5FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 10:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9D6216F755
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 08:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1964B298CC4;
	Fri, 29 Aug 2025 08:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cZ32Ag5c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523D12877FC
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756455896; cv=none; b=Yey4Be/UzYc8fTI+XAmiB98RQyUC76RG9GtYQwus7pN1UwuDqjXsTCicRhTBTs4JvcxvJBA4tXqLRVC+hhMY2JIf/8lhLNb6aEx1or2IirNVWnaZNBOLv33F2e74UR/CIfz1uFGqFvfKa1TG9rah8y966Hk+ufsqLB4JV0dywWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756455896; c=relaxed/simple;
	bh=zJSmfRVOkbtIQDtehxlC4Tzz6O3pXqvUInfxHeMwYz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R15FRdPy9/EF6nSGNBKlZxDzd1pYKYuI9HH4j+XaqmH9ROwcOIkZHPewjkNy/2354oG4nNZ5i5B0o88aPDBNIrOZ4YPNQAXPqIOQaVlqSjB24drQun/+4bPe2OcpUjI1KOl9khDJ8Su1ASq7aHdHdxEDWml2mSozgCS6Px98ZTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZ32Ag5c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85ER4018640
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 08:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZmutOEL4BSdKwbUx9oh5gSZnIUCZlQ2dXVG3r2aUCeQ=; b=cZ32Ag5cV7lQib3P
	Apx9u1mcGxt6bBzqSbyaJU9Gzh8bJvapCUVJT4mxX/ipO2HXWjLmKOqclM3rLBgq
	JzL/KP1PnzaWlE/SXFHQ/hTouO3geinjc5YywXheztw+iIRoL1nX30vRuzu2pqq0
	FboL6whzLKrKO+GQXR4YW2Aai60yGBAuN5D4/VNOb0tcYOmYE0Si4UMIf0XaRAcL
	Of0mTM54xRhryjGxhpw1uf8PpcnPhY68Nvxdkl0Zniouey/Y+R0FC7B6eUv7FZ9n
	Z8L0PlMiZLkhwZY2crPTOxge05Skp8zfewyOga7zB3Gs3GUeSH8s4Mr5Zw7/DTE0
	NSE+aA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tn67keh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 08:24:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2488490fe4eso25954355ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 01:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756455891; x=1757060691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmutOEL4BSdKwbUx9oh5gSZnIUCZlQ2dXVG3r2aUCeQ=;
        b=V7tp/iaYyzLaBHxXBRJH2uWG8ZTNtZ1OAtFXK/Bp8t6VU6dH67amvaQnTgiuXYxCfC
         7IxxX1MA81hslAijUf9Jj+klez4ks0tTpR8/mSqXbCHv5SBG+jwOGr+V4Q4+V4K+tSxU
         r3w0PPnTPmMxVag3LtRMWPl1scgOJH85JG51iEXZ7TlaX/tHiwLGSSQGTUEPPvbinbNI
         Zx0Lra3i5VHojUFC27yL4GYJebMTVlMwlNQlGCYELo2IrS9hdpojmipj9UQIXOxGzcoM
         78fVdRRnFfi0oYpqS5c8lkT1mKAPhkscg2AfczPi1l4xFiOR/O23qEhiik/l7qo+qjas
         p11A==
X-Forwarded-Encrypted: i=1; AJvYcCUgVRR/PnTKT2G+JYZRxxWDEIPsUQ0nx6HP4vigIe3S6vIqjOYZEY9mSOw1o34ln66JFrXABfuYRaETRWsU@vger.kernel.org
X-Gm-Message-State: AOJu0YwHL36FAel1jMXzr1BA4KRNKz4L3Sa21rlFEOxtVeHmIW8FdiST
	YWmxVGF/cFXpAJFbg9PlNGnCO4zv0kAlbD+pYFdCSL3+StlliKzH9yMDWSY9/T0VnC0RCTyE0PF
	v4E3x3EnPr3k9WmQSLHwKQq1CY9SKkLY7X5qZExxp0Jy7HyyICO7I1YUaxNJKdtefz0kj
X-Gm-Gg: ASbGncueSiGzTqDzPhhLn0UxoR9KEYURXbcWGLj+kKkIEttZL1uFTm0jD3sG2T5lDxz
	riEiDCZFoO8OwHsF2OLemKDhH8sVd+gCc2BplVTkc6PwOcI2ayC/ndUr9x6qirnAhn86OaTBcHZ
	j6GBuUni4uUT0diVzSb/phXJKbns45TZtfmDr+xsHVuEyic4laX0SA4kpz/b2bqrGGXJFq6PrKW
	JZBy8+h5lplX+DYJQ3S4g18Yhf8U41Wx9R27WSQ8l4o7UGv7qVmwrcRQo5efqG01wavEE9MmtfR
	zyrE3zQVvK6PXHmtcJO5wXyD1xHXgFX2t6fHGoTdngio07RtED0r5ZvwGckNsM2KeCGO
X-Received: by 2002:a17:903:384f:b0:246:2b29:71c7 with SMTP id d9443c01a7336-2462ee92ef2mr364175345ad.25.1756455891396;
        Fri, 29 Aug 2025 01:24:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBH0NFwkkluNtoyFp/sOGVeW9GAErFZVXGcvAduDHifrpu0UX3YiAiOgtNINcHVTBJqK21Bw==
X-Received: by 2002:a17:903:384f:b0:246:2b29:71c7 with SMTP id d9443c01a7336-2462ee92ef2mr364175035ad.25.1756455890943;
        Fri, 29 Aug 2025 01:24:50 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.25.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24905da4d44sm17598275ad.83.2025.08.29.01.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 01:24:50 -0700 (PDT)
Message-ID: <558ca51d-e1ca-4267-9166-2b929216c43a@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 13:54:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add DISPCC and reset controller
 for GLYMUR SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250829-glymur-disp-clock-controllers-v1-0-0ce6fabd837c@oss.qualcomm.com>
 <20250829-glymur-disp-clock-controllers-v1-1-0ce6fabd837c@oss.qualcomm.com>
 <hpfeihpixuauter7ik6om5sv7ocmots5gq3fw7cvn5wkuieipt@jitqslr4pkw4>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <hpfeihpixuauter7ik6om5sv7ocmots5gq3fw7cvn5wkuieipt@jitqslr4pkw4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA4NSBTYWx0ZWRfX+uTTX4lxZRYp
 afeXn5JiPQB+fsggF5EOlQ7e+HdJ26qQb1gCyVB5/CVbKfylhEsGvee7EU7QISI767S6getsF9s
 ROc6z79aVk8Z0IroBXRLBxvsPvTxT1hR73hY9isfMQtKpcufPfe2kac3roN9i8rL9f6htjvRXSb
 QSSVKAWPsIv7w5FLlr9ygyKcNgKnfMcrxIJHXDB6/Ga51+GeE2KWv3HnLBfghEjtURzmOkb9y8r
 794VBpwgKk/dPwidPaTBAg/MMkp4gNkUwCNBOtVBhCB0dRuhCdBaMqC3hpSR+YCV7z1/gdfWpMp
 HenyuPqWUlSYVybT/Frxzpz0WPShqlsBdVmpic7LOB19WJFNLKSkCtdZ0KVDAzdoAWgiME87G1D
 K/hYqYxH
X-Proofpoint-GUID: OiSuC1msWAirdhzK05DvELUbjriQfV0X
X-Proofpoint-ORIG-GUID: OiSuC1msWAirdhzK05DvELUbjriQfV0X
X-Authority-Analysis: v=2.4 cv=P7c6hjAu c=1 sm=1 tr=0 ts=68b163d4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ubyLEIH+BItvSySilgXupg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=1ut_qpqdL47trf14q9UA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508280085



On 8/29/2025 1:42 PM, Dmitry Baryshkov wrote:
> On Fri, Aug 29, 2025 at 01:28:03PM +0530, Taniya Das wrote:
>> Add the device tree bindings for the display clock controller which are
>> required on Qualcomm Glymur SoC.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,glymur-dispcc.yaml         |  99 ++++++++++++++++++
>>  include/dt-bindings/clock/qcom,glymur-dispcc.h     | 114 +++++++++++++++++++++
>>  2 files changed, 213 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..063da2416dbaed764b8579a090bc5fc0531ab60d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-dispcc.yaml
>> @@ -0,0 +1,99 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,glymur-dispcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Display Clock & Reset Controller on GLYMUR
>> +
>> +maintainers:
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm display clock control module which supports the clocks, resets and
>> +  power domains for the MDSS instances on GLYMUR SoC.
>> +
>> +  See also:
>> +    include/dt-bindings/clock/qcom,dispcc-glymur.h
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,glymur-dispcc
>> +
>> +  clocks:
>> +    items:
>> +      - description: Board CXO clock
>> +      - description: Board sleep clock
>> +      - description: DisplayPort 0 link clock
>> +      - description: DisplayPort 0 VCO div clock
>> +      - description: DisplayPort 1 link clock
>> +      - description: DisplayPort 1 VCO div clock
>> +      - description: DisplayPort 2 link clock
>> +      - description: DisplayPort 2 VCO div clock
>> +      - description: DisplayPort 3 link clock
>> +      - description: DisplayPort 3 VCO div clock
>> +      - description: DSI 0 PLL byte clock
>> +      - description: DSI 0 PLL DSI clock
>> +      - description: DSI 1 PLL byte clock
>> +      - description: DSI 1 PLL DSI clock
>> +      - description: Standalone PHY 0 PLL link clock
>> +      - description: Standalone PHY 0 VCO div clock
>> +      - description: Standalone PHY 1 PLL link clock
>> +      - description: Standalone PHY 1 VCO div clock
>> +
>> +  power-domains:
>> +    description:
>> +      A phandle and PM domain specifier for the MMCX power domain.
>> +    maxItems: 1
>> +
>> +  required-opps:
>> +    description:
>> +      A phandle to an OPP node describing required MMCX performance point.
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - power-domains
>> +  - '#power-domain-cells'
>> +
>> +allOf:
>> +  - $ref: qcom,gcc.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,glymur-dispcc.h>
> Should not be needed

Sure Dmitry, will remove this in the next patchset.

-- 
Thanks,
Taniya Das


