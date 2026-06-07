Return-Path: <linux-arm-msm+bounces-111545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id puDqDZT6JGoNCgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 06:59:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 630C564ED23
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 06:58:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=packett.cool header.s=key1 header.b=JjBKFDZi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111545-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111545-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=packett.cool;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38C7F3013B4A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 04:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35AA418FC80;
	Sun,  7 Jun 2026 04:58:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29451B6D08
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 04:58:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780808336; cv=none; b=baQZtevP0SjJmKqT0LliR5BaEtfhpqT/Q8lLmOAHYXewZdF8cfag53WQhvOCED2psIOdmBEwMPl8tYvj4XRNzWFiLlO7nQhauDWVhxJvS3fq5KdC9Rfooeeklcgboftao0Asrld51ZrU5b4vMa4pLWOJysgD7RU707jfyIc+BU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780808336; c=relaxed/simple;
	bh=b12924DuJhSujCb8obAxr+0rYAgYetLrAl45i5tZNLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hH2Ic5odcVo6D31u+sv2YFmxQJ/rLjU9Gh3zufw+F8kMnfi1EEYdUFvHrITJwtK230IIAstGUeJlgkWS8Ev1MBPacPjGg/i0uJ3rZwNCm9DgBDMP3LtwdQCIqY0UBRTNuuo5OAJBVWZDPiei5rnkAvNkG3BLmneN9EEP9P12vjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=JjBKFDZi; arc=none smtp.client-ip=91.218.175.189
Message-ID: <806c1868-1c4c-4f53-a6ab-84b336fff7c0@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1780808331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FRsz/MTVg52Z24SOeL5roYX4pr+4ZAE5rR19Cnv50aE=;
	b=JjBKFDZiSv3jYVCCPqTRUemHJQMpptcvXUNDFWhPIt0+IJCMJvJs9JpEeyKF+eQV0kbnSe
	BW4JrEaXEhbfiOvC0/dB0Vmh9E+j00yVMem6fHoxcL4+xtw//j8MkA6KdifodW46R3wgCU
	B8/HVubpsG2hwS440kwFY79ccKykM761Job9RXAI04x9R69KgNpyd1cJnEBApKK33Lve/H
	Pc12ohG033SllrwXp/whiH1S0AJhF0vl35nb6axXYaTPjsZwzrSKWzwc+pq/dJBITG4bth
	pRzR28Tpv2cVLqFanQAMS62wPZJWFkxp091zeg7kiIz1852B8rulTCUbCsq1kQ==
Date: Sun, 7 Jun 2026 01:58:45 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: spi: geni-qcom: any planned QSPI support?
To: Carter <carterd1016@gmail.com>, praveen.talari@oss.qualcomm.com,
 broonie@kernel.org, andi.shyti@kernel.org
Cc: linux-spi@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <CAJ+nLsRXTc=3LagGVdNiAPttL38tPVub_UOKuqJq91J9U0M+9w@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <CAJ+nLsRXTc=3LagGVdNiAPttL38tPVub_UOKuqJq91J9U0M+9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:carterd1016@gmail.com,m:praveen.talari@oss.qualcomm.com,m:broonie@kernel.org,m:andi.shyti@kernel.org,m:linux-spi@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-111545-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:mid,packett.cool:from_mime,packett.cool:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 630C564ED23


On 6/5/26 1:43 AM, Carter wrote:
> I hope I've found myself in the correct location; I haven't ever
> officially participated in kernel shenanigans. I've been working on
> enabling the trackpad on a Surface Laptop 7 (x1e80100, "romulus"). The
> touchpad is an HID-over-SPI device (with a driver patched from
> https://lore.kernel.org/all/20260402-send-upstream-v3-0-6091c458d357@chromium.org/)
> hanging off a GENI QUP serial engine (spi19 / qup2_se3), but it
> requires QSPI transfers - the SE reports protocol 9 which is unknown
> to the mainline spi-geni-qcom driver.
>
> I did find a patch for this driver online out of the linux-surface
> community which may have even gotten it from another source. The patch
> seems to work, however it is very low quality and I suspect it may
> have been vibe-coded.

This one, right?

https://github.com/scuggo/x1e-nixos/blob/931cf9966ba3a213946329ce95b07635a34cd839/kernel/modules/qcom-qspi/spi-geni-qcom.patch
https://github.com/scuggo/x1e-nixos/blob/931cf9966ba3a213946329ce95b07635a34cd839/kernel/modules/qcom-qspi/gpi.patch

I'm not sure what's "very low quality" about it tbh, and what are the 
tells to suspect it was vibe coded?

> I wanted to ask: is there any active or planned
> work to add a QSPI mode to qcom,geni-spi controllers? I was unable to
> personally find any related patches or conversations on lore, but I
> may not have been searching in the right places.
>
> If nothing exists, I'm happy to make an attempt myself. I worry about
> getting in the way of more important matters as this would be my first
> time submitting any patch work and I am bound to make mistakes, but I
> will attempt it where that is welcome.

I'd start with the existing series above, it looks almost ready for 
review to me?

~val


