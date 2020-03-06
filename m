Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D08AF17BB89
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 12:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgCFLVq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 06:21:46 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:12427 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725827AbgCFLVq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 06:21:46 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583493706; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Jwxyby0xndROGdVUzKRBbhM6nT8U3ucqzou3WOX2Z9k=; b=mNKTfrkHaCncA7/2Cl0kpL0kcAKMUvMrSH/LlqMPdiO/9pMAB2P60U1JgOIzwJss8yS4nIDR
 bza5c+aFuv3U6xNi48WgHtlKTFEoYIPjTFi+tT5i6Ay3stQ0DMloN0ychaQcAf5rscOCH06J
 4osdku8mElD8X6Hbs8i/CneJjpc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e623247.7f950dba90a0-smtp-out-n01;
 Fri, 06 Mar 2020 11:21:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 19688C44788; Fri,  6 Mar 2020 11:21:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.160] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 022CAC433BA;
        Fri,  6 Mar 2020 11:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 022CAC433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v4 0/8] Add QUSB2 PHY support for SC7180
To:     Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org>
 <20200203185649.GK3948@builder> <20200305185132.GT24720@google.com>
From:   "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Message-ID: <4fe18d8b-7479-7d1c-ccbe-9d9404b60ba6@codeaurora.org>
Date:   Fri, 6 Mar 2020 16:51:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200305185132.GT24720@google.com>
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

On 3/6/2020 12:21 AM, Matthias Kaehlcke wrote:
> On Mon, Feb 03, 2020 at 10:56:49AM -0800, Bjorn Andersson wrote:
>> On Wed 29 Jan 05:51 PST 2020, Sandeep Maheswaram wrote:
>>
>> Kishon, afaict this is all reviewed, let me know when you're taking the
>> phy pieces and I'll pick up the dts changes.
> The series has a few minor comments. Sandeep, could you respin the
> series so that it can be landed?
>
> Thanks
>
> Matthias
>
>>> Converting dt binding to yaml.
>>> Adding compatible for SC7180 in dt bindings.
>>> Added generic QUSB2 V2 PHY support and using the same SC7180 and SDM845.
>>>
>>> Changes in v4:
>>> *Addressed Rob Herrings comments in dt bindings.
>>> *Added new structure for all the overriding tuning params.
>>> *Removed the sc7180 and sdm845 compatible from driver and added qusb2 v2 phy.
>>> *Added the qusb2 v2 phy compatible in device tree for sc7180 and sdm845.
>>>
>>> Changes in v3:
>>> *Using the generic phy cfg table for QUSB2 V2 phy.
>>> *Added support for overriding tuning parameters in QUSB2 V2 PHY
>>> from device tree.
>>>
>>> Changes in v2:
>>> Sorted the compatible in driver.
>>> Converted dt binding to yaml.
>>> Added compatible in yaml.
>>>
>>> Sandeep Maheswaram (8):
>>>    dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy bindings to yaml
>>>    dt-bindings: phy: qcom,qusb2: Add compatibles for QUSB2 V2 phy and
>>>      SC7180
>>>    phy: qcom-qusb2: Add generic QUSB2 V2 PHY support
>>>    dt-bindings: phy: qcom-qusb2: Add support for overriding Phy tuning
>>>      parameters
>>>    phy: qcom-qusb2: Add support for overriding tuning parameters in QUSB2
>>>      V2 PHY
>>>    arm64: dts: qcom: sc7180: Add generic QUSB2 V2 Phy compatible
>>>    arm64: dts: qcom: sdm845: Add generic QUSB2 V2 Phy compatible
>>>    arm64: dts: qcom: sc7180: Update QUSB2 V2 Phy params for SC7180 IDP
>>>      device
>>>
>>>   .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 182 +++++++++++++++++++++
>>>   .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |  68 --------
>>>   arch/arm64/boot/dts/qcom/sc7180-idp.dts            |   6 +-
>>>   arch/arm64/boot/dts/qcom/sc7180.dtsi               |   2 +-
>>>   arch/arm64/boot/dts/qcom/sdm845.dtsi               |   4 +-
>>>   drivers/phy/qualcomm/phy-qcom-qusb2.c              | 143 +++++++++++-----
>>>   6 files changed, 291 insertions(+), 114 deletions(-)
>>>   create mode 100644 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
>>>   delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
>>>
>>> -- 
>>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>>> of Code Aurora Forum, hosted by The Linux Foundation
>>>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
