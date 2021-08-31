Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 268193FCACE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 17:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238916AbhHaPaB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 11:30:01 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:34269 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238632AbhHaPaB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 11:30:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630423745; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JU0ORv8xALIzRyTc2G/fAIzydYETp5J0m/dw8byxgP4=;
 b=aicwAz69au2bfpyEKkh6DsaiBSc3dIIwVNrLOnNQ/CqCMxYzVKG2QNXVxczik7BZ+NynStKM
 nzKKe24ksJML213EvmffFSgeGlLiDyLj5OrYprwzFS0tz9gd5G6HWyzTGbNgXgmOpvN1bZRw
 VZWLZ2ut0WBp9IeqNGYLxxnteyw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 612e4ab440d2129ac1eb7c4d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 31 Aug 2021 15:28:52
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 39800C43460; Tue, 31 Aug 2021 15:28:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A55BEC4338F;
        Tue, 31 Aug 2021 15:28:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 31 Aug 2021 20:58:51 +0530
From:   rajpat@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org
Subject: Re: [PATCH V6 6/7] arm64: dts: sc7280: Add QUPv3 wrapper_1 nodes
In-Reply-To: <CAE-0n51YGqp701EzUs1Q1PG89SECVQDdUPsiJ8P95xFj0UFs=A@mail.gmail.com>
References: <1629983731-10595-1-git-send-email-rajpat@codeaurora.org>
 <1629983731-10595-7-git-send-email-rajpat@codeaurora.org>
 <CAE-0n51YGqp701EzUs1Q1PG89SECVQDdUPsiJ8P95xFj0UFs=A@mail.gmail.com>
Message-ID: <18995b9913c9acb7880b01a4f61ee5d0@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-26 23:41, Stephen Boyd wrote:
> Quoting Rajesh Patil (2021-08-26 06:15:30)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> index 7c106c0..65126a7 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> @@ -225,6 +225,10 @@
>>         status = "okay";
>>  };
>> 
>> +&qupv3_id_1 {
>> +       status = "okay";
>> +};
>> +
> 
> Why enable this here but not any of the i2c/spi/uart devices that are a
> child? Can this hunk be split off to a different patch?
> 

Currently there is no usecase on qup1 and hence not enabled.
Regarding splitting this, I did not get the exact reason why we need to 
split. This patch adds all the qup wrapper1 nodes and we are enabling it 
in board file.

>>  &sdhc_1 {
>>         status = "okay";
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index a3c11b0..32f411f 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -2040,6 +2469,46 @@
>>                                 function = "qup07";
>>                         };
>> 
>> +                       qup_i2c8_data_clk:qup-i2c8-data-clk {
> 
> Unstick please.
> 

OKay.

>> +                               pins = "gpio32", "gpio33";
>> +                               function = "qup10";
>> +                       };
>> +
>> +                       qup_i2c9_data_clk:qup-i2c9-data-clk {
>> +                               pins = "gpio36", "gpio37";
>> +                               function = "qup11";
>> +                       };
>> +
>> +                       qup_i2c10_data_clk:qup-i2c10-data-clk {
>> +                               pins = "gpio40", "gpio41";
>> +                               function = "qup12";
>> +                       };
>> +
>> +                       qup_i2c11_data_clk:qup-i2c11-data-clk {
>> +                               pins = "gpio44", "gpio45";
>> +                               function = "qup13";
>> +                       };
>> +
>> +                       qup_i2c12_data_clk:qup-i2c12-data-clk {
>> +                               pins = "gpio48", "gpio49";
>> +                               function = "qup14";
>> +                       };
>> +
>> +                       qup_i2c13_data_clk:qup-i2c13-data-clk {
>> +                               pins = "gpio52", "gpio53";
>> +                               function = "qup15";
>> +                       };
>> +
>> +                       qup_i2c14_data_clk:qup-i2c14-data-clk {
>> +                               pins = "gpio56", "gpio57";
>> +                               function = "qup16";
>> +                       };
>> +
>> +                       qup_i2c15_data_clk:qup-i2c15-data-clk {
>> +                               pins = "gpio60", "gpio61";
>> +                               function = "qup17";
>> +                       };
> 
> All of these.
> 
>> +
>>                         qup_spi0_data_clk: qup-spi0-data-clk {
>>                                 pins = "gpio0", "gpio1", "gpio2";
>>                                 function = "qup00";
