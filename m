Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82BCC2EEFC8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 10:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727396AbhAHJke (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 04:40:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727502AbhAHJkd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 04:40:33 -0500
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25E6EC0612F8
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 01:39:53 -0800 (PST)
Received: by mail-ua1-x931.google.com with SMTP id a31so3225773uae.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 01:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MKIqx1+T0s1Uz0l5lnlu8sHB7ChPsrqsSGBnv7F9PHA=;
        b=UBXFpKBPQH3ou6FxAvLQLc27q5ERw+zDe12JgeEF0sc1yNF5yd8c8SKpHNRNRBvrHE
         Ujl/yKitGr6inPulvKBnpcvgvMiJj5MgM6fTHHoJJKGyi1RxmEJEoweFLnwuAmeGOTcr
         q55XMeoeroQzwVquOumpNkBczYuG6X1H3plxHx78ZX6F0enhhVfWKgcssOcgxp8Og7ok
         XLAoN43AJuYjR60BMZRzVfWlgj4tfUSSo6zgyzlo49F+YFhXpTZE98gbnWEAggHU8N3N
         6dwT+PoQZHJaWEMzmO7mSboGqOb/d+Jn8MX1JzBu2sov7DP4U6qXpZEsvnnUhvd8YL+J
         BXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MKIqx1+T0s1Uz0l5lnlu8sHB7ChPsrqsSGBnv7F9PHA=;
        b=kilrq07geiBZ6Cw+4BnJEV/Zz45CH8+jGfaAF2cTNbMVypoBCjDYh1u2Ba+7FjVq2e
         lAZvuUzlDzgcubH0L+4Qx4ZQG6yRzY3LDDa7zA1MCp44/9WC8rY+lR2aaPLcUvnmdz9k
         kmb4zeMHiwJoVC2dfOOPdn7EFRjxqZO1KnpyS4GdrN5hCTtfAamBmCQutFmwBW+ltLNY
         WK17GWmIf+gJkpVlfs1lGhYZlaqQkotJxcLVhqIj6X2w5U216tGhKoOJ+u7wH4+Xlj7c
         vV9Mg7jKLEBxbtClOtEptho4CHwtJR4WcK6/v0IQKYBY1MyLcR/5gPr9wOrS00JRRDbD
         8sCA==
X-Gm-Message-State: AOAM5315zvaGH7+i3k+co6UzkyZB30MY4SJumb+wB8d7sXSXTv9e5PPW
        EVMxWhNFbssiRoQKFxjpSJ3hPUW+wAoyEGtn77c5pQ==
X-Google-Smtp-Source: ABdhPJyO9MNZw7maYb1cVWdBXnv9cfRCWkRHXPDTUPH7WUCo66etmetwEj+m+TRNoV3tGPk704BJrjZLHzt3rOmWixU=
X-Received: by 2002:ab0:4597:: with SMTP id u23mr2241423uau.100.1610098792062;
 Fri, 08 Jan 2021 01:39:52 -0800 (PST)
MIME-Version: 1.0
References: <20201224111210.1214-1-rojay@codeaurora.org> <20201224111210.1214-2-rojay@codeaurora.org>
 <20201231154929.GA1846089@robh.at.kernel.org>
In-Reply-To: <20201231154929.GA1846089@robh.at.kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 8 Jan 2021 10:39:15 +0100
Message-ID: <CAPDyKFp_mZOW45RFN6_2P8skjY4_1PfVun6YZ_6a+edKHmBOeg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: power: Introduce 'assigned-performance-states'
 property
To:     Rob Herring <robh@kernel.org>
Cc:     Roja Rani Yarubandi <rojay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, parashar@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 31 Dec 2020 at 16:49, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Dec 24, 2020 at 04:42:08PM +0530, Roja Rani Yarubandi wrote:
> > While most devices within power-domains which support performance states,
> > scale the performance state dynamically, some devices might want to
> > set a static/default performance state while the device is active.
> > These devices typically would also run off a fixed clock and not support
> > dynamically scaling the device's performance, also known as DVFS
> > techniques.
> >
> > Add a property 'assigned-performance-states' which client devices can
> > use to set this default performance state on their power-domains.
> >
> > Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> > ---
> >  .../bindings/power/power-domain.yaml          | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/power/power-domain.yaml b/Documentation/devicetree/bindings/power/power-domain.yaml
> > index aed51e9dcb11..a42977a82d06 100644
> > --- a/Documentation/devicetree/bindings/power/power-domain.yaml
> > +++ b/Documentation/devicetree/bindings/power/power-domain.yaml
> > @@ -66,6 +66,18 @@ properties:
> >        by the given provider should be subdomains of the domain specified
> >        by this binding.
> >
> > +  assigned-performance-states:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description:
> > +       Some devices might need to configure their power domains in a default
> > +       performance state while the device is active. These devices typcially
> > +       would also run off a fixed clock and not support dynamically scaling
> > +       the device's performance, also known as DVFS techniques. Each cell in
> > +       performance state value corresponds to one power domain specified as
> > +       part of the power-domains property. Performance state value can be an
> > +       opp-level inside an OPP table of the power-domain and need not match
> > +       with any OPP table performance state.
>
> Couldn't this just be an additional cell in 'power-domains'?

Right. Some SoCs already use the cell to specify per device SoC
specific data [1].

Although, I am wondering if we shouldn't consider
"assigned-performance-states" as a more generic binding. I think it
would be somewhat comparable with the existing "assigned-clock-rates"
binding, don't you think?

[...]

Kind regards
Uffe

[1]
Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
