Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A52123E735
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 08:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbgHGGXa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 02:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbgHGGX2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 02:23:28 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4856CC061575
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2020 23:23:28 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id m8so469048pfh.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2020 23:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kjYnZO75jW+/NGMWgfsZKGwoEpWRxfcQO49H3CEjGVo=;
        b=tiw6O4XWq6TLskF079PRNCB3yu6v54OlBOgQNGuZ5nyrw6dK8b52GuWCH2diP9RaNK
         QfjP+alu9EsDItQfbi3g8/yH4LN4C0ZtUTlwX0OKDw5v/Z4oth/8HMyVBfhtjaeKFkjM
         F1QCiL+IHiqg4jJ1xADzTqteLK62kx8j9FYoHk3sOjuLLcCwGKDjEmQw4kzejV1iou0B
         H3qhv3iLWMoyRWUaYk9aA0W9xQnr5JJl6ulIn8pEoF1irPSsXi8CKE5UXAkRgmx40LqA
         P7FFdXQazZv1sDUfwnqVmFXIfQ0ANa3JXGF54HlODMIh7ZVAeZAKLMB6WbDaEyau/7U+
         +bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kjYnZO75jW+/NGMWgfsZKGwoEpWRxfcQO49H3CEjGVo=;
        b=PtHhjT6kIfqD73rb0IGl1/VGVNN4Udh8NjQLPLFHTiRuY/hXjZm9cIChPaFfbh3pXF
         VOgtGURRjomIXm+RzChIgOtqz5rQr4MZDPGQ1icRvTaFxbka2h8Cvs+CgjU+vpFHk1So
         5sYy3DEz5iQnNHag0VGv0Yje+7xOGfInLyqFu1/n9kCVZARGWXK/MtwuJ7l9EBzP8Dxy
         YU72x47y7W7mXtdvgneZAT2kpJDaSa14JFJkxcBahNn5yVER/YhA0Mg+tFh35lySAEGo
         1TT5O/a6HFJ6glrS/3l4KoZhYRVCJbSWvTNpHw3P1zCkOWsLVUTZo5ceA+DAPYg30cIX
         zE4g==
X-Gm-Message-State: AOAM530wpJSh6KVKrcXu5AaQQ2QYn7BqIQGuefUsU2Q5Vw0fl4aQre0U
        CmKbLRswHkyWXPi0ECWV7pxPccR435X5/tXhCJd1HQ==
X-Google-Smtp-Source: ABdhPJwQIjDDxXvPIYI66seCVsO7fJloix907UN+BOcP9hYrcizvL0kHTde7padIRCE53hB/GTd7qWRLpnkcrZOrxkc=
X-Received: by 2002:a65:6381:: with SMTP id h1mr10771109pgv.0.1596781407242;
 Thu, 06 Aug 2020 23:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <f314b687-11a9-5a5e-e79e-c46dd2f16c6f@kali.org> <78ad0914-6173-f753-9eba-b7cbfbb51fd6@kali.org>
 <CALAqxLXPN9kThwF32YoWyApaWnfjthANXj3uk65Wc3ddaJQFFQ@mail.gmail.com>
 <20200807004001.GF20825@builder.lan> <CALAqxLWwY00PVUL7EM-tgbXeB5h8MsfPo7EFZTfDSzbb3P3eqQ@mail.gmail.com>
 <20200807013903.GG20825@builder.lan> <CALAqxLWmJisTA9836Rvb8f9m4hsTL7iZ=HQtz39anu2Bbgv44g@mail.gmail.com>
 <20200807055842.GP61202@yoga>
In-Reply-To: <20200807055842.GP61202@yoga>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 6 Aug 2020 23:22:50 -0700
Message-ID: <CAGETcx8DNDQZ_ikjJD9pybt9-jMeb399am1k3xHOjuTFn1imTg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Steev Klimaszewski <steev@kali.org>,
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
        Thierry Reding <thierry.reding@gmail.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 6, 2020 at 10:58 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 06 Aug 19:48 PDT 2020, John Stultz wrote:
>
> > On Thu, Aug 6, 2020 at 6:42 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > > On Thu 06 Aug 18:22 PDT 2020, John Stultz wrote:
> > > > On Thu, Aug 6, 2020 at 5:43 PM Bjorn Andersson
> > > > <bjorn.andersson@linaro.org> wrote:
> > > > > On Wed 05 Aug 14:57 PDT 2020, John Stultz wrote:
> > > > > > On Wed, Aug 5, 2020 at 2:47 PM Steev Klimaszewski <steev@kali.org> wrote:
> > > > > > > On 8/5/20 4:16 PM, Steev Klimaszewski wrote:
> > > > > > > > On 8/5/20 3:19 PM, Saravana Kannan wrote:
> > > > > > > >> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> wrote:
> > > > > > > >>> <sigh>
> > > > > > > >>> So this is where I bashfully admit I didn't get a chance to try this
> > > > > > > >>> patch series out, as I had success with a much older version of
> > > > > > > >>> Saravana's macro magic.
> > > > > > > >>>
> > > > > > > >>> But unfortunately, now that this has landed in mainline, I'm seeing
> > > > > > > >>> boot regressions on db845c. :( This is in the non-modular case,
> > > > > > > >>> building the driver in.
> > > > > > > >> Does that mean the modular version is working? Or you haven't tried
> > > > > > > >> that yet? I'll wait for your reply before I try to fix it. I don't
> > > > > > > >> have the hardware, but it should be easy to guess this issue looking
> > > > > > > >> at the code delta.
> > > > > > > > For what it's worth, I saw this too on the Lenovo C630 (started on -next
> > > > > > > > around 20200727, but I didn't track it down as, well, there's less way
> > > > > > > > to get debug output on the C630.
> > > > > > > >
> > > > > > > > In my testing, module or built-in doesn't matter, but reverting does
> > > > > > > > allow me to boot again.
> > > > > > > >
> > > > > > > Actually - I spoke too soon - QCOM_PDC built-in with the commit reverted
> > > > > > > boots, however, module (on the c630 at least) doesn't boot whether it's
> > > > > > > a module or built-in.
> > > > > >
> > > > > > You may need to set deferred_probe_timeout=30 to give things a bit
> > > > > > more grace time to load.
> > > > >
> > > > > With the risk of me reading more into this than what you're saying,
> > > > > please don't upstream anything that depend this parameter to be
> > > > > increased.
> > > > >
> > > > > Compiling any of these drivers as module should not require the user to
> > > > > pass additional kernel command line parameters in order to get their
> > > > > device to boot.
> > > >
> > > > So, ideally I agree, and Saravana's fw_devlink work should allow us to
> > > > avoid it. But the reality is that it is already required (at least in
> > > > configurations heavily using modules) to give more time for modules
> > > > loaded to resolve missing dependencies after init begins (due to
> > > > changes in the driver core to fail loading after init so that optional
> > > > dt links aren't eternally looked for). This was seen when trying to
> > > > enable the qualcom clk drivers to modules.
> > > >
> > >
> > > So to clarify what you're saying, any system that boots successfully
> > > with the default options is a sign of pure luck - regardless of being
> > > builtin or modules.
> > >
> > >
> > > And there you have my exact argument against the deferred timeout magic
> > > going on in the driver core. But as you know people insist that it's
> > > more important to be able to boot some defunct system from NFS than a
> > > properly configured one reliably.
> >
> > I'd agree, but the NFS case was in use before, and when the original
> > deferred timeout/optional link handling stuff landed no one complained
> > they were broken by it (at least at the point where it landed).
>
> I did object when this was proposed and I've objected for the last two
> years, because we keep adding more and more subsystems to follow this
> broken behavior.
>
> > Only later when we started enabling more lower-level core drivers as
> > modules did the shortened dependency resolution time start to bite
> > folks.  My attempt to set the default to be 30 seconds helped there,
> > but caused trouble and delays for the NFS case, and "don't break
> > existing users" seemed to rule, so I set the default timeout back to
> > 0.
> >
>
> I can't argue with that and I'm at loss on how to turn this around.
>
> > > > It doesn't seem necessary in this case, but I suggested it here as
> > > > I've got it enabled by default in my AOSP builds so that the
> > > > module-heavy configs for GKI boot properly (even if Saravana's
> > > > fw_devlink work is disabled).
> > > >
> > >
> > > With all due respect, that's your downstream kernel, the upstream kernel
> > > should not rely on luck, out-of-tree patches or kernel parameters.
> >
> > I agree that would be preferred. But kernel parameters are often there
> > for these sorts of cases where we can't always do the right thing.
> > As for out-of-tree patches, broken things don't get fixed until
> > out-of-tree patches are developed and upstreamed, and I know Saravana
> > is doing exactly that, and I hope his fw_devlink work helps fix it so
> > the module loading is not just a matter of luck.
> >
>
> I don't agree with this, upstream should be functional in its default
> configuration. Out-of-tree patches might be necessary to enable features
> or get the most out of the hardware, but what we have upstream should
> work.  And no, this is not always the case, but we should at least aim
> for this.
>
> > Also I think Thierry's comments in the other thread today are also
> > good ideas for ways to better handle the optional dt link handling
> > (rather than using a timeout).
> >
>
> I'll take a look at that, but to repeat what I've said many times
> before, for Qualcomm platforms there's pretty much no such thing as
> optional links.

Nicolas had suggested earlier that we could have a way to enable
fw_devlink=on in DT under the "chosen" node. I liked that idea, but
wasn't sure how easy it would be to convince DT maintainers to allow
it. If that happens, we could just set that and not have to worry
about these timeouts for QC platforms.

Not sure how easy it is to update DT in a DB 845c though. But for
cases where DT can't be updated, we'd still have the crappy timeout to
plaster over the issue.

Something like this or whatever sensible name that suggests that the
dependencies in DT are reliable enough to use for probe ordering,
deferred probe, etc. Then once that's there, we can turn on
fw_devlink=on and that'd completely skip this timeout code path (and
has a bunch of other benefits).

chosen {
        linux,reliable-dt-dependencies;
}

Just some food for thought.

Also, Thierry's idea would work, but it'll need changes to multiple
drivers. Also, I don't think it'll work for drivers that'll need to
ignore vs not ignore dependencies based on what board they are used
in. It's still better than the blind timeout though.

-Saravana
