Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF5C93DD488
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 13:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232553AbhHBLUP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 07:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbhHBLUO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 07:20:14 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3916C061796
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Aug 2021 04:20:04 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id bg4so9303074vsb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Aug 2021 04:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/JAmS8wvVy4y4SnKnMeVsMtIImqK8tLg7glG0zt3gSc=;
        b=dsK2597aaj0CgIdvqVQkHR795RotwvG5A4/u70kJ0TJVekQ7IvIH1e5/Y6SgOgYA06
         RK6naf1sK2M4kitQvktRTKv4M7MdN4gs+KXuymR1kkRXlKp76D+mptGYPvjrSGVS/vBc
         /4nHen2KTAUvuu4sZxhkLzEuR1V5aIBapA2oxZbyAJ+ABjH1cRlfKYyqYaIGpJ0PNUEh
         n/NbNcUYOfXE8IxJW94di4VPuLDdopPmzVRInWH5fzJnyEeIhju0MN7hzd4exLMUI1L+
         E9WKFdhhu4Ky1IkFxHqS3XtbnnlRnm1F5jGZtYasXlwNamLCMusJ1YuVAE5qeFkadXF7
         cCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/JAmS8wvVy4y4SnKnMeVsMtIImqK8tLg7glG0zt3gSc=;
        b=m1qJXulMPxpy9Yl9UaVuJFNSSMlkS81ZTVX/5PYBh28qiGY9HvfK7U1eUobDVTshg5
         ZC/RQXuxXbK6rtVXuKY+etvhfQj5iLWelLwg+UOzyI8pEp3u1z4237g45/Y8/9tabLhp
         Pm5yakEdz1lo53r8d1A/PecepniX2DzFuD+BKDFlsAbCid89CuFDhBeOcC/SDRXR12/n
         6E5C1/t19Fe7zx4UhndOjy/hlk3ZU7KlXUseS1boZAuCB0GzTLJ6QGgJrOfuLcWSAc+Z
         amUx1aeAGLNnYbos/7pvhSvf1u/YaUAo6YQLnI2milS896DXGY19swj9Xp0H5Ksvzb4d
         z+aQ==
X-Gm-Message-State: AOAM5338bJVgNVAH4ih8CN9xf/Rl3Zxi03oX0MhZ674WTfUKRfthMvZg
        BsSMtCfx3D+0kYU9NWPA9HPSrHQwVmDpnnJGJ8mp8w==
X-Google-Smtp-Source: ABdhPJzJHIgAeY0XPVt6k83LXFkjn4Bx2pIT8VR1WYLScF44QZW8nvELCz+m3nbWpUAQ+jdm76UPm+2TjUGdq7I+Fq0=
X-Received: by 2002:a67:7c14:: with SMTP id x20mr830130vsc.42.1627903203796;
 Mon, 02 Aug 2021 04:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210521134437.v2.1.Id1c70158722750aec0673d60c12e46a9c66bbfed@changeid>
 <CAD=FV=X8xgn=ueyryFZVA-VNLEU_sk8H29D08JaEpw2Qh2OFqQ@mail.gmail.com>
In-Reply-To: <CAD=FV=X8xgn=ueyryFZVA-VNLEU_sk8H29D08JaEpw2Qh2OFqQ@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 2 Aug 2021 13:19:27 +0200
Message-ID: <CAPDyKFp_-mhb0i6oC7FxY5F_-206VZPBdTyBQyyd7rSnrHBUJg@mail.gmail.com>
Subject: Re: [PATCH v2] PM: AVS: qcom-cpr: Use nvmem_cell_read_variable_le_u32()
To:     Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Niklas Cassel <nks@flawful.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 24 Jul 2021 at 01:05, Doug Anderson <dianders@chromium.org> wrote:
>
> Rafael / Bjorn,
>
> On Fri, May 21, 2021 at 1:45 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > Let's delete the private function cpr_read_efuse() since it does the
> > basically the same thing as the new API call
> > nvmem_cell_read_variable_le_u32().
> >
> > Differences between the new API call and the old private function:
> > * less error printing (I assume this is OK).
> > * will give an error if the value doesn't fit in 32-bits (the old code
> >   would have truncated silently).
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > I haven't done any more than compile-test this. Mostly I'm just
> > writing this patch because it helped provide inspiration for the
> > general API function.
> >
> > Changes in v2:
> > - Resending v1 as a singleton patch; dependency is merged in mainline.
> >
> >  drivers/soc/qcom/cpr.c | 43 +++++-------------------------------------
> >  1 file changed, 5 insertions(+), 38 deletions(-)
>
> Are either of you interested in landing this? I guess Rafael landed
> most of the recent changes to this driver, but it used to be under the
> 'power' directory. Now that it's under 'drivers/soc/qcom' maybe it
> should go through Bjorn's tree?

Yes, that was exactly the intent of moving the files. I guess Bjorn
has simply been busy.

Kind regards
Uffe
