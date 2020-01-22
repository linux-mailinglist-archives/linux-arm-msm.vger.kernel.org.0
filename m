Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 524DF144D26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 09:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729108AbgAVIUH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 03:20:07 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:56109 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbgAVIUE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 03:20:04 -0500
Received: by mail-wm1-f65.google.com with SMTP id q9so5803188wmj.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2020 00:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=M+iOlDTH3ew9FlBT8LllWQrwpgclA7C5MSbbYFNG6t0=;
        b=r2bIq1DKmQiUPmT41X6TDYq4i6tmVUjwmxNm0uuwSbeHCz2ACOktDXUiJG2zZYqJ9y
         3g3FQRJk8CuD6VceKXeYIavP5D8Wy8NNhuopNYauZsS5DQJ07PMGupr4yuftpf0shcbt
         RbxhotiKll1zyVtETV4J1ejviHIaLihWA0z0paqojTBy4QnOrskzeSWL4qbT+A+tCcao
         dS0UK0h2IHji3vkKRQzj1I/QXTfCOTp8pdehCNgmVO1pxWe7vEIYBnhEuiIinqJHMR/a
         NF137O6cOdxbGKd70wjUBFv3dUvPDyiUvuOq4wOW1UqMIW+Qck2XDr+ZeHeGm6h2BPjl
         SJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M+iOlDTH3ew9FlBT8LllWQrwpgclA7C5MSbbYFNG6t0=;
        b=bbDX/enn4iFWe8q8T6Dx2wklemo288G2l6LalDpkcPA3hO4Kwzy0Br75ed9IoLhSj2
         H3BWGiCucn3NVFlbCLw91Gv7TXP94yg9NE5uCksTJf1E2VWK+/L1s+TI+1pL8uTvSq+q
         1biIl5gT0PLU1jyeROglqlTO/6e0UwqOvfMCVrqtAApQLJ9zYV+PYnHVibirQQTkNEHs
         rvNtuFiwU4NeUuxDX+0jt84CJ/RGnYGnXG0O5VNWDWsUZXj1tfz32QPJ7DH2XVJTpzLE
         Ecs3wUMBMJ27p5bZBJsrQVlVvPPivfM/QKWtD4/GUhqxPrTKa8g0IcBYf3wdaMd4nXDH
         7xWw==
X-Gm-Message-State: APjAAAXoGc9MRZO6nchrynDVX0uWTVInMObb52MdtJmrMdvc96/uA+xK
        atdkdM3idtE49Ts8rjArWxIO+Q==
X-Google-Smtp-Source: APXvYqxlSKg5k7xwSMOzY0s0isT4HpPGdB0mVsgMKOxhoZAnTU+kWDcfGhKQ2E2qyqHzYOpNchy7cQ==
X-Received: by 2002:a05:600c:108a:: with SMTP id e10mr1603881wmd.38.1579681201241;
        Wed, 22 Jan 2020 00:20:01 -0800 (PST)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id a9sm2739774wmm.15.2020.01.22.00.20.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jan 2020 00:20:00 -0800 (PST)
Subject: Re: [PATCH v4 2/4] interconnect: qcom: Add OSM L3 interconnect
 provider support
To:     Sibi Sankar <sibis@codeaurora.org>,
        Evan Green <evgreen@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
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
References: <20200109211215.18930-1-sibis@codeaurora.org>
 <20200109211215.18930-3-sibis@codeaurora.org>
 <CAE=gft7ZUTiGrvsaqfrVv-bH3w75as7G1UJRn3aJs3ECqodpQg@mail.gmail.com>
 <dad8936ba4444c3377d777cbbb879dc3@codeaurora.org>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <03f83755-bdcc-dc39-0eae-08414751be57@linaro.org>
Date:   Wed, 22 Jan 2020 10:19:58 +0200
MIME-Version: 1.0
In-Reply-To: <dad8936ba4444c3377d777cbbb879dc3@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/22/20 08:45, Sibi Sankar wrote:
> Hey Evan,
> 
> Thanks for the review!
> 
> On 2020-01-22 03:03, Evan Green wrote:
>> On Thu, Jan 9, 2020 at 1:12 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>>>
>>> On some Qualcomm SoCs, Operating State Manager (OSM) controls the
>>> resources of scaling L3 caches. Add a driver to handle bandwidth
>>> requests to OSM L3 from CPU on SDM845 SoCs.
>>>
>>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>>> ---
>>>  drivers/interconnect/qcom/Kconfig  |   7 +
>>>  drivers/interconnect/qcom/Makefile |   2 +
>>>  drivers/interconnect/qcom/osm-l3.c | 267 +++++++++++++++++++++++++++++
>>>  3 files changed, 276 insertions(+)
>>>  create mode 100644 drivers/interconnect/qcom/osm-l3.c
>>>
>>> diff --git a/drivers/interconnect/qcom/Kconfig
>>> b/drivers/interconnect/qcom/Kconfig
>>> index a9bbbdf7400f9..b94d28e7bf700 100644
>>> --- a/drivers/interconnect/qcom/Kconfig
>>> +++ b/drivers/interconnect/qcom/Kconfig
>>> @@ -14,6 +14,13 @@ config INTERCONNECT_QCOM_MSM8974
>>>          This is a driver for the Qualcomm Network-on-Chip on msm8974-based
>>>          platforms.
>>>
>>> +config INTERCONNECT_QCOM_OSM_L3
>>> +       tristate "Qualcomm OSM L3 interconnect driver"
>>> +       depends on INTERCONNECT_QCOM || COMPILE_TEST
>>> +       help
>>> +         Say y here to support the Operating State Manager (OSM) interconnect
>>> +         driver which controls the scaling of L3 caches on Qualcomm SoCs.
>>> +
>>>  config INTERCONNECT_QCOM_QCS404
>>>         tristate "Qualcomm QCS404 interconnect driver"
>>>         depends on INTERCONNECT_QCOM
>>> diff --git a/drivers/interconnect/qcom/Makefile
>>> b/drivers/interconnect/qcom/Makefile
>>> index 55ec3c5c89dbd..89fecbd1257c7 100644
>>> --- a/drivers/interconnect/qcom/Makefile
>>> +++ b/drivers/interconnect/qcom/Makefile
>>> @@ -1,5 +1,6 @@
>>>  # SPDX-License-Identifier: GPL-2.0
>>>
>>> +icc-osm-l3-objs                                := osm-l3.o
>>>  qnoc-msm8974-objs                      := msm8974.o
>>>  qnoc-qcs404-objs                       := qcs404.o
>>>  qnoc-sc7180-objs                       := sc7180.o
>>> @@ -12,6 +13,7 @@ icc-smd-rpm-objs                      := smd-rpm.o
>>>  obj-$(CONFIG_INTERCONNECT_QCOM_BCM_VOTER) += icc-bcm-voter.o
>>>  obj-$(CONFIG_INTERCONNECT_QCOM_MSM8916) += qnoc-msm8916.o
>>>  obj-$(CONFIG_INTERCONNECT_QCOM_MSM8974) += qnoc-msm8974.o
>>> +obj-$(CONFIG_INTERCONNECT_QCOM_OSM_L3) += icc-osm-l3.o
>>>  obj-$(CONFIG_INTERCONNECT_QCOM_QCS404) += qnoc-qcs404.o
>>>  obj-$(CONFIG_INTERCONNECT_QCOM_RPMH) += icc-rpmh.o
>>>  obj-$(CONFIG_INTERCONNECT_QCOM_SC7180) += qnoc-sc7180.o
>>> diff --git a/drivers/interconnect/qcom/osm-l3.c
>>> b/drivers/interconnect/qcom/osm-l3.c
>>> new file mode 100644
>>> index 0000000000000..7fde53c70081e
>>> --- /dev/null
>>> +++ b/drivers/interconnect/qcom/osm-l3.c
>>> @@ -0,0 +1,267 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>>> + *
>>> + */
>>> +
>>> +#include <dt-bindings/interconnect/qcom,osm-l3.h>
>>> +#include <linux/bitfield.h>
>>> +#include <linux/clk.h>
>>> +#include <linux/interconnect-provider.h>
>>> +#include <linux/io.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/of_platform.h>
>>> +#include <linux/platform_device.h>
>>> +
>>> +#define LUT_MAX_ENTRIES                        40U
>>> +#define LUT_SRC                                GENMASK(31, 30)
>>> +#define LUT_L_VAL                      GENMASK(7, 0)
>>> +#define LUT_ROW_SIZE                   32
>>> +#define CLK_HW_DIV                     2
>>> +
>>> +/* Register offsets */
>>> +#define REG_ENABLE                     0x0
>>> +#define REG_FREQ_LUT                   0x110
>>> +#define REG_PERF_STATE                 0x920
>>> +
>>> +#define OSM_L3_MAX_LINKS               1
>>> +#define SDM845_MAX_RSC_NODES           130
>>
>> I'm nervous this define is going to fall out of date with
>> qcom,sdm845.h. I'm worried someone will end up adding a few more nodes
>> that were always there but previously hidden from Linux. Can we put
>> this define in include/dt-bindings/interconnect/qcom,sdm845.h, so at
>> least when that happens they'll come face to face with this define?
>> The same comment goes for the SC7180 define in patch 4.
> 
> Yeah both solution require manual
> intervention how about we just go
> with what I proposed below.
> 
>>
>> On second thought, this trick only works once. Are we sure there
>> aren't going to be other drivers that might want to tag on
>> interconnect nodes as well? How about instead we just add the enum
>> values below in qcom,sdm845.h as defines?
> 
> Georgi/Evan,
> Since qcom,sdm845.h is specific to
> bindings shouldn't I just create a
> .h file with all the enums so that
> it can used across all icc providers
> on SDM845?

This sounds good to me, unless Evan has any objections.

Thanks,
Georgi
