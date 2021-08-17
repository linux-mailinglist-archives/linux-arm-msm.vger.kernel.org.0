Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3F03EE7F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Aug 2021 10:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234933AbhHQIEW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Aug 2021 04:04:22 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:34387 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234906AbhHQIEU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Aug 2021 04:04:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629187427; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=F80pIu2I+RXwy7ZJxBH4JbgLg7qSwor4Bd6AsHLTWNw=;
 b=CCOeah8EBC9m3cKZ82oTUhnE7aYPCEAGSw3BYPO3k1ZDOIym7WkneyH6/yeigfS6ne9JMG8d
 57bFZXfapRCqp7XX6ckRen2qRkPSPQSf+dFd8FPGQnTEE2cpZbHfGOMBLYhBF5fw1ePmSl6f
 UeK6XuJ8n7a2rSDtH+7VD5kdL08=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 611b6d51454b7a558fa5e69d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 17 Aug 2021 08:03:29
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8EDA2C4361B; Tue, 17 Aug 2021 08:03:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D76A7C4338F;
        Tue, 17 Aug 2021 08:03:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 17 Aug 2021 13:33:28 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org,
        manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH v5 2/4] arm64: dts: qcom: sc7280: Add PCIe and PHY related
 nodes
In-Reply-To: <CAE-0n51uQJ4VDDbmpu18mJw4zcDhD-tvUDgi0LQ4-zAgBUKJ6A@mail.gmail.com>
References: <1628568516-24155-1-git-send-email-pmaliset@codeaurora.org>
 <1628568516-24155-3-git-send-email-pmaliset@codeaurora.org>
 <CAE-0n51uQJ4VDDbmpu18mJw4zcDhD-tvUDgi0LQ4-zAgBUKJ6A@mail.gmail.com>
Message-ID: <c13f2cad016c3ed5b7d70abdc9c7f812@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-11 01:01, Stephen Boyd wrote:
> Quoting Prasad Malisetty (2021-08-09 21:08:34)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 53a21d0..4500d88 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -1598,6 +1712,18 @@
>>                                         bias-bus-hold;
>>                                 };
>>                         };
>> +
>> +                       pcie1_default_state: pcie1-default-state {
>> +                               clkreq {
>> +                                       pins = "gpio79";
>> +                                       function = "pcie1_clkreqn";
>> +                               };
>> +
>> +                               wake-n {
>> +                                       pins = "gpio3";
>> +                                       function = "gpio";
> 
> This is function gpio, so presumably board designers could decide to
> change the wake gpio to something else, right? I'd prefer we move 
> wake-n
> to the board level (idp) as well. gpio79 looks fine as it is muxed to 
> be
> the pcie1_clkreqn function, not gpio, so it seems to be a dedicated pin
> for this purpose.

Sure, I will move it  IDP file in next version.
