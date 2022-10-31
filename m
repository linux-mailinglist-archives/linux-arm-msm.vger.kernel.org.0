Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C967861401E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 22:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiJaVrT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 17:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbiJaVrS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 17:47:18 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40183140B8
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 14:47:17 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-36a4b86a0abso120415467b3.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 14:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xzOjqeyFvqhS705oPAWJ0GddjV0BZAQlCXe8zauSjnY=;
        b=WAbGR+86/wS/wQn7NrfO9yBuZ+LEYr45wjJW9kgI4iX5MZNea4xPjGtAJaGK3+cn3c
         SmSPMD8A0+vNkwDFroz0sXZ8z9omzzXaaxX2l4NT5hVlKiBficeb09H9Jnk2DIex2HFS
         WaZxiMcXacucddwHPOR5jnmrayrlc7eWEhvqaeh08KyqbPjj8Vr95h/idSDU6TWp82jX
         mDkoPTBCJi52hQ8d/6nKlbv3P2VMMm97OTg4oqQM7IfMvW8r/EeXnA9qR2WiD+N4j31g
         6506QrUb65Fg7gf+Nqu0r73/K3ho38WNv1Exws4/S2nQT98RpCFmQfI/fIugsGhobUzR
         mJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzOjqeyFvqhS705oPAWJ0GddjV0BZAQlCXe8zauSjnY=;
        b=XZ5EbwFHnLc0sdpKY1U9vAB5OLb9k/ZV5HdcdMJn4GZhELXOtrK7Llob0kns4nkG9d
         842qFHknxlIpicH4wiiNIp22s/++8EsX2qmIEqaBkIPX9B9H9kC5OaItGsRU4RUhiJd6
         BtUm/ZuJ8vV6TE6DUQ2olT7v94fgIiZfVa+xJIwae1AHJ41OusNKlrwTOOJGb6In7Np5
         QWRSlIN/bY49iYL73/5+bXASfU/8LPg7F/IaUOK1GrcvyWIlDHhoUYm5TUJWdZHhqb4h
         QZgxaW4/UcLhg0A1benlGPJyhJvaKJIlR6dnWU8kLUwLhOu7CYYJXmBMENqKXGl1EN2U
         temQ==
X-Gm-Message-State: ACrzQf0CFZrbqPPTwiGhs7rh7CFf1uCcj6i7jU1ILOtdsAdvbgX7t1ps
        6i6bzG2G4DTMfrThMc/TYIYNOOX2ghaSXCgw9JpN4g==
X-Google-Smtp-Source: AMsMyM7WB8VP+s71qqDXHCNxNVqxxxMFfsqDw3nJpW8eHHM9Hbbq60q6Hu6nkcqqaQfIZF+eDstm2AASBcHNwD09E48=
X-Received: by 2002:a81:7804:0:b0:369:1074:e2b with SMTP id
 t4-20020a817804000000b0036910740e2bmr15334789ywc.127.1667252836424; Mon, 31
 Oct 2022 14:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221029211312.929862-1-dmitry.baryshkov@linaro.org>
 <20221029211312.929862-2-dmitry.baryshkov@linaro.org> <20221031214055.GA3613285-robh@kernel.org>
In-Reply-To: <20221031214055.GA3613285-robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 1 Nov 2022 00:47:05 +0300
Message-ID: <CAA8EJpqt+UvWHwd90Cdm3iCi2sbxbwbC3ADY6PW053Tw8r94VA@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] dt-bindings: PCI: qcom: Add sm8350 to bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
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

On Tue, 1 Nov 2022 at 00:40, Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Oct 30, 2022 at 12:13:06AM +0300, Dmitry Baryshkov wrote:
> > Add bindings for two PCIe hosts on SM8350 platform. The only difference
> > between them is in the aggre0 clock, which warrants the oneOf clause for
> > the clocks properties.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/pci/qcom,pcie.yaml    | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> > index 54f07852d279..55bf5958ef79 100644
> > --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> > +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> > @@ -32,6 +32,7 @@ properties:
> >        - qcom,pcie-sdm845
> >        - qcom,pcie-sm8150
> >        - qcom,pcie-sm8250
> > +      - qcom,pcie-sm8350
> >        - qcom,pcie-sm8450-pcie0
> >        - qcom,pcie-sm8450-pcie1
> >        - qcom,pcie-ipq6018
> > @@ -185,6 +186,7 @@ allOf:
> >                - qcom,pcie-sc8180x
> >                - qcom,pcie-sc8280xp
> >                - qcom,pcie-sm8250
> > +              - qcom,pcie-sm8350
> >                - qcom,pcie-sm8450-pcie0
> >                - qcom,pcie-sm8450-pcie1
> >      then:
> > @@ -540,6 +542,57 @@ allOf:
> >            items:
> >              - const: pci # PCIe core reset
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - qcom,pcie-sm8350
> > +    then:
> > +      oneOf:
> > +          # Unfortunately the "optional" ref clock is used in the middle of the list
> > +        - properties:
> > +            clocks:
> > +              maxItems: 13
> > +            clock-names:
> > +              items:
> > +                - const: pipe # PIPE clock
> > +                - const: pipe_mux # PIPE MUX
> > +                - const: phy_pipe # PIPE output clock
> > +                - const: ref # REFERENCE clock
> > +                - const: aux # Auxiliary clock
> > +                - const: cfg # Configuration clock
> > +                - const: bus_master # Master AXI clock
> > +                - const: bus_slave # Slave AXI clock
> > +                - const: slave_q2a # Slave Q2A clock
> > +                - const: tbu # PCIe TBU clock
> > +                - const: ddrss_sf_tbu # PCIe SF TBU clock
> > +                - const: aggre0 # Aggre NoC PCIe0 AXI clock
>
> 'enum: [ aggre0, aggre1 ]' and 'minItems: 12' would eliminate the 2nd
> case. There's a implicit requirement that string names are unique (by
> default).

Wouldn't it also allow a single 'aggre0' string?

>
> > +                - const: aggre1 # Aggre NoC PCIe1 AXI clock
> > +        - properties:
> > +            clocks:
> > +              maxItems: 12
> > +            clock-names:
> > +              items:
> > +                - const: pipe # PIPE clock
> > +                - const: pipe_mux # PIPE MUX
> > +                - const: phy_pipe # PIPE output clock
> > +                - const: ref # REFERENCE clock
> > +                - const: aux # Auxiliary clock
> > +                - const: cfg # Configuration clock
> > +                - const: bus_master # Master AXI clock
> > +                - const: bus_slave # Slave AXI clock
> > +                - const: slave_q2a # Slave Q2A clock
> > +                - const: tbu # PCIe TBU clock
> > +                - const: ddrss_sf_tbu # PCIe SF TBU clock
> > +                - const: aggre1 # Aggre NoC PCIe1 AXI clock
> > +      properties:
> > +        resets:
> > +          maxItems: 1
> > +        reset-names:
> > +          items:
> > +            - const: pci # PCIe core reset
> > +
> >    - if:
> >        properties:
> >          compatible:
> > @@ -670,6 +723,7 @@ allOf:
> >                - qcom,pcie-sdm845
> >                - qcom,pcie-sm8150
> >                - qcom,pcie-sm8250
> > +              - qcom,pcie-sm8350
> >                - qcom,pcie-sm8450-pcie0
> >                - qcom,pcie-sm8450-pcie1
> >      then:
> > --
> > 2.35.1
> >
> >



-- 
With best wishes
Dmitry
