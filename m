Return-Path: <linux-arm-msm+bounces-114500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zxuFBq4APWqDvggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:19:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BB26C4986
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:19:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WCKOTXxo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114500-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114500-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BBA0A30069B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4E63CF682;
	Thu, 25 Jun 2026 10:18:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A291E367288;
	Thu, 25 Jun 2026 10:18:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782382714; cv=none; b=S/x8XF6kOslmIcKL7m5lLtheQE72uAHWC04IgSPN8Yl0+qI3QwXHjlwo5rS7y+bA2mUHLWYl4evQhTJ5zSGfQyCBw//2fg0xigWtZpJjvQZ16YMaEw21jZdY/xyBVz6FV3AJVl9LebSMLtm1kkzVrnMqlYktKpKBsECttKsNp+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782382714; c=relaxed/simple;
	bh=WAUJTHo/ePsI3XGecVaXtCkNMTdhtQ/0OceaynIiV0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KmWHpodvrpj++0DNpXTbLs76gMJi7UXBSSIJbPVNQHUctSrpaAYZeNNmoLOMLgSYRIywkHutY9bBI4yDqeOlS1nS9PyJbuZA+xAzFNXuX0bhKIgimxUmZXCCAwFp6Z9ZSaPSC9lANU6+Lnx1jwEoeyWdZPEJFI3PYqLiCGe3BB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCKOTXxo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCBFC1F000E9;
	Thu, 25 Jun 2026 10:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782382713;
	bh=876w6/eCJ7SqQjvBg+24X9YaPylLm+XwVJRbUT/ujFE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WCKOTXxoE+VrXtG9KXYW/qhRQY79owu2ICWOcQ/WdQeroSUEHc2tt8XK4xhPpbSyo
	 FIIv/OIC6JHbDjfIXiZPH5+1CYdx6ElIoNWbpWLjfzt2VZwXiavuB9xJxWVetbIU8k
	 oy6JrlKyqSiCbA9xCnXpQfXM2IFrqZsNevOo6tpmeP3KKKJds2tVKQE6LOB6NqNkY7
	 /byH5hy+ETHqoI1lQLQFdLVXc5plrA+l50IaatIR88qHN9XPM1ZK3pd746PBz9W2Pe
	 eccdwWPsFd5ETqL5bg1/8vmraRW2kIfomJLR13VXHzCaMaHQbHDy5VT9U2PVwyXv+S
	 6Ko0MlCI14ObQ==
Message-ID: <68cdb639-4ab7-44bb-a9b7-3ef6e463c1b3@kernel.org>
Date: Thu, 25 Jun 2026 12:18:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/12] RFC: Devicetree-ACPI hybrid mode
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Dmitry Baryshkov
 <lumag@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-114500-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18BB26C4986

On 6/23/26 4:52 PM, Hans de Goede wrote:
> Hi All,
> 
> Currently as soon as the kernel boots with a populated DT provided then
> the arch/arm64 code sets acpi_disabled=1 and the complete ACPI subsystem
> gets disabled. On WoA Snapdragon laptops where the factory Windows OS
> actually boots using these tables this is not necessarily desirable.
> 
> It might still be interesting to at least parse the ACPI tables and make
> the ACPI fwnodes available for device-drivers to use. I call this DT-ACPI
> hybrid mode.
> 
> This mainly is an experiment for now and possibly a method for accelerating
> the ongoing effort to run Linux on currently available Snapdragon laptops.

I like the part where the ACPI tables are parsed and are visible to
Linux (so that the user can e.g. do acpidump even though DT is in use,
since the tables are in memory anyway)

I think the 'hybrid enumeration path' is a cool technical experiment,
which lets the user skip _some parts_ of writing a device tree, but
the benefits are too minor - we can only make use of this for devices
that already have ACPI support in Linux and whose nodes fit within the
"describe the actual hw and how it's wired up, not the functions it
exposes" model (because on Windows that all ends up being hijacked by
the PEP driver or something similar in the chain).
This is natural for DT, but not so much for ACPI

The hid-over-i2c example you gave looks useful on the surface, but
if the user already has to have the knowledge and skills to grab and
decompile the tables, assess the right path for the device and still
have to put it in the DT (which again, they would have had to create
at this point) after all, they may as well take the 40 extra seconds
as a single-time cost to fill in the i2c address and interrupt source
to create a valid/full DT node.

The path lookup mechanisms relies on the paths remaining stable,
which I would assume should be the case, but I wouldn't bet money
on it _always_ being the case.

To put it simply, I don't think we should spend time on trying to
forcefully make the incomplete (actually incomplete, since Windows
today loads ACPI fragments sourced from Windows Update at runtime
and relies on many drivers having hardcoded data) DSDTs be any
useful, because in their current form, we would need to rely on
quasi-boardfiles for most things anyway.

If we need to provide the firmware description (DT) externally
anyway, let's just stick to that alone.

Konrad

