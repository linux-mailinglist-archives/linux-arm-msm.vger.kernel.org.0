Return-Path: <linux-arm-msm+bounces-113974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NuLSEWEWOWp5mgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:02:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB826AEEDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:02:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JNgRdcHs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KEIpNHgB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113974-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113974-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCDC6303181A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558903793B3;
	Mon, 22 Jun 2026 11:02:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011462BD587
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 11:02:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782126164; cv=none; b=Gv66CAS/gVJywdILOXK7YphxVeap3Ri8mLO3/gR4/bmPNGkD2gvvUJufFBqF0hTl24NzljcbIKvv0cg6rOVNsuwdsUQB57zSjq5uHH205GgFMQdeAo4BqyVs0UaRrb4HVVGVZrqFS5VQ7g9CKev6yIIGc8428t48WE4iWhbFpls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782126164; c=relaxed/simple;
	bh=BizhfnJCvc1hwpxr4UCjPSeJMxdZf0AOEqU+ZpUG4cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bncqy9tJ+Ro8sXxTidvCJAs8A5KpKKDsAsD+J6w6NlhO8Ka6sfP01SaBLBBNzfDdcoL+qXwkTzFOM3KZ8LDHE7MRIXWpW/tixOkq6vimVE63+/dEWvffoM5UMLnLN5iwM5xMjux99baISigVNiYkhMTqXbqAgqGRT/Qu/92hbpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNgRdcHs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KEIpNHgB; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAo2gB1016667
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 11:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RrqKexHGAJvP/Ujx2c0/m11d5lUKuqak4XFL47jwQd0=; b=JNgRdcHsurmzSiOt
	+k4FFN7bxFE8uWCGka3H2jlC2t72I8jq88IzeUVIDE6yXLAjE4d6ql5KNzo7rcT1
	x4Ihms4PMctnBTKxGlSF0wWAE90/uVbww9ZFw96YLMGEK+M7mnWOeWUr6d62tf8J
	b3FQhrSuBjcFZvFCiA6/fuggKXJcORIDtLe79LsYn2mc6UyzntzLMkQeaE6oBSaU
	dZJiV+WOoUTYIsc4bikDnFVDn2pQqrHL4fjpoZQ2LlnLoUwgYZEZaKs8ClxcnpvG
	aKpbOPG9XwUB1lwDuOpdxQum+z7pVzRktmrvWspBb3g+Iz2pZSX/HmmZClByDBVk
	VKOkbg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey37h8486-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 11:02:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ddecbc403eso9137276d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 04:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782126161; x=1782730961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RrqKexHGAJvP/Ujx2c0/m11d5lUKuqak4XFL47jwQd0=;
        b=KEIpNHgB1Q4vm09MxCvgynj3M52DMFEEsv5pfGrrDnigqi93UwA/7oqr16DRL6UmZB
         /3mGz5DeMJnYoMjn5T0cY90r2fF9Pj5/yfIL3yg7LOMKXngIb3J8jA94T9BpSljNEWXU
         1bshWHSEgYmctqGv6GEgS5+fO5ZGBkxqbpR7G1sFDA9YhwTmWrpgIOEJVqHvgbsXAuB9
         5oh34RQAyMSMPTC3rxT4EdlFLIXJW2iqzv5lzY67cQ25LgAaKTDmWIFj6X1eMKbd9qGa
         tFfPl7SVLFjroqaECpFU3uL9b6sWQEW4Opsv7vofFqMnnRG7b+5gd2qBKzGkGB7ksbwg
         xrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782126161; x=1782730961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrqKexHGAJvP/Ujx2c0/m11d5lUKuqak4XFL47jwQd0=;
        b=NOagOJ7tHCu5bc1/RFqjbitYGRF2n8TiaYdSjhVH8evJpKD48hd7BlzayqU0o0nKiT
         gyTl7OJn1Z8nToIzF3Ohx+jqUe3SRa25T077GrVjMzklipIxNEkhxSqavb3HgzxwduO6
         Ne7bQMkIXXwZ2PzuWyFO4ZICzyBPeLGzZtO1omH5EmCG/gE5KPmLIMH/4eXD1qEPVElr
         1+YyBbRPO/g1Jxa05Pq28Bxn92zM9s17/R1+UN4gjV/wiIqURkarcZOHw/yJdI9kJk0C
         MHxt6llXZwLgBCqlsJEUBPYpw97YQMdxz69RXB6fINXe97mXZZlGGUb0g4gyBvG/zeox
         Rd6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+r/wjQH6CvFoEWPSYXZwTqjLusd5/FCinxApetaMr2SgpT2ET6Sn8yBlhX/FpV1ZLQkPxSr7aD+aQUS/pY@vger.kernel.org
X-Gm-Message-State: AOJu0YzigMk13iHfWbOnihFES+l1Vx42i5TAHRhHaIkAsvKgY4b0PVgN
	MOgOEZXsLnKMzPRfgrvbLgY3Eh58JVnqWwhSvOk9kpvm3whZ9nBSNEdgDG1oSiww+O+bTWsXGIt
	gRevqI6jYSfWqONNgfldHlb94oQp5OCep+mSxW6NG8I1o2P7VYoiWMFX5zIhnu0b8hlLX
X-Gm-Gg: AfdE7cnT3/0OGpJ64TR19JvjBzTGCH3HPHtuFHEKIJOA/0BjraARk+zSv92mDOEakZJ
	pbxAY2/0FQ3GZVfsrCI8ODePHjMFdvgk4flOSMHGBsg0q21ff0GEJHxeQo90cvmeBsxhO9knl6B
	L2UYm0WBVuWXmOASowoqTM2Qf+77Pq9ji3eb/3Hw41I9IBMTZXK/BAFhzvdi14OQT2G3D72UYlP
	3ILzxDC/TZPQlwRazyCNhuZtzAtFYjqNLpnkjKRI9RTY3BWL/1/wDqtXabD+h0ueBzLhY1QRa0r
	WIJEWTP0MY8NzMc1z5/JruOLsemHZFtlZ43Qg4BcUxjC8qRmHJJWI9nwXDoaqxploktdO37C/bD
	T4IqaMK4UHX76mhWKCfRbpqfKunyO1Bbs7mY=
X-Received: by 2002:a05:620a:8087:b0:915:769d:56e with SMTP id af79cd13be357-9208a8c06bdmr1415066685a.1.1782126161106;
        Mon, 22 Jun 2026 04:02:41 -0700 (PDT)
X-Received: by 2002:a05:620a:8087:b0:915:769d:56e with SMTP id af79cd13be357-9208a8c06bdmr1415064085a.1.1782126160580;
        Mon, 22 Jun 2026 04:02:40 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5ef8eb38sm335761766b.28.2026.06.22.04.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 04:02:39 -0700 (PDT)
Message-ID: <50d92653-b403-402d-af82-a037114c3aab@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 13:02:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: power: limits: Describe Qualcomm SPEL
 hardware
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
 <20260620-qcom_spel_driver_upstream-v2-1-a3ee6837c18f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260620-qcom_spel_driver_upstream-v2-1-a3ee6837c18f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5X-CX4dF3fDWF4VicNZpXiVkMmo9nC3Z
X-Authority-Analysis: v=2.4 cv=ecANubEH c=1 sm=1 tr=0 ts=6a391651 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=_263P9KSp_576IJaSfIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEwOCBTYWx0ZWRfX9c2EV8P35gYI
 9o8nCBC0S7R0fw6o8BPGxPYP3hoR5uYvaBuzLbpUFBcP6T0vr3RC6xM+L/hScsdNJZAihtKtWW9
 gSY7ytbMq0KaSFurANLX08Q4ep6qEpc=
X-Proofpoint-GUID: 5X-CX4dF3fDWF4VicNZpXiVkMmo9nC3Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEwOCBTYWx0ZWRfXw0AwPegQT1QN
 pzLuFgE+vd6+Lqyf5I4m+mggcCDezYguDh2j/5NunTRoY4ST1RzpcIdQXyHpxYenwoeeoFeO8F6
 W4oz/C8rEDTEEj45Pvpzj7QRvdKMruj0tlSq550wTsiXsyNT40gZ87RCUL4vnkJcoWfOl2LEvl1
 OCOkCX3Tr1vHkLYgKM/fti/F7lBtuAyJRGSjXe5mwK2/aZw1U03nvlPgho/DOets1DjHI1O0M7r
 eIQUiaUfGxscsrUIDk6AOeM7t4FGqpYa23CYFinZiuM8r42wJkdQqEUOCIX0pgAsP2jWaRxIKXA
 fJ4apQuHpjLUxsGO/xzVpd4iUS54EQnIQCVtl+WZOTMCNe1WYnNsRjF0JbzwNQONWjl3KTe3s2g
 uyxcF5WEfq2ba7jh4QsfZVJkeDJ8KNSAvGK9MLEmCEey27kiae60ydi4B/4xlWtVDBSc+AWsipf
 mS9R4KWjhEtQ6kMQPWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113974-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:manaf.pallikunhi@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FB826AEEDC

On 6/19/26 10:39 PM, Manaf Meethalavalappu Pallikunhi wrote:
> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
> based power monitoring and limiting capabilities for various domains.
> 
> Add a DeviceTree binding to describe the SPEL block on Qualcomm's SoC.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>  .../bindings/power/limits/qcom,spel.yaml           | 47 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 +++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
> new file mode 100644
> index 000000000000..4c6e6cbfbfe4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/limits/qcom,spel.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SoC Power and Electrical Limits (SPEL)
> +
> +maintainers:
> +  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> +
> +description:
> +  The Qualcomm SPEL (SoC Power and Electrical Limits) provides hardware-based
> +  power monitoring and limiting capabilities for various power domains in
> +  Qualcomm SoCs.
> +
> +properties:
> +  compatible:
> +    const: qcom,glymur-spel
> +
> +  reg:
> +    maxItems: 3
> +
> +  reg-names:
> +    items:
> +      - const: config
> +      - const: constraints
> +      - const: nodes
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    power-limits@ef3b000 {
> +        compatible = "qcom,glymur-spel";
> +        reg = <0x0ef3b000 0x1000>,
> +              <0x0ef3d000 0x1000>,

Don't we need the range inbetween these two (base=0xef3c000)?

Konrad 

