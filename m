Return-Path: <linux-arm-msm+bounces-91216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHnuJ93pe2mtJQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 00:14:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4140DB59BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 00:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E5083004633
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 23:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1DB374748;
	Thu, 29 Jan 2026 23:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqjxFawN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAF437473D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 23:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769728474; cv=none; b=F28rActx8kAxNMJdzjfcIsvsI96mkXQUJcUfb12Uj4X/2+tmXSC/y5QZgG48XK44/sBR4PYRu3y+ADAC7aReCo4dhndHRPEFYV5HLj7/DeIISh5unupBmkavXrzdKWDrgKmVX/l9tad6LyKbVoAf2Bn0ZkZnahDKnbhmDN5Tk08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769728474; c=relaxed/simple;
	bh=CNkhoms0fVgkQcLTDpEcTgYvF746ADbHmb64eEZ1F+s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=frXeUENIM+uHWJzKlrMc2t/MDjPqhuN5Rkxz8TyS4h2ZADAOz9Bu7qgiURCJxynMpcA6RPjvgO0xKlnRNGV1tf5s9cY62i5T8An6HmDwFN39qOrctGOGnK4YmUViJrG2GBYNPdRwZlo+De/JTslXFfWF4Lo8KRDrBI7f4GNRNfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqjxFawN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee07570deso12734705e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 15:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769728471; x=1770333271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bYWxa4cZ5/1b/L5Q7G3vedzyBNRqZNi5CVbiTnOSeY=;
        b=GqjxFawNJJMxnwG+Oya6eE7X10SNnyZcxFPpSzpFPgeSuqtdueWHK6w2Bui7ip32K8
         SjQhZnvyxS5upyauwphj3k7CjNa9sO3mPQzKw2vyiUgN4G6Omgz2RdMDrsuit0h9Durq
         5iXJqdqJlOTWGLRuD0x07cMzpHaFyUPx5rU66tcrD6CxxUPzGPHOX18BfIETb70HK0fJ
         J9rYT6WJ76x5ZEoljyLGJOSIP8HUcrzrUgoAzBQDm+xLkF5fcHqsmXAIV+8Rwv2FjRB0
         t4uCsPj9fkQ1bGgT+GhD3X0ymvAdRwZ3/MOyYQgFyzV496igtSjMJ5o3vlTXvHJmMGQ+
         FGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769728471; x=1770333271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5bYWxa4cZ5/1b/L5Q7G3vedzyBNRqZNi5CVbiTnOSeY=;
        b=iG92FKJtA1+jyfpRDDf0DwmN/roQG+2xl3/MHgY+0s36+TWLVGTX6t59xi/z59G3co
         H2QJpWWu1Y0aJMCv/pHrDA8dhpti0opSVJtKDd1TKSQNlP8ayJaz/6W1n9LdLRQ/Barf
         oTHCryIHI1UCb7fsSvL3oc7BkGIGN5bPchfDLkmBH+/lFpsLkR1Dd7AiBCMjRDvfBJCF
         TxAJi+VzLeXHIT6ABrlfCGh3ddU5HpyYPyyyfXQJyqXnYReA7pWAbhWIAQmNpbKR4Hbx
         6LMn71XAyRwqKZhS+siWgnuIUZOJSPbCto5getqXLE5/KCVdJL7yQR9Ke5iRRRK7B7t4
         Us7g==
X-Forwarded-Encrypted: i=1; AJvYcCVKcj1wZ+yUmy9tGzxEZQ322ajOYY5EmuODUCbEldZIVnYJ4Lh43ylP6pKDOkx2vEcZKA4v8mPY13iM5xoV@vger.kernel.org
X-Gm-Message-State: AOJu0YyQXQYuYfra6w6LpaaKM45fTnHOiNwyzHKYYovGXSKIx3FQ0pnI
	G+yPMjqQPZH95Ue/Q1lmDLTkuOzObrJYIfa5c6w4qFQEePlGfZRyL2KV
X-Gm-Gg: AZuq6aLrKubUkj4luNy5Km7T6ETuWNLoo+P5Nfq9hoOZpeTxda4/EZ7vBgZOTVL68/t
	mguXenLhIxGQgznB7HkHiJfC38oDGLHwAbLsGZCRG2AYlHKRWn/VN1zyQxc4pvtu0FyB/eYI7kJ
	1Uy7jW7Vqmew91JemRNKH8pnqi/u1Zu28aTyeF+C8v/3kkUM3OaX4E3BHLtBNMwEtOZifv+cubd
	zSm3fn1pUslwB4v06XLkPMn5q1TYNFC0CaNaE90EuQhEMyRXB8UGYp029HU7kgDctxC1nE441KS
	Xh4y5xslwgqSd7vPd4OxWvtz9RfIx00i0VLZ/busbujaZdQBsL0V9QYfsCCy4OGrYTCmmop6VdY
	IafgT0VeYVsL9HBVx5QblfEhikD1d5AJ+LoOeIXVFjlH2MaugS0bD0bZLbQMbbrJMeVnCOb5GK/
	5Q22bOUphzLl+FHmX8L3fbo6O/Imyi3DR7jmY3+CRWa2eVuBdw6rd+
X-Received: by 2002:a05:600c:8b27:b0:480:1c85:88bf with SMTP id 5b1f17b1804b1-482db4998ddmr7562745e9.27.1769728471022;
        Thu, 29 Jan 2026 15:14:31 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354114sm18802203f8f.42.2026.01.29.15.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 15:14:30 -0800 (PST)
Date: Thu, 29 Jan 2026 23:14:29 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v3 3/3] misc: fastrpc: Support mapping
 userspace-allocated buffers
Message-ID: <20260129231429.52f280f9@pumpkin>
In-Reply-To: <CACSVV02ArZQYW0D66wCzcLoegAB+vUODDxfX4Vbt3xpBajRKYg@mail.gmail.com>
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
	<20251230110225.3655707-4-ekansh.gupta@oss.qualcomm.com>
	<z3tktit6jkxrkre4gm666aw3ql3plyhs6266cu2itrbjbj2das@yjp2pyesoszn>
	<69cb2d42-6672-4c42-935f-e3fff9bf38f8@oss.qualcomm.com>
	<CACSVV02ArZQYW0D66wCzcLoegAB+vUODDxfX4Vbt3xpBajRKYg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91216-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 4140DB59BE
X-Rspamd-Action: no action

On Thu, 29 Jan 2026 14:11:12 -0800
Rob Clark <rob.clark@oss.qualcomm.com> wrote:


> But looking at the patch, this looks more like mapping an imported
> dmabuf?  Presumably going thru dma_buf_map_attachment() somewhere in
> the existing fastrpc code?

I think I might have had a related problem.
I used dma_alloc_coherent() to get multiple 16kB blocks of kernel memory that
a device can access. The device has an internal 'mmu' that makes them logically
contiguous (from the device point of view).
I then wanted to mmap() a 4k (page) aligned sub-range of that kernel memory
into userspace so that it saw part of the same logically contiguous memory
as the on-device hardware.
Different parts of the devices (max 512 * 16kB) master window are used for
different things, so mmap() offset zero is different for different mmap() requests.
One of the 'old' methods still works provided the pages are physically
contiguous - which isn't the default for systems with an iommu.
IIRC there is a function that will map a single dma_alloc_coherent() allocated
buffer into userspace - but that doesn't let you offset the addresses
not join up multiple buffers.
I can't have been the only person trying to do that?

	David

