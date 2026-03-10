Return-Path: <linux-arm-msm+bounces-96634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNnIE7sfsGmCgAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:42:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C99250A11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 283AE33E70C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FA83CAE92;
	Tue, 10 Mar 2026 12:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWGrYsqI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D373CAE8C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145807; cv=none; b=hYnMuvA6sBIetFVjmR9Acm9tHla+fMfad9LV29lO4ZumJacq0+KL9zOTVed+cecC/M+XrIRNrjQ3K5YI94rxfJRAt0X8l/Kk288LzK1W3uB2vCXjjytWeDE0ak5JGHWPrPBtKmn5CJ2LW9P+jxK7yQJvoFqu1Q6Lapbz9a0maQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145807; c=relaxed/simple;
	bh=wsYBdGWm/CITUFKray5ohh7E0dp/nLMZXvTvoQuJE4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DNhPf7J7t35wH9m8IHif7WSEy/ZJS6YznEkzuDFzfV3q3CgouAuIytErwUp7xq+6e7A+UYKVAlbcXKFK+w7VZzRmjk0GTq1zELlyG67aS1TTdWUyRGuHAgsuDi0V8MdIYdNItMQmI5mtI9fc7VW0+D6u72MIU8xemJ+I5uheR9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWGrYsqI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA62C2BC86
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773145806;
	bh=wsYBdGWm/CITUFKray5ohh7E0dp/nLMZXvTvoQuJE4k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tWGrYsqII8OKmBnWhQPHyFHjAy8St54e9kNdtGQ+tWBizBDaBj8wvfo9rrbwai2KK
	 BpiYZ7qvLqqw+OBswfbdkdKYmeuFyls+K4x70n8KrVdT/VYeQUTcYuA8pScQjfiTRJ
	 UL77dBJvj49JFGmd0/10SHD0ZZg5ieljT7uY8hPDN19zERaao/rB+SBou5gEvsMKBz
	 z4eQ4UKg8vGpBdPgHi8pg3a7EKF7G9ejfUkxQN1cZzcFW6bu4GcyUPioR5FzOzXK46
	 aK7iiKSw4e/hsf825rZxjqXppgS7LskGg/fZjXUMwSkQ5rFlCD31ETr1Mcf0fmIPqo
	 0tx3+Ma3smfZw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a41026318so30080711fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:30:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWzxJ9iRIUqG9RQBihFtooZwWmqe+g45Zc+6IEaZkZ2YAXCgPeMx3eMu6/oto9Qva/UQUAkGkFv77cCqYV6@vger.kernel.org
X-Gm-Message-State: AOJu0YzMEKEEHLa7KGrPnDqMPiQiKu5cMERt7SauXXacaSjf1SacQIoQ
	omimR7A/cO9zBBXNe4f390B7TlVEsrFPb4ltrZoHIfcokvcOuIHMdJAuXGIWMpxh1i7N/T2js35
	Xsz03JAVMA2fHUwSVFP1kQrswuggfIskPDEJqFWGwPg==
X-Received: by 2002:a2e:a985:0:b0:38a:422d:b644 with SMTP id
 38308e7fff4ca-38a422db7f3mr45229741fa.23.1773145805491; Tue, 10 Mar 2026
 05:30:05 -0700 (PDT)
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
In-Reply-To: <2026030921-dwindling-tarnish-6141@gregkh>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 10 Mar 2026 13:29:53 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdWMMi0wP8jd9YMOLqfafwWf5TTbd4diM-fJKk72XVQBA@mail.gmail.com>
X-Gm-Features: AaiRm50rdeQxvxsT6rlGwu5hFUvMtRGtmrzc2WzM18TBMwUNc6jS5TreLwcXJ_s
Message-ID: <CAMRc=MdWMMi0wP8jd9YMOLqfafwWf5TTbd4diM-fJKk72XVQBA@mail.gmail.com>
Subject: Re: [PATCH RFT] driver core: faux: allow to set the firmware node for
 a faux device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, linux-arm-msm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 99C99250A11
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96634-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,linuxfoundation.org:email]
X-Rspamd-Action: no action

On Mon, Mar 9, 2026 at 4:55=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Mar 09, 2026 at 09:16:19PM +0530, Shivendra Pratap wrote:
> >
> >
> > On 06-03-2026 19:54, Bartosz Golaszewski wrote:
> > > On Fri, Mar 6, 2026 at 3:13=E2=80=AFPM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, Mar 06, 2026 at 03:07:03PM +0100, Bartosz Golaszewski wrote=
:
> > > > > On Fri, Mar 6, 2026 at 2:54=E2=80=AFPM Greg Kroah-Hartman
> > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Fri, Mar 06, 2026 at 02:45:56PM +0100, Bartosz Golaszewski w=
rote:
> > > > > > > Add a new variant of faux_device_create() taking a firmware n=
ode handle
> > > > > > > as argument and attaching it to the created faux device. This=
 allows
> > > > > > > users to define and read device properties using the standard=
 property
> > > > > > > accessors.
> > > > > >
> > > > > > Why would a faux device have firmware backing?  Doesn't that me=
an it
> > > > > > should be a platform device?
> > > > > >
> > > > > > > While at it: order includes in faux.c alphabetically for easi=
er
> > > > > > > maintenance.
> > > > > >
> > > > > > Hint, that should be a separate patch, and is never something t=
hat I
> > > > > > enforce or require in .c files I maintain :)
> > > > > >
> > > > > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.q=
ualcomm.com>
> > > > > > > ---
> > > > > > > Hi Shivendra et al!
> > > > > > >
> > > > > > > This patch is related to my response to your reboot-mode patc=
h[1].
> > > > > > >
> > > > > > > You should be able to use the new function like:
> > > > > > >
> > > > > > >    faux_device_create_full("psci-reboot-mode", NULL, NULL, NU=
LL, of_fwnode_handle(np));
> > > > > >
> > > > > > What is the fwnode handle here for?  Why is it required at all?=
  What
> > > > > > resources are involved that would want this?
> > > > > >
> > > > >
> > > > > Shivendra creates a faux device that registers with the reboot-mo=
de
> > > > > subsystem which reads the reboot-mode definitions from devicetree=
. The
> > > > > faux device needs to have the "reboot-mode" OF-node attached. In =
his
> > > > > current proposal, Shivenda had to bypass faux device's probe() be=
cause
> > > > > he can't have the fwnode attached before probe() is called.
> > > >
> > > > Why would a firmware device be attached to a faux device?  A firmwa=
re
> > > > device is, implicitly, already part of the firmware "device tree", =
so
> > > > there should be something for it to be a child of already in the sy=
stem.
> > > >
> > >
> > > Shivendra: I rememeber there was an issue with using any proper
> > > devices like platform or auxiliary with this but - as the series is
> > > already at v20 - I can't find the actual discussion. Could you please
> > > describe what the issue with driver matching was?
> >
> > reboot-mode node is a property of psci which defines the reboot command=
s.=E2=80=8C As
> > its not an actual device we wanted to avoid creating platform or aux de=
vice.
> > few references here:
> >
> > https://lore.kernel.org/all/rz7tnl5gg73gtyij3kmwk6hubikfsvu3krekjkpoofp=
dio6cwe@innio7qvotye/
> >
> > Till v17, we were exposing an explicit of_node based registration in re=
boot
> > mode and then registering it from psci driver.
> > Post this, Lorenzo suggested to move this outside of psci and use a fau=
x
> > device instead.
>
> As this is a "real" device that talks to hardware (i.e. you have a
> firmware device representation), please do not use a faux device, that
> is not what that interface is for.  Instead, as it is a firmware device,
> just use a platform one as you already have a representation of it
> somewhere in the system, right?

While there is indeed a psci node on arm64 platforms, psci itself must
be brought up very early - specifically in setup_arch() - so there's
no platform device associated with it as the driver is called into
before the driver core is initialized. It's just a function called for
a specific compatible value.

Now looking again at Shivendra's patch, the faux device in question is
created from a device_initcall() which makes me think it's not needed
very early. It can actually come up quite late. What I would suggest
is to create a psci platform device (reusing the existing
of_device_id) that would populate its child OF nodes in probe(), in
this case: the reboot-mode driver, which could then also become a real
platform device.

On a completely unrelated note though - Greg: I think this patch could
still be considered because we now have quite a lot of functionality
put into software nodes and already have some auxiliary devices that
use software nodes as a source of device properties/config using the
same API as platform devices (fwnode). I think faux devices could also
profit from it and not necessairly use custom struct. If that sounds
good to you, I may convert one or two faux devices and send a series
with actual users of this.

Bartosz

