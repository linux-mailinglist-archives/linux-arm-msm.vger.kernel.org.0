Return-Path: <linux-arm-msm+bounces-114877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TRSkCe4pQmq+1AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:16:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6856D761C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:16:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZXekYCG8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114877-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114877-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E86F83055338
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1BA3C0A1B;
	Mon, 29 Jun 2026 08:04:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609A6342539
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:04:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782720295; cv=pass; b=j+ZfQVqYn7jrQDiGmimut9mSNkD+LP9gg19w5wGKMZnUfSzFwdbnCBp/NsYgDw/jYavFbH6N0VEpVoDSX9ymxuwDUapOFhcGSDCL/yNkC92pX6TOW+bXb5aVa3+XNgoD2TJhUvIeY+XHrgEYu2OgqLtfLqyaubHCdUxggnVH6Xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782720295; c=relaxed/simple;
	bh=qb/Jl8OBR7LsWp9RSeOT+le399If/gM44rjjvFuSEws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DD3WnIz2q6QpErnQqaYkSYGTkdG+GJS8NVktH4NR7sSBX7mehlUzDVq4iiiIq1IZpBxxvOwzIEvsHZZc4G8fWtZsVQXbze6ZLvvgpR0yBTcy2SO5UYhVSSmPCyX+riJ3IWAv9A6qr4imBf5S50f/EtzZvq/AjtayuvVf9WYgb7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXekYCG8; arc=pass smtp.client-ip=209.85.222.54
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-969524c1aefso171892241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 01:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782720293; cv=none;
        d=google.com; s=arc-20260327;
        b=jxImCqQ3m2vlGCxLBwG3HQMpvSashliHlBQoVqJ3n9AYjQ9x596xSI2nlxi63wIoTM
         EKrA511Rld0aaAcOUB0oYADc8nmesR7L8Lq8GFNkajTYHFzkAxs2rjNvD/CJBx0nnx6I
         S7C7rp4gjaHNj+fS239vR+Bj1xEzImPgjDenMyd18Qaqj2CmAKlNASSe3BL50n5vcqLK
         3I9/YRjP+DFWhgVpw7y2D4HNSdM92QumWZcsE5j120+hUnF+BqArt9n7XlUx7Qeq0Gjn
         L0S5aUCUH6OJONYPEB4mRAt7FYKYQdwd0ywYCjGhS4pVNiyu8qmNDHRZLXuJu90Lymch
         BL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cLafhBxn/syeb/3P4J0V6pVOYzw0kjPfQXRFzRJWndY=;
        fh=86NCaIk0QpeLmfuZaHuwQvqbVPmJ7HkzkDG0uaDFiyY=;
        b=ZFXjqVlbZYWX9/UrcOg/Nm6olJz6BJAW4B/keMfodDPk5wz3sVWuooN/LqwK4KrRwv
         IANKdy/VZBQftg08AF9V24rcPtiHx2fgXMO7BWfJObsmWFYGcf4U+oK4sDrX+pDFhOxo
         pNRxk1Yi2WG58GZdYZ/4PS1WjP5gSmyjTVXINOwvKlv2I95wSB98GKS3w3FT8JW7sRJg
         IZGKPm4pYrRtEa5sqanRn3w8RKOhcKsA3zHHNDs5UOo1K5gDdmuBw3SCV6B9LMms9XIq
         xt1Ee/1pU8XZ7wKM88Ah6iUkVjEEeOcMsGzXK4LiENtw5evNlVo8Fae0yRPUTe15tByW
         gvvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782720293; x=1783325093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLafhBxn/syeb/3P4J0V6pVOYzw0kjPfQXRFzRJWndY=;
        b=ZXekYCG8O35/EsqE+32kkQ3P8Y2L6kwxoTExn/55zVTCrRDFOwmrL0rQPqu7j5fRU4
         l29+s2VhVyqag8BMO+9hD1RD+O4n5R86eVl79afKBSKWO/pL7eDc5XfcDecfnNmLQjOK
         WgM3S1ENYKonsCbA2sNlwLF6EU3BZOA3XsTaIGo7HjsZ7GPE/X1OJYpzbmpCJ2IC5mFE
         MY52XrIEHmoQ/XMVpZdy+R7g1oZB4s27tpsxEL5xGBHx+uTG7snnBCgbrk12pFlCIpdG
         KLcJ228E1PaInDiAlXPmqq52oqI0U/haa4KUxqRV9U9s80pz7nw/YQVOCKqSYgc6Tc+2
         Du9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782720293; x=1783325093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cLafhBxn/syeb/3P4J0V6pVOYzw0kjPfQXRFzRJWndY=;
        b=AWHlsFn+cab0RfgkprsltTNd2jEv+sj+alSfmNu56Yg7RXnfuTpp/QWKd6CkAvGhvi
         CyQaib1MIajlsz7gikskFAgoTSoTxEZnfZ9ggJLBJyVHQPxxVYvuf2Qlombzs2hgnyC+
         lmmbYImZD88zWSdCpHHjneV/zdCuPG3JNeQdCDDqfXueWRPTWTmyk0I085OZhTypYa05
         VCZgZAFc148Feb2ePvS/9WG60FRdJaGWzSANloBZn8/UO7KzGG/JazyjTtJxdjsdsllJ
         tCLJWaF7xTmAJu2hYcjxuOtmNsPSknwg1ITFNXEJHQDErxeOboDOMWoWXg6EprlNHBM1
         DN3w==
X-Forwarded-Encrypted: i=1; AHgh+RqdwUFKfO2gPGBTM4riPPlAhRtlfOYbXMQPELgFYP6ao/HDZiLM5uGTnnpMbYYzg2+xvEgMESIn8M9CFSQs@vger.kernel.org
X-Gm-Message-State: AOJu0YyqJSqXyAysLAChFg4dDPuDV4/guwc8CXGFUBrkq7xfppbBO+bA
	bmEFFjfh0UquI5S+Ful9qQJSTTkoL04Zv9I/3YyexCOXmnpJRUM7S1HtwippEfX9b5zsxsqfxLy
	cfawdBCJ+P3wAosGQyKDkEECt4N5SDgo=
X-Gm-Gg: AfdE7ckftKhxcl0vGKKSuTrv2okJ40vPxZjWB4hYNfjoHa+01LqmRl4gjadmG7TsrEc
	LNEk0EG9T2KRflMBn9ocSVHwswoAb3X6u2uADRTz/hO/05e0n1sJdvnk4e1Y/dlFMLECy3Yplnm
	UY+qXt7FOHoGhj7QE5alncAFu2vvTex47R4/CXYMWaZRgPX3zGm9AAl8HhO/s8xOO9hbDjpvYCh
	s6lnozeZvO6RHcfvMJV5cLx+I1JILyvTcXDx1zN8i6PFrLC6/niof9qtd/S/0lC2WYk/lh/OV6j
	8P2lcE94jG6JZjqMA+Z736tVhfBWODoobUhx9G0=
X-Received: by 2002:a05:6102:32ca:b0:631:28c1:154c with SMTP id
 ada2fe7eead31-73434452a9fmr6446524137.9.1782720293340; Mon, 29 Jun 2026
 01:04:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
 <20260614083424.464132-2-mitltlatltl@gmail.com> <qwbda435on6rhsbf5o4jqijakanjmnmswnc6g6qsubuqbyvbok@fuoclv6u7tq5>
 <c29776b4-04b8-4c59-8f1e-d766bf982a2f@oss.qualcomm.com>
In-Reply-To: <c29776b4-04b8-4c59-8f1e-d766bf982a2f@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Mon, 29 Jun 2026 16:03:25 +0800
X-Gm-Features: AVVi8CfV0vTEuw_OaCQ_mBABpEVc3al20mAjIqLbvt3oZ-TrUI_bjF0BO6hQB-0
Message-ID: <CAH2e8h75xeRVvo+jOjRuFaBko5NNCnBX0dawFFsWBaiTwNd4Xw@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114877-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA6856D761C

On Mon, Jun 29, 2026 at 1:36=E2=80=AFPM Mukesh Savaliya
<mukesh.savaliya@oss.qualcomm.com> wrote:
>
> Hi Pengyu,
>
> On 6/15/2026 2:48 AM, Dmitry Baryshkov wrote:
> > On Sun, Jun 14, 2026 at 04:34:24PM +0800, Pengyu Luo wrote:
> >> Some devices (such as gaokun3) do not disable FIFO mode, causing the
> >> driver to fallback to FIFO mode by default. However, these platforms
> >> also support GSI mode, which is highly preferred for certain
> >> peripherals like SPI touchscreens to improve performance.
> >>
> >> Introduce the "qcom,force-gsi-mode" device property to hint and force
> >> the controller into GSI mode during initialization.
> Why to force ? You can directly configure in GSI mode. Note there are
> some configuration done prior to Linux bootup too.

Sorry, I don't get it. how? I know there may be a qupfw, but it is
impossible for a normal user like me to generate one with GSI
preferred.

Best wishes,
Pengyu

> >
> > Ideally, this should be decided by the SPI controller based on the
> > requirements. Another option would be to prefer GSI for all transfers i=
f
> > it is available, ignoring the FIFO even if it is not disabled.
> >
> Yes, it should be decided in advance and configured accordingly for GSI
> vs non GSI mode. Because there would be limited set of GSI pipes, which
> will actually make must have GSI mode device run with FIFO mode.
>
> Why don't you decide prior and configure for GSI mode ? We don't need to
> change the current logic of deciding FIFO vs GSI.
> >>
> >> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >> ---
> >>   drivers/spi/spi-geni-qcom.c | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >
>

