Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 842BB42D1EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 07:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhJNFnN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 01:43:13 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:46347 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229883AbhJNFnM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 01:43:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634190068; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=9fdRm3w+EXS1CImmOMXTLhvEwCi0R+qogctHD7rq2Eg=; b=mF8rAdAaoiX9dbu7NgOiXzbwBAxPDfYwV7tMUQ8tW6vtPhR5uu7DoZR+raGcJ/sS4CED1gVB
 lSMrR1t31YMrTgNmXt65Lob5K3GQYYPOcDqZI6ufO+y2PjnzzBLrmVDMk3M+TaaOBrnsLa/g
 EvYcZMA666cip7y1db6PmKyKtXI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6167c2f2f3e5b80f1fccee18 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Oct 2021 05:41:06
 GMT
Sender: sanm=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2EC6BC4361B; Thu, 14 Oct 2021 05:41:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.106] (unknown [124.123.178.93])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 61060C4360D;
        Thu, 14 Oct 2021 05:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 61060C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] usb: dwc: host: add xhci_plat_priv quirk
 XHCI_SKIP_PHY_INIT
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, ppratap@codeaurora.org,
        pkondeti@codeaurora.org
References: <1633946518-13906-1-git-send-email-sanm@codeaurora.org>
 <YWU6IZwm2T24ONW2@kroah.com>
From:   Sandeep Maheswaram <sanm@codeaurora.org>
Message-ID: <09477c8a-f242-202c-8ead-eebc4f1cdd7d@codeaurora.org>
Date:   Thu, 14 Oct 2021 11:10:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YWU6IZwm2T24ONW2@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 10/12/2021 1:02 PM, Greg Kroah-Hartman wrote:
> On Mon, Oct 11, 2021 at 03:31:57PM +0530, Sandeep Maheswaram wrote:
>> dwc3 manages PHY by own DRD driver, so skip the management by
>> HCD core.
>> During runtime suspend phy was not getting suspend because
>> runtime_usage value is 2.
>>
>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>> ---
>>   drivers/usb/dwc3/host.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
>> index f29a264..0921f05 100644
>> --- a/drivers/usb/dwc3/host.c
>> +++ b/drivers/usb/dwc3/host.c
>> @@ -11,6 +11,11 @@
>>   #include <linux/platform_device.h>
>>   
>>   #include "core.h"
>> +#include "../host/xhci-plat.h"
> Why are you tying the dwc3 driver to the xhci driver?
>
Can we add a  property usb-skip-phy-init  in drivers/usb/dwc3/host.c

props[prop_idx++] = PROPERTY_ENTRY_BOOL("usb-skip-phy-init");

and set the quirk like this in xhci-plat.c

if (device_property_read_bool(tmpdev, "usb-skip-phy-init"))
             xhci->quirks |= XHCI_SKIP_PHY_INIT;

as below

if (device_property_read_bool(tmpdev, "usb2-lpm-disable"))
             xhci->quirks |= XHCI_HW_LPM_DISABLE;

  if (device_property_read_bool(tmpdev, "usb3-lpm-capable"))
             xhci->quirks |= XHCI_LPM_SUPPORT;



>> +
>> +static const struct xhci_plat_priv xhci_plat_dwc3_xhci = {
>> +	.quirks = XHCI_SKIP_PHY_INIT,
> If these quirks are now "global", they should go into a
> include/linux/usb/ .h file, right?
>
> thanks,
>
> greg k-h
