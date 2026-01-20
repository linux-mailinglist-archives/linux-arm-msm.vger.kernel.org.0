Return-Path: <linux-arm-msm+bounces-89877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yB67Esnqb2m+UQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 21:51:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F34E54BC2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 21:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 949CB84E2D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 18:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED236426D38;
	Tue, 20 Jan 2026 18:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euZznOqu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B96243968
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 18:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768934919; cv=none; b=iHHQ6K5SavwWKG4bS1C4wnvkEhB/Xik/5/VKETITXqVQLqI6bu18ETY18BkG6gxTth9FYpxWGdYM/jupuxlxKy23exxJNWNU9WexqSj6MoNShJlWzYnX9iJTsu7hUWqK+Pkz6rXDS59CMjoNzQgYNe8YKg4DSC0hV6tM8Nvj350=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768934919; c=relaxed/simple;
	bh=drG1SQN+AsjzTCbMJvLZtYAYUAmZcK4cTcQDrZGghAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRxSG0G6nEObGSLk1Qc06JnnZyESPzIoAp4CUyTVWi6C5cZzHshy6v9M7yRBGrtIclSYR4YtYHYcLwwbYvzjF4wmmMFrHJQYMFE1ePTMzyArmDCBg+gQ7d5PGVmhsgixYq8tHCgawegMGE8NMAx36OPGlN6+P6j2gjHxAwSNalI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=euZznOqu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7FAC2BCB0
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 18:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768934919;
	bh=drG1SQN+AsjzTCbMJvLZtYAYUAmZcK4cTcQDrZGghAo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=euZznOquWPkEXVHqxPv+esJhCbdLlQyR0suZJOCRmOTBGCZPSzLpwVZRitLDLDXiA
	 zcJ4iYPApuN6b44YSswhMlKC/dzETV0/fVFvkDrM53aoaBUdREfqU9qJfmuL1+lMQc
	 bs7z5S8rYEX2LQ9uQT9ALN3AEpdPu3C9TXoK9YZRj/Jrw2rp0ByLCQCAD5UNnQA7QW
	 aJL8MzoOmaz3+KuNDer8AZ6/W3tMWE4MruQ0OTSghNDe3WwK2nyjVuvEi5HwkMkLE0
	 AJwRxOw9rYwUigudm2OuiKo3iMUpz5rfRuc+iZfKJkCX8rVZNufe4dCaPFZZPrgS8o
	 skeCzW41V3d/w==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b7318f1b0so8778778a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:48:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUn1k8a2Ie9XjKro84SWWRi+FR35Samf3L0tWPH/kSleQBjHh6cnl0GA0kNAmg6p9BIyCRwgk+0CTC4LBJ6@vger.kernel.org
X-Gm-Message-State: AOJu0YzJuUXHyCKH+LMCJU6E/nsGW58XxEScMz33YRalUuMcCdqUYHPe
	/o+BLxAOWqxW9cqhEXc9l2VLnsS03mG1adHyldvBWJJHuRsH6j2mQYFpdjeACLRrJ2FNOWvuhU6
	JOCUJ3EggAjqxcZobj5vIOodytrUQ5A==
X-Received: by 2002:a17:907:3f21:b0:b87:25a7:3ea0 with SMTP id
 a640c23a62f3a-b87968f6e82mr1320288066b.25.1768934917862; Tue, 20 Jan 2026
 10:48:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com>
 <20251031-knp-ipcc-v3-1-62ffb4168dff@oss.qualcomm.com> <20260116162057.GA1681736-robh@kernel.org>
 <af235d3c-cbf0-4cb9-af3b-37c1600d421c@kernel.org> <CAL_JsqJyRa-U03XvPNchpoyYNmSJQacrYs30yd=a_s-6PnppSw@mail.gmail.com>
 <CABb+yY3BczzocDR_Z49UO92iF9KLjq94EJZ10qy_aga1GrSBvw@mail.gmail.com>
In-Reply-To: <CABb+yY3BczzocDR_Z49UO92iF9KLjq94EJZ10qy_aga1GrSBvw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 Jan 2026 12:48:26 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLukNhEM99y0TmC6c2G-c0tLYOC7RPQdD-6J0x-WRLYog@mail.gmail.com>
X-Gm-Features: AZwV_QhAWEDfaDYzaxubNs-nV6SqEtAZmmDPdO4VaY_50k69XNd_c8bGvTLo74E
Message-ID: <CAL_JsqLukNhEM99y0TmC6c2G-c0tLYOC7RPQdD-6J0x-WRLYog@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: qcom: Add IPCC support for
 Kaanapali and Glymur Platforms
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89877-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: F34E54BC2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Jan 18, 2026 at 12:37=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.c=
om> wrote:
>
> On Fri, Jan 16, 2026 at 11:13=E2=80=AFAM Rob Herring <robh@kernel.org> wr=
ote:
> >
> > On Fri, Jan 16, 2026 at 10:25=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > >
> > > On 16/01/2026 17:20, Rob Herring wrote:
> > > > On Fri, Oct 31, 2025 at 12:41:44AM -0700, Jingyi Wang wrote:
> > > >> Document the Inter-Processor Communication Controller on the Qualc=
omm
> > > >> Kaanapali and Glymur Platforms, which will be used to route interr=
upts
> > > >> across various subsystems found on the SoC.
> > > >>
> > > >> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > > >> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > > >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > >> ---
> > > >>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 2 ++
> > > >>  1 file changed, 2 insertions(+)
> > > >
> > > > I guess no one is going to apply this, so I did.
> > > >
> > > > If your patches don't get applied, please chase the maintainers (Ja=
ssi)
> > > > to apply them.
> > >
> > >
> > > This or it is an effect of known problem with mailbox and interconnec=
t
> > > subsystems - maintainers never send notifications of applied patches
> > > (neither publicly nor privately like Greg does), so you will never kn=
ow
> > > if anything gets applied.
> > >
> > > This as well could be in the next silently (wasn't in 15th Jan, thoug=
h).
> >
> > Further investigation finds Jassi did apply this and 3 other patches.
> > Stephen reported a conflict on 1/6 with another Qcom patch
> > (conflicting with Bjorn's tree). No reply to Stephen, but *all* the
> > mbox binding patches were dropped.
> >
> > Here's what was dropped:
> >
> > f8f632c18c32 dt-bindings: mbox: add pic64gx mailbox compatibility to
> > mpfs mailbox
> > 945dc11a38a0 dt-bindings: mailbox: qcom: Add CPUCP mailbox controller
> > bindings for Kaanapali
> > 66b6e5daa915 dt-bindings: mailbox: qcom: Add IPCC support for
> > Kaanapali and Glymur Platforms
> > 9a92e22740e6 dt-bindings: mailbox: mediatek,mt8196-vcp-mbox: add mtk
> > vcp-mbox document
> >
> Yes, I had to reconstruct the mailbox for-next branch because some
> patch had an issue and the pr was not merged after a very late fix.
> Sorry I didn't realize people not receiving pick-confirmations was so
> problematic. I will make sure I reply to every patch that I pick.

TBC, the issue is not so much sending applied emails or not. It's the
not applying patches for 6 weeks (best I can tell, this patch was
never in next until after 12/10), and then dropping them silently.


Rob

