Return-Path: <linux-arm-msm+bounces-110361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fWMRDvbHGmqC8wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 13:20:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF6460C6AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 13:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BA95302769B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 11:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC95D3A6B8E;
	Sat, 30 May 2026 11:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUhpNEzQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A6121E097;
	Sat, 30 May 2026 11:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780140018; cv=none; b=nu7u55SGqxpK2G29iv5efg15LI2WjKsE6Lpi2/OMBprN6Q+Cv0d6wDZqdjlv0LOxQu5tVfu4hKWIAZFmT64++6v0PSupRcO3/EXD25WG9a06s1FnQEdGb1HhLUFoVy8AA6cmfFk1gnXLcoq96dJB1dMdFNodisa458ErEjwmhCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780140018; c=relaxed/simple;
	bh=cHhx+MN9+XvSAhxRbv4CmSPSPYw4S6GSlXAs3cjago0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oybHmuhmt8OG89zxG983HqRM7Ym0OdBfJw9cshPCRt6Okesn72PUF8a0Hs3YM/5f2DwLQ55cMGp9wzNpJ7LfEggEbgU3xA9Bd57O2+U8+zq94QrbsPGAEm/eZvRX175xKGMWxnxebCIAJd7cL2mesVW01B0ZyJTzP8kBRJqNzRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUhpNEzQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2771F00893;
	Sat, 30 May 2026 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780140017;
	bh=bTTIrZBmCxm27x7l5/yVhHeLULKx99g4jNoxoWktCU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kUhpNEzQljMJVhIih74sco6BT6TTexle0n5qOLWlzaF/WcDqHeNdbXh9le6TwfK7k
	 EhiH/7aoKwlzHMUTQBczQ8anKaQzi0rnNty0Ny2fyN0ssYnwoLl7lYKEMa0qvSHwod
	 ORbzy+kNZ94VZaugFh/zoODVPbMc0n6LezqpC9K4xBMUyhjVUb0UuFxkxCFPjdq7/q
	 lY5ctwa+t4R318JRoBWuzihIvnqtvrVe46sAPRXYz5+FlEkCeoLuAdW8LmyyWAAyF2
	 WBz4BknRMf2+Fa0rkrD1OlxqhQ0AJqSL4vA3oNIvD2xWM6skdwWZFeQ4lpt/Ew8mhk
	 WmjFyyULIlUQA==
Date: Sat, 30 May 2026 13:20:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Amol Maheshwari <amahesh@qti.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: misc: qcom,fastrpc: Add Maili FastRPC
 compatible
Message-ID: <20260530-wise-discreet-woodpecker-3c7d0c@quoll>
References: <20260525-fastrpc-v1-1-ae9add881952@oss.qualcomm.com>
 <meuxtcs3quchupl6gf4vtjiosmoig7zs2tc2vr2xthetem5hll@l4op77zr2srj>
 <a7b4c0ea-0e02-4ede-8d51-a4c038d55a5a@oss.qualcomm.com>
 <moeb7zqqhengrd2nrqyuqydyq4pk4imd2uylmr4tf2ypn65h34@z33iifvtf7al>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <moeb7zqqhengrd2nrqyuqydyq4pk4imd2uylmr4tf2ypn65h34@z33iifvtf7al>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110361-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7BF6460C6AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 25, 2026 at 01:08:54PM +0300, Dmitry Baryshkov wrote:
> On Mon, May 25, 2026 at 05:37:23PM +0800, Yijie Yang wrote:
> > 
> > 
> > On 5/25/2026 4:37 PM, Dmitry Baryshkov wrote:
> > > On Mon, May 25, 2026 at 02:21:17PM +0800, Yijie Yang wrote:
> > > > Document compatible string for the FastRPC interface on the Qualcomm Maili
> > > > SoC, which is compatible with the Qualcomm Kaanapali FastRPC and can
> > > > fallback to Kaanapali.
> > > 
> > > Can I assume that it has the same bus width as Kaanapali?
> > 
> > Yes, the DMA width for CDSP and ADSP is the same. If you were referring to
> > something other than the DMA width, please let me know.
> 
> Thanks for the confirmation.
> 
> > 
> > > 
> > > > 
> > > > Assisted-by: Claude:claude-opus-4-6
> > > 
> > > Claude assisting to write a one-liner patch? It's becoming ridiculous.
> > 
> > This patch was generated alongside a set of Maili-related patches and was
> > not created specifically on its own.
> 
> Okay...

If a human cannot write and validate this one, I see as putting effort
on maintainers.

Dropping from patchwork.

Best regards,
Krzysztof


