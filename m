Return-Path: <linux-arm-msm+bounces-116297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XtdrKL+eR2qkcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:36:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4340701E88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:36:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="nH/XqD44";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116297-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116297-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 443AE300D7B9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 11:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E193C3C12;
	Fri,  3 Jul 2026 11:19:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C08B3C062F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 11:19:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077588; cv=pass; b=oVL8ir2XMnUGURly0Lsd3AZE8QOZG0Lnj6B6Z0OVMiSdSS5+b8jdiP88s+uZn6po2F2XyC9eXgwa8FROtbDgSynjDjPo12Fxce4NNx60kD3Z9eWkDUuFKwkaECDIzwAytbn6ZX3jX6GyiVH1wdu5MNVvIBXxNn5NK9xKG3iNFtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077588; c=relaxed/simple;
	bh=XTkL4yGRK/zbi9Cyxhhj2/aMF+zh8RgXRgSHRjgbvAc=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uG2XkAsnZH582yb+fzMN4CgZeQdGwxVqvW38Yvdezv0Nkw4iAA70I2hnxtkuKBKWpNI08TMVP5j+P2XvlwcpnWQWwRIXXUw6CTltLnRGxcvjoZsUATVBCDP/+LFJ//NlA49ZQPgY0qm0XxqtAJVjwIMbT/tNd82S814lBG2lz6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nH/XqD44; arc=pass smtp.client-ip=209.85.128.176
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-80814edb536so4283197b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 04:19:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783077585; cv=none;
        d=google.com; s=arc-20260327;
        b=Mt9oc2OnSV63XKqKbJDqTfTX2ZhjypMRdRqok2SMuLYxVA8fm8uSu45HBhCP8ty+um
         hvupSmS/CQk3s/Sf0y/O1if/eQtGBqvTK6bl78H7ggidxVMcHnhzDD6KZdMt6agF/Zqx
         FHj2QAKBa9eUanArL6f0Yp9TxiumGv4DW4eX1BPO/16y/WmThhldgQpQ0dvwyJ7oatM4
         6RWiPmKdeW4jBzudVh4Yw0W3klZw02waC9lYB4iVtFkfsIZK1PQ63hkg4u7ZW10Z6UNF
         Ce1lsjRRHB9ssoCTnCIqRQROVNfTYQHDu2Iyp/5Csy5GTnHxgrd0I19tCOoyZiAHwtRz
         glWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :in-reply-to:dkim-signature;
        bh=XTkL4yGRK/zbi9Cyxhhj2/aMF+zh8RgXRgSHRjgbvAc=;
        fh=yDjs0O2a0LtG9POT8wY0vT1hc5AeMpIZWj/kpN/tf1A=;
        b=grv4rRW80cWj0S5V71ancIGc6u71de73FJL7zCMdyo4n3o2h1tSmzWc+0AXgXp+1uv
         aBMq+NfrZNiJoneplSvgaJ7T7MhoiLtVc25mS5cQ2EAQEYq0pMuJoXVb+Rpsa6gM+6ZW
         7+GQCzsXtc3kH0ZOvNI1q+rnXvTR2ZtlXDhqlWh5BP1rgLMERfTAzIP14p4IGQz3LoFQ
         Q9ZRid8XSod2NZyNv3hWCWwzEg56tVHS7r8aIO2QQUJ4DiPKVnDkpX6d8D82wVzxtmwl
         KD56sTfvoIIt9Qsi+QJNNOxwswne6VpEiBGEnuVStCmaiCPf/fhRLULqV8yQAfby526/
         211w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783077585; x=1783682385; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTkL4yGRK/zbi9Cyxhhj2/aMF+zh8RgXRgSHRjgbvAc=;
        b=nH/XqD44PFmX780L6BL4FHISvrQgSnysA5x5WYhpZubDYg3bW0hZKTFZ80fk453Jbh
         sVWYwAB8HeeVoEj1TJNbiSMznTousaTJ1ewqguV68664G/ZqANz32GgXYG3gJ7+NqnPL
         NMpc7mQcHuvdFjCuchmsiP89iyk7bYxK1QodDBJEhHyaO2FquTSxvXxQ6maTWFcKk2DX
         EeDsQkDP2HOHD17vXLc4JITEB28sTs3KD1lK3esPf6rp5OKShO2cIP1UU3faLfLGdwpN
         Bqxz6EF1Mf5tPEjaN3RX4Z8PLr62SOpTBhAm6LHMqUXTi4972aHRklhZsvBhxI82JuT7
         sJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077585; x=1783682385;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XTkL4yGRK/zbi9Cyxhhj2/aMF+zh8RgXRgSHRjgbvAc=;
        b=p67EGy3u2itDY3+mCJP8jJ0x27YgxL8rapTycTSXjBBFBCoVmHYf/XRwV7BuA2kD2c
         3E6UT8ikIf0k6j8fh2znEXH+U2PBMzS65uyc8qDc8/ff5xrTp/vOQv8TDTGqfROh53w8
         YO3Yow9DR51RIjMWExFCbgidxnEB/fPojRTN7FK56i+uws9Aq+28g4GirzNoXSJBzFCW
         dbmVj2MirB4pCr83piJPf5X1Zu3/Pf5UJh3F0rx7z/OrDQCtfxNDeZi3Sf1S3isLo+TU
         M1b7C77Z4EwaonsPEH82tz9LzaKEyw0C320kkAMSmUeLEajVh7D2K8ony5rsYQ6YPwqq
         PXQA==
X-Forwarded-Encrypted: i=1; AHgh+RpFh4WEy8nI/XQi7QYz6Xnh96JzktSS+xxXrbnPdNHxCpm0fVtJU+iz9chiHrsAayvN/Am8qjKB4GE6BxQm@vger.kernel.org
X-Gm-Message-State: AOJu0YxGZVGcAuLO/BwFHFPHMojrUnUgyZUpIo6jAZn8IYP3OV1Xwr5c
	Nx58Og5WRrj40oKeqx2attUaGwg23GeEcIf15PgcQVHHOviD0TEQVl4319jdLSLX8iXUer4Xkc3
	pX/q2cNBINBp2ZeWSsExL1SWZCbsu4dcgRQ==
X-Gm-Gg: AfdE7clNorGHhsX7Av+syGf8rj4Bat4B1bh4t9F/dXIGrywgXbqLjs/fs9u2wYHlt5+
	3ej0hTl3tA8HKnawRuorOG0SdUjKoQnnpgaiGWHfhH/UlZuwXtBbuJsO+KAvwZ5CyVG1cAf9PeG
	sgVs8rmM9zX06+RhQP7dpjfEQl7p8+QBY7jsT35DFFjX8WIUq88pdoxKNdQ/kuO517EZBHlpFlM
	CshTJNggQCGVfTn1BpWtiXWpBqR501WPMFGFw0jDqjlEZwFyxSut+R82fyJeRY8X9lpr4Z9oEct
	+R8HItUD
X-Received: by 2002:a05:690c:6011:b0:810:1db9:d5c with SMTP id
 00721157ae682-8138af803b3mr89706627b3.53.1783077584937; Fri, 03 Jul 2026
 04:19:44 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 3 Jul 2026 07:19:44 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 3 Jul 2026 07:19:44 -0400
In-Reply-To: <bb91ed5e-0fe9-4317-b73d-b28b593d4c25@kernel.org>
References: <20260624174410.6074-1-alhouseenyousef@gmail.com> <bb91ed5e-0fe9-4317-b73d-b28b593d4c25@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
Date: Fri, 3 Jul 2026 07:19:44 -0400
X-Gm-Features: AVVi8CfC61qA-zhGAfkEFZwRqDaaCWmYjf-vdXRpER3zSmKsqK8xOm7dSEAkn1g
Message-ID: <CAMuQ4bWgF+wFnfR-kSkSdY_iZcHpr6qP1e7fd1kucOGMGNPF_w@mail.gmail.com>
Subject: Re: [PATCH] misc: fastrpc: reject overflowing invoke buffer ranges
To: srini@kernel.org, amahesh@qti.qualcomm.com
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	ekansh.gupta@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116297-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A4340701E88

Hi Srini,

These are not fixes from a FastRPC use case I am running, and I do not
have FastRPC hardware for runtime testing. They came from static code
review. I used an AI coding assistant during discovery and drafting,
then reviewed the changes and ran strict checkpatch and focused
compile checks before sending them.

I had not completed a proper reconciliation against the current
mailing-list work before sending the patches independently. That, and
sending so many related changes as separate threads, was a process
mistake.

I am pausing this set. I will first compare every item with the
existing list series, drop duplicates and weak findings, and re-audit
the lifetime changes in light of the reported concurrency concerns. I
will only return with a small ordered series if anything remains
defensible, with the testing limits stated explicitly.

Thanks,
Yousef

On Wed, 1 Jul 2026 21:05:37 +0100, Srinivas Kandagatla <srini@kernel.org> wrote:
> On 6/24/26 6:44 PM, Yousef Alhouseen wrote:
> > fastrpc_get_buff_overlaps() builds end addresses from user ranges.
> >
> > A wrapped end can understate the payload size.
> >
> > It can also feed bad ranges into the invoke metadata.
> >
> > Reject invoke buffers whose pointer plus length overflows.
> >
> > Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> You have sent 11 patches independently, I would prefer it to be sent as
> single series.
>
> Are these patches fixing anything that your usecases are hitting?
>
> Have you looked at the patches in the mailing list which fixes some of
> these issues?
>
> Or
>
> Is AI generating these patches ?
>
> --srini
>
> > ---
> > drivers/misc/fastrpc.c | 18 +++++++++++++++---
> > 1 file changed, 15 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > index f3a493845..ba4ade874 100644
> > --- a/drivers/misc/fastrpc.c
> > +++ b/drivers/misc/fastrpc.c
> > @@ -13,6 +13,7 @@
> > #include <linux/module.h>
> > #include <linux/of_address.h>
> > #include <linux/of.h>
> > +#include <linux/overflow.h>
> > #include <linux/platform_device.h>
> > #include <linux/sort.h>
> > #include <linux/of_platform.h>
> > @@ -607,14 +608,17 @@ static int olaps_cmp(const void *a, const void *b)
> > return st == 0 ? ed : st;
> > }
> >
> > -static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
> > +static int fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
> > {
> > u64 max_end = 0;
> > int i;
> >
> > for (i = 0; i < ctx->nbufs; ++i) {
> > ctx->olaps[i].start = ctx->args[i].ptr;
> > - ctx->olaps[i].end = ctx->olaps[i].start + ctx->args[i].length;
> > + if (check_add_overflow(ctx->olaps[i].start,
> > + ctx->args[i].length,
> > + &ctx->olaps[i].end))
> > + return -EOVERFLOW;
> > ctx->olaps[i].raix = i;
> > }
> >
> > @@ -641,6 +645,8 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
> > max_end = ctx->olaps[i].end;
> > }
> > }
> > +
> > + return 0;
> > }
> >
> > static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> > @@ -675,7 +681,13 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> > return ERR_PTR(-ENOMEM);
> > }
> > ctx->args = args;
> > - fastrpc_get_buff_overlaps(ctx);
> > + ret = fastrpc_get_buff_overlaps(ctx);
> > + if (ret) {
> > + kfree(ctx->olaps);
> > + kfree(ctx->maps);
> > + kfree(ctx);
> > + return ERR_PTR(ret);
> > + }
> > }
> >
> > /* Released in fastrpc_context_put() */

