Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B4E42277F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 15:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234981AbhJENNy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 09:13:54 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:59601 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234991AbhJENNx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 09:13:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633439523; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=U6BZdp7Nj1iB2Co/1jqzWb6n7mqm30f5x3oIRYnDtpI=;
 b=hY/FCe/9HUkIASOnEIdx4x2Vm1ezGPDytTxK7dSQ285UBr3GdQhc6YRppzf+Ni91mYhE+HPc
 ZZdA6JIKz0h6PxTUa0m0PTyMz+aeenEQMeGAcx5ACLakecTOS7OneITqUhDElswzCWV4oXeS
 CBvM2cfvZukJ0cSvP6MVnkp4mLs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 615c4f1563b1f186582a7407 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 13:11:49
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C2883C43616; Tue,  5 Oct 2021 13:11:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 03C64C4338F;
        Tue,  5 Oct 2021 13:11:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 05 Oct 2021 18:41:47 +0530
From:   schowdhu@codeaurora.org
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org,
        ckadabi@codeaurora.org, tsoni@codeaurora.org,
        bryanh@codeaurora.org, psodagud@codeaurora.org,
        satyap@codeaurora.org, pheragu@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH V0 1/7] dt-bindings: connector: Add property for eud type
 c connector
In-Reply-To: <YVsttQySDnaXxOuI@robh.at.kernel.org>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
 <246c9d24da27b6ce91d5f1e536fa96ac5656a0b2.1633343547.git.schowdhu@codeaurora.org>
 <YVsttQySDnaXxOuI@robh.at.kernel.org>
Message-ID: <b3d10d7b874c11462604a5f78bc0e8cf@codeaurora.org>
X-Sender: schowdhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-04 22:07, Rob Herring wrote:
> On Mon, Oct 04, 2021 at 04:46:19PM +0530, Souradeep Chowdhury wrote:
>> Added the property for EUD(Embedded USB Debug) connector.Added
>> the "reg" and "interrupts" property which is needed for EUD.
> 
> You are going to need a better explanation of this h/w.

Ack. Will update this with the detailed hardware description
in the next version.

> 
>> 
>> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
>> ---
>>  .../devicetree/bindings/connector/usb-connector.yaml      | 15 
>> +++++++++++++++
>>  1 file changed, 15 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/connector/usb-connector.yaml 
>> b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> index 7eb8659..908129f 100644
>> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> @@ -30,6 +30,21 @@ properties:
>>            - const: samsung,usb-connector-11pin
>>            - const: usb-b-connector
>> 
>> +      - items:
>> +          - enum:
>> +              - qcom,sc7280-usb-connector-eud
>> +          - const: qcom,usb-connector-eud
>> +          - const: usb-c-connector
>> +
>> +  reg:
>> +    items:
>> +      - description: EUD Base Register Region
>> +      - description: EUD Mode Manager Region
> 
> A connector node represents the physical connector on a board. That
> can't really be an MMIO peripheral. Maybe you need a node for EUD and
> then it should have a connector child node? Don't really know without
> understanding this h/w.

As per the previous discussion on the EUD, it was agreed upon to map EUD
as a type C connector and use Role-Switch to change the USB role instead
of extcon interface that was being used previously. The link for the 
same
is as follows:-

https://lore.kernel.org/lkml/5db1a666-62ec-c850-6626-ad33d337b452@codeaurora.org/

> 
>> +
>> +  interrupts:
>> +    description:
>> +      EUD interrupt
>> +
>>    label:
>>      description: Symbolic name for the connector.
>> 
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 
>> 
