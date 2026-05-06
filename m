Return-Path: <linux-arm-msm+bounces-106075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JNNEhn8+mnjUwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 10:30:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1CE4D7E2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 10:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62C10300B195
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 08:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55313D0907;
	Wed,  6 May 2026 08:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fg4KUl6U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ACF3E121F
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 08:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778056208; cv=none; b=UBGhAWTp+S4ZVqKCrj9qQfboQKr3c8599ysbND+b4nh9gLunzGECRFp9eqSi3nNVgSHIh2j1O/TsPZUf9KzeWZyHuAsHQkT4hkrBYnngYv5f5rWZodvOsXJBEGQxkDoNq7N9l3C1C2eWHCShaRJiIpnR1louZ/8R0sRYRmQ3TBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778056208; c=relaxed/simple;
	bh=9jsCfJ77aRZ+EQUR5mk8tkC1C2blxzYZk6FFbWtFFN4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EyA3UQLtEPHbyCw3MYO/1KYVHHsNGVQy71a5oTfPadaLSGOmeKmIIk65u8dGNoCFcHaUquT7ebqSafG550w6DBpNSOhZ5OrPTO55Ziljd4rpc/dHngtr7KvERjdsOhm9KesuHk6htYq6xRI11JFoNhWQhFCJ40iHIfyTMsxPBbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fg4KUl6U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C003C2BCB8
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 08:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778056208;
	bh=9jsCfJ77aRZ+EQUR5mk8tkC1C2blxzYZk6FFbWtFFN4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=Fg4KUl6UPGygVcAGAEON8467PR7zMdd30ytZEGGvC2OE7ESv6SJ0PPk8DUorJ/AyJ
	 3BotXOrB06ohe68bo3ruAcdm5d3y1UU9Ika4vvxDX8UAHGeiFxYPZG5qOTsNp9POw7
	 PytzCQUUyrSkVCKJRu2FRcEUqrOvNNuNEf07tpiWQ+RGvfCEy+g2A9AgVA/hFqLS48
	 tUpVwbQvicdG3DINjzyp9TXuDyvzYoAdD5mTzUjetpqHfNHgIXI4iTpQTuh8eZj6ss
	 MbqI4q2lh2duD9Id4ik1W9JE44SDuHgWyI6qROTQ7fUqAsPHCNQsBdrIKNOo+fQMA5
	 IsyUTk5U/owSA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-392445f11c5so8858311fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 01:30:08 -0700 (PDT)
X-Gm-Message-State: AOJu0YwAp70Rq5Mr3Jj3r30nIDwUzZD4HJyKNuN5yMu26Dnsta7W2Aj5
	3MR8S2nzdeXuiTA2BKbHA7srHbdqtYHSXDrTStYm2ewzXQq9E3wcAIyQ46M9Blkt4LsyIDh+bXA
	mtzrWP56LaNyxit+C1yzxWXGukoNatAfO6JoLNTTknA==
X-Received: by 2002:a2e:ad13:0:b0:391:1570:b6a6 with SMTP id
 38308e7fff4ca-393c515dc32mr8708051fa.12.1778056207163; Wed, 06 May 2026
 01:30:07 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 May 2026 01:30:05 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 May 2026 01:30:05 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260506-serial-dma-stale-tx-buf-v1-1-e3ccb360d719@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506-serial-dma-stale-tx-buf-v1-1-e3ccb360d719@oss.qualcomm.com>
Date: Wed, 6 May 2026 01:30:05 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfYowRSM3Ng4nPUwwcnPJJO_b5Bnff1bQ0+=nTymjSU5Q@mail.gmail.com>
X-Gm-Features: AVHnY4IxiCU56DY3SHuvlTt4PbWJmBIT3psLIm54c1U5-W8OVA5Eo5IvT83J1Nk
Message-ID: <CAMRc=MfYowRSM3Ng4nPUwwcnPJJO_b5Bnff1bQ0+=nTymjSU5Q@mail.gmail.com>
Subject: Re: [PATCH v1] serial: qcom_geni: fix kfifo underflow when flush
 precedes DMA completion IRQ
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: DE1CE4D7E2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106075-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Wed, 6 May 2026 06:45:21 +0200, Viken Dadhaniya
<viken.dadhaniya@oss.qualcomm.com> said:
> When uart_flush_buffer() runs before the DMA completion IRQ is delivered,
> the following race can occur (all steps serialized by uart_port_lock):
>
>   1. DMA starts: tx_remaining = N, kfifo contains N bytes
>   2. DMA completes in hardware; IRQ is pending but not yet delivered
>   3. uart_flush_buffer() acquires the port lock and calls kfifo_reset(),
>      making kfifo_len() = 0 while tx_remaining remains N
>   4. uart_flush_buffer() releases the port lock
>   5. DMA IRQ fires; handle_tx_dma() acquires the port lock and calls
>      uart_xmit_advance(uport, tx_remaining) on an empty kfifo
>
> uart_xmit_advance() increments kfifo->out by tx_remaining. Since
> kfifo_reset() already set both in and out to 0, out wraps past in,
> causing kfifo_len() to return UART_XMIT_SIZE - tx_remaining. The next
> start_tx_dma() call then submits a DMA transfer of stale buffer data.
>
> Fix this by snapshotting kfifo_len() at the start of handle_tx_dma()
> and skipping uart_xmit_advance() when fifo_len < tx_remaining, which
> indicates the kfifo was reset by a preceding flush.
>
> Fixes: 2aaa43c70778 ("tty: serial: qcom-geni-serial: add support for serial engine DMA")
> Cc: stable@vger.kernel.org
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Make sense, thanks.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

