Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4ECC455F56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 16:24:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbhKRP11 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 10:27:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbhKRP11 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 10:27:27 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3C8C061574;
        Thu, 18 Nov 2021 07:24:26 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id z34so27855451lfu.8;
        Thu, 18 Nov 2021 07:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=pzh5IjYgObINcry+O6M/Q2PxAiMvzwxpKCnEyr3LdYc=;
        b=hPfOZHsEzDKILKAGYid8ZwEPGyv19A0EBcNfCJEnLDVIskvG2UlxJeVSQ6fEVzBdhb
         zpv1uxJGDM8ONvhmUAsmOiS0OtvrvC8sXUMZw9FxjMxUk1mxkQaHSz5zOY2uMzR6tl5n
         n+SaUDZgFRYLx3rMcyx4GIorZ+iEoSO2PavQuVDoQTWxDSZKmf9Aq8IHZd/7DDnQfrrO
         NLxvjbEl9AGHnZ2Ig6N8aE4xZUmeA5IPuJ1Zr/OAvAS5tvfBho/Ol0FA1oFYW0oGxYIC
         GBcVyHig8HX4MPHq3pcbuCW34F1pOQyT3N0ZPmDy+5HBI/d4J+TBYK0z7s6HBvdc5/i2
         KIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=pzh5IjYgObINcry+O6M/Q2PxAiMvzwxpKCnEyr3LdYc=;
        b=YgeAxvO1c81jVU9Pg70mzjtonVbPO8qED5WRLI3bn7VNtpxZYjrEigBVjHpHvlP1a4
         J1YxRi6RtiXFDZqFWdTjAHNHMEpphsKoM+IwpoL+F9h71F7dNBcPQeoC/zsIVOO8Ea0c
         GvcDvK5HqySwtXEna5qtRRjJnyXKdAOXa8goE9AI9QQFtC1X7E57fKa2eEvZLR+JVBPB
         08g+PlHAe7mrph/4AFUFrrBrCdYzghlYiclSE0EDyyUVo67VgPv2sErwhpp9qs1JWjn2
         FyLgRXI+fFAIDzEzjFb7g00izEZH1J3ULuQlgJUSL+LBsSoz+KIVIZ2QKBmCBxe3+Tc9
         t3OQ==
X-Gm-Message-State: AOAM532FCQhglQeUugRizChipJxsK5dEYOk7sImIC4hYWVF7BscOuG6Q
        uoeO4glWAQ2uky60l7gOcMA=
X-Google-Smtp-Source: ABdhPJy3/sQIR0aJ/r5EpvjSkCxDlGZfuWEHw/qFNXw1+fpF6mIUzQZYEYTiXhGXji0/pC4ViQ99Cw==
X-Received: by 2002:a2e:a175:: with SMTP id u21mr18195173ljl.284.1637249065180;
        Thu, 18 Nov 2021 07:24:25 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id r25sm19436lfi.166.2021.11.18.07.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 07:24:24 -0800 (PST)
Date:   Thu, 18 Nov 2021 17:24:01 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Jason Baron <jbaron@akamai.com>, seanpaul@chromium.org,
        sean@poorly.run
Cc:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
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
Message-ID: <20211118172401.0b4d722e@eldfell>
In-Reply-To: <f87b7076-47e6-89b1-aaf9-b67aa6713e01@akamai.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
        <20211111220206.121610-9-jim.cromie@gmail.com>
        <20211112114953.GA1381@axis.com>
        <f3914fa9-8b22-d54e-3f77-d998e74094b9@akamai.com>
        <20211116104631.195cbd0b@eldfell>
        <f87b7076-47e6-89b1-aaf9-b67aa6713e01@akamai.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L=/5XSamIvBp+./DRBXXIxC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--Sig_/L=/5XSamIvBp+./DRBXXIxC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 18 Nov 2021 09:29:27 -0500
Jason Baron <jbaron@akamai.com> wrote:

> On 11/16/21 3:46 AM, Pekka Paalanen wrote:
> > On Fri, 12 Nov 2021 10:08:41 -0500
> > Jason Baron <jbaron@akamai.com> wrote:
> >  =20
> >> On 11/12/21 6:49 AM, Vincent Whitchurch wrote: =20
> >>> On Thu, Nov 11, 2021 at 03:02:04PM -0700, Jim Cromie wrote:   =20
> >>>> Sean Paul proposed, in:
> >>>> https://urldefense.com/v3/__https://patchwork.freedesktop.org/series=
/78133/__;!!GjvTz_vk!HcKnMRByYkIdyF1apqQjlN5aBIomzJR1an3YWXM6KXs0EftVMQdrew=
RA8Dki4A$=20
> >>>> drm/trace: Mirror DRM debug logs to tracefs
> >>>>
> >>>> His patchset's objective is to be able to independently steer some of
> >>>> the drm.debug stream to an alternate tracing destination, by splitti=
ng
> >>>> drm_debug_enabled() into syslog & trace flavors, and enabling them
> >>>> separately.  2 advantages were identified:
> >>>>
> >>>> 1- syslog is heavyweight, tracefs is much lighter
> >>>> 2- separate selection of enabled categories means less traffic
> >>>>
> >>>> Dynamic-Debug can do 2nd exceedingly well:
> >>>>
> >>>> A- all work is behind jump-label's NOOP, zero off cost.
> >>>> B- exact site selectivity, precisely the useful traffic.
> >>>>    can tailor enabled set interactively, at shell.
> >>>>
> >>>> Since the tracefs interface is effective for drm (the threads suggest
> >>>> so), adding that interface to dynamic-debug has real potential for
> >>>> everyone including drm.
> >>>>
> >>>> if CONFIG_TRACING:
> >>>>
> >>>> Grab Sean's trace_init/cleanup code, use it to provide tracefs
> >>>> available by default to all pr_debugs.  This will likely need some
> >>>> further per-module treatment; perhaps something reflecting hierarchy
> >>>> of module,file,function,line, maybe with a tuned flattening.
> >>>>
> >>>> endif CONFIG_TRACING
> >>>>
> >>>> Add a new +T flag to enable tracing, independent of +p, and add and
> >>>> use 3 macros: dyndbg_site_is_enabled/logging/tracing(), to encapsula=
te
> >>>> the flag checks.  Existing code treats T like other flags.   =20
> >>>
> >>> I posted a patchset a while ago to do something very similar, but that
> >>> got stalled for some reason and I unfortunately didn't follow it up:
> >>>
> >>>  https://urldefense.com/v3/__https://lore.kernel.org/lkml/20200825153=
338.17061-1-vincent.whitchurch@axis.com/__;!!GjvTz_vk!HcKnMRByYkIdyF1apqQjl=
N5aBIomzJR1an3YWXM6KXs0EftVMQdrewRGytKHPg$=20
> >>>
> >>> A key difference between that patchset and this patch (besides that
> >>> small fact that I used +x instead of +T) was that my patchset allowed
> >>> the dyndbg trace to be emitted to the main buffer and did not force t=
hem
> >>> to be in an instance-specific buffer.   =20
> >>
> >> Yes, I agree I'd prefer that we print here to the 'main' buffer - it
> >> seems to keep things simpler and easier to combine the output from
> >> different sources as you mentioned. =20
> >=20
> > Hi,
> >=20
> > I'm not quite sure I understand this discussion, but I would like to
> > remind you all of what Sean's original work is about:
> >=20
> > Userspace configures DRM tracing into a flight recorder buffer (I guess
> > this is what you refer to "instance-specific buffer").
> >=20
> > Userspace runs happily for months, and then hits a problem: a failure
> > in the DRM sub-system most likely, e.g. an ioctl that should never
> > fail, failed. Userspace handles that failure by dumping the flight
> > recorder buffer into a file and saving or sending a bug report. The
> > flight recorder contents give a log of all relevant DRM in-kernel
> > actions leading to the unexpected failure to help developers debug it.
> >=20
> > I don't mind if one can additionally send the flight recorder stream to
> > the main buffer, but I do want the separate flight recorder buffer to
> > be an option so that a) unrelated things cannot flood the interesting
> > bits out of it, and b) the scope of collected information is relevant.
> >=20
> > The very reason for this work is problems that are very difficult to
> > reproduce in practice, either because the problem itself is triggered
> > very rarely and randomly, or because the end users of the system have
> > either no knowledge or no access to reconfigure debug logging and then
> > reproduce the problem with good debug logs.
> >=20
> > Thank you very much for pushing this work forward!
> >=20
> >  =20
>=20
> So I think Vincent (earlier in the thread) was saying that he finds it
> very helpful have dynamic debug output go to the 'main' trace buffer,
> while you seem to be saying you'd prefer it just go to dynamic debug
> specific trace buffer.

Seems like we have different use cases: traditional debugging, and
in-production flight recorder for problem reporting. I'm not surprised
if they need different treatment.

> So we certainly can have dynamic output potentially go to both places -
> although I think this would mean two tracepoints? But I really wonder
> if we really need a separate tracing buffer for dynamic debug when
> what goes to the 'main' buffer can be controlled and filtered to avoid
> your concern around a 'flood'?

If the DRM tracing goes into the main buffer, then systems in
production cannot have any other sub-system traced in a similar
fashion. To me it would feel very arrogant to say that to make use of
DRM flight recording, you cannot trace much or anything else.

The very purpose of the flight recorder is run in production all the
time, not in a special debugging session.

There is also the question of access and contents of the trace buffer.
Ultimately, if automatic bug reports are enabled in a system, the
contents of the trace buffer would be sent as-is to some bug tracking
system. If there is a chance to put non-DRM stuff in the trace buffer,
that could be a security problem.

My use case is Weston. When Weston encounters an unexpected problem in
production, something should automatically capture the DRM flight
recorder contents and save it alongside the Weston log. Would be really
nice if Weston itself could do that, but I suspect it is going to need
root privileges so it needs some helper daemon.

Maybe Sean can reiterate their use case more?


Thanks,
pq

--Sig_/L=/5XSamIvBp+./DRBXXIxC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGWcBEACgkQI1/ltBGq
qqf+VQ/+JdvSTGIK4+CE0NH/WkM6qbXZB4OOq1Q8yJ6Y0Q9aISykp6UuoACj1mJO
9Hj/8/LNHrwLuGfFQOb0vv9gTGigXEJonlDp2m6KTn8jID1Oac5d5EHS+KQZuFBz
FYq9X949ow/bTPKv9au/a2TTNKva5KHr9STx7RfAbRByrtsnSXbEOGqQlYKPrYT8
/ywuIhrPzmZ05PO4zSPDpoBib3yuDq4YnSOVeU62OJATtE5KLD3besw9xFyO5r1s
bTXel7JvebhUKqCEeNJ2QScB+K3CQVnvfs47HYBZcKQrDVZgDmKWFuYhTEvLZ6vt
Z+gogMZklPkJe2fAeFofMrhrwCDyDB/3xGouICrZsqKFRJt5OgvEbI4cbpmzJuVJ
jScbGMUe13L/ROLIkkd4qRvCyZ/gVYSfbv7zGg2cQdHM2vrbHcVC/E2N45pyy8GI
34rfBdRM9IMi1kuHgWSvMHkhuumzUwRQ1dMNIF3WcExAu59jdMPkid3Zr0DHdqS6
oKUAForHYShHu4HlOiObbH9ro8ZICfYiwVuXMOjCQTyz0DudqrnVPPFC1Su+dIlm
tfo4ZybVTMgMcQkIbke0HeUky5s39jF3KqmJ539CCc9VS2hv9n0k6pczQ8kzk27V
y2vqoqzo5FWYuW5/PlO8Rei3pMjPjkk8dsqTkRd0lh7wPKnMEiI=
=6BEY
-----END PGP SIGNATURE-----

--Sig_/L=/5XSamIvBp+./DRBXXIxC--
