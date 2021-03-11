Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 251FE336BF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 07:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbhCKGT5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 01:19:57 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:11899 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229958AbhCKGTs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 01:19:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615443588; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ga3DsNa4ubV/OCXuniJ9QllbjgFwaAs6FxP/8OgRzaA=;
 b=Trh1Yg+37cPWmrAaidjveB3UPUA822dGm6uXbQByVeDnnQoKGUTd7nisiHXqZkrVBFD01C1K
 k/D8mDwZbAFy1nqyek2okzW/9e22OEMQ/029X/lQsnFcsdAA5M7umngIb52CbPJUe/Unb9hP
 SNq22ST1Q5MQ8OpId4bYwiDaA9M=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6049b6790c7cf0f56c3f2a53 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Mar 2021 06:19:37
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5E1C7C43461; Thu, 11 Mar 2021 06:19:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 62892C433C6;
        Thu, 11 Mar 2021 06:19:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 11 Mar 2021 11:49:36 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Souradeep Chowdhury <schowdhu@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        sibis@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        vkoul@kernel.org
Subject: Re: [PATCH V1 2/6] soc: qcom: dcc: Add driver support for Data
 Capture and Compare unit(DCC)
In-Reply-To: <YElUCaBUOx7hEuIh@builder.lan>
References: <cover.1615393454.git.schowdhu@codeaurora.org>
 <48556129a02c9f7cd0b31b2e8ee0f168e6d211b7.1615393454.git.schowdhu@codeaurora.org>
 <YElUCaBUOx7hEuIh@builder.lan>
Message-ID: <ab30490c016f906fd9bc5d789198530b@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 2021-03-11 04:49, Bjorn Andersson wrote:
> On Wed 10 Mar 10:46 CST 2021, Souradeep Chowdhury wrote:
> 
>> The DCC is a DMA Engine designed to capture and store data
>> during system crash or software triggers. The DCC operates
>> based on link list entries which provides it with data and
>> addresses and the function it needs to perform. These
>> functions are read, write and loop. Added the basic driver
>> in this patch which contains a probe method which instantiates
>> the resources needed by the driver. DCC has it's own SRAM which
>> needs to be instantiated at probe time as well.
>> 
> 
> So to summarize, the DCC will upon a crash copy the configured region
> into the dcc-ram, where it can be retrieved either by dumping the 
> memory
> over USB or from sysfs on the next boot?
> 

Not just the next boot, but also for the current boot via /dev/dcc_sram,
more below.

>> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
>> ---
>>  drivers/soc/qcom/Kconfig  |   8 +
>>  drivers/soc/qcom/Makefile |   1 +
>>  drivers/soc/qcom/dcc.c    | 388 
>> ++++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 397 insertions(+)
>>  create mode 100644 drivers/soc/qcom/dcc.c
>> 

<snip>...

> 
> How about implementing this using pstore instead of exposing it through
> a custom /dev/dcc_sram (if I read the code correclty)
> 

Using pstore is definitely a good suggestion, we have been thinking of
adding it as a separate change once the basic support for DCC gets in.
But pstore ram backend again depends on warm reboot which is present 
only
in chrome compute platforms but android platforms do not officially 
support
warm reboot. Pstore with block devices as a backend would be ideal but 
it
is still a work in progress to use mmc as the backend [1].

Now the other reason as to why we need this dev interface in addition to
pstore,

  * Pstore contents are retrieved on the next boot, but DCC SRAM contents
    can be collected via dev interface for the current boot via SW 
trigger.
    Lets say we have some non-fatal errors in one of the subsystems and 
we
    want to analyze the register values, it becomes as simple as 
configuring
    that region, trigger dcc and collect the sram contents and parse it.

    echo "addr" > /sys/bus/platform/devices/***.dcc/config
    echo  1 > /sys/bus/platform/devices/***.dcc/trigger
    cat /dev/dcc_sram > dcc_sram.bin
    python dcc_parser.py -s dcc_sram.bin --v2 -o output/

We don't have to reboot at all for SW triggers. This is very useful and
widely used internally.

Is the custom /dev/dcc_sram not recommended because of the dependency on
the userspace component being not available openly? If so, we already 
have
the dcc parser upstream which we use to extract the sram contents [2].

[1] 
https://lore.kernel.org/lkml/20210120121047.2601-1-bbudiredla@marvell.com/
[2] 
https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/tools/tree/dcc_parser

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
