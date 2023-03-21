Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73D0B6C3C2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 21:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjCUUtj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 16:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjCUUti (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 16:49:38 -0400
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEEF0BB9D;
        Tue, 21 Mar 2023 13:49:37 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-17ac5ee3f9cso17462370fac.12;
        Tue, 21 Mar 2023 13:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679431777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smSJa7C01L9ZAtfGfuL2MISlj1MuIW27k+jiThsBapM=;
        b=vwyaEbYZ5BZDt5588vWWnZiSSw8og0+fpaN84A5/ST0juVPstCTtJVLiPyZ6NHflUn
         Qajs+x/X67dg9yTMAdbKHfy+5htPoCOfTDd7agp9rIdRpFuOjAB/90h9uM10Ew3mKj2t
         Fl04eyE0STzgABZMXNNayVid+nRs65OnILy70bogloc20tQNXMBrpyfhgAVGmiCOawyB
         avXNjt0QugvcvUKPXApr2jOeUdgFi45Rsi5/GuZ/uxZM9QmUMXszYnZOJj393O9UXaq2
         nrGaK0/An5byON6RcrMC4sWB6ut9txLgvpYmnBcLjv1gEVB/Q39yH8jaudrdeYJksBgp
         S81w==
X-Gm-Message-State: AO0yUKUf3r8XPxb476UDXGLvvAkR238GfWW2UOhhtO8jogJL97pataiD
        Q+XxWEWFryZCtAjnETewog==
X-Google-Smtp-Source: AK7set/58QBGNjJxm8hvoWaEi7mPoXuaeYPwQFwT4zb8tBacxDAZIdCxBNh7uqVSLTiYobs/3qywLw==
X-Received: by 2002:a05:6870:3121:b0:17a:a2bc:6373 with SMTP id v33-20020a056870312100b0017aa2bc6373mr178490oaa.1.1679431776991;
        Tue, 21 Mar 2023 13:49:36 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id xa22-20020a0568707f1600b0016e9308e17bsm4560770oab.52.2023.03.21.13.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 13:49:36 -0700 (PDT)
Received: (nullmailer pid 1534840 invoked by uid 1000);
        Tue, 21 Mar 2023 20:49:35 -0000
Date:   Tue, 21 Mar 2023 15:49:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, wcheng@codeaurora.org,
        caleb.connolly@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: Re: [PATCH v4 04/18] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy:
 Add port as an optional
Message-ID: <20230321204935.GA1506038-robh@kernel.org>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-5-bryan.odonoghue@linaro.org>
 <3f5efb36-f9be-0816-b9cc-dc87966552cc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f5efb36-f9be-0816-b9cc-dc87966552cc@linaro.org>
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Mar 19, 2023 at 12:45:13PM +0100, Krzysztof Kozlowski wrote:
> On 18/03/2023 13:18, Bryan O'Donoghue wrote:
> > port is required to instantiate a remote-endpoint which can receive
> > orientation-switch messages from a Type-C mux.
> > 
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >  .../bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml           | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
> > index 52886cdb0e506..1c887e34b1223 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
> > @@ -65,6 +65,12 @@ properties:
> >      description: Flag the port as possible handler of orientation switching
> >      type: boolean
> >  
> > +  port:
> > +    $ref: /schemas/graph.yaml#/properties/port
> > +    description:
> > +      A port node to link the PHY to a TypeC controller for the purpose of
> > +      handling altmode muxing and orientation switching.
> 
> Please extend the example as well.
> 
> Don't you have there two ports? USB and DP?

Or 3: USB, DP, and connector.

Please make sure this all aligns with what Bjorn and I discussed 
recently. It was for glink specifically.

Rob
