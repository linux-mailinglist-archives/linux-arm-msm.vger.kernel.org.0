Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED2D6356B96
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 13:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239011AbhDGL4r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 07:56:47 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:28496 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbhDGL4q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 07:56:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617796597; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HH+jlV8cWpLIyhC3IJoj/4gWZj94WvZRBdnU6G5qdno=;
 b=wOCESvX7hDSjBbFEbV6SQiHIVnkEE2duoRaO6MLq/OIAOIybD8NxryDAHqv4TDNSZUpVdPrl
 vB+n2lztHpU4CI6P7qjE0Wieqh+7QTmWAGMnFuDH45+1lhVGjPI2jXYe3rddm7tZ/ncu5SPq
 3eJxesKeRPajVkdv1vlh2WVTr+8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 606d9dee03cfff3452fa179d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Apr 2021 11:56:30
 GMT
Sender: kathirav=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 22AC0C43462; Wed,  7 Apr 2021 11:56:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E38BBC433CA;
        Wed,  7 Apr 2021 11:56:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 07 Apr 2021 17:26:28 +0530
From:   Kathiravan T <kathirav@codeaurora.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Baruch Siach <baruch@tkos.co.il>, Felipe Balbi <balbi@kernel.org>,
        linux-usb@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Balaji Prakash J <bjagadee@codeaurora.org>
Subject: Re: [PATCH] usb: dwc3: reference clock configuration
In-Reply-To: <f3042097-8569-5882-06db-ae56e05cac59@synopsys.com>
References: <8fc38cb73afd31269f1ea0c28e73604c53cebb17.1612764006.git.baruch@tkos.co.il>
 <f3042097-8569-5882-06db-ae56e05cac59@synopsys.com>
Message-ID: <8cc9617dc62be17ac3a9420e7750b0ee@codeaurora.org>
X-Sender: kathirav@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-31 06:47, Thinh Nguyen wrote:
> Baruch Siach wrote:
>> From: Balaji Prakash J <bjagadee@codeaurora.org>
>> 
>> DWC_USB3_GFLADJ and DWC_USB3_GUCTL registers contain options
>> to control the behavior of controller with respect to SOF and ITP.
>> The reset values of these registers are aligned for 19.2 MHz
>> reference clock source. This change will add option to override
>> these settings for reference clock other than 19.2 MHz
>> 
>> Tested on IPQ6018 SoC based CP01 board with 24MHz reference clock.
>> 
>> Signed-off-by: Balaji Prakash J <bjagadee@codeaurora.org>
>> [ baruch: mention tested hardware ]
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> ---
>>  .../devicetree/bindings/usb/dwc3.txt          |  5 ++
>>  drivers/usb/dwc3/core.c                       | 52 
>> +++++++++++++++++++
>>  drivers/usb/dwc3/core.h                       | 12 +++++
>>  3 files changed, 69 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt 
>> b/Documentation/devicetree/bindings/usb/dwc3.txt
>> index 1aae2b6160c1..4ffa87b697dc 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>> @@ -89,6 +89,11 @@ Optional properties:
>>   - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field 
>> of GFLADJ
>>  	register for post-silicon frame length adjustment when the
>>  	fladj_30mhz_sdbnd signal is invalid or incorrect.
>> + - snps,quirk-ref-clock-adjustment: Value for GFLADJ_REFCLK_* fields 
>> of GFLADJ
>> +	register for reference clock other than 19.2 MHz is used.
>> + - snps,quirk-ref-clock-period: Value for REFCLKPER filed of GUCTL. 
>> This field
>> +	indicates in terms of nano seconds the period of ref_clk. To 
>> calculate the
>> +	ideal value, REFCLKPER = (1/ref_clk in Hz)*10^9.
> 
> Why is this a quirk? It's not a quirk. The user can inform the ref_clk
> period to the controller here.
> 
> The default value from GUCTL.REFCLKPER is a value from coreConsultant
> setting. The designer knows what period it should be and should 
> properly
> set it if the default is not correctly set.

Thanks Thinh for your inputs. Can we have the DT property for both the 
GUCTL.REFCLKPER and GFLADJ.REFCLK* fields?
Since GFLADJ.REFCLK* field values derived based on the GUCTL.REFCLKPER. 
In other words, are you fine with the
approach followed here? If so, we can work on the nitpicks and send the 
V2.

Please let us know your thoughts on this.

> BR,
> Thinh


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of Code Aurora Forum, hosted by The Linux Foundation
