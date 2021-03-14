Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D18E33A78F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Mar 2021 20:00:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233259AbhCNS72 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 Mar 2021 14:59:28 -0400
Received: from m42-2.mailgun.net ([69.72.42.2]:55257 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233248AbhCNS7U (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 Mar 2021 14:59:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615748360; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=E/D1ab7qq8kF771WiUwOqh2b/1XgluuhzHizoAkutQU=; b=XZ+qB7ydIHt3iWubDDEkK1iKlCz39jkZ3HpoqYipo8yQKtbikmNbNDPqUu6v1yP3vnob382N
 JmaUVcTLKI1j9YSrPCZdfdS5up08aWtwGcGIDhQ/ayIYutShA1G8SlNRpG6mid7irZbE4nTb
 YX0iCY5AKuG2xsouaEJwcQVWNN8=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 604e5d056dc1045b7d86d079 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 14 Mar 2021 18:59:17
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 369B9C43462; Sun, 14 Mar 2021 18:59:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3994AC433CA;
        Sun, 14 Mar 2021 18:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3994AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rnayak@codeaurora.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, schowdhu@codeaurora.org,
        sibis@codeaurora.org, vkoul@kernel.org
Subject: Re: [PATCH V1 2/6] soc: qcom: dcc: Add driver support for Data Capture and Compare unit(DCC)
Date:   Mon, 15 Mar 2021 00:29:01 +0530
Message-Id: <20210314185901.15151-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <YEpF1JO4CAd2pb0m@builder.lan>
References: <YEpF1JO4CAd2pb0m@builder.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-11 22:01, Bjorn Andersson wrote:
> On Thu 11 Mar 00:19 CST 2021, Sai Prakash Ranjan wrote:
> 
>> Hi Bjorn,
>>
>> On 2021-03-11 04:49, Bjorn Andersson wrote:
>> > On Wed 10 Mar 10:46 CST 2021, Souradeep Chowdhury wrote:
>> >
>> > > The DCC is a DMA Engine designed to capture and store data
>> > > during system crash or software triggers. The DCC operates
>> > > based on link list entries which provides it with data and
>> > > addresses and the function it needs to perform. These
>> > > functions are read, write and loop. Added the basic driver
>> > > in this patch which contains a probe method which instantiates
>> > > the resources needed by the driver. DCC has it's own SRAM which
>> > > needs to be instantiated at probe time as well.
>> > >
>> >
>> > So to summarize, the DCC will upon a crash copy the configured region
>> > into the dcc-ram, where it can be retrieved either by dumping the memory
>> > over USB or from sysfs on the next boot?
>> >
>>
>> Not just the next boot, but also for the current boot via /dev/dcc_sram,
>> more below.
>>
> 
> Interesting!
> 
>> > > Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
>> > > ---
>> > >  drivers/soc/qcom/Kconfig  |   8 +
>> > >  drivers/soc/qcom/Makefile |   1 +
>> > >  drivers/soc/qcom/dcc.c    | 388
>> > > ++++++++++++++++++++++++++++++++++++++++++++++
>> > >  3 files changed, 397 insertions(+)
>> > >  create mode 100644 drivers/soc/qcom/dcc.c
>> > >
>>
>> <snip>...
>>
>> >
>> > How about implementing this using pstore instead of exposing it through
>> > a custom /dev/dcc_sram (if I read the code correclty)
>> >
>>
>> Using pstore is definitely a good suggestion, we have been thinking of
>> adding it as a separate change once the basic support for DCC gets in.
>> But pstore ram backend again depends on warm reboot which is present only
>> in chrome compute platforms but android platforms do not officially support
>> warm reboot. Pstore with block devices as a backend would be ideal but it
>> is still a work in progress to use mmc as the backend [1].
>>
> 
> I was under the impression that we can have multiple pstore
> implementations active, so we would have ramoops and dcc presented
> side by side after such restart. Perhaps that's a misunderstanding on my
> part?
> 

If you mean pstore backends(persistent ram and block device) as the
implementations, then yes they can separately coexist, but blk device
as the backend is not fully ready and ramoops only guarantees traces
if the DDR contents are retained i.e., on warm reboot.

In case of ramoops, we currently have console-ramoops, dmesg-ramoops,
ftrace-ramoops, pmsg-ramoops. We cannot add dcc-ramoops directly like
this as DCC is very platform specific(and QTI specific).

I wanted to add something like device-ramoops/misc-ramoops where the
device drivers could register with pstore and provide some useful debug
information but the size of ramoops reserved is usually very small and
is divided among all of these. So even if lets say we add DCC today and
later on multiple devices which are present in the same SoC, then the
reserved memory will not be enough and its not easy to properly divide
the memory regions to these devices within device-ramoops, there needs
to be some sort of dynamic reservation as the device probes, so its
currently on hold.

One other reason is the firmware being smart, such as depthcharge [1]
which deletes the ramoops DT node when it loads Kernel+DTB image and
adds its own ramoops node with the size it prefers(which is small) and
so we would need a firmware side change as well to accomodate dcc-ramoops.

Given so many dependencies for pstore ramoops, making it as a primary way
to get DCC trace logs doesn't seem right, we can add it as an addon feature.

[1] https://chromium.googlesource.com/chromiumos/platform/depthcharge/+/refs/heads/main/src/boot/ramoops.c#41

>> Now the other reason as to why we need this dev interface in addition to
>> pstore,
>>
>>  * Pstore contents are retrieved on the next boot, but DCC SRAM contents
>>    can be collected via dev interface for the current boot via SW trigger.
>>    Lets say we have some non-fatal errors in one of the subsystems and we
>>    want to analyze the register values, it becomes as simple as configuring
>>    that region, trigger dcc and collect the sram contents and parse it.
>>
>>    echo "addr" > /sys/bus/platform/devices/***.dcc/config
>>    echo  1 > /sys/bus/platform/devices/***.dcc/trigger
>>    cat /dev/dcc_sram > dcc_sram.bin
>>    python dcc_parser.py -s dcc_sram.bin --v2 -o output/
>>
>> We don't have to reboot at all for SW triggers. This is very useful and
>> widely used internally.
>>
>> Is the custom /dev/dcc_sram not recommended because of the dependency on
>> the userspace component being not available openly? If so, we already have
>> the dcc parser upstream which we use to extract the sram contents [2].
>>
> 
> My concern is that we come up with a custom chardev implementation for
> something that already exists or should exist in a more generic form.
>

Sorry if I misunderstood this comment, but DCC is part of QDSS(Qualcomm Debug
SubSystem) and is specific to QTI. We have Coresight TMC ETR/ETF exposing
similar dev interfaces which is somewhat similar to DCC in the sense that ETF
has its own internal RAM and DCC has the internal SRAM but they are 2 different
hardware IPs. Even in case of ETF, we can collect the live trace on the target
via dev interface and then decode it or collect ramdumps in case of fatal crashes
and then extract trace binary and decode it. So looks like such dev interface
already exists for other hardwares and works pretty well for the specific usecases.

> 
> In the runtime sequence above, why don't you have trigger just generate
> a devcoredump? But perhaps the answer is that we want a unified
> interface between the restart and runtime use cases?
>

Yes, in case of restart i.e., warm reboot since DCC SRAM contents are
retained, we can use the dev interface itself on the next reboot to
collect dcc logs if the memory is not zeroed out which I think current
driver code does which needs to be fixed.

> 
> It would be nice to have some more details of how I can use this and how
> to operate the sysfs interface to achieve that, would you be able to
> elaborate on this?
> 

Agreed, this needs more documentation. I will give one real world example on
SC7180 SoC based board where this could have been used, Souradeep can add more
and document it in cover letter for the next version of the patchset.

Example: (Addresses configured here are just examples and not related to actual
timestamp clks)

On SC7180, there was a coresight timestamp issue where it would occasionally
be all 0 instead of proper timestamp values.

Proper timestamp:
Idx:3373; ID:10; I_TIMESTAMP : Timestamp.; Updated val = 0x13004d8f5b7aa; CC=0x9e

Zero timestamp:
Idx:3387; ID:10; I_TIMESTAMP : Timestamp.; Updated val = 0x0; CC=0xa2

Now this is a non-fatal issue and doesn't need a system reset, but still needs
to be rootcaused and fixed for those who do care about coresight etm traces.
Since this is a timestamp issue, we would be looking for any timestamp related
clocks and such.

So we get all the clk register details from IP documentation and configure it
via DCC config syfs node. Before that we set the current linked list.

/* Set the current linked list */
echo 3 > /sys/bus/platform/devices/10a2000.dcc/curr_list

/* Program the linked list with the addresses */
echo 0x10c004 > /sys/bus/platform/devices/10a2000.dcc/config
echo 0x10c008 > /sys/bus/platform/devices/10a2000.dcc/config
echo 0x10c00c > /sys/bus/platform/devices/10a2000.dcc/config
echo 0x10c010 > /sys/bus/platform/devices/10a2000.dcc/config
..... and so on for other timestamp related clk registers

/* Other way of specifying is in "addr len" pair, in below case it
specifies to capture 4 words starting 0x10C004 */

echo 0x10C004 4 > /sys/bus/platform/devices/10a2000.dcc/config

/* Enable DCC */
echo 1 > /sys/bus/platform/devices/10a2000.dcc/enable

/* Run the timestamp test for working case */

/* Send SW trigger */
echo 1 > /sys/bus/platform/devices/10a2000.dcc/trigger

/* Read SRAM */
cat /dev/dcc_sram > dcc_sram1.bin

/* Run the timestamp test for non-working case */

/* Send SW trigger */
echo 1 > /sys/bus/platform/devices/10a2000.dcc/trigger

/* Read SRAM */
cat /dev/dcc_sram > dcc_sram2.bin

Get the parser from [1] and checkout the latest branch.

/* Parse the SRAM bin */
python dcc_parser.py -s dcc_sram1.bin --v2 -o output/
python dcc_parser.py -s dcc_sram2.bin --v2 -o output/

Sample parsed output of dcc_sram1.bin:

localhost ~ # cat dcc_captured_data.xml 
<?xml version="1.0" encoding="utf-8"?>
<hwioDump version="1">
        <timestamp>03/14/21</timestamp>
        <generator>Linux DCC Parser</generator>
        <chip name="None" version="None">
                <register address="0x0010c004" value="0x80000000" />
                <register address="0x0010c008" value="0x00000008" />
                <register address="0x0010c00c" value="0x80004220" />
                <register address="0x0010c010" value="0x80000000" />
        </chip>
        <next_ll_offset>next_ll_offset : 0x1c </next_ll_offset>
</hwioDump>

Now compare the parsed output for dcc_sram1.bin and dcc_sram2.bin, we will
find that one of these register values in working case and non-working case
is different which when cross checked with IP doc would give us the idea
of what is going wrong with the timestamp clks and would help to debug further.

[1] https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/tools/tree/dcc_parser

PS: We didn't use DCC to debug this coresight timestamp issue but could have
used it and this example demonstrates the capability of DCC and I ran with
these above with actual timestamp clk registers and it works as demonstrated
here, so it's a working example.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
