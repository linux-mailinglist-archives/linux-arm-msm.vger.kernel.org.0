Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C197E22A8C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 08:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgGWGQj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 02:16:39 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:62428 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726447AbgGWGQj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 02:16:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595484999; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=JrFqQO/lYLd8xdNMkJQFUXBvOd4aBT1l1GY4iTKRlJ4=; b=H/GbmzMS8bQDgGiu/sovZBS+cAmgGlNeyWAYwQ5M4BRDGZB+xWkbj7nHN5Y1Rold0j9YsdW4
 5Fk4eoB4FYYjrKc/mfGumE0OYTu46EzY+Z8v7S5AJyu+D6DBlghCpeT6bGp2IjysRGz2f0k/
 sqXy3FNC4ZQRxR3m1ZQJ2JzlOZo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5f192b4603c8596cdb8e559e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 23 Jul 2020 06:16:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0B763C433C6; Thu, 23 Jul 2020 06:16:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.104] (unknown [123.201.159.88])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: msavaliy)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1716EC433C9;
        Thu, 23 Jul 2020 06:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1716EC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=msavaliy@codeaurora.org
Subject: Re: [PATCH v2] i2c: i2c-qcom-geni: Fix DMA transfer race
To:     Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200722145948.v2.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid>
 <159546541191.3847286.3212989047313785097@swboyd.mtv.corp.google.com>
From:   "Mukesh, Savaliya" <msavaliy@codeaurora.org>
Message-ID: <bb8b1e99-2f55-910c-c37f-5e0fef0fb4b1@codeaurora.org>
Date:   Thu, 23 Jul 2020 11:46:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <159546541191.3847286.3212989047313785097@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 7/23/2020 6:20 AM, Stephen Boyd wrote:
> Quoting Douglas Anderson (2020-07-22 15:00:21)
>> When I have KASAN enabled on my kernel and I start stressing the
>> touchscreen my system tends to hang.  The touchscreen is one of the
>> only things that does a lot of big i2c transfers and ends up hitting
>> the DMA paths in the geni i2c driver.  It appears that KASAN adds
>> enough delay in my system to tickle a race condition in the DMA setup
>> code.
>>
>> When the system hangs, I found that it was running the geni_i2c_irq()
>> over and over again.  It had these:
>>
>> m_stat   = 0x04000080
>> rx_st    = 0x30000011
>> dm_tx_st = 0x00000000
>> dm_rx_st = 0x00000000
>> dma      = 0x00000001
>>
>> Notably we're in DMA mode but are getting M_RX_IRQ_EN and
>> M_RX_FIFO_WATERMARK_EN over and over again.
>>
>> Putting some traces in geni_i2c_rx_one_msg() showed that when we
>> failed we were getting to the start of geni_i2c_rx_one_msg() but were
>> never executing geni_se_rx_dma_prep().
>>
>> I believe that the problem here is that we are starting the geni
>> command before we run geni_se_rx_dma_prep().  If a transfer makes it
>> far enough before we do that then we get into the state I have
>> observed.  Let's change the order, which seems to work fine.
>>
>> Although problems were seen on the RX path, code inspection suggests
>> that the TX should be changed too.  Change it as well.
>>
>> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> Reviewed-by: Akash Asthana <akashast@codeaurora.org>
Reviewed-by: Mukesh Kumar Savaliya <msavaliy@codeaurora.org>
>> ---
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
