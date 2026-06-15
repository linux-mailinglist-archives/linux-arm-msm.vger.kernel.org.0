Return-Path: <linux-arm-msm+bounces-113166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A2CYHA/sL2pVJAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:11:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA66868606F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:11:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=d5wJdni5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="hKYPIJo/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113166-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113166-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CE7930221D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713CA3E5A27;
	Mon, 15 Jun 2026 12:07:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C7E313546
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:07:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525235; cv=none; b=lZUcZsUtA7jNeljlj9Ulw1e5zB4LU/n+EQW9u5whu4ydnNnGskOCV5bzKk5qmZpLBxDKwYwkkE+9Zrzpli20uWXzOTNVONXDpjOWlMUG7iAyQNWTqdPyK0HO2XmMsIWSmlAPuz5aeZphOHg/8qOtM++HywonmiNEFZKHkrRSpQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525235; c=relaxed/simple;
	bh=ND7KG3N9MBrMZvVY0w5QREg+dNE6BwwRSSbIcSH9sa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SFBRICcK76AZBDJ+0yRF00fFDg0ZEr4v+xyr/ML4yOkzSPyouVo/HBFtsFzaOLu5BcwQ2D2V+VJ9Wu1xpz8NLJWYyY8eP+2tpImtVydIHzn5px2sZX2fMuT/4tT/lC6TEbB32h619l/AeWSkcf5N1zxwWg7ZV41xqzMT2oPdpi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d5wJdni5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hKYPIJo/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FApbRC151694
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UuSAM3kSZuXdViGtqqiEJCksQHrxoR+infoumgosJxs=; b=d5wJdni5rz04nj0p
	B/sk5reO7L8PiLn/ZirW26K0iPUoli7oXhuOlzTC3TTBuXOG2YN0ppqfWoIfLLOQ
	ZddzEyqB6/OctbFM7QgjpROJvtCNt2CxcrDhnPsvpvk3vKJM+4aW+CSMAwAWX/yR
	tMILsycwUzCiSJPC5r530r3B6lK2CKbMjbEOICIafpZtCRzPV+2CdQzAG2SLKpcp
	9X6mH3jd0rgTc9ffmpgwKPb60fWtxEokNYKDlKyYOeDTJLitCwiOCgLBQBYSs3JK
	R09gZo8/QIQytN1Tmb/94io/OTY4klv0bM4m8+8qWX9LK+FLzVw7ThGRtPkz58t/
	ZjZ7AA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf0jh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 12:07:13 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfd65ab97aso4041824137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781525232; x=1782130032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UuSAM3kSZuXdViGtqqiEJCksQHrxoR+infoumgosJxs=;
        b=hKYPIJo/JbqVB+TVG5X7Cocd1lRtgjnZ3QTvxDhiOhBqhLtcGiQ3LyiR5lLdMelP99
         kUzEFqDX4WfpVDB7vF8GB3DgcH24bn2GxJ8KdL/5l9/yobbEMHJnQfPueLvWJZzKIO3o
         /jLXGGKS1bg9CyHKS5Blrt9gcvTokwJQputikpY0dd7lAVG3q0/thaDTOO03vGd7fQoW
         Hrt5V90mHrv3hXToTtAB80NInc/1sdgPuOH1wnRYrvQ2NHiWeRH5zdEWex6fXGiFycvx
         EnySNNKeMeQ/vIo2L+fOHaSMvLAqhVpKfMs5pF/knzISavc6cQkk3mcuhbtOnavBERC0
         w09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525232; x=1782130032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuSAM3kSZuXdViGtqqiEJCksQHrxoR+infoumgosJxs=;
        b=D4YwqoGwUvXWxjfjV8T8BOSH9bCcEdPCgF3ZD203uBOplcjYeSRHFN35T/wuYxwz0C
         UQXapyKR43ZBioUNWI07QBfk7hOhbPLkQ3CVcR74bSNzSNqrLFMd8Ecng4H9raWjADqf
         kfJDH+EjFUV+58CV6xstUhhENw8xP7260cgEOl5p7ekTXI74I4JGjy8CuLfdGoCvPDf4
         HCu5sIhtigb4e7FZSnRwjT9mBVpf4+M57T8EvOnJ7bAUB7Du86DsHOYMgAMFtAQcZ8hA
         T1wlE+ROYInz9Vkt0wXm3xzg+ztKlRmT7ghNikx9EUDyRTE/35XdBjw6wtqMLLVmlR8+
         Ap+g==
X-Gm-Message-State: AOJu0YzhVqB6sR53YFx9fDagvY/LQcvZV1eNGNlb0XRfpTpRs24I05Ka
	3K3AA20kcVqfxjkNbJYq3wBN1YT6p5iSmlun3nmqesIHFCXrBOdTXK6D/MozpniGV70+WfDCkUz
	/sgFY2tG7gTHNUo3oczLcwzGsjOk2OKgv4QA1N3DcaHz9XM2jOyaLQ+Y/Ygz+n+C4CnDxFMcFxP
	OB
X-Gm-Gg: Acq92OHBatoT12U4Pm16pzsAWmNJ97cJEC+gxT/vMULiZR1WBQabTFmKribVC1ukXlA
	PJTHvmQR/CDELgZiSJiZajMBaxYYs4d1RwFZHlKNFu05JlvAXR2gzo2Ti6EoeokBnacluVtg7m2
	TPknACmg50KS8dPLSWtDNvEqjMQSeGcs57/7CA893cZrgKf99cKUThGXh2wjAXddXiHvuA0gHn5
	FSSkOeVuE6XlPKSOunYVSPATdOJpawel3s5pfvNt0cvn/ZcjXDn0zRMfOUX5p2QPfYjWxAIdvjS
	CSRfOM0VHFS1rvA/m3orlvPs7SLuVXbdhwpzuX10/aXvWljBIdYOSmBz8hd9sKiiZM7lChZZGZk
	nUY9Qq+Rsqb0m1eYRrA+WrqFWDtoFFIwtpVG1LZtj95y1i8vSfSJQKDanuYdhsQg21c87IaVRan
	7DsBCngXUaP7oNUQ==
X-Received: by 2002:a05:6102:570c:b0:62f:3abe:907f with SMTP id ada2fe7eead31-71f5e0fa666mr4734437137.4.1781525232291;
        Mon, 15 Jun 2026 05:07:12 -0700 (PDT)
X-Received: by 2002:a05:6102:570c:b0:62f:3abe:907f with SMTP id ada2fe7eead31-71f5e0fa666mr4734386137.4.1781525231745;
        Mon, 15 Jun 2026 05:07:11 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b0eb:75fa:2a81:cf30? ([2a05:6e02:1041:c10:b0eb:75fa:2a81:cf30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f23fsm33848212f8f.9.2026.06.15.05.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:07:10 -0700 (PDT)
Message-ID: <c85b658c-ea61-4d34-8327-2a0be2618611@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:07:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powercap: qcom: Add SPEL powercap driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
 <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
 <7ea2f2cc-ef11-4727-810c-e32e815bd973@oss.qualcomm.com>
 <8f045340-a6c8-41c7-b1c7-6d9b87b05d90@oss.qualcomm.com>
 <fe5ff2e6-4c54-4b21-be5c-0f06bf0e6696@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <fe5ff2e6-4c54-4b21-be5c-0f06bf0e6696@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a2feaf1 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=qtblmzGj4WCF7b9vubUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: MdnpYOBmBLTlpuuf6hgjh4aM0ohDfuxd
X-Proofpoint-ORIG-GUID: MdnpYOBmBLTlpuuf6hgjh4aM0ohDfuxd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfX8f/Osr1EygC2
 TJq1oxzRhxLVZmtY9iFj8Mkbyeziot73HuIVyyayI/G+E2H9+lNrOizF2ASx+PDkO5GaOtdUgV8
 dHa0Wmwj5Wt/rSrgYguJhPd4aiV6UwA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfXyGXa0IM4uruj
 RESclZ54que4XXQud7oTIEcJVoJd6zFTOURh+ol2vmqxDR11RkWeRprxJpSCFyMtdHar/qmEdwC
 YcTK7p9MLPxPBgmXLaR3VupAYvjHdSfuRCWYKIfsHgIo6o8ggWCXVAH32BwokzgetKeib1Rs3nS
 gnZ8eUw9uTlkPHyagcKezWeBu8/1mMdx2QSEx96jWKvmEehfJu8sfFbDsa3tZ4DFYHns6rppkjl
 6ANIebOEztvv98tzezpSVP45bKLPm5672khO/mv8fn6QEL+2TU6RbMCZ2+7/FLbUclKza8L6jVN
 e7MsA+ij6TPl0KROB+wtG6u8jnWelF79wyZM20HQ/g9veLoxe0uFdT07w5llAM9vsipsliWDDC+
 cV2Z79pMofgBF3Gc82S8hZOlybPOJn/TcnyG8S9GAwavlt1VF1gCdwYrrmHhgfIi8fbhZliE2hp
 lutUxy92Z/bgN0YGRZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113166-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA66868606F

Hi Konrad,

Le 09/06/2026 à 15:31, Konrad Dybcio a écrit :
> On 6/9/26 3:23 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Hi Konrad,
>>
>>
>> On 5/21/2026 4:46 PM, Konrad Dybcio wrote:
>>> On 5/19/26 12:49 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>>>> based power monitoring and limiting capabilities for various power
>>>> domains including System, SoC, CPU clusters, GPU, and various other
>>>> subsystems.
>>>>
>>>> The driver integrates with the Linux powercap framework, exposing SPEL
>>>> capabilities through powercap sysfs interfaces.
>>>>
>>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>>> ---
> 
> [...]
> 
>>>> +static void spel_remove(struct platform_device *pdev)
>>>> +{
>>>> +    struct spel_system *sp = platform_get_drvdata(pdev);
>>>> +    int i;
>>>> +
>>>> +    if (!sp)
>>>> +        return;
>>>> +
>>>> +    /* Unregister in reverse order: children first, then SOC, then SYS */
>>>> +    for (i = SPEL_DOMAIN_MAX - 1; i >= 0; i--)
>>>> +        powercap_unregister_zone(sp->control_type, &sp->domains[i].power_zone);
>>>
>>> Could you try adding a devm_ variant of these register functions?
>>
>> Powercap framework doesn't support any devm_* API, you meant add this support in framework in this series ?
> 
> Yes, this should be fairly trivial - look at e.g.
> 
> drivers/regulator/devres.c : devm_of_regulator_get

Given how structured is the powercap framework, I'm not sure it is so 
trivial. May be it is, but I doubt.

I don't think it is worth to investigate adding devm_ variant now (for a 
few lines saved) and diverge from the objective of this series

   -- Daniel


