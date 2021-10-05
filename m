Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3078422E10
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 18:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236465AbhJEQht (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 12:37:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235588AbhJEQht (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 12:37:49 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BDD7C061749
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 09:35:58 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so26595687otj.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 09:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5cRtYvX4n7PWqwhbCmGpwqjf066BLQyAksRPgsA1dno=;
        b=BMi/ZxobJnZuM634yi3Hh7PMLe/OoOwyS5q2bc2PJxMdVO9FY5UJEMaOm4z8BL/XP3
         nlxAvIbOfvdevNyAJsr1EIOSU4lidIAIJRZcii1xk0x2aJQQZlBnejGC6YUSvqx3sk7x
         Dp6mI0L3zUCh4iStZnuHkIrNjFIhBbx76LUutjRQ4hIQp0rVq3ig+Klz49c4VGYktias
         8q05+0xa5z3YfgjnM7WvOutNrjwq7LPuOEz4AqaYED9oLMkwfnK9WakkVX56+VQ5y7vs
         LZG7KbvQ7a/pE5xpdrkzJE9FZjetteY46pnwupz2qV0HKJhNJlUYv3vS6MEV1PW9SD2j
         wBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5cRtYvX4n7PWqwhbCmGpwqjf066BLQyAksRPgsA1dno=;
        b=An3mRCUddQat9AYuLfiQMTI6RfYZzorMGqEg8QVoCHoLDtxyLvR0+H1RnO3BQVwu3P
         Mn31+1/YImuUfGWGOx1VPfblP8jDL4GZ4QTkIDhC6DTvQCbKHlgPwCvb08fjEeVtEo3X
         2Iya1KgAClyphrwXVfujsS5UFST57GGC8Wmcww9k6Y7UviQ+S3BHim3vZfPHKfusg+zw
         mUhRONEvaEzZ8e85zSgL4T6hb8S+P6NbM6Axp+VHJn/Q1efB8Fl2Oqb8A8ZzikGD9dHX
         b2Y0AlWqvJuQZ9EAG0Qk9Kse/G9hdVskIAEw2JZDM6UOTH9iozR2giSpPvu+qEzRzWvI
         rnVw==
X-Gm-Message-State: AOAM533GhEZpw3859S3GOuG/Hi/55pHCwUm2kj+NbIVT107cgGbO1pn2
        yEh6ReH5uWkNXQUR7Wm2K389PA==
X-Google-Smtp-Source: ABdhPJwtuLu5qShjiu4H9nG0Eoxlcoxl4CySIkH3zM/2v4uluDhAij6dUOKybgAzx4mPNgQnnZ1R2w==
X-Received: by 2002:a9d:1783:: with SMTP id j3mr15737714otj.366.1633451757971;
        Tue, 05 Oct 2021 09:35:57 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id 33sm2872552otm.28.2021.10.05.09.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 09:35:57 -0700 (PDT)
Date:   Tue, 5 Oct 2021 09:37:39 -0700
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
Message-ID: <YVx/U+w8zS6/P6oa@ripper>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
 <246c9d24da27b6ce91d5f1e536fa96ac5656a0b2.1633343547.git.schowdhu@codeaurora.org>
 <YVsttQySDnaXxOuI@robh.at.kernel.org>
 <b3d10d7b874c11462604a5f78bc0e8cf@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3d10d7b874c11462604a5f78bc0e8cf@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 05 Oct 06:11 PDT 2021, schowdhu@codeaurora.org wrote:

> On 2021-10-04 22:07, Rob Herring wrote:
> > On Mon, Oct 04, 2021 at 04:46:19PM +0530, Souradeep Chowdhury wrote:
> > > Added the property for EUD(Embedded USB Debug) connector.Added
> > > the "reg" and "interrupts" property which is needed for EUD.
> > 
> > You are going to need a better explanation of this h/w.
> 
> Ack. Will update this with the detailed hardware description
> in the next version.
> 
> > 
> > > 
> > > Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> > > ---
> > >  .../devicetree/bindings/connector/usb-connector.yaml      | 15
> > > +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > index 7eb8659..908129f 100644
> > > --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > > @@ -30,6 +30,21 @@ properties:
> > >            - const: samsung,usb-connector-11pin
> > >            - const: usb-b-connector
> > > 
> > > +      - items:
> > > +          - enum:
> > > +              - qcom,sc7280-usb-connector-eud
> > > +          - const: qcom,usb-connector-eud
> > > +          - const: usb-c-connector
> > > +
> > > +  reg:
> > > +    items:
> > > +      - description: EUD Base Register Region
> > > +      - description: EUD Mode Manager Region
> > 
> > A connector node represents the physical connector on a board. That
> > can't really be an MMIO peripheral. Maybe you need a node for EUD and
> > then it should have a connector child node? Don't really know without
> > understanding this h/w.
> 
> As per the previous discussion on the EUD, it was agreed upon to map EUD
> as a type C connector and use Role-Switch to change the USB role instead
> of extcon interface that was being used previously. The link for the same
> is as follows:-
> 
> https://lore.kernel.org/lkml/5db1a666-62ec-c850-6626-ad33d337b452@codeaurora.org/
> 

Not using extcon is the right thing, but perhaps we should make the EUD
a role_switch provider and client, so that we can describe how it sits
inbetween the connector and the controller.

That way it has the power to pass through or override requests from the
upstream role-switcher, based on the status of EUD.


That said, I'm still curious to what happens if I renegotiate the roles
dynamically in a Type-C environment, while enabling EUD. How would the
device on the other end of the cable know that it's supposed to be a
host? Or there's simply a reset of the link when this happens?

Thanks,
Bjorn

> > 
> > > +
> > > +  interrupts:
> > > +    description:
> > > +      EUD interrupt
> > > +
> > >    label:
> > >      description: Symbolic name for the connector.
> > > 
> > > --
> > > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> > > member
> > > of Code Aurora Forum, hosted by The Linux Foundation
> > > 
> > > 
