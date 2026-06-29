Return-Path: <linux-arm-msm+bounces-115194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qPjkDU2VQmqO+AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:54:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 541856DCFCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:54:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=gY4MbajB;
	dkim=pass header.d=redhat.com header.s=google header.b=SdenFFPp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115194-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115194-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A30630B33DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE02942885E;
	Mon, 29 Jun 2026 15:31:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504B419DF62
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 15:31:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747082; cv=none; b=L3u/pcwiqTJQ8nF2GBTQq+xK1slopvNbgr1xN5a6omZ3A9MrihMPdNJE+exeqsv/aBs68E1YVyVcwxWWXK/jfvH8GAPRHqY8gE/bL6x2C6WsZF94oECsnAzrCIs7dWxY/l9bYam5le5gz62kqdVz/8RuK7ssXR2utvRfUWDMY8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747082; c=relaxed/simple;
	bh=TelLuQFVj84dg15intj6l6XA0Pbbdt2xzy2TuA9iVP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5vj6frT57xxSvJHhGFKnERzY0tsyzeYCw5hbPBprvtql7VdSTw1lxcu8XDjFI4BDTo4PvmA6xlLgyZJDXBeQjBV9eIouVUi8pL2aHyBPPmYaYFjKze2pXs3J3UzLsMpxXO4JLj7E5cYgs5gXs6b4VEh3oviybDKcLYs8Mrq/c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gY4MbajB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SdenFFPp; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782747079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DOCP00x0YVfBobkqwjRQEWaP9evLVGD2m07PpA2VUgw=;
	b=gY4MbajBgHoeSL+yJ56ST37WLcwiW4st37dCYU8K8pOXU4HCM40oGC9tW8+JMbnt+9npFG
	uvzhB1yXFBW79d5jwhzWycSnyrsjxZclgOIspa+TTqkgVCLIDg6Sw01jazN3H2yOpC7uX2
	ds3x52jbXhWOLE8CpphfGcNWzZmPG2o=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-PczIrPnnPX2h1QoE7t9Mpg-1; Mon, 29 Jun 2026 11:31:17 -0400
X-MC-Unique: PczIrPnnPX2h1QoE7t9Mpg-1
X-Mimecast-MFC-AGG-ID: PczIrPnnPX2h1QoE7t9Mpg_1782747077
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a86f8d945so25737741cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782747077; x=1783351877; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOCP00x0YVfBobkqwjRQEWaP9evLVGD2m07PpA2VUgw=;
        b=SdenFFPp+cQRnEp88s1emS9I3yjI6QV01f6URp6idw70huaWHF+au8ZcdU3NS6JGGa
         TEHqaJ7y4ry9YdRKFBixS59xX2r8EVQPsYIP6+cmxhehxlD8fa/0PjPH89BFKyO+iLNX
         i58taShtozF95CGTzwvMQ6JgjAwCVrKPLG0/RB51JkSFysuGvWvo6Po0hD0xJL0U6/P5
         j74UA0aWu0lvfzplZjO/44kfvuW9hEHpUH6TPIAH9iFYlVvGYe2w7dX08cOfDnmzOvqN
         R8Jt0XmL4sFk45mW1gKHiyO5faDKc2xYecaA7ynfIQr3QoyO7mI6IFqiaZG3Pee7FzNm
         daqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782747077; x=1783351877;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DOCP00x0YVfBobkqwjRQEWaP9evLVGD2m07PpA2VUgw=;
        b=KtKluN6PXsHWI1J8v5GUFJZ23NCV49onyrT9SoYYCV1fseKtKJVZK8TR+DSYQDRvqo
         J2lMw9aja4nUnuStTJ0Bk/Rs8WNgOXC0gS4qjTgJCWNxbT+l0twYuBDfOEsF/fUoRcas
         NCgCzvtZzmEAacm2csLgCN+MwipvG7tlMSvxeZu7BPp6eiwOYFqYbginJ5V+2DWDh+ED
         9duKsz73OIMqqhhAvTCTwKgnP4FuqRRH6AaZ+MC9UtuNUqJd2H437WzzUsbTP69mFSoC
         1cSruB/N92XJnrBLQfIxUALjhr3L3XH7oXnQvuedEMZautu2VKN2fQqDtjXqfaj1dh4r
         AObg==
X-Forwarded-Encrypted: i=1; AFNElJ9PnFUPlYvxeB0oun+iOaos8D9CCJAZRgqlXTPX+618PQ3ipTve3GpfaNod0tiFOorEAIGxMSA2BmSR7vNk@vger.kernel.org
X-Gm-Message-State: AOJu0YzjmvkUq71Ap2M+tbUQy3HF0zyzECepSMX5Mk4+GUkJWmqUP45v
	nXiI5SWSHunADqYCMnDYBlwV+IS63hwpdI2XwdK6ClNJnmwuQ4ZuseHEXsd5j516NG9E3zb1s28
	H6mR1SqbWvMrTzCHkKDUhuN9tKbbG1LyU55CcdtgN4IeqRAIUYGFomkZvfBIpIEKryx0=
X-Gm-Gg: AfdE7ckyelPKTDs/eE0ni0KOSbSioXTmKn8G+mtjV8tAUZMjmz2lJQLtrZWrTcUe9nM
	AJc0+qV8g2wMozjN9fPxVHHEe/x16ZFIz8NBUFP3xpJ+Sa3FDO/6jb74+zkr4GtNmgxyCq8hm9C
	9kIYlZZI5u0OOD6s7l6XoiTxgZ856smBGaQ4Ubagyd8UHCaPja9hBw6dYjaZvMZmVaJj4AmzqRv
	Iorr29bfihZPLDbfAjhBXiAJwGx/dvR4m81pIGDmxzS21rycXXBqijTthAvEZfaQhUO6TeI+MO7
	tygNUgYmJkb7iDTJNYldYFShdVYDKyiNFSMVcRfX9BuAqeQGXso5/LuqQ9l3je9U0+aaCzi7lLy
	zTUe2wk2q9p2we13/SevPDyA+qrAyceDE719EhzBw4gG7PQ==
X-Received: by 2002:a05:622a:8d05:b0:51b:f635:9aa9 with SMTP id d75a77b69052e-51bf6359ebamr61940881cf.35.1782747077214;
        Mon, 29 Jun 2026 08:31:17 -0700 (PDT)
X-Received: by 2002:a05:622a:8d05:b0:51b:f635:9aa9 with SMTP id d75a77b69052e-51bf6359ebamr61940241cf.35.1782747076630;
        Mon, 29 Jun 2026 08:31:16 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51bf0697775sm45079741cf.26.2026.06.29.08.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:31:15 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:31:14 -0400
From: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xuyang Dong <dongxuyang@eswincomputing.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Maxime Ripard <mripard@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/4] driver: core: introduce dev_add_sync_state()
Message-ID: <akKPwt8PN_UtawAg@redhat.com>
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
 <20260626-clk-sync-state-v1-1-4156d8196dc8@redhat.com>
 <fea9665f-d134-4b11-a936-e1f265858ce1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fea9665f-d134-4b11-a936-e1f265858ce1@oss.qualcomm.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115194-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:ulfh@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:neil.armstrong@linaro.org,m:dongxuyang@eswincomputing.com,m:jens.glathe@oldschoolsolutions.biz,m:johannes.goede@oss.qualcomm.com,m:mripard@kernel.org,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 541856DCFCA

On Mon, Jun 29, 2026 at 12:11:18PM +0200, Konrad Dybcio wrote:
> On 6/26/26 6:32 PM, Brian Masney wrote:
> > We have cases where a device node represents a provider for multiple
> > types of resources, like clocks, power-domains, resets, etc. We
> > currently have dev_set_drv_sync_state() where a framework or driver
> > can set the sync_state callback for a device node, however it currently
> > only supports a single sync_state callback.
> > 
> > The pmdomain subsystem currently sets up a sync_state callback in the
> > core framework, and the clk subsystem will setup it's own separate
> > sync_state callback in the core framework. These can collide with each
> > other on some types of devices that have multiple types of resources.
> > Additionally, some clk drivers already have their own separate
> > sync_state callback already defined.
> > 
> > Let's introduce support for allowing drivers and frameworks to add their
> > own sync_state callback via a new function dev_add_sync_state() so that
> > multiple sync_state callbacks can coexist.
> > 
> > Link: https://lore.kernel.org/linux-clk/CAPx+jO9JiV16ePLk59hTQzEMnA96Va6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com/
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > Assisted-by: Claude:claude-opus-4-6
> > ---
> 
> [...]
> 
> > +int dev_add_sync_state(struct device *dev,
> > +			   void (*fn)(struct device *dev))
> > +{
> > +	struct sync_state_entry *entry;
> > +
> > +	if (!dev || !dev->driver)
> > +		return 0;
> > +
> > +	list_for_each_entry(entry, &dev->sync_state_list, node)
> > +		if (entry->fn == fn)
> > +			return 0;
> 
> Do we expect this to be a valid call, i.e. should we WARN_ON here?

That's a good point about adding a WARN_ON() here. I kept this logic
from when I converted from dev_set_drv_sync_state().

Brian


