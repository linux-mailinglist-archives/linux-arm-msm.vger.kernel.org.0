Return-Path: <linux-arm-msm+bounces-96640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNSWIRwisGkkgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:52:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 230E4250EC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A77803139719
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960B33EAC74;
	Tue, 10 Mar 2026 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="GXy8ETvo";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="BU1+6y70"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3E93EAC79;
	Tue, 10 Mar 2026 12:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773146891; cv=none; b=ifvOgkQRSiJeOGcdXxXqHaFrBac9RyG9rKKQhGPiFMeAvjOD07F3Isw3L6tsUHl61hka9La5r4J5d2lGRlwU1Dxvt+bYYFxMKGaWG3RZPxn/y8MEB0guHF6qJt1Zp17M7vuNA8HHDNh3RrgES8MRwHBXNMIGw+w2DHo0z1c1gXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773146891; c=relaxed/simple;
	bh=F4K4me9Zce8ZPwr9kNm/pN03aWbImAL1o/d1QRaADFA=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=JYp7UfQHUj6V+8BgEo1PRIB7s0OfOE/K7OVsg7u3/jCduwLLZl75h06lRGPf79J4mTkvyitNP3+Au3orUJ7CK/LMexHd7cqTT6lKvsBGADdUVPqLuT8j0R5tvhmw79PXG0R1C9ZnljB8nVk68c4sfxE/FO6EUrGNwrtmYJ0cBnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=GXy8ETvo; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=BU1+6y70; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1773146872; bh=DoqtFfjxITXmNu6NKaWLplq
	7x6ormIyWUuMGJ9LAwoM=; b=GXy8ETvo591GzDCHMk0r8wUUQjMsvXo+qX+5qzYIWsBBKoX5ch
	dc12sUBU2ZEyIivih1RRCfqUSVGsclakShkGuk7U1dtprBWOyPG5Bl/CvEmkOe5mZpqwclml7ai
	dopAMgpobZzZhv4VRvFYAdQEzXckTxmmsHd5xkJ1rblb5p8Voy5UbOpTELgpa4aX+c03XA+29KT
	SSF18s39F2U0lKaK5ZAJRu9Hb4zQyA5Khi3kLwE3a/vX9oEFz+oR6bf4upCO9noiXAQoIkc8tyF
	7G7bEVo13X2vY/G1R491/UR5FsRbDhADmbBi9MDUVJEKC4xPly8skQF/uXkmcoyuZuw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1773146872; bh=DoqtFfjxITXmNu6NKaWLplq
	7x6ormIyWUuMGJ9LAwoM=; b=BU1+6y70OqEBq4iycKRsowV65GcRcAQtDq7nZaZnViO6deUliv
	WPKXrgQEcw4qIAGMwN76/u/x4OzZaAV7pNBw==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 10 Mar 2026 13:47:51 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add Redmi Go
In-Reply-To: <8d327f02-b2c1-431f-8a18-bba99e396223@oss.qualcomm.com>
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-5-436f1f4b7399@mainlining.org>
 <07b552b4-ecdb-4877-8b45-fcaa6792aee4@oss.qualcomm.com>
 <390f4c8b89f3465924d6ef95bccccc6a@mainlining.org>
 <46a3f0ff1a5c20e8bd4a4c1efb16960d@mainlining.org>
 <8d327f02-b2c1-431f-8a18-bba99e396223@oss.qualcomm.com>
Message-ID: <3fbedf4f9bff962a8f11dc746090504b@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 230E4250EC5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96640-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[mainlining.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:dkim,mainlining.org:email,mainlining.org:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 2026-03-10 13:31, Konrad Dybcio wrote:
> On 3/9/26 10:36 PM, barnabas.czeman@mainlining.org wrote:
>> On 2026-03-09 22:19, barnabas.czeman@mainlining.org wrote:
>>> On 2026-03-09 13:53, Konrad Dybcio wrote:
>>>> On 3/5/26 6:28 PM, Barnabás Czémán wrote:
>>>>> Redmi Go (tiare) is like Redmi 5A with small differences like 
>>>>> charging,
>>>>> fuel gauge and different speaker codec.
>>>>> 
>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/Makefile                 |  1 +
>>>>>  arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts | 27 
>>>>> +++++++++++++++++++++++
>>>>>  2 files changed, 28 insertions(+)
>>>>> 
>>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile 
>>>>> b/arch/arm64/boot/dts/qcom/Makefile
>>>>> index 20e161e843ed..a74598cf0b47 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>>> @@ -83,6 +83,7 @@ dtb-$(CONFIG_ARCH_QCOM)    += 
>>>>> msm8916-wingtech-wt88047.dtb
>>>>>  dtb-$(CONFIG_ARCH_QCOM)    += msm8916-yiming-uz801v3.dtb
>>>>>  dtb-$(CONFIG_ARCH_QCOM)    += msm8917-xiaomi-riva.dtb
>>>>>  dtb-$(CONFIG_ARCH_QCOM)    += msm8917-xiaomi-rolex.dtb
>>>>> +dtb-$(CONFIG_ARCH_QCOM)    += msm8917-xiaomi-tiare.dtb
>>>>>  dtb-$(CONFIG_ARCH_QCOM)    += msm8929-wingtech-wt82918hd.dtb
>>>>>  dtb-$(CONFIG_ARCH_QCOM)    += msm8937-xiaomi-land.dtb
>>>>>  dtb-$(CONFIG_ARCH_QCOM)    += msm8939-asus-z00t.dtb
>>>>> diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts 
>>>>> b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts
>>>>> new file mode 100644
>>>>> index 000000000000..c3a74530c34c
>>>>> --- /dev/null
>>>>> +++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts
>>>>> @@ -0,0 +1,27 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>> +/*
>>>>> + * Copyright (c) 2026, Barnabas Czeman
>>>>> + */
>>>>> +
>>>>> +/dts-v1/;
>>>>> +
>>>>> +#include "msm8917-xiaomi-riva-common.dtsi"
>>>>> +
>>>>> +/ {
>>>>> +    model = "Xiaomi Redmi Go (tiare)";
>>>>> +    compatible = "xiaomi,tiare", "qcom,msm8917";
>>>>> +
>>>>> +    qcom,board-id = <0x1000b 1>;
>>>> 
>>>> Could you please double-check this? Riva and Rolex seem to have
>>>> properly different values there, but this one mimics one of the
>>>> values for Rolex.
>>> riva value is depends from the bootloader, Oreo bootloader using same 
>>> value
>>> like rolex and tiare, 2nd entry in the board-id is not used so i 
>>> should remove it.
>>> Here is some more context:
>>> https://github.com/msm8916-mainline/lk2nd/blob/main/lk2nd/device/dts/msm8952/msm8917-xiaomi-riva.dts
>>> https://github.com/msm8916-mainline/lk2nd/blob/main/lk2nd/device/dts/msm8952/msm8917-xiaomi-common.dts
>>> 
>> I have find out this qcom,board-id = <0x1000b 1>, <0x1000b 2>; works 
>> with both bootloader version
>> on riva but if i set only one of them, the bootloader version will be 
>> limited.
> 
> These properties exist for the sole reason of making the bootloader
> happy, so if there's nuance, let's not try being too smart and just
> stick with what works
I have tested this on both version.
> 
> Konrad

