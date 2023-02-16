Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B44B46991E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 11:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbjBPKmC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 05:42:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbjBPKmA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 05:42:00 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3470A5454D
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 02:41:33 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id v3so988399pgh.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 02:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0rrWxTzpbtETHK3Hkgr5LIb/67SKcxDrfYtkzpOwuc=;
        b=nQJeJ22JV2n/fpi1/NUDAJ2rXMOFYks9S8hpTREWDX4VJP9vXEodroOmDf17ahZSIX
         8ycgpDQUWbk7SIvITav6Vz5QoOaP5AAOfk3D1T5Vdg3FVtZ2aWAaMi0zFAaNsoAexQZ/
         QED9EJswXgIK39BriNgjiqovDwP15cTsKST/dx0MiQ8scDlg64hkvoX616M3u1CgqkNP
         J9dHBW7TvGfproY8ZzOXgqCa0/QsR8F9vtZYxN7dJMe71l7WAYrswL+UULc4/crOkIZM
         XVHq/yrwHCwfRlNgF+pwWqT6jWW0dPTstybVJk5V+l9zJb+jfSfwU4PK78jpe85OsuAa
         3F3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z0rrWxTzpbtETHK3Hkgr5LIb/67SKcxDrfYtkzpOwuc=;
        b=31BoyY7RXMO+EYHU3G2e+KOuKzv0aI5YSSDQlvFuSXbdLrHysPQOb6aC3fZJ5MYIC/
         wzq1SLlrOHHFyYfsHjvmyr/nStf7NgN7aqZSMTQJHE35zYCYSabaXlju9pFK52PUIHkC
         gVkTZZyCmhHFugKN9PHks15PaZjVLM3PW3XuT+hJacxfomBJI6zPoRDg2OQjC56PY6Ix
         AfTdTswyiIV/oidoBzEF2FdWtt/7lPLMlPIYH9tCUda53bpOJlQPtt4ksLGLrPKT4ooT
         hGrJ4TSWkLtMt+cuKRy8+OhXxNii0nikBcD4jvQtBAO0u6pRXMyiEm/8FRpqFxo5EF91
         oc3Q==
X-Gm-Message-State: AO0yUKVQZdJWY3ZPHmTSIbAzyRCtIqLWwGc5FlBn5561t1gy9Ve0TUjK
        ow4/KegWbnQJSUyfWtxhjKKr9DZppwmvqMAbIPrylQ==
X-Google-Smtp-Source: AK7set/+bmK0NZ4RTQRaKp9brGd56H3O3Zv/QM5e9bIHL1lfW2h78IQbaZJvseuYS0KgrhmwF/dZL2hMhTds6c8huFw=
X-Received: by 2002:a63:b955:0:b0:4fb:9719:318a with SMTP id
 v21-20020a63b955000000b004fb9719318amr712399pgo.74.1676544091107; Thu, 16 Feb
 2023 02:41:31 -0800 (PST)
MIME-Version: 1.0
References: <20230214162325.312057-1-robert.marko@sartura.hr> <dcdd0a62-8d1f-d9b1-6137-34d9e68313a1@linaro.org>
In-Reply-To: <dcdd0a62-8d1f-d9b1-6137-34d9e68313a1@linaro.org>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Thu, 16 Feb 2023 11:41:20 +0100
Message-ID: <CA+HBbNHmDeBBBc31OayTjegi4KrAgqOiRLQscorENjqg3dEa3Q@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: clock: split qcom,gcc-ipq4019 to
 separate file
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 16, 2023 at 11:16 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 14/02/2023 17:23, Robert Marko wrote:
> > Move schema for the GCC on IPQ4019 platform to a separate file to be able
> > to allow passing XO and sleep clks directly to GCC.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../bindings/clock/qcom,gcc-ipq4019.yaml      | 53 +++++++++++++++++++
> >  .../bindings/clock/qcom,gcc-other.yaml        |  2 -
> >  2 files changed, 53 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-ipq4019.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq4019.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq4019.yaml
> > new file mode 100644
> > index 0000000000000..6ebaef2288fa3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq4019.yaml
> > @@ -0,0 +1,53 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/qcom,gcc-ipq4019.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Global Clock & Reset Controller on IPQ4019
> > +
> > +maintainers:
> > +  - Stephen Boyd <sboyd@kernel.org>
> > +  - Taniya Das <tdas@codeaurora.org>
> > +  - Robert Marko <robert.markoo@sartura.hr>
> > +
> > +description: |
> > +  Qualcomm global clock control module provides the clocks, resets and power
> > +  domains on IPQ4019.
> > +
> > +  See also:: include/dt-bindings/clock/qcom,gcc-ipq4019.h
> > +
> > +allOf:
> > +  - $ref: qcom,gcc.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,gcc-ipq4019
> > +
> > +  clocks:
> > +    items:
> > +      - description: board XO clock
> > +      - description: sleep clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: xo
> > +      - const: sleep_clk
> > +
> > +required:
> > +  - compatible
>
> Aren't the clocks now required? Will it keep working without them?

There are not required, this just allows passing them but the driver is
still using global matching until in patch 2 XO and sleep clocks are converted
to use parent data and in patch 3 they are passed via phandles to GCC,
however, even then global matching by name is preserved in the driver
as a fallback
to keep backward compatibility.

However, I see your point, after parent data conversion they should be
required by
schema as that is preferred over global matching.

I will wait for some time for feedback on other patches and then send
v2 that includes
that change.

Regards,
Robert
>
> Best regards,
> Krzysztof
>


-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
