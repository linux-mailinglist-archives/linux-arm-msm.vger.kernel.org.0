Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C2C3FCAD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Aug 2021 17:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238853AbhHaPaO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Aug 2021 11:30:14 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:34269 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239236AbhHaPaO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Aug 2021 11:30:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630423759; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1wjfqH6SjSqgbUkenE+986s+TjEHubpWhXiHSz3Ysb0=;
 b=CHi+e2Zd1RdiHNtuu4sFeiPs7g5OLUPwDItQ8LWrwy/rjeph1ypN+d/UfbyCjHSdXrJt5ryt
 fDprs5DKMmDEdoIbAX/3mkCbnby8pyV17U7NSqlrRZ2a9iQPj5n9RJnPeKDH0sG0E4AXYqln
 PkpMc+vFKCgKFpM9hzJZH2+LnYI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 612e4acfb52e91333c55da9a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 31 Aug 2021 15:29:19
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E3FF2C43616; Tue, 31 Aug 2021 15:29:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 82703C43460;
        Tue, 31 Aug 2021 15:29:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 31 Aug 2021 20:59:18 +0530
From:   rajpat@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org
Subject: Re: [PATCH V6 1/7] arm64: dts: sc7280: Add QSPI node
In-Reply-To: <CAE-0n50-9df1riEwcbbS9Dxd5WhKFBKqXAHu-bkwdP4z1NKTWA@mail.gmail.com>
References: <1629983731-10595-1-git-send-email-rajpat@codeaurora.org>
 <1629983731-10595-2-git-send-email-rajpat@codeaurora.org>
 <CAE-0n50-9df1riEwcbbS9Dxd5WhKFBKqXAHu-bkwdP4z1NKTWA@mail.gmail.com>
Message-ID: <c24bbc059a15ac23c23bf742040728da@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-26 23:32, Stephen Boyd wrote:
> Can you please Cc folks who have reviewed prior series when you send
> again?
> 
> Quoting Rajesh Patil (2021-08-26 06:15:25)
>> From: Roja Rani Yarubandi <rojay@codeaurora.org>
>> 
>> Add QSPI DT node and qspi_opp_table for SC7280 SoC.
> 
> Might be worth adding here that we put the opp table in / because SPI
> nodes assume any child node is a spi device and so we can't put the
> table underneath the spi controller.
> 

Okay

>> 
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 62 
>> ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 62 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 53a21d0..f8dd5ff 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -1318,6 +1337,24 @@
>>                         };
>>                 };
>> 
>> +               qspi: spi@88dc000 {
>> +                       compatible = "qcom,qspi-v1";
>> +                       reg = <0 0x088dc000 0 0x1000>;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +                       interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
>> +                                <&gcc GCC_QSPI_CORE_CLK>;
>> +                       clock-names = "iface", "core";
>> +                       interconnects = <&gem_noc MASTER_APPSS_PROC 0
>> +                                       &cnoc2 SLAVE_QSPI_0 0>;
>> +                       interconnect-names = "qspi-config";
>> +                       power-domains = <&rpmhpd SC7280_CX>;
>> +                       operating-points-v2 = <&qspi_opp_table>;
>> +                       status = "disabled";
>> +
> 
> Nitpick: Drop newline above.

Okay

> 
>> +               };
>> +
>>                 dc_noc: interconnect@90e0000 {
>>                         reg = <0 0x090e0000 0 0x5080>;
>>                         compatible = "qcom,sc7280-dc-noc";
