Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8F51CA3DE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 08:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgEHG3n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 02:29:43 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:61612 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726792AbgEHG3n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 02:29:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588919382; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=CF2yXGR1Cj7U8eHdFjQo7x7s1pH7cJ9xAyOsnmO0Hew=; b=dCU6a2wtkms+lWSZSZhloxAd3f+0mOY7FNKjzAfQEZawIIiVn7tu7Z0VgIdgvFfDJbTtrM6h
 71rlh0ejgfzr1Hex0UCkmdYrbeCagxi5LqrGlkyKeeEWvGKwGs6f1gnCDqPKHxnTFoCiHkvu
 CTxtqE+PQI7iPC58Pcnm0sWLPBQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb4fc50.7f0f278679d0-smtp-out-n01;
 Fri, 08 May 2020 06:29:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1DDFAC43637; Fri,  8 May 2020 06:29:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.160] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2FD94C433D2;
        Fri,  8 May 2020 06:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2FD94C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v7 0/4] ADD interconnect support for Qualcomm DWC3 driver
To:     Matthias Kaehlcke <mka@chromium.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org>
 <20200429183542.GS4525@google.com>
From:   "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Message-ID: <a119cf75-8bda-f380-8249-173fa426279c@codeaurora.org>
Date:   Fri, 8 May 2020 11:59:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429183542.GS4525@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Felipe,

Any update about landing this series.

Regards

Sandeep

On 4/30/2020 12:05 AM, Matthias Kaehlcke wrote:
> Hi Felipe,
>
> all patches of this series have been reviewed and there are no outstanding
> comments, so I guess it should be ready to land?
>
> Thanks
>
> Matthias
>
> On Wed, Apr 01, 2020 at 10:45:41AM +0530, Sandeep Maheswaram wrote:
>> This path series aims to add interconnect support in
>> dwc3-qcom driver on SDM845 and SC7180 SoCs.
>>
>> Changes from v6 -> v7
>>    > [PATCH 2/4] Fixed review comments from Matthias in DWC3 driver.
>>    > Other patches remain unchanged.
>>
>> Changes from v5 -> v6
>>    > [PATCH 1/4] Addressed comments from Rob.
>>    > [PATCH 2/4] Fixed review comments from Matthias in DWC3 driver.
>>    > [PATCH 3/4] Ignoring 80 char limit in defining interconnect paths.
>>    > Added [PATCH 4/4] in this series. Adding interconnect nodes for SC7180.
>>      Depends on patch https://patchwork.kernel.org/patch/11417989/.	
>>
>> Changes from v4 -> v5
>>    > [PATCH 1/3] Added the interconnect properties in yaml. This patch depends
>>      on series https://patchwork.kernel.org/cover/11372641/.
>>    > [PATCH 2/3] Fixed review comments from Matthias in DWC3 driver.
>>    > [PATCH 3/3] Modified as per the new interconnect nodes in sdm845. Depends
>>      on series https://patchwork.kernel.org/cover/11372211/.
>>
>>
>> Changes from v3 -> v4
>>    > Fixed review comments from Matthias
>>    > [PATCH 1/3] and [PATCH 3/3] remains unchanged
>>
>> Changes from v2 -> v3
>>    > Fixed review comments from Matthias and Manu
>>    > changed the functions prefix from usb_* to dwc3_qcom_*
>>
>> Changes since V1:
>>    > Comments by Georgi Djakov on "[PATCH 2/3]" addressed
>>    > [PATCH 1/3] and [PATCH 3/3] remains unchanged
>>
>>
>> Sandeep Maheswaram (4):
>>    dt-bindings: usb: qcom,dwc3: Introduce interconnect properties for
>>      Qualcomm DWC3 driver
>>    usb: dwc3: qcom: Add interconnect support in dwc3 driver
>>    arm64: dts: qcom: sdm845: Add interconnect properties for USB
>>    arm64: dts: qcom: sc7180: Add interconnect properties for USB
>>
>>   .../devicetree/bindings/usb/qcom,dwc3.yaml         |   8 ++
>>   arch/arm64/boot/dts/qcom/sc7180.dtsi               |   4 +
>>   arch/arm64/boot/dts/qcom/sdm845.dtsi               |   8 ++
>>   drivers/usb/dwc3/dwc3-qcom.c                       | 128 ++++++++++++++++++++-
>>   4 files changed, 146 insertions(+), 2 deletions(-)
>>
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
