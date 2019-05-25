Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2A6D2A5E7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2019 19:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbfEYRxn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 May 2019 13:53:43 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:42086 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbfEYRxn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 May 2019 13:53:43 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1A51960C5F; Sat, 25 May 2019 17:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558806822;
        bh=jzgn7rg3s5o3zpXbF8z5WWZpHYb1TEcoJmOALP8joCg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=BgXEnwqsQtglDsn26d091gsab2jvK9eX60DBAj3Sb35YVk8e20LyNcO17POyPz/qA
         XeHQKa1D6dg1r+ofxGIWlG12NCCi/1BF6UOnyblc7uq3KDKXxDjCsMJb7KziiEXQVf
         7C+P2vVgN1x1lDr3xGeUFlHc7QmtsFmhzXtqoBsU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.101] (unknown [157.45.255.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C6CAF601D4;
        Sat, 25 May 2019 17:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558806821;
        bh=jzgn7rg3s5o3zpXbF8z5WWZpHYb1TEcoJmOALP8joCg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=AhvQjd1G+fm8dGu6jDuDybm6UFdOcyr5aXzXC+7+TtNTb6dikoxLweF9ECtqAwEd6
         AY59Ce5O14emuv7Ou2IajldTA0rzRJqbHE0zXer/5aoLX/PIPxx96C2mLD3lylNyOV
         osSg39oiCXUuZu3J1AQRvVQtRq/leRGMocTXDmyM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C6CAF601D4
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH v7 2/4] soc: qcom: Add AOSS QMP driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190501043734.26706-1-bjorn.andersson@linaro.org>
 <20190501043734.26706-3-bjorn.andersson@linaro.org>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <3d2c61ca-b91b-fdc7-7837-af6a3b71af7e@codeaurora.org>
Date:   Sat, 25 May 2019 23:23:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501043734.26706-3-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/1/2019 10:07 AM, Bjorn Andersson wrote:
> The Always On Subsystem (AOSS) Qualcomm Messaging Protocol (QMP) driver
> is used to communicate with the AOSS for certain side-channel requests,
> that are not available through the RPMh interface.
> 
> The communication is a very simple synchronous mechanism of messages
> being written in message RAM and a doorbell in the AOSS is rung. As the
> AOSS has processed the message length is cleared and an interrupt is
> fired by the AOSS as acknowledgment.
> 
> The driver exposes the QDSS clock as a clock and the low-power state
> associated with the remoteprocs in the system as a set of power-domains.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v6:
> - Squash the pd into the same driver as the communication, to simplify
>    the interaction.
> - Representing the QDSS clocks as a clock/power domain turns out to
>    cascade into a request to make all Coresight drivers have a secondary
>    compatible to replace the required bus clock with a required power
>    domain. So in v7 this is exposed as a clock instead.
> - Some error checking updates, as reported by Doug.
> 

Thanks for the patch Bjorn.
Tested the QDSS functionality on SDM845 based Cheza board with this
change and it works just fine.

Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
