Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 485D6285C97
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Oct 2020 12:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbgJGKLz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Oct 2020 06:11:55 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:58842 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727014AbgJGKLz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Oct 2020 06:11:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602065515; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ioiudp9XALfKdIVzKVk4P9/mHsW/D6jALV6wDdyxdnQ=; b=AQ1qM4rDC4RwzjkziA1sG5up/91u45VYQzZ6A1ZcjEmuIm48O6kGYj5eX1KxhPV9xSRtaAy/
 LCIEYs7h7X6y0OIPfAuK5R0UIKlf4ungoAG7wDQSk4dFbuUtV+ceq31Kkkpx/K1lCgm+ly8a
 ig+8G4QynVFKFnjMOAmheYeEnvs=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f7d9466319d4e9cb51b6a1e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Oct 2020 10:11:50
 GMT
Sender: jprakash=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0E2F8C433FF; Wed,  7 Oct 2020 10:11:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [157.46.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jprakash)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B4A43C433CB;
        Wed,  7 Oct 2020 10:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B4A43C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jprakash@codeaurora.org
Subject: Re: [PATCH v6 07/10] thermal: qcom: add support for adc-tm5 PMIC
 thermal monitor
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jishnu Prakash <jprakash@qti.qualcomm.com>
References: <20200930100203.1988374-1-dmitry.baryshkov@linaro.org>
 <20200930100203.1988374-8-dmitry.baryshkov@linaro.org>
From:   Jishnu Prakash <jprakash@codeaurora.org>
Message-ID: <073bec11-cd9e-7c3b-ae89-50486d36337a@codeaurora.org>
Date:   Wed, 7 Oct 2020 15:41:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930100203.1988374-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c 
b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> new file mode 100644
> index 000000000000..22d5414a3c5e
> --- /dev/null
> +++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> @@ -0,0 +1,621 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020 Linaro Limited
> + */
> +
> +#include <linux/iio/consumer.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/thermal.h>
> +
> +#include "../../iio/adc/qcom-vadc-common.h"
> +

When I was testing the patches on SC7180, I found that I had to add this 
line for fixing a compilation error for the FIELD_PREP macro:

#include <linux/bitfield.h>

Can you please check and confirm if its needed for compilation here?

Thanks,

Jishnu

