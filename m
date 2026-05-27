Return-Path: <linux-arm-msm+bounces-110017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YA1/LKYcF2rw5AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 18:32:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 208075E7CCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 18:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A3A7301BF77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 16:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D559B2C0F8C;
	Wed, 27 May 2026 16:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SPQGzuWn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD26742EED7
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 16:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779899202; cv=none; b=jgQOMcqibpLTVexw3Mbr5c7cFfsSAYdQHvW1AfOulARgra3XBN82pBQrRC8P+UspohBG5FLdEQC2jA0dPvxnhvY95xDLwA311Azmzuny8U7fc/rB5qlIDiJdFT0Shj6PErjh8M+qLJVnh8OOdTlMyGS8BhDtvkZOr6k7y11IgI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779899202; c=relaxed/simple;
	bh=8BV3+khZegmizDJn1lokr/0ihOHmzM4T2I1EjFqoDR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dqXFdQ8mdCaXZhaN0ASQDD0vhP7EO+QU+JEkXMne0dqDceThi8zIckYbo01CvoE3M5YL59N0J4eu4zepPRHMBhXEay+vchAfHNn/raNpPKDsK1XY8iqGuiOOsQuUfvN6xPGXyWahhEK095+BtcmbqfPpqT4nACR38NWH0KiA4+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SPQGzuWn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA411F000E9
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 16:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779899200;
	bh=8BV3+khZegmizDJn1lokr/0ihOHmzM4T2I1EjFqoDR4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SPQGzuWng1XUqH4CdCnby9ZPZT0k5igngAvULTpHJgh16mV1Ob0T4Ud8Q+fBAdBbn
	 XXcM0nd7HERu2v7HXL8buIyKieWIg7HbZLckpIuzCjznDyLz5Xww9JzgYV4zOF5MUT
	 kqZmDjrPuJ3xfdp9huqWd1M0FX5Nm6Pa+4xz5Ph2fS+45RHbSSiXhG47aUQaiDZkw4
	 n2IVR/tgnnTBLNZSlQYNKEUZZXdsiMi+w6tThzEtvK1DyzByrSSV41tYJOY1LjO1fh
	 HOQ4YO3myfVF8RA/egMUmfthCKO/ALX50v4n6UdQ2buYHqSghqLO/pp55RXLKapxBd
	 6Ryfp6qFzpZeg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa4bb157c6so1029516e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:26:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/5p/2JyL4N193DbYzi4TuE5QHAKJ3s9xTLDl7HjcnHmX2Y8VrvfHLcYxFLqymWm7NoTbv0hAu6y7yFrdqP@vger.kernel.org
X-Gm-Message-State: AOJu0YyOnLn/IAW0DLhjMkgQ3SmOitFi6GrZUdEb+YhwrlcE6+4CGlT3
	3XHHWLz2DyGdNdXhQKYZPUyBGCVL9rP9yaAGJLgZFTPCe0eo/KpE8M4fCa1nBZObeGHWoSJ7ILr
	h3G1U/7D0bdHnZKJPOYRBiAXam3Xomz8=
X-Received: by 2002:a05:6512:3ba4:b0:5a7:42e2:db4 with SMTP id
 2adb3069b0e04-5aa323a16eemr7894312e87.15.1779899199187; Wed, 27 May 2026
 09:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522141149.1425711-1-zstaseg@gmail.com>
In-Reply-To: <20260522141149.1425711-1-zstaseg@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 18:26:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLmRRjna7MSQ3UYKW+Buq6_yYRR-_wrmd0Ye-FNmoOwbLQ@mail.gmail.com>
X-Gm-Features: AVHnY4I2h5cRGGGZTMq4EXlNnEHAWl2FcAS1NNMEEAQsvczyEUSeNfIJyyteYCA
Message-ID: <CAD++jLmRRjna7MSQ3UYKW+Buq6_yYRR-_wrmd0Ye-FNmoOwbLQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sm6115: Add egpio support
To: Stanislav Zaikin <zstaseg@gmail.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110017-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 208075E7CCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 4:12=E2=80=AFPM Stanislav Zaikin <zstaseg@gmail.com=
> wrote:

> This mirrors the egpio support added to sc7280/sm8450/sm8250/etc. This ch=
ange
> is necessary for GPIOs 98-112 (15 GPIOs) to be used as normal GPIOs.
>
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>

Patch applied!

Yours,
Linus Walleij

