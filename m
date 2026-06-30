Return-Path: <linux-arm-msm+bounces-115451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x/YdIpPJQ2q7hwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:50:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF146E50B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 15:50:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AuCKrj2M;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115451-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115451-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D94B63030107
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A15934D4D6;
	Tue, 30 Jun 2026 13:50:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6562FA0C4
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:50:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827408; cv=none; b=AIT1I4+rAbOPY9JmaumgcZwW/Fdwn3KHNgZHJPdlZFop8+JPVGvhNEdH/RhWYrDK0LxkB6XwaLZ1qjivZ53cM7FrM87kQyq52ugEXYkSTcCFC8hnXdc4ZzxLiuwYWxMO1S/bHWgWIOPFeg5mNM7V9ncgzuI/zpsb+3MChIVDjyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827408; c=relaxed/simple;
	bh=bmblG1YkxhyKHp4iuTUnJaGVvYRvVQSxwy+OsjTCQm8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ve8JEXnhcdaNqfZ0tWtZrz+1lRmzPa7xEpmbhCwHO+fNqTL5BH9YtthUY+q1Xpgzd37ywFpp+QYVSoS6CcacNt98maGp9ATqFCT6pdKn4ko260PWH9t5Ql42YPctWBz8OgWcgQwLpS7VfKoecKOWcBn8T0oUnVeLiHJ20MdteaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AuCKrj2M; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C651F00A3E
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782827407;
	bh=yoO47upmMNryDYHVJTupXPHheIpbgY6GgTSl9z7w4fs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=AuCKrj2M9Nzeq+X0kcS7eW64Sff9nI8+c13Mmy5ztbiS6/Y4h/5as+cuQdRhaMlDo
	 nMBO8zUoRJ80vhoyoUSpHm0/d4P/WShXsUuJZkJFLJRy4v2uYVyOQj8Mie0rPhwaCB
	 FfvBd3WSKg6z4bZ4r9I9FAbCnOwP9mfS/4uYB20rnIH+Hl0dRJkxUaO3LwrEykqoi5
	 oiSLc/dEy/nUGoXm7a+mW+DgVEnTz4qINWGaGMEBEfM5sWXWZ4bZZ+ynBqMk+xGJxr
	 F2fwwuzPH3vHPlvUNW1vVYEXimFj1TKYzTX+7oUix3rwDl5wrJB0piSPebh0xOd/Rd
	 vOjPRlP+NgWJw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39ad5cc0a43so7104271fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:50:07 -0700 (PDT)
X-Gm-Message-State: AOJu0YygDQdLzEooj0sBeuYWXVFNYfOZQh0uOp5p2+9BOhI6FJT4CTcm
	/ssu+g23UHjrUNmkT/yzx18PfICCD5ncjz6GbbBp42rV5IXdpTzSYejOsIv8f1L7ZWLeNFVkw2Q
	BrdMRzvTQf3ZAATziuq72TCdwc7xD+H4rwHzNPSF27Q==
X-Received: by 2002:a2e:a549:0:b0:396:8c15:a4bf with SMTP id
 38308e7fff4ca-39b247b57f0mr5229811fa.1.1782827406024; Tue, 30 Jun 2026
 06:50:06 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 06:50:04 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 06:50:04 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260629141750.996853-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629141750.996853-1-mukesh.ojha@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 06:50:04 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdp1t6hZPTOGV3AHESe9u-044Ps7JaFk8KP3puTsacfAA@mail.gmail.com>
X-Gm-Features: AVVi8CdjBEK0V5K5OQyTYxjlRcgEQ_oVq71ABEPDemZDetw9h8JCw7w7DBhYxg4
Message-ID: <CAMRc=Mdp1t6hZPTOGV3AHESe9u-044Ps7JaFk8KP3puTsacfAA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Misc. SCM driver fixes
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Guru Das Srinagesh <linux@gurudas.dev>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Elliot Berman <quic_eberman@quicinc.com>, 
	Andrew Halaney <ahalaney@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115451-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:brgl@kernel.org,m:linux@gurudas.dev,m:sibi.sankar@oss.qualcomm.com,m:quic_eberman@quicinc.com,m:ahalaney@redhat.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AF146E50B0

On Mon, 29 Jun 2026 16:17:47 +0200, Mukesh Ojha
<mukesh.ojha@oss.qualcomm.com> said:
> Some of the existing issue reported by Sasiko mentioned here
>
> https://lore.kernel.org/all/20260624192213.C82691F000E9@smtp.kernel.org/
>
> https://lore.kernel.org/all/20260624192418.92B761F000E9@smtp.kernel.org/
>
> and the series is about addressing them.
>
>
> Changes in v2: https://lore.kernel.org/lkml/20260625093644.3918184-1-mukesh.ojha@oss.qualcomm.com/
>  - Separated the fixes(2/3, 3/3) as per review.
>  - Added 1/3 as new patch.
>
> Mukesh Ojha (3):
>   firmware: qcom: scm: Fix NULL dereference in IRQ handler before __scm
>     is published
>   firmware: qcom: scm: Fix reserved memory cleanup on probe failure
>   firmware: qcom: scm: Fix tzmem state on probe retry
>
>  drivers/firmware/qcom/qcom_scm-smc.c |  2 +-
>  drivers/firmware/qcom/qcom_scm.c     | 43 ++++++++++++++++------------
>  drivers/firmware/qcom/qcom_scm.h     |  2 +-
>  drivers/firmware/qcom/qcom_tzmem.c   | 13 ++++++---
>  4 files changed, 36 insertions(+), 24 deletions(-)
>
> --
> 2.53.0
>
>

With the issue raised by Konrad for patch 2/3 fixed:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

