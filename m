Return-Path: <linux-arm-msm+bounces-112264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z603GLZbKGrKCgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 20:30:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A0B66353F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 20:30:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cqmDTLWe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112264-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112264-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD283308D6BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 18:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387303F1AA6;
	Tue,  9 Jun 2026 18:28:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAFE32B13E;
	Tue,  9 Jun 2026 18:28:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781029697; cv=none; b=PPk2x47wtoYOY0sUIM/d6fjxjvMQ66ocEbaFAWC9hv1MHClzJ6lZiILZklarjCQ7RYii3ELzTbID777CHLuXYxAG0vdvvMmcaVZTUcJ/Kv7dbxJcviEk2hWdr/uy7olTV7nDEvWlklopbKx4zSRO1UY3uDA6sR77as3EWa0fj8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781029697; c=relaxed/simple;
	bh=zbFmqKfQAq3wkEORBEOg52z7+vDcmmR1bAbp6NeNQv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfSki7Wi8bmgYbyhozzsyWn8y2l91NkBVkM8u5xJ+Xs542bxrsc4ocUZLvSyQ3iBO6hshtNETAW+U1dX9vkYg/NGGIwdmd7KT7TX9wKtIEzgkTZmG7MROIDRJpCVagW4OtC5R28EEh2ZcfnSDRHfdBTUjmphdAuHx+zD8W1APL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqmDTLWe; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2BA1F00893;
	Tue,  9 Jun 2026 18:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781029695;
	bh=kn3N2mYYGUZSqN1nbkQv6n0uUW62Ml+CXOjbFIsr7Ek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cqmDTLWetSQVrX8VFAtNcVNal6iZ9ieLokhXmMpUgltW27XZzfSGTJLs3kAnUHtc9
	 zoVPtEGbTx9QgSos7JZepYTe/52lADn517Vabz79zFF39uAmebwRIykuDmCx0DcUie
	 8aoah9jemAir0fkqIH+iFexRZdDk3rKduDQOOj9lFi/KAQG1+Wfd28vIaj5uASp1Nw
	 hLL/wC9idT0JOkHxL5tufwvYSLkrpwpfDqbjbfKgMjeBHBfto3hGX/MlsGDf8zTYSH
	 JIOBRaPnw8ZCIXX31FTQmb4BUZMBBqNYgQFXvXTHUoqpfV0Jg/PgLQPMP1Zvn+gt6U
	 e7Z/taS1uiXag==
Date: Tue, 9 Jun 2026 20:28:10 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: Use pm_runtime_force_{suspend,resume}
 helpers
Message-ID: <aihahOVIqpm83Guf@zenone.zhora.eu>
References: <20260520-use_pm_runtime_apis-v1-1-6a5238fc6cb6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-use_pm_runtime_apis-v1-1-6a5238fc6cb6@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112264-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andi.shyti@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,zenone.zhora.eu:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8A0B66353F

Hi Praveen,

On Wed, May 20, 2026 at 12:44:29PM +0530, Praveen Talari wrote:
> The driver carries custom system suspend/resume handling that manually
> tracks a suspended state and conditionally calls
> geni_i2c_runtime_suspend()
> from the noirq suspend path, then adjusts runtime PM state by hand. This
> duplicates PM core behavior and adds unnecessary complexity.
> 
> Drop the manual state tracking and switch to pm_runtime_force_suspend()
> and pm_runtime_force_resume() for system sleep. These helpers already
> perform the required checks, call the runtime PM callbacks when needed,
> and keep runtime PM state transitions consistent.
> 
> Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

I normally don't take these patches: Where and when has the
review happened? The reviews has to be done in the mailing list
and I need to be sure that they have been discussed.

But, because I know Mukesh, because this patch has been sitting
for a while and because it looks good to me, I merged it in
i2c/i2c-host. But please, next time I want to see the review
process happening in the mailing list.

Thanks,
Andi

