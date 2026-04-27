Return-Path: <linux-arm-msm+bounces-104714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BwNA4NW72nJAQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:28:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D4D472813
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA3E63005311
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477303B95EC;
	Mon, 27 Apr 2026 12:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="kC69gUgh";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="A8ub61/N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152433B8BBF;
	Mon, 27 Apr 2026 12:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292907; cv=none; b=EHNbVpFmwMxqXke0pJH49kcDYWi8h2juWVPpuiffA9mGj6OCP3gcPS1Xpzh93Sn1YkDuPbu/TDq0wrVf/RlrPmvYqB/4g1Qs73awcXlXCo+hrcosV1/cWNF4a8y8j7vZf+ZVYCbQFIbqcXqwcayMy+YvrSsoKFXLsEjEQbT+R5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292907; c=relaxed/simple;
	bh=F7BUIH9hheA5b0VE1NymRoH0yBJy84YaTLmLn8oi9a4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fz+RLiPsvr4Cw2TFRHwlTNV6N3UpM6F1xO/ccAmDr0yIEDZcAen4t9J1/4aPuscXDpL8pmlWMsmEzBERUUJOyTG0JP9sBVQaHLblRpxqdu0jweMA8LRMCOdRkbbSrC4KhEV4A3luWSXQB4zinfWV2JKKO6L1oU+9iUV9/uTFnmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=kC69gUgh; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=A8ub61/N; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1777292896; bh=0dJTm80JoaNzIaNxXy++ezf
	z5C+6g7xtzxjxbFCcYFo=; b=kC69gUghbdZ/ADqwE6Z5TpjZqemhTWReRveVnw9a1z+lnTnlAa
	poCDF7RqecyZoH8G+OxIIk1JpZGEUFvnFtOVHPE7qIKBu/BvFuStjzczavIG4ef7KYMOBCWNf6G
	hI02/qslpPmJn2ZGJcsi2/qbCX4a/+aKGG8REr8bpRSvnHrpKaYW+mrMYH35DFbsb/LpnzVnqfp
	Wjbarj/Yin2DLrubjbx4mF1+L9MPBPeM4gC7dUSs6TZpFvsCEPZmzBYDRhSd0RG/jVr9KfASWlh
	iFNmo/IO4NEIl7zGyURNA8XEq7un3vHhrK/aytB3wVuf1c5QgTwqVeK3yDbQDyfwPGw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1777292896; bh=0dJTm80JoaNzIaNxXy++ezf
	z5C+6g7xtzxjxbFCcYFo=; b=A8ub61/NJRdGckkddJQjF6uAgR/PLRACE3eTHEWT3eWnolyE34
	JmPA+i6MWvREXQ5K5nt+zpx9zP+QKKpUB3Ag==;
Message-ID: <54bdd893-57dd-4eb2-ba15-53e8aa47bea3@mainlining.org>
Date: Mon, 27 Apr 2026 15:28:15 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
 <337d362d-93de-4e81-8141-a51fa75d615c@oss.qualcomm.com>
 <6b936613-4859-4f73-8593-92180aed16e7@mainlining.org>
 <f0e5e2b5-d050-41d0-9798-c62a9e59ba14@oss.qualcomm.com>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <f0e5e2b5-d050-41d0-9798-c62a9e59ba14@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 03D4D472813
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104714-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mainlining.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[setotau@mainlining.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mainlining.org:email,mainlining.org:dkim,mainlining.org:mid,f6000000:email]


27.04.2026 15:08, Konrad Dybcio пишет:
> On 4/27/26 2:00 PM, Nickolay Goppen wrote:
>> 27.04.2026 14:49, Konrad Dybcio пишет:
>>> On 4/22/26 5:39 PM, Nickolay Goppen wrote:
>>>> Downstream [1] this region is marked as shared, reusable and dynamic so
>>>> describe it that way.
>>>>
>>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
>>>>
>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/sdm630.dtsi | 9 ++++++---
>>>>    1 file changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>> index 4b47efdb57b2..36b419dea153 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>> @@ -494,9 +494,12 @@ venus_region: venus@9f800000 {
>>>>                no-map;
>>>>            };
>>>>    -        adsp_mem: adsp-region@f6000000 {
>>>> -            reg = <0x0 0xf6000000 0x0 0x800000>;
>>>> -            no-map;
>>>> +        adsp_mem: adsp-region {
>>>> +            compatible = "shared-dma-pool";
>>>> +            alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
>>> Please make this = <0x0 0x80000000 0x0 0x80000000>; instead, since the RAM
>> Maybe you meant <0x0 0x80000000 0x0 0x8fffffff>?
> No, <0x0 0x80000000 0x0 0x80000000> means "start at 2 GiB, until the end of
> the 32-bit address range"
Thanks, I've misunderstood.
> Konrad

-- 
Best regards,
Nickolay


