Return-Path: <linux-arm-msm+bounces-117844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NxV6Mec3T2o+cQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 07:55:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C72F72CE9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 07:55:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ze1fMsuR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Miuv8mri;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117844-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117844-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C3D4302EAA0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 05:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1AC3AD507;
	Thu,  9 Jul 2026 05:55:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EB1372ECD
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 05:55:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783576549; cv=none; b=THOEu6vik74CEoObeRotyGIzxG6InM14V1PaVkxxUghv6CqZJIonWg2zivTbYCX9fhGcrfmmF/voMl/K8WVraxoEfvKs+aape/Saca9HV9VK84uuvPMlZeKZyWOTVfOZTUtIfh19L0jre/KtQo7Lw35H2VJYFtospDTT87SnG/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783576549; c=relaxed/simple;
	bh=sXgLEOgI2SCOJhE/tWVh0lCN5/y6oBCIOWbl2fyUefA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R28qhXk/meaGTwFPov3OqxYaXVezu9UCpEsRnd5Vu61kS00aQQhFaVV7ufSOfJiz/ACxmyMNZa+mtO4fiAnQR2FcjT6x0sLeGuvgInSVA4zDEj1F88VCIwVAZw/kFkLL2UpmV86zgrBabd+fJZVetmonmQkHWsCo59gwtbAO8wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ze1fMsuR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Miuv8mri; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66954Awu589938
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 05:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2SdAfcm2bDQkGugOuxGblXVTFcWe/K4asZRKOKIZkDM=; b=Ze1fMsuRHeyn4W+1
	YlNA0umD9w1RYyTxkpudsWTLeSj41d9e84zXLDUs7viAdwxrEhh2WYMHBFVNifIE
	Ovoz1mrUgyDnS9fHEZTzq7xBFlHc09jTvgQiopbi2Wbi/80trFxWhuQhTwjmMt3j
	9QwTLRz79E4OHy2wHH5erokMvSdFOQXIhbjEZw+vitdotq5aA3BaqwHUI5mIAa5O
	wHqDOfueNVyP8oceBmnYhzm+QM+1lO3MIjG/OjxQ9NSdXs+NW8oiXMWcczfuWSAF
	I056P3DAF7oMcrlALedj+HiSweMSOEI4iVmDWOEns0xpsGLjsLEedmzInBCaPVTB
	cxztnw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vg5k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 05:55:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c890bac374eso2035664a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 22:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783576546; x=1784181346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2SdAfcm2bDQkGugOuxGblXVTFcWe/K4asZRKOKIZkDM=;
        b=Miuv8mriS0v965ibXFgEV/if3lXmWgpISmlSeWEdZa2zvWS1eM926/Qw7t3rRdp3XC
         swJpHkJokTtOhjDxHTYQYkkIlQ+piEy1V/+N770m/7HhAEYgsOPjViTqv9hg8CSIYcpd
         mPwtqa0CtVbMhOqgMMgpErRnf1u4mUclRpAuhwIqsZgC3R4I0fSb2FRW5NiGfUN/QSDY
         B2dg3pYN4xn7/3VWQvI70Gfx7381HodfZ4VV418QigL8kbwVARQyVoW4lRVxOirwzFRj
         TQdGW7OMRfDWsSV5dhlyoqPSYbE+D+Mrw9rmZUQjrhkfr99TRpKBeS+8rQFrx7RNSjUA
         nfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783576546; x=1784181346;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2SdAfcm2bDQkGugOuxGblXVTFcWe/K4asZRKOKIZkDM=;
        b=ZqY+2nGMfNSHU3eFFD5lWTrsVVX/7wdzOymOqUjxf/uGObVrFBC+pZG6VUYHFoULun
         q8YKDi1gTXku4uPo8z63bNzfmtNMgi8rM6Nwj5Loywaw2Q1TnLqJDXu+PtPNuT382m1j
         2JcfutAA+qFWJdE8mFPunX0K1B4UwWIu/7v19mqfeiEU2u/zZozzBuCQCI/1h9p9JfBo
         9lBMPGivDPepq460aISUFw2q0/yNztc3eHsFMftGSFnd0IM0Lml16znhhRuzg//E2TGF
         +6OPS6DFle3cCEzV/NFcGkBWL7wMlkTpHcOxPaLIYufSN06Y8Ti2qNlyQMABAIPfwpcz
         2qjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqM3DAWExCF4k7J8L7pg69nlPGFDCqgTumjLPouKZGTFxExIdMYt3eBqY7W8jYlrYzWeMJmSJNl7r9HDGxe@vger.kernel.org
X-Gm-Message-State: AOJu0YxERdEmsK8rpDzcYmsTiFQQUzZsQ3xDIycndhuri7Q9i/1C8lnK
	EdKY4E2f9Z/HzBRS60wdajzp3SFcUhTC4GIjUZB+OhLe98jQ/JIrUTqHZq0xvF4nfYP2iLOaY9i
	PxH9iHpRMlO8tMIylU+ddMB3EW+4wQIzj2+EU7vpt2cQFmu5XKcUey1LUmKwSiEq82Q/E
X-Gm-Gg: AfdE7clUraEgKq+WXvl2ENQjVt9+ACS+QqPgp6R/3uwsivtRktyaTqU5Y2FGt65Z/tk
	1Oy04MDjHmxSwyaBrma42aCSgTFWSXvMI7WdZ2VfVsAXhI2vcTdKmqQyu7/FMnrL6NWHQUEfbcs
	AMudrGoGyzvxC3eXvBTb2Ese4MJb9A4b45n2k8G27bmdmKXMZfRWKgVsemzl5sxgrz0LKyRCdxu
	yK9L8++lo5Ir+H/nC3lFeqafunSiEXlR7ygP8nAOMi7QuM27dfv8049ed7m5a6k/i2VZZ7Ba2Fj
	QtUDTesnNKviQ7r+gcL6VLwk8f7LX1jpQS8dx0CEpVLtNezP1aS7UdN2d9R5Vf032LvJseSPqey
	wv22dRUCQqC8Bf7A41fFQQVaES8lRRxvoAhufqhVwijE=
X-Received: by 2002:a05:6a21:a96:b0:3bf:d0c8:2aa7 with SMTP id adf61e73a8af0-3c0bcbc5172mr6875952637.47.1783576546151;
        Wed, 08 Jul 2026 22:55:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:a96:b0:3bf:d0c8:2aa7 with SMTP id adf61e73a8af0-3c0bcbc5172mr6875920637.47.1783576545686;
        Wed, 08 Jul 2026 22:55:45 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5946sm3184667a12.7.2026.07.08.22.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 22:55:45 -0700 (PDT)
Message-ID: <04365920-4abf-439a-816e-3ae6ff06521c@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 11:25:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: eliza-evk: Enable PCIe0 and
 PCIe1 with M.2 and TC9563 switch
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260708-eliza_evk-v2-0-c599246ceba1@oss.qualcomm.com>
 <ak5sfkmrhorCY6lf@baldur>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <ak5sfkmrhorCY6lf@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1MyBTYWx0ZWRfX6lGnIIkqFnKe
 mMYtdAoS9ZnrIfJ7VEwIg0Zxl++xIFZUb1dba8YnazFKUc4XgHPvliGLOvt920gdX44VX1PQGg7
 Od9TYT+F+7XViZySR3Eg0JgEXpnRV5kj6GM6BeG2zCQ7A0YtOVZoBSWqnM4vV91Igb1gRyoryLy
 OjfgAtm9atVhUJUAaiHruELfQn8MYmG0Z4y0X1GfTywdF+ams4wLTUbW6UwYmB7QzSRkMCOhc/H
 uX+d7d22UI2+KP/qhnXM4XjqKkrbIe+yal0d0bWXpxcSLo9V68Xc9fnyPh7rcaZarAIgsA2JKVr
 MQtIVgMIlFQItRrkpyxQsaTK2M++/3Ilp6rAdiNBeCd36LQ1A7xfICHLsecZRhbaTKg9FW9C0xW
 tDc49ST4lrnurQbfCqTFIUcNEggwWPdoKyJWjqljGPafpULzhLdXYHpsH/uH0v1VgdxMwrmvIVb
 AWOs8IdbHj2H3Q6b5hA==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f37e2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=UtvHBniHWTLL8wGpZJ8A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1MyBTYWx0ZWRfX1d16lWqnVr31
 HNEYJ6Am41ZtxUE6CPpqCEGEOEWKyTgft2mvM8sJCNkuRp0KQi/LWsfzv94jSdQTiWB7fV1jm3y
 fLyoVFD86c6gVf1tX1xq8lCBiy7PJXg=
X-Proofpoint-ORIG-GUID: tzDtf3Rz2gIfm00_dmSk-Bnjr8KcYT9a
X-Proofpoint-GUID: tzDtf3Rz2gIfm00_dmSk-Bnjr8KcYT9a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117844-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C72F72CE9A



On 7/8/2026 9:05 PM, Bjorn Andersson wrote:
> On Wed, Jul 08, 2026 at 11:47:15AM +0530, Krishna Chaitanya Chundru wrote:
>> This series enables PCIe for the Eliza EVK board (CQS SoM on EVK carrier).
>>
>> The Eliza EVK exposes two PCIe ports:
>>
>> - PCIe0 drives an M.2 E key connector. The 3.3V supply is GPIO-controlled
>>   via a TCA9538 I/O expander on I2C4. The slot hosts a WLAN module
>>   (connected over PCIe) and a Bluetooth device (connected over UART5),
>>   modelled with the pcie-m2-e-connector binding.
>>
>> - PCIe1 (8GT/s x2) connects to a Toshiba TC9563 PCIe switch, whose
>>   management interface sits on I2C4 (address 0x77). The TC9563 RESX# and
>>   PERST# lines are OR-ed internally; reset is driven via a TLMM GPIO on
>>   the RESX# pin. The iommu-map covers all downstream switch ports
>>   (SID range 0x1400-0x1408).
>>
>> The M.2 WLAN module carries a Qualcomm QCC2072 Bluetooth chip. A device-ID
>> entry is added to the M.2 power sequencer so the serdev node for the BT
>> UART interface is created on PCI enumeration.
>>
>> Bluetooth is enabled with this patch https://lore.kernel.org/all/20260529175822.3366535-1-yepuri.siddu@oss.qualcomm.com/
>>
>> This seris Depends-on:
>>   https://lore.kernel.org/all/20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com/
> Why send this patch, when this dependency is known bad - when would I
> ever be able to merge this patch?
>
> And why are you sending separate series concurrently with dependencies
> between them!? It's one thing to send patches saying "I depend on
> someone else's completely unrelated work", but saying "here's a random
> bunch of tangled patches, good luck everyone!" is not okay.
>
> I expect all three patches to be rebased and send in one series that I
> can just click "Submit" on next time.
Sorry for the mess, I will resend all 3 pcie patches in a single series today.

- Krishna Chaitanya.
> Thanks,
> Bjorn
>
>>   https://lore.kernel.org/all/20260630-eliza-dts-qcs-evk-v4-3-18cbbdba6e7e@oss.qualcomm.com/
>>   https://lore.kernel.org/all/20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com/
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Drop patch 3, as this is already applied
>> - Rebase on top of https://lore.kernel.org/all/20260708055017.A90C91F000E9@smtp.kernel.org/
>>   and remove pincntrl as pincntrl is added in the eliza.dtsi patch and also remove
>>   pinctrl for resx as this is covered in pcie1_default_state as perst gpio.
>> - Link to v1: https://patch.msgid.link/20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com
>>
>> To: Bjorn Andersson <andersson@kernel.org>
>> To: Konrad Dybcio <konradybcio@kernel.org>
>> To: Rob Herring <robh@kernel.org>
>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> To: Conor Dooley <conor+dt@kernel.org>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>>
>> ---
>> Krishna Chaitanya Chundru (2):
>>       arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E key connector
>>       arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563 PCIe switch
>>
>>  arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 228 ++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/eliza.dtsi     |   2 +
>>  2 files changed, 230 insertions(+)
>> ---
>> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
>> change-id: 20260629-eliza_evk-6f30686b161f
>> prerequisite-message-id: <20260708-eliza_dt-v2-1-e6281da26408@oss.qualcomm.com>
>> prerequisite-patch-id: 7654ff4f899ac0094a2e791e7f208998fcc7d5fa
>> prerequisite-patch-id: 9e10dfbe360941cdac0300aaf163149755952f9f
>> prerequisite-patch-id: fecce0170351baf00cbe8f6b302d1def4d99bbfc
>> prerequisite-patch-id: 97cd6cb495fdd198f6de7fbe45ef32e4a638ec9c
>> prerequisite-message-id: <20260630-dts-qcom-eliza-mtp-evk-add-pmics-v1-1-f4f320f7c88b@oss.qualcomm.com>
>> prerequisite-patch-id: f3615b5c1e2222a2491f862a7fba3994058ecc53
>>
>> Best regards,
>> --  
>> Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>


