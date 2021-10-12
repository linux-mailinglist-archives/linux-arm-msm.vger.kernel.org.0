Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3236429BE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Oct 2021 05:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbhJLDYb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 23:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbhJLDY0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 23:24:26 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CCA3C06174E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 20:22:26 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id u69so14822916oie.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Oct 2021 20:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kFWCWKAWWoaL3SV5gzB8CEd18a1l6a6FD7ldIFD7Pw4=;
        b=H1RfEtfl628J9zd0S0kNDOa95V8Wemjo6fWE24pMxl3rr4x6vq+gSRWq1uKpWq8gv+
         t3MNe5F+IoGr8j4ixeJzkXPMU/cfpzUPuqd3KYP/lUwTDsPk0CePJjb4E0Zpf7amrw5g
         0Lm3rpE/iqXtfIS6H7Tn+fyRkAAVl1xsGij6Yeydf46bw6zfFg7Ka6WsijCz0aK0NGC3
         wERRBAjgCivkm9LIb1W1DE7flexUm6omx092fj85tRxGYcE9k6WpDXth0cXkbo7U/cQd
         /p9svKOkZWNq3p4HK9FysAeKdk9jAzMuO18dhi6pACikv+e+YOrXqCiKSHxZEWbfQrsV
         JBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kFWCWKAWWoaL3SV5gzB8CEd18a1l6a6FD7ldIFD7Pw4=;
        b=dgG4DvjR5L7WSy5d1XFl629843Ilxp7YtIPy4s2XFzMSjxmDakoKaASgXqA8DnT5Yg
         +MC3gvK03P22j6IzScGqF0bHx0luqyvU/mRi0B3XxEUvr4bNPIKuMcp5sIV2z+U3fvd4
         6lBWBduIm7nUQnYipcowXbHNP9RR8F1/itBpiofcOpMVdlfOOkfi7PagFEC9VQhqgQsH
         mtbUfjXOFdkgEotwWb8gpFnANz4xKB7sgMyjAETDcN+kkAdia7xNpmkPQ9aEHu1DjGCt
         vCD2XQMnMFwTjVDOZt4oaXV6QRE0CO0rVLzlXnpEDWfm4CaK1VCaddMF5OrmBOQ19Vmu
         Uw8w==
X-Gm-Message-State: AOAM533+S/Uoa2WjHqa+NpPlSb47G1yzUxc8Gf4yGjXKBR3DbBMZeDgA
        xnS1fICt6/ZXZUz4p3CjklJtFQ==
X-Google-Smtp-Source: ABdhPJyXQxggU4Zx7haQPwT/hy0aC9lAGeEMnTLcMvco6zQgl82Zj6qAV9dmwbaEucOMPvuLc3GCkg==
X-Received: by 2002:aca:e004:: with SMTP id x4mr1905158oig.155.1634008944889;
        Mon, 11 Oct 2021 20:22:24 -0700 (PDT)
Received: from yoga ([2600:1700:a0:3dc8:c84c:8eff:fe1e:256f])
        by smtp.gmail.com with ESMTPSA id s10sm2104750oib.58.2021.10.11.20.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 20:22:24 -0700 (PDT)
Date:   Mon, 11 Oct 2021 22:22:22 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     schowdhu@codeaurora.org
Cc:     Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org,
        ckadabi@codeaurora.org, tsoni@codeaurora.org,
        bryanh@codeaurora.org, psodagud@codeaurora.org,
        satyap@codeaurora.org, pheragu@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH V0 1/7] dt-bindings: connector: Add property for eud type
 c connector
Message-ID: <YWT/buCujyK3D0WE@yoga>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
 <246c9d24da27b6ce91d5f1e536fa96ac5656a0b2.1633343547.git.schowdhu@codeaurora.org>
 <YVsttQySDnaXxOuI@robh.at.kernel.org>
 <b3d10d7b874c11462604a5f78bc0e8cf@codeaurora.org>
 <YVx/U+w8zS6/P6oa@ripper>
 <ad4f944d1166882c80a91b3fbbd15fc5@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad4f944d1166882c80a91b3fbbd15fc5@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 07 Oct 04:25 CDT 2021, schowdhu@codeaurora.org wrote:

> On 2021-10-05 22:07, Bjorn Andersson wrote:
> > On Tue 05 Oct 06:11 PDT 2021, schowdhu@codeaurora.org wrote:
> > 
> > > On 2021-10-04 22:07, Rob Herring wrote:
> > > > On Mon, Oct 04, 2021 at 04:46:19PM +0530, Souradeep Chowdhury wrote:
> > > > > Added the property for EUD(Embedded USB Debug) connector.Added
> > > > > the "reg" and "interrupts" property which is needed for EUD.
> > > >
> > > > You are going to need a better explanation of this h/w.
> > > 
> > > Ack. Will update this with the detailed hardware description
> > > in the next version.
> > > 
> > > >
> > > > >
> > > > > Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> > > > > ---
> > > > >  .../devicetree/bindings/connector/usb-connector.yaml      | 15
> > > > > +++++++++++++++
> > > > >  1 file changed, 15 insertions(+)
> > > > >
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > > > b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > > > index 7eb8659..908129f 100644
> > > > > --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > > > +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > > > @@ -30,6 +30,21 @@ properties:
> > > > >            - const: samsung,usb-connector-11pin
> > > > >            - const: usb-b-connector
> > > > >
> > > > > +      - items:
> > > > > +          - enum:
> > > > > +              - qcom,sc7280-usb-connector-eud
> > > > > +          - const: qcom,usb-connector-eud
> > > > > +          - const: usb-c-connector
> > > > > +
> > > > > +  reg:
> > > > > +    items:
> > > > > +      - description: EUD Base Register Region
> > > > > +      - description: EUD Mode Manager Region
> > > >
> > > > A connector node represents the physical connector on a board. That
> > > > can't really be an MMIO peripheral. Maybe you need a node for EUD and
> > > > then it should have a connector child node? Don't really know without
> > > > understanding this h/w.
> > > 
> > > As per the previous discussion on the EUD, it was agreed upon to map
> > > EUD
> > > as a type C connector and use Role-Switch to change the USB role
> > > instead
> > > of extcon interface that was being used previously. The link for the
> > > same
> > > is as follows:-
> > > 
> > > https://lore.kernel.org/lkml/5db1a666-62ec-c850-6626-ad33d337b452@codeaurora.org/
> > > 
> > 
> > Not using extcon is the right thing, but perhaps we should make the EUD
> > a role_switch provider and client, so that we can describe how it sits
> > inbetween the connector and the controller.
> > 
> > That way it has the power to pass through or override requests from the
> > upstream role-switcher, based on the status of EUD.
> > 
> > 
> > That said, I'm still curious to what happens if I renegotiate the roles
> > dynamically in a Type-C environment, while enabling EUD. How would the
> > device on the other end of the cable know that it's supposed to be a
> > host? Or there's simply a reset of the link when this happens?
> > 
> > Thanks,
> > Bjorn
> 
> Hi Bjorn,
> 

Hi Souradeep

> By making EUD Role-Switch provider and client do you mean that
> we should have a EUD node which will have a connector node as
> child and this connector node will have a port that points towards
> the drd role-switch?
> 
> So that my device tree node will look like the following in that case
> 
> eud@88e0000 {
>         compatible = "qcom,usb-connector-eud";
>         reg = <0 0x88e0000 0 0x2000>,
>               <0 0x88e2000 0 0x1000>;
>         interrupt-parent = <&pdc>;
>         interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
>         usb_con: connector {
>                 compatible = "usb-c-connector";
>                 label = "USB-C";
>                 port {
>                       eud_usb_output: endpoint {
>                       remote-endpoint = <&eud_usb3_input>;
>                  };
>         };
> 
> };
> 
> 
> @usb2 {
>     dwc3 {
>        usb-role-switch;
>        port {
>              eud_usb3_input: endpoint {
>                    remote-endpoint = <&eud_usb_output>;
>              };
>      };
> };

While your "output" and "input" matches the direction of the role
switching, I think the connection should be describe in the other
direction.

Also my suggestion was that EUD is both connector for the dwc3 and has a
reference to the connector described in the TypeC controller - to
properly describe the relationship:

  DWC -> EUD -> connector

With the role switching request going from the connector (pmic_glink
driver) to DWC through the EUD, which can override the vote.


That said, this is just my suggestion. You need to ensure that Rob
understands the hardware design well enough to approve your proposed
binding.


E.g. The connector in the EUD isn't a usb-c-connector, it's some
type of internal connection, the next step in that chain is the actual
usb-c-connector.

Regards,
Bjorn

> 
> Also EUD functions only in device mode, so when the role-switch is done by
> the controller
> to set the device mode, the PC on the other end becomes the host.
> 
> Thanks,
> Souradeep
> 
> > 
> > > >
> > > > > +
> > > > > +  interrupts:
> > > > > +    description:
> > > > > +      EUD interrupt
> > > > > +
> > > > >    label:
> > > > >      description: Symbolic name for the connector.
> > > > >
> > > > > --
> > > > > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> > > > > member
> > > > > of Code Aurora Forum, hosted by The Linux Foundation
> > > > >
> > > > >
