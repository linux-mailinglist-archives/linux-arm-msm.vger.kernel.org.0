Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A17181BB1D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 01:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgD0XJX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 19:09:23 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:44224 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726204AbgD0XJW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 19:09:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588028962; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=oMxZb5I+GDPuJhllgcs2iwGmqgsZIZTUBZ0afvMS0fU=;
 b=NaNtYfuXRxYXeNZ40LvF7lycdRUsTfg2uYe2MwvxHA8BK/y/ynAK7YB7aWTkbQShhUBceQH6
 5iCvCgsduzRy/Npjqzk0gNItd5Cuj3HPwgToKOAnA24dIBEPKEDssw8MwjT6v3buGDqcxdx6
 pTwY9arSivknFXeTzPC1QCDoUrI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea76613.7fdbc1aff998-smtp-out-n03;
 Mon, 27 Apr 2020 23:09:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 10FD8C432C2; Mon, 27 Apr 2020 23:09:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6377CC433CB;
        Mon, 27 Apr 2020 23:09:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 27 Apr 2020 16:09:06 -0700
From:   tanmay@codeaurora.org
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, swboyd@chromium.org,
        seanpaul@chromium.org, abhinavk@codeaurora.org,
        varar@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org,
        dri-devel <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] dt-bindings: msm: disp: Add Display Port HPD GPIO
 bindings
In-Reply-To: <20200415152439.GA9882@bogus>
References: <1586299709-14222-1-git-send-email-tanmay@codeaurora.org>
 <20200415152439.GA9882@bogus>
Message-ID: <7fb3a6c19c244c4a37bded7cd249a1f8@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Rob for reviews.

We are using Display Port Controller block to detect hot plug.
So we won't be using that pin as GPIO.

I found now that we don't need any bindings for that pin in such case.
So I am abandoning this patch series and upload new patch.

Thanks.

On 2020-04-15 08:24, Rob Herring wrote:
> On Tue, Apr 07, 2020 at 03:48:28PM -0700, Tanmay Shah wrote:
>> Add Display Port HPD GPIO description in bindings
>> 
>> This Patch depends on:
>> 	https://patchwork.kernel.org/patch/11468505/
> 
> This belongs below the '---' and probably means you should send all 
> this
> as one series.
> 
>> 
>> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml | 7
> +++++++
>>  1 file changed, 7 insertions(+)
>> 
>> diff --git
> a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
>> index 761a01d..003f5f7 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
>> @@ -155,6 +155,11 @@ properties:
>>       data-lanes:
>>         description: Maximum number of lanes that can be used for
> Display port.
>> 
>> +     dp-hpd-gpio:
> 
> We already have a standard property for this. Use it.
> 
> It belongs in the connector node as HPD is part of the connector.
> 
>> +       maxItems: 1
>> +       description: Specifies HPD gpio for DP connector without
>> +                    USB PHY or AUX switch.
>> +
>>       usbplug-cc-gpio:
> 
> Note that this too should be in a connector node.
> 
>>         maxItems: 1
>>         description: Specifies the usbplug orientation gpio.
>> @@ -282,6 +287,8 @@ examples:
>>          aux-sel-gpio = <&msmgpio 110 1>;
>>          usbplug-cc-gpio = <&msmgpio 90 1>;
>> 
>> +        dp-hpd-gpio = <&msmgpio 117 0>;
>> +
>>          ports {
>>              #address-cells = <1>;
>>              #size-cells = <0>;
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> Forum,
>> a Linux Foundation Collaborative Project
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
