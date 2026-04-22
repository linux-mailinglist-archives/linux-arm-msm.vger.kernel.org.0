Return-Path: <linux-arm-msm+bounces-104031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IG9EE+N16GmVKgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:16:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E977C442DCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 505953012E50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 07:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E8D36EA99;
	Wed, 22 Apr 2026 07:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oss5zUVs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D29285C91
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 07:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776842208; cv=none; b=aS43ZUihYJgzRlENOysQUUMBbWrIUxL+VKRt23KeVl5Arj8ED5/l6nXOGN2NV0vqUl7+O73Ie7RzgRfxqloqcYc2r/wOWsPFhSMpzuFbFeXqjti7QZKGiGheS2u0JDHYoXymCIGaTpklrzlTNW3JMgxoVrbwzS9iUKrDRH3fupc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776842208; c=relaxed/simple;
	bh=JB/O3NuR4tHscVJvMmJA+JU1Kr2r/EPo6IUlX8twg4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IMT+JcuQHw4GDLdGHGFZnhP//ckuGvpYhEdu/icHw/gacyiVmpxbTnoB2ODlQ2OJxYGQUmxFR4JqAXBYfTGpEmMlb8qeGZlY3RdrB4j0Dwqa68R43IUuDAaGDW9cFN2aRQ/VTTwCYI9k+VPExE7FZke8goI3tM+NfHkdCk5iHvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oss5zUVs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C462C2BCC4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 07:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776842208;
	bh=JB/O3NuR4tHscVJvMmJA+JU1Kr2r/EPo6IUlX8twg4A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Oss5zUVs1Ezi6RIUOgFsd6CGxX56HcivnF+LWw/aY3vZBoR9ZCWJLiObnnytyGDH0
	 2toJ2sMyx8a1dO3zZj0Eg0D/SsKOSzvrlcsW5jhy8dpdr8lKpOVJ1h6At4xcdn7fXJ
	 UNihRLI1UNEulU+Dcjl7h6He9zNM+g927rbTlvk51Wsm/egffccFO9oSlvM6NN967q
	 ZSujOb59B6xXTrKlxBVjDcF7E7mwqMJRzler1agpbJZM23SMZnXjSoo5vw05NL68pf
	 prqaiIZkP5hNWoqCkyyVwF0ELNs/VA698NYkXrFtDgt6ztKtk+9ooR2QEHgQ/qrwX7
	 MDiqIG+OBUkzA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38dd575bca3so55838631fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 00:16:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+WyU9uz/P7n32iaRQVXO+K6a4FD2g1BTn7KNEA+U9UwbMVGh0wZkaDQaCYoG2/Wo4db9htaXrG55MG34kV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzkp2x1h7dITEOFBenB5Q4vos/DpQmXhZWrDlE2Fu1Q49nG6yb
	aAw4AlJeQw5toEEvvWkhgMQujyrDOmrcsycwNdgr9oFmc3Ou3EIDz8d5pQZY2kHBW1LPY33G1QT
	PkrTlXe5VmSAs+o0rVBSrHtdPYNouyz3AVEmdLTHFiw==
X-Received: by 2002:a05:6512:3ba5:b0:5a2:b370:f796 with SMTP id
 2adb3069b0e04-5a417287a78mr7069734e87.10.1776842207254; Wed, 22 Apr 2026
 00:16:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
 <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com> <1f6727c3-d10d-4f04-9492-2cb99c95d1d0@oss.qualcomm.com>
In-Reply-To: <1f6727c3-d10d-4f04-9492-2cb99c95d1d0@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 22 Apr 2026 09:16:34 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mdgq0j=GZDKAmMLvcNxasaqgjw81LGSNE=HDw62y+TQWw@mail.gmail.com>
X-Gm-Features: AQROBzB91ktIqSEanATpSQYfO5W2aGTuawwl_sH4BrBrccaQc8xHBi1o_bv2zoE
Message-ID: <CAMRc=Mdgq0j=GZDKAmMLvcNxasaqgjw81LGSNE=HDw62y+TQWw@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: qcom: add the TLMM driver for the Nord platforms
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104031-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,arndb.de,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E977C442DCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 8, 2026 at 11:59=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/3/26 3:27 PM, Bartosz Golaszewski wrote:
> > Add support for the TLMM controller on the Qualcomm Nord platform.
> >
> > Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
>
> [...]
>
> > +static const struct msm_gpio_wakeirq_map nord_pdc_map[] =3D {
> > +     { 0, 67 },    { 1, 68 },    { 2, 82 },    { 3, 69 },    { 4, 70 }=
,
> > +     { 5, 83 },    { 6, 71 },    { 7, 72 },    { 8, 84 },    { 9, 73 }=
,
> > +     { 10, 119 },  { 11, 85 },   { 45, 107 },  { 46, 98 },   { 102, 77=
 },
> > +     { 108, 78 },  { 110, 120 }, { 114, 80 },  { 116, 81 },  { 120, 11=
7 },
> > +     { 124, 108 }, { 126, 99 },  { 128, 100 }, { 132, 101 }, { 138, 87=
 },
> > +     { 142, 88 },  { 144, 89 },  { 153, 90 },  { 157, 91 },  { 159, 11=
8 },
> > +     { 160, 110 }, { 161, 79 },  { 166, 109 }, { 168, 111 },
>
> This list seems rather short.. are you sure it's complete?
>
> And could you confirm that it's been synced for the prod verison of
> the chip?

As discussed privately: this is indeed correct.

Bart

