Return-Path: <linux-arm-msm+bounces-111452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /dXtK3AFI2qzggEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 19:20:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE1864A1A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 19:20:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XBo9s2kO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111452-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111452-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6B9A3063654
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 17:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E790390CB0;
	Fri,  5 Jun 2026 17:14:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C734390987
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 17:14:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780679689; cv=none; b=Aew4MFbRNGeLgHkzDECl7L/qB6BKqRameGFqJiR4DFMf9sw4hbBoZrsqgxAU26xkcapYQ1TubIisNbe9qwMyhc9hEl8bA2eoidJY0IpokTiyLNpLmp7fLOn03/lBGIYP1grqyqDx+17Te+SMH5QfUjSje0iF45ZI7cDmtEAmpW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780679689; c=relaxed/simple;
	bh=etcX7CEbD7K5sg+x4SMZnN+iKLow2nvlCQUFEC7JeJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGVKVr0OALggmU1pDObvA5okUGDpnr6aSvPxV7w2FsyUIKAJjk7XNK5LjS+q2N4DnCelA9JY4YW/hNAR7Whr1fzFEIa7VkEs8BZpMIuw1I3uHy++TyVhXgQ1icaByPQxCO2+9AIuLvTbGI7v3+R9NlukdMQZ4fXcqslG4wObwWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XBo9s2kO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37481F008A5
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 17:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780679683;
	bh=IcRm456QdtU6z5KIdxsLtZziLg7NX4skuuvLNBIybyw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XBo9s2kO9HPWcWLQQgb/4VfXrAud77BeQaoESzvh6Rz+HE7dm/YAsque+CvthiLnr
	 YApuGQtEjiHlm+//dNbwwyAWjSz4rSaGHJM5oMKXjMvRD2JSnZ8IeoLN8BJAecmZo2
	 XJ85yq/AF4znfTA7DTWNigfLHjSgPj5/0yOX03i6LGt9M6CWCCFAGZHRZa5OIWIpt3
	 4vsFJyHfHdPGPgjgb3fYGXpssGechEfYFhdsLcqf3BDtkg4MKo9mZc/TMUVRIUXHGr
	 q7mV6YzVxGwRyKWnAYjV50Un7aIe3q0GbEGP2HcZ3sEI4fP1vngLCJgqdJ/wGSqr3p
	 OUemj2letzkaw==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bebb72b845aso313865166b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 10:14:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/mcdcHLuN0zwCGz3hvWz6LYjQa/lVBo+2cvndyD+6gqcHBCu5QvMmYQPjbPVkSeNlCBo4hV4mR7WoBQoat@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy0PkdCcMLS3j4kl2XlOMJx0ROGmPYUKZZ/DBm/WjxFZ7nk886
	ovTk4V0plc8ggFuhN01YggTFqTPvFAxB4YdHWN/dqWiLt9ae6HUIffXitMff+bGIxLUPLLBPm4u
	N9lCJpvVPsgOg5zO5hW82iNf52S+Mfg==
X-Received: by 2002:a17:907:c70f:b0:beb:2de3:1ba3 with SMTP id
 a640c23a62f3a-bf370379589mr241934066b.2.1780679681461; Fri, 05 Jun 2026
 10:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-1-57c70c23d0d6@oss.qualcomm.com>
 <CAD=FV=UaPKiGSL6mhVdywp67skSr2B7977f3kZ23FFHaD=95RQ@mail.gmail.com>
 <20260605152825.GA3740391-robh@kernel.org> <CAD=FV=U7jz-xwA+-Fic2thZaK6eCDhc-PZ1fqpCMAUmy3V3Y+Q@mail.gmail.com>
In-Reply-To: <CAD=FV=U7jz-xwA+-Fic2thZaK6eCDhc-PZ1fqpCMAUmy3V3Y+Q@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 5 Jun 2026 12:14:29 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK6u=x=ScTnW1jJCPZpCUb3mT0NZpsKqe6PqZmrNEKZiQ@mail.gmail.com>
X-Gm-Features: AVVi8Cf3FUFFsPi6lWnAyjgHAqmELGslnJKlwX5WVRthEjFEy8iH_Hc4jJmXkXI
Message-ID: <CAL_JsqK6u=x=ScTnW1jJCPZpCUb3mT0NZpsKqe6PqZmrNEKZiQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: samsung,atna33xc20: Add ATNA40HQ08-0
To: Doug Anderson <dianders@chromium.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111452-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dianders@chromium.org,m:konrad.dybcio@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,chromium.org:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5EE1864A1A4

On Fri, Jun 5, 2026 at 10:44=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Jun 5, 2026 at 8:28=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
> >
> > > > --- a/Documentation/devicetree/bindings/display/panel/samsung,atna3=
3xc20.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/panel/samsung,atna3=
3xc20.yaml
> > > > @@ -25,6 +25,8 @@ properties:
> > > >                - samsung,atna40ct06
> > > >                # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED p=
anel
> > > >                - samsung,atna40cu11
> > > > +              # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED p=
anel
> > > > +              - samsung,atna40hq08
> > >
> > > Sure. I'll repeat the same comment I made the last time someone lande=
d
> > > a change to this file [1] in the hopes that maybe someone will post a
> > > patch one day:
> > >
> > > <repeat>
> > > Given how many of these we're up to now, I'm starting to wonder if we
> > > should come up with a generic compatible like we did with "edp-panel"
> > > and then we can stop having to merge CLs like this. All of these
> > > Samsung OLED eDP panels have the same power up sequence and once we d=
o
> > > that then we can read them via EDID or via DP AUX bus to identify
> > > which specific panel we have and if they need additional tweaking,
> > > just like we do with "edp-panel". Do DT folks have any opinion about
> > > that? Coming up with a name would be a pain since I wouldn't want to
> > > assert that all future Samsung OLED eDP panels will have the same
> > > powerup sequence. Maybe "samsung,amoled-edp-panel-v1" even though tha=
t
> > > sounds terrible and there's no known need for a "-v2"?
> > > </repeat>
> >
> > If things are the same, then perhaps there should be a fallback
> > compatible. Or just reuse an existing compatible.
>
> Right, there already is a fallback comparible. This patch is just
> adding a string to the enum that has the fallback compatible
> "samsung,atna33xc20". So someone using this new panel will use:
>
> compatible =3D "samsung,atna40hq08", "samsung,atna33xc20"
>
> My point was that listing specific panel isn't really valuable here.
> Though the "samsung" power sequence isn't completely compatible with
> the generic "eDP panel" power sequence (which is why they have
> separate drivers), just like generic "eDP panel"s we can query the
> panel ID if there are any per-panel quirks.

Unless the quirk is how to power on/off the panel...

> So the question is: should we stop adding specific panels and just
> always list "samsung,atna33xc20" for all Samsung panels with a
> compatible power sequence, is it worth it to add a more generic name,
> or should we really keep listing all these individual panels for no
> real gain.
>
>
> > I can in no way
> > prevent someone from using 'foo-panel' in their DT when the h/w is
> > actually a foobar panel if the differences are transparent to s/w. (But
> > I will reject a quirk property later on when foobar turns out to be
> > different than foo.)
>
> It's more a question of what guidance we tell people. Here, Konrad is
> trying to do "the right thing" by listing his specific panel and then
> using the fallback. I'm saying "listing the specific panel isn't
> gaining you anything" and I'd rather not have to review / apply these
> pointless additions to the bindings.

I think the guidance is clear. Overall, doing something special here
because Samsung panels are special just muddies what the right thing
is for everyone else.

> ...but I can imagine people will be upset if I tell them to list
> "samsung,atna33xc20" for all compatible Samsung AMOLED panels. It
> would be nicer to come up with some sort of generic name?

Well yes, people have a hard time using compatible strings that don't
sound generic. That's too bad for them.

Rob

