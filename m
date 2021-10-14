Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCDFE42E0DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 20:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbhJNSLY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 14:11:24 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:32076 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233749AbhJNSLX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 14:11:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634234959; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=PaqL+qcUYZsZZQg/ZfKwStuB0Bng0ty0IIvhLrT9KAE=;
 b=Jq/OaSdwPGorxu9KOmcAI2z4YTU1eJG4vNsXFXt8sPJlL37M5xwu7fDPKUg0lsf1eRHVhBlu
 zNkohunJhDPNW+JWVz0HwpeD6UlAlinvmKa2NMc7h2D0d3ne6J9w7O5aucpbvVNEzQYKk9/i
 QvSZFgNXazT8cerZoC1Q9cmLu1M=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61687249446c6db0cb8da889 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Oct 2021 18:09:13
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1D361C4360C; Thu, 14 Oct 2021 18:09:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ADFBBC43460;
        Thu, 14 Oct 2021 18:09:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 14 Oct 2021 23:39:12 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        robh+dt@kernel.org, sanm@codeaurora.org, vbadigan@codeaurora.org
Subject: Re: [PATCH v1] arm64: dts: qcom: sc7280: Add pcie clock support
In-Reply-To: <CAE-0n53vBa5Tn4OEey1ZmBrM+kN5KbXv1Spoj-dtHY6jzN_bbA@mail.gmail.com>
References: <1634042171-31461-1-git-send-email-pmaliset@codeaurora.org>
 <CAE-0n53vBa5Tn4OEey1ZmBrM+kN5KbXv1Spoj-dtHY6jzN_bbA@mail.gmail.com>
Message-ID: <1d311e617667a2bbda233e423ca0b898@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-12 22:56, Stephen Boyd wrote:
> Quoting Prasad Malisetty (2021-10-12 05:36:11)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 39635da..78694c1 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -569,9 +569,10 @@
>>                         reg = <0 0x00100000 0 0x1f0000>;
>>                         clocks = <&rpmhcc RPMH_CXO_CLK>,
>>                                  <&rpmhcc RPMH_CXO_CLK_A>, 
>> <&sleep_clk>,
>> -                                <0>, <0>, <0>, <0>, <0>, <0>;
>> +                                <0>, <&pcie1_lane 0>,
>> +                                <0>, <0>, <0>, <0>;
>>                         clock-names = "bi_tcxo", "bi_tcxo_ao", 
>> "sleep_clk",
>> -                                     "pcie_0_pipe_clk", 
>> "pcie_1_pipe-clk",
>> +                                     "pcie_0_pipe_clk", 
>> "pcie_1_pipe_clk",
> 
> It looks like a fix because the name doesn't match the binding. Can you
> add a Fixes tag?
> 
Hi Stephen,

Thanks for the review.

Yes, I fixed the clock name as per the binding. I have added fixes tag 
and updated the new pacth.

Thanks
-Prasad

>>                                       "ufs_phy_rx_symbol_0_clk", 
>> "ufs_phy_rx_symbol_1_clk",
>>                                       "ufs_phy_tx_symbol_0_clk",
>>                                       
>> "usb3_phy_wrapper_gcc_usb30_pipe_clk";

