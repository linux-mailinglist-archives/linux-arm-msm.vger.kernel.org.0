Return-Path: <linux-arm-msm+bounces-92614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC/4KYvMjGnJtAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 19:38:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC02126E46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 19:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 552763004417
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 18:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F6B352C4B;
	Wed, 11 Feb 2026 18:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dD4Bysm8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28736211A09
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 18:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770835077; cv=pass; b=JmRJCa0cJABX/Z2O82h4lI9rQ6JCK6AEtfpQNtttTdGHxEv+JQZS9aHtW5Zf94FKR/uZqRFhNtJ944GoHvcUJk4wNFBZ00IVy2H9QAcgo5G7Zk1oEudDe7OWBLgr7Rjc7ndTkssrIDlfNNhrryw/Zdj6AvMkLWkVifnG09hb8Wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770835077; c=relaxed/simple;
	bh=9ZWLjOloP1Q5uHjLNR70INYP0pXvmwZRE/FY/ppnIWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rwit4o9QhJQIR2uqbBOPKMCu0A/hYv7FfwtvIwEjkmrohBoltv7MxM+9VKoaUXtFb1jWHS+V97D9kDszti9BR5so9DvJDm+i57EhOlX8brsidSrhe6BTeekYJnZV/RkOwJRZWWgQf/fe/xS6Oat+SBppQ45g8HAoKEXisrQ5bkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dD4Bysm8; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8230c2d3128so1105273b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 10:37:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770835075; cv=none;
        d=google.com; s=arc-20240605;
        b=kloSw2UhipUYtq0fk2dpP5TwAXfiyKnazO1GIihtxkcCBsIoEgSRy3gV1EYC89zKyJ
         oqHwBevvvz7pJBa/zB0Z82F1rH+yUvkCXATakCdynnmzYvgdOny5BiAsaLY0AWGI+dJE
         G8vMbpvaNFgGM0E83QpkzgBEMWdwSbNg2XmzAwkLONELilTR7hqDnX48GcDjaIOIB30G
         SRgNBB6O0HNXQmO94ZbACOn5BbPeZRcHHQUyUuXtegz+C3JiqAT97FviVSutuHugsuQQ
         XS8Oi5pOHfkXcdDd/EM3nMjEDDFEXrHYUXzRaQOHsnYjJFuQkj4ZbN39iTcf4ARVUeOD
         JFcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NMPWpykIwqzVnKpU0MqZGbLM8pCJKBxgV4mw17dHpGg=;
        fh=QGk2OfXFeKXWmsPCT0SUlgPb8CTrR32jzsEll11fMFc=;
        b=bH1q+zpw0TMKbguHr+2HT93LcS0bTo5oiO4q3afPD2sr3VUqlDE9IwVnPZkv9SWg3M
         NEzsAPoov+7kpLp5GJuFGNc1pllphKNwrtuPB84Vm+7UOX1xufwnej61SsJ4jU7JGbPX
         CtduwVDK+NmwMaQz5xjwms2RGjqk0Bnw2c72Nm2sj+y3aDX+2h5F0MHbiaDwYoQ+M6v1
         dnjIdvV+NLnz/zob+WlRUvctECkbgcsgjlrS4p42KKXRKKfdMplB30AFNSxkX0J/Qzmm
         dIHMLhKxg8XXFDUDExiNg0asmsiqqO59V9doBcGf7YCyjc7dmpqtIoIE195/5azGqgrS
         QDdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770835075; x=1771439875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMPWpykIwqzVnKpU0MqZGbLM8pCJKBxgV4mw17dHpGg=;
        b=dD4Bysm8qx2oNt/ljYK2dY+kw68Z2xBUGiI0IXibgjRxcMEVvrlAUFoHXtwbDrscd4
         3bbAWi/WA7yXun3eogVkRIca5PJYESQuIeDF3pTW5GFXqt24PGzOq7OK+u0hiHrk9GGn
         d/BYnuxs5gunbHQntQ5QV5y9KiWksyLfJgP3dPiDJZI5D+Uzq9fQlzV+VVgNAUL1cVT6
         C2t26hPMMmIkLOGmPBw+Ko9eL8cvflZ/D4s5J14PGOmx9h7tZX9xLNviXi5pzhhMZkDX
         dvsC6t4X5H2tKmh0gmhUDoRB+bpRtAiIYFrn2qNaXoTlilkJyv+rWnRChdQF/jW7I726
         ZtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770835075; x=1771439875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NMPWpykIwqzVnKpU0MqZGbLM8pCJKBxgV4mw17dHpGg=;
        b=rc81K9GzIbOv2OONVI1Nz5IPs5QYCcceTyoXVu8cc9T1P1fMGHEFe3cwc90zsTmHyo
         NgJoiwIVbthnbpFAyagUaCUhYEcDKk/3VWfNLg4nrwiDRqpY05zQ5OE7dRs+T7q85MR7
         da7xF/Aqwmn/u0YkGsvikCkTgayg06NXuKIc44hPsJBKSoM/Ukn8p5PQE5X2IYnIL8b0
         6oQ4UhsnzLjuOMF5xYvF5Htlnt3ReANCCWlQFj6e5wRbUbNQNkLPXifALymE8f4L8h1r
         PdM/lGBd82E9OELbj+jZ1mZ6jKAf6SN5yhEep/DEk+YIC5P72z+zgkJXQgYykxM3/9s3
         bTeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW13wUcrXqtQMwUFE7Pp8qwaUDLu1ZPXSH7BYJSaQr/Tvob/rHhP0OeeLZ/VRxVEnQzRl362QIA8brlhHdT@vger.kernel.org
X-Gm-Message-State: AOJu0YwtXofOykw74jwqWFk39uVvqoZQMEHn5IazhKMMiI1DJSLgM1rC
	uI8fyWlXiNSqd67O5tS73W1TCdjLR/rOvPTplGrt23LGD7lf5raQ186C6r1saiy/TZHXeQYuaek
	B5f+hHDzBB64DfdMk9Sw0yVWN4Mhocjg=
X-Gm-Gg: AZuq6aIPk4y4BDcLrderUq1InBkx5jTn2t1iwUuq82COpveu8TBvAj+din5zt/xEC8Q
	SPlZW/1tvoMWum1rw0JmS4afTPMj+kZD+GAAG6oQSmiyNXOGMVyQe2QswpseqyFIIDguuwJ+w6v
	LmSMdRDRmxfp5Y2APaeLjU1ppUqwzyCfKXpLgdIEsJJbsR9YTUrkj1PgtOTVD41UUQ5r0+cSOm9
	SldyaZGFLNB8HfNY/KRUTK6aql69oVS0hElCCTJnBDF0JGwUhgcVQe3A1DbEPhFtWvc4UaTsz3z
	GsME8S4=
X-Received: by 2002:a17:90b:5211:b0:356:282e:7eb5 with SMTP id
 98e67ed59e1d1-3568f3f7f89mr227816a91.24.1770835075473; Wed, 11 Feb 2026
 10:37:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205-qrtr-control-port-access-permission-v1-1-e900039e92d5@oss.qualcomm.com>
 <20260206183657.0477e50a@kernel.org> <5b2fm4nbceqdmeu532vsr26il7jroli2sh6azcwirzm43b32da@grqzpgmmdvyp>
In-Reply-To: <5b2fm4nbceqdmeu532vsr26il7jroli2sh6azcwirzm43b32da@grqzpgmmdvyp>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Wed, 11 Feb 2026 13:37:44 -0500
X-Gm-Features: AZwV_QiEMEu8q-izEMqXgVPWSyu-zfy2ppyFTX5F5JMm-3LkhB33GLI1JN_qEvc
Message-ID: <CAEjxPJ4VA58rtSEEZpxeUZHMjURtrUbZCvV8kAkWwJaoR1YN2A@mail.gmail.com>
Subject: Re: [PATCH] net: qrtr: Expand control port access to root
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, selinux@vger.kernel.org, 
	Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com, 
	chris.lew@oss.qualcomm.com, 
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92614-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephensmalleywork@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CAC02126E46
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 12:20=E2=80=AFPM Manivannan Sadhasivam <mani@kernel=
.org> wrote:
>
> + SELinux folks
>
> On Fri, Feb 06, 2026 at 06:36:57PM -0800, Jakub Kicinski wrote:
> > On Thu, 05 Feb 2026 13:51:31 +0530 Vishnu Santhosh wrote:
> > > When qrtr is loaded as module, qrtr-ns runs from SELinux kmod_t
> > > domain. On targets using upstream SELinux policies, this domain
> > > does not receive CAP_NET_ADMIN, which prevents it from binding
> > > control port even though qrtr-ns is a trusted system component.
> > >
> > > Granting kmod_t the CAP_NET_ADMIN capability in policy is possible,
> > > but not desirable, as kmod_t is not expected to perform networking
> > > operations and widening its capability set is discouraged.
> > >
> > > To address this in a contained way within qrtr, extend the control
> > > port permission check to allow binding when either:
> > >
> > >   - the process has CAP_NET_ADMIN, or
> > >   - the process belongs to GLOBAL_ROOT_GID (root-equivalent tasks)
> > >
> > > This permits qrtr-ns to successfully bind its control port in
> > > kmod_t restricted environments without broadening SELinux capability
> > > assignments.
> >
> > This really feels like a one-off hack, but it's far from my area
> > of expertise.. Could you get an ack or review tag from some kernel
> > maintainer working on security, capabilities or permissions?
>
> I'm also not too sure about the problem because it looks like kmod_t has =
almost
> near root privileges, but cannot do network administration.
>
> Maybe there is a valid reason for that?

On Fedora, kmod_t is an unconfined domain and is allowed all capabilities.
Upstream refpolicy likely hasn't encountered a need for net_admin
during module initialization previously and thus doesn't allow it just
as a matter of least privilege.
Since you referenced kmod_t, I assume this is just for Linux, not
Android (which has an entirely different policy).
I would fix this in policy rather than changing the kernel module code.

