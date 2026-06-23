Return-Path: <linux-arm-msm+bounces-114133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id opy3Mb5QOmqw5wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:24:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 162176B5C4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:24:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hXVefddq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114133-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114133-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 710D53011769
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 09:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D413546FC;
	Tue, 23 Jun 2026 09:22:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1244C306B31
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:22:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782206533; cv=none; b=sdZTIQrHCWSyJvOWbEt39bli7X3P3Zlr9MRr2yDuc6DKlev/n9sSgEhplEaKW/Cwc+vVbJaXnbJkVxCm6wcBzu9Qgu7WGamwa80aBaqNjjKTt6fH0bdyYbJETLdRx8SX1xtwVr2+tZA1NuRsrj+JLlesv3buK0+uyox8pxjsQUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782206533; c=relaxed/simple;
	bh=BjYFjjYFWXXaRcbM9amn2CN5ewJnGQBstGlQKAhgHZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9mz+wWDWLLSnHi3wGZoX4LyjRBlhiuz49ix/nZFfR0LYArtDHwASQOtwKmwzqV/CZ5COFZtPF4Bvsk37lmYMszBvevy1NBFLOzBUIZFkMQsd0hG4/Y1+01yEF0pz82wFKe68+VqTFT+5PG8UnTp5f1e5aHeBRIz7i7zL9MFyUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXVefddq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C057F1F00A3D
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782206531;
	bh=BjYFjjYFWXXaRcbM9amn2CN5ewJnGQBstGlQKAhgHZE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hXVefddqrWWCvoLid4QdtT+3kzCUcruK/bkZqtE0GEaJtP8ol6AzjMr86K3Oz750H
	 FGn4DzbQEWprhyEL05RpmcvlnsX0RkmXM3IjazP5hScW4+P3eAH2hr0CP/MG5P5EoI
	 rFCeprhsPYIDVMqTMr4fCgEmCleC/vc7Iatfb4hIU4Zdd7BTboKcF66pJDWkq21CmV
	 dhwP/4QF2qTBBBa9DcNQhc7LmzmSeLqOCbQTyipIB943Tc5PFkQ0QwPP4BmpWfZ/ul
	 I4mr4YAD2Mut52FA004ROBgnO4Dpb10xaF4SIfSo4XEkdL0l+pLLVS6PP3cyazB5c8
	 S9jbUAce4e0Ew==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa68cf9123so5816179e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 02:22:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8RUK4xbgS17Dsioh6uuHPVNyuyr32hk82Cqk9OyKJL1hz8eI7rj7mWnESuK6dFsDxHGCtxhu7mhdwxm5QK@vger.kernel.org
X-Gm-Message-State: AOJu0YxCRLo8oeWDOxDwAaRbV1KxCgbzQvXJ3EZLWkwxdLbBw/kV5Ow/
	rPA1rfEUMXhlS486fMk65JrHMMa/uwqViFii73l9tyRTypMVS9774BKW7CE28crBKLtPF4NTf0D
	ViyLRn+kiJpeWN21F3s9MZGC+/mvlDzo=
X-Received: by 2002:a05:6512:230e:b0:5ad:4d25:b4cc with SMTP id
 2adb3069b0e04-5ad5770930emr6071403e87.34.1782206530446; Tue, 23 Jun 2026
 02:22:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623015415.26975-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260623015415.26975-1-pengpeng@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 23 Jun 2026 11:21:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLkDzhTkreoCF7tVVP0=_Gg++R=kRaqn-98XMbjU40XNDQ@mail.gmail.com>
X-Gm-Features: AVVi8CfeBecEx8PL1SizJYgGkQbSvNCP1jL4dnhzVQvcuV4eSSy1Pi_qLaXZHUs
Message-ID: <CAD++jLkDzhTkreoCF7tVVP0=_Gg++R=kRaqn-98XMbjU40XNDQ@mail.gmail.com>
Subject: Re: [PATCH v2] bus: qcom-ebi2: use managed resources for clocks and children
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114133-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp,iscas.ac.cn:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 162176B5C4C

On Tue, Jun 23, 2026 at 3:54=E2=80=AFAM Pengpeng Hou <pengpeng@iscas.ac.cn>=
 wrote:

> qcom_ebi2_probe() enables the EBI2 clocks manually and populates child
> devices manually. Several later failure paths can then return without
> disabling the clocks or without relying on the driver core to undo child
> population.
>
> Use devm_clk_get_enabled() for both clocks and
> devm_of_platform_populate() for children. This lets the driver core
> unwind the resources automatically and removes the hand-written error
> labels.
>
> Fixes: 335a12754808 ("bus: qcom: add EBI2 driver")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

This looks good to me:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

