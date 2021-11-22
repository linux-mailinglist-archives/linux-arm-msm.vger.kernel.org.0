Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45461458AF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 10:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238910AbhKVJFa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 04:05:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbhKVJF3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 04:05:29 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF81C061574;
        Mon, 22 Nov 2021 01:02:22 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id f18so77527875lfv.6;
        Mon, 22 Nov 2021 01:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=yJt+SRSX8jW1HW53qw5WPEzJ6TOm3Zw+e5pcv30xzUg=;
        b=H0gUe0I5WYhd/qMc49gQ5ejJOmkYs6GVxp4V67Z9rKNdNZYONfh3jGqWqR8pJAPIMM
         6RV1meRYAxuFWjSAGV6WVqQtEnKH7Qibb2BStrks9tfaHLBV5k7tMvde51zvU8tAY1cQ
         zj1fYg21e0AqkABrPCFlX4iQZ82bdERG56M9ne7/v30I2kCboeNn0OAqbqaQaMptuO/C
         kCGSarFR7tQ94JH2rmpnEa61tbmBH8jW6jhBSKfh487FQclrMnzQF9KH3uL6n9obhwXG
         n9IHX6w8XtVEki3xUOXdn67tUYp0p9mKp85iSbj/Z8NuTNA6EmuOdqMOvOoTRAhylrno
         gH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=yJt+SRSX8jW1HW53qw5WPEzJ6TOm3Zw+e5pcv30xzUg=;
        b=Z4+KMMEdmDIBSbCaKpIxnZDV4QMIJo7LMnIa8o23ik+LB8aETRut3ntncLhTw/qNSX
         7nk2A5qyfcLEd0YgSXLXc/7pT6xWVwOOlPm6nZfY++i91y7jmSX2bbrgZcmr2mwIsKPb
         zVhGwnx/Eps+dSqKMvXbEvCnpnDsEJZeJ7k2ZEDaojjafAu2XMrFm4lp4ASCBORapPRg
         Mi+ysyw9/VYrQTEPTF1tBLIGxbSX83Fyc0/SP3qyym3qZK0VRX3Q7dTlbnzPUfRXuG/O
         yHdiAMZBQ14xwGiwY7CUkRRsCKdiEWbHAuNwlfiQYaUR5+Dx9zjVkPfmv9T4cHVvzDe9
         MDfw==
X-Gm-Message-State: AOAM5330IB04TXTY7ZiOqQl/Sc37QU1fRSc+T9HzPgzk9jxsqvSgnTyc
        HUa5MfG1iNB/AK9Q+1L+F90=
X-Google-Smtp-Source: ABdhPJz5VjIYFw9flHfsmR39Bm575nFBseGAY7aN31lcJujkNRdDAbb3Ga2pW1wCDyDAJ5XBvNHPSg==
X-Received: by 2002:a05:651c:b12:: with SMTP id b18mr51864542ljr.306.1637571738924;
        Mon, 22 Nov 2021 01:02:18 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id d39sm897361lfv.78.2021.11.22.01.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 01:02:18 -0800 (PST)
Date:   Mon, 22 Nov 2021 11:02:08 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Jason Baron <jbaron@akamai.com>
Cc:     seanpaul@chromium.org, sean@poorly.run,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        Jim Cromie <jim.cromie@gmail.com>, quic_saipraka@quicinc.com,
        catalin.marinas@arm.com, dri-devel@lists.freedesktop.org,
        will@kernel.org, maz@kernel.org, amd-gfx@lists.freedesktop.org,
        mingo@redhat.com, daniel.vetter@ffwll.ch, arnd@arndb.de,
        linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        rostedt@goodmis.org, intel-gvt-dev@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, quic_psodagud@quicinc.com,
        mathieu.desnoyers@efficios.com
Subject: Re: [PATCH v10 08/10] dyndbg: add print-to-tracefs, selftest with
 it - RFC
Message-ID: <20211122110208.528e1d80@eldfell>
In-Reply-To: <41ea83b2-a707-cb6f-521e-070bb12502de@akamai.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
        <20211111220206.121610-9-jim.cromie@gmail.com>
        <20211112114953.GA1381@axis.com>
        <f3914fa9-8b22-d54e-3f77-d998e74094b9@akamai.com>
        <20211116104631.195cbd0b@eldfell>
        <f87b7076-47e6-89b1-aaf9-b67aa6713e01@akamai.com>
        <20211118172401.0b4d722e@eldfell>
        <41ea83b2-a707-cb6f-521e-070bb12502de@akamai.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UCDrJjDv+I30GhRn07Cyyaq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--Sig_/UCDrJjDv+I30GhRn07Cyyaq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Nov 2021 11:21:36 -0500
Jason Baron <jbaron@akamai.com> wrote:

> On 11/18/21 10:24 AM, Pekka Paalanen wrote:
> > On Thu, 18 Nov 2021 09:29:27 -0500
> > Jason Baron <jbaron@akamai.com> wrote:
> >  =20
> >> On 11/16/21 3:46 AM, Pekka Paalanen wrote: =20
> >>> On Fri, 12 Nov 2021 10:08:41 -0500
> >>> Jason Baron <jbaron@akamai.com> wrote:
> >>>    =20
> >>>> On 11/12/21 6:49 AM, Vincent Whitchurch wrote:   =20
> >>>>> On Thu, Nov 11, 2021 at 03:02:04PM -0700, Jim Cromie wrote:     =20
> >>>>>> Sean Paul proposed, in:
> >>>>>> https://urldefense.com/v3/__https://patchwork.freedesktop.org/seri=
es/78133/__;!!GjvTz_vk!HcKnMRByYkIdyF1apqQjlN5aBIomzJR1an3YWXM6KXs0EftVMQdr=
ewRA8Dki4A$=20
> >>>>>> drm/trace: Mirror DRM debug logs to tracefs
> >>>>>>
> >>>>>> His patchset's objective is to be able to independently steer some=
 of
> >>>>>> the drm.debug stream to an alternate tracing destination, by split=
ting
> >>>>>> drm_debug_enabled() into syslog & trace flavors, and enabling them
> >>>>>> separately.  2 advantages were identified:
> >>>>>>
> >>>>>> 1- syslog is heavyweight, tracefs is much lighter
> >>>>>> 2- separate selection of enabled categories means less traffic
> >>>>>>
> >>>>>> Dynamic-Debug can do 2nd exceedingly well:
> >>>>>>
> >>>>>> A- all work is behind jump-label's NOOP, zero off cost.
> >>>>>> B- exact site selectivity, precisely the useful traffic.
> >>>>>>    can tailor enabled set interactively, at shell.
> >>>>>>
> >>>>>> Since the tracefs interface is effective for drm (the threads sugg=
est
> >>>>>> so), adding that interface to dynamic-debug has real potential for
> >>>>>> everyone including drm.
> >>>>>>
> >>>>>> if CONFIG_TRACING:
> >>>>>>
> >>>>>> Grab Sean's trace_init/cleanup code, use it to provide tracefs
> >>>>>> available by default to all pr_debugs.  This will likely need some
> >>>>>> further per-module treatment; perhaps something reflecting hierarc=
hy
> >>>>>> of module,file,function,line, maybe with a tuned flattening.
> >>>>>>
> >>>>>> endif CONFIG_TRACING
> >>>>>>
> >>>>>> Add a new +T flag to enable tracing, independent of +p, and add and
> >>>>>> use 3 macros: dyndbg_site_is_enabled/logging/tracing(), to encapsu=
late
> >>>>>> the flag checks.  Existing code treats T like other flags.     =20
> >>>>>
> >>>>> I posted a patchset a while ago to do something very similar, but t=
hat
> >>>>> got stalled for some reason and I unfortunately didn't follow it up:
> >>>>>
> >>>>>  https://urldefense.com/v3/__https://lore.kernel.org/lkml/202008251=
53338.17061-1-vincent.whitchurch@axis.com/__;!!GjvTz_vk!HcKnMRByYkIdyF1apqQ=
jlN5aBIomzJR1an3YWXM6KXs0EftVMQdrewRGytKHPg$=20
> >>>>>
> >>>>> A key difference between that patchset and this patch (besides that
> >>>>> small fact that I used +x instead of +T) was that my patchset allow=
ed
> >>>>> the dyndbg trace to be emitted to the main buffer and did not force=
 them
> >>>>> to be in an instance-specific buffer.     =20
> >>>>
> >>>> Yes, I agree I'd prefer that we print here to the 'main' buffer - it
> >>>> seems to keep things simpler and easier to combine the output from
> >>>> different sources as you mentioned.   =20
> >>>
> >>> Hi,
> >>>
> >>> I'm not quite sure I understand this discussion, but I would like to
> >>> remind you all of what Sean's original work is about:
> >>>
> >>> Userspace configures DRM tracing into a flight recorder buffer (I gue=
ss
> >>> this is what you refer to "instance-specific buffer").
> >>>
> >>> Userspace runs happily for months, and then hits a problem: a failure
> >>> in the DRM sub-system most likely, e.g. an ioctl that should never
> >>> fail, failed. Userspace handles that failure by dumping the flight
> >>> recorder buffer into a file and saving or sending a bug report. The
> >>> flight recorder contents give a log of all relevant DRM in-kernel
> >>> actions leading to the unexpected failure to help developers debug it.
> >>>
> >>> I don't mind if one can additionally send the flight recorder stream =
to
> >>> the main buffer, but I do want the separate flight recorder buffer to
> >>> be an option so that a) unrelated things cannot flood the interesting
> >>> bits out of it, and b) the scope of collected information is relevant.
> >>>
> >>> The very reason for this work is problems that are very difficult to
> >>> reproduce in practice, either because the problem itself is triggered
> >>> very rarely and randomly, or because the end users of the system have
> >>> either no knowledge or no access to reconfigure debug logging and then
> >>> reproduce the problem with good debug logs.
> >>>
> >>> Thank you very much for pushing this work forward!
> >>>
> >>>    =20
> >>
> >> So I think Vincent (earlier in the thread) was saying that he finds it
> >> very helpful have dynamic debug output go to the 'main' trace buffer,
> >> while you seem to be saying you'd prefer it just go to dynamic debug
> >> specific trace buffer. =20
> >=20
> > Seems like we have different use cases: traditional debugging, and
> > in-production flight recorder for problem reporting. I'm not surprised
> > if they need different treatment.
> >  =20
> >> So we certainly can have dynamic output potentially go to both places -
> >> although I think this would mean two tracepoints? But I really wonder
> >> if we really need a separate tracing buffer for dynamic debug when
> >> what goes to the 'main' buffer can be controlled and filtered to avoid
> >> your concern around a 'flood'? =20
> >=20
> > If the DRM tracing goes into the main buffer, then systems in
> > production cannot have any other sub-system traced in a similar
> > fashion. To me it would feel very arrogant to say that to make use of
> > DRM flight recording, you cannot trace much or anything else.
> >=20
> > The very purpose of the flight recorder is run in production all the
> > time, not in a special debugging session.
> >=20
> > There is also the question of access and contents of the trace buffer.
> > Ultimately, if automatic bug reports are enabled in a system, the
> > contents of the trace buffer would be sent as-is to some bug tracking
> > system. If there is a chance to put non-DRM stuff in the trace buffer,
> > that could be a security problem.
> >=20
> > My use case is Weston. When Weston encounters an unexpected problem in
> > production, something should automatically capture the DRM flight
> > recorder contents and save it alongside the Weston log. Would be really
> > nice if Weston itself could do that, but I suspect it is going to need
> > root privileges so it needs some helper daemon.
> >=20
> > Maybe Sean can reiterate their use case more?
> >=20
> >=20
> > Thanks,
> > pq
> >  =20
>=20
> Ok, so in this current thread the proposal was to create a "dyndbg-tracef=
s"
> buffer to put the dynamic debug output (including drm output from dynamic
> debug) into. And I was saying let's just put in the 'main' trace buffer
> (predicated on a dynamic debug specific tracepoint), since there seems
> to be a a use-case for that and it keeps things simpler.
>=20
> But I went back to Sean's original patch, and it creates a drm specific
> trace buffer "drm" (via trace_array_get_by_name("drm")). Here:
> https://patchwork.freedesktop.org/patch/445549/?series=3D78133&rev=3D5
>=20
> So I think that may be some of the confusion here? The current thread/
> proposal is not for a drm specific trace buffer...

Hi Jason,

I may very well have confused things, sorry about that. If this series
is not superseding the idea of the DRM flight recorder, then don't mind
me. It just sounded very similar and I also haven't seen new revisions
of the flight recorder in a long time.

> Having a subsystem specific trace buffer would allow subsystem specific
> trace log permissions depending on the sensitivity of the data. But
> doesn't drm output today go to the system log which is typically world
> readable today?

Yes, and that is exactly the problem. The DRM debug output is so high
traffic it would make the system log both unusable due to cruft and
slow down the whole machine. The debug output is only useful when
something went wrong, and at that point it is too late to enable
debugging. That's why a flight recorder with an over-written circular
in-memory buffer is needed.

The log being world-readable (it's not in every distribution, I
believe) only means on that one machine, but there are hopes of making
some logs truly world-readable by posting them to the internet (bug
reports).

I would be very wary of anything uploading my system logs automatically
with bug reports, both from the reporter point of view (am I exposing
things I don't want to) and from the bug report receiving service point
of view (e.g. GDPR regulations).

> So I could see us supporting subsystem specific trace buffer output
> via dynamic debug here. We could add new dev_debug() variants that
> allow say a trace buffer to be supplied. So in that way subsystems
> could 'opt-out' of having their data put into the global trace buffer.
> And perhaps some subsystems we would want to allow output to both
> buffers? The subsystem specific one and the global one?

Unfortunately the rest of the discussion goes too high over my head.


Thanks,
pq

--Sig_/UCDrJjDv+I30GhRn07Cyyaq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGbXJAACgkQI1/ltBGq
qqeD+A//foKJpPUY2CTrulmVAeS0zjdQkwqXJFJhHt6U0Aa10ntIpbtQVXEwehfM
KsKCahI0D5hYm0V2SD0ALAS9/1xQOLL8+Zo6uMFFf976FqWjOfHYpl/y/yXTPrec
MS0ynHNuc5caRE20soRlLx6JQYHv3z5EiuYXC0cIvydYzKt4KRhl2BL1gFXMZyjf
93NmEH36aP5c8ekZ3ibJsV8kIYaig5WtnbUFwv0EIu1YM2R4t3xi7ObM+lZ2/XwU
J+wuYH5fgE1DvOn+5Ix2fR1ceP7f3au967unVWKxcP23ZqBC2H8/FMI/wtqqzfov
0KMjPkzOerlUR3YSPcEfy5PSPEtd5691TN6PoGqTfsWTEVpr699j1JdPmKaxxdU0
S+oHfja+Md+CVrw2gNaJny96aUZ+EvGf3CVlyqQKu8XVfbCu0DistdVP01g9rQBi
5L4PZwmP4x6oNFGHQoGXSvu1CgMTQ3bfyL0/jVZVanltCCJ/PslYVdaJt2ipY2jo
aMXnwgZcGa6aESdgIcpNzAy4QpFZPhOqRdAi0I87MhY6bBAzMnSBqZabJ513WEat
a8yyHgbIECSK6jA4NPNvCEU/iVHL6nvhfuiscKkwESAsvBp8ifMPbS/Z6VqYZ7SF
29ZzWPtR8v5y1exxGtDY4EGb/xkoID73cLLTZCWWz9ZvVJCixWw=
=UMyr
-----END PGP SIGNATURE-----

--Sig_/UCDrJjDv+I30GhRn07Cyyaq--
