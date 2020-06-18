Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39BF41FFC4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 22:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730610AbgFRUJV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 16:09:21 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:51870 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730123AbgFRUJV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 16:09:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592510960; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=NTUeymUReKpdIsjMtCi8NYeyBb1gfEMgmYaNDWEKN9I=; b=Q1EAlq097zb1izmXTWPF/iS6Gx20iH6vBMqjomy8+TNoWzmeEiOy9+AELEVuFGFRR9OW0jLr
 0aDjuoKiiX2Jzc3ioOoTZY9S1omnmNgv6LEcJoNK1l7k9EU3DzRVxmfPXW8E/ancqCD22t7b
 RIR/ZCtAQIMyEvwr4GfE1B8XH78=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5eebc9eb6f2ee827da204a1f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Jun 2020 20:09:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7733BC433A1; Thu, 18 Jun 2020 20:09:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.38.129] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B30D0C433CA;
        Thu, 18 Jun 2020 20:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B30D0C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v3 2/6] dt-bindings: usb: Add Qualcomm PMIC type C
 controller dt-binding
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linux USB List <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jun Li <lijun.kernel@gmail.com>
References: <20200617180209.5636-1-wcheng@codeaurora.org>
 <20200617180209.5636-3-wcheng@codeaurora.org>
 <CAL_Jsq+fhXWGJvYxUDygd6hKs3dc8GKxKCz_Q+_C1AjK0J0N+w@mail.gmail.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <fb448691-2bda-ada6-799f-ee389e647710@codeaurora.org>
Date:   Thu, 18 Jun 2020 13:09:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+fhXWGJvYxUDygd6hKs3dc8GKxKCz_Q+_C1AjK0J0N+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 6/18/2020 11:33 AM, Rob Herring wrote:
> On Wed, Jun 17, 2020 at 12:02 PM Wesley Cheng <wcheng@codeaurora.org> wrote:
> 
> You are duplicating everything in usb-connector.yaml. You should have
> a $ref to it.
> 

Hi Rob,

Sure, I will add a reference to that doc.

> 
> This is wrong. The connector binding says port 0 is the connection the
> USB HS controller.
> 
> What's a type C mux node? Is there a binding for that? There's an
> ongoing discussion with the CrOS folks on how to describe Alt mode
> mux/switches.

I reviewed the connector binding previously, and couldn't seem to come
up with a model which fit a design where the type C controller (ie the
entity which does the CC orientation and role detection) does not have
the SS lane mux included.  The SS lane mux is the HW which handles the
selection of the SS lanes to utilize based on cable orientation.

I looked at the FUSB302 TCPM driver, which doesn't have an integrated SS
lane mux, and relies on an external FUSB340 switch to handle the
polarity, but seems that in the fusb302.c driver it doesn't implement
the polarity handler.  They might possibly have a HW output signal which
controls the mux directly, but I'm not sure on that.

Anyway, if someone wanted to take a SW approach and program an external
mux, this model doesn't seem to allow that.  This is somewhat unrelated
to the DP AUX mode switching, as that probably will only come into the
picture after the policy engine has detected there is a DP adapter
connected, whereas this is applicable to non DP/alt mode situations.

Thanks!

>> +            type: object
>> +
>> +            properties:
>> +              remote-endpoint:
>> +                maxItems: 1
>> +                description: Node reference to the type C mux
>> +
>> +          endpoint@1:
>> +            description: Connection to role switch node
> 
> Again, what's this?
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
