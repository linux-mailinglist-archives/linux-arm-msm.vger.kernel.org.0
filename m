Return-Path: <linux-arm-msm+bounces-111913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pdMuB+rQJmoalAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:25:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1774B657259
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:25:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Qk4+vd44;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SXauTXNu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111913-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111913-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 27508309A32E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 14:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885023C342D;
	Mon,  8 Jun 2026 14:11:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C493C457F
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 14:11:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927880; cv=none; b=hV0lyi2uquMisavXZ8wBtD//tjfnB9GXNd8FwXYvu2P6k2vtaFKIWx+qj9SOH1N0nHU3Kqg6SWS8OnH2uh0M8zvp1lw5CJtlc9/qaW0M90s8mmT156bds3KCX02XcMYikQeolVKJxMX3kcvvdnMqRWWFcKx/wxBITb/FhDgggnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927880; c=relaxed/simple;
	bh=uTKV6IvjJ1GeQko3Bl8mkwJGsqYNN/GIKQopjyHCBRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVzAYVzcTudvwbulKGQhrptN7Y7FiZDtvN6m62clSysvMhAWkpQaq0GUox3sN60rPR/2VbdyD0WTrhXWTBu0Whg4QJkyXQ6C8UOXYoFQ0PZuKrqyXy73+E5jHwkN5W7w4qjssp6IA9Jh5eKxDBdApNytuL2KuPapxNXfvf9jgIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qk4+vd44; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXauTXNu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRIsP3758667
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 14:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ge2g3qS7PI9YZlh6sQweBknzqeDtO4thMflNb0ch+FA=; b=Qk4+vd4433uTNFtV
	oCiZat1EtNS/KU+LHkc2o12gHeB2kAsJqsNe/q/TJtvOrl3BCkqM9piH0YQbRW9p
	Lciw9X4jmk9dPS11xpiMpVh9ckzhX8ZXNw7BNQEf3BobxzcjXw0cTHQP0/s572Ql
	DrTGi0Ia3bU/QNQfGirm8fAGMNjokrcDyCQspK/Yp0Cklzt9wGhUW1zVJ1vc/vPi
	+PbU6NSaV06gM+p3bGFgm2qyYMWmxDf9yA2KOKd+C7dXrzVUGo66aCCWByVQmGg2
	65ccBHSW/5jQrotU96gkbShajrjTo4o2zVDI8g4bK8jPdOa3wolkwu5fC53Tyf3Q
	bzwUoA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0hc5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 14:11:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84238e83851so2755410b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927877; x=1781532677; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ge2g3qS7PI9YZlh6sQweBknzqeDtO4thMflNb0ch+FA=;
        b=SXauTXNuJlP6aCuDLb6/vAZYPodFo4UMFVGpat1MGGj4bpzVLaPSo0XQvvLy7MKXWl
         VVmUSHqR64dgsrKAIo35td36v0LNp28FRGRumzuliDBUFquPgp7FFkOmwzr+n8GpVo3h
         fjG0MIBQ623RJ5CLLOupxoSC1r1NqBUBOMVdT6WmHDnnpRwIMxteL3wjD8qvRSmDIiNe
         la99zXaCqm/1aqJIiAaU35wJmsPu+Hg4FFUBpl5P9tNEN4KoeVN34Dgsos5hP/D6kYs7
         p/0MSW5cusmHAmDggm0Qf+8gtwrJEX75qmVHrmNBuwsF3T8r2FOfhhnRYjCMbtw8N55D
         nDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927877; x=1781532677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ge2g3qS7PI9YZlh6sQweBknzqeDtO4thMflNb0ch+FA=;
        b=pfWFPuKoWz5+FptXcBPrIhIFus15JBQfIu3aR1kQH5kfKS1HeyL0sNUypLCTJbkxZ+
         sPmOaqKwk7HexIrQH+g2pkzuSCMgvdBvJEwIgCa+NVTBTIUlBCNs7xtkwFfWaybxBxwA
         vijke/WzlXFXoF6RX8Khg4/lLsgbrAGynvzuHvlbj/8d3kUVkQS9vsaR1Ct7c0gNaW8B
         VE9pr9rnzK71V/yRBX9BEbUlAweiae6NO5Nsym0f5kxF+QkE6lKZFxN8bUjmN759ggrS
         BDH3za6FQIs2bBjFrrp+CLXcyTOl/ebnqIVEnnpZlmu1eG6dPJaLeBPvrzMXP+84/Y+0
         PndA==
X-Forwarded-Encrypted: i=1; AFNElJ+sqahU1cPjnMxFPBJVLLzrhPGhwJCoS4xTOHdum3o69vtMb9+hiRxuCJumyOq+Xp9GNwuZaJgeRMFOgnJv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4koxedqXLzucNUUhTfqnra8VKt0rH6ijscXm76HcP9ffTgzUD
	guMrnlviPRTdl+nqiJUVjPiIkcZzy45ghJEiVw7yepu8flRgqxuv1eUJ4quqAqMKIcpw+aUY9JK
	cGw3f2SOIii5gyn07VRP8sV6z2xrBhNXO71tC4yYYr7awGpA4uGFHP/PjKJCAAIUvSzq5
X-Gm-Gg: Acq92OHWAG1Mc9KJw02UWA4sTVdQGbnUHI6YR9MGaM8om65kw5B321EAoQ8+aWGqCJ7
	jRgXu2GYkFg1ogO/nAgu7s/snMPbKyWkg+fHrp1qqww2+5nMz4/nXW3uD1lBfn11bk9rJsz9s0f
	llzgcPjqNUb+n0i1PbL+aSettKDgZkK94J1KKwFFqron3FC5gVf/6fZBakmB2JfTXGPb3rqRNxW
	Omr5h+NbhY7zf+SxaUU4he4wEs1qzfLG9kNmFF4e9SILq2NC+lVE81rYt1GrvFb3MXVjIvfdFMz
	B+fflLgjn20pdMDwoSGQLYxdBKEiQGEVPBPQR+lvoKOTw/mjpb9jhfKJvS9r/Clt28NmFATK0eR
	Gqq8iwSvNuUMZauks9TT0aC7Z5IDP+lg9ol2D7w6n8EWr+ebPGlUz+scZGxTD
X-Received: by 2002:a05:6a00:90a7:b0:842:5634:3c1d with SMTP id d2e1a72fcca58-842b0e835d1mr15041544b3a.19.1780927876553;
        Mon, 08 Jun 2026 07:11:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:90a7:b0:842:5634:3c1d with SMTP id d2e1a72fcca58-842b0e835d1mr15041493b3a.19.1780927876081;
        Mon, 08 Jun 2026 07:11:16 -0700 (PDT)
Received: from [10.219.56.113] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428706fa9asm17907958b3a.45.2026.06.08.07.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:11:15 -0700 (PDT)
Message-ID: <b0700a75-7585-4779-85b1-5c9a85958b92@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 19:41:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
 <naa4rebf2mpn2uybjgmaidtni5fckbc66t2fx3tv3cfklfsnb5@op3qmkovxz7o>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <naa4rebf2mpn2uybjgmaidtni5fckbc66t2fx3tv3cfklfsnb5@op3qmkovxz7o>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzNCBTYWx0ZWRfX65s1pSmp2XNg
 1cpsmDkWMgx4ea44IQe6qJ0+URxOArHm9QxtIsKJ6wXnDoUWCfwfO4eYLZV6RpRcU6EivfJFcRv
 Q4kQcOYMFFi3ClYW+5WIRCO8P5JalVw4rUShtNMNlKVY7CGDPkjlmo6e3sVrHqqjQc1nVtLU3jX
 Jfz3twO6eij0BNOD0T7xowz8uW5NUj2us4IdSz9rLKinVs3M6jxuHa9vYVxVmRoqBgEviBiItSN
 5iLMeQxPSBAkCH8y+Gnq3Sgb5GeAU7dCwbxcBH42ibVDoIPri21nrYxgfSo+0NXLT486hifJwU/
 INAlIcYkXIUtV9GtdxAI1wXStmZcVQgE1D9W+rWQE1iiAgmk+ECjpqXgciGVN44Mv1C+DRoSfiC
 bpQHwcjaXPjyoP7a2fkjrZjBlG0fB3FFgiE76a7WG/7vNl1bAUzvz7SGdaI2mS8g6zamiWm7/12
 LqHtyEmAQts/ROMftrA==
X-Proofpoint-ORIG-GUID: 7EPRr9h3SuDddru0Zva_OYEomnxyBVjs
X-Proofpoint-GUID: 7EPRr9h3SuDddru0Zva_OYEomnxyBVjs
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a26cd85 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nHMyhPlvQ-XDY_K2CzoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111913-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1774B657259



On 6/8/2026 7:18 PM, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 08:12:02PM +0530, Bibek Kumar Patro wrote:
>> Some SoC implementations require a bandwidth vote on an interconnect
>> path before the SMMU register space is accessible. Add the optional
>> 'interconnects' property to the binding to allow platform DT nodes
>> to describe this path.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -243,6 +243,13 @@ properties:
>>       minItems: 1
>>       maxItems: 3
>>   
>> +  interconnects:
>> +    maxItems: 1
>> +    description:
>> +      Interconnect path to the SMMU register space. Required on SoCs
>> +      where the SMMU registers are only accessible after a bandwidth
>> +      vote has been placed on the interconnect fabric.
>> +
>>     nvidia,memory-controller:
>>       description: |
>>         A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
>> @@ -602,6 +609,26 @@ allOf:
>>           clock-names: false
>>           clocks: false
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          items:
>> +            - enum:
>> +                - qcom,qcs615-smmu-500
>> +                - qcom,qcs8300-smmu-500
>> +                - qcom,sa8775p-smmu-500
>> +                - qcom,sc7280-smmu-500
> 
> Only these platforms have the interconnect which needs to be voted
> upon?
> 

Apart from these QLI platforms, sm8650 and kaanapali would also need the 
interconnect support as per the SoC documentation, but it hasn't been 
tested yet [1].
So haven't added it as part of the ongoing series, hence as mentioned 
[2] this list might grow to accomodate other platforms.

<The list of non-QLI targets to be evaluated might be extensive>

[1]: 
https://lore.kernel.org/all/a1db573b-bcb4-44a5-89b6-6d1c76f4a18a@oss.qualcomm.com/
[2]: 
https://lore.kernel.org/all/0ded611e-1932-470c-8e80-9a5e94268583@oss.qualcomm.com/

>> +            - const: qcom,adreno-smmu
>> +            - const: qcom,smmu-500
>> +            - const: arm,mmu-500
>> +    then:
>> +      properties:
>> +        interconnects:
>> +          maxItems: 1
>> +    else:
>> +      properties:
>> +        interconnects: false
>> +
>>     - if:
>>         properties:
>>           compatible:
>>
>> -- 
>> 2.34.1
>>
> 


