Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12C5E571C8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 16:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233030AbiGLO3Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 10:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230441AbiGLO3X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 10:29:23 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23DF12191
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 07:29:22 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id m16so10317674edb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 07:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UpQJKKbtg93cX86UuSBO9tVRJrPAdwmdctCEOdnSRnU=;
        b=ijq11B8dVKWd4WwXQdLWGL47Ff65ZWhCh8I3SE5MaxMAad6+ff+0LigbAoCe2JY4iV
         3LYhRmAzDWby1Q6v0gv1VaqErS7z7UeZOhoWW35oxwjCuJ3tvmQYNhvS3m9DSj3ZipSe
         75C5HfTf7UALfjjpZlu/UxdxlwILLB1WhqUf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UpQJKKbtg93cX86UuSBO9tVRJrPAdwmdctCEOdnSRnU=;
        b=Hl/BuLKUEqSiyN6TUbbJzK1R2/bhicrwJnjU0Z6LMhOQesBWBLKBH0gCGY6309WEmF
         AQjfszjOYXh8eFVmPnJs6JLTG22Z56l/QRRO6pk+faUdRu7+H3zCRqw1/rlq8Q/yFio0
         CPR+Owxg1ReSNcIxSFUUQN/OXox68y2MP9ZR5pjvjoiXj32ctgK/UPujNZ8KztnmIRF/
         +9ZoJXNiPl1+HVd0/u98JUwWGXg4H/e1GOSL3hC8MN2Lhc0Q5shY/d4QLs3GoiKv5F/E
         MwAA7TxWFJ2h4ywoDfGPUuMRzLX+Ik9Ptux52n68Rdn1QorLq2SuR8qqy9tRtOmVa7cj
         OqNg==
X-Gm-Message-State: AJIora+hD87tOrAg4RMaD2j2l3DUGULG39ZQ4F/rXWi0quX67f/mSztq
        xZpbmdki0X1IVPdNdW2TzWNLBxFz1JfjcHBoe5w=
X-Google-Smtp-Source: AGRyM1uRAuP/LXhdTrr2bvkdEx0CgORcgxKEG7KSq+PET1Sv/xQlkKomI4j8hkQCHHNyfqWIrdEiMA==
X-Received: by 2002:a05:6402:5192:b0:43a:c589:4507 with SMTP id q18-20020a056402519200b0043ac5894507mr21615296edd.177.1657636160409;
        Tue, 12 Jul 2022 07:29:20 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id z8-20020a1709063a0800b006febce7081bsm36939eje.163.2022.07.12.07.29.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 07:29:19 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id bu1so10248137wrb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 07:29:19 -0700 (PDT)
X-Received: by 2002:adf:d1c1:0:b0:21b:a5e9:b7b2 with SMTP id
 b1-20020adfd1c1000000b0021ba5e9b7b2mr22505619wrd.405.1657636159126; Tue, 12
 Jul 2022 07:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220711082940.39539-1-krzysztof.kozlowski@linaro.org>
 <20220711082940.39539-3-krzysztof.kozlowski@linaro.org> <CAD=FV=WUCPzzZHAPqoz-vhmcVxzYDxkKQs=+1tLZvsQjWe4q3Q@mail.gmail.com>
 <f8744ff8-15a0-bf31-c49f-b1bb35ba5cdd@linaro.org> <CAD=FV=X2ZfwwDO_hSSN35ObfvBbBbPjMoSB4GvS7m0yJieNg3Q@mail.gmail.com>
 <629ede41-326b-9c84-4bb8-2f7e695ca928@linaro.org>
In-Reply-To: <629ede41-326b-9c84-4bb8-2f7e695ca928@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 12 Jul 2022 07:29:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W7dypM9=uqaY650TGfiV4EaZR9EBH_3svQefyNv-oE7Q@mail.gmail.com>
Message-ID: <CAD=FV=W7dypM9=uqaY650TGfiV4EaZR9EBH_3svQefyNv-oE7Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: mmc: sdhci-msm: constrain reg-names
 perp variants
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jul 12, 2022 at 12:02 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/07/2022 17:11, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Jul 11, 2022 at 7:53 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 11/07/2022 16:52, Doug Anderson wrote:
> >>> Hi
> >>>
> >>> On Mon, Jul 11, 2022 at 1:29 AM Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> The entries in arrays must have fixed order, so the bindings and Linux
> >>>> driver expecting various combinations of 'reg' addresses was never
> >>>> actually conforming to guidelines.
> >>>>
> >>>> The 'core' reg entry is valid only for SDCC v4 and lower, so disallow it
> >>>> in SDCC v5.  SDCC v4 supports CQE and ICE, so allow them, even though
> >>>> the qcom,sdhci-msm-v4 compatible is used also for earlier SoCs with SDCC
> >>>> v2 or v3, so it is not entirely accurate.
> >>>>
> >>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>>
> >>>> ---
> >>>>
> >>>> Changes since v1:
> >>>> 1. Rework the patch based on Doug's feedback.
> >>>> ---
> >>>>  .../devicetree/bindings/mmc/sdhci-msm.yaml    | 61 ++++++++++++-------
> >>>>  1 file changed, 38 insertions(+), 23 deletions(-)
> >>>
> >>> In the ${SUBJECT} I'm not sure what a "perp variant" is. Is that a
> >>> typo or just a phrase I'm not aware of?
> >>
> >> Should be:
> >> "per variants"
> >>
> >>>
> >>>
> >>>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> >>>> index fc6e5221985a..2f0fdd65e908 100644
> >>>> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> >>>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> >>>> @@ -49,33 +49,11 @@ properties:
> >>>>
> >>>>    reg:
> >>>>      minItems: 1
> >>>> -    items:
> >>>> -      - description: Host controller register map
> >>>> -      - description: SD Core register map
> >>>> -      - description: CQE register map
> >>>> -      - description: Inline Crypto Engine register map
> >>>> +    maxItems: 4
> >>>>
> >>>>    reg-names:
> >>>>      minItems: 1
> >>>>      maxItems: 4
> >>>> -    oneOf:
> >>>> -      - items:
> >>>> -          - const: hc
> >>>> -      - items:
> >>>> -          - const: hc
> >>>> -          - const: core
> >>>> -      - items:
> >>>> -          - const: hc
> >>>> -          - const: cqhci
> >>>> -      - items:
> >>>> -          - const: hc
> >>>> -          - const: cqhci
> >>>> -          - const: ice
> >>>> -      - items:
> >>>> -          - const: hc
> >>>> -          - const: core
> >>>> -          - const: cqhci
> >>>> -          - const: ice
> >>>>
> >>>>    clocks:
> >>>>      minItems: 3
> >>>> @@ -177,6 +155,43 @@ required:
> >>>>  allOf:
> >>>>    - $ref: mmc-controller.yaml#
> >>>>
> >>>> +  - if:
> >>>> +      properties:
> >>>> +        compatible:
> >>>> +          contains:
> >>>> +            enum:
> >>>> +              - qcom,sdhci-msm-v4
> >>>> +    then:
> >>>> +      properties:
> >>>> +        reg:
> >>>> +          minItems: 2
> >>>> +          items:
> >>>> +            - description: Host controller register map
> >>>> +            - description: SD Core register map
> >>>> +            - description: CQE register map
> >>>> +            - description: Inline Crypto Engine register map
> >>>> +        reg-names:
> >>>> +          minItems: 2
> >>>> +          items:
> >>>> +            - const: hc
> >>>> +            - const: core
> >>>> +            - const: cqhci
> >>>> +            - const: ice
> >>>> +    else:
> >>>> +      properties:
> >>>> +        reg:
> >>>> +          minItems: 1
> >>>> +          items:
> >>>> +            - description: Host controller register map
> >>>> +            - description: CQE register map
> >>>> +            - description: Inline Crypto Engine register map
> >>>> +        reg-names:
> >>>> +          minItems: 1
> >>>> +          items:
> >>>> +            - const: hc
> >>>> +            - const: cqhci
> >>>> +            - const: ice
> >>>
> >>> Do you need to set "maxItems" here? If you don't then will it inherit
> >>> the maxItems of 4 from above?
> >>
> >> No, items determine the size instead.
> >
> > Can you just remove the "maxItems" from above then? Does it buy us anything?
>
> There is no maxItems directly here...

Sorry, I mean above in the schema. After your patch the schema is effectively:

reg:
  minItems: 1
  maxItems: 4
reg-names:
  minItems: 1
  maxItems: 4

...

allOf:
  - if:
      blah-blah-blah
    then:
      properties:
        reg:
          minItems: 2
          items:
            - description: ...
            - description: ...
            - description: ...
            - description: ...
        reg-names:
          blah-blah-blah
    else:
      blah-blah-blah

I'm asking about the maxItems _above_, AKA in the section:

reg:
  minItems: 1
  maxItems: 4
reg-names:
  minItems: 1
  maxItems: 4

Can we remove the "maxItems: 4" from the above and have it just be:

reg:
  minItems: 1
reg-names:
  minItems: 1

-Doug
