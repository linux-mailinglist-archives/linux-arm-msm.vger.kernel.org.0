Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8667139CC8F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jun 2021 05:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhFFDqP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Jun 2021 23:46:15 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:45826 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbhFFDqO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Jun 2021 23:46:14 -0400
Received: by mail-oi1-f181.google.com with SMTP id w127so14321312oig.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jun 2021 20:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NeFD/X/bZOxXpTRfRudMJyF7Fp7mjQ5t9npIatv+GWw=;
        b=h9FOpfPPswviZblqwRovErB5uSjagSMz/VMPp6ZmdE5TFmaXPe/oLhQH4NSGmWFpRe
         nE4j/rgDtjgkm8CeANZ/w22G4VOveRE5GcrHRKX1EQYcYEo/MXkR2lHaiiSjbUvX2YJ/
         abU4CSpVqCEklGjUDBOnZcBG/JNs0VTJX/IgKSMuv6NTBNDz5MqxZgO2GoucnY/a1AnT
         Cx7O9Lfnxz3ro994dXeWK3D9p45HUNbY70cx/wE+zphui9JaZUQP74znulh79GxzqccP
         Yx0btF/44o7fcqtqAtBMfF4RzgJjuYQrDaHy07p4YsuPQ4kzOpcqx55LrV625JYW0BFV
         uo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NeFD/X/bZOxXpTRfRudMJyF7Fp7mjQ5t9npIatv+GWw=;
        b=ZiFknbafuxKA9uFEZkuHMTuzwTGMTkbC91mZGNRw5qhKIaNX7kzjp9Kh/gDRQFlysM
         nJBBNrniJBhHNvfjPBiwJe+dqy/mZSeJId70lLiwqCtj0PsvVgUbGUvAmbne5XhNc0wI
         5kTDYzjuWJKIkTQbpCiRP6b+0s8FstvZXekMcz7KkuLh+XH32uLkGoVZ6vOOfgUXkQ3s
         1eJfug3Qc8JlAyq3g/OlUfjZjI/rcVAJW9E7WgU0oV2isKqi0WDowXp7udIwfIDcNmZ5
         ifzbQc14kiygO5bLAXlbafehmSNT8NerFNuI2EAlSY3A2qHE9g8wd/BruLWiK5g+Yr7E
         b51A==
X-Gm-Message-State: AOAM531s3VryWkWq6OfanRqxKMwjcM23h89iegOaGTmY0Goz/kedjRU3
        jWOhtQW4qbICsQVZahr4zKFCPw==
X-Google-Smtp-Source: ABdhPJyuWcnHt2IlLLaaW4PeU/4t+iP/z2uKL/taoQ4wCW2IlUseNhGAropDtu64zdIZwg4JVrn1HA==
X-Received: by 2002:a54:4504:: with SMTP id l4mr9344859oil.152.1622950976611;
        Sat, 05 Jun 2021 20:42:56 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q1sm1432231oog.46.2021.06.05.20.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 20:42:56 -0700 (PDT)
Date:   Sat, 5 Jun 2021 22:42:54 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>, evgreen@chromium.org,
        mka@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, linux@roeck-us.net, rnayak@codeaurora.org,
        lsrao@codeaurora.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 3/5] arm64: dts: qcom: sc7180: Enable SoC sleep stats
Message-ID: <YLxEPkQdKKYNDHqv@builder.lan>
References: <1621596371-26482-1-git-send-email-mkshah@codeaurora.org>
 <1621596371-26482-4-git-send-email-mkshah@codeaurora.org>
 <CAE-0n53ySKwDwzRYFYjnQnqVAujVrkik2U-PeCuS61xQU-hbWA@mail.gmail.com>
 <YLUjbwFSJOSWS0IV@builder.lan>
 <CAE-0n53hdd1tEmYwTL0CNi=S6CUxRhWnkJz-KoTj2UnedNKXmg@mail.gmail.com>
 <YLhCGC/qgP6ESNl7@yoga>
 <CAE-0n511_GHcyPDSeDaf5QSqVQqyHOqxJCGaSWNr=x9uotegLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n511_GHcyPDSeDaf5QSqVQqyHOqxJCGaSWNr=x9uotegLg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 04 Jun 16:53 CDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-06-02 19:44:40)
> > On Wed 02 Jun 19:26 CDT 2021, Stephen Boyd wrote:
> >
> > > Quoting Bjorn Andersson (2021-05-31 10:57:03)
> > > > On Wed 26 May 18:30 CDT 2021, Stephen Boyd wrote:
> > > >
> > > > > Quoting Maulik Shah (2021-05-21 04:26:09)
> > > > > > @@ -3223,6 +3223,11 @@
> > > > > >                         #power-domain-cells = <1>;
> > > > > >                 };
> > > > > >
> > > > > > +               rpmh-sleep-stats@c3f0000 {
> > > > > > +                       compatible = "qcom,rpmh-sleep-stats";
> > > > > > +                       reg = <0 0x0c3f0000 0 0x400>;
> > > > > > +               };
> > > > > > +
> > > > >
> > > > > Does this need to be in DT? Can the sc7180-aoss-qmp driver use the
> > > > > aux-bus and stick the sleep stats device on there?
> > > > >
> > > >
> > > > The AOSS memory space has N chunks of "message ram", one is used for the
> > > > QMP protocol (presumably the APSS specific one), a different one is used
> > > > for the sleep stats.
> > > >
> > > > I presume we could have come up with a binding for the entire AOSS/AOP
> > > > and then describe (either implicit or explicitly) the QMP and
> > > > debug-stats under that.
> > > >
> > > > But we'd also have to come up with the same container-device for the RPM
> > > > case.
> > >
> > > Because the rpm node doesn't include this region of memory today? I
> > > still fail to see why we're changing the existing binding and adding a
> > > DT node for this new region that is basically a debug feature.
> >
> > We're not changing the binding, the memory region for the "AOSS QMP"
> > thing was never larger than 0x400.
> >
> > 0x100000 is the size of all the AOSS "msg_ram" regions. We don't have
> > this whole thing described in a binding and we don't have an
> > implementation for the whole thing.
> >
> > If we're going for that we'd need to extend the binding to indicate
> > which of the msg_ram regions are used for APSS QMP and for debug stats
> > on particular platform (either by compatible, explicit properties or as
> > some subnodes).
> 
> Fair enough. At the least, can we change the name of the node then to
> 'sram' or 'ram'? The 'rpmh-sleep-stats' node name is nonsense.
> 

Yes, "ram" sounds like a better node name for both the qmp and
sleep-stats region - in the RPMH case.

> >
> >
> > That said, as I looked into my other objection, for the RPM
> > (non-hardened) case it seems that we're actually describing the RPM
> > region. So there it would make sense to describe it as such in DT - but
> > we don't have any other code (that I'm aware of) that would implement
> > the "qcom,<platform>-rpm".
> >
> 
> I only half parsed this part. Are you saying that because we don't have
> a driver for qcom,<platform>-rpm we shouldn't keep it all within the rpm
> node?

What I was trying to say is that in the RPM (non-H) case the described
memory region is not a chunk of "ram" (or "sram"), but seems to rather
be the RPM region. So there it seems more reasonable to have a non-debug
compatible, but I don't think we have any other use for it than the
debug-stats...

Regards,
Bjorn
