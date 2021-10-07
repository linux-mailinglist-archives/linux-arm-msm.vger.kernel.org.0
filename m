Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DCE1425003
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 11:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240602AbhJGJ1Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 05:27:16 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:27033 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240518AbhJGJ1Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 05:27:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633598723; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=He1YImUAbrn+znVMaV7NxWs7EFm5JsbfYiiJO2b7bpY=;
 b=NdrdKfqzuJR/ferUSZibYejL/S9y1AtKs4fzLODrKiZfG5atXG9y/Pbb7twsBwt2yGIpGgEf
 BYLQ1pzvyt44jpBCWAia0e69ymcq6NseT/VTRnXioxkAPtefZWdr25LBNh6I9rxSc/u5kiYX
 JdIR7gkDeWC7XiiB61CQSbYSjCE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 615ebcf7a45ca753077e8ec9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Oct 2021 09:25:11
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 58276C43617; Thu,  7 Oct 2021 09:25:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 53DB6C4338F;
        Thu,  7 Oct 2021 09:25:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 07 Oct 2021 14:55:09 +0530
From:   schowdhu@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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
In-Reply-To: <YVx/U+w8zS6/P6oa@ripper>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
 <246c9d24da27b6ce91d5f1e536fa96ac5656a0b2.1633343547.git.schowdhu@codeaurora.org>
 <YVsttQySDnaXxOuI@robh.at.kernel.org>
 <b3d10d7b874c11462604a5f78bc0e8cf@codeaurora.org> <YVx/U+w8zS6/P6oa@ripper>
Message-ID: <ad4f944d1166882c80a91b3fbbd15fc5@codeaurora.org>
X-Sender: schowdhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-05 22:07, Bjorn Andersson wrote:
> On Tue 05 Oct 06:11 PDT 2021, schowdhu@codeaurora.org wrote:
> 
>> On 2021-10-04 22:07, Rob Herring wrote:
>> > On Mon, Oct 04, 2021 at 04:46:19PM +0530, Souradeep Chowdhury wrote:
>> > > Added the property for EUD(Embedded USB Debug) connector.Added
>> > > the "reg" and "interrupts" property which is needed for EUD.
>> >
>> > You are going to need a better explanation of this h/w.
>> 
>> Ack. Will update this with the detailed hardware description
>> in the next version.
>> 
>> >
>> > >
>> > > Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
>> > > ---
>> > >  .../devicetree/bindings/connector/usb-connector.yaml      | 15
>> > > +++++++++++++++
>> > >  1 file changed, 15 insertions(+)
>> > >
>> > > diff --git
>> > > a/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> > > b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> > > index 7eb8659..908129f 100644
>> > > --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> > > +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> > > @@ -30,6 +30,21 @@ properties:
>> > >            - const: samsung,usb-connector-11pin
>> > >            - const: usb-b-connector
>> > >
>> > > +      - items:
>> > > +          - enum:
>> > > +              - qcom,sc7280-usb-connector-eud
>> > > +          - const: qcom,usb-connector-eud
>> > > +          - const: usb-c-connector
>> > > +
>> > > +  reg:
>> > > +    items:
>> > > +      - description: EUD Base Register Region
>> > > +      - description: EUD Mode Manager Region
>> >
>> > A connector node represents the physical connector on a board. That
>> > can't really be an MMIO peripheral. Maybe you need a node for EUD and
>> > then it should have a connector child node? Don't really know without
>> > understanding this h/w.
>> 
>> As per the previous discussion on the EUD, it was agreed upon to map 
>> EUD
>> as a type C connector and use Role-Switch to change the USB role 
>> instead
>> of extcon interface that was being used previously. The link for the 
>> same
>> is as follows:-
>> 
>> https://lore.kernel.org/lkml/5db1a666-62ec-c850-6626-ad33d337b452@codeaurora.org/
>> 
> 
> Not using extcon is the right thing, but perhaps we should make the EUD
> a role_switch provider and client, so that we can describe how it sits
> inbetween the connector and the controller.
> 
> That way it has the power to pass through or override requests from the
> upstream role-switcher, based on the status of EUD.
> 
> 
> That said, I'm still curious to what happens if I renegotiate the roles
> dynamically in a Type-C environment, while enabling EUD. How would the
> device on the other end of the cable know that it's supposed to be a
> host? Or there's simply a reset of the link when this happens?
> 
> Thanks,
> Bjorn

Hi Bjorn,

By making EUD Role-Switch provider and client do you mean that
we should have a EUD node which will have a connector node as
child and this connector node will have a port that points towards
the drd role-switch?

So that my device tree node will look like the following in that case

eud@88e0000 {
         compatible = "qcom,usb-connector-eud";
         reg = <0 0x88e0000 0 0x2000>,
               <0 0x88e2000 0 0x1000>;
         interrupt-parent = <&pdc>;
         interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
         usb_con: connector {
                 compatible = "usb-c-connector";
                 label = "USB-C";
                 port {
                       eud_usb_output: endpoint {
                       remote-endpoint = <&eud_usb3_input>;
                  };
         };

};


@usb2 {
     dwc3 {
        usb-role-switch;
        port {
              eud_usb3_input: endpoint {
                    remote-endpoint = <&eud_usb_output>;
              };
      };
};

Also EUD functions only in device mode, so when the role-switch is done 
by the controller
to set the device mode, the PC on the other end becomes the host.

Thanks,
Souradeep

> 
>> >
>> > > +
>> > > +  interrupts:
>> > > +    description:
>> > > +      EUD interrupt
>> > > +
>> > >    label:
>> > >      description: Symbolic name for the connector.
>> > >
>> > > --
>> > > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
>> > > member
>> > > of Code Aurora Forum, hosted by The Linux Foundation
>> > >
>> > >
