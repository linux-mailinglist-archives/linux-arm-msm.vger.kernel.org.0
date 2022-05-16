Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B84E528955
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 17:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245500AbiEPP5Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 11:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241042AbiEPP5Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 11:57:24 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 046572DA8B
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 08:57:23 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id j12so19148366oie.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 08:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vH4NPiCLU7evHB+E7xCfaeXJAYfa3KeY6XJRC/M1pQQ=;
        b=I0Fe0t6KYm7QeHL4cN/jCuSC51Un3vdX70r9iEitsqA1K63t/YgFccUQtt/UroORI8
         gbaZVesEkVpySAvrLr+ZxLjUVe3dukyjul41x8r7yLKFveJhVJxgzFg17L1JH7HETKVb
         cDLQDMsag6+BuTw6eobY8ShmaNGmOTYpnFtwNrxPKF2lvvVWZ5INfF8/MY6caqOEZSL2
         Ye6zQvzqBWRb17tEJnPLeak7Obi9afHqFu79AV4igYmSV8K323dQsA0UpeoAsYHg5tzt
         Kryqsrc9lqQlzy1F63Lns/djLraiPwLQs50Cx9vI4MtbmKGnYkO2IDrwa/0t7UdbendC
         PYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vH4NPiCLU7evHB+E7xCfaeXJAYfa3KeY6XJRC/M1pQQ=;
        b=psQ41S7sojgLhpTaWyzNEN8vhff4SOuKSakfVn2fwGaLcRgXdSGhiNvPHJMF4UHfGH
         2eELzB3VUY64aMLEsQuV8XFQMYmw9mYU/SUjSoeSc3XUORAjsUmRvnmLPjT2TN+NG/Fv
         tdp8IWnLG+49hlycesLaKjNoEsFj5IQMvLSOg475DtgXdlBK65i/JKylI92/XLdJcDpq
         54fLhHhPdPVGWDzNPUOcVLronlvtF11DY/C6JqpiscAd4FEdnasEhQGEZBOnw3S4TUxt
         iX1tVYKqgwUXa0oiCoEP61AVtrIijmjTWIvP77LYSy4U6ZLxwTYYNmpM8kx6szF+UAls
         W3mg==
X-Gm-Message-State: AOAM531/IcaLxPFa3UpXH0OUdy0KCVggPLlcPQus0GEp3l75eyhE4oeP
        PnFVoMm8Q7XlF5sBOnVmXz9DfA==
X-Google-Smtp-Source: ABdhPJy9xU3r4l65PfMiVkn2LKSmg6ikqMXRhfqQGFiUU7W25GCBD0SlgcmefZoFQVTXGUHG7oRFmQ==
X-Received: by 2002:a05:6808:d52:b0:328:acfc:d274 with SMTP id w18-20020a0568080d5200b00328acfcd274mr8189424oik.174.1652716642349;
        Mon, 16 May 2022 08:57:22 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u23-20020a544397000000b00328b3d8a80fsm3826691oiv.50.2022.05.16.08.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 08:57:21 -0700 (PDT)
Date:   Mon, 16 May 2022 08:59:45 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,qmp: Add compatible for
 SC8280XP USB3 UNI phy
Message-ID: <YoJ08Zd/a4g+Ia0r@ripper>
References: <20220513225348.1671639-1-bjorn.andersson@linaro.org>
 <20220513225348.1671639-2-bjorn.andersson@linaro.org>
 <8b47e106-a567-8d8f-ddd9-34b71211002e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b47e106-a567-8d8f-ddd9-34b71211002e@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 16 May 00:11 PDT 2022, Krzysztof Kozlowski wrote:

> On 14/05/2022 00:53, Bjorn Andersson wrote:
> > The SC8280XP platform has a pair of 5nm USB3 UNI phys, add a compatible
> > for these.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> > index 8b850c5ab116..0a9ee5b7600d 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> > @@ -33,6 +33,7 @@ properties:
> >        - qcom,sc8180x-qmp-ufs-phy
> >        - qcom,sc8180x-qmp-usb3-phy
> >        - qcom,sc8280xp-qmp-ufs-phy
> > +      - qcom,sc8280xp-qmp-usb3-uni-phy
> 
> What about the clocks/resets/supplies in allOf:if:then?
> 

Of course, seems like I missed that part.

Thanks,
Bjorn
