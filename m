Return-Path: <linux-arm-msm+bounces-93514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ15MkdymGkoIgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:40:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AB8168709
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 15:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C300A300692A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 14:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E556F287265;
	Fri, 20 Feb 2026 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D824gdji"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B3D41754;
	Fri, 20 Feb 2026 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771598400; cv=none; b=CDcZ/z4tunmedHDAGwdvA2tXSCIWHo+fmar5QqVX/2uPAfQnCmE6Z8QAJuBT6rBupsStnX3YohLlOyaxsZ+nEgZvmh9JGvA2lzDoaBYqGDrD7zBcEmONJEkXX2qldc/fdVWqM9JUGxaE/43gcSslA/OK1Tb0UpZuxI2Ygq33RNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771598400; c=relaxed/simple;
	bh=LyGi7WUbWhTHoolhD36fLiBiIaIOs25Zl5kFFcKGUGg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ebCjeOvaulQERynvWrx3hfspVtRMRQ8AxcKgtpbRGdZgvU/HenK9+qoZ81dImyb0ORrA8TiURMiwHz6hvmTrURZxIBnCGoP9zlcBAG18ZfjAb9EwCOICtDeU+ngUqy45KizKui5VhAGylJb0OqV6OSd47lCCOjSlzYcdPMLEoEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D824gdji; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE52C116C6;
	Fri, 20 Feb 2026 14:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771598400;
	bh=LyGi7WUbWhTHoolhD36fLiBiIaIOs25Zl5kFFcKGUGg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=D824gdji96H9YLjbFCmQ8fVAjmNLvwra3pwmKYw5uCISZY31jtd2+To6uoGcjkrDs
	 acjMI6czymR6HxyJsuiGraTMwkIvPNo8pF1t27iPf+pmoWhuC7/iXV19IohLjtSRQK
	 eTlraURi1ylx6nJSse+6KBZPPAo7MaSZHHb96iacJtU1zdphMbyfXmjkDR2EGM5ljv
	 kIW9ZEdyhgvF8Q/0qaL5PIcSM0oGAdJypUPmLjgzITvYPKmdjWTAMdPDGSQDCNJzj/
	 8Po0LGqr0Z1oM7eTWQR1haw5wzSlf2vPs4RE3LCcQRmGjEoTH4GrSIoOs4IbZImUqb
	 mLoWmyeT2znCw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D0893808200;
	Fri, 20 Feb 2026 14:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] Bluetooth: hci_qca: Fix confusing shutdown() and
 power_off() naming
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177159840830.557111.11680373477755318049.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 14:40:08 +0000
References: <20260212141721.69961-1-johannes.goede@oss.qualcomm.com>
In-Reply-To: <20260212141721.69961-1-johannes.goede@oss.qualcomm.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: brgl@kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93514-lists,linux-arm-msm=lfdr.de,bluetooth];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 86AB8168709
X-Rspamd-Action: no action

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 12 Feb 2026 15:17:20 +0100 you wrote:
> The function called qca_power_off() is actually the hci_dev shutdown
> handler, rename it to qca_hci_shutdown() to make this clear.
> 
> While the qca_power_shutdown() function is actually the counter-part
> of qca_power_on() rename it to qca_power_off() to make this clear.
> 
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> 
> [...]

Here is the summary with links:
  - [1/2] Bluetooth: hci_qca: Fix confusing shutdown() and power_off() naming
    (no matching commit)
  - [2/2] Bluetooth: hci_qca: Fix BT not getting powered-off on rmmod
    https://git.kernel.org/bluetooth/bluetooth-next/c/e08fdde76adb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



