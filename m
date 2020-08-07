Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA98823E61B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 05:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726058AbgHGDC5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 23:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbgHGDC4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 23:02:56 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C53DC061575
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2020 20:02:55 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id u10so383256plr.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2020 20:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sI/Ylh6eOxpOi8dfZx2CB5Dd8AuEHZ4rPWxXh4qzj9Q=;
        b=cYYrMyS2txfjHQE/maVnQ0Sj9/oHVbhXe/1s+RUtY0vxBMgVbDXhdfYZl4YALxE/Go
         7XfMS5k6syiXFt7z2yCYqsysuxgleOqS3rl/Qv6+qKWSjJBnwRWcj7ktyeTFpngcNfh8
         EB9LN1/atIhutq2syuY3dQNeBcU6emdlZFMNp7dfWb1WDFNRrqMNBzfVHAvDo1EsCV2C
         UH9HYfU6zod+cNJPs83HRN87+d36kviAQlKd5jRFuKtz8wyxENZxqxbyApN1lfdyNp8q
         W0rnJpiWPbYz7CfgWFmnJAKi4HYRaVcCCe2I7Gruj8rkedmT3yK+Lwo672Ysvxoh4+NO
         W7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sI/Ylh6eOxpOi8dfZx2CB5Dd8AuEHZ4rPWxXh4qzj9Q=;
        b=Vb+SBfTfHcYi7EGmhbQUhrJQJgjymqo8uEjZE7tqILL5HGkDuuI9kCvdUvjp98qRUY
         XKVmD3NjLNGGHlKBsiCL/OPLf7/E5rXEdtY5I/wzf7p4Rv7xJ+dBzMhmUCQn+dpgpHqE
         kZBCWinT3hf16BcG/yvSGPdxy4T93zGLTcZIjZh8SonCHJG3zB8MXE/6FX7WzoF/239N
         htfQncXz1+E4yXcv0454MGxOhEIVRGDBPveCzSXfAP3g+Tn8W49Z34lTLkj+ipX06bwS
         WbqZbghZHyRpkKolyFhRscKay39Flg+JrnjPmuwNFpggtBk9YaJG7y7mmBgOnYosKnI6
         Xm2Q==
X-Gm-Message-State: AOAM532J6Lre+yeSpV4mKnLsBVta3CkvIYtR8JlLT6sHmRrC4rIUvHpo
        od7E/09o+Gy1UFmc4oqRe1rSI9GjY4dt3TCcE9VVjA==
X-Google-Smtp-Source: ABdhPJyNmX+qVrx2qnzM+1ALdIYlD8EOQBOoLpYkrVHWneqiH92NwNt3kAJC9DsTHSILke39eAQ5Drspa7/iWpyxKnw=
X-Received: by 2002:a17:90a:f98e:: with SMTP id cq14mr11609866pjb.51.1596769374122;
 Thu, 06 Aug 2020 20:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com> <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <f314b687-11a9-5a5e-e79e-c46dd2f16c6f@kali.org> <78ad0914-6173-f753-9eba-b7cbfbb51fd6@kali.org>
 <CALAqxLXPN9kThwF32YoWyApaWnfjthANXj3uk65Wc3ddaJQFFQ@mail.gmail.com>
 <20200807004001.GF20825@builder.lan> <CALAqxLWwY00PVUL7EM-tgbXeB5h8MsfPo7EFZTfDSzbb3P3eqQ@mail.gmail.com>
 <20200807013903.GG20825@builder.lan> <CALAqxLWmJisTA9836Rvb8f9m4hsTL7iZ=HQtz39anu2Bbgv44g@mail.gmail.com>
In-Reply-To: <CALAqxLWmJisTA9836Rvb8f9m4hsTL7iZ=HQtz39anu2Bbgv44g@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 6 Aug 2020 20:02:18 -0700
Message-ID: <CAGETcx9Gsa9CWow8MBVPF4cgofdcK1+cFohAf_-Dqa3JT8H1bw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To:     John Stultz <john.stultz@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
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
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 6, 2020 at 7:49 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Thu, Aug 6, 2020 at 6:42 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Thu 06 Aug 18:22 PDT 2020, John Stultz wrote:
> > > On Thu, Aug 6, 2020 at 5:43 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > > On Wed 05 Aug 14:57 PDT 2020, John Stultz wrote:
> > > > > On Wed, Aug 5, 2020 at 2:47 PM Steev Klimaszewski <steev@kali.org> wrote:
> > > > > > On 8/5/20 4:16 PM, Steev Klimaszewski wrote:
> > > > > > > On 8/5/20 3:19 PM, Saravana Kannan wrote:
> > > > > > >> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> wrote:
> > > > > > >>> <sigh>
> > > > > > >>> So this is where I bashfully admit I didn't get a chance to try this
> > > > > > >>> patch series out, as I had success with a much older version of
> > > > > > >>> Saravana's macro magic.
> > > > > > >>>
> > > > > > >>> But unfortunately, now that this has landed in mainline, I'm seeing
> > > > > > >>> boot regressions on db845c. :( This is in the non-modular case,
> > > > > > >>> building the driver in.
> > > > > > >> Does that mean the modular version is working? Or you haven't tried
> > > > > > >> that yet? I'll wait for your reply before I try to fix it. I don't
> > > > > > >> have the hardware, but it should be easy to guess this issue looking
> > > > > > >> at the code delta.
> > > > > > > For what it's worth, I saw this too on the Lenovo C630 (started on -next
> > > > > > > around 20200727, but I didn't track it down as, well, there's less way
> > > > > > > to get debug output on the C630.
> > > > > > >
> > > > > > > In my testing, module or built-in doesn't matter, but reverting does
> > > > > > > allow me to boot again.
> > > > > > >
> > > > > > Actually - I spoke too soon - QCOM_PDC built-in with the commit reverted
> > > > > > boots, however, module (on the c630 at least) doesn't boot whether it's
> > > > > > a module or built-in.
> > > > >
> > > > > You may need to set deferred_probe_timeout=30 to give things a bit
> > > > > more grace time to load.
> > > >
> > > > With the risk of me reading more into this than what you're saying,
> > > > please don't upstream anything that depend this parameter to be
> > > > increased.
> > > >
> > > > Compiling any of these drivers as module should not require the user to
> > > > pass additional kernel command line parameters in order to get their
> > > > device to boot.
> > >
> > > So, ideally I agree, and Saravana's fw_devlink work should allow us to
> > > avoid it. But the reality is that it is already required (at least in
> > > configurations heavily using modules) to give more time for modules
> > > loaded to resolve missing dependencies after init begins (due to
> > > changes in the driver core to fail loading after init so that optional
> > > dt links aren't eternally looked for). This was seen when trying to
> > > enable the qualcom clk drivers to modules.
> > >
> >
> > So to clarify what you're saying, any system that boots successfully
> > with the default options is a sign of pure luck - regardless of being
> > builtin or modules.
> >
> >
> > And there you have my exact argument against the deferred timeout magic
> > going on in the driver core. But as you know people insist that it's
> > more important to be able to boot some defunct system from NFS than a
> > properly configured one reliably.
>
> I'd agree, but the NFS case was in use before, and when the original
> deferred timeout/optional link handling stuff landed no one complained
> they were broken by it (at least at the point where it landed). Only
> later when we started enabling more lower-level core drivers as
> modules did the shortened dependency resolution time start to bite
> folks.  My attempt to set the default to be 30 seconds helped there,
> but caused trouble and delays for the NFS case, and "don't break
> existing users" seemed to rule, so I set the default timeout back to
> 0.
>
> > > It doesn't seem necessary in this case, but I suggested it here as
> > > I've got it enabled by default in my AOSP builds so that the
> > > module-heavy configs for GKI boot properly (even if Saravana's
> > > fw_devlink work is disabled).
> > >
> >
> > With all due respect, that's your downstream kernel, the upstream kernel
> > should not rely on luck, out-of-tree patches or kernel parameters.
>
> I agree that would be preferred. But kernel parameters are often there
> for these sorts of cases where we can't always do the right thing.  As
> for out-of-tree patches, broken things don't get fixed until
> out-of-tree patches are developed and upstreamed, and I know Saravana
> is doing exactly that, and I hope his fw_devlink work helps fix it so
> the module loading is not just a matter of luck.

Btw, the only downstream fw_devlink change is setting itto =on (vs
=permissive in upstream).

> Also I think Thierry's comments in the other thread today are also
> good ideas for ways to better handle the optional dt link handling
> (rather than using a timeout).

Could you please give me a lore link to this thread? Just curious.

-Saravana
