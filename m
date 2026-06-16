Return-Path: <linux-arm-msm+bounces-113330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HV/NHOQAMWoxaQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 09:53:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6C568CF76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 09:53:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZlCFqkSq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113330-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113330-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAE86300A60B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 07:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B07940803D;
	Tue, 16 Jun 2026 07:49:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CC029E0F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 07:49:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781596158; cv=none; b=fYQBi7q4WNSNX2Qbuf3Qx5qWZyQ1L4Kg0LqMTqbJqCcgO8bXD10ysfx//WCTkTp2oOQ97DNfiroFZCDP6BVpbWeKDI070LrFuH4BaHdaNNGPzfJdsaiSdv0bo2Z0SZfMW6CK/QKkdouXduNrCEdZ/+IEdEFXp8QXY1L/YQXyQKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781596158; c=relaxed/simple;
	bh=rMzvxrAFf7w9v162EK2aq1CNbTyCn8hNCo1RDuT55PI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IjdukI8eUCU8kYRXm8e0R8pY0SGCGtHTI0Na0bZK0uK/DWLrqLaLMoZ9Ankb1g+jnKBL0RVFAEyn1dlBTnoogHU849Z2vZryDY0Ie3VUEn6TWGCRzudXiKtkEFPR7urpFU+x0Sd9gQOpsvd5YhKh6Y6nnVv0mV6yUzFEExvhgDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlCFqkSq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5910F1F00AC4
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 07:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781596157;
	bh=rMzvxrAFf7w9v162EK2aq1CNbTyCn8hNCo1RDuT55PI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ZlCFqkSq7TfuPcLBSyPVNk8s9rIgjt3q9hhSvpn+68PAVBc1Xw1R+rVKYWTIXNUVk
	 vRm2gqC5L8GGZM81b6LVw2jwsBwAqwhDR+6vrtXpKUYDxV0BZLpRdLl/HIDy8GQ0Er
	 gVKYHPNvLZ7/ytw7QF77Vx47h4ea6KpwEvNBX3/qysY0MlIU1XYceSKhhXO8BsIcci
	 q0u5SoQadRu2o7h4YNU/JNqM35AhbGTdIipSyBYuQqMkVcluqiym/gyUrpdOyI4a67
	 KUCb9W6g4E+1RejGCEUVSuyk+urpeXEGm4VrRd4WWFEXswK/4jZwWt4n0YgEa1WShs
	 8K00p9T8IuSZw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-396770cdcfdso37267591fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:49:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+RkWNa8OvODs3dBnSwoSweStFdW3gAoy7r2Dyxf/YbAIVeXPBYB87jR/fREFmIM81AeU4HKjqQg9/YA9ut@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxx/cuvWPuGIdF9uC6h28eFIY16FmSpErVUIEbUm+SqjaVEIQA
	n5+lXWxE3pcoKJcEDPWodBKbHhp1hHg9o4wdcTc9dBLPheg05wozj0+z67faooNM3+3tq9p2VbI
	i9xuorT0sPwVat6hOi5xXVjJl4gye08XwHHXwaEvIsA==
X-Received: by 2002:a05:651c:98d:b0:396:6a01:a781 with SMTP id
 38308e7fff4ca-3995c86286fmr8713461fa.26.1781596156054; Tue, 16 Jun 2026
 00:49:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 00:49:14 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 00:49:14 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260614152605.701754-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614152605.701754-3-thorsten.blum@linux.dev>
Date: Tue, 16 Jun 2026 00:49:14 -0700
X-Gmail-Original-Message-ID: <CAMRc=McqG4oRyB7bc59Qz_i1d9-zXmC4EF+McRCrpR9ivL1hPA@mail.gmail.com>
X-Gm-Features: AVVi8CfGD7DcvTT2XOaw0oxzt3n2WfhHJZDdsXF8EBjBeO6QxY9RX6ENZakEeHY
Message-ID: <CAMRc=McqG4oRyB7bc59Qz_i1d9-zXmC4EF+McRCrpR9ivL1hPA@mail.gmail.com>
Subject: Re: [PATCH] crypto: qce - drop unused scatterlist traversal in qce_ahash_update
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113330-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,linux.dev:email];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:thorsten.blum@linux.dev,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE6C568CF76

On Sun, 14 Jun 2026 17:26:07 +0200, Thorsten Blum
<thorsten.blum@linux.dev> said:
> Commit df12ef60c87b ("crypto: qce/sha - Do not modify scatterlist passed
> along with request") removed the only use of sg_last, rendering the
> scatterlist traversal useless. Remove it and its local variables.
>
> Also remove the redundant hash_later check, inline the source offset,
> and assign the number of complete blocks directly to req->nbytes.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

