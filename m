Return-Path: <linux-arm-msm+bounces-105647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gE2hBB9I+GmesAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 09:17:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 693FB4B93DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 09:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEC9D300C922
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 07:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03986283FCF;
	Mon,  4 May 2026 07:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNqx5rRb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XzcQ02vj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A537129CB24
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 07:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777879065; cv=none; b=gLmF4JKThtpJB/UTnbtN2m4gNkcNQ7U3tSAKTVUCFvzd3O2Ji+/zBlhx+IS2eVilZVBFjBq1m/Xbj5Dz9MpbD69rpQl3bafGQcZatg3Fo0OcKEEiNfGHAto7hUvMWq/5l08+rFZqLl3cEVDuGSrIPGFVyphoJFR2ILakPfsEN3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777879065; c=relaxed/simple;
	bh=S2ywDK9Z/XmW1DdLWAaR4LWz/VfKoc196yZKCu9VRe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vCv4GDsPlO1Qqa4rU/EBcT5Im6Cow20a8+nT1ogZpwLAk/rVif9nnMKAalknqXQ/zJQNxvwEFUb+1g4Pd8LN/jeB458nZcRVZ4kg/y6a5YPsv+zezqASpBeO9cEJfBll0DoA9/dEcvRddd3RkYB+C3NcY0iw+rOI9RFONCcMSD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BNqx5rRb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XzcQ02vj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446D6ZT3479849
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 07:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BvsC7vS8QiLKFxVRhuJGpH17bq45h1P4AoYtDVy8ksQ=; b=BNqx5rRb5CIcNCsR
	CNREwUAaymoTDVT0u8XlDeYGV1R2XAXtW3omxdfQ4gLcHFfzCabL41ziaCJlUbwM
	krOuToYz4xZtgqy25I1/U6cBrBfgZ06SlImH7hldqxYvOSLgFAcC7S9GCo1xN8Kx
	UXZJuEPcCfwIv+4QahndXKtMD33k9GF2tsKpivl+/LFzOehQo2Feu6oHu7/VQk2Y
	gv8sRQ1X7CzVpIVHd7EP3Fd/gRKCgILJX8Bf0yEsa8f2DxoDzK02XKR1PjEpHnyv
	HQWiZ2qyx/KaPbEDLhOaymJyKA062C1BD5uEbDVojHEE1EN3pkGBBqP7DBsmd19u
	JDhnhA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9g3mqb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 07:17:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365161a9de4so1536394a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 00:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777879063; x=1778483863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BvsC7vS8QiLKFxVRhuJGpH17bq45h1P4AoYtDVy8ksQ=;
        b=XzcQ02vjl8t+OE7AZZ35GNpf9cmA8lRVD2AAUIIpK+y2DQvRH1cL2OqCFIX8GSu0l4
         MFmO7eeFLdi4FBsoC9kVeiqsXZJ+kSIixTiXy1sUKFuzG86in7e0jBZif9CKdQNBKLht
         3c7ZiLF3BuGPW509Mo5afcPVE+x3lzDk6zyz0cd9nWWfESdm/VghIz6E3S8dJlKm/aHn
         tk8ZCG7+hvankfexyPqm87UQm5TL9kO0lIQutRs9IX7ajLHNYeJw9v1eDJ351vBzcNWt
         /pj9YThRLtyqCxAUxIeUrestbZ/Q25coG8qMwvXeKCPpOCcMLtk+TdGMXI72MaDgruTJ
         MUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777879063; x=1778483863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvsC7vS8QiLKFxVRhuJGpH17bq45h1P4AoYtDVy8ksQ=;
        b=nQ53YUMKou34K6Hs3j2TItkaQ5TWkhRDPsUT5+8+E6oxYihB4enqx6mj13XYhRC1sx
         XPUTX5cuF1dG26VVkmww+dbSel7YQyq+jbGkdpw/JmOh8d7hZqkm8Q3CCGxePBAoXapF
         aEYRoWBdrNQ4bthQ4nRHOew8RTmE4WIDF6N/Goto7GfUcFn34/l1LnjL4nDcJ4C7afvu
         HNCeqEtnAu0XWc1Z1XAF0urVEIsFAZ8mZXJkDR05dcEG/Ntq8OkKtiENsHrAuDpCvzFI
         uDcFqnx1FAJTxW5ucp+TqGpuM6v/22R4yRPiqPRNQBthafg7EpGsyqhbV6bdV9ibZkDm
         ss1w==
X-Forwarded-Encrypted: i=1; AFNElJ/3yIgTxbQLWN++zC0igL8+XsMi+RwT/PjE0ExIuzPg5BPhBsOKWd+zGXn4KW0KhFvXl4acsYRhOXK/z0Ff@vger.kernel.org
X-Gm-Message-State: AOJu0YzLY1Y9BP7MtSBy6hzOdFfRZIPKsV9845LO3ieIFU5b3Yt6sRAY
	Lu/oa+0sV1uMW/jVylPXOgt9M3a/yXycuKCpAUAbt8kEM7eBqHh+33XZDOiZMn5P3/B21IdlnS3
	7UDMAmOO2J1uqCiYV0s8HDhAYNb5LSAiY034m2HrNUz4MvBkOQDXVj+GIYkKqd8apR1mveN4SY2
	/u
X-Gm-Gg: AeBDiesi8gxAJ88TznGjnsuE0ZjARgkdtUBcnop7ZUR6srHQVvydtJj9wfaIkrpFrYW
	SZ6vmkLKbcJPBBRg38JoD2sS4XOk9Wwix7InutCr1t2lNo2Cu7Y8AFhkr5njx3Qn8OYyGrU2nML
	t+nxHkVSbjReesWTxcQYPrKW1ySUtxRykEOY4IR4KbvHZSswp2HBcYGDzAmCOjKFOpf00qBFMFM
	QCIrCkxuKJ+yBstx/BAs3ZJhKG3yKobQUwweDetamiDaB+RvdK/ZQcJv5LJ5R44wKGFWmSNrZgq
	je4yMzkneFzJwdIxj5Uu2CM0X6IqFYee4cdIvmO1VwTzxvrpV6z+lE5+ko6b6glbxbdlAtERbDC
	4oM7MS98DKHqJ+5/I/iEob5/HqgaV4ha7q9FpTpqeTZv0x3ReNb1ephpk8r/8ZXHthGYffXp4
X-Received: by 2002:a17:90b:33ca:b0:35f:b1f3:ac12 with SMTP id 98e67ed59e1d1-3650cd08154mr8172122a91.4.1777879062779;
        Mon, 04 May 2026 00:17:42 -0700 (PDT)
X-Received: by 2002:a17:90b:33ca:b0:35f:b1f3:ac12 with SMTP id 98e67ed59e1d1-3650cd08154mr8172109a91.4.1777879062217;
        Mon, 04 May 2026 00:17:42 -0700 (PDT)
Received: from [10.218.15.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bdf2a71bsm13571815a91.1.2026.05.04.00.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 00:17:41 -0700 (PDT)
Message-ID: <a078818d-9355-4f97-9fc7-91f3fd61f369@oss.qualcomm.com>
Date: Mon, 4 May 2026 12:47:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: document the RPM
 Network-On-Chip interconnect in Shikra SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260429-shikra_icc-v1-0-e3439903edf1@oss.qualcomm.com>
 <20260429-shikra_icc-v1-1-e3439903edf1@oss.qualcomm.com>
 <20260503-enormous-benign-salamander-8d074c@quoll>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <20260503-enormous-benign-salamander-8d074c@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA3NSBTYWx0ZWRfX9rqTvK/ysmCq
 +w5eoihBB3GDe/McFIgo59+uOWrm1Je4h05nQW7G6du43k8bJFdrNhXku55pt2hJuSTOL5IHtSV
 PQ3G83SnrtoIyAxOGDkqPHqp64dxAUL8xWq3PA5t6ZZnQ172qZ9lf+n43PQLNUd+xZnH6ZWrJk1
 fiPmsgeE5LqVLGeU1X8/n6/DihrF+EqCle6u4QeXn50KUPmiDoiO3NDYOIqaEC8F9+7oaYZgpav
 XW4dg0OYuBSygqWrydwiAdkTQBkLVFfwNz+Ycm64m77WrsA3q4TjLZ6a5I5pTh3f1QDzKIVAszR
 cpbsEdMWttfQHMupi97PMoZGwaP7tcE597h0fxMO29hjaemYjAQwJytjPzCSWZKz2Zx/877sqth
 K08Qj5LjLNYBm74CwyjxES7kTYgJdgU7NzGbO6IAOdlkhnwMq6f8SOsiuEPEkieDkJcqAe+23+F
 kHQgaeQWlcmH+kmYyYw==
X-Proofpoint-GUID: JGikkbsK766Az8rTsATjsFfhz-x8n72z
X-Authority-Analysis: v=2.4 cv=Ge4nWwXL c=1 sm=1 tr=0 ts=69f84817 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=yHlWrU9OV0gRyedkY6sA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: JGikkbsK766Az8rTsATjsFfhz-x8n72z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040075
X-Rspamd-Queue-Id: 693FB4B93DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-105647-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]



On 5/3/2026 9:47 PM, Krzysztof Kozlowski wrote:
> On Wed, Apr 29, 2026 at 02:03:48PM +0000, Raviteja Laggyshetty wrote:
>> +++ b/Documentation/devicetree/bindings/interconnect/qcom,shikra.yaml
>> @@ -0,0 +1,135 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/interconnect/qcom,shikra.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Shikra Network-On-Chip interconnect
>> +
>> +maintainers:
>> +  - Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.

I will fix it next revision.

> 
>> +  The Qualcomm Shikra interconnect providers support adjusting the
>> +  bandwidth requirements between the various NoC fabrics.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,shikra-config-noc
>> +      - qcom,shikra-mem-noc-core
>> +      - qcom,shikra-sys-noc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 4
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 4
>> +
>> +# Child node's properties
>> +patternProperties:
>> +  '^interconnect-[a-z0-9]+$':
>> +    type: object
>> +    description:
>> +      The interconnect providers do not have a separate QoS register space,
>> +      but share parent's space.
>> +
>> +    $ref: qcom,rpm-common.yaml#
>> +
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - qcom,shikra-clk-virt
>> +          - qcom,shikra-mc-virt
>> +          - qcom,shikra-mmrt-virt
>> +          - qcom,shikra-mmnrt-virt
>> +
>> +    required:
>> +      - compatible
>> +
>> +    unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +allOf:
>> +  - $ref: qcom,rpm-common.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          const: qcom,shikra-mem-noc-core
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: GPU-NoC AXI clock
>> +
>> +        clock-names:
>> +          items:
>> +            - const: gpu_axi
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          const: qcom,shikra-sys-noc
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: EMAC0-NoC AXI clock.
>> +            - description: EMAC1-NoC AXI clock.
>> +            - description: USB2-NoC AXI clock.
>> +            - description: USB3-NoC AXI clock.
>> +
>> +        clock-names:
>> +          items:
>> +            - const: emac0_axi
>> +            - const: emac1_axi
>> +            - const: usb2_axi
>> +            - const: usb3_axi
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,shikra-clk-virt
>> +            - qcom,shikra-config-noc
>> +            - qcom,shikra-mc-virt
>> +            - qcom,shikra-mmrt-virt
>> +            - qcom,shikra-mmnrt-virt
> 
> This if is pointless here, changes nothing and not really correct. Drop
> it, I will fix existing bindings.
> 
> OTOH, do all NoCs have children? If not, the patternProperties should be
> disallowed for such cases. Also clocks should be restricted, see my
> patch:
> 20260503161653.60785-4-krzysztof.kozlowski@oss.qualcomm.com
> 
Only system_noc has children, rest of the NoCs don't.
I will update the bindings to 
1. disallow the patternProperties for the NoCs which don't have children.
2. drop the redundant clock property check for child NoCs at top-level
   allOf:if:then:properties:.

Thanks,
Raviteja

> Best regards,
> Krzysztof
> 


