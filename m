Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8233B42273B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 14:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234209AbhJEM7X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 08:59:23 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:30830 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234403AbhJEM7W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 08:59:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633438652; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=LNP3R4WHNvNPz7xGqMY7PMzJL7IKt0UlHIeyr3P3hdg=;
 b=QMqrxaIxmsyXVqK+c1JLxKk3Fx+l65YUvNU/9HnALBRHbUmBOTwLPIPcgKa01w3K+7RsiHDF
 YdUQGwprGGWZvl8VGRO6oCr1/ry8U4g7gUqZFVQXLL9dAUj58S5MPqUc9GAj15aMz0X+B/6/
 WnfsAiC/O+gycM38ET/+MjX5+zc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 615c4bb347d64efb6dbfc2d4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 12:57:23
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0F950C4360C; Tue,  5 Oct 2021 12:57:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4F43EC4338F;
        Tue,  5 Oct 2021 12:57:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 05 Oct 2021 18:27:22 +0530
From:   schowdhu@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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
Subject: Re: [PATCH V0 2/7] dt-bindings: usb: dwc3: Update dwc3 properties for
 EUD connector
In-Reply-To: <YVsiwsemiCEmRkJ0@ripper>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
 <d4c9d60e8960968ad77a4a2c6c119a8e9cebc22d.1633343547.git.schowdhu@codeaurora.org>
 <YVsiwsemiCEmRkJ0@ripper>
Message-ID: <a624d08d661a55620130a3b5a88e6224@codeaurora.org>
X-Sender: schowdhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-04 21:20, Bjorn Andersson wrote:
> On Mon 04 Oct 04:16 PDT 2021, Souradeep Chowdhury wrote:
> 
>> Adding the address size,cell size and ranges property for EUD 
>> connector.
>> Adding the connector property for EUD which is child of dwc3 node.
>> 
> 
> When we have a Type-C controller involved, the connector is described
> using of_graph, so will we not then have two different connectors
> described, in two different ways?
> 
> Regards,
> Bjorn

Ack. Will have this updated with the of_graph in the next version.

> 
>> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 15 
>> +++++++++++++++
>>  1 file changed, 15 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml 
>> b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>> index 078fb78..3e71205 100644
>> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>> @@ -36,6 +36,14 @@ properties:
>>          - const: synopsys,dwc3
>>            deprecated: true
>> 
>> +  "#address-cells":
>> +    enum: [ 1, 2 ]
>> +
>> +  "#size-cells":
>> +    enum: [ 1, 2 ]
>> +
>> +  ranges: true
>> +
>>    interrupts:
>>      description:
>>        It's either a single common DWC3 interrupt (dwc_usb3) or 
>> individual
>> @@ -318,6 +326,13 @@ properties:
>>      items:
>>        enum: [1, 4, 8, 16, 32, 64, 128, 256]
>> 
>> +  connector:
>> +    type: object
>> +    $ref: /connector/usb-connector.yaml#
>> +    description:
>> +      Connector for dual role switch, especially for 
>> "eud-usb-c-connector"
>> +
>> +
>>  unevaluatedProperties: false
>> 
>>  required:
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 
