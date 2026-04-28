Return-Path: <linux-arm-msm+bounces-104993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEzQEo6w8GkfXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:05:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3C14857D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D63C30D4782
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F03244B672;
	Tue, 28 Apr 2026 12:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OywqrMno"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54828449EA8
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380695; cv=none; b=qca4VXf9W2VJX9ODW5DIGmxSXZSImDLEKCra2LUF5gVk6NnKsYH8bOa9mRO6QtlZOxZ6vfSj34DWwO+L08QyU+tq9KvezYGpHqRYSo/BgEc2ofYf5ZNiwL/3x3JGEyxVdaxLreKVOmkwysvCjxW+1CeTBOuSjkw519rWhLwITS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380695; c=relaxed/simple;
	bh=H06R9NsyFguVgVc2OrDtUg5k+e6blEtpJ4v4I1D5i5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nNqsGmwUgRmFBY9ygWY/tuObilf7lz80WwFyYCllcxhQbGpzjOi4BUSqpG7KdAWotyELc6DgqItfv87Pea7sJyG+GsVPSW1sLgbE8maeMXVx7kIh3bq31omzA00JRI+OYiW0FJrvNjWkBXmZy+B1WZUsGKb9CA+oMcffUlUeVFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OywqrMno; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DBA1C2BCF7
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777380695;
	bh=H06R9NsyFguVgVc2OrDtUg5k+e6blEtpJ4v4I1D5i5M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OywqrMno8jmcYD5v5Fd/6PqnvmgjCNVeng1svVEtob8W/Iw/FcndcE6vrAV8z0aqs
	 RUW5idBfci72/mDGzWN4JH6suzNAOE/YUUE0uISvzPMs5H71yEO9dtJVejcll0MDzP
	 9e2XsiFv5N4v/3lP537JwiWFk7kX1fNuko7bbhIbDRSJK/5lSUbKSLK499ubLLFwh7
	 sigbIXKG9deE+GdQJX9rM7Vvas62YzWyPh+xGUAvamMd/CRcZMOl3rxtumhupZSFUn
	 agKcPV3vY0KM9T9Iv5XTbORmpetX8ZhSx3EbWgN5kj7oG7cxwdrNOOZv5jtT7gN0gj
	 5evw1y28sf/Ng==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a40502e63bso10175255e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:51:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8GUt9PJsb1QpPi8LXdMaiB+PPqzd8evYRwOEmFPIrumrodhZ1QaU76Kwpat8iEmdorwqnAMDOnZem49LuN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6CeKE2La6LgjyPFptrOz5Xi/rROTbK0KvQhkk29ZZ19xeTCPw
	myZS8cCJR1lcb1AAD1vQBYqPnnBdVsETHI9nIKODQ6vLotdo4bXNhgs4fez+lj5N6LdDeN36gIj
	YcYZ1Ea+uwYIM8VA3VaNLSP+YwwY4stJDl1g/zfdNJQ==
X-Received: by 2002:a19:f617:0:b0:5a7:470a:cc2a with SMTP id
 2adb3069b0e04-5a7470acc7amr726274e87.31.1777380693277; Tue, 28 Apr 2026
 05:51:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
 <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com> <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com>
In-Reply-To: <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 28 Apr 2026 14:51:21 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdxpSXiqAn-8Az4ig4N8TFVdE9psacPVG9J9KehuFnbwA@mail.gmail.com>
X-Gm-Features: AVHnY4JU1UwiPshYmVjsgOwUMFBB1XE6bzFZjj4Zzp3u2SG40oRUQvl3mhft_7w
Message-ID: <CAMRc=MdxpSXiqAn-8Az4ig4N8TFVdE9psacPVG9J9KehuFnbwA@mail.gmail.com>
Subject: Re: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD cells
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2E3C14857D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[qualcomm.com:server fail,mail.gmail.com:server fail,sea.lore.kernel.org:server fail];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[34];
	TAGGED_FROM(0.00)[bounces-104993-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]

On Tue, Apr 28, 2026 at 2:18=E2=80=AFPM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
>
>
> On 28-04-2026 13:33, Bartosz Golaszewski wrote:
> > On Mon, 27 Apr 2026 19:34:48 +0200, Shivendra Pratap
> > <shivendra.pratap@oss.qualcomm.com> said:
> >> MFD core has no way to register a child device using an explicit firmw=
are
> >> node. This prevents drivers from registering child nodes when those no=
des
> >> do not define a compatible string. One such example is the PSCI
> >> "reboot-mode" node, which omits a compatible string as it describes
> >> boot-states provided by the underlying firmware.
> >>
> >> Extend struct mfd_cell with an optional fwnode pointer and attach it t=
o the
> >> child device during registration when no firmware node is already assi=
gned.
> >>
> >> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> >> ---
> >
> > In the following patch you use this and violate the supposed constness =
of
> > MFD cells. This also mean you need to modify the mfd_cell at run-time. =
I would
> > prefer introducing a field in mfd_cell: bool use_parent_fwnode which wo=
uld
> > indicate to MFD core that - in case no fwnode was assigned from other s=
ources:
> > DT or software node - it should reuse the parent MFD device's node.
>
> Have one doubt on this, When we fallback to use_parent_fwnode for cell:
> psci-reboot-mode, at psci_reboot_mode_probe(), pDev->dev->of_node point
> to psci node.
>
> But we want dev->of_node to point to "reboot-mode" node. This may need
> an explicit assignment again of of_node?
>

Ah, sorry you're right. I'd like to avoid having to modify the
mfd_cell entry at run-time if possible.

How about a callback in mfd_cell like:

struct fwnode_handle *(*get_fwnode)(struct device *parent);

If set, it would be called from MFD core and would do the name lookup
and return the fwnode which would then be assigned to the cell device?

Bart

