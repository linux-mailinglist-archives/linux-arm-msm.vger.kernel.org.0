Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C373459E7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 09:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235052AbhKWIsn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 03:48:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbhKWIsm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 03:48:42 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53CBC061574;
        Tue, 23 Nov 2021 00:45:34 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id l9so4337572ljq.5;
        Tue, 23 Nov 2021 00:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=pFkWXRQLp2a0JXFEH49pnNMiPhMmJWIqjtYLx7Q5kGA=;
        b=dF4UyjpdB+iP41WpCUCrsF3UGY/KQCvb3oZrc7Ej7HMg1GoRifBwlslRRA42Rq43xN
         BQ7jyu72TpWea0lQr33qusYVAPohx4QE1TDof8nmwfct3eXmGB0Es+vUDvhYfGP+g84h
         dFK979uDCDfgw7TwB63X85BKdulXxCQzDvqC3IYhbDxBlxr7r6DBw1zCKL74ititeTup
         BJO1VelsnMhfnz1AJWOX3mmBiUa9g/ktHEc5UDxXn8d9A1o5XvxhewFV7DlTpF7gtXPs
         O0kyVD7Uja7fIhZIdHMIBsmIt5FvBpqM7w+Rei1i+CYI5HNN8ReGujAScZBdW9S3z67z
         bz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=pFkWXRQLp2a0JXFEH49pnNMiPhMmJWIqjtYLx7Q5kGA=;
        b=BznYfUJFfqi2GkQdXYVd0/m7aDIYHuwhOqWkZkXWWJqVQyKx+adh7Zt1zbTd08FKWl
         /qEDQV9wvJMU4x84NlrNmDugB/x4gOb5Vw0cYsJ6LDrgC4WKIRuyACRBVdNIMX8LwnBt
         QXU9SR6zGHBBsCS4xGDJYvMCKhIZ3rVoKC9de3vOHw0tiwWP/1IAyoAumbTIC3zn8RSg
         AcgSG7AtXQDw1XHzcrbXILqnCvZ4QjjaimE7KTGVZOtRXfPGjtOHXToxqr8hG17i1MKj
         w8Nm2SknvsjEOSpwmMyyi1/00/wZvnAwFiQfgimj27uKofeDovY4+yjk8xAB09Knym6r
         x9BA==
X-Gm-Message-State: AOAM533Th1a1lGF4y9y79IxWk/++1CDJopYqh5uoadD8z1g/UfZefaHa
        2aWirGu4roJ0A4x2AFU1oDk=
X-Google-Smtp-Source: ABdhPJyEOqSJ0LhmELDrpw4I2/N1YyxLqNhCZOrEjPb43q6Cz1GF37urc88ZaxhIEJYQonG3pltBnQ==
X-Received: by 2002:a2e:6e0b:: with SMTP id j11mr3273521ljc.80.1637657132900;
        Tue, 23 Nov 2021 00:45:32 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id o20sm1080045lfc.276.2021.11.23.00.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 00:45:32 -0800 (PST)
Date:   Tue, 23 Nov 2021 10:45:22 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     jim.cromie@gmail.com
Cc:     Jason Baron <jbaron@akamai.com>, Sean Paul <seanpaul@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        quic_saipraka@quicinc.com,
        Catalin Marinas <catalin.marinas@arm.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Will Deacon <will@kernel.org>, maz@kernel.org,
        amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
        Ingo Molnar <mingo@redhat.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        intel-gvt-dev@lists.freedesktop.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>, quic_psodagud@quicinc.com,
        mathieu.desnoyers@efficios.com
Subject: Re: [PATCH v10 08/10] dyndbg: add print-to-tracefs, selftest with
 it - RFC
Message-ID: <20211123104522.7a336773@eldfell>
In-Reply-To: <CAJfuBxyFzA++2JUxLY-6yLqmrETbmsWpTiyJH5w1qKiAkMriNw@mail.gmail.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
        <20211111220206.121610-9-jim.cromie@gmail.com>
        <20211112114953.GA1381@axis.com>
        <f3914fa9-8b22-d54e-3f77-d998e74094b9@akamai.com>
        <20211116104631.195cbd0b@eldfell>
        <f87b7076-47e6-89b1-aaf9-b67aa6713e01@akamai.com>
        <20211118172401.0b4d722e@eldfell>
        <41ea83b2-a707-cb6f-521e-070bb12502de@akamai.com>
        <20211122110208.528e1d80@eldfell>
        <CAJfuBxyFzA++2JUxLY-6yLqmrETbmsWpTiyJH5w1qKiAkMriNw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SxG3EvWI4147tD=7h0CnB9L";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--Sig_/SxG3EvWI4147tD=7h0CnB9L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 22 Nov 2021 15:42:38 -0700
jim.cromie@gmail.com wrote:

> On Mon, Nov 22, 2021 at 2:02 AM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> >
> > On Fri, 19 Nov 2021 11:21:36 -0500
> > Jason Baron <jbaron@akamai.com> wrote:
> > =20
> > > On 11/18/21 10:24 AM, Pekka Paalanen wrote: =20
> > > > On Thu, 18 Nov 2021 09:29:27 -0500
> > > > Jason Baron <jbaron@akamai.com> wrote:
> > > > =20
> > > >> On 11/16/21 3:46 AM, Pekka Paalanen wrote: =20
> > > >>> On Fri, 12 Nov 2021 10:08:41 -0500
> > > >>> Jason Baron <jbaron@akamai.com> wrote:
> > > >>> =20
> > > >>>> On 11/12/21 6:49 AM, Vincent Whitchurch wrote: =20
> > > >>>>> On Thu, Nov 11, 2021 at 03:02:04PM -0700, Jim Cromie wrote: =20
> > > >>>>>> Sean Paul proposed, in:
> > > >>>>>> https://urldefense.com/v3/__https://patchwork.freedesktop.org/=
series/78133/__;!!GjvTz_vk!HcKnMRByYkIdyF1apqQjlN5aBIomzJR1an3YWXM6KXs0EftV=
MQdrewRA8Dki4A$
> > > >>>>>> drm/trace: Mirror DRM debug logs to tracefs
> > > >>>>>>
> > > >>>>>> His patchset's objective is to be able to independently steer =
some of
> > > >>>>>> the drm.debug stream to an alternate tracing destination, by s=
plitting
> > > >>>>>> drm_debug_enabled() into syslog & trace flavors, and enabling =
them
> > > >>>>>> separately.  2 advantages were identified:
> > > >>>>>>
> > > >>>>>> 1- syslog is heavyweight, tracefs is much lighter
> > > >>>>>> 2- separate selection of enabled categories means less traffic
> > > >>>>>>
> > > >>>>>> Dynamic-Debug can do 2nd exceedingly well:
> > > >>>>>>
> > > >>>>>> A- all work is behind jump-label's NOOP, zero off cost.
> > > >>>>>> B- exact site selectivity, precisely the useful traffic.
> > > >>>>>>    can tailor enabled set interactively, at shell.
> > > >>>>>>
> > > >>>>>> Since the tracefs interface is effective for drm (the threads =
suggest
> > > >>>>>> so), adding that interface to dynamic-debug has real potential=
 for
> > > >>>>>> everyone including drm.
> > > >>>>>>
> > > >>>>>> if CONFIG_TRACING:
> > > >>>>>>
> > > >>>>>> Grab Sean's trace_init/cleanup code, use it to provide tracefs
> > > >>>>>> available by default to all pr_debugs.  This will likely need =
some
> > > >>>>>> further per-module treatment; perhaps something reflecting hie=
rarchy
> > > >>>>>> of module,file,function,line, maybe with a tuned flattening.
> > > >>>>>>
> > > >>>>>> endif CONFIG_TRACING
> > > >>>>>>
> > > >>>>>> Add a new +T flag to enable tracing, independent of +p, and ad=
d and
> > > >>>>>> use 3 macros: dyndbg_site_is_enabled/logging/tracing(), to enc=
apsulate
> > > >>>>>> the flag checks.  Existing code treats T like other flags. =20
> > > >>>>>
> > > >>>>> I posted a patchset a while ago to do something very similar, b=
ut that
> > > >>>>> got stalled for some reason and I unfortunately didn't follow i=
t up:
> > > >>>>>
> > > >>>>>  https://urldefense.com/v3/__https://lore.kernel.org/lkml/20200=
825153338.17061-1-vincent.whitchurch@axis.com/__;!!GjvTz_vk!HcKnMRByYkIdyF1=
apqQjlN5aBIomzJR1an3YWXM6KXs0EftVMQdrewRGytKHPg$
> > > >>>>>
> > > >>>>> A key difference between that patchset and this patch (besides =
that
> > > >>>>> small fact that I used +x instead of +T) was that my patchset a=
llowed
> > > >>>>> the dyndbg trace to be emitted to the main buffer and did not f=
orce them
> > > >>>>> to be in an instance-specific buffer. =20
> > > >>>>
> > > >>>> Yes, I agree I'd prefer that we print here to the 'main' buffer =
- it
> > > >>>> seems to keep things simpler and easier to combine the output fr=
om
> > > >>>> different sources as you mentioned. =20
> > > >>>
> > > >>> Hi,
> > > >>>
> > > >>> I'm not quite sure I understand this discussion, but I would like=
 to
> > > >>> remind you all of what Sean's original work is about:
> > > >>>
> > > >>> Userspace configures DRM tracing into a flight recorder buffer (I=
 guess
> > > >>> this is what you refer to "instance-specific buffer").
> > > >>>
> > > >>> Userspace runs happily for months, and then hits a problem: a fai=
lure
> > > >>> in the DRM sub-system most likely, e.g. an ioctl that should never
> > > >>> fail, failed. Userspace handles that failure by dumping the flight
> > > >>> recorder buffer into a file and saving or sending a bug report. T=
he
> > > >>> flight recorder contents give a log of all relevant DRM in-kernel
> > > >>> actions leading to the unexpected failure to help developers debu=
g it.
> > > >>>
> > > >>> I don't mind if one can additionally send the flight recorder str=
eam to
> > > >>> the main buffer, but I do want the separate flight recorder buffe=
r to
> > > >>> be an option so that a) unrelated things cannot flood the interes=
ting
> > > >>> bits out of it, and b) the scope of collected information is rele=
vant.
> > > >>>
> > > >>> The very reason for this work is problems that are very difficult=
 to
> > > >>> reproduce in practice, either because the problem itself is trigg=
ered
> > > >>> very rarely and randomly, or because the end users of the system =
have
> > > >>> either no knowledge or no access to reconfigure debug logging and=
 then
> > > >>> reproduce the problem with good debug logs.
> > > >>>
> > > >>> Thank you very much for pushing this work forward!
> > > >>>
> > > >>> =20
> > > >>
> > > >> So I think Vincent (earlier in the thread) was saying that he find=
s it
> > > >> very helpful have dynamic debug output go to the 'main' trace buff=
er,
> > > >> while you seem to be saying you'd prefer it just go to dynamic deb=
ug
> > > >> specific trace buffer. =20
> > > >
> > > > Seems like we have different use cases: traditional debugging, and
> > > > in-production flight recorder for problem reporting. I'm not surpri=
sed
> > > > if they need different treatment.
> > > > =20
> > > >> So we certainly can have dynamic output potentially go to both pla=
ces -
> > > >> although I think this would mean two tracepoints? But I really won=
der
> > > >> if we really need a separate tracing buffer for dynamic debug when
> > > >> what goes to the 'main' buffer can be controlled and filtered to a=
void
> > > >> your concern around a 'flood'? =20
> > > >
> > > > If the DRM tracing goes into the main buffer, then systems in
> > > > production cannot have any other sub-system traced in a similar
> > > > fashion. To me it would feel very arrogant to say that to make use =
of
> > > > DRM flight recording, you cannot trace much or anything else.
> > > >
> > > > The very purpose of the flight recorder is run in production all the
> > > > time, not in a special debugging session.
> > > >
> > > > There is also the question of access and contents of the trace buff=
er.
> > > > Ultimately, if automatic bug reports are enabled in a system, the
> > > > contents of the trace buffer would be sent as-is to some bug tracki=
ng
> > > > system. If there is a chance to put non-DRM stuff in the trace buff=
er,
> > > > that could be a security problem.
> > > >
> > > > My use case is Weston. When Weston encounters an unexpected problem=
 in
> > > > production, something should automatically capture the DRM flight
> > > > recorder contents and save it alongside the Weston log. Would be re=
ally
> > > > nice if Weston itself could do that, but I suspect it is going to n=
eed
> > > > root privileges so it needs some helper daemon.
> > > >
> > > > Maybe Sean can reiterate their use case more?
> > > >
> > > >
> > > > Thanks,
> > > > pq
> > > > =20
> > >
> > > Ok, so in this current thread the proposal was to create a "dyndbg-tr=
acefs"
> > > buffer to put the dynamic debug output (including drm output from dyn=
amic
> > > debug) into. And I was saying let's just put in the 'main' trace buff=
er
> > > (predicated on a dynamic debug specific tracepoint), since there seems
> > > to be a a use-case for that and it keeps things simpler.
> > >
> > > But I went back to Sean's original patch, and it creates a drm specif=
ic
> > > trace buffer "drm" (via trace_array_get_by_name("drm")). Here:
> > > https://patchwork.freedesktop.org/patch/445549/?series=3D78133&rev=3D5
> > >
> > > So I think that may be some of the confusion here? The current thread/
> > > proposal is not for a drm specific trace buffer... =20
> >
> > Hi Jason,
> >
> > I may very well have confused things, sorry about that. If this series
> > is not superseding the idea of the DRM flight recorder, then don't mind
> > me. It just sounded very similar and I also haven't seen new revisions
> > of the flight recorder in a long time. =20
>=20
> IMO this series has clarified the requirement for a flight-recorder mode,
> which seems to fit ideally in a separate instance.
>=20
> > > Having a subsystem specific trace buffer would allow subsystem specif=
ic
> > > trace log permissions depending on the sensitivity of the data. But
> > > doesn't drm output today go to the system log which is typically world
> > > readable today? =20
> >
> > Yes, and that is exactly the problem. The DRM debug output is so high
> > traffic it would make the system log both unusable due to cruft and
> > slow down the whole machine. The debug output is only useful when
> > something went wrong, and at that point it is too late to enable
> > debugging. That's why a flight recorder with an over-written circular
> > in-memory buffer is needed. =20
>=20
> Seans patch reuses enum drm_debug_category to split the tracing
> stream into 10 sub-streams
> - how much traffic from each ?
> - are some sub-streams more valuable for post-mortem ?
> - any value from further refinement of categories ?
> - drop irrelevant callsites individually to reduce clutter, extend
> buffer time/space ?

I think it's hard to predict which sub-streams you are going to need
before you have a bug to debug. Hence I would err on the side of
enabling too much. This also means that better or more refined
categorisation might not be that much of help - or if it is, then are
the excluded debug messages worth having in the kernel to begin with.
Well, we're probably not that interested in GPU debugs but just
everything related to the KMS side, which on the existing categories
is... everything except half of CORE and DRIVER, maybe? Not sure.

Maybe Sean has a better idea.

My feeling is that that could mean in the order of hundreds of log
events at framerate (e.g. 60 times per second) per each enabled output
individually. And per DRM device, of course. This is with the
uninteresting GPU debugs already excluded.

Still, I don't think the flight recorder buffer would need to be
massive. I suspect it would be enough to hold a few frames' worth which
is just a split second under active operation. When something happens,
the userspace stack is likely going to stop on its tracks immediately
to collect the debug information, which means the flooding should pause
and the relevant messages don't get overwritten before we get them. In
a multi-seat system where each device is controlled by a separate
display server instance, per-device logs would help with this. OTOH,
multi-seat is not a very common use case I suppose.


Thanks,
pq

--Sig_/SxG3EvWI4147tD=7h0CnB9L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGcqiIACgkQI1/ltBGq
qqez3RAAkXUMG4UuD6XSePo0AVaVuwMwx+7cQa9DRYYvNf4WRXNCc/JSJb0DTHlj
rQw52jZo8zPsCIFKJOUgr1PundY7y/FKu3TVQiObz11oiy8lS94RPa0FmLaX8Hr9
zf2YXqQmY31vvOLPj9zzmzfCUMcT9AFZUtydqXpxhx7qF/Z/+39fJ0a6JMpT6nLP
FEZwlIYFs43DdEnb0X2+uoLU34fgw4FXO9NOK94fP1tfWfWwAJsVpuKcnfDj56aG
CIcTv24D8ew0lChcchyWfMf88L7f+tiZqirTL8KxmDdzdWEZY1GzNfQGg7346wo7
2FwtD5PqY+WtvimUB8uQeI04q651SXPqPqYk7g95GZkRy62kwa4x0U5wCPLr9apj
TWcZsoGFoIqJ4Hv/dV0c/9CxOGS+eOthYalvgKgHo1mBuIj1aYk1oSfwedZoqyCr
ZTFzKh6CjrqInz5OsR5P7wldWX6R/JvetZTK0eacsUrQaYwAB2UWUCvd7L/tdodK
ReJ3OY7Fs5ATgs7CEK78sEx5edWY4fCxmxapw4XzMLvX97vFMrGwkMpOa6VSc1VX
1D8K4ydltSmzUDKzaWe6JnzRY0dJadrhLPRkuyVLQTACu7EpmIoEz6jOf7jfoiyM
fecd46WNdBI5+J49C4Ld7h59Qo4OMcsoOmen/xMWDAcsNRRcEhA=
=xgJy
-----END PGP SIGNATURE-----

--Sig_/SxG3EvWI4147tD=7h0CnB9L--
