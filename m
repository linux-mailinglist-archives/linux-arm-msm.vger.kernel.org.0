Return-Path: <linux-arm-msm+bounces-115018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oyL0NL1dQmos5gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:57:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3BC6D9B5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:57:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=huawei.com header.s=dkim header.b=YtO5REl4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115018-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115018-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=huawei.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C23F13113221
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910353FFAC0;
	Mon, 29 Jun 2026 11:49:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC43C3FFADA;
	Mon, 29 Jun 2026 11:48:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733743; cv=none; b=OI+RwoTkSLqW1/03yMFX0ViXTSUp4zn/XgmB17BjPGeVrTlcgOHO7Ip8ifGEWr1HvW1ZnADAhFbdp1JUR3j14Dynra39BIMMsFNH7sbzqZFePHtGB1o7AXw/KAsk6L1+QED1tG2xLh1W533zCKUgk6w/U02zCshS8yeGvjG7eSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733743; c=relaxed/simple;
	bh=2ZcnW/p4U6kHuv2hD7F4IvxtLv4b/8wPoO0xrWapwX8=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=FYpmXGmKoAWwJaa+B4OBQBHzJSF7p8pSp0ibjMM8fx8D9xCoW+il4n/glHf5V+J9mEZKvkvC3P/SClwqPwLnWpAxi1jqctcZHLD4OEoClEswijm7/KR84bh3gCJEgv33w/nF+wDf+hQ8JCgaKuB5XhQkdY74Y+sENpkYb4e89QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=YtO5REl4; arc=none smtp.client-ip=113.46.200.218
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KYIqSPaWrslFKWhq3eRFcveecF15aHMxW8vSfPyMtbE=;
	b=YtO5REl43rH88w+Rl7nwaF6bOhXf/g0q57POHjsl6p4cAx75xKurJ8P6ck1yULbMEfoTSCg/I
	NPh6iWB9/g28QpHIcg21jEODVsd1bNgl9xeE4BGR8EFboZSkyO4GCVhjbUtE+xo2rEYJ0acmKcf
	Q/98oHtxrli5pTGHa8c0JC8=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gpkqN4X17zpStT;
	Mon, 29 Jun 2026 19:40:32 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 1EFEB4057D;
	Mon, 29 Jun 2026 19:48:57 +0800 (CST)
Received: from [10.174.179.24] (10.174.179.24) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 29 Jun 2026 19:48:56 +0800
Subject: Re: [RFC 00/12] RFC: Devicetree-ACPI hybrid mode
To: Hans de Goede <johannes.goede@oss.qualcomm.com>, "Rafael J . Wysocki"
	<rafael@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: Srinivas Kandagatla <srini@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, Bartosz
 Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Abel Vesa
	<abel.vesa@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-acpi@vger.kernel.org>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <68799102-870d-1b8e-e663-df2f053a1114@huawei.com>
Date: Mon, 29 Jun 2026 19:48:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-9.16 / 15.00];
	WHITELIST_DMARC(-7.00)[huawei.com:D:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115018-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[guohanjun@huawei.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guohanjun@huawei.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,huawei.com:dkim,huawei.com:mid,huawei.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F3BC6D9B5B

Hi Hans,

On 2026/6/23 22:52, Hans de Goede wrote:
> Hi All,
> 
> Currently as soon as the kernel boots with a populated DT provided then
> the arch/arm64 code sets acpi_disabled=1 and the complete ACPI subsystem
> gets disabled. On WoA Snapdragon laptops where the factory Windows OS
> actually boots using these tables this is not necessarily desirable.

That exactly to let us know what's missing for DT or ACPI, then we can
identify the missing parts of the device descriptions for booting.

> 
> It might still be interesting to at least parse the ACPI tables and make
> the ACPI fwnodes available for device-drivers to use. I call this DT-ACPI
> hybrid mode.
> 
> This mainly is an experiment for now and possibly a method for accelerating
> the ongoing effort to run Linux on currently available Snapdragon laptops.
> 
> On current laptops Linux cannot boot using ACPI due to some information
> missing from the ACPI tables. People are working on changing this so that
> for future WoA Snapdragon laptops Linux can boot using ACPI only without
> requiring Devicetree.
> 
> 
> There are a couple of scenarios where DT-ACPI hybrid mode is useful:
> 
> a) This leads to a populated /sys/firmware/acpi/tables allowing one to run
> acpidump, which is useful to grab info from the ACPI tables when e.g.
> creating a DT for a new laptop model. As a bonus /sys/firmware/acpi/bgrt
> is also populated allowing the boot-splash to show the vendor logo.

I think this is just for debug purpose, not for production.

> 
> b) It might be useful for device-drivers to be able to access ACPI data
> for the device even when running in DT mode. 

On the other hand, it will introduce confusion if we have problems to
solve or bugs to fix, how can I quickly identify it's a ACPI table
problem, a device tree issue, or both?

[...]
> 
> Comments, thoughts ?

Please take look at the document of ACPI for ARM64, it says:

Relationship with Device Tree
-----------------------------
ACPI support in drivers and subsystems for Arm should never be mutually
exclusive with DT support at compile time.

*At boot time the kernel will only use one description method depending*
*on parameters passed from the boot loader (including kernel bootargs).*

Regardless of whether DT or ACPI is used, the kernel must always be
capable of booting with either scheme (in kernels with both schemes
enabled at compile time).

So why we wrote it down when we upstream the ACPI support for ARM64?
because ACPI is a standard and we need to make the ARM64 parts
public available for the ACPI spec, then we add the support
for the kernel, if not, people will hack the system to just make it
work, it's bad for compatibility and maintainability.

Thanks
Hanjun

