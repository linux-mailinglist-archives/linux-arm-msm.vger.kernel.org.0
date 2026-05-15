Return-Path: <linux-arm-msm+bounces-107700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHxjDqONBmrCkgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 05:06:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBA1548E79
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 05:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D5833040697
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 03:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FED83C7E1C;
	Fri, 15 May 2026 03:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Hf2It839"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AD7336884;
	Fri, 15 May 2026 03:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778814365; cv=none; b=tMFg46vF3P012Q5jMnKz8EC7BeBcHBu9lYLNGL1yQlQxBnE/E06mLzNkRJlE4eIQEYqIOov0wr/Ql7I5Epmn7JOt+g7QFrZ7OVEyuyzfhyCJrRgVuTXwaAS0Q7f8gMxdgkWgFKY1IVf5CovQyPMh3mOjnLhEM6P3w9XIK6JUCLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778814365; c=relaxed/simple;
	bh=LYQGEvEVcV3AIs0Ny3zGgrPXYS1qJF3UwgPdUJMJIrk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YrxkyaKluwF0O7l/CwJcb6l6tYmW/LwbjBWmrXbVw9mLgf2vxVoDLSO1RHS1PlpEtLG6owySP+yVbj46TbaiT1pwbdejPjbZ4nOyuhOIdKcdNb0D4iSvGgTTdUVibj7X82xI5zrslTEa7Db6VOmGP4LjwNfvuEaqMmDyZqAroY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Hf2It839; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1778814351; x=1779073551;
	bh=LYQGEvEVcV3AIs0Ny3zGgrPXYS1qJF3UwgPdUJMJIrk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Hf2It839cOvAq12R8X/mdZCLRIG7VUwm86SdkOT6Jp9KgIisSQTWC5Us6OoVM8zRK
	 2nd8GsirvTW+fNxy/v5lTBn/3RJ6hYyvnYUGx/Fk9u7WW8Ba9pCIjxkjzxEOdwGQ49
	 dDCHe0eyEHaZ4CH7InrqBZtPqgz/S9aUEH/0I/+WY5HEUcu9AJe+xrl+dcpN7yVl32
	 FfbH5bMh9vX5VGPiZjO+tR22WpMsbD6RvWa3IPND+gBfaU7gRJi/ZB/EkeDAy8oAEi
	 LjsrBs8lGkEJQXyt2Jww7bCqGwdvjyVtxyc7sG/mpEz1ZmrkIj/VXyptITBs+4iChB
	 T0BkKjQ8YDK/A==
Date: Fri, 15 May 2026 03:05:47 +0000
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
From: makro-kernel <makro-kernel@proton.me>
Cc: "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>, "marcel@holtmann.org" <marcel@holtmann.org>, "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2] Bluetooth: btusb: Allow firmware re-download when version matches
Message-ID: <pyDnxzJCoPEI1RC1YKwFmifUCtLhGfqiDRuJW_TmXYMxGeItEbAHog8wiBMhH2LmwCh4_wMCiAa-plN7WUSXUmX3Aimz7QudJwZLhBGH2Uo=@proton.me>
In-Reply-To: <51a08590-a662-45b2-ba04-195b020c26cd@oss.qualcomm.com>
References: <GCBTvsv1x8qAB3ZmSCpTLo7M63lTTXM2c5n1TJLmQuus0g4gViSSJVRZzl6CzehnMdSHDqtZkQA33RYCVSxdAm7tGEeVYCflhV3QgbLIcfg=@proton.me> <51a08590-a662-45b2-ba04-195b020c26cd@oss.qualcomm.com>
Feedback-ID: 197359692:user:proton
X-Pm-Message-ID: 4abaac1a7b3dcc253d596254f65b77a59cae78b5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: ACBA1548E79
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107700-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,holtmann.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[makro-kernel@proton.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[proton.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,proton.me:mid,proton.me:dkim]
X-Rspamd-Action: no action

Hi Shuai,

Thanks for testing. I agree, then the unconditional bypass in my patch
is too broad and a quirk-flag approach is better. I'll wait for your
patch to land and rebase on top.

Thanks,
Makro

