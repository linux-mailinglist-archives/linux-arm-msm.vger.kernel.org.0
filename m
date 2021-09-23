Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9564F415BAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 12:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240335AbhIWKEW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 06:04:22 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:20276 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240277AbhIWKEV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 06:04:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632391370; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ZSwkghkpKQA37kwC61R4tPg4+Lb80MaPfKoCgF7cuyY=;
 b=SkUMQ9Sz5uP1JkLiIpGDPzpYHQIY5VpYE9KUkjp0B1AiNn/2JmPH2vmRMsajFQv3sTbiAmel
 00fSBhbBnizE6J925J2mrQLo2AoFzcjm9iqyx8YLdDQ98FTBFnRrDtOUPKZ/NZhhi+s2XHrW
 yVPIWhg1bgG9Zn/3UMAh/CzlilI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 614c5088e0f78151d6d16c5e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 23 Sep 2021 10:01:44
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 09BB3C4360C; Thu, 23 Sep 2021 10:01:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3AFECC4338F;
        Thu, 23 Sep 2021 10:01:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 23 Sep 2021 15:31:43 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org,
        manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH v8 4/4] PCI: qcom: Switch pcie_1_pipe_clk_src after PHY
 init in SC7280
In-Reply-To: <CAE-0n53d9wjc7-U2M6i5MzjAqOxu8oNUcihrxJv-HJnRX0TJHQ@mail.gmail.com>
References: <1631898947-27433-1-git-send-email-pmaliset@codeaurora.org>
 <1631898947-27433-5-git-send-email-pmaliset@codeaurora.org>
 <CAE-0n53d9wjc7-U2M6i5MzjAqOxu8oNUcihrxJv-HJnRX0TJHQ@mail.gmail.com>
Message-ID: <a4b5ddd8f3376688cca5e79577fed89c@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-21 01:23, Stephen Boyd wrote:
> Quoting Prasad Malisetty (2021-09-17 10:15:47)
>> On the SC7280, the clock source for gcc_pcie_1_pipe_clk_src
>> must be the TCXO while gdsc is enabled. After PHY init successful
>> clock source should switch to pipe clock for gcc_pcie_1_pipe_clk_src.
>> 
>> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
>> ---
> 
> One nit below
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
>> @@ -1488,7 +1553,9 @@ static int qcom_pcie_probe(struct 
>> platform_device *pdev)
>> 
>>         pcie->pci = pci;
>> 
>> -       pcie->ops = of_device_get_match_data(dev);
>> +       pcie_cfg = of_device_get_match_data(dev);
>> +       pcie->ops = pcie_cfg->ops;
> 
> Maybe worth failing probe with if (!pcie->ops) just to be a little
> nicer here.
> 
Thanks Stephen, I will add the check in new patch series if any.

>> +       pcie->pipe_clk_need_muxing = pcie_cfg->pipe_clk_need_muxing;
>> 
>>         pcie->reset = devm_gpiod_get_optional(dev, "perst", 
>> GPIOD_OUT_HIGH);
>>         if (IS_ERR(pcie->reset)) {
