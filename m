Return-Path: <linux-arm-msm+bounces-97402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJu/Nyfks2ktcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:17:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D612814C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3583A300C341
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E28337B97;
	Fri, 13 Mar 2026 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="qMFR/wGM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B9B2FE074
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397024; cv=none; b=WS5yJDPKw+CYUV8vDzm9tiqj6no2t9pXXIys8GVMVy+PfJr4qw1DpTcqkJ+hHNQ9kW/zRIBEwIIlPxcODkwZWFmjs9ILZlX8Wkx0XhSM9kRL+fMdHB/rYR6zuVYxEx5Fij4hDTpv+zNmZnO05/W0tY68DHJVxDV5ahEIK2PglXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397024; c=relaxed/simple;
	bh=UlGqmig2IhtNH6TCS3uoqoe8axDQ+o7JoHe7fBCIaBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bX0r+FdKYX+FhVMGcjKNI+Xkr5ywbwxejNFCDzXC861q/x32Vkglg+ZGakKW67vJ0WHjP1EKNUayqausHAmGbViu75BIGXgNERe7wenPNMNhz50kzZduGzuGhcCeiDyzHIrGYgM8Asw+czQ03fdY9BdULnluGpKiCjFEKMmGFck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=qMFR/wGM; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <de081bdc-4b10-4cbe-9b09-4652b63bc4b9@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773397021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cnv2zs1n1NJvvwgzygTG+a3peXBLg5pti3my1UnuhZ0=;
	b=qMFR/wGM1bTY3Y0t3IVpsJ9hSEoJ9JlEM6tNvs5lZQmXRV7FXke71RM6wXNtnwPaoEpICP
	3XLw+Crc7sjc1FbE5nM52DcMHVZ5X0wZglmVVrYrSdfrOtiLqhruMghDs2abHvR3C1Un8j
	1Kagu06pKKacVctLVXBQtyIC2pEypNtcw+Tt0WqrajiuOW2UVNS+b+fZCDRAd9kcElUy06
	J8TKetjXtRsJSksCTgNDArqTe03Ua7tEDhcKaFqNQ8xABqvj7aLNTX1He0PHe4eB+F9gAN
	XLhlNu+4UGF0PHAq/+AOavQf2N4hg65+u61hmolLWwzIeJAJPWkmArSQj9y7uw==
Date: Fri, 13 Mar 2026 07:16:48 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
To: Miquel Raynal <miquel.raynal@bootlin.com>, Junhao Xie <bigfoot@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Xilin Wu <sophon@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
 <x4sxekwxkrylw54rvtnvwjfyfruhd6bd2jlfe5nv4sehbosetn@sxf5wpb3nas2>
 <86F97239DB3D962C+98826904-6649-4c19-815d-73003c046c14@radxa.com>
 <87ecn7jin5.fsf@bootlin.com>
 <8B3AF14A70DEB168+16bb085f-6930-45c2-ab70-83eef50624b5@radxa.com>
 <87jywthpsj.fsf@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <87jywthpsj.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97402-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[packett.cool:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:dkim,packett.cool:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 62D612814C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/3/26 11:20 AM, Miquel Raynal wrote:

>>>> For something like the "DPP" partition, I think it's better to access it
>>>> from userspace than from kernel.
>>> If it's a MAC address that you are accessing, direct userspace does not
>>> sound like a good fit. If I may, NVMEM cells are there exactly for this
>>> purpose: identifying the content of a subpart of a storage device in a
>>> storage agnostic way. The NVMEM cells are made available to in-kernel
>>> drivers (ie. network devices have all the infrastructure to get the MAC
>>> address from there) and their content is also exposed to userspace
>>> through sysfs now.
>> Qualcomm's SPI-NOR boot firmware uses a GPT partition table. The "DPP"
>> partition contains a FAT file system, and the MAC address is stored in
>> one of these files.
>>
>> Because the data is stored inside a filesystem rather than at a fixed
>> offset, it does not fit well with the NVMEM model, which assumes simple
>> offset-based access.
> Not anymore, there are nvmem layouts now that are much more
> flexible, so if a network driver shall get this MAC address, it is still
> doable.
>
> Otherwise there is no such need, and in the case of a file in a FAT
> filesystem, I guess it is preferable to use mtdblock/ubiblock in order
> to expose a block device and mount it from userspace.
>
> Please note that exposing a FAT filesystem on top of a SPI NOR is very
> inappropriate. FAT is a block filesystem, not aware of all the MTD
> specificities (like bad blocks).

FWIW there is an existing widely used solution (workaround?) for the MAC 
address: dtbloader reads the DPP partition in UEFI and applies the MAC 
address as a DT fixup.

https://github.com/TravMurav/dtbloader/blob/493e7e82025edddab29fe99c2b6ec566f6e01ac1/src/qcom.c#L260

(But this means that any dtbloader alternative such as the systemd UKI 
stub must also implement the same thing, which is not great.)

Reading that code, it does not seem to be a FAT filesystem exactly? It's 
something called "RWFS" where files have 49-char long names and a 
49-char "vendor" string field that's either "QCOM" or "OEM".


Also on the rare older devices that have SNOC WiFi/modem but NVMe 
storage —basically the Surface Pro X— the modem partitions need to be 
accessed from userspace (rmtfs) and they're stored on the NOR flash. 
Well, at least in the WiFi-only case even blank files are enough to 
replace them :) but for cellular I think the IMEI and stuff is there..


So this all sounds supremely annoying, we have a GPT partitioned flash 
where some specific partitions should be given to the WiFi&BT drivers 
(as nvmem cells?) but others should be accessible as mtdblock devices in 
userspace >_<


~val


