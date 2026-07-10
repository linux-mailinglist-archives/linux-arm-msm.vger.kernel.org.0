Return-Path: <linux-arm-msm+bounces-118243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fRDQHhzIUGob5AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:23:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD18739A44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:23:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=C4P3pPi0;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118243-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118243-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59C27308587B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 10:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDDF4071CE;
	Fri, 10 Jul 2026 10:16:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D92405C59
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 10:16:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678604; cv=none; b=eXAQLdSGytsnV7QSOn4H19pBIR17Y1ys7xWFblAblkseIpq0dJShUZ1ml+F4GSjb1gUgMmLySheLd4w4DmNEBtWROLcvhptx9l5cc1bVUxz+wgcpkW71AKEIh/zrYVDjeOON3r6e4ZldxXr1rfCL+2saV8sX9jdPeYEuVYedT+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678604; c=relaxed/simple;
	bh=WpzIuCokQ4MrEwYKLo46KJTnK0rdYgqEBzGo3w3VUS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LpkIMywBCAWJDAXMyMV/3oFYkxiqyFEQinxYFmTQGWGfzGRlkx8/R+Tix+NnzFxtG9Dzrbm3rZsJZBylYZ5wONRBWm1Q5fO2SZ/p8VtrONljqv+ktAeLbVHCJv1Nd8Rn4iIxvNmiAMrcFcJTv1nR76FswDzm+BHk/c1oTgZWvfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4P3pPi0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7733D1F00A3A
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783678603;
	bh=WpzIuCokQ4MrEwYKLo46KJTnK0rdYgqEBzGo3w3VUS8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=C4P3pPi0x1760xLzHAfhw8egcrieURyH4PwaBNWqJq7WbZOoH9hnnp5sBOvPDCgfe
	 2bjm3YjgCkV873clvXlEmzVHalBLGkAXqrzBVUQeFiluYMTYx92jGFpr05dEVs+J70
	 L5utlUa/z+N77ZGnDfz/DTuaDe8bAChJIcyddlpCUrH+yyIbI7XxqeFUoXM6vz1IDr
	 pUMCqT7BU884WiX5VZui6N3r13DVcwm7VomQ38xT6BSEiQIVuhvUoAS7ioGVmdstUq
	 kwBMBtjlJYh/z1JTrqSubmC0X6c48KVXWSMrp8HN5w3ujBwcdXRq16enZq/3p3E3gG
	 VQyZe5HNkaLkA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aec6360133so510945e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 03:16:43 -0700 (PDT)
X-Gm-Message-State: AOJu0YwKUXvVcXYKyE6RHIJkvtFomzPw5xOIIGmpAp/ueVqEh7kd+xaO
	030fmJ8q+tEuXJhh73THPDTkiHkO/78X5Vjk/2JUG425FqOHpB8RalGs0+lI5s5YPJrc3WX3k62
	VqbCoGFV0rwAQX6Gnlm9dwOxePW9fk4Q=
X-Received: by 2002:a05:6512:239a:b0:5ad:5800:1b84 with SMTP id
 2adb3069b0e04-5b01144ea5dmr2531427e87.4.1783678602332; Fri, 10 Jul 2026
 03:16:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710085924.8707-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260710085924.8707-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 12:16:30 +0200
X-Gmail-Original-Message-ID: <CAD++jLkZ=p2s32si2r3rgbV38tiSgM3iKHesvZ2pe4fL4TBnBA@mail.gmail.com>
X-Gm-Features: AUfX_mx5YvnHNux1QmBxMuKVmg6csRVpFUKUGPAe4YTXSTIWY3CveU9vAqzhOjE
Message-ID: <CAD++jLkZ=p2s32si2r3rgbV38tiSgM3iKHesvZ2pe4fL4TBnBA@mail.gmail.com>
Subject: Re: [GIT PULL] qualcomm pinctrl fixes for v7.2-rc3
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	TAGGED_FROM(0.00)[bounces-118243-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFD18739A44

On Fri, Jul 10, 2026 at 10:59=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Please pull the following set of Qualcomm pin control fixes for the next =
RC.

Pulled in, thanks!

Yours,
Linus Walleij

