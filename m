Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E74D95F560E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Oct 2022 16:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbiJEOCx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Oct 2022 10:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiJEOCw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Oct 2022 10:02:52 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ADD87C1FF;
        Wed,  5 Oct 2022 07:02:40 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id k2so5725654ejr.2;
        Wed, 05 Oct 2022 07:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date;
        bh=FhCQ1qflB5YspXhtdG7hrYOx4eLmno3S8YD+xF0t+34=;
        b=FKIizU3OP+jDTOOlav7bXRhJgfEVEagnAIVmj/GQG4BPjjqKtjCRv/xtBKI90jPnBH
         xgnSQTryPAiNUim56UOMrXKlzvElnYiMyMdEQm3KjF/2qWkvIp/K+8WK5+XTBi2Sgt3v
         wLeUi7tHe+i/YDj4t8fI128Trs5BBXuy1rZDevMZjVFmVdmB6B1dwUkrKIaDa0AQPDAv
         43CytqBJY73wXrTMlrCMcLxhGWJhBnmdC50SKODsKIP9NRKyYHO/adIlsnUjeQHXSvfi
         d4MI8d+X4W6DbXB0FoEFUboIWPAQlHVDMuwyuna5+/KopccaZkSQTj2XIGf4J51HkwR2
         Hhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=FhCQ1qflB5YspXhtdG7hrYOx4eLmno3S8YD+xF0t+34=;
        b=OZWsx1rKsEpHwhZOt0Vmu1Ah42/6kud+3mbowhub8dYEALMyxQ4ii0pffPzilMAwlz
         IaFL3QugqOzmxFOXzFBE52lLZFDegRXwUoUhgD9WCa/ETDe0wq0QgNomDcMyn5IuJLBg
         m88MizpKn7I1AsH7PF0xpIpdHTLuy5iGGbgzXz5ZZgfwSCdCgORS5+oyVOAdHQQqZBoc
         i1Z/YODGbdVhJgHDV0DM0NaQ0hKPM1XrOwpOxKQM3clfzZn2tXxjV1+Is8v77MHl8THM
         bIyyuhrYpWvDCDX0au+BrvxPPEOh0adP0hspu++OvN6LS9jTV20Wt0G/6Ex8HToCZMtk
         kYsg==
X-Gm-Message-State: ACrzQf38Mdoq2dpw5hWW3acwtQvXJ37lHe0fHz+ShUUBocXFK1s6THcg
        ruzAvvxwon6R4v5ivWWBGJg=
X-Google-Smtp-Source: AMsMyM45VfjSdEH93LCwy0OFwVda7wpiJdtaUawRTtjD4rA9bt4ck1OLFNFs3Qzu7SZ1URQzZbICgQ==
X-Received: by 2002:a17:906:5a4c:b0:78c:c893:74e6 with SMTP id my12-20020a1709065a4c00b0078cc89374e6mr9749439ejc.545.1664978559080;
        Wed, 05 Oct 2022 07:02:39 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-134.ip85.fastwebnet.it. [93.42.70.134])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906329100b0077f5e96129fsm4778326ejw.158.2022.10.05.07.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 07:02:38 -0700 (PDT)
Message-ID: <633d8e7e.170a0220.d6c99.0630@mx.google.com>
X-Google-Original-Message-ID: <Yz2OfRffgmBHAgCT@Ansuel-xps.>
Date:   Wed, 5 Oct 2022 16:02:37 +0200
From:   Christian Marangi <ansuelsmth@gmail.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom: qcom,spm: support regulator SAW2
 devics
References: <20220930231416.925132-1-dmitry.baryshkov@linaro.org>
 <a743d50f-fc59-161e-c98f-f10b26e2afe5@linaro.org>
 <CAA8EJpo9kSs_h28SneAwQ0FLHJ0PipmbQRm791hb-vHtGwXwDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpo9kSs_h28SneAwQ0FLHJ0PipmbQRm791hb-vHtGwXwDQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Oct 02, 2022 at 03:20:57PM +0300, Dmitry Baryshkov wrote:
> On Sun, 2 Oct 2022 at 11:49, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 01/10/2022 01:14, Dmitry Baryshkov wrote:
> > > Merge qcom,saw2.txt bindings to existing qcom,spm.yaml. This fixes
> > > compatibility of qcom,spm schema with regulator SAW2 devices.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  .../devicetree/bindings/arm/msm/qcom,saw2.txt | 58 -------------------
> > >  .../bindings/soc/qcom/qcom,spm.yaml           | 44 +++++++++-----
> >
> > You need to update reference in
> > Documentation/devicetree/bindings/arm/cpus.yaml
> 
> ack
> 
> >
> > >  2 files changed, 30 insertions(+), 72 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt b/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
> > > deleted file mode 100644
> > > index c0e3c3a42bea..000000000000
> > > --- a/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
> 
> [skipped]
> 
> > > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
> > > index f433e6e0a19f..8fe35fde70b8 100644
> > > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
> > > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
> > > @@ -16,23 +16,33 @@ description: |
> > >
> > >  properties:
> > >    compatible:
> > > -    items:
> > > -      - enum:
> > > -          - qcom,sdm660-gold-saw2-v4.1-l2
> > > -          - qcom,sdm660-silver-saw2-v4.1-l2
> > > -          - qcom,msm8998-gold-saw2-v4.1-l2
> > > -          - qcom,msm8998-silver-saw2-v4.1-l2
> > > -          - qcom,msm8909-saw2-v3.0-cpu
> > > -          - qcom,msm8916-saw2-v3.0-cpu
> > > -          - qcom,msm8226-saw2-v2.1-cpu
> > > -          - qcom,msm8974-saw2-v2.1-cpu
> > > -          - qcom,apq8084-saw2-v2.1-cpu
> > > -          - qcom,apq8064-saw2-v1.1-cpu
> > > +    oneOf:
> > >        - const: qcom,saw2
> >
> > I understand old bindings had it, but I don't think we really want to
> > support the generic compatible on its own. Even old bindings indicated
> > that there are several differences between SAWs.
> >
> > Especially confusing is that once qcom,saw2 can be alone and in other
> > cases must be preceded by specific compatible. IOW, you allow for
> > apq8064 two cases:
> >
> > 1. qcom,apq8064-saw2-v1.1-cpu, qcom,saw2
> > 2. qcom,saw2
> >
> > I think we should instead add everywhere specific compatibles.
> 
> I see your point. Yes, it's probably worth doing that.
> 
> Robert, Christian, can you possibly check the version of the SAW2 used
> on ipq4019 and ipq8064? It can be read from the SPM block at the
> register offset 0xfd0.
>

From what I notice from QSDK it seems ipq806x doesn't have a reg to
provide version. (there are many variant of v1 revision)

Anyway these are the values from uboot

(IPQ) # md.l 0x2089FD0
02089fd0: 00000000    ....
(IPQ) # md.l 0x2099FD0
02099fd0: 00000000    ....
(IPQ) # md.l 0x2012FD0
02012fd0: 00000000    ....

> > > +      - items:
> > > +          - enum:
> > > +              - qcom,sdm660-gold-saw2-v4.1-l2
> > > +              - qcom,sdm660-silver-saw2-v4.1-l2
> > > +              - qcom,msm8998-gold-saw2-v4.1-l2
> > > +              - qcom,msm8998-silver-saw2-v4.1-l2
> > > +              - qcom,msm8909-saw2-v3.0-cpu
> > > +              - qcom,msm8916-saw2-v3.0-cpu
> > > +              - qcom,msm8226-saw2-v2.1-cpu
> > > +              - qcom,msm8974-saw2-v2.1-cpu
> > > +              - qcom,apq8084-saw2-v2.1-cpu
> > > +              - qcom,apq8064-saw2-v1.1-cpu
> > > +          - const: qcom,saw2
> > >
> > >    reg:
> > > -    description: Base address and size of the SPM register region
> > > -    maxItems: 1
> > > +    description: Base address and size of the SPM register region. An optional
> > > +      second element specifies the base address and size of the alias register
> > > +      region.
> > > +    minItems: 1
> > > +    maxItems: 2
> >
> > And it seems second region is not present on some variants?
> 
> The second region is a bit of a puzzle for me as it doesn't seem to be
> used at all.
> 
> -- 
> With best wishes
> Dmitry

-- 
	Ansuel
