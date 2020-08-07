Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8521423E629
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 05:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgHGDNf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 23:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbgHGDNe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 23:13:34 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC357C061575
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2020 20:13:32 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id kr4so218285pjb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2020 20:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mntt/yV9g0WantW+MFUMl7qG7fGk/Oi5dRuY6kccsYw=;
        b=RDovZW0comW5k7a9qDBhi0AemfQotZc35NVP3B/JDirQCHkb3KxYzbiNVpmHOLFuwB
         16VvF1+r+a5Uh0LqZm/NYiMCFqw5Kg84vRSFVEvGutQZxz14IrygV9VS6q8VcYGZw/h1
         dHG0UzmQ0xHz10DDkThhfDS9paQ9LrKO/PoEGFXs24VQWqcyQVSzNeshbKpJnxZ1mG0d
         5Zf92IcmPVcRjaHg0tRv1sCEKsHUa8AclgHXo1FnE9oTRiP5y2Izlfzg3fZJrgzl3sqd
         07fpIFfQH3mur+x5UUTjPLI1b9JvJd346SZpuhDJVf+98Mu6vRZ5H5WCK+dJezuiL7kq
         YLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mntt/yV9g0WantW+MFUMl7qG7fGk/Oi5dRuY6kccsYw=;
        b=etmI0yDp5CiKBGONQrS6gOR81T0AGYVENdUk5PZHIoP/fEWorN12y97Bcj9u3rLDC8
         bLGwRw2HBS+XizUPLf/+krDrN3tqD6J4F3AB3K3d9AztDxjDCQCrgiuKxYQYB7tiBX1u
         9fTLw9+VYnAnD/jDaRmZJw8maG3F8uHzfsSZ+Ou1Wbv4DRRhEfQuJrZSDMTkjWk+tLNQ
         +gaOuiB73Xb3sadDfP+0E3KI1GVI5Ytyf+t+a+F2M4UzP9nyQLZ/E3iw98g0xlTpq8G7
         8RbFkBopwmue8TXj7Q3EZHLGsD8aTs9TdDXieeVNJ+sXvbIDkq/NbV5IWU5amfpE0pFO
         VgIQ==
X-Gm-Message-State: AOAM533FkN5NmQrsbsfhhrpxBukM0DEiqnLjrLZOXbdr3sLEEszdYiI8
        g+KisG2Lv1bCXiaoEpR+irPq4GfK1otstiIoBzH1Mg==
X-Google-Smtp-Source: ABdhPJwHf/baXL/FshABJwVK72iC4bCenNX/IrhdV9ee/TdyaNNuV/RPDLg0FYY0/FnAyGhJKXhqedgsCLoHXEgA/TY=
X-Received: by 2002:a17:90a:1546:: with SMTP id y6mr2707909pja.93.1596770011948;
 Thu, 06 Aug 2020 20:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com> <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <f314b687-11a9-5a5e-e79e-c46dd2f16c6f@kali.org> <78ad0914-6173-f753-9eba-b7cbfbb51fd6@kali.org>
 <CALAqxLXPN9kThwF32YoWyApaWnfjthANXj3uk65Wc3ddaJQFFQ@mail.gmail.com>
 <20200807004001.GF20825@builder.lan> <CALAqxLWwY00PVUL7EM-tgbXeB5h8MsfPo7EFZTfDSzbb3P3eqQ@mail.gmail.com>
 <20200807013903.GG20825@builder.lan> <CALAqxLWmJisTA9836Rvb8f9m4hsTL7iZ=HQtz39anu2Bbgv44g@mail.gmail.com>
 <CAGETcx9Gsa9CWow8MBVPF4cgofdcK1+cFohAf_-Dqa3JT8H1bw@mail.gmail.com> <CALAqxLWR3mKrQDn5VkOV_zaaqxmwWzZwK0CCLRSfGJDU6WUXag@mail.gmail.com>
In-Reply-To: <CALAqxLWR3mKrQDn5VkOV_zaaqxmwWzZwK0CCLRSfGJDU6WUXag@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 6 Aug 2020 20:12:56 -0700
Message-ID: <CAGETcx-2mCg9K3th+HW_QjvKWmpb6yk=Cu3F3gOn3w+TD1RTzw@mail.gmail.com>
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

On Thu, Aug 6, 2020 at 8:09 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Thu, Aug 6, 2020 at 8:02 PM Saravana Kannan <saravanak@google.com> wrote:
> > On Thu, Aug 6, 2020 at 7:49 PM John Stultz <john.stultz@linaro.org> wrote:
> > > On Thu, Aug 6, 2020 at 6:42 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > > With all due respect, that's your downstream kernel, the upstream kernel
> > > > should not rely on luck, out-of-tree patches or kernel parameters.
> > >
> > > I agree that would be preferred. But kernel parameters are often there
> > > for these sorts of cases where we can't always do the right thing.  As
> > > for out-of-tree patches, broken things don't get fixed until
> > > out-of-tree patches are developed and upstreamed, and I know Saravana
> > > is doing exactly that, and I hope his fw_devlink work helps fix it so
> > > the module loading is not just a matter of luck.
> >
> > Btw, the only downstream fw_devlink change is setting itto =on (vs
> > =permissive in upstream).
>
> I thought there was the clk_sync_state stuff as well?

That's not needed to solve the module load ordering issues and
deferred probe issues. That's only needed to keep clocks on till some
of the modules are loaded and it depends on fw_devlink, but not really
a part of fw_devlink IMHO. And yes, that's on my list of things to
upstream.

> > > Also I think Thierry's comments in the other thread today are also
> > > good ideas for ways to better handle the optional dt link handling
> > > (rather than using a timeout).
> >
> > Could you please give me a lore link to this thread? Just curious.
>
> Sure: https://lore.kernel.org/lkml/20200806135251.GB3351349@ulmo/

Thanks.

-Saravana
