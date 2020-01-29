Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C75A914D3FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 00:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbgA2Xu0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 18:50:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:58824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726401AbgA2Xu0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 18:50:26 -0500
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6BDF3207FD;
        Wed, 29 Jan 2020 23:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580341824;
        bh=i1b3hLCH1Gs+/tr3OV841mRGkpkDAEOISeaQCZyZrOQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=k0s5dhP7pq96HKrXmC2chaGr4cxNjbQMFqYnKobzqei9MgqW8lc2kFYhjAp3TlU05
         OLDOnI5zJcSnniudLqJcoQYL85YaE7Q7t7JV/8UzfX5apVPROWhUhX2ds/y404vJlQ
         gU/QI/3KAvkIiMb9cK4l1IwPvXOKjqXcLTF2Xwlo=
Received: by mail-qt1-f171.google.com with SMTP id t13so1034491qto.3;
        Wed, 29 Jan 2020 15:50:24 -0800 (PST)
X-Gm-Message-State: APjAAAWATiRLNvHWvZQ9oPuYLnlYgqphvDVVX09li8ctVPG3pqwB7NkR
        FtLB/vvWTPhSPnL96vSQPjneBdl0d68vhH/vHA==
X-Google-Smtp-Source: APXvYqweOtFMOBZ4ZqSFpkFdqQDXTy+Ds72RuExd6hhx+wJrqGomLaKLz02DcLzs8hWOlY/luUq8LrojYSvrYGLgL5I=
X-Received: by 2002:aed:2344:: with SMTP id i4mr2025771qtc.136.1580341823509;
 Wed, 29 Jan 2020 15:50:23 -0800 (PST)
MIME-Version: 1.0
References: <20200129132313.1.I4452dc951d7556ede422835268742b25a18b356b@changeid>
 <CAL_JsqJk1NZSDAXgqc-CS9a1UCmNYPhC-LwjPUZaX2oK=EtHzQ@mail.gmail.com> <CAD=FV=XLq4-EdsuKnDjuc3-6P3i6o-tV5MJbdFbvAscF_ouOpg@mail.gmail.com>
In-Reply-To: <CAD=FV=XLq4-EdsuKnDjuc3-6P3i6o-tV5MJbdFbvAscF_ouOpg@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 29 Jan 2020 17:50:12 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLVaJMidm2QcpmxXeT+Q+uU8esm1shdRs3BVoeRYqhJng@mail.gmail.com>
Message-ID: <CAL_JsqLVaJMidm2QcpmxXeT+Q+uU8esm1shdRs3BVoeRYqhJng@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clk: qcom: Fix self-validation, split, and
 clean cruft
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Abhishek Sahu <absahu@codeaurora.org>, sivaprak@codeaurora.org,
        anusharao@codeaurora.org, Sricharan <sricharan@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 29, 2020 at 5:26 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Jan 29, 2020 at 2:01 PM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Wed, Jan 29, 2020 at 3:23 PM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > The 'qcom,gcc.yaml' file failed self-validation (dt_binding_check)
> > > because it required a property to be either (3 entries big),
> > > (3 entries big), or (7 entries big), but not more than one of those
> > > things.  That didn't make a ton of sense.
> > >
> > > This patch splits all of the exceptional device trees (AKA those that
> > > would have needed if/then/else rules) from qcom,gcc.yaml.  It also
> > > cleans up some cruft found while doing that.
> > >
> > > After this lands, this worked for me atop clk-next:
> > >   for f in \
> > >     Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml \
> > >     Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml \
> > >     Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml \
> > >     Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml \
> > >     Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml \
> > >     Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml \
> > >     Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml \
> > >     Documentation/devicetree/bindings/clock/qcom,gcc.yaml; do \
> > >       ARCH=arm64 make dt_binding_check DT_SCHEMA_FILES=$f; \
> > >       ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=$f; \
> > >   done
> >
> > Note that using DT_SCHEMA_FILES may hide some errors in examples as
> > all other schemas (including the core ones) are not used for
> > validation. So just 'make dt_binding_check' needs to pass (ignoring
> > any other unrelated errors as it breaks frequently). Supposedly a
> > patch is coming explaining this in the documentation.
>
> That seems like it's going to be a huge pain going forward, but OK.

Use of DT_SCHEMA_FILES hiding problems or having to run 'make
dt_binding_check' on everything?

I could probably rework things such that you can check a single
binding example against all schema, but dtbs still get validated by
just a single schema.

The other option is proper makefiles in every directory so you can do
'make Documentation/devicetree/bindings/clk/'. But like compiling a
directory, that doesn't catch all issues (linking).

> I
> kept running "dtbs_check" with the DT_SCHEMA_FILES since I guess this
> was OK?  Then I ran this atop next-20200129:

Yes, that's really where DT_SCHEMA_FILES is most useful IMO.

> # Delete broken yaml:
> rm Documentation/devicetree/bindings/pci/intel-gw-pcie.yaml

Been waiting on the fix to be applied since Dec...

> ARCH=arm64 make dt_binding_check | grep 'clock/qcom'
>
> ...and that seemed OK to me.  I've updated the commit message to
> include what I did.  Hopefully it's right.

Probably is. There are cases where a new schema breaks another file's
example. If someone has a gcc node in another example for example.

Rob
