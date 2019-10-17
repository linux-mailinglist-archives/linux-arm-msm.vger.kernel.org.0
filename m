Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B56ADDB157
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2019 17:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407889AbfJQPnr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Oct 2019 11:43:47 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:38158 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407675AbfJQPnq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Oct 2019 11:43:46 -0400
Received: by mail-vk1-f193.google.com with SMTP id s72so630928vkh.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2019 08:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9cPCkoWUtN/mgY5EDGDopreFb0szGU5fkwoJ47zwfPo=;
        b=MTHKy8u0XqikOxEYya8246NAjzWcNntEUXhTxkxFVqzTMaYoVEBeZXjNk0FHbzdnKN
         0N3Whx01EUOQi+X52WYuVqZziQ3loO+xUt0O+Bu+bc3wIyCqlFh3X0TC2udeTOyEeDX8
         pGdXdUlSP1FE3aG9PtQ6bgrL5EdUzHXyyMn19xZF9SJ40XnSYyFk3LDzqCiey7VfEYD0
         rng6yXn7zCmTS6aMr67NSuUztzm2JInboiuigxcYTTwP4a49QrjaPeC8bkHSRiTLId6p
         XLpmHTegDAIezM4pqQOuSz0h0+43h9CdDvXoxOPWia4qV8yznSGdO8TZgSWYvZheZfZC
         Ie+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9cPCkoWUtN/mgY5EDGDopreFb0szGU5fkwoJ47zwfPo=;
        b=NRJ7ezocBQ0JJmVE56ylgqSzJJkcjsalOl97uZveWd9EMc3Ek8jum05f2mIAzu+RL1
         rlO3XBmT4chzzwX4gWytrvcjIjVd35ZDCN698QY2CrUjnz3VLe6e3KIO5XkBlPXh+DOI
         ux+zj4oXUBAF/h4oCSVEcppHhPWS2xQVS33GlfG2DfnEE1QtS+GfFohSQFJlFwtvEk21
         iYn1hZW0FIMIxU3hYn2y4L8Eyesix54A6jpx1e4QH2ph+Zj1hRb2EGqyuY+eiuJOPlmB
         psI01HaVTnJFnC0tslcJ2/CLoWy/z8RueZU4rfsUtA95sMB3LD0/PRkdJHFA/VF6Pqjw
         vZcA==
X-Gm-Message-State: APjAAAUzWxq1R6tctAedIEBl8mrVTe9NdqzNq1U2z7BzatMNFVFkb4OK
        o9l94u8Fi1s0VG0ApACi6i+HXfcNIiQ+llxXOlzQ7w==
X-Google-Smtp-Source: APXvYqzCMxkr3FQElBCVQfH8au6MF/yRHYSwhLVuExQHapPedkdyeqQ70PUUZ9KNUkOTqzAiQVBqcfLfYi3jP+lvsIc=
X-Received: by 2002:a1f:b202:: with SMTP id b2mr2307071vkf.59.1571327024388;
 Thu, 17 Oct 2019 08:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <1571254641-13626-1-git-send-email-thara.gopinath@linaro.org>
 <1571254641-13626-7-git-send-email-thara.gopinath@linaro.org>
 <CAPDyKFqcKfmnNJ7j4Jb+JH739FBcHg5NBD6aR4H_N=zWGwm1ww@mail.gmail.com> <5DA88892.5000408@linaro.org>
In-Reply-To: <5DA88892.5000408@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 17 Oct 2019 17:43:08 +0200
Message-ID: <CAPDyKFpYG7YADb6Xmm=8ug5=5X3d1y+JdkRvrnvtroeV3Yj62Q@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] dt-bindings: soc: qcom: Extend RPMh power
 controller binding to describe thermal warming device
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     Eduardo Valentin <edubezval@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, amit.kucheria@verdurent.com,
        Mark Rutland <mark.rutland@arm.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux PM <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 17 Oct 2019 at 17:28, Thara Gopinath <thara.gopinath@linaro.org> wrote:
>
> Hello Ulf,
> Thanks for the review!
>
> On 10/17/2019 05:04 AM, Ulf Hansson wrote:
> > On Wed, 16 Oct 2019 at 21:37, Thara Gopinath <thara.gopinath@linaro.org> wrote:
> >>
> >> RPMh power controller hosts mx domain that can be used as thermal
> >> warming device. Add a sub-node to specify this.
> >>
> >> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> >> ---
> >>  Documentation/devicetree/bindings/power/qcom,rpmpd.txt | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> >> index eb35b22..fff695d 100644
> >> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> >> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
> >> @@ -18,6 +18,16 @@ Required Properties:
> >>  Refer to <dt-bindings/power/qcom-rpmpd.h> for the level values for
> >>  various OPPs for different platforms as well as Power domain indexes
> >>
> >> += SUBNODES
> >> +RPMh alsp hosts power domains that can behave as thermal warming device.
> >> +These are expressed as subnodes of the RPMh. The name of the node is used
> >> +to identify the power domain and must therefor be "mx".
> >> +
> >> +- #cooling-cells:
> >> +       Usage: optional
> >> +       Value type: <u32>
> >> +       Definition: must be 2
> >> +
> >
> > Just wanted to express a minor thought about this. In general we use
> > subnodes of PM domain providers to represent the topology of PM
> > domains (subdomains), this is something different, which I guess is
> > fine.
> >
> > I assume the #cooling-cells is here tells us this is not a PM domain
> > provider, but a "cooling device provider"?
> Yep.
> >
> > Also, I wonder if it would be fine to specify "power-domains" here,
> > rather than using "name" as I think that is kind of awkward!?
> Do you mean "power-domain-names" ? I am using this to match against the
> genpd names defined in the provider driver.

No. If you are using "power-domains" it means that you allow to
describe the specifier for the provider.

From Linux point of view, it means you can use dev_pm_domain_attach()
to hook up the corresponding device with the PM domain.

Using "power-domain-names" is just to allow to specify a name rather
than an index, which makes sense if there is more than one index.
Perhaps you can state that the "power-domain-names" should be there
anyway, to be a little bit future proof if ever multiple index
(multiple PM domains).

Kind regards
Uffe
