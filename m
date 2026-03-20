Return-Path: <linux-arm-msm+bounces-98918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDsDCtYuvWmI7QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:26:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0512D983B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DB0A3025E50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 11:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEEDA3A7837;
	Fri, 20 Mar 2026 11:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OoafE7D1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KopCsRXq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488DE3A5425
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774005942; cv=pass; b=Gw71GognlLVyXAc0g9zd4A2n1gOUmChc1jGyg5iDzNO6EsDp8OT/cZA7gGI//HqHLyM/loVR+Q4jgn/pfOoJVnImzl6u1hMpZJluqLOOEyUJ4+gnE8K8JKt3clNA1X5BgZm+mZZWxxO3QP+KJpfeM5IbsBzuHeMaY/FimXrFBTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774005942; c=relaxed/simple;
	bh=RNIvwxYBawEsoKjvUbwJjouh30hNq6ha7UwLiuoB+zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kv2Ko8YqvESb7SXeBDU341Ess/BJXRNrYrd0s+XGHB+bGcr2ERmdqtQm969zwm57XN7FqXQP0Ip7kdubygPEagcJHgyw9Dld33nUQFjPa5MfrC6IXJbpZJR0TUdlnd91iuVtlvI/McKeT4dIfvwQCM/N79aKWaHRsltIuyAE8Vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OoafE7D1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KopCsRXq; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774005939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/YGGD21InUo9U6XJg3OIFb765OI3zldLEMwq0XgS09U=;
	b=OoafE7D1RK5EwHUDX3p6Oj2JZKKeQRZMStRMykKVsUwcb4dtWJH4DVzJMd7cFuD4ZubbAx
	Y0h0F1wEGitiArSEqS38zi/aQC+PvcChx6vWlhdRdrWle1yde7ttq5Ue7sb26AjdCxlGds
	Wp+/s2jzPrB0tcDmTM2UL5Cw2NkAGbc=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-Vc9w_LS-OlOJh04UVVZisw-1; Fri, 20 Mar 2026 07:25:38 -0400
X-MC-Unique: Vc9w_LS-OlOJh04UVVZisw-1
X-Mimecast-MFC-AGG-ID: Vc9w_LS-OlOJh04UVVZisw_1774005937
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829a655f5e4so250337b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 04:25:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774005937; cv=none;
        d=google.com; s=arc-20240605;
        b=QNUKvqjbefcy81UKMuBmSMHYq/RJYLTFILma+Jq0/8PIpwlKVnoK5VavxAW0Tun2SX
         bpsBCkr/FZMlYoVC1+Uw6hAbT5qqCkT0IJVxdRvAB6kXjfYlRrrovd/L4kRFzJsPVjPd
         1bzCtM0DlXorQ38lt05fvfqwd3lYkZ/rf7Bx7pykHX/0Y+1+LeXLVguZjvZ4ltbr8UJE
         mn7WXxqM6g65L4ibRXyjiVkhLPNte90C1b2ilhmuaBpR9xCdNagtAh9uPm3QcR07XbTH
         HalHBBb2jC8Qy11tU2w72F52ZcDV5RJsSQWDmgA6E0aiFAvZnsX9y5qtq/moczDV6InT
         06QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/YGGD21InUo9U6XJg3OIFb765OI3zldLEMwq0XgS09U=;
        fh=3S8sPd2bCCLn39+VSuIqhBxj9cSV6b1kDGh4AgPOYEM=;
        b=RaGzIKLr00i0r02ng4/ly4UGmZxOlTjeeBjAQZN6i8Y82JsR47LM0BrGJd4qqA8zZs
         pnxPSvqT5O9669TmcdA1cts4vzumiHo5IP33BH6Ddk5qB5Vecd4xCB47ynD83EGdtrur
         CeX6FJUsRd0b6YPNc0ilmj7SNGthZn4OT6F1hex3nb2Zi7xRTRebxjSvClnjW5SLuSPb
         SMXE/MFUQ8mF5mshy3fDQApvXGsemCywqYzlppyJXFXZl+YqWVSSOAdZcIGr0arHH3b+
         MPWxrzXX49Q1o491Tpycpi0P+RIP+VDe5lQh/poZSeXEFjrNEOpO51ZvrAuYOiFs8NuE
         Cziw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774005937; x=1774610737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YGGD21InUo9U6XJg3OIFb765OI3zldLEMwq0XgS09U=;
        b=KopCsRXqpyMoTzrUQic0oC6+Nc/bi92g595xk2mHchV+xUV/4Gix4UWuKx1gYw3vgX
         YbpHpL3aIgmx8uZMV0+1/WFt6fZo7ycNR8F9tqbGFs6fIbv4Ox2Do3kpVVfd34pH3guU
         tNyIBAdV9E6gdwyMhhKO2ozu0dF//6d7OGWv387GiKSp5ghcqn01puJbA4ZgovB2I9cQ
         2qr7Af/G772EVVeE3CS+RFz0ht08RD0zFON9hyOW5pzQfynUpQWae8FkjNgus1x2A6Ns
         GcrkxEa9luL02Z4F5uklKk8Gj4XMIerkmJQ4cLOm+/vVCN9acX/MOlr05Rplbvta51LJ
         lLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774005937; x=1774610737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/YGGD21InUo9U6XJg3OIFb765OI3zldLEMwq0XgS09U=;
        b=sGJvm1N4XqGSjP4AZSDvX7d53DV+KtP1mtzdoGjXQPckNIQrDFqxXEa+huhJIhACsv
         mTzXuJSw6wbiKkkbZDLtYZU2hMKd/goBuYLmbuaqjeTLHDzv2gA5diTK4SIgeAj5Pxmx
         UB2dE0MgW1tx3AEmMjwbsANElxKJMTAOA9vQ3fa+lMBbK6VdcHRLDx7tSkuu5SmaqZUM
         OLPsIPgNruhdN9RvRVKEnCLXtSonf1nRw2WWc0j8j2+R7gbhC/fUhHQBBB43XW6vM4uH
         SgW6oPWlwvcHGYfdBu7Ul5uIQJxIj/kyy8VJFrm9QJjfxFImIE/V0t9KcZkAYKftSi1k
         7wkw==
X-Forwarded-Encrypted: i=1; AJvYcCWIK8QPtCHAGHrIkCin97TDoVtpLYWDTGUwgUHbxKropPMCSKSigYP0zkA8vde6XGRo+nZgAUnSaJSzcwSg@vger.kernel.org
X-Gm-Message-State: AOJu0YwpDmBe8fechmyTAYc5sFelLtQ8SB34enEvS7OjEpcPPBS45Poc
	t7nUVsCIx8mSWBiAyblKul4pK6eIdxK+Bci0/rmEZm/995pXxHl4vOg2Birpn+yEyUTR2+6bLQ4
	7upFVRXqqfjNt/eAmDQ1u20cCaEwpL8MThK/ulRJrIXVCNmMF/qLDQMTRZryHdCCW9m/x/iOIka
	zZb3ECTgJyg9ukf1egqVVcPLtjHpj/VBRhdF6rY27ffw==
X-Gm-Gg: ATEYQzzcLblrwAoymX/a1XERBh5IDvaVFg7OgOFO86zbSXZg9hpb4RG0sJz9zq8rGC9
	HgJMk1yrGvPPwJC+PBCOFYQRSMM5u6iPFyw3LyeJdGx/HkgKHc0GVZFICsjyaysD+f3ztMEaXuh
	ol62pWAEcVK0C4DfhM0AhSLwhf8uBzlWS+EdIC+IaLGslGKCpK2gAaGIuRv7SN/3JpEhHqEhuee
	1uzZmk/Z9nmLE1s4M/f1hzgwC/k0Oekkg6QPqU=
X-Received: by 2002:a05:6a00:2d1d:b0:82a:7771:2f17 with SMTP id d2e1a72fcca58-82a8c36eceamr2176784b3a.49.1774005937056;
        Fri, 20 Mar 2026 04:25:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d1d:b0:82a:7771:2f17 with SMTP id
 d2e1a72fcca58-82a8c36eceamr2176766b3a.49.1774005936676; Fri, 20 Mar 2026
 04:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316102618.7953-1-gpaoloni@redhat.com> <20260316102618.7953-3-gpaoloni@redhat.com>
 <abfkAFIheKCuLRKk@redhat.com>
In-Reply-To: <abfkAFIheKCuLRKk@redhat.com>
From: Gabriele Paoloni <gpaoloni@redhat.com>
Date: Fri, 20 Mar 2026 12:25:24 +0100
X-Gm-Features: AaiRm51GCaU2sAO0AFS4qEc2O2t9mjFMogfXF5NPI8Xp_K4fxqAhhAXH13EBCoc
Message-ID: <CA+wEVJYH=fM9Gp7-g0C38ovqTKzHnN+LVkpapb-PuFJ_vowVxg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mailbox: qcom-ipcc: amend qcom_ipcc_irq_fn() to
 report errors
To: Brian Masney <bmasney@redhat.com>
Cc: mani@kernel.org, jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mpapini@redhat.com, dnita@qti.qualcomm.com, 
	rballati@qti.qualcomm.com, bijothom@qti.qualcomm.com, wchadwic@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98918-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,redhat.com,qti.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gpaoloni@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.983];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AD0512D983B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 12:05=E2=80=AFPM Brian Masney <bmasney@redhat.com> =
wrote:
>
> On Mon, Mar 16, 2026 at 11:26:18AM +0100, Gabriele Paoloni wrote:
> > check the virq value returned by irq_find_mapping(), also
> > check the return value of generic_handle_irq(); return IRQ_NONE
> > if either of the checks fails.
> >
> > Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
> > ---
> >  drivers/mailbox/qcom-ipcc.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
> > index c23efaaa64a1..0795184591f0 100644
> > --- a/drivers/mailbox/qcom-ipcc.c
> > +++ b/drivers/mailbox/qcom-ipcc.c
> > @@ -75,7 +75,7 @@ static irqreturn_t qcom_ipcc_irq_fn(int irq, void *da=
ta)
> >  {
> >       struct qcom_ipcc *ipcc =3D data;
> >       u32 hwirq;
> > -     int virq;
> > +     int virq, ret;
>
> Put variables in reverse Christmas tree order.

Note, many thanks. I will fix this in v2

Gab

>
> Brian
>
>
> >
> >       for (;;) {
> >               hwirq =3D readl(ipcc->base + IPCC_REG_RECV_ID);
> > @@ -83,8 +83,14 @@ static irqreturn_t qcom_ipcc_irq_fn(int irq, void *d=
ata)
> >                       break;
> >
> >               virq =3D irq_find_mapping(ipcc->irq_domain, hwirq);
> > +             if (unlikely(!virq))
> > +                     return IRQ_NONE;
> > +
> >               writel(hwirq, ipcc->base + IPCC_REG_RECV_SIGNAL_CLEAR);
> > -             generic_handle_irq(virq);
> > +
> > +             ret =3D generic_handle_irq(virq);
> > +             if (unlikely(ret))
> > +                     return IRQ_NONE;
> >       }
> >
> >       return IRQ_HANDLED;
> > --
> > 2.48.1
> >
>


