Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8AA17BB81
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 12:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbgCFLV1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 06:21:27 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:12427 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726171AbgCFLV1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 06:21:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583493687; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=S9rgB4GK2W6w7XkjsGqmdclDv4AgRWYQvpM/FTcfwc4=; b=cXCWauMX2zGtvUGGw8CqkZCGvGJw+I+mUo2/Ea+5ya+gaHClokX6Jq2tX3usF0PuZQSJrQG5
 2meKZMzwABmRYFzk0x8wYW/jEnC/FfVi7Oyr3WpPhBKWJk81jmufCT48vvf7QEyYS+RpJVWR
 zv46jir5dyM6T68T2pSLOAiA55c=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e623228.7f0c189e66c0-smtp-out-n05;
 Fri, 06 Mar 2020 11:21:12 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0151AC43637; Fri,  6 Mar 2020 11:21:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.160] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E12C7C433F2;
        Fri,  6 Mar 2020 11:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E12C7C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v3 0/4] Add QMP V3 USB3 PHY support for SC7180
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
References: <1581506488-26881-1-git-send-email-sanm@codeaurora.org>
 <20200305185708.GU24720@google.com>
From:   "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Message-ID: <38a1d5e6-98ed-c887-6bb5-d32138fc465c@codeaurora.org>
Date:   Fri, 6 Mar 2020 16:51:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200305185708.GU24720@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

Will do it by 3/9.

Regards

Sandeep

On 3/6/2020 12:27 AM, Matthias Kaehlcke wrote:
> Hi Sandeep,
>
> this series has a few minor outstanding comments that prevent it from
> landing. Do you plan to respin it soon?
>
> Thanks
>
> Matthias
>
> On Wed, Feb 12, 2020 at 04:51:24PM +0530, Sandeep Maheswaram wrote:
>> Add QMP V3 USB3 PHY entries for SC7180 in phy driver and
>> device tree bindings.
>>
>> changes in v3:
>> *Addressed Rob's comments in yaml file.
>> *Sepearated the SC7180 support in yaml patch.
>> *corrected the phy reset entries in device tree.
>>
>> changes in v2:
>> *Remove global phy reset in QMP phy.
>> *Convert QMP phy bindings to yaml.
>>
>> Sandeep Maheswaram (4):
>>    dt-bindings: phy: qcom,qmp: Convert QMP phy bindings to yaml
>>    dt-bindings: phy: qcom,qmp: Add support for SC7180
>>    phy: qcom-qmp: Add QMP V3 USB3 PHY support for SC7180
>>    arm64: dts: qcom: sc7180: Correct qmp phy reset entries
>>
>>   .../devicetree/bindings/phy/qcom,qmp-phy.yaml      | 287 +++++++++++++++++++++
>>   .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 227 ----------------
>>   arch/arm64/boot/dts/qcom/sc7180.dtsi               |   4 +-
>>   drivers/phy/qualcomm/phy-qcom-qmp.c                |  38 +++
>>   4 files changed, 327 insertions(+), 229 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
>>
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
