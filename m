Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 788373FCAD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 17:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239232AbhHaPa5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 11:30:57 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:34269 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239087AbhHaPa5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 11:30:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630423802; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=DZl2umOzVTAf26EV7bCh7VqTIluTwQiSXUW6Gje600s=;
 b=NIAZHu4LF2ZkH2qSicvO/tijoqGOjSyGaT/ysxvg/P9d1hrZTuNGSS2odvay1ULmFfI6r+jL
 lygjJjvTVUUkxAN7FheUYjBN2rQ66g1oWJWoiMZ1oPMcKt8l+3kRxrSIyUWMYpVaV+m0T9pk
 5MrAIrCE7DDIKXp0c22v4eC0B8E=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 612e4ae740d2129ac1ec8fc5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 31 Aug 2021 15:29:43
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F3A2CC43619; Tue, 31 Aug 2021 15:29:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C672C4338F;
        Tue, 31 Aug 2021 15:29:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 31 Aug 2021 20:59:42 +0530
From:   rajpat@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org
Subject: Re: [PATCH V6 7/7] arm64: dts: sc7280: Add aliases for I2C and SPI
In-Reply-To: <CAE-0n538LE+Ln_4j63heVsuADOma5+oD2z6uSiQGdn7qpEhwgA@mail.gmail.com>
References: <1629983731-10595-1-git-send-email-rajpat@codeaurora.org>
 <1629983731-10595-8-git-send-email-rajpat@codeaurora.org>
 <CAE-0n538LE+Ln_4j63heVsuADOma5+oD2z6uSiQGdn7qpEhwgA@mail.gmail.com>
Message-ID: <cc32eeb9de3903aba947064849875d9d@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-26 23:42, Stephen Boyd wrote:
> Quoting Rajesh Patil (2021-08-26 06:15:31)
>> Add aliases for i2c and spi for sc7280 soc.
>> 
>> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 32 
>> ++++++++++++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 32f411f..c659f61 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -28,6 +28,38 @@
>>         aliases {
>>                 mmc1 = &sdhc_1;
>>                 mmc2 = &sdhc_2;
>> +               i2c0 = &i2c0;
>> +               i2c1 = &i2c1;
>> +               i2c2 = &i2c2;
>> +               i2c3 = &i2c3;
>> +               i2c4 = &i2c4;
>> +               i2c5 = &i2c5;
>> +               i2c6 = &i2c6;
>> +               i2c7 = &i2c7;
>> +               i2c8 = &i2c8;
>> +               i2c9 = &i2c9;
>> +               i2c10 = &i2c10;
>> +               i2c11 = &i2c11;
>> +               i2c12 = &i2c12;
>> +               i2c13 = &i2c13;
>> +               i2c14 = &i2c14;
>> +               i2c15 = &i2c15;
> 
> Please alphabet sort this on alias name. "i" before "m"

Okay i will change according to alphabet order
> 
>> +               spi0 = &spi0;
>> +               spi1 = &spi1;
>> +               spi2 = &spi2;
>> +               spi3 = &spi3;
>> +               spi4 = &spi4;
>> +               spi5 = &spi5;
>> +               spi6 = &spi6;
>> +               spi7 = &spi7;
>> +               spi8 = &spi8;
>> +               spi9 = &spi9;
>> +               spi10 = &spi10;
>> +               spi11 = &spi11;
>> +               spi12 = &spi12;
>> +               spi13 = &spi13;
>> +               spi14 = &spi14;
>> +               spi15 = &spi15;
>>         };
>> 
>>         clocks {
>> --
