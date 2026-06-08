Return-Path: <linux-arm-msm+bounces-111786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s576FQ6RJmpWYwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:53:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5320654C15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:53:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CtkAdHoJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gDLZqTns;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111786-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111786-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29F6A3004F5A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81FEE3845B0;
	Mon,  8 Jun 2026 09:52:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEBB331A76
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:52:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912356; cv=none; b=e2tHYIxHZ7f7+4yHjaiC9OFeeujTN9uuHcTDJxQixZ1ihnZdhtVQuUMP9f/c/wuJYWGbfvixwyNFmzKoi8+dRhRVsES5dHCmS7gUP3o5CoalSmpPpUc/5ymOXJEsTp2yc2fFbdQgnOfertkgjf3VffaN/UXnY6Jnx4//QB+h0u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912356; c=relaxed/simple;
	bh=vXFLc7V6vTbnZuIPg2XnR5XpGpGE27p+GqG/p8ZIcX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZG0ENFVMKxAqV8aWmNBgW4thAcZyIXrJjWTJk+UoWdsZSyOg8e/IJT/7dCWyVTeXPhAggkya8SVJo59/EC2xt1ex6HlaLz0kYzPEi3SjTAAXRK03uZcyCJjEXN283x6UxWf6bSfwMWQzun1Oq0Nkse1FNnWo8unpG2of0Mls1tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CtkAdHoJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gDLZqTns; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586QrFn2771589
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BZY/vylQEcnHZGwe2yyT0vpoLm07JbP2wAY1l5DhPu4=; b=CtkAdHoJs1PMSPAR
	n73pYZM4cgjvO6Fx6FIB+DKxM3jeaqX5spxHir3YcBzmWwWd2k912vHQsLFmDo2O
	FKitW6k/zsm7NF0ibJmLy0Ke2Fk8xxmO702cMGLdxycXy2TDk1YVQTsa3RgEkgIM
	1ZCGXx6LrGeNKSunZSUfhwvP8HLOOaUn23Ppq8dogUiiWDnbU9VO2/iA3ZR7C89Y
	4rvgewRUS4+itu6TCLYUfr38G1zCO1Lnv4zV8oKQkhSkkEzcA0V8dI6HvvN0xQEj
	3FqLwYquY13XauRDefn8SWxjP/alE7iDpiJhD0G8WaNlaG2ggAWdhzZwOOWfW7k3
	txoakQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6f4ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:52:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915a4ca0a4aso133804185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780912353; x=1781517153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZY/vylQEcnHZGwe2yyT0vpoLm07JbP2wAY1l5DhPu4=;
        b=gDLZqTnsU0Qxzj//eX+tWfXp8KY+qiMpX0PqWWmXR4P0SEL7rg6X/rffnD5ZQpO7tF
         zn5POVwonFr5aAZ+0fdLZgJF94zpxeDuaVskP5HhlIAzz6x6GY54SaN0LMj/7sFyPh3G
         sdY4jqj6HP5tTZxEKEYicHgH8xlbhM7gloGlH/yywRDvxg2Bavwk0p0E4Wg2ar/235gH
         OG8SmX5+0Pmv5yfPDksEe10BOvpSYSpVr3G9B0bhIybjynh637NP77cm0FVg0cg8j4Ox
         XD8dVMP9+DybGDa++RsMbBAKzhUtY4BpDyD2lh2kjiArO1VcLNWAetqhLM6PSQdikdIz
         8aOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780912353; x=1781517153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZY/vylQEcnHZGwe2yyT0vpoLm07JbP2wAY1l5DhPu4=;
        b=IGAKybd15EVrDyV8HK5s23ScUz04Sq7PdtmVT4CHx1lfXr6ASNuwytawqjeDX0LWaP
         rzmpzvvmU0zNr2EbCCH3C1cbvG8aL8Lfw2F0gYOyNG3JGWZlwr/7yAacJPJlEKTghwhd
         Kc1pD3rrjvCav6/sKCnDmhUF7Hni6Z/pPO9PmkrKKz5S3JYsJmK5f3Fz7jglyhprvz2x
         nEFevwM4cpBBtvXY0MpcJa7YyfjmgSAiBagUjqhdHWrMOhyszwQXP629otN85tlhC0DP
         EeSzNbhspJq1/F+z01++ZuUi7JQmgh7N9Ykaf9TyBjya4pNtD8Y96ehs5ouB+gT3QIL1
         qSfg==
X-Forwarded-Encrypted: i=1; AFNElJ/BVYCvtmC9evIWhPWZw5Ccr886wr7JCTFT/zduP10bO2tC0/RMSWHLse7hFaxPGfszaFqwztF5hAZoFgev@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/niHrVCT7SsuVyJVYO7U8XVlKLtDdiBLHJhXUdfKaEp1ecPyK
	2wFSxJXmU9abduZYueGERbsYZQ+5JzR6oLZvQdYZc5BUN3hmjp5woMbN//zeNt1wXNURuZUXKrX
	TW6dys/wNEs46cM2UfvOpK8As+GGbpZPcSREpSpzFTbonD5bs3bPybiZNIO4xR/RCFuZx
X-Gm-Gg: Acq92OFWooUIDnX0zJ2sNGvfVdWF2uZ0zIb37lZ4WHVrrUt4gmnpTnK7mixytIFc5db
	HflS/ZvJemU+BqIuSFe/w3Y7mDUdiUbnvKaiBrpMqzVI11hj1jArtfzv29e08/+Oa+Q6aCv6ymH
	nALwZLDU6gffiJYWZ/uma3HogwGbpHYpdEbEJG9Sl6lFhChSBfNqs/GAMawOxBX0zKLBywTuzPy
	uVr22wUJanOCQGIRQCfFB1fRs3vrpmMUi0RvGgTk5aCEtpqQ6ueEK7i8HwMrjrTcOjJBcjaiwKz
	L8v6cfjS6K5xXEOy2vhqKVrHzRouYCUmUZWXK+HsAWhMZTZYSd8U+ejlirhxsj6Z1/CoSeytSpY
	Be6um4DgVS/IX/ha26dRp8DE91aQvA9vR1B+qqSjDtr6PIS4c7Xw1xguP
X-Received: by 2002:a05:620a:7113:b0:914:ea37:6f14 with SMTP id af79cd13be357-915a9c7736dmr1233793685a.1.1780912353539;
        Mon, 08 Jun 2026 02:52:33 -0700 (PDT)
X-Received: by 2002:a05:620a:7113:b0:914:ea37:6f14 with SMTP id af79cd13be357-915a9c7736dmr1233791485a.1.1780912353127;
        Mon, 08 Jun 2026 02:52:33 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054efd5dcsm852161266b.39.2026.06.08.02.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:52:32 -0700 (PDT)
Message-ID: <1b5ef5b8-c9f2-4eea-8040-22c1d704b529@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:52:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a2690e2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=thcKRG5PhHeBPCh_FOAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5MSBTYWx0ZWRfX7J92vE/qfTLa
 ZvFSSFaQPpNe4GgpcW22W4/tna+eAPiVExewlm21jkkRxr4OWLs7T3EOrb0MixxgsSWvK4GVGih
 YaQj/JXz4K6VLMUXQLjszJwk89rraycbiB0gNHRgHsUFi/5R1axeNkNGf50ZLB6mJI/ESFAG2Iz
 SQKudZAeW0R6XKFbrxSpCYecSsqzFejmsgYdShWgeNMScr4FJejIIHtRw5FMP6Eso+COl8uHaCv
 UpiXJPowZRQ3P/vnaGOE3tYw7cx4cannqwHlt0gUMIr2lTDkTGDqnPeWQADRXc4pfbA4T4/AZ+a
 1p5oZys08Tjq2P+CpDvpc6NRzGh1+M7JiQ73X/5mO5az8ZRQBp0bmQi4risWLS4WlAaT/bE4rGJ
 aR0R+DRgOyIC/CWPbNOWqEhyoYJm+Rtxa24WZYspfo3/3K50QVCkbgAgpyQeQ7+cixNLRIOTGg1
 HUdlZQVRQVMCK+hGimg==
X-Proofpoint-GUID: vUmccWDZuKmgbyEYNljifjsCybq2FzLn
X-Proofpoint-ORIG-GUID: vUmccWDZuKmgbyEYNljifjsCybq2FzLn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail,qualcomm.com:server fail,vger.kernel.org:server fail,oss.qualcomm.com:server fail];
	TAGGED_FROM(0.00)[bounces-111786-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5320654C15

On 5/26/26 4:42 PM, Bibek Kumar Patro wrote:
> Some SoC implementations require a bandwidth vote on an interconnect
> path before the SMMU register space is accessible. Add the optional
> 'interconnects' property to the binding to allow platform DT nodes
> to describe this path.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -243,6 +243,13 @@ properties:
>      minItems: 1
>      maxItems: 3
>  
> +  interconnects:
> +    maxItems: 1
> +    description:
> +      Interconnect path to the SMMU register space. Required on SoCs
> +      where the SMMU registers are only accessible after a bandwidth
> +      vote has been placed on the interconnect fabric.
> +
>    nvidia,memory-controller:
>      description: |
>        A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
> @@ -602,6 +609,26 @@ allOf:
>          clock-names: false
>          clocks: false
>  
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            - enum:
> +                - qcom,qcs615-smmu-500
> +                - qcom,qcs8300-smmu-500
> +                - qcom,sa8775p-smmu-500
> +                - qcom,sc7280-smmu-500

This is a list of targets that happen to be supported by QLI.. but should
this list not contain _all_ Qualcomm SoCs, or at least a much broader range?

Perhaps

if: properties: compatible: contains: qcom,adreno-smmu

?

Konrad

