Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8851C579
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2019 10:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfENI6l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 May 2019 04:58:41 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:44094 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbfENI6l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 May 2019 04:58:41 -0400
Received: by mail-vs1-f66.google.com with SMTP id j184so265031vsd.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2019 01:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MLSCBYZPRnRjPoWF2biQlF2E7iPn0TGMhmM3d3DWvJk=;
        b=q8lxVzyzoXF98rEkWk5wquphTuXEip2RN7SWX+ji6R038d7laVaDsxolVn4Lifr3L4
         nDasZXSsGt9J3K/Dma2aHgNQXDd5PmwH0TmaWaaa1ielTpN5NpWI1KuO6GzoTid1P87V
         W+5QUyaNPx3uISiPfkM3GUlQFtkj6y4HL+j6jrliPgZKgTNgOWzvACEQGlWMm/hygShh
         Hk/tX4mdGKpaW3Nb3aJUV384CKlCitHayN9Zw9WXdnfRaWYon4saa+Za6XYQRGPeEULH
         F5R1ANYbch30daXqS7q1vJFNPngTOJVKDjhVvf3ixaqY34sSs44//FI0jLdvax1IQdpR
         9YTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MLSCBYZPRnRjPoWF2biQlF2E7iPn0TGMhmM3d3DWvJk=;
        b=rQMA7rSrpuGgm+VyWeralLUQzRUOMigwFz2i1FpCop30dJqK2LdOYcrW9FyldGBYaS
         j7kds+N98zwFyeL0Na6+ZvGyLqX5SmcW1paOxGrPd0FmtpFX6OXNNCm9nOlOcJ8mWYgt
         nbI5X5W0qHri6l/X2M8dZZVN4hJ0uSSvvAbmOZOHjB/XVNqEUw8ULe28eqXw49g+KFmW
         i44lwKHFjA2k8Q2z34cbbYQxi4LoOAQHIx4pvh9eVladIfXkb8v2MeN8Mbjuhtgul/2x
         RprXFXdxy4pt0AHpyi7jI7LmRqBQSYtohYRisIKv0aONIgfOdCr5tRi613V83szZcfqa
         Futw==
X-Gm-Message-State: APjAAAXWCN2bVlxNu5kY5ytH7Pr5varOQijCu2TWB9LjDWipQbZLHdif
        3PWYIGeJpKYTzf0qWSNUt9bCrQK5IUCuQv8y0CfApg==
X-Google-Smtp-Source: APXvYqwycH28jEcSrDkjPUkWW/Zcz25ycb6BQFN7+w/8A+3I/hQsVj2ek7HBD2590jjCbU0ruGu2wcP3lpcGlb4hlPI=
X-Received: by 2002:a67:ebc5:: with SMTP id y5mr13449930vso.34.1557824320126;
 Tue, 14 May 2019 01:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190513192300.653-1-ulf.hansson@linaro.org> <CAJZ5v0gbK3AFCVC1b9LyXeMOM8fKR1=ECXZwaeSYRSqcK0UgYA@mail.gmail.com>
In-Reply-To: <CAJZ5v0gbK3AFCVC1b9LyXeMOM8fKR1=ECXZwaeSYRSqcK0UgYA@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 14 May 2019 10:58:04 +0200
Message-ID: <CAPDyKFpU3u248Gi+FnrVdY-EWXJQuu14uNV9d3Xs0W-K-EMEhg@mail.gmail.com>
Subject: Re: [PATCH 00/18] ARM/ARM64: Support hierarchical CPU arrangement for PSCI
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Raju P . L . S . S . S . N" <rplsssn@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Kevin Hilman <khilman@kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Souvik Chakravarty <souvik.chakravarty@arm.com>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 14 May 2019 at 10:08, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Mon, May 13, 2019 at 9:23 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > This series enables support for hierarchical CPU arrangement, managed by PSCI
> > for ARM/ARM64. It's based on using the generic PM domain (genpd), which
> > recently was extended to manage devices belonging to CPUs.
>
> ACK for the patches touching cpuidle in this series (from the
> framework perspective), but I'm assuming it to be taken care of by
> ARM/ARM64 maintainers.

Thanks for the ack! Yes, this is for PSCI/ARM maintainers.

BTW, apologize for sending this in the merge window, but wanted to
take the opportunity for people to have a look before OSPM Pisa next
week.

Kind regards
Uffe
