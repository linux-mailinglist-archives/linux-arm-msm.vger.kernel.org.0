Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD2814D4B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 01:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgA3AbX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 19:31:23 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46896 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgA3AbX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 19:31:23 -0500
Received: by mail-pg1-f195.google.com with SMTP id z124so664228pgb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2020 16:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HPkGA3GK3blVdQi8+NIYhn2wAG+9S/XJZPz8vvp4cLo=;
        b=M6sCkftYdw+yxCZolQLugqQz0RovdHNk6PaR2tvafsXWi2mt6BF6Ldsv8+gYeZxs4Y
         T2tWoq+ubinXa1WQmLOIo4QqMm2Q2BQMVBcF/P7CTCZTe0tWMlAeT7Guo+gsC2Doi5Vb
         boHynzCL0K0eWTW5QtPEO9/8SJrt4pkwf46fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HPkGA3GK3blVdQi8+NIYhn2wAG+9S/XJZPz8vvp4cLo=;
        b=t9QE6jksne0d2azdwsIKKK2/LfbeoPUEYc84FF0pTrUv5K0bo5MKzpCbABthAHeiK4
         g3+Pag5LANF8ARBI8gBSecrJhkpjBCtklb+2V1MUm7T9oK9zv537qI+xF2LhsZFBleev
         Z6CODRVUBYxZJFYPriOU6zuXe9iCMi585WM/mYbZCM/phdVx3npqVE4G5wMCm6a9Yu2o
         XTmCxii/SE0USMX5NKPMa52NpNS60/lxpH7UqLA82h5H8E/t72FKExYAI5DUBJdV4MXZ
         vQ8F58i5rw/Q3RSaZ8CSSOsI+TConUuJ979umWlTixtRbdaSD5jrVherE/2XricGpmEw
         eJ+g==
X-Gm-Message-State: APjAAAV0P7Nabkdtw93ckcE9fXG5yTAxJ5kYvfaQZX5XeVrgCf2geHLN
        ZQlAKhLiPfg28VHrlv6GYJ2IjHRZ3hc=
X-Google-Smtp-Source: APXvYqxjP143bhAxuSGke4VdA2FVcKSzGPfPAMCBPTTBimwp2SYt60K5iRpdFyRvpUgElYrsva6otw==
X-Received: by 2002:a63:7b45:: with SMTP id k5mr1838570pgn.43.1580344281802;
        Wed, 29 Jan 2020 16:31:21 -0800 (PST)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com. [209.85.215.175])
        by smtp.gmail.com with ESMTPSA id b130sm3733552pga.4.2020.01.29.16.31.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2020 16:31:21 -0800 (PST)
Received: by mail-pg1-f175.google.com with SMTP id j4so697572pgi.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2020 16:31:21 -0800 (PST)
X-Received: by 2002:a1f:c686:: with SMTP id w128mr1285411vkf.34.1580343865022;
 Wed, 29 Jan 2020 16:24:25 -0800 (PST)
MIME-Version: 1.0
References: <20200129132313.1.I4452dc951d7556ede422835268742b25a18b356b@changeid>
 <CAL_JsqJk1NZSDAXgqc-CS9a1UCmNYPhC-LwjPUZaX2oK=EtHzQ@mail.gmail.com>
 <CAD=FV=XLq4-EdsuKnDjuc3-6P3i6o-tV5MJbdFbvAscF_ouOpg@mail.gmail.com> <CAL_JsqLVaJMidm2QcpmxXeT+Q+uU8esm1shdRs3BVoeRYqhJng@mail.gmail.com>
In-Reply-To: <CAL_JsqLVaJMidm2QcpmxXeT+Q+uU8esm1shdRs3BVoeRYqhJng@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 29 Jan 2020 16:24:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uv-td=PhCSZNsjBB-cQB=vJKLbw_BLbM3B1ORRzuTB5A@mail.gmail.com>
Message-ID: <CAD=FV=Uv-td=PhCSZNsjBB-cQB=vJKLbw_BLbM3B1ORRzuTB5A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clk: qcom: Fix self-validation, split, and
 clean cruft
To:     Rob Herring <robh+dt@kernel.org>
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

Hi,

On Wed, Jan 29, 2020 at 3:50 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Wed, Jan 29, 2020 at 5:26 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Wed, Jan 29, 2020 at 2:01 PM Rob Herring <robh+dt@kernel.org> wrote:
> > >
> > > On Wed, Jan 29, 2020 at 3:23 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > The 'qcom,gcc.yaml' file failed self-validation (dt_binding_check)
> > > > because it required a property to be either (3 entries big),
> > > > (3 entries big), or (7 entries big), but not more than one of those
> > > > things.  That didn't make a ton of sense.
> > > >
> > > > This patch splits all of the exceptional device trees (AKA those that
> > > > would have needed if/then/else rules) from qcom,gcc.yaml.  It also
> > > > cleans up some cruft found while doing that.
> > > >
> > > > After this lands, this worked for me atop clk-next:
> > > >   for f in \
> > > >     Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml \
> > > >     Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml \
> > > >     Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml \
> > > >     Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml \
> > > >     Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml \
> > > >     Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml \
> > > >     Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml \
> > > >     Documentation/devicetree/bindings/clock/qcom,gcc.yaml; do \
> > > >       ARCH=arm64 make dt_binding_check DT_SCHEMA_FILES=$f; \
> > > >       ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=$f; \
> > > >   done
> > >
> > > Note that using DT_SCHEMA_FILES may hide some errors in examples as
> > > all other schemas (including the core ones) are not used for
> > > validation. So just 'make dt_binding_check' needs to pass (ignoring
> > > any other unrelated errors as it breaks frequently). Supposedly a
> > > patch is coming explaining this in the documentation.
> >
> > That seems like it's going to be a huge pain going forward, but OK.
>
> Use of DT_SCHEMA_FILES hiding problems or having to run 'make
> dt_binding_check' on everything?

Having to run 'make dt_binding_check' on everything.  I guess maybe if
the tree stays clean it won't be too bad and it wasn't too bad against
the current linux-next, but I can imagine that every time I want to
run this I'll run into a pile of warnings / errors in other people's
files.  Then I need to figure out what to ignore / workaround.  If
something fails badly (like intel-gw-pcie.yaml) I'll have to realize
that I should just delete that file to get the rest of the run to
report errors that are relevant to me.

This'll probably be worse because most maintainer trees are based on
"-rc1" and at least in the past I've found that "-rc1" tends to have
lots of problems.  Each maintainer then fixes the problems relative to
their own subsystem, but it's not a wonderful thing to rely on.


> I could probably rework things such that you can check a single
> binding example against all schema, but dtbs still get validated by
> just a single schema.

This would be helpful.  ...or some way to easily make really bad
failures non-fatal.  Then I can maybe just diff the results before my
patch and after and that'll give me a hint of what I've fixed / made
worse.


> Probably is. There are cases where a new schema breaks another file's
> example. If someone has a gcc node in another example for example.

At this point I'm going to say that we're better off than we were, but
I'll try to keep this in mind for future patches.


-Doug
