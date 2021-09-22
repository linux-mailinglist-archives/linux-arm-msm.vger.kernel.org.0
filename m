Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1956E413EA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 02:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbhIVAgS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 20:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbhIVAgS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 20:36:18 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 397BCC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 17:34:49 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id o66so1795752oib.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 17:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Lq1i3UmZIVXzbCnFsiSy3KOz8kbH/EuovVzUT4ns1D0=;
        b=Yq/MH9PMZpBhvcQBvTOVQ0P4eSwOVVQsTvp44tfDweT6xI9jjYGAoeWQJyQPVtofuP
         iFVfGLUL7fOTo4aLypTdN/BbJ0qiQYWBwffsaEU2F21Spa1ORUZXlKAjV3or6ta7Kwhv
         YOF8ASsA5MmRVPbOGnRmba66su4Y2kksQo4cE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Lq1i3UmZIVXzbCnFsiSy3KOz8kbH/EuovVzUT4ns1D0=;
        b=jblzhE90UyuVtn8LvUxQB4alGHaq8Fn4jrOdxTbd+tekWbKJujcCaFINR7ZFjlu/S/
         3N00VzUIBZUgYtKVYN/JYbQDklcVW4tEtFIKoQhvV7jXc46O6WRxVcRX35rcp1A/82IP
         lfpZh6t2F8Rq/b6wvL62HE+WoUvaw5gqOk9wv1iRJAqjAOLIRfroB5UPiOXDnKjsFJkb
         4FestTa+pXNRg7/R21S+Q9r8gIBn04m3wqTRl64XGBQ5RwZu0ccfJYpxX3Y/yjDCSlQB
         pfRg5SgDgFQnEPkcCZLXJRF3GN6DO6W2MUrKjwLPJW5F3w6mc7Jke7l1NkH4f95M2MrB
         CUvA==
X-Gm-Message-State: AOAM530S5tGe0EBw+FsrztZtEtPtglrVHM0uYvDujX/nDbMQnVEOH2e7
        kc+a9jZ8teVDHf6T7K+BoxdLdUKi3vrwvG/VMlJsNg==
X-Google-Smtp-Source: ABdhPJwdLJjIONGn3D9JF8ZDXJrESI3tWOPGXojBwG3mX9Bh04SHpvBI8gxogahpMqIWmocDy2NKjT2f2BWQKICPDJA=
X-Received: by 2002:aca:1a11:: with SMTP id a17mr5902958oia.164.1632270888594;
 Tue, 21 Sep 2021 17:34:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Sep 2021 17:34:48 -0700
MIME-Version: 1.0
In-Reply-To: <YUo2ZzQktf2iSec/@gerhold.net>
References: <20210921152120.6710-1-stephan@gerhold.net> <20210921152120.6710-2-stephan@gerhold.net>
 <CAE-0n51Ukr0FMhzHotrGnrJjE3=w2X_u4ukc1KC_HpjjsUdNfg@mail.gmail.com> <YUo2ZzQktf2iSec/@gerhold.net>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 21 Sep 2021 17:34:48 -0700
Message-ID: <CAE-0n50sQRDufGuLB-KgqSquzL84isPy+EeSMkDigg25DLT54Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8916: Drop underscore in node name
To:     Stephan Gerhold <stephan@gerhold.net>, robh+dt@kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephan Gerhold (2021-09-21 12:45:43)
> On Tue, Sep 21, 2021 at 11:20:18AM -0700, Stephen Boyd wrote:
> > Quoting Stephan Gerhold (2021-09-21 08:21:19)
> > > Using underscores in device tree nodes is not very common.
> > > Additionally, the _region suffix in "smem_region@..." is not really
> > > useful since it's obvious that it describes a reserved memory region.
> > >
> > > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > > ---
> > >  arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > index 5551dba2d5fd..95dea20cde75 100644
> > > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > > @@ -41,7 +41,7 @@ tz-apps@86000000 {
> > >                         no-map;
> > >                 };
> > >
> > > -               smem_mem: smem_region@86300000 {
> > > +               smem_mem: smem@86300000 {
> >
> > Shouldn't that be smem_mem: memory@86300000? Node names should be
> > generic.
> >
>
> The way I read it, the DT schema [1] and device tree specification [2]
> interprets the generic name recommendation a bit different here:
>
> > Following the generic-names recommended practice, node names should
> > reflect the purpose of the node (ie. "framebuffer" or "dma-pool").
>
> "framebuffer" or "dma-pool" would also be "memory", yet they suggest
> a name reflecting the purpose instead. The purpose of the node is
> "smem", it's not just arbitrary "memory".

I don't think most people know what 'smem' means. Maybe if the node name
was 'shared-memory' it would be OK.

>
> However, my main problem with using memory@ here is that it actually
> causes new dtbs_check errors:
>
> apq8016-sbc.dt.yaml: memory@86000000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
> apq8016-sbc.dt.yaml: memory@86300000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
> apq8016-sbc.dt.yaml: memory@86400000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
> apq8016-sbc.dt.yaml: memory@86500000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
> apq8016-sbc.dt.yaml: memory@86680000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
> apq8016-sbc.dt.yaml: memory@86700000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
> apq8016-sbc.dt.yaml: memory@867e0000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
> apq8016-sbc.dt.yaml: memory@86800000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
> apq8016-sbc.dt.yaml: memory@89300000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
> apq8016-sbc.dt.yaml: memory@89900000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
> apq8016-sbc.dt.yaml: memory@8ea00000: 'device_type' is a required property (From schema: dtschema/schemas/memory.yaml)
>
> Looks like it thinks this is a definition of physical memory now.
> I would rather not add more errors. :)

Got it. Doesn't seem right that the schema is checking for memory node
names anywhere except for in the root of the tree. Rob? I also see that
the reserved memory binding could do with some YAML conversion.
