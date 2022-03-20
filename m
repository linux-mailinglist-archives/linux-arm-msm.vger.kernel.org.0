Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7495F4E1BF6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Mar 2022 15:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237560AbiCTOGJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Mar 2022 10:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245202AbiCTOGG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Mar 2022 10:06:06 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77870369D9;
        Sun, 20 Mar 2022 07:04:42 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id r10so17622419wrp.3;
        Sun, 20 Mar 2022 07:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ja6dGLu3NGbo/pUvZjfIICOHnjDv5C+I/KT51RoCKT8=;
        b=GvvtswGbLGzS8uQofxZ2gvtHtR/l1xYk5S9vtOJPgdBqCX+eeqhT1obQTY351Ht0GG
         55Gip9c+j39j9SmrBnnoXDKEaIQM9JMBeHBN3gTwSh5QPiAHso96mjh/F7M6xwJQCLSA
         Dj3CXrdpUV/od10wjJRHd/4iojbCIxG3qazEGdPE6PBLPI6XVf8rI5YuZYMUnSffp2YG
         Gc7SrRRzLjrbfeOldKbCP9sxvEDpwWNI6S9T2XE3FQbms4OZ0BYKqfl6UfaIcOSgHuND
         CfiqjQUajnOBvGuRigCOUmkyIA1DuEjbzrUo4INrCaRJkEdI+U7chykxow2ZzGOt9mJg
         YPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ja6dGLu3NGbo/pUvZjfIICOHnjDv5C+I/KT51RoCKT8=;
        b=rV9xAP/Jb9wUcHQck4nVNGX/OTZyssy5KQJGQEuI+0Q83B5/OQmdcdUrkIds7Ho6n9
         rl8c31T1FH8OGnpNoaLLOCt6mXshU3qhA9oahzv4qV/u3vh9MxtE+Dr5zIgXpJX36VGw
         O8D+tKsre69yqUo/0nnEhU8gKFSRYQaiha5lqd97/HgUZXhwiF9USNzhITrH6r7R6DIu
         svcp6hkkebz59fEYPiqFOB2OhXt7PiuFFf1lcKblkincORJt3wjjUJFqE57GtUv9eqi4
         1TxbY83yWdh9XGi0Roa79yeqUc5ugu9Wt/nhlAlTTiiKjwqIpFIAp8+Vj87zH6p6jQDG
         VRmQ==
X-Gm-Message-State: AOAM5335e05H2GHXPAIgEo3NqS/lC3XikLc+05Peffiu6g176ZTX6ZQq
        V4A7CzjOGIINJ5khf2W40u8=
X-Google-Smtp-Source: ABdhPJw6RtP3CNISTwhl+XYjzzvhIENWIWaE7SVsxIKSVjJR5qVFOQdy66jp+eaUEjflQdvxjhqOBw==
X-Received: by 2002:a5d:62c2:0:b0:203:e2dc:60de with SMTP id o2-20020a5d62c2000000b00203e2dc60demr14847033wrv.482.1647785080484;
        Sun, 20 Mar 2022 07:04:40 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-42-69-170.ip85.fastwebnet.it. [93.42.69.170])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c511300b00389c3a281d7sm22216455wms.0.2022.03.20.07.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 07:04:40 -0700 (PDT)
Date:   Sun, 20 Mar 2022 10:11:00 +0100
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 16/16] dt-bindings: arm: msm: Convert kpss driver
 Documentation to yaml
Message-ID: <YjbvpN5S77cyyN/U@Ansuel-xps.localdomain>
References: <20220318160827.8860-1-ansuelsmth@gmail.com>
 <20220318160827.8860-17-ansuelsmth@gmail.com>
 <45e4f763-d991-0939-3735-bfea05c48143@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45e4f763-d991-0939-3735-bfea05c48143@kernel.org>
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Mar 20, 2022 at 01:05:51PM +0100, Krzysztof Kozlowski wrote:
> On 18/03/2022 17:08, Ansuel Smith wrote:
> > Convert kpss-acc and kpss-gcc Documentation to yaml. Fix multiple
> > Documentation error and provide additional example for kpss-gcc-v2.
> > 
> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/arm/msm/qcom,kpss-acc.txt        | 49 ----------
> >  .../bindings/arm/msm/qcom,kpss-acc.yaml       | 97 +++++++++++++++++++
> >  .../bindings/arm/msm/qcom,kpss-gcc.txt        | 44 ---------
> >  .../bindings/arm/msm/qcom,kpss-gcc.yaml       | 63 ++++++++++++
> >  4 files changed, 160 insertions(+), 93 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.txt
> >  create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.txt
> >  create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.txt b/Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.txt
> > deleted file mode 100644
> > index 7f696362a4a1..000000000000
> > --- a/Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.txt
> > +++ /dev/null
> > @@ -1,49 +0,0 @@
> > -Krait Processor Sub-system (KPSS) Application Clock Controller (ACC)
> > -
> > -The KPSS ACC provides clock, power domain, and reset control to a Krait CPU.
> > -There is one ACC register region per CPU within the KPSS remapped region as
> > -well as an alias register region that remaps accesses to the ACC associated
> > -with the CPU accessing the region.
> > -
> > -PROPERTIES
> > -
> > -- compatible:
> > -	Usage: required
> > -	Value type: <string>
> > -	Definition: should be one of:
> > -			"qcom,kpss-acc-v1"
> > -			"qcom,kpss-acc-v2"
> > -
> > -- reg:
> > -	Usage: required
> > -	Value type: <prop-encoded-array>
> > -	Definition: the first element specifies the base address and size of
> > -		    the register region. An optional second element specifies
> > -		    the base address and size of the alias register region.
> > -
> > -- clocks:
> > -        Usage: required
> > -        Value type: <prop-encoded-array>
> > -        Definition: reference to the pll parents.
> > -
> > -- clock-names:
> > -        Usage: required
> > -        Value type: <stringlist>
> > -        Definition: must be "pll8_vote", "pxo".
> > -
> > -- clock-output-names:
> > -	Usage: optional
> > -	Value type: <string>
> > -	Definition: Name of the output clock. Typically acpuX_aux where X is a
> > -		    CPU number starting at 0.
> > -
> > -Example:
> > -
> > -	clock-controller@2088000 {
> > -		compatible = "qcom,kpss-acc-v2";
> > -		reg = <0x02088000 0x1000>,
> > -		      <0x02008000 0x1000>;
> > -		clocks = <&gcc PLL8_VOTE>, <&gcc PXO_SRC>;
> > -		clock-names = "pll8_vote", "pxo";
> > -		clock-output-names = "acpu0_aux";
> > -	};
> > diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.yaml
> > new file mode 100644
> > index 000000000000..6e8ef4f85eab
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/msm/qcom,kpss-acc.yaml
> > @@ -0,0 +1,97 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/msm/qcom,kpss-acc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Krait Processor Sub-system (KPSS) Application Clock Controller (ACC)
> > +
> > +maintainers:
> > +  - Ansuel Smith <ansuelsmth@gmail.com>
> > +
> > +description: |
> > +  The KPSS ACC provides clock, power domain, and reset control to a Krait CPU.
> > +  There is one ACC register region per CPU within the KPSS remapped region as
> > +  well as an alias register region that remaps accesses to the ACC associated
> > +  with the CPU accessing the region.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,kpss-acc-v1
> > +      - qcom,kpss-acc-v2
> > +
> > +  reg:
> > +    items:
> > +      - description: Base address and size of the register region
> > +      - description: Optional base address and size of the alias register region
> > +
> > +  clocks:
> > +    items:
> > +      - description: phandle to pll8_vote
> > +      - description: phandle to pxo_board
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pll8_vote
> > +      - const: pxo
> > +
> > +  clock-output-names:
> > +    description: Name of the aux clock. Krait can have at most 4 cpu.
> > +    enum:
> > +      - acpu0_aux
> > +      - acpu1_aux
> > +      - acpu2_aux
> > +      - acpu3_aux
> > +
> > +  '#clock-cells':
> > +    const: 0
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> 
> This is not obvious from the original bindings. Why are these required
> only on v1? Whatr about v2? Are they allowed on v2? Why at least
> clock-cells are not required on v2?
>

The original Documentation was a joke. I should have also write it in
the cover letter. v2 doesn't export clocks and just expose the kpss
regs. Doesn't provide any mux / clocks. It's really an entirely
different implementation. Aka the Documentation was wrong from the
start.

> The previous bindings make them required which you change here. Your
> commit does not explain this.
> 
> Please explicitly explain in commit msg all changes to the bindings
> which are necessary for conversion.
> 
> > +            const: qcom,kpss-acc-v1
> > +      then:
> > +        required:
> > +          - clocks
> > +          - clock-names
> > +          - clock-output-names
> > +          - '#clock-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
> > +
> > +    clock-controller@2088000 {
> > +      compatible = "qcom,kpss-acc-v1";
> > +      reg = <0x02088000 0x1000>, <0x02008000 0x1000>;
> > +      clocks = <&gcc PLL8_VOTE>, <&pxo_board>;
> > +      clock-names = "pll8_vote", "pxo";
> > +      clock-output-names = "acpu0_aux";
> > +      #clock-cells = <0>;
> > +    };
> > +
> > +    clock-controller@2098000 {
> > +      compatible = "qcom,kpss-acc-v1";
> > +      reg = <0x02098000 0x1000>, <0x02008000 0x1000>;
> > +      clock-output-names = "acpu1_aux";
> > +      clocks = <&gcc PLL8_VOTE>, <&pxo_board>;
> > +      clock-names = "pll8_vote", "pxo";
> > +      #clock-cells = <0>;
> 
> It's the same example as above, no differences. Remove it.
> 

Mhh this is a direct example on how the kpss-acc are defined for ipq806x
with a configuration with 2 cpu. Tell me if I should really remove it or
not.

> > +    };
> > +
> > +  - |
> > +    clock-controller@f9088000 {
> > +      compatible = "qcom,kpss-acc-v2";
> > +      reg = <0xf9088000 0x1000>,
> > +            <0xf9008000 0x1000>;
> 
> You now changed the example. This looks wrong.
> 

Again the example was wrong from the start. There isn't ANY kpss v2 that
exports clock and the driver that expose the aux clocks have just the
compatible for v1. (that is correct)

> > +    };
> > +...
> > diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.txt b/Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.txt
> > deleted file mode 100644
> > index e628758950e1..000000000000
> > --- a/Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.txt
> > +++ /dev/null
> > @@ -1,44 +0,0 @@
> > -Krait Processor Sub-system (KPSS) Global Clock Controller (GCC)
> > -
> > -PROPERTIES
> > -
> > -- compatible:
> > -	Usage: required
> > -	Value type: <string>
> > -	Definition: should be one of the following. The generic compatible
> > -			"qcom,kpss-gcc" should also be included.
> > -			"qcom,kpss-gcc-ipq8064", "qcom,kpss-gcc"
> > -			"qcom,kpss-gcc-apq8064", "qcom,kpss-gcc"
> > -			"qcom,kpss-gcc-msm8974", "qcom,kpss-gcc"
> > -			"qcom,kpss-gcc-msm8960", "qcom,kpss-gcc"
> > -
> > -- reg:
> > -	Usage: required
> > -	Value type: <prop-encoded-array>
> > -	Definition: base address and size of the register region
> > -
> > -- clocks:
> > -	Usage: required
> > -	Value type: <prop-encoded-array>
> > -	Definition: reference to the pll parents.
> > -
> > -- clock-names:
> > -	Usage: required
> > -	Value type: <stringlist>
> > -	Definition: must be "pll8_vote", "pxo".
> > -
> > -- clock-output-names:
> > -	Usage: required
> > -	Value type: <string>
> > -	Definition: Name of the output clock. Typically acpu_l2_aux indicating
> > -		    an L2 cache auxiliary clock.
> > -
> > -Example:
> > -
> > -	l2cc: clock-controller@2011000 {
> > -		compatible = "qcom,kpss-gcc-ipq8064", "qcom,kpss-gcc";
> > -		reg = <0x2011000 0x1000>;
> > -		clocks = <&gcc PLL8_VOTE>, <&gcc PXO_SRC>;
> > -		clock-names = "pll8_vote", "pxo";
> > -		clock-output-names = "acpu_l2_aux";
> > -	};
> > diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.yaml
> > new file mode 100644
> > index 000000000000..578e2eccb7db
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/msm/qcom,kpss-gcc.yaml
> > @@ -0,0 +1,63 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/msm/qcom,kpss-gcc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Krait Processor Sub-system (KPSS) Global Clock Controller (GCC)
> > +
> > +maintainers:
> > +  - Ansuel Smith <ansuelsmth@gmail.com>
> > +
> > +description: |
> > +  Krait Processor Sub-system (KPSS) Global Clock Controller (GCC). Used
> > +  to control L2 mux (in the current implementation).
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,kpss-gcc
> 
> This is wrong conversion. You removed quite a lot.
> 

The driver doesn't have any support for it and we have no user for
kpss-gcc. Again another Documentation that was pushed for the sake of it
with no real user/no sense at all. Tell me if I should keep random
compatible anyway. Should't be better to fix them for good and make devs
add a specific compatible when the driver actually add support for them?

> Please split this commit into two separate conversions (acc and gcc).
> 

Will do.

> > +
> > +  reg:
> > +    items:
> > +      - description: Base address and size of the register region
> 
> Just maxItems:1. No need for items and description - it's obvious.
> 

Ok.

> > +
> > +  clocks:
> > +    items:
> > +      - description: phandle to pll8_vote
> > +      - description: phandle to pxo_board
> > +
> > +  clock-names:
> > +    items:
> > +      - const: pll8_vote
> > +      - const: pxo
> > +
> > +  clock-output-names:
> > +    const: acpu_l2_aux
> > +
> 
> 
> Best regards,
> Krzysztof

I hope I don't look rude with my response. The Documentation for this
stuff is really old and was pushed randomly. Guess how fun it was to
discover that NONE of them were actually right and we have this from
ages broken. Will for sure improve the commit description.

Also considering how brake they are should I really do a direct
conversion and then fix them? Instead of dropping them for good and
reimplement them the correct way directly?

-- 
	Ansuel
