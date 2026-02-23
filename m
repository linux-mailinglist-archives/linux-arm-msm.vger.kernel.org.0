Return-Path: <linux-arm-msm+bounces-93651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBQqJo4onGm7AAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:14:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51177174AAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D92823026538
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD0835B12B;
	Mon, 23 Feb 2026 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tVoGP29w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9CF356A24
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841617; cv=none; b=M1/jBgKUFWQbGXnjjZ4PQb5ud3b9pv2KQkUUS0DE5LQuEb1NuqA2YuFNfrpcmAtMo3GVvPIfPe2VqF/SmQoHuTuB1nUTl2ar9mHiO+cimhQXjjLjOXSGif3ZOVT8Rac93x02LNi0WcaJ7wJK9QlOpI6ioa5IwsrN9UvUQW/LJYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841617; c=relaxed/simple;
	bh=v29ysssbhKmUZeirXXTcQ20HRknXFoWNBCr+bHWeqP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p87tsGdab5z2agGtSSiTC24iI++C9WIipVY7T3Yl2VnDCGygQJlLJAMoIA2G6z1i7sd6gNOf+hXeDgWfYGMFWqerEVJArp63aoaZhTEcExO80DM6boAFqSHSMEHNUyHc4drD1910FG6tJaRL9NAAAlOfAMVcm82GXUjVz6dBymY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tVoGP29w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BA2CC116C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 10:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771841617;
	bh=v29ysssbhKmUZeirXXTcQ20HRknXFoWNBCr+bHWeqP8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tVoGP29wM/rCChhlDMzH993+IS6KJfnc8IvHUlYkHXHCo7omswn7H2irOUYw9Cjji
	 ntSgY0RvH2YHfdjHQ0l7iMq4vZ6qc5CMEsdeKwHu3hWA/z6fxkdPnXoAzVZ63vVVQy
	 JQU6knoBSIQzpgPwkRykS7IOa/ird3PVbnddEZlse3TBx4/8kfWD8FCRD6LR1Qzx3/
	 aXgaZsGl1sI5f281i86dPT/ZRiuY6evEoxGi1Rhqdb40NLb2kIuCuuQjm8mkSitf31
	 8EiRUNEce5F728tRjmdmohVyGa5faaruc4o4R9aYlAB6Ad4O07fQLEbNkNmFhG1v1L
	 l07UewvDaSSLA==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79639c2d2b5so33212827b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 02:13:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfC1QHl13SbG3gV0viHa+wzcHZHh0CGR9ZH5ayKmo15K8fp+eZUPTOARrkxEEj0NIdEDkril6Yx0+cKIs3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw04nxRD+MbZoU5urJjmxLFchzpengCeSXrIt6jdtEFf9ySRfEd
	Hdi5L3E4t5wDtUD5eLOxYmkkH9Zy+5B6vhMjO+mt3CNQAK7fcUnuZE3MsES7R4y0UxmnIl04xc/
	BR5GTvERqG3+fRdNLF89V73dQNogLjDc=
X-Received: by 2002:a05:690c:c244:b0:795:123:5a21 with SMTP id
 00721157ae682-798291a3bdcmr71291517b3.62.1771841616250; Mon, 23 Feb 2026
 02:13:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209134529.725573-1-mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260209134529.725573-1-mohammad.rafi.shaik@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Feb 2026 11:13:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLm5K8j5i1L9-TiozmMpSVdO932yRLtKSLGrbTN1y6wBQg@mail.gmail.com>
X-Gm-Features: AaiRm53zHZfihajbGBV8iyuKSOus2OWjSO0GhGue1KGSnQjIgGWsvxNwaqLINoU
Message-ID: <CAD++jLm5K8j5i1L9-TiozmMpSVdO932yRLtKSLGrbTN1y6wBQg@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi-pinctrl:
 Add SA8775P and QCS8300 pinctrl
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	TAGGED_FROM(0.00)[bounces-93651-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 51177174AAC
X-Rspamd-Action: no action

On Mon, Feb 9, 2026 at 2:46=E2=80=AFPM Mohammad Rafi Shaik
<mohammad.rafi.shaik@oss.qualcomm.com> wrote:

> Document compatible for Qualcomm SA8775P and QCS8300 SoC LPASS TLMM
> pin controller, fully compatible with previous SM8450 generation
> (same amount of pins and functions).
>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij

