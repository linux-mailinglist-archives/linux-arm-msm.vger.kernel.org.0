Return-Path: <linux-arm-msm+bounces-93922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uByOFd5UnWk2OgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:35:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C380318317C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5F3F3040309
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6809364059;
	Tue, 24 Feb 2026 07:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XOak9il8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B54536403A;
	Tue, 24 Feb 2026 07:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771918555; cv=none; b=dvoHFNnb737uXwC8nJugWfWzzXDpzkLt4x0fy6qToviQyN6Y7wyCRumMRlQ+GkhQxdsKVEZM8vguvaOGtHCyEPM80L1VhqdfZQvBB43bBIM6rUwGzrvFhrX0kZg1Rwr5jTihvLjxeeRZSbD7zkDMu9XAN7Xhou0/drytMblGjgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771918555; c=relaxed/simple;
	bh=IVfZkoXJxDi6b+zjGc37nGBvxy39t5lfDaYpg5IiQ18=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NPYzo2uD3GlxeKMgQt1jbmj9re9vDlEN215NEjZmT1y5VkSzz1T/eCY5bj7vwNeWf3200ZN8kHx3OcXCm0FCMFlixoNn6lyAtchQdBypV4KHs10gPGz5+6jqc6LBViL45fmCYXFQB3ClAw2r1EWwvIyYX5h6MZ7JJAJfo964Hyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XOak9il8; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fKqJj3vndz9v89;
	Tue, 24 Feb 2026 08:35:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1771918549; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IVfZkoXJxDi6b+zjGc37nGBvxy39t5lfDaYpg5IiQ18=;
	b=XOak9il84GKUF25NbeqzG8ijyTJO46bPRWA/EVX9xwga8VKSej2e7A1FFduO6ZBWysxyBs
	a7AKVjfco2hmV1EU3a4iqwneZq3z3ncf1V25NvqZbSxN5fyJxjUtrw6+8bmaHz31PvAQ4k
	k6mXPOSsC6NOe1/HS2dj4GqQHaP4GVQhe1oiFpvq2cNOd2UaUhjYRXtmpQGLZfuNydAb/4
	PEi4AMyaibbpf79ZbyW7Z8MSSJB/U78uhJycIhXZ4W8jpOKRdsfjlfog549l13djxeFIIq
	p3HHqMeZuiii3zThwARvv3f59i2gtea/IQolmJIDMj9KxZzxmapTS5p6QopkEg==
Message-ID: <0fdfb3adf756bc88f3b903c65eaf922d0ca3f9a8.camel@mailbox.org>
Subject: Re: [PATCH 25/37] accel/qaic: Replace pci_alloc_irq_vectors() with
 pcim_alloc_irq_vectors()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Shawn Lin
 <shawn.lin@rock-chips.com>,  Oded Gabbay <ogabbay@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, Bjorn
 Helgaas <bhelgaas@google.com>, Philipp Stanner <phasta@kernel.org>,
 linux-pci@vger.kernel.org
Date: Tue, 24 Feb 2026 08:35:45 +0100
In-Reply-To: <d69a2cc9-15fe-453f-b647-41c5ead7a1c7@oss.qualcomm.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
	 <1771862143-89507-1-git-send-email-shawn.lin@rock-chips.com>
	 <41d7d63f-bcda-4182-9340-54d480473586@oss.qualcomm.com>
	 <6f0932f0-1e08-62a8-eb92-2380bb9f6928@rock-chips.com>
	 <d69a2cc9-15fe-453f-b647-41c5ead7a1c7@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 01de5d21ec9ccf1901d
X-MBO-RS-META: 7a1ugrctpmr8a9s8zuwom5k1ec3jmfq4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-93922-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: C380318317C
X-Rspamd-Action: no action

On Mon, 2026-02-23 at 09:25 -0700, Jeff Hugo wrote:
> On 2/23/2026 9:15 AM, Shawn Lin wrote:
> > Hi Jeff
> >=20
> > =E5=9C=A8 2026/02/24 =E6=98=9F=E6=9C=9F=E4=BA=8C 0:01, Jeff Hugo =E5=86=
=99=E9=81=93:
> > > On 2/23/2026 8:55 AM, Shawn Lin wrote:
> > > > pcim_enable_device() no longer automatically manages IRQ vectors vi=
a=20
> > > > devres.
> > > > Drivers must now manually call pci_free_irq_vectors() for cleanup.=
=20
> > > > Alternatively,
> > > > pcim_alloc_irq_vectors() should be used.
> > >=20
> > > This seems to break bisect.=C2=A0 Surely you should update drivers be=
fore=20
> > > you go changing behavior.
> >=20
> > Patch 1 introduces pcim_alloc_irq_vectors() and then convert all needed
> > users to it. Then the final patch(37) remove the implict IRQ vector
> > management in pci_alloc_irq_vectors(). So the individual patch for each
> > driver should be safe IMO. And if these patches go via a single
> > tree with acks, it seems unlikely to break bisect.
>=20
> There is a conflict here between the patch description and what you have=
=20
> just described. It seems like the patch description is wrong.
>=20
> The patch says that pcim_enable_device() has already changed behavior,=
=20
> and now drivers are broken and must update.
>=20
> It seems that the description should be updated.

+1, the commit message should state that the driver patches are cleanup
preparations.


P.

