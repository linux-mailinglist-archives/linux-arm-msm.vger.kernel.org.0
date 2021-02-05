Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFCC3119C0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Feb 2021 04:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbhBFDRw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 22:17:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232032AbhBFCuX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 21:50:23 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B263C08ECAD
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 14:38:51 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id g15so4631838pjd.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 14:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=TPy6/3PPA+frW49ypCmGHWEc+3NWyGIGLFzSHlW7ETI=;
        b=MEHSJ7ZaLqO9dIWUAK/L2fuyHmQ6z/39pCYT8H/kxVc+RKyotBmPbZOznVKWYGcCj9
         S+NWusmu5VZvtZTc6Oy3jSEb6MwiQ2bR9BAUyT6ZRGD6sR+wgJ8z6rhySKfkjaLqnV5+
         emuaEKuKKjnAvZ4Uge4lcnWfSlzVtaeLIWmQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=TPy6/3PPA+frW49ypCmGHWEc+3NWyGIGLFzSHlW7ETI=;
        b=hLk9CsjaB7F33iZzA1cj5XkPpYuXTTE9gRwSyou9GMBOp1RqKtmhVXzQ4gb8qOkbNK
         NwLiS5adqDf8gekrKko3duq/OhCA4tg9Y+ZUQgzL5D2ajEjpQlzHiJ9atW93YK/jJpvZ
         fn5xd0RDyeR+vSh/5L77qtL0Hbo3SNqieAqseQ81CYh7YOn4ECVzp8J3xWtSnkrwShyL
         RagBJyETCJYeMH1iJ8Lolqj+IkH47M7kDmMPv1WgZQi4L4+lTo3+f6OGeGMoR+djQFsX
         hV18zHWpIOmqbbjYuuDLf7wKdVAzivk4Wm8YX29AauiJriEj5Jvsrmh3RfXKFK3OwKcE
         fg1w==
X-Gm-Message-State: AOAM532VBv4pR3zI3wh7WO33srqnW0uptrHrwEkVEqY5c9IEfBlcx443
        cNNJmKny08u4BqQZ8SR8a2Y1Ig==
X-Google-Smtp-Source: ABdhPJzQkRoqy7NHVtV1bJaBWZ+N3veHooHF1rNh/xVijXxElZXV1En02xrxUD03p0PR3Z0/ZknQoQ==
X-Received: by 2002:a17:90a:fb44:: with SMTP id iq4mr6030343pjb.155.1612564730941;
        Fri, 05 Feb 2021 14:38:50 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3d74:5f76:aaaa:6cb8])
        by smtp.gmail.com with ESMTPSA id d14sm10820208pfo.156.2021.02.05.14.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 14:38:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b4bd2263a21f464869ac6d84aa0df131@codeaurora.org>
References: <1612420939-15502-1-git-send-email-mkrishn@codeaurora.org> <1612420939-15502-4-git-send-email-mkrishn@codeaurora.org> <161255172811.76967.16401619378965156134@swboyd.mtv.corp.google.com> <b4bd2263a21f464869ac6d84aa0df131@codeaurora.org>
Subject: Re: [PATCH v10 4/4] dt-bindings: msm/dp: Add bindings of MSM DisplayPort controller
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, bjorn.andersson@linaro.org,
        vinod.koul@linaro.org, rnayak@codeaurora.org,
        dianders@chromium.org, sibis@codeaurora.org,
        Vara Reddy <varar@codeaurora.org>
To:     khsieh@codeaurora.org
Date:   Fri, 05 Feb 2021 14:38:48 -0800
Message-ID: <161256472868.76967.11097632368706888024@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting khsieh@codeaurora.org (2021-02-05 12:55:47)
> On 2021-02-05 11:02, Stephen Boyd wrote:
> > Quoting Krishna Manikandan (2021-02-03 22:42:19)
> >> Add bindings for Snapdragon DisplayPort controller driver.
> >>=20
> >> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> >> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> >> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> >> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>

Krishna is sending these patches, so there should be an SoB line here
from Krishna. Please add it next time.

> >>=20
> > [...]
> >>=20
> >> Changes in v11:
> >> - add ports required of both #address-cells and  #size-cells
> >> - add required operating-points-v2
> >> - add required #sound-dai-cells
> >> - add required power-domains
> >> - update maintainer list
> >=20
> > Where's that maintainer file update?
> I had deleted Tanmay.
> Anyway, I will removed Chandan at next upload.

Ok.

> >=20
> >> ---
> >>  .../bindings/display/msm/dp-controller.yaml        | 157=20
> >> +++++++++++++++++++++
> >>  .../bindings/display/msm/dpu-sc7180.yaml           |  10 ++
> >>  2 files changed, 167 insertions(+)
> >>  create mode 100644=20
> >> Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >>=20
> >> diff --git=20
> >> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml=20
> >> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> new file mode 100644
> >> index 0000000..2b71c7a
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> @@ -0,0 +1,157 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
[...]
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - interrupts
> >> +  - clocks
> >> +  - clock-names
> >> +  - phys
> >> +  - phy-names
> >> +  - "#sound-dai-cells"
> >> +  - power-domains
> >> +  - ports
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> >> +    #include <dt-bindings/power/qcom-aoss-qmp.h>
> >> +    #include <dt-bindings/power/qcom-rpmpd.h>
> >> +
> >> +    mdss@ae00000 {
> >=20
> > mdss is not a standard node name. Maybe 'subsystem'?
> Can you give me more details regrading this.
> I had double checked both ti/ti,am65x-dss.yaml and msm/dsi-phy.yaml and=20
> can not find any clue for this.
> Can I just followed msm/dsi-phy.yaml for this?

Please look at section "2.2.2 Generic Names Recommendation" of the DT
spec[1] to find a proper name. I don't see 'subsystem' there but that
may be because it shouldn't really exist as a node. Instead we should
have the child nodes sit directly under the SoC node.

[1] https://github.com/devicetree-org/devicetree-specification/releases/dow=
nload/v0.3/devicetree-specification-v0.3.pdf
