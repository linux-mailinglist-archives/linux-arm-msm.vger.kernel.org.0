Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 744D211CCB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 13:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729114AbfLLMA3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 07:00:29 -0500
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186]:43918
        "EHLO a27-186.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726492AbfLLMA3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 07:00:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576152027;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=bc7cWrfmPZqMkXkLHGRYUdWBqPWEuLfh+HlDxrAfJfY=;
        b=an4XUNJ52zAFsHEXeEZs2nI1NPw8/QBYO/2YhB90E7OpJZZWX8lFKgCnCHtBAy0e
        efFoE2GzHuvVR5b7DmgymX5PD0Wt2lDPWpkxmH1FxSyRel8ZcTrodWFRph/tqxNcaOn
        rPKmujqTN3gsdT+ieOUsbgQtuTKE5xuUy4mpHuU4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576152027;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=bc7cWrfmPZqMkXkLHGRYUdWBqPWEuLfh+HlDxrAfJfY=;
        b=SdvvdUMRSppg30RkkUPcDBUuVCAa/rLQsyG7t0thTFLiWZGbbVIuXFXyfkdCXrwl
        KFpckQdT4rfeV2Jrwc3jT8IC1jSmopwJ8+buonU8a3SN5P/FDxgaAIX6hTaDjkMMoP6
        8aMDW+buSLH9vja5ECj+Kjk8V4fKN0ISa9zs8kQU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 50F68C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v2 1/3] usb: dwc3: Add support for SC7180 SOC
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
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <1574940787-1004-1-git-send-email-sanm@codeaurora.org>
 <1574940787-1004-2-git-send-email-sanm@codeaurora.org>
 <CAD=FV=Uy6ryrbpzFg1sesJkWrgh05tLgvtozx0afJPF_u4-ESA@mail.gmail.com>
From:   "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Message-ID: <0101016ef9fb521b-1d7e4d62-c20c-4958-bfea-70664315040e-000000@us-west-2.amazonses.com>
Date:   Thu, 12 Dec 2019 12:00:27 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Uy6ryrbpzFg1sesJkWrgh05tLgvtozx0afJPF_u4-ESA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-SES-Outgoing: 2019.12.12-54.240.27.186
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 12/12/2019 1:13 AM, Doug Anderson wrote:
> Hi,
>
> On Thu, Nov 28, 2019 at 3:35 AM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>> Add compatible for SC7180 SOC in USB DWC3 driver
>>
>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>> ---
>>   drivers/usb/dwc3/dwc3-qcom.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index 261af9e..1df2372 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -1,5 +1,5 @@
>>   // SPDX-License-Identifier: GPL-2.0
>> -/* Copyright (c) 2018, The Linux Foundation. All rights reserved.
>> +/* Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
>>    *
>>    * Inspired by dwc3-of-simple.c
>>    */
>> @@ -753,6 +753,7 @@ static const struct of_device_id dwc3_qcom_of_match[] = {
>>          { .compatible = "qcom,dwc3" },
>>          { .compatible = "qcom,msm8996-dwc3" },
>>          { .compatible = "qcom,msm8998-dwc3" },
>> +       { .compatible = "qcom,sc7180-dwc3" },
>>          { .compatible = "qcom,sdm845-dwc3" },
> It is, of course, up to Felipe.  ...but in my opinion this is the
> wrong change and instead we should be deleting the SoC-specific
> strings (msm8996, msm8998, sdm845) from this file because they don't
> buy us anything.  To explain how it works:
>
> 1. Device tree should have both the "SoC-specific" and generic
> "qcom,dwc3" strings.  Only the "qcom,dwc3" will actually be used but
> the SoC-specific string is there so if we find a case later where we
> need to handle a SoC-specific quirk then it'll already be there.
>
> 2. Bindings should have both the "SoC-specific" and generic
> "qcom,dwc3" strings.  The binding is describing what's in the device
> tree.
>
> 3. Until we have a SoC-specific quirk to handle, we _don't_ need to
> add the SoC-specific string to the driver itself.
>
>
> -Doug
>
Can i remove this patch { .compatible = "qcom,sc7180-dwc3" }, in the 
next version of this series ?

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

