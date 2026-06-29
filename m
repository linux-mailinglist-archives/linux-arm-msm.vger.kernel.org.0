Return-Path: <linux-arm-msm+bounces-115031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NYMxLjNjQmoE6AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:21:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2784B6D9FD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:21:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YqsWHR55;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BdhtUZFW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115031-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115031-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AAEA0302A7C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3993FFFA5;
	Mon, 29 Jun 2026 12:18:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1302B3FFAA4
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:18:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735521; cv=none; b=qawVqEreaiB9ng8LXCmmI++lyL3rrE2M7XdBXotM/J6SSo1o3UP57UphL1JhY8nn0zz7vJi78Z7C5UXPbNIGnXk98hODqZthnsyeKzRcE/5auF0qPEP5wsJjzum0yEGxrYBKVf8rjyz4lkOxYmB/ls3YoHk3SWUdqWZc5OuyP8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735521; c=relaxed/simple;
	bh=o32en7Hx2ax50iG1AuxYbjYfAwkfTF+FDEJ2dBWHsGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZyjvOzRXaKmWfFzvHUG4pt14KvE1jLzzVkxeO+h7cnE/R32SksD00W0GGLhGJg8wxC87JBT23PrZQIeO2LFWqLJUiJfjGuJ+HNWzuNlOhLKCq8rXsV1ZFPEIu0VGdgCgwCoEzN3E8jJqk+puoV6t01O3ebPBsNFlXQTvIG9miI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqsWHR55; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdhtUZFW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3Ij2646904
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dTFF2lL8qXXy5msaGXAgnP5dRIvRf4GaK1lLNo891d0=; b=YqsWHR552fGbZw0W
	KNVwft65U1+B9mh01kl7P718io5yknr+9lOK6TWzyNWVv1JaUeCWFmyynW9syh7Z
	65fTjHFKSC2jF10C3N5QG+DDsZDLt9r7Jozk2mmPRgEcmhnPY2u7OiMssb2KR3DF
	wWg9SjMKLifmuJlRV3HLLR6T26d5pUJQwvBnoX+rSNtBQsNlDq6LocqH8d67O/6a
	mDenWNxHYTAOaLNsdRbC/xcoLMSZwiXCp6fyM+GrDPicVhgodnTFt75fNXYxxtqq
	FvkTYFzkVFauQK2cSXqq8KFZuMY5FkgiNMpQeQlfsJPWFI3tYr+9oDu82NIrjHPZ
	dDJRsg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4ts6nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:18:39 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bbcdd9a269so176033e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782735518; x=1783340318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTFF2lL8qXXy5msaGXAgnP5dRIvRf4GaK1lLNo891d0=;
        b=BdhtUZFWhSyA3UowaNUI8fXqp+6RtvjdW3pKPrZ8spWpU1LLKsS9y8e6l7h6q27mvA
         nLMoiiZw6R1gta74ZkfbdFK+v+XF/4WeFRtxvG9S5tH8u6xSa1mkqKyqgAv9DihG+TH3
         3MRh+N4Uw9fJJsMsNK6h0wdo8a3TOj35mQtFfdYkn8wDR0UArqUjIfjnjlHPGhuj73IH
         G2w/ct/PryRFkEbxoNnDAr0xF1XQVSYxozdQZMxCVJsU8Jo5QueHdS0+qxTvq2Eztczq
         gNAaVeV6My6NIFcWMf5UUSazH79NrDKL9EpyeyC0CF5aOY/n0BPsDWJ/bXImkQgqM85i
         CEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735518; x=1783340318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dTFF2lL8qXXy5msaGXAgnP5dRIvRf4GaK1lLNo891d0=;
        b=iMaGv80rDejHcLLrY3jnq3xp+pPNOdNGy0QqOtBMdV3RzmGFaqntbtsP3/IMCb8TDn
         5x6dwo7d01iqvOizAP4abt3h8G26J9da02os+OkaOCoss/HP/b1n7SfsLXEUaeDYuniA
         haF8VTpUDA1oUOV4XoyFkSahyjb22VshWB538vmvmFZbw2A51pC9mHf2K0WGc54OjZUo
         T5OcnaXQqGh04joimuPS01iyDYIS+Hczsd+FldJDNF/Ryq2dqrCzWIZhDhc8lEjB45EJ
         df6NjgeQKjfpaZuzrglvPnqPTCs1OIMjdqXVwmTI9E8riBJvkgggWfFAQcKsRvrxActr
         3QOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjawJOfuEqskv3x7tD4GPtl7sUNdHrZj8G4XFsU0tfNR8jUjS+SjCXw5Wrbrw6KQxZuzbIFRW0vbReUcMy@vger.kernel.org
X-Gm-Message-State: AOJu0YwanObAtGmRvBNKTHGW8MHOpVDA0UO71v+PdwdaJ0HtiPVX8wvh
	Nc3tyV4uJv+aPZOXkfhZghQwyGc7KmcDjpWBInlX2lu05OnwaWz5j4HLKTHKa1KthhbnvKocqZj
	CVIFN4q5ZSQlChK47yy1Waq4K3//7oo4iXFZAwjSY7bZmNGBnMOypaBkyInjX70sNSAI4
X-Gm-Gg: AfdE7ck/xQgLSFXFpyGDKIF5ETUxp3oN75iLP2uHMGfQsKTbzfWQS96Uw0/S14/0DuT
	pG4bihpD/RphrhdG5sLYfE1HatsYK8ztE0surI3Xj/qgnpRtZdrPeRtEePEaB1bNghn9LEPcKUU
	8Vie8cl9A1cUW10XbYR0tpXjOtp8ldh3UauiRs6jYRryZIqKNr4hbNzl2m9ecUztLaLXxIPj2I/
	TW+w3C0Tkr/FAk2XlzBFJFweiqX6HjvGr/V6pryszuxTZyDSFIJDC92zKKTgXbFhSTS0Wh9eEgO
	xHQMLh8KMWkS6N9aJXe7uwzK801s6nN5awsW7s3BI/VHxvC76wgV84DzSUY1tKXsVOPyZYz7Eyp
	NHVcuRkym0AX82DdL9O+e+GQP/81IbWUMnWY=
X-Received: by 2002:a05:6102:32cd:b0:739:64ad:bf4e with SMTP id ada2fe7eead31-73964adc4e6mr249527137.7.1782735518204;
        Mon, 29 Jun 2026 05:18:38 -0700 (PDT)
X-Received: by 2002:a05:6102:32cd:b0:739:64ad:bf4e with SMTP id ada2fe7eead31-73964adc4e6mr249524137.7.1782735517777;
        Mon, 29 Jun 2026 05:18:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69848e5ebc0sm3117738a12.3.2026.06.29.05.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 05:18:36 -0700 (PDT)
Message-ID: <f2c68d67-1b12-40b3-8097-5b863d7710ac@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 14:18:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] phy: qcom: qmp-pcie: Add vdda-refgen supply
 support for Glymur
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
 <8811c181-9caf-4797-8e17-52311702e292@oss.qualcomm.com>
 <akJhrpyMuLnoXzJM@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akJhrpyMuLnoXzJM@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfX58uxxDiIA/b7
 5aHNfogMdFDdRgc55guwq/62+vFeXadjS2gMOT3DfuEYAlY73YuePHh/R19PIRDDTxLTNV/kShf
 MBfhuTe+m4L2CLe/6LEVVV/S1yVCLVzo5ZBokH7PMaAq3OnkAfEvaznwUm5FBbUq92Q7y/Ek7sf
 s5RlueM7kRSZ3IP1tdAVQofmRLBLq+eoJErLzO7ilgrF3uH28oq8SSEimx+MWhrMiSb1pL2FlGN
 NItL7eXK3apy4o7971CFs1AqVyKbairRy7SNLqzVcsuY+rni4pqwbLDlSn2cH7ZZDVqu59+1tY+
 EFE+IV1O4Y1Foed967qsCrrWew/0ssbi00vj9u2j8CGMxBWDEsmH+eRAKaDUeMFBQb6gKC9KIoR
 JWNaLP5wY6fhhds6/H8EejVcW/NsOObjNmNeBRN+qlHcabExHqFGI3y3v9YCvtKYWpiBDKWdBtI
 VgpRZHk7bQn/vTRNw4w==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a42629f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=x4UBAUAyasPmGnV1h00A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwMSBTYWx0ZWRfXzPF5QyZb9f/q
 AhDDXAUm8W6JrMkDCQ2f/hzedTNE0Q6MtwD5TvA/ExVE2hCXf88PjaVfmmUPGdmuLcBHu0ZDmzk
 9tBD2WAaMbFwodw+cQIJCVCJqKhgRD8=
X-Proofpoint-ORIG-GUID: z2zoKod5SoFlT6FyH8365ByL_5SViv0p
X-Proofpoint-GUID: z2zoKod5SoFlT6FyH8365ByL_5SViv0p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115031-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2784B6D9FD3

On 6/29/26 2:14 PM, Qiang Yu wrote:
> On Mon, Jun 29, 2026 at 12:51:55PM +0200, Konrad Dybcio wrote:
>> On 6/23/26 3:05 PM, Qiang Yu wrote:
>>> The PCIe QMP PHYs on Glymur require both refgen for stable reference
>>> voltage and qref for stable reference clock. The refgen requires two power
>>> supplies: vdda-refgen0p9 and vdda-refgen1p2.
>>>
>>> can be extended in the future.
>>>
>>> This series creates a Glymur-specific supply list including the refgen
>>> supplies and updates both Gen5x4 and Gen4x2 configurations to use it.
>>>
>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>
>>> Changes in v2:
>>> - Add dts patch in this series.
>>> - Reword commit msg of dtbinding patch.
>>> - Link to v1: https://lore.kernel.org/all/20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com/ 
>>>
>>> ---
>>
>> Is this necessary (for Glymur) now that we correlated some of the
>> TCSR clocks with the right nodes?
> 
> This patch is necessary for glymur and mahua and other Qualcomm targets,
> which can be verified from the REFGEN page and power grid page on ipcat.
> 
> Take Glymur PCIe3 PHY as an example: it requires two REFGENs — REFGEN0 for
> the PHY itself and REFGEN4 for QREF. In the TCSR driver, only the LDOs for
> REFGEN4 are voted, not REFGEN0. This is intentional: each consumer is
> responsible for voting the LDOs of the REFGEN it uses. Since QREF uses
> REFGEN4, the TCSR driver votes the REFGEN4 LDOs; since the PHY uses
> REFGEN0, the PHY driver votes the REFGEN0 LDOs.
> 
> For some PHY instances in power grid, you can only see one REFGEN, that
> indicates the phy doesn't require QREF or the phy and the QREF it requires
> share same REFGEN.
>>
>> Perhaps this would be necessary for Mahua since its clocks don't
>> require QREF (or we can lie about it and handle them there)?
> 
> For Mahua PCIe5 PHY, it doesn't require QREF. So we don't need to vote
> REFGEN LDOs for QREF in tcsr driver. But the PHY requires REFGEN. So we
> still need to vote in PHY driver.

OK, I think I got my mental model of all of this straight. But expect
me to make more mistakes and sorry for that!

Konrad

