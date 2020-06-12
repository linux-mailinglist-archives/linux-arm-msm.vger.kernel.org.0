Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E141F72CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 06:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgFLETX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jun 2020 00:19:23 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:40220 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725947AbgFLETW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jun 2020 00:19:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591935562; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=P2KKmtNTkY3aQMCepZoevcFYFYgTZr4wbO0eMIvry+Y=; b=qJppggMUDCV/wACDOCyBQJz90vbutszeTKIGS/HaEw0Pm5KXbbaeuL69eGFhIShPilWXaODn
 d8313KoOvghcD20THDbMX6p96FEMnLQfY9kHgJMt3/Kx9VkN5jtGsbmYAqMpBNAWiORKyYoD
 HTquD/25+ZNU9MbviW//BuvSxTw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ee302470206ad41d14bd0c5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Jun 2020 04:19:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9F1F8C4339C; Fri, 12 Jun 2020 04:19:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.17.171] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6E15FC433CA;
        Fri, 12 Jun 2020 04:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6E15FC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH 1/3] usb: typec: Add QCOM PMIC typec detection driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jack Pham <jackp@codeaurora.org>
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        mark.rutland@arm.com, robh+dt@kernel.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        bryan.odonoghue@linaro.org
References: <20200609205851.30113-1-wcheng@codeaurora.org>
 <20200609205851.30113-2-wcheng@codeaurora.org>
 <20200610011837.GA14816@jackp-linux.qualcomm.com>
 <20200610193757.GB1246811@builder.lan>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <659ee90a-3d8f-9e04-9dc5-0c1521a8ba97@codeaurora.org>
Date:   Thu, 11 Jun 2020 21:19:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610193757.GB1246811@builder.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/10/2020 12:37 PM, Bjorn Andersson wrote:
>> along with USB_BASE @ 0x1300, is it ok to allow this driver to access
>> registers outside of its 'reg' base (0x1500 according to the DT
>> bindings)?
>>
> 
> Depending on how entangled a future driver for the charger blocks would
> be one could either just upstream a dcdc regulator driver to control
> vbus today, or a "lite version" of a charging driver exposing just the
> vbus regulator.
> 
> Either way I would prefer this over poking the register directly from
> this driver, as it will make it tricky to migrate to a proper charger
> driver later.
> 
> Regards,
> Bjorn
> 

Hi Bjorn/Jack,

I have removed the need for referencing other base addresses other than
the type C block within the  driver, and have moved the DCDC set to be
handled by another regulator driver, which solely controls the vbus
output.  The type C driver will control the vbus output using the
regulator APIs.  Thanks for the input.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
