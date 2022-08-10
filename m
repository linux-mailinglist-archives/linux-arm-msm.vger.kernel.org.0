Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDF9258F325
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Aug 2022 21:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233052AbiHJTax (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Aug 2022 15:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232908AbiHJTav (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Aug 2022 15:30:51 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53DF275389
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 12:30:48 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id l188so18741549oia.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 12:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=NwgXjNaIXT7rH65EUl1dyeLewrPUELXtTgeTQdMLe+E=;
        b=x51/E5hDzQgFUX5IDIMO+0+qp06hlb6XGB2wzq0X2tJe62rx2rvh5yS8+6Ra2XbppH
         uoBHnv16WXOfyHrONX8AlICDeiAHAOvTBfm09xJ8VDPUttwhsiIkYaGsYxxkOnVGFTTH
         UISv5WrjFRuTPF5Chq8qKIyAJsFUzBZHF/gCv/8sonfWDjQ/svsT3NhEqBk1iWikbDVD
         DSuR8oSWmQTuqDTNw788Wrrk+NKZU3d03rWPjh4Rv25+klF59OMp2VPy4ZDWK+fmTBJw
         HRqJcWIqa0XU5Ah7r2qMWJ4hJEDxnfFzDWkB8bFJEjqo5+9MjcEtqVRJ/Mq6wuUemxID
         z30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=NwgXjNaIXT7rH65EUl1dyeLewrPUELXtTgeTQdMLe+E=;
        b=N1fj23fMFNStKMTkvPSS/TuzMfpBhhJXqCpW4E2EU/6gFN/PV+y3FyKyLEAwB7n/rP
         RBWl34PVSGbkWG6omYXJicycSbcFRkdhZF5xgazaUgOqNRiHg/65FQaIQyWei+Qbgu/n
         Ov+JGa98h67+ZpgheSHfkEfuBx3OvwyFGpy+FTUQPKRIK6ZCfwMNSckzaW/hSa6y/ch/
         hRHAG7DF9eR9BcIeEfKQHAUpP9aOig0/mJpjAeMBVc+qYBRREFojJsQ94VDtZ8jdySqh
         Zvogpokduo0NZk+YoTDfDiRFytB9C6bdwmBc6/aobjHQ1s4rKG7/MchQeiyJ67yKezTN
         dOhQ==
X-Gm-Message-State: ACgBeo3PNXaJPhqiM/iS2vGtEC9ri5WpeMy1M0Dx5Br4JMNLsQ0BKcFU
        kJBiQSFy5/Y8CZRuzqxdL1/bMg==
X-Google-Smtp-Source: AA6agR6uCpFhs/aaQcXxM0h5iWRFp9CRyHa+NsPEEGZPDgDlQJe+SPfDlBEK0GF6bziC+igOBicLrA==
X-Received: by 2002:a05:6808:124b:b0:2da:38f0:945f with SMTP id o11-20020a056808124b00b002da38f0945fmr1981969oiv.171.1660159847678;
        Wed, 10 Aug 2022 12:30:47 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l3-20020aca1903000000b00339c8aab320sm768712oii.3.2022.08.10.12.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 12:30:47 -0700 (PDT)
Date:   Wed, 10 Aug 2022 12:33:23 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: supply: Add Lenovo Yoga C630 EC
Message-ID: <YvQIA5Xnp1LaIIUf@ripper>
References: <20220810030500.2793882-1-bjorn.andersson@linaro.org>
 <20220810030500.2793882-2-bjorn.andersson@linaro.org>
 <ceb74aee-6436-f1f6-2408-fd01475cb234@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ceb74aee-6436-f1f6-2408-fd01475cb234@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 10 Aug 06:35 PDT 2022, Krzysztof Kozlowski wrote:

> On 10/08/2022 06:04, Bjorn Andersson wrote:
> > Add binding for the Embedded Controller found in the Qualcomm
> > Snapdragon-based Lenovo Yoga C630.
> 
> Thank you for your patch. There is something to discuss/improve.
> 
> > +
> > +description:
> > +  The Qualcomm Snapdragon-based Lenovo Yoga C630 has an Embedded Controller
> > +  (EC) which handles things such as battery and USB Type-C. This binding
> > +  describes the interface, on an I2C bus, to this EC.
> > +
> > +properties:
> > +  compatible:
> > +    const: lenovo,yoga-c630-ec
> > +
> > +  reg:
> > +    const: 0x70
> > +
> > +  '#address-cells':
> > +    const: 1
> 
> Just to clarify: the EC have physically two USB connectors?
> 

Correct, while it's only possible to do Displayport on the second
connector, the EC is involved in both the connectors - based on the
events received from it.

> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  '^connector@\d$':
> > +    $ref: /schemas/connector/usb-connector.yaml#
> 
> unevaluatedProperties:false inside connector (on its level)
> 

Okay, will update accordingly.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |+
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    i2c1 {
> > +      clock-frequency = <400000>;
> > +
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      embedded-controller@70 {
> > +        compatible = "lenovo,yoga-c630-ec";
> > +        reg = <0x70>;
> > +
> > +        interrupts-extended = <&tlmm 20 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        connector@0 {
> > +          compatible = "usb-c-connector";
> > +          reg = <0>;
> > +          power-role = "source";
> > +          data-role = "host";
> > +        };
> > +
> > +        connector@1 {
> > +          compatible = "usb-c-connector";
> > +          reg = <1>;
> > +          power-role = "source";
> > +          data-role = "host";
> > +
> > +          ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            port@1 {
> > +              reg = <1>;
> > +              lenovo_ec_dp_in: endpoint {
> > +                   remote-endpoint = <&mdss_dp_out>;
> 
> You have inconsistent indentation. Use 4-spaces for entire DTS example.
> 

Odd, will fix.

Thanks,
Bjorn

> Best regards,
> Krzysztof
