Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1D934878B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 04:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbhCYDhH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 23:37:07 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:59412 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbhCYDgw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 23:36:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616643411; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=gIiZOo+rQG4ZKk1TVmSGdcjoWQ9eXC7zr1XIk8x6G40=; b=qlUEWkEG2CV0kX51nb/e00Vn1d9lbotDqNIEx2M+0LYiZPOgi8Z4vKrQ2oaXbUdMEnxsE+Fm
 BDjptvrh+r9V4wkusF+HxjZ2pKzUH7jLD57InfLZJxRgAfJy9+6+nBubyaf8Gjrifbg7l90e
 rqGSfi2MJ1H/6Ez95xT2qDAeOv0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 605c05539a60a4db7c636190 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Mar 2021 03:36:51
 GMT
Sender: vbadigan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B29A5C433CA; Thu, 25 Mar 2021 03:36:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.102] (unknown [49.205.242.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 78DC0C433C6;
        Thu, 25 Mar 2021 03:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 78DC0C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD
 card
To:     Stephen Boyd <swboyd@chromium.org>, sbhanu@codeaurora.org
Cc:     adrian.hunter@intel.com, robh+dt@kernel.org,
        ulf.hansson@linaro.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, rampraka@codeaurora.org,
        sayalil@codeaurora.org, sartgarg@codeaurora.org,
        rnayak@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        sibis@codeaurora.org, cang@codeaurora.org, pragalla@codeaurora.org,
        nitirawa@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
References: <1616264220-25825-1-git-send-email-sbhanu@codeaurora.org>
 <161648289959.3012082.11356063123403968180@swboyd.mtv.corp.google.com>
 <363c5b7d9baca5a010552137f80a1cf4@codeaurora.org>
 <161660145349.3012082.16210818967187877873@swboyd.mtv.corp.google.com>
 <161660331135.3012082.15196616622122288364@swboyd.mtv.corp.google.com>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <781df94a-b916-76eb-10c9-e95ba789f0b7@codeaurora.org>
Date:   Thu, 25 Mar 2021 09:06:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <161660331135.3012082.15196616622122288364@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/24/2021 9:58 PM, Stephen Boyd wrote:
> Quoting Stephen Boyd (2021-03-24 08:57:33)
>> Quoting sbhanu@codeaurora.org (2021-03-24 08:23:55)
>>> On 2021-03-23 12:31, Stephen Boyd wrote:
>>>> Quoting Shaik Sajida Bhanu (2021-03-20 11:17:00)
>>>>> +
>>>>> +                       bus-width = <8>;
>>>>> +                       non-removable;
>>>>> +                       supports-cqe;
>>>>> +                       no-sd;
>>>>> +                       no-sdio;
>>>>> +
>>>>> +                       max-frequency = <192000000>;
>>>> Is this necessary?
>>> yes, to avoid lower speed modes running with high clock rates.
>> Is it part of the DT binding? I don't see any mention of it.
> Nevermind, found it in mmc-controller.yaml. But I think this is to work
> around some problem with the clk driver picking lower speeds than
> requested? That has been fixed on the clk driver side (see commit like
> 148ddaa89d4a "clk: qcom: gcc-sc7180: Use floor ops for the correct sdcc1
> clk") so ideally this property can be omitted.
This is a good have dt node.

This will align clock requests between mmc core layer and sdhci-msm
platform driver. Say, for HS200/HS400 modes of eMMC, mmc-core layer
tries to set clock at 200Mhz, whereas sdhci-msm expects 192Mhz for
these modes. So we have to rely on clock driver floor/ceil values.
By having this property, mmc-core layer itself request for 192Mhz.

Same is for SD card SDR104 mode, core layer expects clock at 208Mhz
whereas sdhci-msm can max operate only at 202Mhz. By having this
property, core layer requests only for 202Mhz for SDR104 mode.

BTW, this helps only for max possible speed modes.
In case of lower-speed modes (for DDR52) we still need to rely on clock
floor rounding.

