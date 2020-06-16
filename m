Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEF231FA7BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 06:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgFPE1e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 00:27:34 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:43887 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725913AbgFPE1e (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 00:27:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592281653; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=gGj1AtaJzmAOYRDgt6sxpRjS45WebWT4WO2xGcv/aok=; b=i5lA+0Rkw5/uGUyYv4sSepj1dZB2Xj3v41rPkbbTF3yOgdLjClfdSFatPusJYJOPcOzC1N9p
 Rfn7WqFI+dA4JZgeIHoRMvGTYufd2CE1dEdi7kGpxQV1lqyW9SLHKDc6ZI2ZQzzB1WXmtk46
 g7P4SJdvNCnLlg5qcQSM6GdCeKU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5ee84a1fc4bb4f886d2824fc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Jun 2020 04:27:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B57A1C433AD; Tue, 16 Jun 2020 04:27:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.37.174] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A508EC433CA;
        Tue, 16 Jun 2020 04:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A508EC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v2 4/6] regulator: Add support for QCOM PMIC VBUS booster
To:     Mark Brown <broonie@kernel.org>
Cc:     robh+dt@kernel.org, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, mark.rutland@arm.com,
        lgirdwood@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        lijun.kernel@gmail.com, rdunlap@infradead.org,
        jackp@codeaurora.org, bryan.odonoghue@linaro.org
References: <20200612231918.8001-1-wcheng@codeaurora.org>
 <20200612231918.8001-5-wcheng@codeaurora.org>
 <20200615120018.GI4447@sirena.org.uk>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <ba6420c5-37d3-205a-19e0-957e77f7e9f7@codeaurora.org>
Date:   Mon, 15 Jun 2020 21:27:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200615120018.GI4447@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/15/2020 5:00 AM, Mark Brown wrote:
> On Fri, Jun 12, 2020 at 04:19:16PM -0700, Wesley Cheng wrote:
> 
>> +++ b/drivers/regulator/qcom_usb_vbus-regulator.c
>> @@ -0,0 +1,147 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>> + */
> 
> Please make the entire comment a C++ one so things look more
> intentional.
> 

Hi Mark,

Sure, will do.

>> +static int qcom_usb_vbus_enable(struct regulator_dev *rdev)
>> +{
> 
>> +static int qcom_usb_vbus_disable(struct regulator_dev *rdev)
>> +{
> 
>> +static int qcom_usb_vbus_is_enabled(struct regulator_dev *rdev)
>> +{
> 
> These operations can all be replaced by regulator_is_enabled_regmap()
> and friends.
> 

Got it.  This simplifies the driver a lot.  Thanks for the tip.

>> +	init_data.constraints.valid_ops_mask |= REGULATOR_CHANGE_STATUS;
> 
> No, this is broken - regulators should not override the constraints the
> machine sets.
> 

Understood.  I decided to go with of_get_regulator_init_data() to
initialize the init_data parameter.  This should take care of the
constraint settings.


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
