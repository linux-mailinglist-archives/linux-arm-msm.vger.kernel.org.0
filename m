Return-Path: <linux-arm-msm+bounces-104767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGgLOT2Q72nRCwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:35:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 452034767A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45B8C30A8E04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 16:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310C135FF66;
	Mon, 27 Apr 2026 16:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="OS+y4sxj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E14834F25C;
	Mon, 27 Apr 2026 16:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306757; cv=none; b=g2UgS3jFktXBY4KKYzGPcty4ruj044xycNwMo+4gIsGkbxd2AAwhRvw92BHWZo0YiuJ3wcTqALdWIdaSF16O1IPV8XS6GGQTyq+KGV0HkBtQu1rtt5bNoKCetm2wCvIizWigLPUsdMBH7yrh7kHz+SOPRonw1KmDUGUAd7YOVnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306757; c=relaxed/simple;
	bh=AtrtQo5Z7gDgHNtgssM/kHXPD4ldxoB/JeYYsOkHC0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J9ulfLzVNxKOxH/hqmrOkn8KqJpUXLzT0MaaP3leLpPePhZH7OeYWqhjw8CpCu8o4dhL5gnP88iN/wCoPcOig6ybdgUperazYi9pC9vRZ8PA6tEysEpCbm4hb60THsDnXctbDb6WHYBi2sKpjHbEwgXhHfu88b6oy1LvDQoNJG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=OS+y4sxj; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=iopoB8Zza6G0Nj8rYRASXGVK7MZeQTqskc0jaDKpLsM=; b=OS+y4sxjX4DD/9HWQlfwcavdKF
	9ItOADSChZlpAPSU1LCRppyATYqI3EZzstcUjOiMuLW8/DKJnJVtXlNGgKqB08TW55rMmhMCQ0o4P
	aapXr0Y9JTMzvro2i9jVPAJS+jH1iX86PSKz7YX0oKNOJFtj/jeElrudjLrHI1xW0U1w=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(envelope-from <alexeymin@minlexx.ru>)
	id 1wHNsw-00000001j2k-19xx;
	Mon, 27 Apr 2026 18:28:34 +0300
Message-ID: <1bd384d1-a4b9-4501-b22a-70596536d434@minlexx.ru>
Date: Mon, 27 Apr 2026 18:28:32 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Nickolay Goppen <setotau@mainlining.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
 <337d362d-93de-4e81-8141-a51fa75d615c@oss.qualcomm.com>
 <e282acd6-dfcb-45a6-977d-eb71b2619b7d@mainlining.org>
Content-Language: en-US
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
In-Reply-To: <e282acd6-dfcb-45a6-977d-eb71b2619b7d@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 452034767A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[minlexx.ru:s=dkim];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[minlexx.ru : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104767-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.826];
	FROM_NEQ_ENVFROM(0.00)[alexeymin@minlexx.ru,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[minlexx.ru:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[9f800000:email,minlexx.ru:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sr.ht:url]

On 27.04.2026 18:20, Nickolay Goppen wrote:
> 
> 27.04.2026 14:49, Konrad Dybcio пишет:
>> On 4/22/26 5:39 PM, Nickolay Goppen wrote:
>>> Downstream [1] this region is marked as shared, reusable and dynamic so
>>> describe it that way.
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/ 
>>> dts/qcom/sdm630.dtsi
>>> index 4b47efdb57b2..36b419dea153 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> @@ -494,9 +494,12 @@ venus_region: venus@9f800000 {
>>>               no-map;
>>>           };
>>> -        adsp_mem: adsp-region@f6000000 {
>>> -            reg = <0x0 0xf6000000 0x0 0x800000>;
>>> -            no-map;
>>> +        adsp_mem: adsp-region {
>>> +            compatible = "shared-dma-pool";
>>> +            alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
>> Please make this = <0x0 0x80000000 0x0 0x80000000>; instead, since the 
>> RAM
>> starts at 0x80000000
> 
> +Alexey Min found out that on 3 GiB xiaomi-lavender RAM starts at 
> 0x40000000
> 
> 40000000-855fffff : System RAM
>    40080000-41bfffff : Kernel code
>    42600000-42fd0fff : Kernel data
> 88f00000-8abfffff : System RAM
> 95000000-feabffff : System RAM
> 

Hi, yes, most other devices seem to in fact start at 80000000, even 6Gb
ones, but not sdm660-xiaomi-lavender. Here is some old UART log from
stock bootloader which also clearly shows RAM Partitions discovered
by it [1].

[1] https://paste.sr.ht/~minlexx/145c5077bf1ce83fe3ad6d25d923bdb9f78b548b

--
Regards,
Alexey Minnekhanov

