Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75FFB6386D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Nov 2022 10:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbiKYJ5n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Nov 2022 04:57:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbiKYJ5X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Nov 2022 04:57:23 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C81AB48432
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 01:55:34 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id e13so5678486edj.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Nov 2022 01:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gBtKZ9zx2Pm/QswfVM6U5FT5WCTySCzVA2lRu0vZYg=;
        b=3JXZ9i2lxLnQM0cikC8NLREGele7lN/5iPmgqRvmomvdJVd3s1P/7UI9EQqxvvYwBE
         oBJSlQNCRIXmr5I5hxZQR64jdXkpc9MGz811/HU+zsLeqMMJakrZozPCtn5rQnwIA1aV
         nt0ml934Gk+/97Q0m10njwYQcAI4aJDu37TymEtxLGCuFYDUN2pCG70SELy7KD4fMDve
         lfXddNnCv7FxahMPjdYDESyYgOS9udT4V/EeNHAuiYdmKOawyu4l+i/BLGFjS6x/XKF3
         dWLU0zuE6Z7/yVTjH5sfMuP/y0ODr0gSXWKD9LffW3FHscv/Vs7QqCG+z8EOm6h56Tuu
         L+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5gBtKZ9zx2Pm/QswfVM6U5FT5WCTySCzVA2lRu0vZYg=;
        b=iEfdFRwTWAKCFggaiyQR6C7ADgdopBBN4Q6dv4KCU/UQVvIb36twT6VbqGRHQ9bk3H
         cyXJEVhak2y5XN6wN41rbMEmYqL1aigt6/vTKJOyUXjMWpk7JhW01KNUdiusAEHSgLht
         fXWDGEzAuLxwY1cwyvh6zHv0bA7LbXvJZSaAl9riWJ6FR7hW/HCXX7B8tPt8B2YZIKKX
         ol1bozBQ67EMyg0B9WZLMnzbgO4oPayLLsAcOEMd75ZHXEduuBTweAF1NkZJD+E+HaKN
         NCOhbDxXDjKyyHDN6TvA+iZwign0ZU8G+f0qX7y1QK1ydzXMxH1fCeH+p9ugKog6XeV3
         NYCA==
X-Gm-Message-State: ANoB5plncfwmHsrbYhtWttGWwNZxFISbzq0SomqXVlRgZPs/KjvgQ3Ng
        gPSK3E63wZnw6BN1hU/6Iq56+w==
X-Google-Smtp-Source: AA0mqf6hz+jLPZkAJZJ35vx8mMN7LAoU9iZsAgiOtesJBekuIWWL3NO2uwsFi3tIZRuuLGXsc09FIw==
X-Received: by 2002:aa7:cc8a:0:b0:464:1296:d5d4 with SMTP id p10-20020aa7cc8a000000b004641296d5d4mr33388969edt.83.1669370133372;
        Fri, 25 Nov 2022 01:55:33 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id c17-20020aa7c991000000b004619f024864sm1568627edt.81.2022.11.25.01.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 01:55:32 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 25 Nov 2022 10:55:31 +0100
Message-Id: <COLABNHBQ1DG.1PB8SDY3FW1YY@otso>
To:     "Johan Hovold" <johan@kernel.org>
Cc:     <linux-arm-msm@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Vinod Koul" <vkoul@kernel.org>,
        "Kishon Vijay Abraham I" <kishon@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v2 1/3] dt-bindings: phy: qcom,qmp-usb3-dp: Add
 sm6350 compatible
From:   "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.13.0
References: <20221125092749.46073-1-luca.weiss@fairphone.com>
 <Y4CP9fwhDXsLu57Q@hovoldconsulting.com>
In-Reply-To: <Y4CP9fwhDXsLu57Q@hovoldconsulting.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Johan,

On Fri Nov 25, 2022 at 10:50 AM CET, Johan Hovold wrote:
> On Fri, Nov 25, 2022 at 10:27:47AM +0100, Luca Weiss wrote:
> > Add the compatible describing the combo phy found on SM6350.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> > @Johan Hovold, I've sent this v2 as RFC because there are several thing=
s
> > where I have questions on how it should be done.
> >=20
> > In this patch, you can see there's cfg_ahb (&xo_board) and power-domain=
s
> > is not set. In msm-4.19 &gcc_usb30_prim_gdsc is only used in the
> > ssusb@a600000 node, or should I also add it to qmpphy?
>
> Yeah, you may need to add a platform specific section of the clocks,
> which appear to be different, even if I'm not sure they are currently
> described correctly (xo_board as cfg_ahb and "QLINK" as ref). How are
> they named in the vendor's dts?

This is the msm-4.19 dts:
https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/a=
ndroid-msm-bramble-4.19-android11-qpr1/qcom/lagoon-usb.dtsi#354

>
> It should be OK to include the power-domain also for the PHY node.

Ack.

>
> >  .../bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-us=
b43dp-phy.yaml
> > index 6f31693d9868..3e39e3e0504d 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-p=
hy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-p=
hy.yaml
> > @@ -17,16 +17,18 @@ properties:
> >    compatible:
> >      enum:
> >        - qcom,sc8280xp-qmp-usb43dp-phy
> > +      - qcom,sm6350-qmp-usb3-dp-phy
> > =20
> >    reg:
> >      maxItems: 1
> > =20
> >    clocks:
> > -    maxItems: 4
> > +    maxItems: 5
> > =20
> >    clock-names:
> >      items:
> >        - const: aux
> > +      - const: cfg_ahb
> >        - const: ref
> >        - const: com_aux
> >        - const: usb3_pipe
>
> So this would need to be moved to an allOf: construct at the end with
> one section each for sc8280xp and sm6350.

Ack.

Thanks for the quick response!

Regards,
Luca

>
> > @@ -61,7 +63,6 @@ required:
> >    - reg
> >    - clocks
> >    - clock-names
> > -  - power-domains
> >    - resets
> >    - reset-names
> >    - vdda-phy-supply
>
> Johan

