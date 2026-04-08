Return-Path: <linux-arm-msm+bounces-102325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAxCLPNU1mm8DQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:15:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 733F53BCB1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 15:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B104B301BEEF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 13:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D73E2F39C2;
	Wed,  8 Apr 2026 13:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PmmZi6a1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZUAPccZ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB442F3600
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 13:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775654126; cv=none; b=aLf0yDva79czjDrw5ktHGOMc1/OJ+oL/QHFuxrRVvfTxe5dqTi87V3ZYjRvaNLQMWcRgdiNm+HqVWZRLM8srPAQrjnk6IlAEVx688itnmUcr5E40zMtiaz21B4PtAvzC9xTYKZt4nwjPe7DY8qA5o7ltDea8z7BHrvM3HT9woRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775654126; c=relaxed/simple;
	bh=WKw2b3FSwa9eQdiAmEXghTEAkcX11kE2vpR3flmnA3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTy4sBwIWuv/JDe09HJ38Fid9jS+QdVCORnzUz4ELJKJ/XI7OHwmziYN4xyDQanDWv6BwGOm8l334d/dTdww3wd9XEzAVrNmRCXvwwxdoI7lkwWtxDvhFthx/tg3SIziIuHsaQHvtOycgoR+OjyAiLWK5viuUeHpTxfJ7sM0g5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PmmZi6a1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZUAPccZ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 638B0bxO3362809
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 13:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8GEteQTg38VOFlAPveazAOZENV7yVsPAb7+IVYkJJmw=; b=PmmZi6a1fRtGG6F1
	xE1cJN/v0PWX2VTPCVRU3MwIurl42/A48suwCfWyN0lAJxQwagJqVMIDqU69TWk9
	qEae8Wp88HQnb1tjAe3egguHktB/fLH4eHLtKunKQh3KlcCz6CtAW6iQ1gnB+FEU
	fTXJW0BUNaBESfPhbh2tVY/2DaE2XNe0El7JYsqwc2aqBNQxbIfUEEugpNPhcfa+
	bGYGUO1ypZrU0j0yq61VUk6ugO1yehFYZYcsbDk+3mYdZJl4is/sdAqqprBU3tyc
	T6REKmapRK6jx0twW4QbRsphm+TkxKNG7VFA0mJj1xqYz7uq49V6rM6c4i644hrM
	2Syn6w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tkkgte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 13:15:24 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56db538f3a2so259369e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 06:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775654124; x=1776258924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8GEteQTg38VOFlAPveazAOZENV7yVsPAb7+IVYkJJmw=;
        b=ZUAPccZ27Rw6TujKXwe+5VCKUKZP0WdFTdBRyUuGhJvPIEu8QHegqYtaFxx9Romg4J
         I9c3EFPD240BhslcFeLhSSnmF5GJuPiZbZCgU0GNO/Z7+OIWoIEJL8T4lwbNFgoHoMnq
         5Wq1dgnzBXN5mhtJxOB/Lj4H450d1ZhHR5v/Vh6av/P29XPP78LdOk/lZhjFbueAX0n8
         nhXOHtUcHel/ElaLw6lTp+0SP70G7x1GUyovZGV7Qz8C+AZHB/yCDBNUrFMqr6ZFOR5n
         MfrhrpKD7RFN/lDwGDRpN706ruzvB4BsVWoiJ7CYbnQ7HQItkmF223AlldWAN8QiO2Ys
         YNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775654124; x=1776258924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8GEteQTg38VOFlAPveazAOZENV7yVsPAb7+IVYkJJmw=;
        b=qTKcbQ3r6sFqenZEDww4RHRacEnY2HZx9NYryhtpPJ3rp8xyt7/P2phJ6fM0CaHuk8
         Z/mqv4GcCiqjyaR7YjGcdVfjouaWBHred8PPJYF8A4k9329b38Xo6YJHJzvfDnEjkPj8
         10rrQCvc4b5759EStW11wo2tiXquTh6ANFx99Ams4iCVwTHF/mT5aMc8E9hzEKI/ZgfX
         luhqSVKvEgAhJwK0yueK2P0oU81SEYp5RSroMOvTfSSdNtQ9ie2mMPDGOmHZnN3E0b0h
         2lmxKfnHa6TyXbPrtMxSRViGMGziXDSbklF3s+9KTn1pAiuYjsKtwebKvIMTRcQK2xrK
         1Z3w==
X-Gm-Message-State: AOJu0YxeBEuWxJ5ZQjB8vpI0ylgZ6wBMkXVAMirOI4W662zkuPrQ4Ryv
	qhHAmdbNBfw1b5eaRxJfnmUkesQWBR/QyboeGCBl5TfO1qMcQdLPobEuWbDGY+FhBcCxlddTxsq
	7SWX3Fb7IZNo6ZAjEUnxgSRP2i0VYSfIaLET/oSX35gkLJkbr0pHsyJsJk8KfLZGwZ/Uo
X-Gm-Gg: AeBDietZhnX37/mo/dcnu/wdz8a4nVP++6f7ss0jHBkmDNO5JuwsbOpNJta3Q1Y8XQk
	0B/pCfZZGzEFVVYsoBpRhnj60evw4oRJDZjKQgRrjVNcvznRwOEkRLmVhBJw5Hf9kOtAhPFVwou
	aocXWFujhJPeajly9ePSsdauTlFZBaWRA1oEyXVTZNRV/wsiZJ369eaaqNcbayJwjaWzlI4MBEC
	IsGYWpAxzt6k3UmaKCx9/muMIaY511/tPvDi35JdbSm5YAN7n01xSD2fAdhGTr3y+NvpD2u27RR
	lAF6NsqzjDCJ6Xu4YaJv1b3eDHKdV90/j0pp4flT4NSkqEOm1J8B83dIV14dqZ/LKy5NQZYLngC
	b+9Oc7AjoQW0jqIbdCq4U33BuBzgCKTHjLTI7TZXnLX4EBlnAV2crhY3sqnw4mjDq1FlYix+csQ
	tbF+M=
X-Received: by 2002:a05:6102:a0e:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-6079973d057mr455246137.3.1775654123650;
        Wed, 08 Apr 2026 06:15:23 -0700 (PDT)
X-Received: by 2002:a05:6102:a0e:b0:5f8:d54c:18c9 with SMTP id ada2fe7eead31-6079973d057mr455235137.3.1775654123132;
        Wed, 08 Apr 2026 06:15:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217c96asm44670771fa.40.2026.04.08.06.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 06:15:22 -0700 (PDT)
Message-ID: <285a6169-61c5-4230-80d4-795c55155838@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 15:15:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2
 board support
To: Neil Armstrong <neil.armstrong@linaro.org>, jsandom@axon.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260407-rb5gen2-dts-v2-0-d0c7f447ee73@axon.com>
 <20260407-rb5gen2-dts-v2-5-d0c7f447ee73@axon.com>
 <4359bb07-d848-4b77-b1a9-f1c6f53caa10@oss.qualcomm.com>
 <ce9061ea-8961-4d5a-bbb0-b4f50b7e6d29@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ce9061ea-8961-4d5a-bbb0-b4f50b7e6d29@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=drPrzVg4 c=1 sm=1 tr=0 ts=69d654ec cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=h77gEMGJAAAA:8 a=lEVunVoeGWrKdAki99sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=PYyYjrCoJcZo81GydsRF:22
X-Proofpoint-ORIG-GUID: yzlexHjOYXLcBi0korrUYbYfJsf5tp2W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEyMiBTYWx0ZWRfX2E4Bzq/HorRS
 dMGD1hAzxTdDVaZqupgtoeplBactfQQSmn6S8g3A8yiWIveOJawQqd0GY3CG9UFBpo1I8jNUi9J
 EG8v+5TIR1x3d1E+W3AOLDE6pufbWxwA8c2pVVeOQf4Cy9jIqYrDkWNoV0Hp9m40WK1bFdaJNv/
 IFHiiCVkmUWJzyacat4e9J12/6gmSXdKJK5Qb/YKQgmMMwpzEQTIIJdy5t+CQeUqyStkGqV7ELr
 F/0fAJ137t84YVEjSV3cqjQKuuuoWuneX/LVI+u0KD9sR4SaADwwalffc6Dzu92EsgstSM7kB6P
 sdY/0bFBm456Ojg57ElhkF2SKEBdlX2RnlXPUGWPWshZbyERqCLBNpqk8FRLZUoiYpgsLB+5AK9
 bgAR8SACL1aucRedaIRv18GMB35679gAQHGCkWXeoWG4RV8shusL6Np+f1Uco7L8A/Q7LIlTh+a
 2+gWlrdR/qSGrDvjCeg==
X-Proofpoint-GUID: yzlexHjOYXLcBi0korrUYbYfJsf5tp2W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080122
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,axon.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102325-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 733F53BCB1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/8/26 2:35 PM, Neil Armstrong wrote:
> On 4/8/26 11:57, Konrad Dybcio wrote:
>> On 4/7/26 5:46 PM, Joe Sandom via B4 Relay wrote:
>>> From: Joe Sandom <jsandom@axon.com>
>>>
>>> The RB5gen2 is an embedded development platform for the
>>> QCS8550, based on the Snapdragon 8 Gen 2 SoC (SM8550).
>>
>> [...]
>>
>>
>>> +    /* Lontium LT9611UXC fails FW upgrade and has timeouts with geni-i2c */
>>> +    /* Workaround is to use bit-banged I2C */
>>
>> Interesting.. I was under the impression that it was only an issue on
>> RB1 and RB2 boards.. perhaps we're missing some magic register write..
> 
> On the SM8650-HDK, the HDMI i2c is shared with the battmgr in ADSP, causing a lot
> of issues... the only solution is [1] to declare the bus shared and use GPI DMA.
> I assume it's the same here.

Ohhhh hmm.. doesn't seem to be the case on RB1 but I wouldn't
completely rule that out either (maybe something is poking at the
bus regardless of its usefulness..)

> Sharing the same bus between APPS and ADSP is a weird feat... It seems that having
> 26 i2c busses and 212 gpios available on the system is not enough.

That's only the tip of the iceberg..

Konrad

