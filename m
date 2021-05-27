Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F743926D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 May 2021 07:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232240AbhE0F0x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 May 2021 01:26:53 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17334 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233768AbhE0F0w (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 May 2021 01:26:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622093120; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8lksUp1qCJXiBU12bEnLm7XV+ucQTovs88KOZ7ewuHk=;
 b=byHKjTbKfSO6m3updaVGZ1ypZw2eEAwd1YT+qZU0RTaG/x3koHrpwJQ+wL3Y7lB+GuUQ8fBT
 97z2zbFziyFchZNdQTIy2qa9v63dfdor5exYodALOQi1t+MOEVCpuqg39w/T36TAvN8Ky0g0
 QfbEPXwRZiMKLSsbYmP1EliZHfg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60af2d3c5f788b52a57d009a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 27 May 2021 05:25:16
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E9C15C43460; Thu, 27 May 2021 05:25:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BE2ABC433F1;
        Thu, 27 May 2021 05:25:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 27 May 2021 10:55:14 +0530
From:   schowdhu@codeaurora.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org
Subject: Re: [PATCH V4 0/4] Add driver support for Data Capture and Compare
 Engine(DCC) for SM8150
In-Reply-To: <cover.1620056206.git.schowdhu@codeaurora.org>
References: <cover.1620056206.git.schowdhu@codeaurora.org>
Message-ID: <b6d5e5be63f572ef1db2a055d98fd8c0@codeaurora.org>
X-Sender: schowdhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-03 21:47, Souradeep Chowdhury wrote:
> DCC(Data Capture and Compare) is a DMA engine designed for debugging
> purposes.In case of a system
> crash or manual software triggers by the user the DCC hardware stores
> the value at the register
> addresses which can be used for debugging purposes.The DCC driver
> provides the user with sysfs
> interface to configure the register addresses.The options that the DCC
> hardware provides include
> reading from registers,writing to registers,first reading and then
> writing to registers and looping
> through the values of the same register.
> 
> In certain cases a register write needs to be executed for accessing
> the rest of the registers,
> also the user might want to record the changing values of a register
> with time for which he has the
> option to use the loop feature.
> 
> The options mentioned above are exposed to the user by sysfs files
> once the driver is probed.The
> details and usage of this sysfs files are documented in
> Documentation/ABI/testing/sysfs-driver-dcc.
> 
> As an example let us consider a couple of debug scenarios where DCC
> has been proved to be effective
> for debugging purposes:-
> 
> i)TimeStamp Related Issue
> 
> On SC7180, there was a coresight timestamp issue where it would
> occasionally be all 0 instead of proper
> timestamp values.
> 
> Proper timestamp:
> Idx:3373; ID:10; I_TIMESTAMP : Timestamp.; Updated val =
> 0x13004d8f5b7aa; CC=0x9e
> 
> Zero timestamp:
> Idx:3387; ID:10; I_TIMESTAMP : Timestamp.; Updated val = 0x0; CC=0xa2
> 
> Now this is a non-fatal issue and doesn't need a system reset, but 
> still needs
> to be rootcaused and fixed for those who do care about coresight etm 
> traces.
> Since this is a timestamp issue, we would be looking for any timestamp 
> related
> clocks and such.
> 
> o we get all the clk register details from IP documentation and 
> configure it
> via DCC config syfs node. Before that we set the current linked list.
> 
> /* Set the current linked list */
> echo 3 > /sys/bus/platform/devices/10a2000.dcc/curr_list
> 
> /* Program the linked list with the addresses */
> echo 0x10c004 > /sys/bus/platform/devices/10a2000.dcc/config
> echo 0x10c008 > /sys/bus/platform/devices/10a2000.dcc/config
> echo 0x10c00c > /sys/bus/platform/devices/10a2000.dcc/config
> echo 0x10c010 > /sys/bus/platform/devices/10a2000.dcc/config
> ..... and so on for other timestamp related clk registers
> 
> /* Other way of specifying is in "addr len" pair, in below case it
> specifies to capture 4 words starting 0x10C004 */
> 
> echo 0x10C004 4 > /sys/bus/platform/devices/10a2000.dcc/config
> 
> /* Enable DCC */
> echo 1 > /sys/bus/platform/devices/10a2000.dcc/enable
> 
> /* Run the timestamp test for working case */
> 
> /* Send SW trigger */
> echo 1 > /sys/bus/platform/devices/10a2000.dcc/trigger
> 
> /* Read SRAM */
> cat /dev/dcc_sram > dcc_sram1.bin
> 
> /* Run the timestamp test for non-working case */
> 
> /* Send SW trigger */
> echo 1 > /sys/bus/platform/devices/10a2000.dcc/trigger
> 
> /* Read SRAM */
> cat /dev/dcc_sram > dcc_sram2.bin
> 
> Get the parser from [1] and checkout the latest branch.
> 
> /* Parse the SRAM bin */
> python dcc_parser.py -s dcc_sram1.bin --v2 -o output/
> python dcc_parser.py -s dcc_sram2.bin --v2 -o output/
> 
> Sample parsed output of dcc_sram1.bin:
> 
> <hwioDump version="1">
>         <timestamp>03/14/21</timestamp>
>             <generator>Linux DCC Parser</generator>
>                 <chip name="None" version="None">
>                 <register address="0x0010c004" value="0x80000000" />
>                 <register address="0x0010c008" value="0x00000008" />
>                 <register address="0x0010c00c" value="0x80004220" />
>                 <register address="0x0010c010" value="0x80000000" />
>             </chip>
>     <next_ll_offset>next_ll_offset : 0x1c </next_ll_offset>
> </hwioDump>
> 
> ii)NOC register errors
> 
> A particular class of registers called NOC which are functional
> registers was reporting
> errors while logging the values.To trace these errors the DCC has been
> used effectively.
> The steps followed were similar to the ones mentioned above.
> In addition to NOC registers a few other dependent registers were
> configured in DCC to
> monitor it's values during a crash. A look at the dependent register
> values revealed that
> the crash was happening due to a secured access to one of these
> dependent registers.
> All these debugging activity and finding the root cause was achieved 
> using DCC.
> 
> DCC parser is available at the following open source location
> 
> https://source.codeaurora.org/quic/la/platform/vendor/qcom-opensource/tools/tree/dcc_parser
> 
> Changes in v4:
> 
> *Implement all the comments on v3 of the patch.
> *Incorporate code change for handling multiple SoCs.
> *Incorporate code change for DCC_SRAM content to persist across warm 
> reboots.
> *Fixed the issue with the Makefile in v3 of the patch.
> 
> Souradeep Chowdhury (4):
>   dt-bindings: Added the yaml bindings for DCC
>   soc: qcom: dcc:Add driver support for Data Capture and Compare
>     unit(DCC)
>   MAINTAINERS: Add the entry for DCC(Data Capture and Compare) driver
>     support
>   arm64: dts: qcom: sm8150: Add Data Capture and Compare(DCC) support
>     node
> 
>  Documentation/ABI/testing/sysfs-driver-dcc         |  114 ++
>  .../devicetree/bindings/arm/msm/qcom,dcc.yaml      |   40 +
>  MAINTAINERS                                        |    8 +
>  arch/arm64/boot/dts/qcom/sm8150.dtsi               |    6 +
>  drivers/soc/qcom/Kconfig                           |    8 +
>  drivers/soc/qcom/Makefile                          |    1 +
>  drivers/soc/qcom/dcc.c                             | 1534 
> ++++++++++++++++++++
>  7 files changed, 1711 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-dcc
>  create mode 100644 
> Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
>  create mode 100644 drivers/soc/qcom/dcc.c

Gentle Ping

