Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0324F12AA6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2019 06:56:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbfLZF4f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Dec 2019 00:56:35 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:12648 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725815AbfLZF4e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Dec 2019 00:56:34 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577339794; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=OBzp2vx5t+U+RC6FagxULdtyTXd6+xbZUL8IMXMmGv8=; b=dHsrxhjk9OJQrchw+TDJVTJ/AsxW/0k3rX7vi4kUy+B33x5nyHDfJ0VwTKbuFShhCZpq6DTw
 9UCmUDf/cOSp0wA7HuW9Iqu0u7LaGOnkBPNnmIeyfe4KGtXDDyH14TlWk567RJ2GDwy0QnE5
 QJpiMpOzWDBX09oqqgfzoX+V7Xc=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e044b91.7f315a318688-smtp-out-n03;
 Thu, 26 Dec 2019 05:56:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CB968C4479D; Thu, 26 Dec 2019 05:56:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.25.219] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 969F9C43383;
        Thu, 26 Dec 2019 05:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 969F9C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: qcom,dwc3: Convert USB DWC3
 bindings
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
References: <1576474742-23409-1-git-send-email-sanm@codeaurora.org>
 <1576474742-23409-2-git-send-email-sanm@codeaurora.org>
 <CAD=FV=U48gdGHMbQ22M_59t6va2n41Zh1CDTqMJYpLCwiD35Mg@mail.gmail.com>
From:   "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Message-ID: <d0e0f983-1284-b641-0d74-bc4f49ef1d80@codeaurora.org>
Date:   Thu, 26 Dec 2019 11:26:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=U48gdGHMbQ22M_59t6va2n41Zh1CDTqMJYpLCwiD35Mg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

On 12/18/2019 12:44 AM, Doug Anderson wrote:
> Hi,
>
> On Sun, Dec 15, 2019 at 9:40 PM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>>
>>
>> +    items:
>> +      - description: System Config NOC clock. Not present on "qcom,msm8996-dwc3" compatible.
>> +      - description: Master/Core clock, have to be >= 125 MHz for SS operation and >= 60MHz for HS operation
> To make the grammer gooder, s/have/has/
>
>
>> +      - description: System bus AXI clock. Not present on "qcom,msm8996-dwc3" compatible.
>> +      - description: Mock utmi clock needed for ITP/SOF generation in host mode.Its frequency should be 19.2MHz.
>> +      - description: Sleep clock, used for wakeup when USB3 core goes into low power mode (U3).
> * Please word wrap to ~80 chracters.
> * As Stephen says, order matters.  Please match order of old bindings
> (and in clock-names)
> * Please end each with a period.

Regarding the order of clocks, If I change the order  I am facing error 
in make dtbs_check

linux-next/arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml: usb@a6f8800: 
clock-names:0: 'core' was expected
linux-next/arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml: usb@a6f8800: 
clock-names:1: 'mock_utmi' was expected
linux-next/arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml: usb@a6f8800: 
clock-names:2: 'sleep' was expected
linux-next/arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml: usb@a6f8800: 
clock-names:3: 'cfg_noc' was expected
linux-next/arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml: usb@a6f8800: 
clock-names:4: 'iface' was expected

Need to modify in the sc7180.dtsi and sdm845.dtsi  to avoid the error  . 
Please let me know how to proceed.

>
>
>> +  clock-names:
>> +    minItems: 3
>> +    items:
>> +      - const: cfg_noc
>> +      - const: core
>> +      - const: iface
>> +      - const: mock_utmi
>> +      - const: sleep
>> +
>>
>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
