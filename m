Return-Path: <linux-arm-msm+bounces-119041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MKFnGVI2Vmoj1gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:14:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 825D3754F38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:14:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TURxFoUS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119041-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119041-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13BB8300D79A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEED466B5E;
	Tue, 14 Jul 2026 13:14:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A21C388397
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:14:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034844; cv=none; b=hU8pElYzH3iM8lOBwVhm/C1ICurDBbGU50acndwDUIvoEPYFBsJ4F6RinbtkQoq7jVU8gnKBUQTXBkyaeG/fAWoDGNHRqkDB/v2CQwcLWHt6r2S8jZlC0CEFffqcq6QQqXOaTtCACRA5IJlGCHWuzKDdon63+ZGt63LgQLup2pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034844; c=relaxed/simple;
	bh=MtotPDhuzhIIvZBQmRSCVo0ZcnrH0YTdHYKCpqdh+5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u3BLH5x2yiqwzpMjzL6yAXgGx/Jp3DzGLOYl66+dg92xx7HQDDYmoOZSxs2IaMUEEX/vdOpbQYkWEEFMHxrrxeG1/hEhOhTMzu5ez4TSmREFvXBkWiHXTiYQnvDi01ZvQu4G3bsM+b/23/QdjM0/Ncmt9ZfgPnu3Ri3Mr/JSMYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TURxFoUS; arc=none smtp.client-ip=209.85.208.53
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-697564cb69eso1976612a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784034841; x=1784639641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ny5+3yiTMDoQJssQpPJVjH5n2qiBSxJZzbYo0RMA4qo=;
        b=TURxFoUSnQcZdZTMzki54XbbsritsNyE5wfUOwKJtz+XqjImvEPn0hzlYIn6Xb7FFH
         RDvzEA5MN8AXdrNoL8mc1aq2b+10fWDyOm9fHY7g1FREOMStaZC9WczDhx4+/7X5QRUY
         fHXD+yH7Y6flG1P9De8Xqm38X6etWOmf9/VipAJ5exzG9nFCbLC8BiIX18Twlq8osr0P
         +rPNI8cme+sVw+c8ApdPYEv3zdjgvf50+YY8+oqhfGmZnNB38lze+/y/t5dE+cdTFXEo
         DY4OQtpbNgh2BoEpPMyuhevxih+MxMIZk0DKEozf8tW++WEqYhzwNEVGTLxjrjB9IEyC
         siwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034841; x=1784639641;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ny5+3yiTMDoQJssQpPJVjH5n2qiBSxJZzbYo0RMA4qo=;
        b=Dt314lM9rFdOFzCVOEzAoH0hnGr+atBUa9RtfOegPFd+1er9AEXYgxmiqOLwJCB83d
         RIqb3wg9VyIHzpsqbTe90kFqob1j5K9ip1aYciS+3cPoMZ38/pcjdXSzPvkXW4oqGUrh
         dGhEgddpzpkMNt7nELE8QwtGHINAPr6I6yRCJAGcTJEUQSlWJPKkqN9USun0iCM7mCF6
         1P+ZgXNEI5ApAITPscsTMAPVWSbs1WYUvymfsdTqRQ6nvKMMwbe2eGGIC0KvwdFNbYIB
         yM91+elZXBHZaBorwyxsY3O6WoUeYE9pvSrQvnAH31W4OwA8FyHrBL9QpYrSFseYO0rJ
         UVSA==
X-Forwarded-Encrypted: i=1; AHgh+RqUbCssIIEE7wfIR0D4+VCwsIxUn17xzd42v36J20dxdBXcxzrVIumfOYIZdv+siVLjmaL0gV3YZoPtqYjJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzUAhzKqMPWJefv3t6pJ4DcD498I3AUH7ZEucvrRJAuSOCO5UUU
	3AYt0faaTIItFMPpYRTT2IgiPGZx9f5q22jVnVshToT2PRsuGgKOkvxf
X-Gm-Gg: AfdE7cligvRDoiSq1CpYlENjHwR0la/oJ0lIOcBPLPKh/KZwu/MImvPI8yzIaUBu+h+
	9c/JjZGSBy03FxLXBkQLPmxlxu9E1fF0czBK58XEj6rt1rtCEWOZe8ZfPyvqika4pfuGw3tWlO8
	4J2HmD8FrucBrGfpSG6be/z0ReCwwlxv4FtA2nnwsejoBwv+swHxOgGgLUn00HUBc84umCZ4opC
	3AfyOwzi2MArQzAWvSLsSZG+QD8jI+zgsjQavznfOcn5w5TgSQmOH1H3aii1bf6g0LRanH7i3WQ
	yyFrOg/ilzbC7GsyRvsy+Et2i3OEajT4JVkObzVWJXO2X9qt8pyeodmgw82K2hf736QznMelpHJ
	rBOU/6m/mIBQ217qgMpjXHKE9jEqIk/VTnvDPQZZe0mR5pf2rVSDK8Lu6LBb9kV5dvoWW9YXMYD
	vHnr/1YzYllRNr3oKgBJRDakfkyUEPH1b16zRY+B/U0LcCnzMlLQ==
X-Received: by 2002:a05:6402:1e8c:b0:683:e394:cc0c with SMTP id 4fb4d7f45d1cf-69c5ef84424mr6428415a12.4.1784034841275;
        Tue, 14 Jul 2026 06:14:01 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2952836sm1533316a12.27.2026.07.14.06.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:14:00 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:13:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Baineng Shou <shoubaineng@gmail.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, "T . J . Mercier" <tjmercier@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, Sandeep Patil
 <sspatil@android.com>, "Andrew F . Davis" <afd@ti.com>, Srinivas Kandagatla
 <srini@kernel.org>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dma-buf: dma-heap: don't publish fd before
 copy_to_user() succeeds
Message-ID: <20260714141359.7758575d@pumpkin>
In-Reply-To: <20260714114654.3885457-2-shoubaineng@gmail.com>
References: <CABdmKX21NHc2=9Sk2F-BFpu6is0vTg-QXLE+wiFNEPdsWWjvog@mail.gmail.com>
	<20260714114654.3885457-1-shoubaineng@gmail.com>
	<20260714114654.3885457-2-shoubaineng@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shoubaineng@gmail.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:tjmercier@google.com,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:sspatil@android.com,m:afd@ti.com,m:srini@kernel.org,m:stable@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119041-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pumpkin:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 825D3754F38

On Tue, 14 Jul 2026 19:46:53 +0800
Baineng Shou <shoubaineng@gmail.com> wrote:

> DMA_HEAP_IOCTL_ALLOC allocates a dma-buf and installs an fd into the
> caller's fd table via dma_buf_fd() -> fd_install() before
> dma_heap_ioctl() copies the result back to userspace.  If the trailing
> copy_to_user() fails, userspace never learns the fd number, but the
> fd (and the underlying dma-buf reference) are already visible to
> other threads in the same process and are leaked for the lifetime of
> the process.
>=20
> The obvious "close it on the failure path" fix is unsafe: once
> fd_install() has run, another thread can already dup() the fd, send
> it via SCM_RIGHTS, or close() it and let its number be reused, so a
> subsequent close_fd() from the ioctl path can operate on an unrelated
> file.  This was pointed out by Christian K=C3=B6nig on v1 [1].
...

My 2c:

The other option is just to leave it as a 'problem for user space'.
No reasonable program is going to handle the EFAULT return by doing
anything other than exiting.
Even getting an EFAULT is really an indication that the application
is already in a real mess - most likely with a badly corrupted heap.

Anything else leaves error recovery code in the kernel that is pretty
much never executed and open to a variety of bugs.
While the recovery here is probably ok, there are some sockopt calls
where it is all more complicated.

	David

