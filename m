Return-Path: <linux-arm-msm+bounces-92349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AD2ZC8klimlKHwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 19:22:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D83051137CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 19:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2123303E392
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 18:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F220538A731;
	Mon,  9 Feb 2026 18:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DiD4IP/z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE64B38A728
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 18:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770661247; cv=none; b=BfdeF1CYUfJXGVtLMwi1tnbXYhXckvf4RUsjVFYS91GTU/lB8+56Ahqy/W3S9o4QIWuseSJBEaAWXOJLg5zECuqxC8o9/mINGi7W/pNBw/5aBWRj273JUmlSNGk3b7DrAFmXxnJc43FXn0iMQNK8g/JwabA3YkESVwMMKcMMPkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770661247; c=relaxed/simple;
	bh=Bo/kuLyDgYh1CiO9P4KHeVmCmdzPSEUP/wPbN7uIk/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T0ISYGXeluRqEQwYvHQIfWsZjRxCdUG+xNgq0VkEv1DMavl1LaAlV00OgHTxLjD0SSQSv45d5jerj9QVHw2EiN26kxXYir0v8NrehdCU2HI0O7aQ0GZPVXhGGlm5S2fZ80oaFKqXGZP+uI3mHJoP6sNqBHtGX1OQM1l98RXwafg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DiD4IP/z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F129C19424
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 18:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770661247;
	bh=Bo/kuLyDgYh1CiO9P4KHeVmCmdzPSEUP/wPbN7uIk/E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DiD4IP/zCbtYFLoHtEauAgYXNij/QYuqNjnyjBnpo3/JCOJPIPI41y+4ge9ZA272I
	 qZ/GSShpqzKPLYwbTEeTU4hYdq/Rn2MGlPF1PzYTj/CTq5ulwPuJxS2aLCFMpGerFF
	 SAQkCr+ypcJHP//uwDV78ZzwumNdcm07ehmBMYQxgPfY02p6TrednfrypJmDhbbGMY
	 8Q0CARRz4RINTp4yDiu5qHDIqN5IrV5niZR2gQ29zqIMWhdqnBwJ7J2HkuFowQcdXc
	 iCWojvpAFNTlDzSem+uieC6CJIugtNVxP0nwtQJuR/c1rDZ/GYMDD+/BRoeNWQanUA
	 c3Z5EyzHh0tmg==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so7251215a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 10:20:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX3BOwA9jMbd1Fz18lrYtNB7vo9Hpwa2SY09TPUnf/99iZz4MmpH/Ro1EgLPqusjzgiGdV9Q2sHkZpLj8WG@vger.kernel.org
X-Gm-Message-State: AOJu0YxBoi0C67QcAqnbl22Gg1Lpmwnsg+Py9q55CXl0S48V3r9R7bLW
	Qm7/KVG/WbwalrtVoekoDqKhX5Bv0t7zxtThwiasDJHbQWePPxbXpYoZqXFG/W2Yr72HuY8QIy6
	E3pZgRyuYUCsRKMS4ujUQrFNz5MSH/g==
X-Received: by 2002:a05:6402:42c6:b0:659:405b:548a with SMTP id
 4fb4d7f45d1cf-659843b21f7mr7007033a12.27.1770661246067; Mon, 09 Feb 2026
 10:20:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205070640.10653-1-manivannan.sadhasivam@oss.qualcomm.com>
 <bfba9d62-2741-47b8-8325-2d932c20c9e7@oss.qualcomm.com> <lnzmgsdjckbf6u5hxfqm4kzlmcg2cqvszcg7otmkqxaj3yzdfq@vu232xx5kts3>
 <CACRMN=eu7n+wCD3vRY-7GSKpqf3VG=oyDoQdeauiEHGK-q9pPg@mail.gmail.com> <2b86a7d4-7211-4154-a673-edc20d8c048b@oss.qualcomm.com>
In-Reply-To: <2b86a7d4-7211-4154-a673-edc20d8c048b@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 9 Feb 2026 12:20:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLBRXj7oqV6qiGjKG05fiQ=AQq1fPhG9dF6D83Lhhd7qQ@mail.gmail.com>
X-Gm-Features: AZwV_QioLjHvfY2fPp7XHKeXEh0eh5mQEeOjpnDtJjMuncwbKuG6ooiI2V2SRKg
Message-ID: <CAL_JsqLBRXj7oqV6qiGjKG05fiQ=AQq1fPhG9dF6D83Lhhd7qQ@mail.gmail.com>
Subject: Re: [PATCH] of: property: Create devlink between PCI Host bridge and
 Root Port suppliers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Saravana Kannan <saravanak@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, andersson@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, qiang.yu@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92349-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D83051137CC
X-Rspamd-Action: no action

On Mon, Feb 9, 2026 at 4:38=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/8/26 2:27 AM, Saravana Kannan wrote:
> > On Thu, Feb 5, 2026 at 1:01=E2=80=AFAM Manivannan Sadhasivam
> > <manivannan.sadhasivam@oss.qualcomm.com> wrote:
> >>
> >> On Thu, Feb 05, 2026 at 09:50:20AM +0100, Konrad Dybcio wrote:
> >>> On 2/5/26 8:06 AM, Manivannan Sadhasivam wrote:
> >>>> In the recent times, devicetree started to represent the PCI Host br=
idge
> >>>> supplies like PHY in the Root Port nodes as seen in commit 38fcbfbd4=
207
> >>>> ("dt-bindings: PCI: qcom: Move PHY & reset GPIO to Root Port node").=
 But
> >>>> the Host bridge drivers still need to control these supplies as a pa=
rt of
> >>>> their controller initialization/deinitialization sequence.
> >>>>
> >>>> So the Host bridge drivers end up parsing the Root Port supplies in =
their
> >>>> probe() and controlled them. A downside to this approach is that the
> >>>> devlink dependency between the suppliers and Host bridge is complete=
ly
> >>>> broken. Due to this, the driver core probes the Host bridge drivers =
even if
> >>>> the suppliers are not ready, causing probe deferrals and setup teard=
owns in
> >>>> probe().
> >>>>
> >>>> These probe deferrals sometime happen over 1000 times (as reported i=
n Qcom
> >>>> Glymur platform) leading to a waste of CPU resources and increase in=
 boot
> >>>> time. So to fix these unnecessary deferrals, create devlink between =
the
> >>>> Host bridge and Root Port suppliers in of_fwnode_add_links(). This w=
ill
> >>>> allow the driver core to probe the Host bridge drivers only when all=
 Root
> >>>> Port suppliers are available.
> >>>>
> >>>> Reported-by: Bjorn Andersson <andersson@kernel.org>
> >>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qual=
comm.com>
> >>>> ---
> >>
> >
> > 100% NACK to this patch. You are touching a core part of the
> > fw_devlink code to fix it for one specific case. This is not the place
> > to special case for a property or a framework.

Save NACKs for people that aren't listening and you are done
explaining your objections.


> I think the issue runs deeper. There are multiple cases where an
> OF node has children which represents sub-blocks of a hw block, and
> those may house e.g. a phy reference within. I'm not sure the code can
> handle this today.

Other cases would probably be for very specific bindings, so they
really have to be located with the code for that binding. It wouldn't
scale in the DT code. I'm not all that against this case (PCI handling
is already somewhat mixed in), but if it has to be solved anyways
there's not much reason to handle a subsystem specific case in the DT
code either.

Rob

