Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 533CCCA112
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 17:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbfJCPVs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 11:21:48 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:49030 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727587AbfJCPVs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 11:21:48 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 93967611BE; Thu,  3 Oct 2019 15:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570116107;
        bh=wrF+mAtbKK35bIsjW1eEOP2bIDJkMLZvW9UvGD8kv0c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NiXzjB8POJq6c49Y2fnoEw68KFMNvPlQJ/7w6vTWJCoAnF5tMXprjguDaFGUlnesy
         fI2nk9BJxQLEnt7tLz7Ku5+ZKPjzVfwNHZVNlkNn6y2xWwO1ynJa7ILFftggawnfxW
         3awHwFDp69wyttHCjer7RzMQ37u6dLBrI35qN2Ik=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 8656760ADE;
        Thu,  3 Oct 2019 15:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570116106;
        bh=wrF+mAtbKK35bIsjW1eEOP2bIDJkMLZvW9UvGD8kv0c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Sg9Nov1mh/nDNVMzTBKKGarxyT2GpyPeRjsw6o1kLIrwNWXyqGGa4GG+tPttWBVZz
         lOMOaeM+kR8AVvJSOiPCASZF7YraLRX7dOCgd7kjUlBLIlVd6msmHp9ow43AfS0oCX
         /Kz0NL+3r1y8coTb8+3SXrUxk/ZMkhNcPatJ19ok=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 03 Oct 2019 20:51:46 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        DT <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: msm8998: Disable coresight by default
In-Reply-To: <aecbc7a2-05fd-f30f-81c7-81947dc31c9f@free.fr>
References: <20191003064449.2201-1-saiprakash.ranjan@codeaurora.org>
 <aecbc7a2-05fd-f30f-81c7-81947dc31c9f@free.fr>
Message-ID: <89f5f76ae26682e902faa1b06379cc0f@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-03 18:23, Marc Gonzalez wrote:
> On 03/10/2019 08:44, Sai Prakash Ranjan wrote:
> 
>> Boot failure has been reported on MSM8998 based laptop when
>> coresight is enabled. This is most likely due to lack of
>> firmware support for coresight on production device when
>> compared to debug device like MTP where this issue is not
>> observed. So disable coresight by default for MSM8998 and
>> enable it only for MSM8998 MTP.
>> 
>> Reported-and-tested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
>> Fixes: 783abfa2249a ("arm64: dts: qcom: msm8998: Add Coresight 
>> support")
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 68 
>> +++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/msm8998.dtsi     | 51 +++++++++++------
>>  2 files changed, 102 insertions(+), 17 deletions(-)
> 
> Just wanted to toss an alternative, based on Suzuki's suggestion
> (i.e. move the coresight nodes to a separate file)
> 
> 

I believe this is a better approach.
Initially I had coresight components in a separate file like this but 
Bjorn had some concerns about having 2 separate files. If he is OK with 
this,

Acked-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
