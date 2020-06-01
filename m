Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 971AE1EA41F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2020 14:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbgFAMln (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jun 2020 08:41:43 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:61889 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725847AbgFAMlm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jun 2020 08:41:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591015302; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=8+lCDm9rpKrJa4R0/IaBeE0FRek83VnCPFNnXBqhPck=; b=k/rXptSFRsn9tImTCsmW8XsnJVM+yk+Tg8/ss42srFhZ2SpMzznL1YcAJmq3izfX5nyNu8KT
 stK6jRKXzz86N6jSt5boe+MjH0p/B+okcluyVEHCmhpLQLVO4yuXwN1+1Jbq1yTBNTfW9AzN
 5ye3ba0dPm29P/sQLrjRqxNI3z0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5ed4f77276fccbb4c839e7da (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Jun 2020 12:41:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 48CC8C433CB; Mon,  1 Jun 2020 12:41:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.100] (unknown [49.207.141.73])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7A917C433C6;
        Mon,  1 Jun 2020 12:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7A917C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [PATCH V6 4/5] clk: qcom: Add ipq6018 apss clock controller
To:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
References: <1590582292-13314-1-git-send-email-sivaprak@codeaurora.org>
 <1590582292-13314-5-git-send-email-sivaprak@codeaurora.org>
 <159063116486.69627.5280506237179820811@swboyd.mtv.corp.google.com>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <824cd7bb-0971-d387-4b78-75c36ddf2f66@codeaurora.org>
Date:   Mon, 1 Jun 2020 18:11:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <159063116486.69627.5280506237179820811@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stepen,

On 5/28/2020 7:29 AM, Stephen Boyd wrote:
> Quoting Sivaprakash Murugesan (2020-05-27 05:24:51)
>> diff --git a/drivers/clk/qcom/apss-ipq6018.c b/drivers/clk/qcom/apss-ipq6018.c
>> new file mode 100644
>> index 0000000..004f7e1
>> --- /dev/null
>> +++ b/drivers/clk/qcom/apss-ipq6018.c
>> @@ -0,0 +1,106 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/err.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/regmap.h>
>> +#include <linux/module.h>
>> +
>> +#include <dt-bindings/clock/qcom,apss-ipq.h>
>> +
>> +#include "common.h"
>> +#include "clk-regmap.h"
>> +#include "clk-branch.h"
>> +#include "clk-alpha-pll.h"
>> +#include "clk-regmap-mux.h"
>> +
>> +enum {
>> +       P_XO,
>> +       P_APSS_PLL_EARLY,
>> +};
>> +
>> +static const struct clk_parent_data parents_apcs_alias0_clk_src[] = {
>> +       { .fw_name = "xo" },
>> +       { .fw_name = "pll" },
> This pll clk is not described in the binding. Please add it there.

Sorry I did not get this, this PLL is not directly defined in this 
driver and it comes

from dts. do you still want to describe it in binding?


