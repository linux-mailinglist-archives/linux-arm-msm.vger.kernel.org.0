Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39BB8229A6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 16:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732761AbgGVOm1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 10:42:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:50252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730973AbgGVOm1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 10:42:27 -0400
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 98ABD20787;
        Wed, 22 Jul 2020 14:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595428946;
        bh=wk9uc9EFeU1U4bZjuLI5oT7Ft4gFDxjC68gV7uHyIQU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=R1rLrUiJOsu7Jts6Z0NU9U/t9UkTln7Iy+U9KrDK4pWNWUGAJ3q+e/6imP0mGETbl
         KFjcPQUz+kR+c2XAyWPDQZrrACYdPKJSvD481tqUPAxzo8O59XknINk5F662atu6LQ
         fnV85N6Mm7FSf8goxWEiQoE62PMEWGgIyV5Bky2U=
Received: by mail-oo1-f41.google.com with SMTP id t6so461467ooh.4;
        Wed, 22 Jul 2020 07:42:26 -0700 (PDT)
X-Gm-Message-State: AOAM532K0Qx8WkH6nCpjDJvsoK4lUjZ5KzLGdhkgtiPX7NefUMPfauT0
        /u/ht0drKVN6n2Ow0ipQftk93ZwuwX+EcVXkyA==
X-Google-Smtp-Source: ABdhPJyQP1ZRMVJKJdH4QnM2k+ib1BqJI5c0CwiJkic3VdGrn99f7M/qMgn52dXNwA8FzcQBsfsiYcZtAdhuSLxTl7A=
X-Received: by 2002:a4a:9c0f:: with SMTP id y15mr254900ooj.81.1595428945904;
 Wed, 22 Jul 2020 07:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200622075956.171058-1-bjorn.andersson@linaro.org>
 <20200622075956.171058-2-bjorn.andersson@linaro.org> <CAL_JsqKW+R=rygii7N69o28h5780qx645RhPXGQZ4jw3kHadhw@mail.gmail.com>
 <20200722044615.GR388985@builder.lan>
In-Reply-To: <20200722044615.GR388985@builder.lan>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 22 Jul 2020 08:42:08 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLa9GBtbgN6aL7AQ=A6V-YRtPgYqh6XgM2kpx532+r4Gg@mail.gmail.com>
Message-ID: <CAL_JsqLa9GBtbgN6aL7AQ=A6V-YRtPgYqh6XgM2kpx532+r4Gg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: hwlock: qcom: Migrate binding to YAML
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 21, 2020 at 10:48 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 21 Jul 08:13 PDT 2020, Rob Herring wrote:
>
> > On Mon, Jun 22, 2020 at 1:59 AM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > Migrate the Qualcomm TCSR mutex binding to YAML to allow validation.
> > >
> > > Reviewed-by: Vinod Koul <vkoul@kernel.org>
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >
> > > Changes since v1:
> > > - Actually remove the old binding doc
> > >
> > >  .../bindings/hwlock/qcom-hwspinlock.txt       | 39 --------------
> > >  .../bindings/hwlock/qcom-hwspinlock.yaml      | 51 +++++++++++++++++++
> > >  2 files changed, 51 insertions(+), 39 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
> > >  create mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
> >
> > [...]
> >
> > > diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
> > > new file mode 100644
> > > index 000000000000..71e63b52edd5
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
> > > @@ -0,0 +1,51 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/hwlock/qcom-hwspinlock.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm Hardware Mutex Block
> > > +
> > > +maintainers:
> > > +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> > > +
> > > +description:
> > > +  The hardware block provides mutexes utilized between different processors on
> > > +  the SoC as part of the communication protocol used by these processors.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - qcom,sfpb-mutex
> > > +      - qcom,tcsr-mutex
> > > +
> > > +  '#hwlock-cells':
> > > +    const: 1
> > > +
> > > +  syscon:
> > > +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> > > +    description:
> > > +      Should be a triple of phandle referencing the TCSR mutex syscon, offset
> > > +      of first mutex within the syscon and stride between each mutex.
> > > +
> > > +required:
> > > +  - compatible
> > > +  - '#hwlock-cells'
> > > +  - syscon
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +        tcsr_mutex_block: syscon@fd484000 {
> > > +                compatible = "syscon";
> >
> > 'syscon' alone now generates warnings. Can you drop this node or add a
> > specific compatible.
> >
>
> In the binding examples or in the dts files as well?

Both, but only the examples need to be warning free at this point. So
just dropping the node in the example is enough and you can solve this
for dts files later if you wish.

> The hardware block here is named "TCSR_MUTEX", so the natural compatible
> to add here would be "qcom,tcsr-mutex", but that already has a meaning -
> and the syscon node here doesn't carry all required properties...

So you have 2 nodes pointing to the same h/w? Also a no-no...

> Should we perhaps just remove the split model (syscon and
> qcom,tcsr-mutex as different nodes) from the example and dts files?
> (While maintaining backwards compatibility in the binding and driver)
>
> For the platforms where we have other drivers that needs to poke in this
> syscon it seems to work fine to say:
>         compatible = "qcom,tcsr-mutex", "syscon";

Yes. 'syscon' just means automagically create a regmap.

Rob
