Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5126A7055D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 18:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730881AbfGVQYB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 12:24:01 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40764 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730158AbfGVQYB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 12:24:01 -0400
Received: by mail-ed1-f66.google.com with SMTP id k8so41124761eds.7;
        Mon, 22 Jul 2019 09:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3hF/yndw/9iMn5LkMnQIXmMVSvMqJPR1brEffSYKm5A=;
        b=KnzCgtP91QMek3camJEsYfFRzzhuY4Ww/kLXQ31e1jHO+Ezf8mtZJ1b/1iPepH5PzA
         WLLtRKyA5QthErKxn2tF0Gp0gca80dViEGu/6oN7tEaFWByHj6r+IEwyftgUsNkIOpHl
         JAUlt9nmfr6P5a/kge2fwtxnHsSv2e1+E6SfgC3Tnn0ICjHm/4bMEpCZEzQiQrPCpaCW
         GHHNZ0VKd7LuZ/87R8EIRqfsE6HY8J5t9Ll0BvPzxanzyUbqzeB2GTKZSim73zw4T0pA
         JVrnux0f6lCz8yxLBPH+cwJVhcAanqTqw8Lr6c/6k3uMPn1grsr3ZDG534fKF4wPVAX8
         JMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3hF/yndw/9iMn5LkMnQIXmMVSvMqJPR1brEffSYKm5A=;
        b=IWuo7/JBjqQ55pVyvY3xtog8KoWPBnG8aHsGhah9+pyYtEWh0pbbyS+SGGyMauw3+z
         7eWF2GMVW3Ivni/mafbtl8t0N2NkcFmNUE5jYorQ323T/k+vFci6rmWzfpz2ZxmTohXx
         SdMgo06zIjHkuubAR6LVa4odTWe8cIeC4ee9moPrMXr4S+ueF0fzUP6urpMg+Ty+M2cb
         V9oDJTrWn2+kQ0d41wDM8++tcGiop9XZiDHVLxQz6iQSKoaXi5vd1qB90lraBdMdMEpP
         fDFoD/8IokTSappSbchLqAW6MPIBfSTpx96/GDbeAYNTDxjdd7LQF35sPT365HqDulep
         LaJw==
X-Gm-Message-State: APjAAAWHX8ELKz23mwNd+NZPgeSos/qFdOYB2+SlE2Z3ZtXb1lHCaCom
        pZvXB/dhgrYH+tKUySHToWFNWmShZrs1TJ4r4O4=
X-Google-Smtp-Source: APXvYqxvnE7n6rBYLjaXH+rbNyXf18kfTJLS/GQKcpYfbikX6ihBKV75fxCtNZ4ZQvBC7LjyrvO+CjV4KyuaPK440ZM=
X-Received: by 2002:a17:906:3612:: with SMTP id q18mr55088125ejb.278.1563812639299;
 Mon, 22 Jul 2019 09:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190702202631.32148-2-robdclark@gmail.com> <20190710182844.25032-1-robdclark@gmail.com>
 <20190722142833.GB12009@8bytes.org> <CAF6AEGvJc2RK3GkpcXiVKsuTX81D3oahnu=qWJ9LFst1eT3tMg@mail.gmail.com>
 <20190722154803.GG12009@8bytes.org>
In-Reply-To: <20190722154803.GG12009@8bytes.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 22 Jul 2019 09:23:48 -0700
Message-ID: <CAF6AEGvWf3ZOrbyyWjORuOVEPOcPr+JSEO78aYjhL-GVhDZnTg@mail.gmail.com>
Subject: Re: [PATCH v2] iommu: add support for drivers that manage iommu explicitly
To:     Joerg Roedel <joro@8bytes.org>
Cc:     "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        aarch64-laptops@lists.linaro.org,
        Rob Clark <robdclark@chromium.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Joe Perches <joe@perches.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 22, 2019 at 8:48 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> On Mon, Jul 22, 2019 at 08:41:34AM -0700, Rob Clark wrote:
> > It is set by the driver:
> >
> > https://patchwork.freedesktop.org/patch/315291/
> >
> > (This doesn't really belong in devicetree, since it isn't a
> > description of the hardware, so the driver is really the only place to
> > set this.. which is fine because it is about a detail of how the
> > driver works.)
>
> It is more a detail about how the firmware works. IIUC the problem is
> that the firmware initializes the context mappings for the GPU and the
> OS doesn't know anything about that and just overwrites them, causing
> the firmware GPU driver to fail badly.
>
> So I think it is the task of the firmware to tell the OS not to touch
> the devices mappings until the OS device driver takes over. On x86 there
> is something similar with the RMRR/unity-map tables from the firmware.
>

Bjorn had a patchset[1] to inherit the config from firmware/bootloader
when arm-smmu is probed which handles that part of the problem.  My
patch is intended to be used on top of his patchset.  This seems to me
like the best solution, if we don't have control over the firmware.

BR,
-R

[1] https://www.spinics.net/lists/arm-kernel/msg732246.html
