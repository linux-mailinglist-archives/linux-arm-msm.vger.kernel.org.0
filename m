Return-Path: <linux-arm-msm+bounces-111460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0x8RNqFQI2oTpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 00:41:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C48364BB05
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 00:41:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=Vt5RWUbs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111460-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111460-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 539D83008294
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 22:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC2D3D1CC1;
	Fri,  5 Jun 2026 22:41:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F2314883F
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 22:41:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780699295; cv=none; b=GtnOpI5Up4uN3OiyASwaRSq29bt8kXvxteynxSOcdwcB7CQmzSIPqskRLL+u8zNJ8mD8fjuNxbDAgg3odK4C2BfLeyeh80LLeYBwE8TwuQtkdqjaRdx5muzOOOlC+kxLhtmI4OatOskIbAymTE1nW9LfZWWoboMWw/H0d24Ej1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780699295; c=relaxed/simple;
	bh=vd87ERGQaAaVnp5r0xsmMemPbzxqn7ja49VXv/zUKXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lEH/QMG05U1mv/3VTZ3/kmFzVoZgZz23jXwJ0V1ADE4VpSxEXZdQxAiJLiLmStwNin7Fe3DQCC0xTUt4g6rUdwbSITlkWZYgE92s8SBZalEnS3ML7whGEq70GsGEFvFc02sL29R4kLkQS7PRoeEM7aGjLcsfdzGcbNuqSfEoSI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vt5RWUbs; arc=none smtp.client-ip=209.85.222.49
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9618b8bdc51so716012241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 15:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780699293; x=1781304093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxdAlMFBxvqeWetf2Jzav1he/6QnRjj7psD01yf0r3E=;
        b=Vt5RWUbsds7VrASfxODSqTtlgCvZkbtxsled4trkhUU8+ppe12YAJA7sm1aiwl9TEj
         mBuoFh4yplRRu7VdQ/VlnCmSJ8/vqaZGy3OO+mok35g8vtpmwTArjyeZinTsF81ZpbWK
         nTSmBueGlEWdkMPLqa/8/Qq6Hx7YHIKNl+Oh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780699293; x=1781304093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NxdAlMFBxvqeWetf2Jzav1he/6QnRjj7psD01yf0r3E=;
        b=Z8LgiShX2umwHQQiYUSS/Skrz/0L2gcUH/yx9BTqqSjV905BPz5GUQ2Z5b66yjyDgO
         a6n0juDPN/sv5pUls0AsaAv5gGWk1CJ95Tf2i5bL/5gVXXznmilcYMuVy+dkFkrb4tjT
         TQNcNnWq68iPVUg2G+1SpnZJqS1HOaVstgBUw/Vl6gA7BNcJVyEqQj/vu9KKGPQSQIU6
         vUdncp9Dy05EDHVhcfE2oeG336IeaLqif4FhKgwwDhgolJwRf7+KVAYFkz+tp3NRMHzh
         W6hn7kkeBZ/jd3kdnl0SmayqRfTr1DY52DNUooaZAPXiDhmmXphv9urazRQ3hpgYIhnL
         EqBA==
X-Forwarded-Encrypted: i=1; AFNElJ/EpVsuBOavtCKG6d+NsZJMrZz4gFOAtgvFXHgJZMZvgEB66gWaenGbwJbgirosdbcya73sVfYZ96gGMgyw@vger.kernel.org
X-Gm-Message-State: AOJu0YzjHBlRMv3EUJzamnAzTkqNR0836CvWluoCAImlqsbUubkj6Bt4
	s2n7VNOeCtJBrCd830HB0IKYzk2f3SIPIAmUOfbYidEvvfkJtfwqGep+NUoBPmZhs4vBXDna0sq
	mwtY=
X-Gm-Gg: Acq92OE70An3qXZN9HHJfIqZloc+fgfF+EueIOsh8dmQpItPsr2+9su8NoKqKFzpyyp
	Wa8Bfs4y3OTFc9BgVtLmgm6mQFxPm5HA/1+t2jjxKqO2YNUG/2mxhLDMnolcdoj/7BGV6nHGNP1
	F3SXwQxImW/disMoytcvNyhY2+zOlDe2hbruyaRHPLUO65j4gyiEGg2lWHjq3mIFj0ooXAnYwE8
	f0bvTbXAzHssHffkDeu+hjhdymx2mopDIxxgLg91UChJBDxWUITncRiWN5rx7q6eV1+1aa2/3Q3
	XuoUr52D8R36RAhjIW7RxctHheA7s7IxIZZQOPZOdfIAIiM4tcBdp1Ts1X1DAnZsmfHk7DE0J3I
	CfLCmuPdpjJuKGvrUcPVRC4TKFvGVCP7ZDThrOsQ15obSDqUOzAd2gnYfpVLnXYIXMEljHjE48H
	+9wPfwfqfTi0a/259Kg30K4GwB3MBfOh7l7HlHBIfK5hvTBb6yPRvJVy7bwjSZBS2jqMlcMiSj
X-Received: by 2002:a05:6102:8097:b0:633:e67f:b7f with SMTP id ada2fe7eead31-6ff005a23edmr3148418137.25.1780699292774;
        Fri, 05 Jun 2026 15:41:32 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96413f91f22sm7829117241.5.2026.06.05.15.41.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 15:41:31 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-963f63fe025so738251241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 15:41:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9MjtQb8SvtPtrNJh+gIvqavglBz6uLpk4RPYwRCRnUtR1mNGR9zJF5LnvBpwaCECAR2G72apgsBgpQ6IGS@vger.kernel.org
X-Received: by 2002:a05:6102:2922:b0:635:1bc8:3568 with SMTP id
 ada2fe7eead31-6fefe98bb4amr3098337137.23.1780699290556; Fri, 05 Jun 2026
 15:41:30 -0700 (PDT)
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
 <CAL_JsqK6u=x=ScTnW1jJCPZpCUb3mT0NZpsKqe6PqZmrNEKZiQ@mail.gmail.com>
In-Reply-To: <CAL_JsqK6u=x=ScTnW1jJCPZpCUb3mT0NZpsKqe6PqZmrNEKZiQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Jun 2026 15:41:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XBn78eOC_zG0S2U-W3whrVYEpghKF_WgX+3zpUJ82-5g@mail.gmail.com>
X-Gm-Features: AVVi8CfhuBhdP6-5vH6s542O1z5nb76ugorEAmoG2LM_DR_IrP8yU98AI3rZB0M
Message-ID: <CAD=FV=XBn78eOC_zG0S2U-W3whrVYEpghKF_WgX+3zpUJ82-5g@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: samsung,atna33xc20: Add ATNA40HQ08-0
To: Rob Herring <robh@kernel.org>
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
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111460-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C48364BB05

Hi,

On Fri, Jun 5, 2026 at 10:14=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Jun 5, 2026 at 10:44=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Fri, Jun 5, 2026 at 8:28=E2=80=AFAM Rob Herring <robh@kernel.org> wr=
ote:
> > >
> > > > > --- a/Documentation/devicetree/bindings/display/panel/samsung,atn=
a33xc20.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/panel/samsung,atn=
a33xc20.yaml
> > > > > @@ -25,6 +25,8 @@ properties:
> > > > >                - samsung,atna40ct06
> > > > >                # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED=
 panel
> > > > >                - samsung,atna40cu11
> > > > > +              # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED=
 panel
> > > > > +              - samsung,atna40hq08
> > > >
> > > > Sure. I'll repeat the same comment I made the last time someone lan=
ded
> > > > a change to this file [1] in the hopes that maybe someone will post=
 a
> > > > patch one day:
> > > >
> > > > <repeat>
> > > > Given how many of these we're up to now, I'm starting to wonder if =
we
> > > > should come up with a generic compatible like we did with "edp-pane=
l"
> > > > and then we can stop having to merge CLs like this. All of these
> > > > Samsung OLED eDP panels have the same power up sequence and once we=
 do
> > > > that then we can read them via EDID or via DP AUX bus to identify
> > > > which specific panel we have and if they need additional tweaking,
> > > > just like we do with "edp-panel". Do DT folks have any opinion abou=
t
> > > > that? Coming up with a name would be a pain since I wouldn't want t=
o
> > > > assert that all future Samsung OLED eDP panels will have the same
> > > > powerup sequence. Maybe "samsung,amoled-edp-panel-v1" even though t=
hat
> > > > sounds terrible and there's no known need for a "-v2"?
> > > > </repeat>
> > >
> > > If things are the same, then perhaps there should be a fallback
> > > compatible. Or just reuse an existing compatible.
> >
> > Right, there already is a fallback comparible. This patch is just
> > adding a string to the enum that has the fallback compatible
> > "samsung,atna33xc20". So someone using this new panel will use:
> >
> > compatible =3D "samsung,atna40hq08", "samsung,atna33xc20"
> >
> > My point was that listing specific panel isn't really valuable here.
> > Though the "samsung" power sequence isn't completely compatible with
> > the generic "eDP panel" power sequence (which is why they have
> > separate drivers), just like generic "eDP panel"s we can query the
> > panel ID if there are any per-panel quirks.
>
> Unless the quirk is how to power on/off the panel...

Well, only if the quirk is how to power "on" the panel. ;-)

If a panel does need different power-on processing, then I'd expect a
new compatible string unless we end up in the situation we had with
eDP panels where there is a ton of second-sourcing going on and the
quirk is relatively benign (like the "hpd-reliable-delay-ms" and
"hpd-absent-delay-ms" properties for "edp-panel").


> > So the question is: should we stop adding specific panels and just
> > always list "samsung,atna33xc20" for all Samsung panels with a
> > compatible power sequence, is it worth it to add a more generic name,
> > or should we really keep listing all these individual panels for no
> > real gain.
> >
> >
> > > I can in no way
> > > prevent someone from using 'foo-panel' in their DT when the h/w is
> > > actually a foobar panel if the differences are transparent to s/w. (B=
ut
> > > I will reject a quirk property later on when foobar turns out to be
> > > different than foo.)
> >
> > It's more a question of what guidance we tell people. Here, Konrad is
> > trying to do "the right thing" by listing his specific panel and then
> > using the fallback. I'm saying "listing the specific panel isn't
> > gaining you anything" and I'd rather not have to review / apply these
> > pointless additions to the bindings.
>
> I think the guidance is clear. Overall, doing something special here
> because Samsung panels are special just muddies what the right thing
> is for everyone else.
>
> > ...but I can imagine people will be upset if I tell them to list
> > "samsung,atna33xc20" for all compatible Samsung AMOLED panels. It
> > would be nicer to come up with some sort of generic name?
>
> Well yes, people have a hard time using compatible strings that don't
> sound generic. That's too bad for them.

OK, so sounds like going forward I should NAK changes to this file and
tell people to just use:

compatible =3D "samsung,atna33xc20";

...to mean "Generic Samsung AMOLED panel with power sequencing that
matches atna33xc20"

Yes, it means that if we find quirks with a specific panel later, it
could possibly be harder to work around them. However, since we have
several ways to identify the panel (via EDID and via DDC) this seems
fairly low risk. You can't perfectly predict the future anyway.


-Doug

