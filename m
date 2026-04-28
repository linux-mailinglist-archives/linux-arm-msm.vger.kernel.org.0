Return-Path: <linux-arm-msm+bounces-104952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGCmMJCF8GnhUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:01:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B83482174
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 290093023E2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DAC3DDDB6;
	Tue, 28 Apr 2026 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzY5q9rj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDC43D9DD4
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777370318; cv=none; b=G4D5r0AeZN35ohMw8V5uwFByYY3PkGr4V4BV6vFO97UUsl6PhVsQ9Q9OY8RK/y9LoEHG6r1NKXPXuRG4CHamgWnxPR1lwopJzt2slYkBJHHpPJQHC/4EBSDpH0dYv4WgYwSrtbB81WwmfInm9o0lSwv9o8EojegragB1gCej4o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777370318; c=relaxed/simple;
	bh=0VM2H2C2hwGUItK8S4PLSnAjkj1Ji+Oo+H6J9aW/Ihw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfBU12r3dEsid8S8+reLYeQ1ptk9uJkoqgJAS+Ig5j+wvk1xqDYAId0UDKqQhPAtTsBc0bkoA7XG7WM1asX8dEKhuhDPLGD7RWGGvw8XIfVu/AeKkqE2HqXox2h/GcbrUfXk4d2NkTd2B/gJSWT9Jtie67qhqSQbn0NsyeN9aEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzY5q9rj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32680C2BCB7
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777370318;
	bh=0VM2H2C2hwGUItK8S4PLSnAjkj1Ji+Oo+H6J9aW/Ihw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NzY5q9rjkWIPxYinDXEM59uDGzWa3rPXQ8tTgKdGCM//He1CaDX8lTz2ScSWo0fvY
	 VZ15OJgSyYIZeeXOVmqKOTVi+r8Q/1UY+QqAu1UixiQOvCa1MAgXsqyQWXjG+j76G6
	 hmkrGuxsJ0oE7UJg8IHi2jujxOYiuw+Ds7yRduFQ3l1IXm4KNk1l77R7MODyTk6bog
	 Q3RJeW/RY8gC+doxpwKyxuX4lNYCLJL0F5oMoeyPj/dtANhhUE9U8upyvZLUSq0djy
	 T4tO/m1qUJYzqtLESlJKZyv/4J4OAQm+7lKWGFssDHyQqd4gZKcQVtt8cy3POxWdk9
	 Kz00/+6tsra4A==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38ea6a5a0b3so110887981fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 02:58:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/YBEc5caEqo/lPfuOwJYT2Nr3TZRPvMj+pMWIuWs5q2QcADSGhkEPMLSOe+ErkjfG5YQtzssuxGJtSJHjd@vger.kernel.org
X-Gm-Message-State: AOJu0YwbHnMl5Xzd5fDGGu+t54Dadr2mgjwN1pKfGYzjyixOb6fPH/Mt
	SNGivWcdd1XhE90qM6JSPmfKrGsjXm4IM3oR4Q3+98gGJviAEdEkv69WGiOrS2M9fksbbQqoOoa
	7e/WocZYsKsm6ch5tqImOf19XHkH4ifs=
X-Received: by 2002:a2e:bc01:0:b0:38e:a842:52f1 with SMTP id
 38308e7fff4ca-39240d0ff9dmr8405501fa.11.1777370316908; Tue, 28 Apr 2026
 02:58:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424-pinctrl_irqchip_states-v1-1-85286f078916@oss.qualcomm.com>
In-Reply-To: <20260424-pinctrl_irqchip_states-v1-1-85286f078916@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:58:23 +0200
X-Gmail-Original-Message-ID: <CAD++jLkvi2zRL9=0QbCpuFgpC=eOJ8x_Sx0pKc2Hji=eb14o5A@mail.gmail.com>
X-Gm-Features: AVHnY4I8SIjfS1N3Fggn1anHgZWJpnz_lOjjr3CQC4QM9LvWcGTgKBYb6RvlpBs
Message-ID: <CAD++jLkvi2zRL9=0QbCpuFgpC=eOJ8x_Sx0pKc2Hji=eb14o5A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Add irq_get/set_irqchip_state() for msm
 gpio irqchip
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B5B83482174
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104952-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Fri, Apr 24, 2026 at 8:31=E2=80=AFAM Sneh Mankad
<sneh.mankad@oss.qualcomm.com> wrote:

> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>
> MPM irqchip monitors the interrupts during SoC sleep state and after wake=
up
> replays the edge interrupt by making it pending at respective irqchip by
> invoking irq_set_irqchip_state() API. The msm gpio irqchip however do not
> implement this function making it impossible to replay the gpio interrupt
> on any MPM irqchip based SoC.
>
> Add the missing irq_get/set_irqchip_state() APIs. Implement only
> IRQCHIP_STATE_PENDING case which MPM irqchip uses.
>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

That looks smart and also super dangerous so I need more Qualcomm
maintainers to review this and ACK/Test it before I dare to merge it.

Yours,
Linus Walleij

