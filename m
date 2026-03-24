Return-Path: <linux-arm-msm+bounces-99616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCYeOOdrwmmncwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:48:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CB761306B2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DA81C3064D20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DB23E6DD6;
	Tue, 24 Mar 2026 10:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="efSusFmw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W5IalrMh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039C736DA10
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349016; cv=none; b=D5dFbYFxAujwNuTwP3OmdljXBb2u/BYzgo62pOxyk9gzykuy4f9YDfTCB9VWGl5dNMEORSzvVxub6D1SMqW8XvX9nUgu4IZKo4KPtaRdTa1jgbb2yyvjmt0bmQJ750QNu+xkfn0AW2ArVGCRYouy5n098ueT4km8pfNaHF9nEpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349016; c=relaxed/simple;
	bh=JbFBCT8jFnYJL+nZ/KPFkxCkA7Qi+D4qGi8jvZyWkDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/E/k67QYxOfjy6rEhQ83gkZSDp7tdCkpeL+6bphE3QoBb9ysjWtPJEY9N1pHU65HjpLWlHwpTgYkdnvk0nZUxd80qldu1tcYEkE9zbqDWzcvPi+PdLjkwJwZnv0taRa9ztLJvdu8b4tTYkw4v3DfifPPPv7CfHvqnlLWTK6rBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=efSusFmw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5IalrMh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OA03Bn4059466
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DjrQ4N3C4WGKmVnqtVQBZ0cZ+zjNbsG3zeFcavLesCY=; b=efSusFmwgP+aFv45
	FpvY/zNPMqMLSkCMiIxNzFlEdwPMjaBMIZtm5hEkip7P2FBaJ+9aV1COpCrGRSfW
	K8Zd0Ug0I4FzZgpzkowvp+ff9THc9SkGCFrnwYFRR0wu+9DcGGbWPiXCQ16cWrQ1
	4ZCuz9AIo/DNFO60YTPOMHm5mnPzdC5uqeuwMLY78vkxdQ5HZ2u2mX2A6iWH59RN
	6I/kYXe56IYORltCeOmgqF3UfRTOMXa95csSAaKaXNf/hamCS37cNkjKkDbdT3/a
	K9ncYpLIZznX+Vet7vPkNUGPcvFeeNtwEKma0PMlEM9y23UMoMf3Csnnim+kj3KZ
	C/NdxQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jsksgf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:43:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b68af943eso8013811cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349012; x=1774953812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DjrQ4N3C4WGKmVnqtVQBZ0cZ+zjNbsG3zeFcavLesCY=;
        b=W5IalrMhQ3cOEotPm1GrpXolr6zUPEhUbIFHCSfdT9sFDcZtx2LimbUdH+wAXkIybn
         C3843uEgetK4hwXb7sAIYAbZpiv8a384d/xSl3u2+/ptI57IXV7jalIyfy/2/eLiYzlI
         J6LHUdGxe5pflvP8zpJQw7lhu0oHEHd/RkWW3UDNREUF3kLw9XE9d+J/sgIsqJE+yVRb
         MVAv6IdeHon1XYiGChM2pn60Sn2jlqizfMDnufgo1hB/Xk+5DzfsEkb9fdIj9lmjZNmU
         qaSU4rRKbSf5P1YVVNu6RPZ2z3b3oIngOf++VcknaDeAXGrNEqfY46yjSpuZvz3cZP30
         fiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349012; x=1774953812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjrQ4N3C4WGKmVnqtVQBZ0cZ+zjNbsG3zeFcavLesCY=;
        b=UT3DosUv4VIbmUDbqbZIVa3U4HrJEI9X4Fl1zeaoTmsAEOIrbZx0adqp0fWZKiQHbc
         aM1yu82XO0AMpLS4rtNYueHsGtjPs7efNZ24RH0X7/HpQQBTYo5sjOBIjiAtzA4Kmi4d
         kCjS7dwFGlWk9WoLGwR9bZ6oP+2hISn5eIu0nx2tRV/zBwV27CVJKyT5ds9XuxZ8MaNS
         V2EWpqfRCMZEOX8pHCTAwtX6hgq1E+HBHExOBXr0zkkdUIz1DQk9e1rOd573EZnU/wlI
         1aJ1WXYh7n+6KSgN1neZ83xlPsoB0PzzDmwUrnoeL3ZPetX2ZGP7PJXRb2aZxcOprPHR
         c1yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZsL+WuwQH2aaspa2+iDYfliaWP0TaX/Bw0F8ZuoG1caHta2afjSiPzxPmNaljefqDYM+gf6INUaENf4Zm@vger.kernel.org
X-Gm-Message-State: AOJu0YzzSzjj4Z5062iTMpzQ9PwnnylVqK2d26gAZjG7BglMtVCae621
	+DJBBXXpFAeGO/Ns/eWN3huJwvJLL9ikdHFko0oT4c+8d1z9aW2rNjnmzopDgt51Ik2smKX84VQ
	dd9kJpsti/BZr4REgiV8mzQsZurmpXT11b54Or8JFpWSw0jt6p4+NzwioK3JTFtUoqgRu
X-Gm-Gg: ATEYQzyeWlyFjYI8spE0GNuADSvZXa2dA0Nd1A5/NuolddJHctouvgG5p2lwv5YtxdD
	8ql4zqxdYhKlyMuWUllUoV5tIAbKVXhdHVX4G3dTZhDRIpgigV3MUiwT9umKKUwcMryuwK5sKrh
	/Zz1YISJqPontS1kzwRumaFS7xCb3xoNceh+TZfLwLArBKLM02wdE8UHTNKt4vkb1k4HrXt9DEv
	NEzRPey9u8EW9bPuCogjMpfwypXMqS3qRj9X+dW1/UFH3tl6Y6t2ZcBOm2v3VZPvB9xq290n5lE
	WYkzfuulDs0VQwDoduvTApRgp0ig6Gq2K8sjfMa+/6wh3eyk5itPPgow10nFXIUmzAQhHyhjJX0
	VlHwpN3juCeOoGV9Jc0HR49mEfho5UQ0B3UyDU7p6SFY+IaV0AMeAJ6fNRbg5xVVWy55FJZKJ5Z
	r4nWc=
X-Received: by 2002:a05:622a:19a0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50b375a6081mr175375161cf.8.1774349012010;
        Tue, 24 Mar 2026 03:43:32 -0700 (PDT)
X-Received: by 2002:a05:622a:19a0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50b375a6081mr175375001cf.8.1774349011548;
        Tue, 24 Mar 2026 03:43:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f42c8fsm613885666b.9.2026.03.24.03.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:43:30 -0700 (PDT)
Message-ID: <33f95784-7ae2-4ba3-ba85-03505a2c125f@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:43:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] arm64: dts: qcom: qcm2290: Add CAMSS OPE node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bod@kernel.org, vladimir.zapolskiy@linaro.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johannes.goede@oss.qualcomm.com,
        mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <20260323125824.211615-4-loic.poulain@oss.qualcomm.com>
 <76edd04d-7bd1-4b42-bea1-79f4b149c0bb@oss.qualcomm.com>
 <CAFEp6-3R+O_j+g39oegS=WHUTxnF2LzPx0t-C23+PA8zUhCmjg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-3R+O_j+g39oegS=WHUTxnF2LzPx0t-C23+PA8zUhCmjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NSBTYWx0ZWRfX5MrkfV8OR8pe
 fwU4I2BQpP8fWkMyI8bn58xyve1RcaaRmic22lc2R/nk18YJq9E6PZf1CFsaS0usdnVRI6nN6cv
 dRL8fccKTxYcFmemrrhBIdSvzT7WvB5htm6S2t05os9koEHT5trYq5b9F8lQqTxKuhqL3+MY8q3
 eoXmJ5RtQUr74hAj4B9RNcKqCEncoynrwMGpCg9mI7l8fbzjHAOQJVMoipTXE9vCtZLws9f1+4I
 ldfBpAiIZcBEuYwoph8sqBRIVnhE6PRssrCfCDg5rx8bvkBUVoaQwjG+4+i/Kb/cxTzUReMNN16
 aNLmP1Rr991Yr5dnO0dexfCD0caWRCGYWUe3DvbXKZGsNiKcLBI1Caf6vy22TjTTWT7QVe0tFUC
 DTXFlOJDkOtlk2by63RLm7HSNI+mYNe15fETG5QxiVX+kYkMMIVOmQ3nGMKZjbdC//lYG6KIjbN
 hc0wBm12Ks+nFrIOpLg==
X-Proofpoint-GUID: J94n3CAWnAF9oNko8bqdKLUzzvvt1j2K
X-Proofpoint-ORIG-GUID: J94n3CAWnAF9oNko8bqdKLUzzvvt1j2K
X-Authority-Analysis: v=2.4 cv=I+pohdgg c=1 sm=1 tr=0 ts=69c26ad5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=fUXq9ZcRc7bERpTzZuMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240085
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-99616-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB761306B2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 5:31 PM, Loic Poulain wrote:
> Hi Konrad,
> 
> On Mon, Mar 23, 2026 at 2:24 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 3/23/26 1:58 PM, Loic Poulain wrote:
>>> Add the Qualcomm CAMSS Offline Processing Engine (OPE) node for
>>> QCM2290. The OPE is a memory-to-memory image processing block used in
>>> offline imaging pipelines.
>>>
>>> The node includes register regions, clocks, interconnects, IOMMU
>>> mappings, power domains, interrupts, and an associated OPP table.
>>>
>>> At the moment we assign a fixed rate to GCC_CAMSS_AXI_CLK since this
>>> clock is shared across multiple CAMSS components and there is currently
>>> no support for dynamically scaling it.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---

[...]

>> Similarly, in the arbitrary choice of indices, I think putting "core"
>> first is "neat"
> 
> Ok, I thought alphabetical ordering was preferred?

I believe that was Vladimir's misinterpretation of the DTS coding style
(which is admittedly convoluted so I don't really blame him)


>>> +                     assigned-clocks = <&gcc GCC_CAMSS_AXI_CLK>;
>>> +                     assigned-clock-rates = <300000000>;
>>
>> I really think we shouldn't be doing this here for a clock that covers
>> so much hw
> 
> Yes, so we probably need some camss framework to scale this, or move
> this assigned value to camss main node for now.

We do need some sort of a backfeeding mechanism to let camss aggregate
various requests coming from the clients if we want to prevent having to
run things at TURBO all the time, so resolving that early would be a good
idea, even if a little inconvenient..

[...]

>>> +                             opp-580000000 {
>>> +                                     opp-hz = /bits/ 64 <580000000>;
>>> +                                     required-opps = <&rpmpd_opp_turbo>;
>>> +                                     turbo-mode;
>>
>> Are we going to act on this property? Otherwise I think it's just a naming
>> collision with Qualcomm's TURBO (which may? have previously??? had some
>> special implications)
> 
> 588 MHz is categorized as the "Max Turbo" frequency for the OPE core clock.
> At some point we may want to enable this only under specific conditions.
> For now, the OPE driver does not make use of this property.

Fair, we can always get rid of it later if it turns out unnecessary

Konrad

