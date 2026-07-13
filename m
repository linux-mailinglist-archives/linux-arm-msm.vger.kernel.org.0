Return-Path: <linux-arm-msm+bounces-118850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7MFkMfEtVWrpkwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 20:26:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9CE74E77B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 20:26:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118850-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118850-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C74530E181E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 18:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF1335202E;
	Mon, 13 Jul 2026 18:23:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D6F273D77;
	Mon, 13 Jul 2026 18:23:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783966987; cv=none; b=mIpAd0JKoMAixm6helamx8d+tz6Np1i29AjYAiclbWt8EGYqF65LwtqXhnBfXNDZI1JJEaKjFnnq106VhdCy3ZBfYC7aHKGHp7NLY/fU7moKJKH9oRCDIklrwYrGA9Yn1jyvChghYKj1QOOuMDvt5SACOf7Wo7BesfZWkUwbtx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783966987; c=relaxed/simple;
	bh=Zn4gdLOfhoOee0jEfGwXihAwW7drfLS1Wj0xCLzHM40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1ba79IPVrsH/FVHNTgkdu2uF96PibpskromiV8dnLowLYNtYn5OsjcIxY1nh9DBX8lLWWLgU62rrqrpETyGJHimX9tZqGhdwEYCczPD5ITywOsfFBCILsVHpHGKczQSYNhyZuhpLSZSG2vbETFR1RjVoPhKjnxWwwWAq4fAwK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org; spf=pass smtp.mailfrom=basealt.ru; arc=none smtp.client-ip=193.43.8.18
Received: from localhost (broadband-46-242-4-129.ip.moscow.rt.ru [46.242.4.129])
	(Authenticated sender: gremlin)
	by air.basealt.ru (Postfix) with ESMTPSA id 6E84C23370;
	Mon, 13 Jul 2026 21:22:58 +0300 (MSK)
Date: Mon, 13 Jul 2026 21:22:57 +0300
From: "Alexey V. Vissarionov" <gremlin@altlinux.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: "Alexey V. Vissarionov" <gremlin@altlinux.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Casey Connolly <casey.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] usb: typec: tcpm: qcom: initialize currsrc explicitly
Message-ID: <20260713182257.GA22956@altlinux.org>
References: <20260713080631.GB1275@altlinux.org>
 <a205f7ee-7894-4d6d-a752-b10b036b6c36@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a205f7ee-7894-4d6d-a752-b10b036b6c36@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:gremlin@altlinux.org,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:linux@roeck-us.net,m:casey.connolly@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:lvc-project@linuxtesting.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118850-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[altlinux.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[gremlin@altlinux.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gremlin@altlinux.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,altlinux.org:from_mime,altlinux.org:email,altlinux.org:mid,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B9CE74E77B

Good ${greeting_time}!

On 2026-07-13 09:34:22 +0100, Bryan O'Donoghue wrote:

 > On 13/07/2026 09:06, Alexey V. Vissarionov wrote:
 >> When regmap_read() fails, the execution goes to done: label,
 >> where currsrc is passed to rp_sel_to_name() and used as an
 >> index after a proper check. However, to make this situation
 >> easier to notice, an explicit initialization of currsrc with
 >> obviously impossible value is suggested.
 >> [...]
 >> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC
 >> Type-C driver")
 >> Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
 > This patch makes sense but doesn't require a Fixes: tag.
 > With that changed.
 > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

ACK. Updated patch follows.


-- 
Alexey V. Vissarionov
gremlin נעי altlinux פ‏כ org; +vii-cmiii-ccxxix-lxxix-xlii
GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net

