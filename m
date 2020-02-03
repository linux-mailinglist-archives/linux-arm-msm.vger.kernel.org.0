Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C12C15100F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 20:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgBCTCl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 14:02:41 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:33670 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgBCTCk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 14:02:40 -0500
Received: by mail-vk1-f195.google.com with SMTP id i78so4446864vke.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 11:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H92Ceqpm5PG9xicOBj3pwciuaSxJbU1fy1wmWiFsutU=;
        b=YSoFqclOI7dib/E7gGqaXKXp2CnNGDGmj1obojZ3zyFNN+d1a8M5OGDVct9g5m+3Qc
         EVBG+5Oyeo8eOzC0EfMf7EgxD/qD79HxaUgerNMIkAWrzGB9FyIBvFUvs6a8ufMFh0mC
         01nYZLM4yzr5u23teE/ErNPhUeXbQgMLyoAMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H92Ceqpm5PG9xicOBj3pwciuaSxJbU1fy1wmWiFsutU=;
        b=hqJ2YJ3P6Z1twUt/mFuNRZWJxEtNSuCKfAg6xP6Gy0ozGdRTOI2hYAXrAFKvX2Fhe+
         +DdSf2X1oLFl1tsch7fzloSMoj5B4XBAYITDfAV7Pb1NoSFRQ0SWLDuff1pfC+WOpq2+
         0DoS0LVG7Qoi6O2b30Y5qCn3gmTrGwAIwKDUzs7EdUJxtXt2WsQmscjwU3PLjWGI2tEJ
         sNAW1BCBOvt4dyX0kQwkq5XjaXkQAvVrWuC4z95lfmnIVy4HfEBmuyrHbIawjZVlnN6k
         E4mQaBYUy+zudprlur33DdJOWbvQ1++wDSJLDlFq89nHSIlWIOo+195SMTzjeo1j6kM0
         k+VQ==
X-Gm-Message-State: APjAAAVMkTKRpFH8QYzH+E64JBhls2KO1uZxmVkWKaS1eTsKn3xopJkC
        MeON2ZUBF1TJtpKgLnK1C13DWy4wLNg=
X-Google-Smtp-Source: APXvYqwPv1mtZ91JPM6PT1csc3dSdHzVOHc1mtoKZGQaqQHawxJEj2G2itixf8eLs/GDrYwcatmm3A==
X-Received: by 2002:a1f:72c3:: with SMTP id n186mr14648375vkc.12.1580756558431;
        Mon, 03 Feb 2020 11:02:38 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id q189sm6399430vkh.44.2020.02.03.11.02.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2020 11:02:37 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id p6so9633957vsj.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 11:02:37 -0800 (PST)
X-Received: by 2002:a67:fa1a:: with SMTP id i26mr15830765vsq.169.1580756556608;
 Mon, 03 Feb 2020 11:02:36 -0800 (PST)
MIME-Version: 1.0
References: <20200121183748.68662-1-swboyd@chromium.org> <CACRpkdbgfNuJCgOWMBGwf1FoF+9cpQACnGH7Uon5Y6X+kN+x_w@mail.gmail.com>
 <5e29f186.1c69fb81.61d8.83b9@mx.google.com>
In-Reply-To: <5e29f186.1c69fb81.61d8.83b9@mx.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 3 Feb 2020 11:02:24 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W=NjMf5UqpSaY-VZfE013Ut=qe2EgSY2UErXM3eqpsGQ@mail.gmail.com>
Message-ID: <CAD=FV=W=NjMf5UqpSaY-VZfE013Ut=qe2EgSY2UErXM3eqpsGQ@mail.gmail.com>
Subject: Re: [PATCH] spmi: pmic-arb: Set lockdep class for hierarchical irq domains
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>, Douglas Anderson
        <dianders@chromium.org>, Brian Masney <masneyb@onstation.org>, Lina Iyer
        <ilina@codeaurora.org>, Maulik Shah <mkshah@codeaurora.org>, Bjorn
        Andersson" <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jan 23, 2020 at 11:18 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Linus Walleij (2020-01-23 07:29:31)
> > On Tue, Jan 21, 2020 at 7:37 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >   kobj_attr_store+0x14/0x24
> > >   sysfs_kf_write+0x4c/0x64
> > >   kernfs_fop_write+0x15c/0x1fc
> > >   __vfs_write+0x54/0x18c
> > >   vfs_write+0xe4/0x1a4
> > >   ksys_write+0x7c/0xe4
> > >   __arm64_sys_write+0x20/0x2c
> > >   el0_svc_common+0xa8/0x160
> > >   el0_svc_handler+0x7c/0x98
> > >   el0_svc+0x8/0xc
> > >
> > > Set a lockdep class when we map the irq so that irq_set_wake() doesn't
> > > warn about a lockdep bug that doesn't exist.
> > >
> > > Fixes: 12a9eeaebba3 ("spmi: pmic-arb: convert to v2 irq interfaces to support hierarchical IRQ chips")
> > > Cc: Douglas Anderson <dianders@chromium.org>
> > > Cc: Brian Masney <masneyb@onstation.org>
> > > Cc: Lina Iyer <ilina@codeaurora.org>
> > > Cc: Maulik Shah <mkshah@codeaurora.org>
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> >
> > LGTM
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Thanks. I was hoping you would apply it given that the commit it's
> fixing was applied by you. I can send it to Gregkh or have some qcom
> person pick it up though if you prefer.

It appears that the commit this is Fixing is now in Linus's tree but
Stephen's fix is still nowhere to be found.  Any update on what the
plan is?

Thanks!

-Doug
