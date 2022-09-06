Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63AF45AF447
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 21:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbiIFTPA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 15:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbiIFTO6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 15:14:58 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC3B786EB
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 12:14:56 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id e20so16859109wri.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 12:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=gvPESzLpY6u1LTvkQ/VxBL4ihvtg/iVVRexp1JQT68U=;
        b=Sh4U0KNGDRZAxg+JbByc/lzJN+bGHvkdKKkJXcCga0+Bj12T2UqdTB621WApI7xgC+
         WBUeQfUtfRFxSkGndQmM/gmJJDhBWgx3B7zJcd35kCxO0Y69kWfMEzLRz+HL3KsoRKbo
         ugYXLb5xQAyTKNlq6TGbHjnNsCFtukxZnI8n61xNUCohMd7sCpiln7H/ZIsQd97XTAYM
         GnJNRYGyQKm9Tmo8Bs1UNMbxpZcdWHMGxB/eGiutPhz06yFS0ML8lMvALRZYJd7q0L2b
         dqNe3TDc5gR2jyYHcXsM1Fz1WqYln+TYsMS9d8woX2ta7NHqDH7yTpjccSP3EoGgug1g
         RYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=gvPESzLpY6u1LTvkQ/VxBL4ihvtg/iVVRexp1JQT68U=;
        b=FSzfK/HR4vkt2OcL29QLaarv85MRq68ftwQl9KaJuv+GCjiLetX9TXtzJbVhjkZONq
         Sb5+ulugYRf3E/DBoX/OzFxxLrw5htI3wX0ohKAb3sYGcGQGUf9IQuOxkmwPTFFRa99V
         Bvtvggptv8u4yEIoHx/bbrouw4YUpSGPRd78iTaGGEfK495gvK/YDvuml6bLePPnzYW7
         b629KizofuUyNnNS1nSPfvu3hBqSP5eYBcsKAB/byfoN361W+sD2fAB1fug4WvUpwie1
         SaCmzN2Lpr6Z8o+wTPpnPQ4ASe9mviQON6AyFkim+j8Q7R5R+/NnSYfxeS9VY2XklpRG
         pdNg==
X-Gm-Message-State: ACgBeo0cf51lPMW34OqESAQY4IhHrh2+OYy18l8jzZ6bHWO/T7cO0x1I
        3GG0gcKvvU0DDWo0s8nBczaguQ==
X-Google-Smtp-Source: AA6agR5tbpF5Im0z0sX3351+86BY/+/J5/WwQY/7WYGKoBmH8Zb4TyiSySEMo03H3BdwA9/7GZCTHg==
X-Received: by 2002:adf:fa52:0:b0:228:9675:e6f3 with SMTP id y18-20020adffa52000000b002289675e6f3mr6015259wrr.151.1662491695375;
        Tue, 06 Sep 2022 12:14:55 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id z11-20020a056000110b00b00228dcf471e8sm2341788wrw.56.2022.09.06.12.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 12:14:54 -0700 (PDT)
Date:   Tue, 6 Sep 2022 22:14:52 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v11] dt-bindings: misc: fastrpc convert bindings to yaml
Message-ID: <YxecLFC9HTye4FPP@linaro.org>
References: <20220906150102.3399115-1-abel.vesa@linaro.org>
 <67657fa4-4b15-da4c-db3a-907b2a5b6d92@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67657fa4-4b15-da4c-db3a-907b2a5b6d92@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22-09-06 18:12:51, Krzysztof Kozlowski wrote:
> On 06/09/2022 17:01, Abel Vesa wrote:
> > Convert Qualcomm FastRPC bindings to yaml format, so that we could validate
> > dt-entries correctly and any future additions can go into yaml format.
> > 
> 
> Thank you for your patch. There is something to discuss/improve.
> 
> > +
> > +patternProperties:
> > +  "(compute-)?cb@[0-9]*$":
> > +    type: object
> > +
> > +    description: >
> > +      Each subnode of the Fastrpc represents compute context banks available on the dsp.
> > +
> > +    properties:
> > +      compatible:
> > +        const: qcom,fastrpc-compute-cb
> > +
> > +      reg:
> > +        maxItems: 1
> > +
> > +      qcom,nsession:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        default: 1
> > +        description: >
> > +          A value indicating how many sessions can share this context bank.
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> 
> I think this was pointed previously by Rob in v4 - you need here
> additionalProperties: false (on that level of indentation).

Ugh, I thought if the check doesn't complain, it is not necessary to add
it as false.

Will resend.

> 
> > +
> > +required:
> > +  - compatible
> > +  - label
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> 
> 
> Best regards,
> Krzysztof
