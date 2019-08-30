Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDDB5A35C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2019 13:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbfH3LdG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Aug 2019 07:33:06 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:45447 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727620AbfH3LdG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Aug 2019 07:33:06 -0400
Received: by mail-ua1-f68.google.com with SMTP id j6so2180237uae.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2019 04:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JH8DOOwQtK+X7/b2daR7scxGJ6hjfD5whpOG26LXoDw=;
        b=pvpMdZNedhH1QV+sjozPkOnux4HLnj+LrfUwCIUPHZeKiDux6LH9ehglxbbUGDXs9f
         Ni9mO+JvsAt6qPEw0qayCxsa+bIqiFhxn4J6p0ZWpEmHHk6kA9ctfT6zWcH8z/Wu9cLu
         jEy4WymLK2uLBoeCX4kMxOflJGzYGFHOvzLNykjaSSFmTns/YlOkbDGkpAD1h1WE+Wy2
         kEcp2aVWfrDMiijlNScHwfa+8znc56KTQ5TJry8CYTccpsYv5CYjZOfK19bIXu8y4zoz
         oHq2/Nvg2J8yQ3/EdB+o+8Z3FivsvWNKu+cmLLT1bFbricqFrghabe4iWl1XyTtg562Q
         PdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JH8DOOwQtK+X7/b2daR7scxGJ6hjfD5whpOG26LXoDw=;
        b=jwWDal9ouK0COdZmd1xXqWkskGirlCPM8WXVUuEP2/PMSL4mnbHxPVslyCmJtTmPOY
         uXDzJf4sm8m2NDwFw+czAPTpftB8lHBd8aoNVytxYB5aqaUVlhw7dR71N6XePuFbpa5j
         xWJqV137wM/je82IRurK8a+lKG4sRxvzi7Z/NZsupmpxswqI3DYaZGuyPOI17Xpm0r1h
         yAP5UODaLaFBZBYpASL1kx3TnsfZK4jineAxWXpeCn4I7BoPI2oyDa8VhUwQGtk1SF7T
         ltnFgi0ApVquNbygVOm30pN1jMu1kVP/pVq7xp2pHJlsNAZpu2woUcYA/Mg2XvH6UBiI
         vJZg==
X-Gm-Message-State: APjAAAXOrLoJlCS2hrDYJVFcUia7UT6DPhGKQiUjNQUDAhJkQm+O+srd
        QZdBtlxGk1tn4u/OL5Ecdzn/Fgmt6JBX18RuZ5BD+f7tI0XEhUhX
X-Google-Smtp-Source: APXvYqwyAJiFOtO3nVw0kssYOlaNRtyRQw23dVLbV/BrLdfGSdqNBeAYzUS2CZDujoGL8gkYKGoz2tZmIKXnUBI6x2E=
X-Received: by 2002:ab0:ed:: with SMTP id 100mr2070335uaj.48.1567164784854;
 Fri, 30 Aug 2019 04:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1566907161.git.amit.kucheria@linaro.org>
 <66ac3d3707d6296ef85bf1fa321f7f1ee0c02131.1566907161.git.amit.kucheria@linaro.org>
 <5d65cbe9.1c69fb81.1ceb.2374@mx.google.com> <CAP245DWWKsZBHnvSqC40XOH48kGd-hykd+fr-UZfWTmvuG2KaA@mail.gmail.com>
 <5d67e6cf.1c69fb81.5aec9.3b71@mx.google.com> <CAP245DVjgnwGn5rUgbYrkBOi3vtyShz0Qbx_opx80xiOV7uXeA@mail.gmail.com>
In-Reply-To: <CAP245DVjgnwGn5rUgbYrkBOi3vtyShz0Qbx_opx80xiOV7uXeA@mail.gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Fri, 30 Aug 2019 17:02:54 +0530
Message-ID: <CAHLCerMmBmS-59eywxkUJ+5-zSccx8Twx2=NELgBgShYhM7TOw@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] dt: thermal: tsens: Document interrupt support
 in tsens driver
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Brian Masney <masneyb@onstation.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 29, 2019 at 10:04 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:
>
> On Thu, Aug 29, 2019 at 8:23 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Amit Kucheria (2019-08-29 01:48:27)
> > > On Wed, Aug 28, 2019 at 6:03 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > > Quoting Amit Kucheria (2019-08-27 05:14:03)
> > > > > Define two new required properties to define interrupts and
> > > > > interrupt-names for tsens.
> > > > >
> > > > > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/thermal/qcom-tsens.txt | 8 ++++++++
> > > > >  1 file changed, 8 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> > > > > index 673cc1831ee9d..686bede72f846 100644
> > > > > --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> > > > > +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> > > > > @@ -22,6 +22,8 @@ Required properties:
> > > > >
> > > > >  - #thermal-sensor-cells : Should be 1. See ./thermal.txt for a description.
> > > > >  - #qcom,sensors: Number of sensors in tsens block
> > > > > +- interrupts: Interrupts generated from Always-On subsystem (AOSS)
> > > >
> > > > Is it always one? interrupt-names makes it sound like it.
> > > >
> > > > > +- interrupt-names: Must be one of the following: "uplow", "critical"
> > >
> > > Will fix to "one or more of the following"
> > >
> >
> > Can we get a known quantity of interrupts for a particular compatible
> > string instead? Let's be as specific as possible. The index matters too,
> > so please list them in the order that is desired.
>
> I *think* we can predict what platforms have uplow and critical
> interrupts based on IP version currently[1]. For newer interrupt
> types, we might need more fine-grained platform compatibles.
>
> [1] Caveat: this is based only on the list of platforms I've currently
> looked at, there might be something internally that breaks these
> rules.

What do you think if we changed the wording to something like the following,

- interrupt-names: Must be one of the following depending on IP version:
   For compatibles qcom,msm8916-tsens, qcom,msm8974-tsens,
qcom,qcs404-tsens, qcom,tsens-v1, use
              interrupt-names = "uplow";
   For compatibles qcom,msm8996-tsens, qcom,msm8998-tsens,
qcom,sdm845-tsens, qcom,tsens-v2, use
              interrupt-names = "uplow", "critical";
