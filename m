Return-Path: <linux-arm-msm+bounces-109944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LyDJ3e2FmqGpwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:16:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 387A75E1A7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0B013009537
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9359D3E714A;
	Wed, 27 May 2026 09:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HyiFN1u7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9493E5EE1;
	Wed, 27 May 2026 09:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779873053; cv=none; b=P97OgXX9R7S0A++WLtpZwY3Ls+ud3XefIDKigJ5jFMPieHh7XjfR8p1rF/nuGQ5K/1kTqyBD5H2CcUvDqbhDHU72Cp1Bk5YtMu3QpqVc4QAYrL9Ed+oMEZL4fwaxE8adWzPOzYNB4DE9FxfbhdqqBFChKArLJBONiPknaXaGjLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779873053; c=relaxed/simple;
	bh=47d/Jm1aEE1PefKSf6IA+k5sCvWi9aR0JRO/7j5KjT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FLK7uBWI85fG1mR5YixeHTkgqNGyw9jNY9w4bgURK7lo/6yaC63lKrh3TrrUkqsb0E4V7C00svWI6qbxnwTZA/xItSzlkCoLzEXENgLOqqLMBJ9hvjDWGQ7At6zkfIRb+HSslvlv9OQpC/kLHp8hhSqFv0H0mnzIm3EPUR9wo+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HyiFN1u7; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 316D11A36E8;
	Wed, 27 May 2026 09:10:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F1AF3601A1;
	Wed, 27 May 2026 09:10:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53E0010888BA2;
	Wed, 27 May 2026 11:10:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779873047; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/Kn5ek8m5SLf/9jOedgJ4k0VlYp3m2eYak7kE4f8UeA=;
	b=HyiFN1u7e5cW49UJjE0d8bCVY2QSLyQ0u0paNb50vN6Rw2s5ORI/g5XyVV2aBPRBZuJXBs
	lxEBS37v5ZlUEX5lMFQMZW1pLrKAz9qjScz4BixAC/0UXCOuWRoQEknsxiAj3oN6UjHlfv
	XmdQypMQrN3Pnm+iC/JWxQv0uHWeEr0V6meG7BFrc+JizB1BF/NA8ps+ts2s8W1R0wxgLQ
	U6OWENZl21z0O9w/NEqyKnj9/wTXvs7Hi1stw5y5yDc0lSEwjg7bcNee0t4nSnyfYBpCWT
	0ZrvhzJUK14/22Ag3A2BOyu/Oyh3Om/M4515eMLB8CavAu2Jfyz6behIcJrggg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, linusw@kernel.org, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260525220440.94639-1-rosenp@gmail.com>
References: <20260525220440.94639-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: qcom: embed nand_controller into
 qcom_nand_controller
Message-Id: <177987304626.3986809.7144873679247622798.b4-ty@bootlin.com>
Date: Wed, 27 May 2026 11:10:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109944-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[lists.infradead.org,gmail.com];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:mid,bootlin.com:dkim]
X-Rspamd-Queue-Id: 387A75E1A7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 25 May 2026 15:04:40 -0700, Rosen Penev wrote:
> The qcom_nand_controller had a struct nand_controller *controller
> pointer that was assigned to (struct nand_controller *)&nandc[1],
> with the allocation oversized by sizeof(*controller) to make room.
> get_qcom_nand_controller() then walked backwards from chip->controller
> using sizeof()-based arithmetic to recover the enclosing nandc.
> 
> Embed the nand_controller directly into qcom_nand_controller and use
> container_of() in get_qcom_nand_controller(). The header now needs
> the full rawnand.h definition rather than a forward declaration.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: qcom: embed nand_controller into qcom_nand_controller
      commit: 7fbdbc7d028a20a78b7d28a9510a216c76b5fbfd

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


