Return-Path: <linux-arm-msm+bounces-109203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJcKBD8dEGrqTgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:09:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BED565B0E1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F6AD301F7A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905F73B841F;
	Fri, 22 May 2026 09:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7TavuJq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E8A3B8BBF
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779440944; cv=none; b=AmQzcy+395KQsZFXyCxC/BmzA//yTaJaz5pG3YWe/IGWGnCL+gTsk4uwD1lTiNqWT0j0cvIdy2icx3YUr3/pCcx+nFP7heGtirGOheGrJQl8QwGJYw8tMFEwoe56chds5zvChzpaFVYekg4eEPjrzKXpMsPxIwzPBux/ke2W14Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779440944; c=relaxed/simple;
	bh=vGDNYvjF06Md4Ju9q3LC1FBqBbNV1wVgOxSy1Ztt+kE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ShM7p8bx56OliK3YDOJy2ZL9JnpvxZUyL6iiwvk1q4xcUk9yisA5DO61BPsuahBwrefhQuO3hlwn3hgFJ451oIDWdJ0UMJNMYAn52wypYtDLOUe7XfrZKiISMTkcoyeEe/v432jTT0EqUOJGehJTkjYpOW45DMx7gkiDMvR5w9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7TavuJq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195B31F0155C
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779440943;
	bh=qMZ5uVQSeKp4nOSIgfrXw005H4ImnDWLFAokwE5MQpA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=V7TavuJqMBXziNra5fwXHAifNsJMmDHtOk24jBHdksHmTovk5Vsiu8U5iyVWh5Obf
	 i/87axMnV269VWGRnzCqLBbfGiFA73LBdBeQlej5iIwfTIxKVHFg0Q0y8HiOz0tzTe
	 kb3xrXZ+4xG6ZDOzBeDFXFE3lbecgSSh6p8XJQc2jKs2Sw7xnXCF+aU0Vtm6BR+eYQ
	 FlznIGQVGrWHFqjvUh8NlsiFuktdcVm02W1bT8POebEJpRbfZ0n55loNLcMwg7mPi9
	 1iAupK0wRjgPhvA5mUpJy/lemNvXR9YMv/3QyL6Om58IlCiHNtmPOp5GRms7BYPmvl
	 hNGYCL/aOCmeQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39396f873adso104810701fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:09:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9fzyg8aaUGvtavMumubVyTWHDdpnpup/2ZU571fKxejK/Cxvxr6LhjolDZBZmgdcum9Geu86dc6JnPeKVE@vger.kernel.org
X-Gm-Message-State: AOJu0YwbHqOD8Q9/JGRnXcVHagEKRbPSrKfsUZfkICSx+5Hmhb0HTM0D
	eJo5YgbbPqhVfek8XSWiwDWwqriOJjMv9ZaElws2EOwmVmTruBoV6U5GKiJg9SmXHxyziDr36jF
	8hy/OwpXqtJS6TqLQiY0wVn4eIAWS/Mc89FeF0hM0rA==
X-Received: by 2002:a05:651c:150f:b0:393:b0c7:db0d with SMTP id
 38308e7fff4ca-395d8d66af7mr9077111fa.30.1779440941340; Fri, 22 May 2026
 02:09:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
 <20260521112638.GD2921053@google.com> <CAMRc=MfqaCjiALZyVBHQs=Taft1M9xmNTFvQHWPrd5PgcTfJDQ@mail.gmail.com>
 <20260521132419.GA3591266@google.com> <CAMRc=Me5QS4xA3PJWXNuRP1N_C+w3sP9ZvqH36GNh2Ebc9hwcw@mail.gmail.com>
 <20260521162705.GH3591266@google.com>
In-Reply-To: <20260521162705.GH3591266@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 22 May 2026 11:08:49 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdiwwX_XH7JFW8HuLvYA_ao50fjj0Oip2WMM4QROHRiFA@mail.gmail.com>
X-Gm-Features: AVHnY4KEjtS5lwmgChTK038L9jNVBXcpGXq73PwgIc9ndboYTrc3guSx2Szrq4o
Message-ID: <CAMRc=MdiwwX_XH7JFW8HuLvYA_ao50fjj0Oip2WMM4QROHRiFA@mail.gmail.com>
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD cells
To: Lee Jones <lee@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, Sebastian Reichel <sre@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Ulf Hansson <ulfh@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109203-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,arm.com,arndb.de,rock-chips.com,gmail.com,linaro.org,ettus.com,vger.kernel.org,lists.infradead.org,broadcom.com,linuxfoundation.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BED565B0E1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 6:27=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Thu, 21 May 2026, Bartosz Golaszewski wrote:
>
> > On Thu, May 21, 2026 at 3:24=E2=80=AFPM Lee Jones <lee@kernel.org> wrot=
e:
> > >
> > > >
> > > > I suggested it because of its flexibility. The alternative I had in
> > > > mind is something like a new field in mfd_cell:
> > > >
> > > >     const char *cell_node_name;
> > > >
> > > > Which - if set - would tell MFD to look up an fwnode that's a child=
 of
> > > > the parent device's node by name - as it may not have a compatible.
> > >
> > > Remind me why the chlid device can't look-up its own fwnode?
> > >
> >
> > Oh sure it can, but should it? I'm not sure it's logically sound to
> > have the child device reach into the parent, look up the fwnode and
> > then assign it to itself after it's already attached to the driver.
> > This should be done at the subsystem level before the device is
> > registered.
>
> Leaf drivers reach back into the parent all the time.
>

But drivers don't generally assign firmware nodes to devices they are
already bound to. This is racy as in probe() the device is already
visible to the system. There's no synchronization of device property
access - properties are assumed to be read-only for a registered
device.

Bartosz

