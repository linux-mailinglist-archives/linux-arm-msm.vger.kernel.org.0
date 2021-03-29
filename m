Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD2234C22E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Mar 2021 05:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhC2DUG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Mar 2021 23:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbhC2DTs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Mar 2021 23:19:48 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD50C061574
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Mar 2021 20:19:48 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so5247833pjg.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Mar 2021 20:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=DXkHOtJLfYCmuTgoj7INRJY5SBEUmZfBnHFuMbQq6r0=;
        b=TVaU8xUOhbEad8ZqUhu2j8Dob9O4/2trviw778QSwETfSeMqR1PDvnaGPkBCul3ozC
         3i0ISY2uaGSGi4BmtD2NYfCrS5N3CqwR5OyhXX6BAO+9nGGkue9beO7DHexeAZeN9fId
         q0FHVjS9yjjkep7YXjLWbYnTtPz6GjOT8tXt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=DXkHOtJLfYCmuTgoj7INRJY5SBEUmZfBnHFuMbQq6r0=;
        b=tnwQdULnKkbeFY4QNKfagwxt6qlLCBKM8uGnSKzx/7e7AkIlSitr5Zm+xLp9yz6i9H
         hGk84pIP3eSAtK0gQJwwF7tPqI4wyH3nRUNzBqvi0KjWy1AKaa83QPkh9/cTOYHPA9vJ
         Go3te2ckbokk2wV/doOUiEG05cB50RrjZAVXnbCmh9/e7M0kjMS8+NOkN3qoP6lwt91x
         +q5JHbZpg8PPfyiUYfZKVdyczAKMkedBAagDOLeA4bkq0kQCW2aaJRh9oIftm3rt6vDW
         p880qJ37w1hjTNreFN++UT6bCjrF0qfKqMtJxr9JEDiLxLNsS4z7Kw0jXEC8aJU4uQhZ
         3UAQ==
X-Gm-Message-State: AOAM5322FIoh4Ek9lDg7xA+U6AVs/a+dzY9AQEIoJrYTe0gafA6HdpqV
        v/FPfX/p6MWpn0vsLoN84kao+93okAQUEg==
X-Google-Smtp-Source: ABdhPJzSCG5aGc1GGjy1Vw1GssiouxViSl4f91+YJBZvzRFOkGJE8TpR3YoEi4x71d6hnRDO3cotiQ==
X-Received: by 2002:a17:902:8bcb:b029:e6:a4a1:9d7e with SMTP id r11-20020a1709028bcbb02900e6a4a19d7emr25983292plo.25.1616987987103;
        Sun, 28 Mar 2021 20:19:47 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:d06e:3541:6cd6:ab0e])
        by smtp.gmail.com with ESMTPSA id r10sm15192655pfq.216.2021.03.28.20.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 20:19:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <81ea21602c74d2b18e4b013dda3a3213@codeaurora.org>
References: <1616673661-20038-1-git-send-email-mkrishn@codeaurora.org> <1616673661-20038-3-git-send-email-mkrishn@codeaurora.org> <161671311714.3012082.4777798674596112311@swboyd.mtv.corp.google.com> <81ea21602c74d2b18e4b013dda3a3213@codeaurora.org>
Subject: Re: [PATCH v14 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI PHY bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, bjorn.andersson@linaro.org,
        vinod.koul@linaro.org, rnayak@codeaurora.org,
        dianders@chromium.org, sibis@codeaurora.org, khsieh@codeaurora.org
To:     mkrishn@codeaurora.org
Date:   Sun, 28 Mar 2021 20:19:45 -0700
Message-ID: <161698798504.3012082.2821776620747041419@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting mkrishn@codeaurora.org (2021-03-26 03:36:30)
> On 2021-03-26 04:28, Stephen Boyd wrote:
> > Quoting Krishna Manikandan (2021-03-25 05:01:00)
> >> diff --git=20
> >> a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml=20
> >> b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> >> new file mode 100644
> >> index 0000000..4a26bef
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> >> @@ -0,0 +1,68 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-10nm.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Qualcomm Display DSI 10nm PHY
> >> +
> >> +maintainers:
> >> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> >> +
> >> +allOf:
> >> +  - $ref: dsi-phy-common.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    oneOf:
[..]
> >> and
> >> +      connected to VDDA_MIPI_DSI_0_PLL_0P9 pin for sdm845 target
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - reg-names
> >> +  - vdds-supply
> >> +
> >> +unevaluatedProperties: false
> >=20
> > additionalProperties: false instead? This comment applies to the other
> > bindings in this patch.
>=20
> Hi Stephen,
> We are referencing dsi-phy-common.yaml in this file. Since the=20
> properties of dsi-phy-common.yaml are applicable to this file also, I=20
> added unevaluatedProperties: false. If we add additionalProperties:=20
> false instead, then the properties of dsi-phy-common.yaml will not be=20
> applicable here and this will throw an error if we add the properties=20
> from dsi-phy-common.yaml in the example.
>=20

Does that matter? I was wondering about that and so I peeked at the
qcom pinctrl binding and it seems to follow a similar design but doesn't
have unevaluatedProperties: false. Instead it has additionalProperies:
false. See qcom,sc8180x-pinctrl.yaml for an example. So did you try it
or does something say you can't do this?
