Return-Path: <linux-arm-msm+bounces-105273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH+0BIfD8mkjuAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 04:50:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FC449C86C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 04:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9AE05302436A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 02:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838513314C2;
	Thu, 30 Apr 2026 02:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Z0wNNuvm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9F632D0DE
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 02:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777517309; cv=none; b=q4bf9swos2STQ+IIVe+Rj9D+EqGvpBDRarTlAc8s9SdYVi1lcWSOKhT3gVJOM8rE3/lNcgbNmRUvClUEA3CeIw2/50PU9mFVF0ZFJevTZG8gGG1KPztjnaOUWCyPEtAIZoHBtE2RPMJp05cils8ovhFdQDvsoyEHUXGuHn+x8zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777517309; c=relaxed/simple;
	bh=UoUv6ooGW9if1KVW6nBG8A7RX1eo2dWsQ+5Vd+Bh7LM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nLDViIt+FnyaIMzExiS16l+2lOl/UKawL3Bf2IWLLcPIekTjZ6c2f18GzDX7c4oQpcOWCAcKh+W558zf1J0vndXcC/MEpbHSSfp/swfJsYtJ5sqxhO+v4tWBeSh6gnHR22cktL/OpioYC5k+4lgPYY791rZE+8eNVcHfa4jGd7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Z0wNNuvm; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <da9a1e58-cb8d-4740-b46c-2f24c1c008fc@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1777517304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I8flswkCzXms+OB61Fi7Bk1mFtR75VTNPAqHUf27XG8=;
	b=Z0wNNuvmXhxwdhy0O2HYICJ7rzrfqT0xTH4VkANLg06c+Q0fQ68TEEJC87bCz2tm05/Z7d
	iFbt3vKjW1vSYcF+LSiyayPYdX9bg5DnqeHKzGbSunXNPm2bcrCljl51Q9g08ziKzjBj4A
	qm6zsfZwH9mx5G1HN3fww/w9UzX17DEG7qyJi9Zq8bbHWZUyWtPM65+b+yQX8NJoHp4pd+
	U1LA1jK6IkMmY/cBFC4cbVBp0TFnCkrd7I93KMPCSK1fNvKeWWct0EA+k5WuNskhLcJ8GF
	btpa6X0PlhJiENo/t2hjSjT09rNSgdELwAUnQLNm5zYIqzZQPWS6i+/Aob7/UA==
Date: Wed, 29 Apr 2026 23:48:00 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Dell Inspiron 14 Plus 5441 - keyboard backlight and panel
 (x1e80100 Thena)
To: Adam Szyma <adamszyma@wp.pl>
Cc: linux-arm-msm@vger.kernel.org
References: <b95de355a68f63ce209270fe36fffd33@wp.pl>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <b95de355a68f63ce209270fe36fffd33@wp.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: C7FC449C86C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105273-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[wp.pl];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[]

On 4/29/26 11:27 PM, Adam Szyma wrote:

> Hi Val,
>
> I have successfully installed Ubuntu 26.04 with kernel 7.0.0-32-qcom-x1e
> on a Dell Inspiron 14 Plus 5441 (x1e80100, codename Thena).
Hi, nice to hear that!
> The device uses the same x1-dell-thena.dtsi as the Inspiron 7441/Latitude 7455,
> but has two differences that need addressing:
>
> 1. KEYBOARD BACKLIGHT:
>     The dell-xps-ec driver (dell,xps13-9345-ec) is present in the kernel but
>     the DTS node for EC is missing from x1-dell-thena.dtsi.
>     Keyboard: hid-over-i2c, vendor 0x6243, i2c-4 (b80000.i2c), address 0x05.
>     Could you add the EC node to x1-dell-thena.dtsi to enable keyboard
>     backlight on this device?

Uhh, that driver is not merged upstream yet! -qcom-x1e is not linux-next :)

I'll definitely add the node when it gets merged.. or insist that Alex 
include it in the final version of the EC driver patch.

I'm surprised to hear it was necessary for keyboard backlight of all 
things. On my 7455, it was always controllable with the F5 key directly 
through the EC firmware, independently of the running OS. Funnily enough 
right now I have the driver loaded and that key stopped working so the 
driver might be breaking it a bit in some circumstances right now, heh.

> 2. DISPLAY PANEL:
>     The Inspiron 5441 uses a CSOT MPP36 T9 panel (CSW 0x143d, 1920x1200@60Hz)
>     instead of the panel in the 7441. Brightness control is non-functional.
>     I have already submitted a patch to dri-devel@lists.freedesktop.org:
>     Subject: [PATCH] drm/panel/panel-edp: Add CSOT MPP36 T9 eDP panel
>     Date: 2026-04-29, Message-ID: <20260429145251.8445-1-adamszyma@wp.pl>

I'm very surprised the entry was necessary for brightness of all things, 
are you sure that's not a coincidence? o.0 I haven't heard of delay 
timings impacting brightness control.

> Hardware info:
>     Model: Dell Inspiron 14 Plus 5441
>     SoC: Qualcomm X1E80100 (Snapdragon X Elite)

not the 80-100 :) I guess you have the 10-core cut-down Hamoa (64-100) 
variant, while there's also a Purwa (42-100) one.

>     Panel EDID: CSW 0x143d, MPP36 CSOT T9, 1920x1200@60Hz, 301x188mm

wow, I didn't realize they also used lower-resolution panels on the 
cheaper models.

~val


