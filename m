Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFDA823E60E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 04:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbgHGCtM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 22:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726629AbgHGCtL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 22:49:11 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42412C061575
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2020 19:49:11 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id o21so617292oie.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2020 19:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bgStZXmBcIhXcAGtUDT4PdZzWJDdtOc6W3ug+5/Il+s=;
        b=YfOtg6mk5yitut4lFjH8xJq//kVJ08wI2px79vMHBxQBD6HZ59iTrHtRlxltHpzKPX
         unAKGJn8ks6DLXP3QgrdEpM0CAf8J/xFHlQxibaHo4YcOIxT7ND1Ocf21+x7zOxzm/bz
         TZbc2h/vDrXhBvdYdu5h60m/P4NI6T1NmffQVej3OCgCLCwLX1dkm8CqJsf1qwl8Ywtt
         ppo5CEZ13KalajtwgysJ3m4EwyvpX6LLeSkyYk4uklsV6o5BQzOy09HAktWbw6zWnj3A
         JPAgqYB82SDRCNbMtjqsICSlyROvyahcKxfx/0MEvuaHdLGZzXkyQU0Rhvg7nDRgxC7f
         xWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bgStZXmBcIhXcAGtUDT4PdZzWJDdtOc6W3ug+5/Il+s=;
        b=ITqdLqVX0Ym+EfGXCiXbjv/lrMuuhJRjWYutVdgROkPeqfonM/tD61nMVPG18Pjma4
         3RcLAlu8ZFMPKagMnqeEQrYrhd6FUiS3DFORCKewxDPuZaN27PVr3fU2t0pG6tXu3E4z
         7fBZl4yfmyBow8TGD8oM9gnoFw945f1UHnsGuvnb2SShTRD5g2hTMVPR6E+dfiT87w7G
         yen/WhGrTx9HRe+ULC95hXSj+Wg63oZlAUBlytv0/M6huGf9u/cm+vuQiftnXtp96mkJ
         6ttkbALt6AwN58/MpAW6weE745tJ/e2BEuIyozYOWCLZRuV7rfd3JpDjwcqcmDqlNB1a
         JNOA==
X-Gm-Message-State: AOAM532ZWICWWQzklX8ctV4eUa9UbysHugP3wlv3lOg5XmLhHpvhzpGF
        b01xaI+QiYjAHxTZhlxCCkCuFDklG8gHqPUqsy8mMw==
X-Google-Smtp-Source: ABdhPJzs7Sq4oYWEqhHPxCaCGdYgzCwr7UNwM/STgfbVl0eFQjVoVkHK2MEixmQI4qnY3lRXBziYkcsXfb42IsvYHUI=
X-Received: by 2002:aca:1117:: with SMTP id 23mr9737257oir.97.1596768550163;
 Thu, 06 Aug 2020 19:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com> <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <f314b687-11a9-5a5e-e79e-c46dd2f16c6f@kali.org> <78ad0914-6173-f753-9eba-b7cbfbb51fd6@kali.org>
 <CALAqxLXPN9kThwF32YoWyApaWnfjthANXj3uk65Wc3ddaJQFFQ@mail.gmail.com>
 <20200807004001.GF20825@builder.lan> <CALAqxLWwY00PVUL7EM-tgbXeB5h8MsfPo7EFZTfDSzbb3P3eqQ@mail.gmail.com>
 <20200807013903.GG20825@builder.lan>
In-Reply-To: <20200807013903.GG20825@builder.lan>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 6 Aug 2020 19:48:58 -0700
Message-ID: <CALAqxLWmJisTA9836Rvb8f9m4hsTL7iZ=HQtz39anu2Bbgv44g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Steev Klimaszewski <steev@kali.org>,
        Saravana Kannan <saravanak@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hanks Chen <hanks.chen@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 6, 2020 at 6:42 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Thu 06 Aug 18:22 PDT 2020, John Stultz wrote:
> > On Thu, Aug 6, 2020 at 5:43 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > > On Wed 05 Aug 14:57 PDT 2020, John Stultz wrote:
> > > > On Wed, Aug 5, 2020 at 2:47 PM Steev Klimaszewski <steev@kali.org> wrote:
> > > > > On 8/5/20 4:16 PM, Steev Klimaszewski wrote:
> > > > > > On 8/5/20 3:19 PM, Saravana Kannan wrote:
> > > > > >> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> wrote:
> > > > > >>> <sigh>
> > > > > >>> So this is where I bashfully admit I didn't get a chance to try this
> > > > > >>> patch series out, as I had success with a much older version of
> > > > > >>> Saravana's macro magic.
> > > > > >>>
> > > > > >>> But unfortunately, now that this has landed in mainline, I'm seeing
> > > > > >>> boot regressions on db845c. :( This is in the non-modular case,
> > > > > >>> building the driver in.
> > > > > >> Does that mean the modular version is working? Or you haven't tried
> > > > > >> that yet? I'll wait for your reply before I try to fix it. I don't
> > > > > >> have the hardware, but it should be easy to guess this issue looking
> > > > > >> at the code delta.
> > > > > > For what it's worth, I saw this too on the Lenovo C630 (started on -next
> > > > > > around 20200727, but I didn't track it down as, well, there's less way
> > > > > > to get debug output on the C630.
> > > > > >
> > > > > > In my testing, module or built-in doesn't matter, but reverting does
> > > > > > allow me to boot again.
> > > > > >
> > > > > Actually - I spoke too soon - QCOM_PDC built-in with the commit reverted
> > > > > boots, however, module (on the c630 at least) doesn't boot whether it's
> > > > > a module or built-in.
> > > >
> > > > You may need to set deferred_probe_timeout=30 to give things a bit
> > > > more grace time to load.
> > >
> > > With the risk of me reading more into this than what you're saying,
> > > please don't upstream anything that depend this parameter to be
> > > increased.
> > >
> > > Compiling any of these drivers as module should not require the user to
> > > pass additional kernel command line parameters in order to get their
> > > device to boot.
> >
> > So, ideally I agree, and Saravana's fw_devlink work should allow us to
> > avoid it. But the reality is that it is already required (at least in
> > configurations heavily using modules) to give more time for modules
> > loaded to resolve missing dependencies after init begins (due to
> > changes in the driver core to fail loading after init so that optional
> > dt links aren't eternally looked for). This was seen when trying to
> > enable the qualcom clk drivers to modules.
> >
>
> So to clarify what you're saying, any system that boots successfully
> with the default options is a sign of pure luck - regardless of being
> builtin or modules.
>
>
> And there you have my exact argument against the deferred timeout magic
> going on in the driver core. But as you know people insist that it's
> more important to be able to boot some defunct system from NFS than a
> properly configured one reliably.

I'd agree, but the NFS case was in use before, and when the original
deferred timeout/optional link handling stuff landed no one complained
they were broken by it (at least at the point where it landed). Only
later when we started enabling more lower-level core drivers as
modules did the shortened dependency resolution time start to bite
folks.  My attempt to set the default to be 30 seconds helped there,
but caused trouble and delays for the NFS case, and "don't break
existing users" seemed to rule, so I set the default timeout back to
0.

> > It doesn't seem necessary in this case, but I suggested it here as
> > I've got it enabled by default in my AOSP builds so that the
> > module-heavy configs for GKI boot properly (even if Saravana's
> > fw_devlink work is disabled).
> >
>
> With all due respect, that's your downstream kernel, the upstream kernel
> should not rely on luck, out-of-tree patches or kernel parameters.

I agree that would be preferred. But kernel parameters are often there
for these sorts of cases where we can't always do the right thing.  As
for out-of-tree patches, broken things don't get fixed until
out-of-tree patches are developed and upstreamed, and I know Saravana
is doing exactly that, and I hope his fw_devlink work helps fix it so
the module loading is not just a matter of luck.

Also I think Thierry's comments in the other thread today are also
good ideas for ways to better handle the optional dt link handling
(rather than using a timeout).

thanks
-john
