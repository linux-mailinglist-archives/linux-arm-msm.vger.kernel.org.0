Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C039F0CE9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 04:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730752AbfKFDSj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 22:18:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:51890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730576AbfKFDSi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 22:18:38 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8C18C2053B;
        Wed,  6 Nov 2019 03:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573010317;
        bh=794v0ru8pfalS+8Pyn18QoBVERGFnv+vgCcy8vjcww4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=h4+X6NnESnFUg7hSGbT1qji0fnzSSyx2iXJY2mCnwfnAuYQe1ssCMb3PYIL+aPRy4
         r42LTaTdD0fNUJoKCRiky6GIjL9rbgUsGCoPn5bQFbtCo0qQ9mG5pf/A2RK6+M51E3
         C/4a+yVOEYe4PXxvHTOqR6XEHcFq4n7Ww72WFhVo=
Received: by mail-qt1-f178.google.com with SMTP id p20so13910367qtq.5;
        Tue, 05 Nov 2019 19:18:37 -0800 (PST)
X-Gm-Message-State: APjAAAVWmKHdvEaFgZLRdy2IeAQp2ehY1U6pIXJJ7wycsTmxnVK8/u3d
        My+2Z1u8quJN3g6EEzrDsta8zoVuWDIwLP3QgA==
X-Google-Smtp-Source: APXvYqx/MDqiFs4boZftGQ4Sm3LD1j9ie9A1PR+9tSRnYrAzeyJ63l67XS86a0hZ+oVQ8PeNFdWmOuEziMGHCusZdFg=
X-Received: by 2002:ac8:458c:: with SMTP id l12mr483091qtn.300.1573010316820;
 Tue, 05 Nov 2019 19:18:36 -0800 (PST)
MIME-Version: 1.0
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org>
 <1572524473-19344-3-git-send-email-tdas@codeaurora.org> <20191106002604.A1BC72087E@mail.kernel.org>
In-Reply-To: <20191106002604.A1BC72087E@mail.kernel.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 5 Nov 2019 21:18:24 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+dihzR7Wy+9kbz+A8tJ8LCpUcci6w0oW7SxBML4jX_Fw@mail.gmail.com>
Message-ID: <CAL_Jsq+dihzR7Wy+9kbz+A8tJ8LCpUcci6w0oW7SxBML4jX_Fw@mail.gmail.com>
Subject: Re: [PATCH v1 2/7] dt-bindings: clock: Add YAML schemas for the QCOM
 GPUCC clock bindings
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 5, 2019 at 6:26 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Taniya Das (2019-10-31 05:21:08)
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> > new file mode 100644
> > index 0000000..96aaf36
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
>
> Can it be GPL2 or BSD? I think Rob is asking for that sort of license on
> these files.

I do, but only on new bindings unless we determine relicensing is
okay. Though here it doesn't look like much is copied over.

> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/bindings/clock/qcom,gpucc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Graphics Clock & Reset Controller Binding
> > +
> > +maintainers:
> > +  - Taniya Das <tdas@codeaurora.org>
> > +
> > +description: |
> > +  Qualcomm grpahics clock control module which supports the clocks, resets and
> > +  power domains.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,sdm845-gpucc
> > +      - qcom,msm8998-gpucc
>
> Sort please.

When you get tired of telling people to do this we can make the
tooling do it. :) Shouldn't be too hard. The majority of the work is
probably fixing the existing cases that aren't sorted.

Rob
