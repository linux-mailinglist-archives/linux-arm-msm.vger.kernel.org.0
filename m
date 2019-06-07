Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0B31388D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2019 13:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbfFGLT7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 07:19:59 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:42873 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728150AbfFGLT7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 07:19:59 -0400
Received: by mail-vs1-f67.google.com with SMTP id z11so908882vsq.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2019 04:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w4NS4GIrxZAsG8uWe3npx+I+Z55xA/6nCg36DRSR5Ko=;
        b=Zz2BQtszgGrubssBAWgUiM60O2iIdVTkeUPwM80SswhzRCB4r5dCNVh1317J2iTn2E
         nMz8pzbEa/5p0kRJ+WAwNZrBzc02/qm0JDO92qY9J5mFPdb4fJsQ95xElOU6fOfXo0It
         3QLI61/lXGJRWVYH3opjylpwSlgcPfevGBilKS5VMrmI8vXvd62UMLKKdXRhmVKFaBfN
         g6m7CvsQB9SWjxsluHYVbHPaffDmzjUOATrcRORvD7Oe1Vok8NBqXpDxppsSjWsX/NLB
         9nwuy516H/U94g13hV3hg2cAffFDX7oKDf8OJaIiBkwmUdMzRR/4N9/Sc9fQpQp8869g
         tdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w4NS4GIrxZAsG8uWe3npx+I+Z55xA/6nCg36DRSR5Ko=;
        b=ZJgsoruArGL8hhrIVy/8vvlQHEG1cW8jHIAbN8+DOVbloQoGnZapQSFkc2LUy9pJsn
         STxwuqXLp1m23bi+s4Tc0xulX6afaLXk8lz8wTIVqcUyw1ongM8z5DS6GJ+B8ALq2meg
         gi59MFUQSenCI1abe8oySTIP4iSvzrS7SrAhnv9A80EL84E3lkYmZHllz2N8TRrX/EhY
         XZ0kImhKH823AmkXffLlTyb9ulZ1EkM9RQKCk1a+gp+u3eTmBnFZeU5K4lt29phT7+at
         TV9S1BlmU3qBXv0M8X6pxLcIgxCNxf0fkSCC+z94+tLgoJUFvIZ0tqh+TPM9ky6toqwL
         ND3g==
X-Gm-Message-State: APjAAAW28+z2Tv1IH9uM31oroU2TRgttn2T2SoVSdOxBcGHPcf8HNIks
        0O2+Wq/cKXc6qFdaukcibqgI+Vjg5svjAXu2+OTNvg==
X-Google-Smtp-Source: APXvYqxJ5Ur/WKk3GslZ+PDxWcG90kOHvxGy+wa7gr6wMTrbViJkGVWxDEzEvNOs4w39xZTxA1LeReQvz0A4eafkN+o=
X-Received: by 2002:a67:706:: with SMTP id 6mr11498566vsh.200.1559906398328;
 Fri, 07 Jun 2019 04:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190513192300.653-1-ulf.hansson@linaro.org>
In-Reply-To: <20190513192300.653-1-ulf.hansson@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 7 Jun 2019 13:19:22 +0200
Message-ID: <CAPDyKFo6Hkw=6iAq8fCEKARXeOiFp9C8FrJ4D_r0PoDFASSDRg@mail.gmail.com>
Subject: Re: [PATCH 00/18] ARM/ARM64: Support hierarchical CPU arrangement for PSCI
To:     Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "Raju P . L . S . S . S . N" <rplsssn@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
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

Sudeep, Lorenzo, Mark,

On Mon, 13 May 2019 at 21:23, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> This series enables support for hierarchical CPU arrangement, managed by PSCI
> for ARM/ARM64. It's based on using the generic PM domain (genpd), which
> recently was extended to manage devices belonging to CPUs.
>
> The last two DTS patches enables the hierarchical topology to be used for the
> Qcom 410c Dragonboard and the Hisilicon Hikey board. The former uses PSCI OS-
> initiated mode, while the latter uses the PSCI Platform-Coordinated mode. In
> other words, the hierarchical description of the topology in DT, is orthogonal
> to the supported PSCI CPU suspend mode.
>
> Do note, these patches have been posted earlier, but then being part of bigger
> series, which at that point also included the needed infrastructure changes to
> genpd and cpuidle. Rather than continue to carry the old version history,
> which may be a bit confusing, I decided to start over. Although, for clarity,
> the changelog below explains what changes that have been made since the last
> submission was made.

Is there anything I can do to help the review to get going here?

FYI, I hosted a talk about "cluster idle" at OSPM in Pisa a few weeks
ago. There is a couple of slides [1] with flowcharts of how it works,
that may be of interest for you.

Kind regards
Uffe

[...]

[1]
http://retis.sssup.it/ospm-summit/Downloads/01_02-ClusterIdle_UlfHansson.pdf
