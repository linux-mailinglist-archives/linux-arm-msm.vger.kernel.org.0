Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F14A6442A46
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 10:20:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbhKBJXK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 05:23:10 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:60611 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbhKBJXA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 05:23:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635844825; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/ArAa7CKyy271Bn0zdX9atBBD7gM0Jd9fV9o5Gr98f8=;
 b=pQMfLIyp8YVMGqijYGrlSA2fVB19xjFX48ReXwXWKQp/UClSytptFvZ5jshi9ax5kFmZnrxP
 0Ko78gCuZ1wGyD8zeG+mcR6Eqhzsk6ueEQbRSxe1K0hn7nGaaC3HZC5/pQYc8qEw7k4DZTTE
 cxjrbngBGjQx/sMozRX5a6vil0Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 618102c9aeb23905565bf950 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Nov 2021 09:20:09
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AA01FC43616; Tue,  2 Nov 2021 09:20:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D7E4C4338F;
        Tue,  2 Nov 2021 09:20:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 02 Nov 2021 14:50:07 +0530
From:   schowdhu@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
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
In-Reply-To: <YWT/buCujyK3D0WE@yoga>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
 <246c9d24da27b6ce91d5f1e536fa96ac5656a0b2.1633343547.git.schowdhu@codeaurora.org>
 <YVsttQySDnaXxOuI@robh.at.kernel.org>
 <b3d10d7b874c11462604a5f78bc0e8cf@codeaurora.org> <YVx/U+w8zS6/P6oa@ripper>
 <ad4f944d1166882c80a91b3fbbd15fc5@codeaurora.org> <YWT/buCujyK3D0WE@yoga>
Message-ID: <561c9e09cb7cbee29e297515934809ea@codeaurora.org>
X-Sender: schowdhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-12 08:52, Bjorn Andersson wrote:
> On Thu 07 Oct 04:25 CDT 2021, schowdhu@codeaurora.org wrote:
> 
>> On 2021-10-05 22:07, Bjorn Andersson wrote:
>> > On Tue 05 Oct 06:11 PDT 2021, schowdhu@codeaurora.org wrote:
>> >
>> > > On 2021-10-04 22:07, Rob Herring wrote:
>> > > > On Mon, Oct 04, 2021 at 04:46:19PM +0530, Souradeep Chowdhury wrote:
>> > > > > Added the property for EUD(Embedded USB Debug) connector.Added
>> > > > > the "reg" and "interrupts" property which is needed for EUD.
>> > > >
>> > > > You are going to need a better explanation of this h/w.
>> > >
>> > > Ack. Will update this with the detailed hardware description
>> > > in the next version.
>> > >
>> > > >
>> > > > >
>> > > > > Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
>> > > > > ---
>> > > > >  .../devicetree/bindings/connector/usb-connector.yaml      | 15
>> > > > > +++++++++++++++
>> > > > >  1 file changed, 15 insertions(+)
>> > > > >
>> > > > > diff --git
>> > > > > a/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> > > > > b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> > > > > index 7eb8659..908129f 100644
>> > > > > --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> > > > > +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> > > > > @@ -30,6 +30,21 @@ properties:
>> > > > >            - const: samsung,usb-connector-11pin
>> > > > >            - const: usb-b-connector
>> > > > >
>> > > > > +      - items:
>> > > > > +          - enum:
>> > > > > +              - qcom,sc7280-usb-connector-eud
>> > > > > +          - const: qcom,usb-connector-eud
>> > > > > +          - const: usb-c-connector
>> > > > > +
>> > > > > +  reg:
>> > > > > +    items:
>> > > > > +      - description: EUD Base Register Region
>> > > > > +      - description: EUD Mode Manager Region
>> > > >
>> > > > A connector node represents the physical connector on a board. That
>> > > > can't really be an MMIO peripheral. Maybe you need a node for EUD and
>> > > > then it should have a connector child node? Don't really know without
>> > > > understanding this h/w.
>> > >
>> > > As per the previous discussion on the EUD, it was agreed upon to map
>> > > EUD
>> > > as a type C connector and use Role-Switch to change the USB role
>> > > instead
>> > > of extcon interface that was being used previously. The link for the
>> > > same
>> > > is as follows:-
>> > >
>> > > https://lore.kernel.org/lkml/5db1a666-62ec-c850-6626-ad33d337b452@codeaurora.org/
>> > >
>> >
>> > Not using extcon is the right thing, but perhaps we should make the EUD
>> > a role_switch provider and client, so that we can describe how it sits
>> > inbetween the connector and the controller.
>> >
>> > That way it has the power to pass through or override requests from the
>> > upstream role-switcher, based on the status of EUD.
>> >
>> >
>> > That said, I'm still curious to what happens if I renegotiate the roles
>> > dynamically in a Type-C environment, while enabling EUD. How would the
>> > device on the other end of the cable know that it's supposed to be a
>> > host? Or there's simply a reset of the link when this happens?
>> >
>> > Thanks,
>> > Bjorn
>> 
>> Hi Bjorn,
>> 
> 
> Hi Souradeep
> 
>> By making EUD Role-Switch provider and client do you mean that
>> we should have a EUD node which will have a connector node as
>> child and this connector node will have a port that points towards
>> the drd role-switch?
>> 
>> So that my device tree node will look like the following in that case
>> 
>> eud@88e0000 {
>>         compatible = "qcom,usb-connector-eud";
>>         reg = <0 0x88e0000 0 0x2000>,
>>               <0 0x88e2000 0 0x1000>;
>>         interrupt-parent = <&pdc>;
>>         interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
>>         usb_con: connector {
>>                 compatible = "usb-c-connector";
>>                 label = "USB-C";
>>                 port {
>>                       eud_usb_output: endpoint {
>>                       remote-endpoint = <&eud_usb3_input>;
>>                  };
>>         };
>> 
>> };
>> 
>> 
>> @usb2 {
>>     dwc3 {
>>        usb-role-switch;
>>        port {
>>              eud_usb3_input: endpoint {
>>                    remote-endpoint = <&eud_usb_output>;
>>              };
>>      };
>> };
> 
> While your "output" and "input" matches the direction of the role
> switching, I think the connection should be describe in the other
> direction.
> 
> Also my suggestion was that EUD is both connector for the dwc3 and has 
> a
> reference to the connector described in the TypeC controller - to
> properly describe the relationship:
> 
>   DWC -> EUD -> connector
> 
> With the role switching request going from the connector (pmic_glink
> driver) to DWC through the EUD, which can override the vote.
> 
> 
> That said, this is just my suggestion. You need to ensure that Rob
> understands the hardware design well enough to approve your proposed
> binding.
> 
> 
> E.g. The connector in the EUD isn't a usb-c-connector, it's some
> type of internal connection, the next step in that chain is the actual
> usb-c-connector.
> 
> Regards,
> Bjorn
> 
>> 
>> Also EUD functions only in device mode, so when the role-switch is 
>> done by
>> the controller
>> to set the device mode, the PC on the other end becomes the host.
>> 
>> Thanks,
>> Souradeep

Hi Bjorn/Robb,

Following is how my EUD design looks like

My device tree node will look like as follows


eud@88e0000 {
         compatible = "qcom,usb-connector-eud";
         reg = <0 0x88e0000 0 0x2000>,
                   <0 0x88e2000 0 0x1000>;
         interrupt-parent = <&pdc>;
         interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
          ports {
                 #address-cells = <2>;
                 #size-cells = <2>;
                 port@0 {
                         reg = <0>;
                         usb2_eud: endpoint {
                                 remote-endpoint = <&eud_ep>;
                         };
                 };
         };
};


@usb2 {
     dwc3 {
        usb-role-switch;
         usb_con: eud_usb_connector {
                 compatible = “usb-connector-eud", "usb-c-connector";
                 ports {
                         #address-cells = <2>;
                         #size-cells = <2>;
                         port@0 {
                                 reg = <0>;
                                 eud_ep: endpoint {
                                         remote-endpoint = <&usb2_eud>;
                                 };
                         };
               };
};


So, I am putting a connector node as a child of dwc3 node which can be 
connected to the EUD node via ports. I am keeping EUD as a separate 
device tree node.

I can get the device equivalent to the connector by doing the following 
in EUD driver

dev = usb_of_get_companion_dev(&pdev->dev);

Once I get the device, I can then do

role_sw = usb_role_switch_get(dev);

This will give me the role switch reference which can be used to set 
device or host role.

The advantage here is that

-> I am keeping the existing yamls untouched which won't be the case if 
I map EUD as child of dwc3.

->This is also consistent with EUD hardware since EUD is not a connector 
in itself but it needs a connector to function
   because it can work only in device mode so the role-switch needs to be 
done.

Let me know your thoughts regarding this.

Thanks,
Souradeep


>> 
>> >
>> > > >
>> > > > > +
>> > > > > +  interrupts:
>> > > > > +    description:
>> > > > > +      EUD interrupt
>> > > > > +
>> > > > >    label:
>> > > > >      description: Symbolic name for the connector.
>> > > > >
>> > > > > --
>> > > > > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
>> > > > > member
>> > > > > of Code Aurora Forum, hosted by The Linux Foundation
>> > > > >
>> > > > >
