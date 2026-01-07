Return-Path: <linux-arm-msm+bounces-87964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79825D00566
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 23:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DD6B30191AC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 22:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3206D255F57;
	Wed,  7 Jan 2026 22:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPdQIeoG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VxfOIEvV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D73713D539
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 22:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767825416; cv=none; b=uIv5qoxV2v0LVpSqF1g1SH9hb+JD5U0q0zkfyXMTnlyXnNg9Bxn9P4mGyO8GfVvgqsIhb6yAibEvGPxJ2U2bAci+IGYHc1KOAEvP9zK+Zrx9RHzJqpCqWHA/SBKRCRW1s6bLRITUSvFWMPo6RMan3PxF7FM21ZaWAtphkEnY/sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767825416; c=relaxed/simple;
	bh=zdQPGIU6srXFl2SDsNLm+yfUDwwBi2pK/Cflx35wFlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K+4eumPHxz/0j7dZQTjpC4GKiIirz/yIDJhY3TtzLOrRV1djM0qNMalIUdJ9psHYaDF68+0VLrrMIrXepOnALIkCYNwaVmD2xvUl7Ek8DT7W5dUVEd/Z9l0rqc9cntyIbXdZWDYlAzvmx5jcLP1N8aqtZgZXDwjZ27VuCO4eLUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPdQIeoG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VxfOIEvV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607H7YOT3672825
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 22:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s48bYb8nQK4bfh2YY2wiWgsLUCc96ebr9E+hh4fT5OM=; b=BPdQIeoGVcPEiUXt
	hctiBGcEQkXi1C2zHgqkGaLl4XuCDEjgmtc1W8SL54bbjgAUc+lF9WgYNZQ8r0UK
	BdqQ2QkYIVxuYt7r6gp7aNL6YSMuP5N6qcvMQ/osFLHG81yoKO3vD+zkgUIbdYIB
	ED/EUVKyB1VQw5VLl1OV4kTUogKfAuDwtYbJprmGKiatamJ69AS1VvE5uuLX+JAP
	fsJ3DpKdFN8IyUQbtaNkNjRtBPrArmtNguQRaKBtA6aCjLKGH7kesWlQ8kgVB/5g
	2IBw4HsIrzr8YwxfKTPpBAZgvCdkWEU++BYzv+ZnMb5vZxlctmYZ5JRPAASMB8q2
	bKKHhw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhum50w42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 22:36:52 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-121b1cb8377so3087657c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 14:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767825412; x=1768430212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s48bYb8nQK4bfh2YY2wiWgsLUCc96ebr9E+hh4fT5OM=;
        b=VxfOIEvVyO/10EhLWNTSm8UigyWkKDQOsGU3htLr97dUwIrQFHKPQYR+usOXT6I+o7
         uFb0ZQ6xnFXzJY+XSQk3JPNGpcVFmEq3EvAWZ9FsESLvM7Mtx5JvNo2Ly1LljQCCWO6C
         SNPzj9+y27zACDEKo44h7peUWCcHN+xnH7nntRBmpYEjoa1ml8+6Vy0zI7bXpn5Kuh49
         exLndTxIwWunQpPG2woHofEsFKTAgY+XrYX6MDZmXFrNoYIvb7nsmCOEDmDmcgiKTXqR
         G5GmdUADmVH/zItb0yHUaZuTNoFZtL85q1BaljBy90flgX8IRCUj+r3+GdGNbKQ+r/pa
         RJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767825412; x=1768430212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s48bYb8nQK4bfh2YY2wiWgsLUCc96ebr9E+hh4fT5OM=;
        b=pTpLZSGkPwFPohTO1OSMmAfTlONESj3Sq9xPU/x07ROt4VeC44SiuMJoHU5yuhLhbP
         5U4ch/uC9a1ssyV0POQ+aB+W+E5C+kfeJzV+smlI6Fi0/kguHwSdY83eKzc4h+xpyO9t
         luyVE25HhUJFc35oGj8aWzUyRbIKZLheazFBU+Iv/UAcKZxzIz0HOsAuuA0Bz3OLTgp9
         5gevpnhpd5AWjQq4QFJJUllv2aCI31agxmtqFjvlBngOeem/TZs8bD715b+o0Pj0qZHs
         29QkRf4A96DQcMhc/m55QK+A1F1yVxSsIV554cnUArCVo+SbXafxqESydzYXkvcPgD8P
         p6Mg==
X-Forwarded-Encrypted: i=1; AJvYcCV4P68WwaKzHIpHW644IOykQ5F9yKsXwHQZLQtuf9Wq7aOQysuEuHh9xSw8CSk+WqA3rZirtMAfQa80RDYo@vger.kernel.org
X-Gm-Message-State: AOJu0YzCtM6GT3Zv2Axp22QYA2A9t4lmeVaVs7FJPj6xCKGDiXJd4n/u
	AsdP4M5q4/1lJnSwJIIek+VgOE/MtgBkuzqyGLMrLqKKDFHMbTU/SKSEYTt86zY1mY33LdTQow3
	AXC8cB3Ir+808rX9q7MuY57zHKHT6RqS4EpFjdgcQ4B14W8PvamQIrrt0fiOYv30ri8o4W5iMmU
	aJ
X-Gm-Gg: AY/fxX6R04mWO/L7GX2nkisB2LFG1wp/nSNc+OAceCDrGyFx+grelQF2ApE0oJHuzK1
	lU0Qk/FQ2toy/RirsD67eTtC+99Tyr/QIPb0liRYNt0jEvqjjgakKLFvOPD9ChBROC2f1KSA7Cs
	y+dpetwbSXbkE52HZ3wNDQnyr1G9TlG7RS3dEsZOuVfbM7AU1pr1MSUOwMAUxHSkoEpRxHSXANe
	P1jNujlVI42QdNtRI9695ykNxj6kaYWi941RAaH3H7uEERYytJRl3CesxSIrGDVuEbT5nJWaaCy
	scVd3wH3E/H+/qS7Ywqc03ps+W6TAxuJqIY66knzrv+psqdou3cYfuK/n6BDW/Nw7OpFfQPA8o9
	ZIQEe1O8sTUsWdCnIFaYfyVyRB2BDKK8SD7qk2B8qgFulr0PgO74yjnR7pg1L+/pGPtN7jcSbCU
	k=
X-Received: by 2002:a05:7022:428e:b0:119:e55a:9bfa with SMTP id a92af1059eb24-121f8b2f7a4mr3355511c88.22.1767825411490;
        Wed, 07 Jan 2026 14:36:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEk+ZDESY2HrWZjH4V5H9CRBBHsFoWUbFbS34q2BtcxhTvlqzPxQC7xNIuBcxIHIxd53WbMpw==
X-Received: by 2002:a05:7022:428e:b0:119:e55a:9bfa with SMTP id a92af1059eb24-121f8b2f7a4mr3355480c88.22.1767825410906;
        Wed, 07 Jan 2026 14:36:50 -0800 (PST)
Received: from [10.110.35.210] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248c246sm11464090c88.11.2026.01.07.14.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 14:36:50 -0800 (PST)
Message-ID: <aa2cca7d-3362-43c4-9af7-94f277b16793@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 14:36:49 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 Kaanapali and Glymur compatibles
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251217055655.638594-1-anjelique.melendez@oss.qualcomm.com>
 <20251217055655.638594-2-anjelique.melendez@oss.qualcomm.com>
 <fcb65bmrocuyapp2hocfzxuufa2ttgv7sf4ip72yybbefm65zb@ojka5lpo7iuh>
Content-Language: en-US
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
In-Reply-To: <fcb65bmrocuyapp2hocfzxuufa2ttgv7sf4ip72yybbefm65zb@ojka5lpo7iuh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LZH9yNia5Bu-gusPJ_dag-XMkt1CY0NI
X-Proofpoint-ORIG-GUID: LZH9yNia5Bu-gusPJ_dag-XMkt1CY0NI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE4MCBTYWx0ZWRfXy3MBepLyYDi1
 w2Zomy0tEuoXGUI0+x++bbi2uhHJXE7VmO0thktxGbkXEYpffNF3m/7CDTds0xY2kRjtpguKwgF
 bU/WyDXE6QAQR7jLbnkcfu8YxTyoLOcrJUKQ4QJwkM0YnbBE0vSY935SCK46QuwJiXfbR/LOgJ6
 PAinS5+84WEblGQivrT3HbQbw/OpsGTZjmXeGVZLNLxpk66MZyYJv5gEifA44hJ47fDMjh6UY7/
 QC+ZSRy6adIOHCEPjFhK3ilc9yFmjJMgG1+GuHd/5DT96+HjWr9MZomRqmsCfAl9J0E+nZOeABX
 V9jJCYzGs3xJqPJFySrpGurESAwceuJIj1mqFGPr9K8OlqhcAAKQj9cgh/lTzPEnjKnWpHuC5E1
 Y4/Nq7IpqnXQmeY4oTfoRSyd80lyNoeKmaWnbwSNAybsw5ktUnRMQfDhXVLGeqSxrhnCVrrWNGu
 zuiE1sKZCrZPBoqqFfw==
X-Authority-Analysis: v=2.4 cv=KNZXzVFo c=1 sm=1 tr=0 ts=695ee004 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QNQF4Q_P-Kout8HRHy0A:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_04,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070180



On 12/22/2025 11:42 AM, Bjorn Andersson wrote:
> On Tue, Dec 16, 2025 at 09:56:54PM -0800, Anjelique Melendez wrote:
>> Kaanapali PMIC glink platforms support features exposed by the
>> SM8550 PMIC glink interface. Document the Kaanpali compatible
>> string to have fallback on SM8550.
>> 
>> Glymur PMIC glink platforms support features exposed by SM8550, 
>> X1E80100 and Kaanapali PMIC glink interfaces. Document the Glymur 
>> compatible string to have fallbacks on SM8550, X1E80100 and
>> Kaanapali.
> 
> But while the Glymur PMIC GLINK interface does present (almost) the
> same features as SM8550 and/or Kaanapali, I don't see them as
> compatible. The protocol is different and if nothing else, as shown
> by patch 2, the life cycle is different.
> 
>> 
>> Signed-off-by: Anjelique Melendez
>> <anjelique.melendez@oss.qualcomm.com> --- .../devicetree/bindings/
>> soc/qcom/qcom,pmic-glink.yaml     | 8 ++++++++ 1 file changed, 8
>> insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-
>> glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-
>> glink.yaml index 7085bf88afab..302b338e7012 100644 --- a/
>> Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml ++
>> + b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-
>> glink.yaml @@ -37,12 +37,20 @@ properties: - const: qcom,pmic-
>> glink - items: - enum: +              - qcom,kaanapali-pmic-glink 
>> - qcom,milos-pmic-glink - qcom,sm8650-pmic-glink - qcom,sm8750-
>> pmic-glink - qcom,x1e80100-pmic-glink - const: qcom,sm8550-pmic-
>> glink - const: qcom,pmic-glink +      - items: +          - enum: 
>> +              - qcom,glymur-pmic-glink +          - const:
>> qcom,kaanapali-pmic-glink +          - const: qcom,x1e80100-pmic-
>> glink +          - const: qcom,sm8550-pmic-glink +          -
>> const: qcom,pmic-glink
> 
> So this would then result in:
> 
> compatible = "qcom,glymur-pmic-glink", "qcom,kaanapali-pmic-glink",
> "qcom,x1e80100-pmic-glink", "qcom,sm8550-pmic-glink", "qcom,pmic-
> glink";
> 
> Which tells the operating system that it should use the
> implementation for the Glymur interface, and if that isn't known the
> implementation for the Kaanapali interface, and if that isn't known
> the implementation for the Hamoa interface, and if that isn't known
> the implementation for the SM8550 interface, and if that isn't known
> the generic "pmic glink" interface.
> 
> So, in an operating system that doesn't know how to interact with 
> Glymur, you have stated that Kaanapali is a good second choice. This 
> does accurately capture the soccp behavior, but looking at the 
> individual functions we're not compatible with Kaanapali.
> 
> If we're in an operating system that doesn't know about Glymur or 
> Kaanapali, you're stating that the Hamoa implementation is good. I
> think this is accurate for several of the features, but the OS will
> forever wait for the services to show up.
> 
> Etc...
> 
> As such, I think the appropriate way to express this is to add two
> new "top-level" options:
> 
> - items: - const: qcom,kaanapali-pmic-glink - const: qcom,pmic-glink 
> - items: - const: qcom,glymur-pmic-glink - const: qcom,pmic-glink
> 
> This establishes them as new "base compatibles", which can be used
> for derived platforms, by just adding the relevant enums. The
> alternative is to add them to the first item (enum + qcom,pmic-
> glink) and then as soon as we have derivatives we split it out in
> enum + kaanapali + qcom,pmic-glink or enum + glymur + qcom,pmic-
> glink. But I think this would be cleaner.
> 
> Regards, Bjorn
>

I agree that it would make more sense to decouple Kaanapali and Glymur 
however I do have a few follow up questions on how that should look in 
the pmic-glink and glink aux drivers.

1. In v2 we had tried to define Kaanapali and Glymur separately but in 
the pmic-glink driver they were sharing the same data since they both 
have charger FW running on SOCCP instead of ADSP. Krzysztof had 
expressed here, 
https://lore.kernel.org/all/01f419cc-3236-48b9-bd51-e7db07d1e6fe@kernel.org/, 
that having separate Glymur and Kaanapali compatible strings but then 
having them both point to the pmic_glink_kaanapali_data basically infers 
that Kaanapali and Glymur were compatible. There were other issues with 
that binding so I'm not sure if that comment would still stand in this 
case if we create new Glymur and Kaanapali base compatibles. If it does 
would it make more sense if the pmic_glink_data was instead named so 
that it relates to the system that the chg fw is running on?
i.e
{ .compatible="qcom,glymur-pmic-glink",.data=&pmic_glink_soccp_data},
{ .compatible="qcom,kaanapali-pmic-glink",.data=&pmic_glink_soccp_data},
{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_adsp_data },


2. With Glymur and Kaanapali separated we would also need to update the 
UCSI and Battmngr drivers compatible string lists.

In USCI driver we would need to do:

+ { .compatible ="qcom,glymur-pmic-glink", .data = &quirk_sm8450, },
+ { .compatible = "qcom,kaanapali-pmic-glink",.data = &quirk_sm8450, },
   { .compatible = "qcom,qcm6490-pmic-glink", .data = &quirk_sc8280xp, },
   { .compatible = "qcom,sc8180x-pmic-glink", .data = &quirk_sc8180x, },
   { .compatible = "qcom,sc8280xp-pmic-glink", .data= &quirk_sc8280xp, },
   { .compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },
   { .compatible = "qcom,sm8450-pmic-glink", .data = &quirk_sm8450, },
   { .compatible = "qcom,sm8550-pmic-glink", .data = &quirk_sm8450, },


and in battmgr driver we would need to do:

+ { .compatible = "qcom,glymur-pmic-glink", .data = (void *) X1E80100 },
+ { .compatible = "qcom,kaanapali-pmic-glink", .data = (void *)SM8550 },
   { .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)SC8280XP },
   { .compatible = "qcom,sc8280xp-pmic-glink", .data = (void 
*)SC8280XP},
   { .compatible = "qcom,sm8550-pmic-glink", .data = (void *)SM8550 },
   { .compatible = "qcom,x1e80100-pmic-glink", .data = (void *)X1E80100},


I'm wondering if instead of making changes to both the UCSI and battmngr 
drivers, does it make sense to just add a compatible for X1E to UCSI? I 
briefly discussed this approach in this response: 
https://lore.kernel.org/all/481ec137-87cf-4448-99e9-4a1477f4854d@oss.qualcomm.com/.
With this we could instead define Kaanapali as a fallback to sm8550 and 
Glymur as a fallback to the x1e

Binding would instead look something like this

--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -29,6 +29,7 @@ properties:
                 - qcom,sm8350-pmic-glink
                 - qcom,sm8450-pmic-glink
                 - qcom,sm8550-pmic-glink
+               - qcom,x1e80100-pmic-glink
             - const: qcom,pmic-glink
         - items:
             - enum:
@@ -38,12 +38,18 @@ properties:
             - const: qcom,pmic-glink
         - items:
             - enum:
+               - qcom,kaanapali-pmic-glink
                 - qcom,milos-pmic-glink
                 - qcom,sm8650-pmic-glink
                 - qcom,sm8750-pmic-glink
                 - qcom,x1e80100-pmic-glink
             - const: qcom,sm8550-pmic-glink
             - const: qcom,pmic-glink
+      - items:
+          - enum:
+              - qcom,glymur-pmic-glink
+          - const: qcom,x1e80100-pmic-glink
+          - const: qcom,pmic-glink

with the UCSI driver change just being:
   { .compatible = "qcom,qcm6490-pmic-glink", .data = &quirk_sc8280xp, },
   { .compatible = "qcom,sc8180x-pmic-glink", .data = &quirk_sc8180x, },
   { .compatible = "qcom,sc8280xp-pmic-glink", .data= &quirk_sc8280xp, },
   { .compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },
   { .compatible = "qcom,sm8450-pmic-glink", .data = &quirk_sm8450, },
   { .compatible = "qcom,sm8550-pmic-glink", .data = &quirk_sm8450, },
+ { .compatible = "qcom,x1e80100-pmic-glink", .data = &quirk_sm8450, },


Thanks,
Anjelique

