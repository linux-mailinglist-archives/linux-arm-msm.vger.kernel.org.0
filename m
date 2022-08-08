Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9299E58CDD0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Aug 2022 20:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244461AbiHHSmY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Aug 2022 14:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244407AbiHHSmI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Aug 2022 14:42:08 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0DE01929C
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Aug 2022 11:41:39 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id s204so11333354oif.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Aug 2022 11:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=+jov4sDK8fqguLcdGEtCS3PX7Z+/XUaiZu5mjGAoBwc=;
        b=jQh0ZktlrsGJDfa5sjbq2FHvzf4mdvXfFgJm/+h4G+SV2anYSa8bfoSW0x4cZ+a3Aw
         l0RRwnm4nakH4bXp8NL0oOLZJ9X2/pY+yndrdlsPeLyxZh/ViMnKFbDOXVx/nMOZ3cKv
         ceY+U9j3d8UqgTT7Mwyo4gRiFfM9J+QRO6t5Cg1dbWKXaphwir4V2MbeP/89G33WRA+N
         gelXSFx7JFODRcl3YrPC8cGsN7ItGYTyrXZ575oNF0+odf1LDKxLLKGQ4X6GPFW3SZHF
         m/3Y2Lopfg0cwERPa5gJWPnQOWwBWBvQIG6zrBuR4751Tjv+mDN+PExBB8PTuQP+jw75
         MChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=+jov4sDK8fqguLcdGEtCS3PX7Z+/XUaiZu5mjGAoBwc=;
        b=Ys6Y6yk1wCJ80h/vEOcoUdJ4SngSVTxbuDVpS3F+84Z06S4QE8uHRUUrqNO2ocoXbb
         JbfSvX9t0+xiu1mzEQvVsQnnazIInaQrxN4VxHiXmMU7bcasV+9IZnF+5+Q8N1MUv1Xj
         5GKzJEbdLTV99Dsa8s43QaD0PBnN3mSECVyl9cOfI/0ll7ZPIaxzYyGZZcWrwbkGYfZP
         Naq8UoofHZQJV0yJG5l1XrafLk9r/hksRG3S7xqGfz6pui6VGydkHTSUiMI8P9+ktRyB
         GWewvuJeJ4sq/PqM/ycDVDwtPfvF0HDJ2LAhRr0VQlM+M5UFDPksm31Mp/XT83ny30ns
         lQIw==
X-Gm-Message-State: ACgBeo09vR7BFgja5Tq/d5YQdYTJ9T/IFv5MUYAznfPm4dcb9pH3C+5n
        wxNYCKxAB91L36iWNApSvwmCow==
X-Google-Smtp-Source: AA6agR5bJmLFgnGWaH7lWQ9cZrofG2bX3oeGvmJg+5K1A0TzfoRbCFeR6iE+6t9h5yKMa98pNuVKGQ==
X-Received: by 2002:a05:6808:2114:b0:343:665:d54e with SMTP id r20-20020a056808211400b003430665d54emr1187227oiw.71.1659984099106;
        Mon, 08 Aug 2022 11:41:39 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y12-20020a4a650c000000b00440ed1f8c45sm2295292ooc.43.2022.08.08.11.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 11:41:38 -0700 (PDT)
Date:   Mon, 8 Aug 2022 11:44:18 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        robh@kernel.org, pavel@ucw.cz, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] dt-bindings: leds: Describe optional 'reg' property used
 for Qualcomm LPG nodes
Message-ID: <YvFZgr1RRq6tYaVC@ripper>
References: <20220721195502.1525214-1-bhupesh.sharma@linaro.org>
 <CAA8EJppGS38aP7gyd1c3kNgraAVJDoqUef2cDfZpu2aL_iwW0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppGS38aP7gyd1c3kNgraAVJDoqUef2cDfZpu2aL_iwW0g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 21 Jul 13:19 PDT 2022, Dmitry Baryshkov wrote:

> On Thu, 21 Jul 2022 at 22:55, Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
> >
> > As Bjorn noted in [1], it is useful to describe the optional
> > 'reg' property for Qualcomm LPG nodes as it is used in
> > some Qualcomm dts files.
> 
> I don't think this is correct. LPG block maps to several regions, so
> using just one of them in reg doesn't look correct.
> 

I agree, but I also like the uniformity of having unit addresses for the
devices on the spmi buses.

> > This fixes the following 'make dtbs_check' error reported for
> > pm8350c & sc8280xp pwm nodes:
> >
> > arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb:
> >  pwm@e800: 'reg' does not match any of the regexes:
> >  '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
> 
> I'd prefer to follow the existing schema and to drop the region from
> those files.
> 

I'm fine either way, but we have more of these nodes, so I would like to
hear from the DT maintainers on the direction to take. All nodes on the
spmi bus has an (at least one) address, so it would be accurate to state
this in the node.

It does however not seem like devicetree@, nor Krzysztof is Cc'ed on
this patch, so I've added them...

Regards,
Bjorn

> >
> > [1]. https://lore.kernel.org/linux-arm-msm/Ytg3tIaL5h5b9ewH@builder.lan/
> >
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: robh@kernel.org
> > Cc: pavel@ucw.cz
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> > index fe336fa16518..f394ab7a757b 100644
> > --- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> > +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
> > @@ -27,6 +27,9 @@ properties:
> >        - qcom,pmi8994-lpg
> >        - qcom,pmi8998-lpg
> >
> > +  reg:
> > +    maxItems: 1
> > +
> >    "#pwm-cells":
> >      const: 2
> >
> > --
> > 2.35.3
> >
> 
> 
> -- 
> With best wishes
> Dmitry
