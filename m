Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85329144BE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 07:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbgAVGp3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 01:45:29 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:46517 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726036AbgAVGp3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 01:45:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579675528; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WCvyWoXNRiwp8CRX6GN54nfgOqCDJv+aooQVfEMaafI=;
 b=PLoT3yp276uNjZZaJtumJAMEn9+ZJrpqED6L6FKEcqSxbPEQY1bguGM8roAV+eFVYpsVUHmj
 CM4enNUjfpKZPBeoHcvvfxqyPrhnHxI5FBCmd+T50diQauyGFSEfb1j6I+cBFhWjLt6+Og5f
 dX4kqA47MIak6RHDqo83djygzo0=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e27ef84.7f75a28ec848-smtp-out-n03;
 Wed, 22 Jan 2020 06:45:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 89CBDC447A1; Wed, 22 Jan 2020 06:45:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 922DFC433CB;
        Wed, 22 Jan 2020 06:45:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 22 Jan 2020 12:15:22 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Evan Green <evgreen@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        David Dai <daidavid1@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 2/4] interconnect: qcom: Add OSM L3 interconnect
 provider support
In-Reply-To: <CAE=gft7ZUTiGrvsaqfrVv-bH3w75as7G1UJRn3aJs3ECqodpQg@mail.gmail.com>
References: <20200109211215.18930-1-sibis@codeaurora.org>
 <20200109211215.18930-3-sibis@codeaurora.org>
 <CAE=gft7ZUTiGrvsaqfrVv-bH3w75as7G1UJRn3aJs3ECqodpQg@mail.gmail.com>
Message-ID: <dad8936ba4444c3377d777cbbb879dc3@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Evan,

Thanks for the review!

On 2020-01-22 03:03, Evan Green wrote:
> On Thu, Jan 9, 2020 at 1:12 PM Sibi Sankar <sibis@codeaurora.org> 
> wrote:
>> 
>> On some Qualcomm SoCs, Operating State Manager (OSM) controls the
>> resources of scaling L3 caches. Add a driver to handle bandwidth
>> requests to OSM L3 from CPU on SDM845 SoCs.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  drivers/interconnect/qcom/Kconfig  |   7 +
>>  drivers/interconnect/qcom/Makefile |   2 +
>>  drivers/interconnect/qcom/osm-l3.c | 267 
>> +++++++++++++++++++++++++++++
>>  3 files changed, 276 insertions(+)
>>  create mode 100644 drivers/interconnect/qcom/osm-l3.c
>> 
>> diff --git a/drivers/interconnect/qcom/Kconfig 
>> b/drivers/interconnect/qcom/Kconfig
>> index a9bbbdf7400f9..b94d28e7bf700 100644
>> --- a/drivers/interconnect/qcom/Kconfig
>> +++ b/drivers/interconnect/qcom/Kconfig
>> @@ -14,6 +14,13 @@ config INTERCONNECT_QCOM_MSM8974
>>          This is a driver for the Qualcomm Network-on-Chip on 
>> msm8974-based
>>          platforms.
>> 
>> +config INTERCONNECT_QCOM_OSM_L3
>> +       tristate "Qualcomm OSM L3 interconnect driver"
>> +       depends on INTERCONNECT_QCOM || COMPILE_TEST
>> +       help
>> +         Say y here to support the Operating State Manager (OSM) 
>> interconnect
>> +         driver which controls the scaling of L3 caches on Qualcomm 
>> SoCs.
>> +
>>  config INTERCONNECT_QCOM_QCS404
>>         tristate "Qualcomm QCS404 interconnect driver"
>>         depends on INTERCONNECT_QCOM
>> diff --git a/drivers/interconnect/qcom/Makefile 
>> b/drivers/interconnect/qcom/Makefile
>> index 55ec3c5c89dbd..89fecbd1257c7 100644
>> --- a/drivers/interconnect/qcom/Makefile
>> +++ b/drivers/interconnect/qcom/Makefile
>> @@ -1,5 +1,6 @@
>>  # SPDX-License-Identifier: GPL-2.0
>> 
>> +icc-osm-l3-objs                                := osm-l3.o
>>  qnoc-msm8974-objs                      := msm8974.o
>>  qnoc-qcs404-objs                       := qcs404.o
>>  qnoc-sc7180-objs                       := sc7180.o
>> @@ -12,6 +13,7 @@ icc-smd-rpm-objs                      := smd-rpm.o
>>  obj-$(CONFIG_INTERCONNECT_QCOM_BCM_VOTER) += icc-bcm-voter.o
>>  obj-$(CONFIG_INTERCONNECT_QCOM_MSM8916) += qnoc-msm8916.o
>>  obj-$(CONFIG_INTERCONNECT_QCOM_MSM8974) += qnoc-msm8974.o
>> +obj-$(CONFIG_INTERCONNECT_QCOM_OSM_L3) += icc-osm-l3.o
>>  obj-$(CONFIG_INTERCONNECT_QCOM_QCS404) += qnoc-qcs404.o
>>  obj-$(CONFIG_INTERCONNECT_QCOM_RPMH) += icc-rpmh.o
>>  obj-$(CONFIG_INTERCONNECT_QCOM_SC7180) += qnoc-sc7180.o
>> diff --git a/drivers/interconnect/qcom/osm-l3.c 
>> b/drivers/interconnect/qcom/osm-l3.c
>> new file mode 100644
>> index 0000000000000..7fde53c70081e
>> --- /dev/null
>> +++ b/drivers/interconnect/qcom/osm-l3.c
>> @@ -0,0 +1,267 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>> + *
>> + */
>> +
>> +#include <dt-bindings/interconnect/qcom,osm-l3.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/clk.h>
>> +#include <linux/interconnect-provider.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +
>> +#define LUT_MAX_ENTRIES                        40U
>> +#define LUT_SRC                                GENMASK(31, 30)
>> +#define LUT_L_VAL                      GENMASK(7, 0)
>> +#define LUT_ROW_SIZE                   32
>> +#define CLK_HW_DIV                     2
>> +
>> +/* Register offsets */
>> +#define REG_ENABLE                     0x0
>> +#define REG_FREQ_LUT                   0x110
>> +#define REG_PERF_STATE                 0x920
>> +
>> +#define OSM_L3_MAX_LINKS               1
>> +#define SDM845_MAX_RSC_NODES           130
> 
> I'm nervous this define is going to fall out of date with
> qcom,sdm845.h. I'm worried someone will end up adding a few more nodes
> that were always there but previously hidden from Linux. Can we put
> this define in include/dt-bindings/interconnect/qcom,sdm845.h, so at
> least when that happens they'll come face to face with this define?
> The same comment goes for the SC7180 define in patch 4.

Yeah both solution require manual
intervention how about we just go
with what I proposed below.

> 
> On second thought, this trick only works once. Are we sure there
> aren't going to be other drivers that might want to tag on
> interconnect nodes as well? How about instead we just add the enum
> values below in qcom,sdm845.h as defines?

Georgi/Evan,
Since qcom,sdm845.h is specific to
bindings shouldn't I just create a
.h file with all the enums so that
it can used across all icc providers
on SDM845?

> 
> -Evan

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
