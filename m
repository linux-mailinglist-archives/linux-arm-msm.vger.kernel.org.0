Return-Path: <linux-arm-msm+bounces-96666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPEKEtQnsGnYgQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:16:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 45369251A2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E50F31D5314
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A59399340;
	Tue, 10 Mar 2026 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGSnp0Wy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFF9397E9F
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148730; cv=none; b=gyc5b1PNRMzZmBu4a6DLwjvx1ck6QwLiBh0BR6p+H5lm9+plI8+26vEBfN+blMbc0lvOKKZSJNuQvTEXyzHkWrS/kwtLRlNadIM8ZEEcZlYt37yRIiZ1P4ZPyXN3zyP/+yTR3+1Ea4r6cn42dhE8d15hFIcrLSteXD2k1K9fvb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148730; c=relaxed/simple;
	bh=eGRuEVGcdNj7wxl6wZUUR3W8NIIw4W7vFYo6c4ztUvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VV3zclZ/DO52oYydw8uZJ7ibPSixyZwDZKULeUygpIq69pCvzHiCKWcdR4u0ExYO2TAVTltx2TUn3ZruyIr8rH6vQ6AE8QkEgXDNipsrbtvjibXmsh5dNxN4nrmG7l0xJsdT/Ld31K/wwAIezJAsx+PIX0GyCt0AOdXtmlb6hO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGSnp0Wy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44CDC4AF0C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773148729;
	bh=eGRuEVGcdNj7wxl6wZUUR3W8NIIw4W7vFYo6c4ztUvs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oGSnp0WyPIZW78fOa4bjSZJAPbqbhY3Ru0aUTb8Cj3/xxcZTFKZ9doRR83nMZZrXQ
	 B51K72A54gcv2+eR5SCEDoaa/sVA0Mm5JzSG2RaPwCTm6t+axbFh+5NPdXhTiwHLJ3
	 7v5FPGAH8LcgK4e8NejXwgX6VFJKle6FtNGdGd5MwpGyHa1Rt51ysDmXxrY3aSvIH5
	 J02PP4GFztMJ/CBcvQ96gstW4raNrs91jgUocPq+1TR+XnW6NtxeJZlwDbT+6HdrfC
	 z4cRJgXdud2TL38lg9wkBHLOdcL6/p3ct1XBephVYGgratN0au2Xzz0ND+Zr9zvqJo
	 RNU5qkGR5Z1lA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a126b79512so5446551e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:18:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWT4MtfM8Zu5/Fcc2Q+0oOPsLqbHmO6jE0lCPIob3sI2W80WUSGXtNv2Ca/rSqpSxzN67QpTxflWu96qKci@vger.kernel.org
X-Gm-Message-State: AOJu0YxZNeAiHkTmqyRhvpUvgdPqGOSQ5voCKN+2oil5VkRoZeCJT/X7
	T+P20UkiaEuVCYDyTmOtQlcNm+RlxjXvAarytO6OGE24iWdih+thKCkaI8Ju4OKhcKuGV8hilZD
	f9vuDBcsXuvaLAYgOayPpYf/BFco0wDfZL4Dw110xvw==
X-Received: by 2002:a05:6512:63d0:20b0:5a1:2f9e:ec8e with SMTP id
 2adb3069b0e04-5a13cac3addmr3697730e87.14.1773148728567; Tue, 10 Mar 2026
 06:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com>
 <2026030649-evacuate-emotion-422c@gregkh> <CAMRc=MebWaGPG=jMP-QbDsF+uaOSQFQyQ+T8Nhoh2jgo7VrFHg@mail.gmail.com>
 <2026030612-collapse-empower-285f@gregkh> <CAMRc=Mdyu=vHEOSfh6wuDaEW_XXS5gi+JO3PvgHB0q4+J+GMZg@mail.gmail.com>
 <5488a169-777b-4bb3-9566-78083613d40a@oss.qualcomm.com> <2026030921-dwindling-tarnish-6141@gregkh>
 <CAMRc=MdWMMi0wP8jd9YMOLqfafwWf5TTbd4diM-fJKk72XVQBA@mail.gmail.com> <2026031034-blazer-equal-871e@gregkh>
In-Reply-To: <2026031034-blazer-equal-871e@gregkh>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 10 Mar 2026 14:18:36 +0100
X-Gmail-Original-Message-ID: <CAMRc=McwBYFrsxYYYjZG=0bnkaC2R4cYkKmusQBJ1H_dfcCH2w@mail.gmail.com>
X-Gm-Features: AaiRm50m77pDvIc2yTLCTYPS259U2qKZk2jXd4qMLpLte1PdySCZSCD0cVcOlJc
Message-ID: <CAMRc=McwBYFrsxYYYjZG=0bnkaC2R4cYkKmusQBJ1H_dfcCH2w@mail.gmail.com>
Subject: Re: [PATCH RFT] driver core: faux: allow to set the firmware node for
 a faux device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, linux-arm-msm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 45369251A2D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96666-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,linuxfoundation.org:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 1:43=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 10, 2026 at 01:29:53PM +0100, Bartosz Golaszewski wrote:
> > On a completely unrelated note though - Greg: I think this patch could
> > still be considered because we now have quite a lot of functionality
> > put into software nodes and already have some auxiliary devices that
> > use software nodes as a source of device properties/config using the
> > same API as platform devices (fwnode). I think faux devices could also
> > profit from it and not necessairly use custom struct. If that sounds
> > good to you, I may convert one or two faux devices and send a series
> > with actual users of this.
>
> I don't understand why a device that has a fwnode would ever be a "faux"
> device?  Why wouldn't that just be a normal platform device?
>
> faux devices were created to be not platform devices, to take away the
> abuse where platform devices were being used because the api was simple
> and people wanted a device in the tree somewhere, but there was not
> actually any backing platform device present.
>
> So the use of a fwnode here feels very odd to me, what am I missing?
>

A firmware node can be a dynamic software node created just for that
faux device to pass to it its configuration instead of using a custom
platform data structure.

Bart

