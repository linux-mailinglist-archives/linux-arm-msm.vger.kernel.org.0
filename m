Return-Path: <linux-arm-msm+bounces-111904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZXqoLOfNJmpZkwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:12:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5837A657010
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:12:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Wdo6rjfu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Jx+MB5ZF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111904-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111904-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03B083059798
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 14:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B7C3C3C0F;
	Mon,  8 Jun 2026 14:02:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2483C343E
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 14:02:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780927376; cv=none; b=uE5cjNbXgWylEHT8DSY6dwCDx6pItAJQHVQVrP4FthpBQNXz4IGxMxtT8kkhKkuZw5YvVDt1pQniUIcro48tlHDXxLB+5v/ycYdRPbJ3CQbkX8a+3fuBwgnOU1lJZMrnp20gceRgC6dG5kFLAWp/iolUl9+p3ak7yu8CUEaYIus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780927376; c=relaxed/simple;
	bh=7eUwF3VpozAWjRC2kEOp0J91+kRbU/gNOu1dAGf/Pjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dckSmCZuHH1Bq+jjO2SnCTapIR1LZd8j03n30p5ojjsFLwRt0xHFqSQYfMhPBKbOf4BzonOa1aSQrLtCsr4MwLbR9nuVOJHLBOj0PBx70hUrytWwq2xKDm5IxPYbZa73189qnzdZAU+uMTv3cpWKN4c1gEz+QmaoDQ2GtoaISOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wdo6rjfu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jx+MB5ZF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRb403759470
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 14:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	si0lI3WfDCA17zxk71mM2P+Dt0kHG2CEwaIr9z/aN+c=; b=Wdo6rjfujIvTY/9p
	15eP/N8LMz5JgDuO650z57EpNpNumTWOFRlwRw47+U7B1Wnti2d7+5nQBClu7T4U
	XnNYF29aWKIeuuBQE8QHfab58qqvIFP42fd7DPpPScWWhnmoEhil65SXy8Z9OTP9
	mr+lXNIk2RyBP6MuArSbQC9tmw792lSxJNBxTSiK7fjjJEDEvKsU5bpJdbN2AcqM
	FqWsL73tUtVOMWM1oMOJ0LCr88ysdaSxtwjmFAmxlvyMF+L59Xqs5onY/KmjTYP5
	KKT0vr/zeSz/y4bW3/q8iDRcVdpHNdX8WOSKl48WVNPIH/u6WpPrEvf5vaScL/nl
	EAvZQg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0hb1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 14:02:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0a81c1738so27397165ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927373; x=1781532173; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=si0lI3WfDCA17zxk71mM2P+Dt0kHG2CEwaIr9z/aN+c=;
        b=Jx+MB5ZFzp3SrAyL1zsml2q6YVpuh7XOgJAI1YPUPkreUAM/7W+liXp+qrJ2IDtIZ4
         7MNgmYDFRM6SAowMY68LDIYK9qfvVKa11adkfIahUvG+iQ2BsC+ColXc8Y6lvseCyJhr
         ZcmWGVE7BuC4hr+StL6UUwzr02/6IRsSxlEVr8B3A9u9Pel0wP2Po11vU2R/27nXU7HP
         KgaMcSZHCEOevM5aGJMtM8mfZqsyPAMzpwpbtRNvuhLpLH7WsMl9rXMgympRz85vQsAz
         kY+x+m5fykQyQuVj6UaiarRyguOgz+jJjwqQWYFQWYjnzGmyt9XKJz0Um1YtCSfiETTK
         Z1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927373; x=1781532173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=si0lI3WfDCA17zxk71mM2P+Dt0kHG2CEwaIr9z/aN+c=;
        b=T0iuca5a/kr52Tksxne/K5MUc5zLwoP7W4qfkPcswzM6f4879OP3NwIal1uoFrARQB
         DWNyLqpPDwR7VV0Z2dJ7bZM/UO0StZRiNbcF41DuovRShFiFpXR3DYQpLINRfd5AhiUW
         vU5LnnuDKNlvIMIMUl92rfu5rBS5Nwjzx7Bn03pACDxCmhXqBiYeZnPjPVHCZHKX9dav
         IF0SczinmFRzn9OWIeQj43+U8wLTCyiGIAjRrVLvtTBn0YjX98sEDQWCbDa4CDdQXU1V
         V5prrmDDIyem1Dx96lHkBiBV2ZY5P3wp3Y2HPZU/yj4+ngpkU/pCLuMnV8Ej3OsP7Pml
         RTew==
X-Forwarded-Encrypted: i=1; AFNElJ9JORK8n1QouzTDLF3pVGX2G1C9ETCN0db1hXOSBTbhKPMWa5GzL/j85wT3Xzi2pcWwpeep0bbbG6kyBGd3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5jBusiAqFRheMcDLR5G4BZ76WLtjhU0HMmvxDLaXypJVmrnvk
	g14SYJOtnXYFrfFXf+pF/VKCwKcQt1lOnUYQDliUWAmp01Ssv7oJ9JNhkILsj1owskMlb0Q3LgW
	pYsRN3wU8a+kBNVQEX4WXGHA02yR5G9nwUeXplDW61DgW9XK56CsdhVuqCPTS8skL2FUJ
X-Gm-Gg: Acq92OH8llNelTcCmieOvD/od4hEQWYjD5oP6cdGmIYd4SoSG2nWlnS/wtt7udwQF3e
	/N9oyFEoA2iVgMI7/l83TIlq03tSWxQmBW/AUoD8BW7PXtbhrBK6/HCcD7SJp2NG5R1C3bqby8g
	1sEi/irxKgM5R0rlbvxwoj8LYhtoeOwgS2fI1Smu8UrLwFXGAj0o7UrUPSKIjfwkHQKpngVoZ83
	Z1CEMqP/cLJ3qhiC9oh+7wC1ufZ3Oq8pNuWnPM/nYw5JanRa1vEom4kD///4Yj8UKko/kCR0aZQ
	IZ+SKsLfL/zGyKm8jhOfjnOpH6AX4Qsw6dXjZEqqxteQoGuCh/DgN+nflZ05zy8ouBCv+wuNLIw
	WvRBbfsp8kWb/dT3RsikXVNY89UKFsDnVoMDBKo85lx7oVLWsycKA+nDYzHXk
X-Received: by 2002:a05:6a20:2d14:b0:3aa:ec1c:84e5 with SMTP id adf61e73a8af0-3b4cd09ace8mr18854504637.43.1780927372814;
        Mon, 08 Jun 2026 07:02:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d14:b0:3aa:ec1c:84e5 with SMTP id adf61e73a8af0-3b4cd09ace8mr18854371637.43.1780927371975;
        Mon, 08 Jun 2026 07:02:51 -0700 (PDT)
Received: from [10.219.56.113] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df03498csm18010993a12.1.2026.06.08.07.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:02:51 -0700 (PDT)
Message-ID: <a1db573b-bcb4-44a5-89b6-6d1c76f4a18a@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 19:32:45 +0530
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
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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
 <1b5ef5b8-c9f2-4eea-8040-22c1d704b529@oss.qualcomm.com>
 <0ded611e-1932-470c-8e80-9a5e94268583@oss.qualcomm.com>
 <2roy5rvazzb5p3vl3dyutft635n3acwssqnqvrzqziivh3ebq2@wptxg7exupmr>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <2roy5rvazzb5p3vl3dyutft635n3acwssqnqvrzqziivh3ebq2@wptxg7exupmr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX1N0p3k026+S3
 gjQuWaZPWxktZuX4dUeEG+C0YonLbmw7z2dHBFKPixF/nWxm+nXs+e9iNJOBKN5GGg+GJgADspv
 qNRVdik0yFwILXH6Q8am8nYWES38AdZyK61EFMWuqJWuhBzinB1DjgVOTKfsw41EM7pEcrfIGPN
 BVh3QGG8z8Xjv8isgQA0ePJAUzHxbwoCYeDJI7yJ6Tj8WUR3HEczsFPnjfiq4wWgf3auEm4VsXv
 wgdsT4H36ddMrEqUBeZNI8kQGZ7OiddzeGWyjnu37/xPgRDnjr4EQ23gF+cadtdcRoQab5ewmia
 yDzSE68i/x6utjr1tGUm0SX6FRCDXWpfzfCybLIFFxoU3XlLtEUlBuFqZz3P57I/scSTdDFqCAQ
 18Dxcxf+use9wrFBBCjIRLav5b+0F9pIFYMIgirn0QijORvf36gyy6rYbepfhn3SPBHcAsezYhH
 +oSNjfO30T0sP5321qg==
X-Proofpoint-ORIG-GUID: PAUl5CsPBdUxNVrrHPjXf9tveck9-tjk
X-Proofpoint-GUID: PAUl5CsPBdUxNVrrHPjXf9tveck9-tjk
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a26cb8e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N6J3eu7hh-G8EisLkUMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111904-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5837A657010



On 6/8/2026 7:19 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 08, 2026 at 07:14:43PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 6/8/2026 3:22 PM, Konrad Dybcio wrote:
>>> On 5/26/26 4:42 PM, Bibek Kumar Patro wrote:
>>>> Some SoC implementations require a bandwidth vote on an interconnect
>>>> path before the SMMU register space is accessible. Add the optional
>>>> 'interconnects' property to the binding to allow platform DT nodes
>>>> to describe this path.
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>> ---
>>>>    .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>>>>    1 file changed, 27 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>>> index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
>>>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>>> @@ -243,6 +243,13 @@ properties:
>>>>        minItems: 1
>>>>        maxItems: 3
>>>> +  interconnects:
>>>> +    maxItems: 1
>>>> +    description:
>>>> +      Interconnect path to the SMMU register space. Required on SoCs
>>>> +      where the SMMU registers are only accessible after a bandwidth
>>>> +      vote has been placed on the interconnect fabric.
>>>> +
>>>>      nvidia,memory-controller:
>>>>        description: |
>>>>          A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
>>>> @@ -602,6 +609,26 @@ allOf:
>>>>            clock-names: false
>>>>            clocks: false
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          items:
>>>> +            - enum:
>>>> +                - qcom,qcs615-smmu-500
>>>> +                - qcom,qcs8300-smmu-500
>>>> +                - qcom,sa8775p-smmu-500
>>>> +                - qcom,sc7280-smmu-500
>>>
>>> This is a list of targets that happen to be supported by QLI.. but should
>>> this list not contain _all_ Qualcomm SoCs, or at least a much broader range?
>>>
>>> Perhaps
>>>
>>> if: properties: compatible: contains: qcom,adreno-smmu
>>>
>>> ?
>>>
>>
>> As of now platforms where the issues [1] getting reported are added, the
>> list will grow.
>> <We still have to evaluate and test on other non-QLI platforms hosted in
>> upstream [2]>
> 
> Do you really need to test, which platforms have an interconnect, or can
> you predict it by checking the SoC documentation? I strongly belive, the
> latter is the case.
> 

Agree, for interconnect path we can surely predict from the SoC 
documentation,
But for the corresponding FLAGS/values (MASTER_GPU_TCU, SLAVE_EBI1), it 
would need some testing before finalizing the change on corresponding 
platforms.

Thanks,
Bibek

>>
>> [1]: https://github.com/qualcomm-linux/kernel/issues/297
>> [2]: https://lore.kernel.org/all/a437f9f9-3560-40f8-85ea-35433e33c428@oss.qualcomm.com/
>>
>>> Konrad
>>
> 


