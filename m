Return-Path: <linux-arm-msm+bounces-111446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TNNOAzLxImonfgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 17:54:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6D664982C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 17:54:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=R9nw5l46;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111446-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111446-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4440530D5FB1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 15:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46779360EE8;
	Fri,  5 Jun 2026 15:44:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD32130D3E8
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 15:44:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780674279; cv=none; b=n6GAxvioMnPDhRbnvBYZ9KSvLVCkcNED0WVK/kmd8Exn1+yxBB93aRNz/PhaVJ/h6JvCFtx3HoKG56N9gdK7FY+72vR4k4krBC9m8qHFEAp55aAXINbFS1vQ4aGArpXucUr0JeZVIr+m6JLQJmQXqdUmqe6sovpMeB8F2eADEUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780674279; c=relaxed/simple;
	bh=QTha33AcsGXLqeJoB7ThtoiTamYthYSeoS5Y5QadO/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZPR+F5NeXbma3WIJuRs7t9VUg6nkUGfuljNYv0hIYQQ8fRhpYrq0yghpJQwPp6wI5VydMwU5HZ4+gfF09Bnk7C8N44GcAWmx+4RwP2qTl+0iYTBg87PMOICBWY4JqcTEJAxVgXJSVZgBtW84m/Occd6xdTR2FsCG7p2uz6jqHBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R9nw5l46; arc=none smtp.client-ip=209.85.217.43
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-6c3a36fa9edso1531756137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 08:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780674277; x=1781279077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZktE3L5rKfoN1/el6TuB/5aSd1JOfP8XWyiHhYJAdA=;
        b=R9nw5l46H+BQQonVeXJJRK/O9oZZ3tUL4d3XDdxUCDgcOMGlq+6dxiswq3hGQEl/36
         7MJXwahoPO4W/HMoLWRw27eGeALHWCaRb8JZTz5l+0b97RTl4TebknOdX9HAxWK9SMrX
         2jXKhEm64NgcaAruxBmhFq5LUJSgo9jxyP3Uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780674277; x=1781279077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CZktE3L5rKfoN1/el6TuB/5aSd1JOfP8XWyiHhYJAdA=;
        b=ORsVDcTY9LEddmekJx0nSCUR+nA9rZ8ezpjt1dWdtl425fLVlwnuyA5oMewdYCuFMH
         fRDkjF8s7j7+Iu1fdaGB5BFzuJlqBcmzkF0JwDyvbr0JyNSHakOZu5HscAPgvtojh1hf
         hPo+/XAIqZMimWZE1xF3yDt4r4ArG8vTmmM8O5pZUWvOg5uvghTs6K5WbCnJDlCGlSgw
         1fd+r9mNJrP3JAv+KVcclTw7dWc7KDC2dk0gyL07/dYPNqKlv7fGeVaKna0Id8zO5cyB
         EDIjbuW42bU2UPrxqZBVP3zO/CFPTXNIhUCSWusfYRVxNC6OlKCXoS72jwfJhKfA4j9g
         54Gg==
X-Forwarded-Encrypted: i=1; AFNElJ+fjB8zbGTALiuZXORtX41x4kJs+vF5Cu5hpn7QGKlL285Qo9ZePkaD3umdcO7j1ctsYrqixP1OzvgdRplz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz05LKZAH1/m9C8SsfT/CWlOgA+vKu8ocUKcClXzfrh/c9fhFnK
	fn+gWQDR7lyomcEg7qO2RBCuJQOOlhXXjcyF/w/e/6ehQ/jd6/fdL1KpfpSC6AwOkBLuxklBDkp
	51SA=
X-Gm-Gg: Acq92OGh/GBODubJxkcz4eaQ7nOxDPOrA7l1EuMnwRFPgE96MZJWRTMsfrjt3/cE/Zh
	7tmfHB/tGYSIUe8ZFTCXsRvtZisfwgKKSRrqgLRT9VF45vwltmsHSCLBqTDDWv/iKOu/mexNUL5
	RriAuEPkyX6BTxA5lhwmXZsFIzoD3xCLHyGiROtHm8NcfMzWrDtMRHEnmktGuT6rkJfDCyJmYlM
	Gy0E0Q0/XiwqCFKrnwgoT/3QER4TXKcTrvneqtepzPklkCyZmzCHi28wGG2N+Fs1bBdx/+4qCFm
	LZD66yRWmw3xTHpur+JZbwo3m/2KZG6MxsWXthdFT27D7P3RHAJJdTeqB6D0IRyrfemxGUgSCBE
	8LsWswwVo4bxr16ZSVsy4TPNFSt8IC4j+NbYrS5/aS89pvzURjB8nNsOxD2x95pXth/Q+d5DF1Y
	nv6Qja/HVdwndmc0+BqbTMJTn43BgECzF7Y2nUGtyDaRNPLcwXZ8sdN3BafYjwqIPej6Q7Lk33
X-Received: by 2002:a05:6102:5ef:b0:6d0:a5a0:ba23 with SMTP id ada2fe7eead31-7002b522935mr1021689137.3.1780674276775;
        Fri, 05 Jun 2026 08:44:36 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb6668702fsm7685942137.10.2026.06.05.08.44.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 08:44:35 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6c67361fa3bso2164891137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 08:44:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+HCE9jIX2e7sMnjxX3ljARoD80ECK6Sq/ikMSt8zTP1fGQez1ilyi6k4FmvrvkXS6deOwcAKizavP4P1uY@vger.kernel.org
X-Received: by 2002:a05:6102:8347:10b0:6b4:d9ba:d9d2 with SMTP id
 ada2fe7eead31-7002d6be5e9mr1035796137.6.1780674274409; Fri, 05 Jun 2026
 08:44:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-1-57c70c23d0d6@oss.qualcomm.com>
 <CAD=FV=UaPKiGSL6mhVdywp67skSr2B7977f3kZ23FFHaD=95RQ@mail.gmail.com> <20260605152825.GA3740391-robh@kernel.org>
In-Reply-To: <20260605152825.GA3740391-robh@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 5 Jun 2026 08:44:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U7jz-xwA+-Fic2thZaK6eCDhc-PZ1fqpCMAUmy3V3Y+Q@mail.gmail.com>
X-Gm-Features: AVVi8CdDy3XFBVBoorpIXJgEbshGHoXa78jsg55oeGuqaaVdEdPTZn0YzBf-fxQ
Message-ID: <CAD=FV=U7jz-xwA+-Fic2thZaK6eCDhc-PZ1fqpCMAUmy3V3Y+Q@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111446-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,chromium.org:from_mime,chromium.org:dkim,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D6D664982C

Hi,

On Fri, Jun 5, 2026 at 8:28=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> > > --- a/Documentation/devicetree/bindings/display/panel/samsung,atna33x=
c20.yaml
> > > +++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33x=
c20.yaml
> > > @@ -25,6 +25,8 @@ properties:
> > >                - samsung,atna40ct06
> > >                # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED pan=
el
> > >                - samsung,atna40cu11
> > > +              # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED pan=
el
> > > +              - samsung,atna40hq08
> >
> > Sure. I'll repeat the same comment I made the last time someone landed
> > a change to this file [1] in the hopes that maybe someone will post a
> > patch one day:
> >
> > <repeat>
> > Given how many of these we're up to now, I'm starting to wonder if we
> > should come up with a generic compatible like we did with "edp-panel"
> > and then we can stop having to merge CLs like this. All of these
> > Samsung OLED eDP panels have the same power up sequence and once we do
> > that then we can read them via EDID or via DP AUX bus to identify
> > which specific panel we have and if they need additional tweaking,
> > just like we do with "edp-panel". Do DT folks have any opinion about
> > that? Coming up with a name would be a pain since I wouldn't want to
> > assert that all future Samsung OLED eDP panels will have the same
> > powerup sequence. Maybe "samsung,amoled-edp-panel-v1" even though that
> > sounds terrible and there's no known need for a "-v2"?
> > </repeat>
>
> If things are the same, then perhaps there should be a fallback
> compatible. Or just reuse an existing compatible.

Right, there already is a fallback comparible. This patch is just
adding a string to the enum that has the fallback compatible
"samsung,atna33xc20". So someone using this new panel will use:

compatible =3D "samsung,atna40hq08", "samsung,atna33xc20"

My point was that listing specific panel isn't really valuable here.
Though the "samsung" power sequence isn't completely compatible with
the generic "eDP panel" power sequence (which is why they have
separate drivers), just like generic "eDP panel"s we can query the
panel ID if there are any per-panel quirks.

So the question is: should we stop adding specific panels and just
always list "samsung,atna33xc20" for all Samsung panels with a
compatible power sequence, is it worth it to add a more generic name,
or should we really keep listing all these individual panels for no
real gain.


> I can in no way
> prevent someone from using 'foo-panel' in their DT when the h/w is
> actually a foobar panel if the differences are transparent to s/w. (But
> I will reject a quirk property later on when foobar turns out to be
> different than foo.)

It's more a question of what guidance we tell people. Here, Konrad is
trying to do "the right thing" by listing his specific panel and then
using the fallback. I'm saying "listing the specific panel isn't
gaining you anything" and I'd rather not have to review / apply these
pointless additions to the bindings.

...but I can imagine people will be upset if I tell them to list
"samsung,atna33xc20" for all compatible Samsung AMOLED panels. It
would be nicer to come up with some sort of generic name?

-Doug

