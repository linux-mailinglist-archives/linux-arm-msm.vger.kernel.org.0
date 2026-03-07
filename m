Return-Path: <linux-arm-msm+bounces-95980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D1DHU4mrGnnlwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 14:21:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2251E22BEDD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 14:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0892F302412C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 13:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B92826ED5D;
	Sat,  7 Mar 2026 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9QcVE9d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681C3262FE7
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772889657; cv=none; b=e5pYnjSvemdtX7hiqf5GYSzxfGhhdy06RWzkk2dTIe74jrd3UghhCGHpn+5SxDWwMqgA51SU+nz+aix11uL19TNQ7b8uyF6Zqrh3sEPZ/CG1wLdPBt9QzhhEP5ka4UoIKkRiI7PBJGtc/P5f5XpRYJWViVfl2Ykh0v5KjLuO/zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772889657; c=relaxed/simple;
	bh=MZhASFaRKvTy4ugdHi+gHurEaCQh/rgXenu0BMk6PMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TP5qNExBwlYH14zwZg2WDo0Ov0WG0Par8iU+95uzni5eTVxCBWHAuQXzrimxeSXbWUBfUxh/kdWgb4FfdbgKMToBhJw0sOMY4DnQyRkNsDd24uvJif974mEsYXmLHk7Z09GvrKA226FpaquaBpwlOYbqLRWnYUE8afpP5vlNjW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9QcVE9d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1803C19422;
	Sat,  7 Mar 2026 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772889657;
	bh=MZhASFaRKvTy4ugdHi+gHurEaCQh/rgXenu0BMk6PMg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l9QcVE9dy0BGzXP/ws3cvItYOJWmBJ5AXhPg084zG+2CdS7hbYBzZhg6IfD6eVkwJ
	 T/x6sEX2as5uvD8RDskGY5nmGHOVDsbhqZdnOWyElAbtdtFcbUlBk6IVoiHWSQznAd
	 TPk190DD7oiIuITyqlJtkCsQ5yUypNs3+FPoPGJNtnhEkHDPC+aUypKGOd4velpoKK
	 fRmgztfEGou3LJ1znX1sxwe2rGiJrYsBJXUEmDgnPywvlsjxUBD9FepspmUAfaIQD8
	 Z69dz9szepmieOfHISXpb826PO05uHhFIuqOlhRJ+1Eiv624PHdnUTU6PV1eaHnUoD
	 4lSzr+CTXh+Cg==
Message-ID: <c22930d4-38b1-4d34-b624-247a52fc9ae0@kernel.org>
Date: Sat, 7 Mar 2026 14:20:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/12] drivers: soc: qcom: Add support for Qualcomm QDU
 device.
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
 konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-7-kishore.batta@oss.qualcomm.com>
 <ab23acba-0e40-4065-968a-66307b17f5b4@kernel.org>
 <182f5e1c-3037-4ac7-b2a9-df604e9b2211@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <182f5e1c-3037-4ac7-b2a9-df604e9b2211@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2251E22BEDD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95980-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.929];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 07/03/2026 12:33, Kishore Batta wrote:
> 
> On 8/28/2025 7:49 PM, Krzysztof Kozlowski wrote:
>> On 25/08/2025 12:19, Kishore Batta wrote:
>>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>>> index 99e490e3174e..8d036edf304a 100644
>>> --- a/drivers/soc/qcom/Makefile
>>> +++ b/drivers/soc/qcom/Makefile
>>> @@ -41,3 +41,4 @@ obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
>>>   obj-$(CONFIG_QCOM_PBS) +=	qcom-pbs.o
>>>   obj-$(CONFIG_QCOM_UBWC_CONFIG) += ubwc_config.o
>>>   obj-$(CONFIG_QCOM_SAHARA_PROTOCOL) += sahara/
>>> +obj-$(CONFIG_QCOM_QDU) += qdu.o
>>> diff --git a/drivers/soc/qcom/qdu.c b/drivers/soc/qcom/qdu.c
>>> new file mode 100644
>>> index 000000000000..afd8011793fa
>>> --- /dev/null
>>> +++ b/drivers/soc/qcom/qdu.c
>>> @@ -0,0 +1,85 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
>>> +
>>> +#include <linux/init.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/sahara_image_table_ops.h>
>>> +
>>> +static const char * const qdu100_image_table[] = {
>>> +	[5] = "qcom/qdu100/uefi.elf",
>>> +	[8] = "qcom/qdu100/qdsp6sw.mbn",
>>> +	[16] = "qcom/qdu100/efs1.bin",
>>> +	[17] = "qcom/qdu100/efs2.bin",
>>> +	[20] = "qcom/qdu100/efs3.bin",
>>> +	[23] = "qcom/qdu100/aop.mbn",
>>> +	[25] = "qcom/qdu100/tz.mbn",
>>> +	[29] = "qcom/qdu100/zeros_1sector.bin",
>>> +	[33] = "qcom/qdu100/hypvm.mbn",
>>> +	[34] = "qcom/qdu100/mdmddr.mbn",
>>> +	[36] = "qcom/qdu100/multi_image_qti.mbn",
>>> +	[37] = "qcom/qdu100/multi_image.mbn",
>>> +	[38] = "qcom/qdu100/xbl_config.elf",
>>> +	[39] = "qcom/qdu100/abl_userdebug.elf",
>>> +	[40] = "qcom/qdu100/zeros_1sector.bin",
>>> +	[41] = "qcom/qdu100/devcfg.mbn",
>>> +	[42] = "qcom/qdu100/zeros_1sector.bin",
>>> +	[43] = "qcom/qdu100/kernel_boot.elf",
>> We should not accept this code because corresponding linux-firmware
>> release was not properly authorized in Qualcomm. All of above might change.
>>
>> I can give more details in private.
> Thanks for the comment. The QDu100 image table in v2 reflects the 
> firmware images required by the device for boot. The sahara driver 
> relies on request_firmware_nowarn() and does not make assumptions about 
> firmware distributions or availability.

You did not answer to my comment at all. It does not matter what it
reflects to. You violated GPL license and that's NAK here.

And responding to this after half a year with irrelevant comment of
whatever is clearly:

NAK


Best regards,
Krzysztof

