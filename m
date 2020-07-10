Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1076D21AF1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 08:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgGJGC4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 02:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgGJGCx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 02:02:53 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EFB6C08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 23:02:53 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x11so1810243plo.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 23:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=Oyd2oGqBVPyTAZ6JKFzEpbSr77ywHRgUekUG2FwE1cs=;
        b=J07Y2gm5zuILWzAzBMOo7yDMDUtUMb/Y8Nizn3WaDwf8021z99+kciMF7G3G6daKCL
         QhNbumaJhrt2UGJ3VPwE3FtUWphcnRsOd3oZNeAYOehVVdmkHlDJSCj3OFbCqLsmlxlh
         ruRX6eK6e1o0KvdHMX7zpNYqp0/xMh0BAPcbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=Oyd2oGqBVPyTAZ6JKFzEpbSr77ywHRgUekUG2FwE1cs=;
        b=mDWgQKTntv/JTKJoDV0oJ+KrxNfEmKTM1Aa+hqMXbRZ3KXWLKlAgRcVc3RWEGw/D2a
         Dhe0v0+db5YEzv/B7esYiesrjXbH+q58XjXe364KkI8mSwfIYY++U5tG8uB4oTZmy2Qs
         1sa7k3j2z+rQJPn8uWdHm3dR9U6dR/f2MlMABrLN16hwksAEpVMUAemCAhl8TUC5rYmP
         SwaRXR6I+OZjARpWWsFP6ToQsJdQqVavbEVEFIJp9pswfwUhAPJkspP/vA+eeb2hSDYN
         uP+Z3ZY6pWqntF3rdaVSGLB6UJD6DGd5dBhShbQyijX/hltws3Vm48ZyWqqyWvTixlVl
         ycnA==
X-Gm-Message-State: AOAM532YAUwRqqUDh1ikuERgVtm7mPJKpVGlm6dwMGe5yX5ZvAK1fCJw
        +IIO4HqBzstgz/nB66i4jEAU8g==
X-Google-Smtp-Source: ABdhPJxQuO02QwzrJ7yQ4iqF18cqHc9AyeYIrNPWmubHIZDKuPvIBSEE6MzrekewNPVhTy6i4w1egg==
X-Received: by 2002:a17:90a:2749:: with SMTP id o67mr3989699pje.183.1594360972481;
        Thu, 09 Jul 2020 23:02:52 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id h194sm4438382pfe.201.2020.07.09.23.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 23:02:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87wo3setn8.wl-maz@kernel.org>
References: <20200625001039.56174-1-john.stultz@linaro.org> <20200625001039.56174-4-john.stultz@linaro.org> <159315737502.62212.16093934831673347066@swboyd.mtv.corp.google.com> <CALAqxLVNGar8g+FvHaVHN_e-MOZZ+=ZPmDt_GKKSC8AS-wLFGg@mail.gmail.com> <87wo3setn8.wl-maz@kernel.org>
Subject: Re: [PATCH v2 3/5] irqchip: Allow QCOM_PDC to be loadable as a permanent module
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org, linux-gpio@vger.kernel.org
To:     John Stultz <john.stultz@linaro.org>, Marc Zyngier <maz@kernel.org>
Date:   Thu, 09 Jul 2020 23:02:50 -0700
Message-ID: <159436097057.1987609.13993891118929459851@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Marc Zyngier (2020-06-27 02:37:47)
> On Sat, 27 Jun 2020 02:34:25 +0100,
> John Stultz <john.stultz@linaro.org> wrote:
> >=20
> > On Fri, Jun 26, 2020 at 12:42 AM Stephen Boyd <swboyd@chromium.org> wro=
te:
> > >
> > >
> > > Is there any reason to use IRQCHIP_DECLARE if this can work as a
> > > platform device driver?
> > >
> >=20
> > Hey! Thanks so much for the review!
> >=20
> > Mostly it was done this way to minimize the change in the non-module
> > case. But if you'd rather avoid the #ifdefery I'll respin it without.
>=20
> That would certainly be my own preference. In general, IRQCHIP_DECLARE
> and platform drivers should be mutually exclusive in the same driver:
> if you can delay the probing and have it as a proper platform device,
> then this should be the one true way.
>=20

Does it work? I haven't looked in detail but I worry that the child
irqdomain (i.e. pinctrl-msm) would need to delay probing until this
parent irqdomain is registered. Or has the hierarchical irqdomain code
been updated to handle the parent child relationship and wait for things
to probe or be loaded?
