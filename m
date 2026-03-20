Return-Path: <linux-arm-msm+bounces-98920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eO9+CmEwvWmI7QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:32:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 838342D9A23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 12:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3703530CC19D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 11:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CFB3A875E;
	Fri, 20 Mar 2026 11:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R5YLHu7H";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KQKUUwnf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151833A7583
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 11:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774006235; cv=pass; b=fxHXZAOmwbX1wc5sjr1lGIA1rsDwknxIh6IP6CD977pWUkbA6DGSLFfxSUAIKFaWOU4ggCw6tn4MRRq8nbwHxDFe3rvGfQYNSFlVu8i7WjI1/k0yHokVBJCxIJEqkazB+Wm/484fQoP5U9jbbvvcDXwgIBmfDQb6laUoGcWVlUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774006235; c=relaxed/simple;
	bh=6FZo5YkkvgRl5bjx8E+US6H+7vMSmuW6TTeY7it89VA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gyy8BI/0ZzCs7YUfO5vvkZg5RJUiabaHGZ6tvx61IhYORRntQxq7RzhACBLwAT4tftQNzAJOWm2/FAwldWO+ccZULh/34jv03FdSqTpVt9VvxKSXUPaUFn+E8x5KOqt0DiJU+TMHw1mW54KD6Q8PGqzv4aOJEms27Z1v+z3DCAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R5YLHu7H; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KQKUUwnf; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774006230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HmMuornnaPj/LA9d14iabXIRJzf1MNFPHX2bf4bwb9g=;
	b=R5YLHu7HStWljCClWNFgT19t3SQcGJwVq8PBSHz8hsQCNpu1Qiq1cjT3yeeWe0T5zZX7sM
	m37fXojumzyGeLOHFx+Kc08uDXjStdJeJ9faX3sngDfRgIO1nZh7VsHkFF0CAoLkvk+faK
	t/qCGpEPbIkdCNMqZTY8U/YgB5zGopM=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-N8yoqp5rM6-h5Fu3NRZM1Q-1; Fri, 20 Mar 2026 07:30:29 -0400
X-MC-Unique: N8yoqp5rM6-h5Fu3NRZM1Q-1
X-Mimecast-MFC-AGG-ID: N8yoqp5rM6-h5Fu3NRZM1Q_1774006229
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c73781252edso7525160a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 04:30:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774006228; cv=none;
        d=google.com; s=arc-20240605;
        b=OunwWCM0L2b51pCpfbomQw58/Zijylh5K+rIJQPHM/BVXQxUSiRNjRns63bjK6UuOh
         en/1neMSgCYgHjnIMP9F65FUwGjLQe3s0pI++z0dNBuWsgK9ezuyyNSuXNJniczPomq3
         J3MD2S08Pa8m22btb0bbBvvh681EZnZ9dttitlWdBq2AQCFvPV7Z9NUAZx18XMbU05zZ
         hoquQBGDtgTOQCx3fu7zvoDd9F9QsbdB6gfXW6hDsQcE6mDRxe2jJS6ej1kKOckbIg8S
         KtovQbrhymOpvLS2t+pOadRiKmgF0RolkR7y3d95RcEOMJFKZmYTAjIkjrJA52niCdRE
         idkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HmMuornnaPj/LA9d14iabXIRJzf1MNFPHX2bf4bwb9g=;
        fh=4APbfs0Zx+7e3ifIJOygu+umq7L3WG27H6puVHQErVI=;
        b=bFM/WDCcKUzQ7/C9Hh6rpMh92jaEimVg3dQ9K7zkY1z6a63o1vHDvyVXyh2dgWZDzN
         IUy9t88+mQJ9OZJ7cDotsraxqe9UtFsem9tnoJoJhNoh2lEacLGgwbKJdisSWoZ8TzVw
         mML3Whu+hivf+oTaTMfo0zFMykrVC0CIX/4mZFEJqHdTBYs4MmbGAjlWkWItDpE8AJ6j
         igk8/jKc+s2xYmY+1g9F4QKY7Gq5WnKEghcwx2p6ZeqUZQjp1uLEIGSKS6oq4AKEq/Pk
         S8MByPXJJOg1C0CwLAiFw9dATh/w5mXibnjAB4d6HjGxgHMHzZAhkhOytxtRB6QELKek
         q1oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774006228; x=1774611028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmMuornnaPj/LA9d14iabXIRJzf1MNFPHX2bf4bwb9g=;
        b=KQKUUwnf2c9oF+FBUfbm6/GZX7TriEausv655WZXjWEBcyDBUFn0CyLF2X2X1oBCSr
         w/66j7Z11NKwc4fKBKaAQTmu7xdnFQUQwpYOJKjjWsItoePTL1r9t7ufvjf8Um9jz2is
         LKfXm2SG5BEM99QatwK8VPouSC2nVC6AfofkdgaQBWsibo14PGt9K0tQuHlQE/C/3K0A
         vhLUMpyRxqFgE22sD3PJr9WUbZ6wiOk2JEt/w6h29wW7v5Qp2APQHerNlcgHPvEifjqr
         +qMZ8Ao/w8A/TG4/KebJnsj+mhSwElbMnj3Fd2GMdRDK02u472G57M5jbrquUh0khuRh
         fx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774006228; x=1774611028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HmMuornnaPj/LA9d14iabXIRJzf1MNFPHX2bf4bwb9g=;
        b=NVH6/iiQIUtW79gPudtXpcF3+z5PA+tOPMnHgnXpBnr1+uGk3gNdW9lcA3xG7nymwV
         3X+gzA6fKlaCjFHwQQfkhXEXVcKuDdlnl/1xueLHGxgy/WsDmVUMG7ZpOjXX/CSDXo3L
         UZxK4jKdZdkSEjSn/n/jV5TO3OFidbqYnsWgIIqIwPk5jDR1dzELKuP51XkLjiPgEqzJ
         WhFgPo7Ix3CU8BbGXo3XTNbEToS+04ncDM/ztWBfiOc2wE8GTRMcit7wdfi+HKqyj7yP
         Jk8mfh+C5wm/TMiEmshNABH8CcNThbuFBjCfTjkQOo4znka+NdsEXhEqzieAlO5Y78+s
         0VhA==
X-Forwarded-Encrypted: i=1; AJvYcCXyKtBSl5gZNP5/pigqw861dKGnR6AymznSUq09TZr5lIkE6n0ZS+KS2v5JTts33y0zpK+wY3/ygv7YD+r5@vger.kernel.org
X-Gm-Message-State: AOJu0YzEqGeb3wdSHL+FhA+jRl/AcvfCa5OnHM7xtHXjZvfRKjZ7dYHx
	vSUyCyzFp1TJs9x4XyxQQh/oU6qsr326Qj8eiZsyXQz9w3ZqUU46SM5w7sP53d1fiq/oVb1mrG4
	VKp1PfbOEPlWvHo0c4fVFmgl+BY7ukuRlWUImlkppfOQiTgH5Qem64t+zFd3hZE0WdR3oTOTy1K
	xg0y60o/cr3FDvqm61x4qJ4hq4KE9Gyy+17H+o8DIp4A==
X-Gm-Gg: ATEYQzya1WOFb58yewBmTjQxPKbVGqJN3HDjbMV0SiDy5HDB69+Xr+ttDcm/CjrD7ZX
	3dAV5PEn4jDveG39uAZey+f+SwJ6im8YZ502Vnx4NXLFBQy58oSuX41ITvsXy26KVjUmnUdSPbO
	ZIMuvQslIZWPCV3SlemyGIS043nv/s0WAos/BQ5qC3cINGbkF+WlmUom7ZGy19d3gt90IpN7jSk
	epLSOsQvhdYVGbfIqJ1lACC7Sv235KANIBWjAs=
X-Received: by 2002:a05:6a00:3e16:b0:81e:e09d:2687 with SMTP id d2e1a72fcca58-82a8c206f60mr2162583b3a.1.1774006228615;
        Fri, 20 Mar 2026 04:30:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e16:b0:81e:e09d:2687 with SMTP id
 d2e1a72fcca58-82a8c206f60mr2162560b3a.1.1774006228078; Fri, 20 Mar 2026
 04:30:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316102618.7953-1-gpaoloni@redhat.com> <20260316102618.7953-2-gpaoloni@redhat.com>
 <abfj0bpnv6yqJBPR@redhat.com>
In-Reply-To: <abfj0bpnv6yqJBPR@redhat.com>
From: Gabriele Paoloni <gpaoloni@redhat.com>
Date: Fri, 20 Mar 2026 12:30:16 +0100
X-Gm-Features: AaiRm52tHYySMOo86NqPoNlWSU5zyv6GdSx2-Wg5qCUwPAQ1Rs4QD4_PhN7zRzU
Message-ID: <CA+wEVJYRwejqVNvYxDj1LUEMgPc5ew62rtgHe4LugN0F2OdFKQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mailbox: qcom-ipcc: amend qcom_ipcc_domain_map() to
 report errors
To: Brian Masney <bmasney@redhat.com>, tglx@kernel.org
Cc: mani@kernel.org, jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mpapini@redhat.com, dnita@qti.qualcomm.com, 
	rballati@qti.qualcomm.com, bijothom@qti.qualcomm.com, wchadwic@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98920-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,redhat.com,qti.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gpaoloni@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 838342D9A23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 12:05=E2=80=AFPM Brian Masney <bmasney@redhat.com> =
wrote:
>
> On Mon, Mar 16, 2026 at 11:26:17AM +0100, Gabriele Paoloni wrote:
> > Currently qcom_ipcc_domain_map() ignores errors returned by
> > irq_set_chip_data() and invokes irq_set_chip_and_handler()
> > that in turn ignores errors returned by irq_set_chip().
> > This patch fixes both issues; no other functional changes
> > are implemented.
> >
> > Signed-off-by: Gabriele Paoloni <gpaoloni@redhat.com>
> > ---
> >  drivers/mailbox/qcom-ipcc.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
> > index d957d989c0ce..c23efaaa64a1 100644
> > --- a/drivers/mailbox/qcom-ipcc.c
> > +++ b/drivers/mailbox/qcom-ipcc.c
> > @@ -116,12 +116,20 @@ static struct irq_chip qcom_ipcc_irq_chip =3D {
> >  static int qcom_ipcc_domain_map(struct irq_domain *d, unsigned int irq=
,
> >                               irq_hw_number_t hw)
> >  {
> > +     int ret;
> >       struct qcom_ipcc *ipcc =3D d->host_data;
>
> Put variables in reverse Christmas tree order.

Noted, I'll fix in v2.

>
> >
> > -     irq_set_chip_and_handler(irq, &qcom_ipcc_irq_chip, handle_level_i=
rq);
>
> Should irq_set_chip_and_handler() and irq_set_chip_and_handler_name() be
> updated to return an int to reduce boiler plate code?

+TO Thomas Gleixner

It may be a possibility. @Thomas do you have any preference in this regard?

Thanks
Gab

>
> > -     irq_set_chip_data(irq, ipcc);
> > -     irq_set_noprobe(irq);
> > +     ret =3D irq_set_chip(irq, &qcom_ipcc_irq_chip);
> > +     if (ret)
> > +             return ret;
> > +
> > +     irq_set_handler(irq, handle_level_irq);
> >
> > +     ret =3D irq_set_chip_data(irq, ipcc);
> > +     if (ret)
> > +             return ret;
> > +
> > +     irq_set_noprobe(irq);
> >       return 0;
>
> The newline before the return 0 is removed. That should also remove the
> irq_set_noprobe() change from the diffstat.
>
> Brian
>


