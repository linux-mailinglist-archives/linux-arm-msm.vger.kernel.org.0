Return-Path: <linux-arm-msm+bounces-111898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mu9jLKHHJmrdkQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:46:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B01656C5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:46:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Rk4qYFZp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="deJIO2/i";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111898-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111898-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53C11302A1AB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D958E383C99;
	Mon,  8 Jun 2026 13:44:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66E638F233
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:44:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926292; cv=none; b=WLBknBWHRQ/iiP7IpjzqSsSRZut9404gHwDg67knChAj4hWALUpWiOMRqUTB1XwZLo59Uco2YR+93TR4HwpolvZWXp9zBNl3PbCNRnul+jaI5VzbmDrJMHuGJz6ISm7NgzTDbKs4ugozmmm4cSo12qsy076jbP23WAia8SThL2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926292; c=relaxed/simple;
	bh=ADv8HQSn0bAWEjRLgvvHbC8lDudXzS5pm8sdS5zAgW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3juQtGIB02P9vzAKV9VAtaFtEXW/tCS1V0nKuwLLc2y6ow75/+89fUPSf7pwbDUL2N+ReP0gHseiYuC+gxwJUFztYZZY6AB+G3PS0OEWu2f9ulsz3YLGftR1Y5D4PVpAGm87x9LE9hdlSTp4WAm7xVtE6r5lNnwO8pi3TB+OB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rk4qYFZp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=deJIO2/i; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRBj63340145
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 13:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UBeLLeGd6D9gfelgbASleoaGWcIHd60b02pysLN6WeQ=; b=Rk4qYFZpGnlkGGw0
	R3e/WBEm9RaoOSBpuO65hpi+rZ3tPqtV1E9zMZ2HqK9xdim43SifwVfqbo07GHrM
	Ju5dw0NOumxW0CEDPfaJ30J+lDNgKkUsoF6WCZEh4N2Wb+KMRfa+QRgFkprQWFTk
	iunZ+6qnCMVFMxu6pAJ0J+3LTJoDbpyT+cZYY//NyyXHWArvYc8qEmuRSgBDCUux
	NxDFHKhAJG0LCkk/eAKucK+LXxCAKcQabgOugfozTymldl8iDtm48NhNCrktjlqA
	ATL+7rp16SUgQIXbWD78hULIbIGtCx85dFsMd2JLM+KhemVstOmLtODKZlRwSbrv
	GPetDw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m0h0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 13:44:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c3315d31so48014155ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926290; x=1781531090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UBeLLeGd6D9gfelgbASleoaGWcIHd60b02pysLN6WeQ=;
        b=deJIO2/itOhtBIAbxLDxAUzKkKlxWAVh5Cz678maO8NHAAdjYRHpxi0nGTDiFMXrNr
         pWhku8OjzLtPGMcJ59ZDAC/QuzHBOQwI2WLYbHzDrnisvdtGMhp2ui2isp0Qte3L/cY0
         tWJOAGZxzQA8n5ZcxFnzZMYrDdwxztBuZpE8LNCcYbzPLayA89dA/P0VZLMg3WyR/L3o
         3oKilUn0woJepG/xmcOeO3hblCNf+lvlyLYIlHtU88tUIsxcE2UjQzqiVvXpO0qkyvM3
         K/aJhe4+786hmwP2BDRhzP0S7Gt7J2zlbNziD4YkLoxymFa/MexeU/1C2QimF4nv9jvg
         YA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926290; x=1781531090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBeLLeGd6D9gfelgbASleoaGWcIHd60b02pysLN6WeQ=;
        b=SgYpRmLce9ZmNKc4NgDW3c/Lf0be91+/vOCGpZHRLSatrGowH3zi5djvVYFwl/uJ6u
         gJSpNfOcF0lYhBCOMPULiFcPiMUo/AmIsNMnNa30kQmroILHoGvThmajxnMZaxXcvF/Z
         0GP7LFytpYt4/13WblXHOjuLe76UFbyIVAYweDFLO8GHaCq+Mg3Nh0Gy+CCtPlpmhNu1
         XGLxgcABfFWoHT667Z6VtJO2X3kUGJjuP70qou2c4zHTS4+/DjXADhxcKZmFionIbdMk
         TOyGDEx4W+ffJ2Va+8EdTbzuk2JsVyJrhf1EoD/cLVRP8XQxJWdHBryINJBKZjivXWJO
         nJHA==
X-Forwarded-Encrypted: i=1; AFNElJ/9qrKBU6BX/SYbnWdCprXfPJez7cbGBCXvPz7NSZzX3ki+DKJSxo1ybRbyErEgNVgF2kisd9i9gTbaZPja@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp9XiQ5deNM159ou9lPXbdjR6sWuZG7sx9PDNwU/Wo0LmZK97g
	JRu4rKETpwZQXI3nRTp81UxLNo3aPOmugGVZe9xhbT7O/ouL/IoZZsVumQKwy8w1TYI+BJIpzhN
	Lkq4VKsKTNAdIxJE1/gpz3DlftyTRglOCxhN6XLtYL50DqdAmWaduZIzLgGgZFRwEudrK
X-Gm-Gg: Acq92OGVXRFGEMgBOMJ0Qn4l8gz6ZTMJKPt/NlDptvCxM3CRBu3JGOMv8AI3ytz60jc
	f4ea5y9k9oFiX5zPdwKnDkFcCAsqAK7fxQqcnn+rn3N+a1+yfVfWIPE1dp35iCRD8LftLhgEKZK
	h1tmGDj+tQXPkaPhP4DjKNdfRyOQaep4kB+85iseoG3zhpnlNjv37+SrGmeYrPlhdwSRWtdCmjm
	Ry3QwQL6QbtT79DOVN43F+TgNBlGUA5/PMLq4vAZrY/+myr5UTM+IN7pRwwNC8zh/pDQzGQAZcN
	0dWCDY1w45KLFqoX0xjY0E8mtJlISjAwEMJ0vyrvtwAfIYYWI/tOceC4+kBP1EaF1KpgZ3ind+e
	+d/nAOAaypQKEwJlbPjFzhvkLwh3ZGdUEBMbqRJb6DAYswYru3WGUYxvCkxm3
X-Received: by 2002:a17:902:f543:b0:2c2:27be:39a3 with SMTP id d9443c01a7336-2c227be3b4fmr113831885ad.29.1780926290261;
        Mon, 08 Jun 2026 06:44:50 -0700 (PDT)
X-Received: by 2002:a17:902:f543:b0:2c2:27be:39a3 with SMTP id d9443c01a7336-2c227be3b4fmr113831305ad.29.1780926289645;
        Mon, 08 Jun 2026 06:44:49 -0700 (PDT)
Received: from [10.218.33.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f88473sm200506985ad.25.2026.06.08.06.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 06:44:49 -0700 (PDT)
Message-ID: <0ded611e-1932-470c-8e80-9a5e94268583@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 19:14:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
 <1b5ef5b8-c9f2-4eea-8040-22c1d704b529@oss.qualcomm.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <1b5ef5b8-c9f2-4eea-8040-22c1d704b529@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMCBTYWx0ZWRfX4HbGCJ5qQLAA
 bvicYIKmU4VL7+IKkY/isRBrnJvf/70ei1ZeXCjrA6zrDeRTxfI+zJNNCXMmCaAAm2zrj3gP/4c
 Mmh8PMbD3gT32G1oMxOyAgCJHdNjqOH3UYMfQEiK8DdvyqWwqQqUGVQ09zWjBb96bEBuN0Sg7v5
 eTgnvjh+G5p6/Bg9vJxs2oDqANLSGSOdZRrNy+J0auoyXXQieUAfvCuHQUMLh829R//Tm0fMhYI
 1o8d8sXdFhb34P2MLJhxJVBtEq9ElaJYfK8OmXR3GISLqZrnYplsAoV8nq83uVeOIR54Cqd9LCs
 yP5ZjPMpSVMWRwf8t2JwgHLcpm1sTy5d4vvMvTTfFke3NtxBdMKCrHoDw2Mo4Ka7XYejSq3hZ1h
 jSVZEkQGhNk4Qjzh/Ja+uelyvbEW2v1NMyaNUMXLn2C8TD9BA4sG0AiRthaEh6g6bmyql+9zLPL
 AAb/qhoQWKUyujJU5XQ==
X-Proofpoint-ORIG-GUID: 8So1FxnPEXAlAhotBCmM2Z0Vln5uZsVT
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a26c752 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nHMyhPlvQ-XDY_K2CzoA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 8So1FxnPEXAlAhotBCmM2Z0Vln5uZsVT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111898-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: D8B01656C5F



On 6/8/2026 3:22 PM, Konrad Dybcio wrote:
> On 5/26/26 4:42 PM, Bibek Kumar Patro wrote:
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
> This is a list of targets that happen to be supported by QLI.. but should
> this list not contain _all_ Qualcomm SoCs, or at least a much broader range?
> 
> Perhaps
> 
> if: properties: compatible: contains: qcom,adreno-smmu
> 
> ?
> 

As of now platforms where the issues [1] getting reported are added, the
list will grow.
<We still have to evaluate and test on other non-QLI platforms hosted in
upstream [2]>

[1]: https://github.com/qualcomm-linux/kernel/issues/297
[2]: 
https://lore.kernel.org/all/a437f9f9-3560-40f8-85ea-35433e33c428@oss.qualcomm.com/

> Konrad


