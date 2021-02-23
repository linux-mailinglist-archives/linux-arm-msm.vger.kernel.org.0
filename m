Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 074C332299C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 12:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbhBWLnG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 06:43:06 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:45044 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232217AbhBWLnE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 06:43:04 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614080564; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=u4UIo32uH4I3VBRPDY3bek63Jn/ZMnFlBlUbmDlv6YI=; b=El4/YzE4wKWZjOymMhUzU4fQFc0NAzQujhUDhR316ayiJIRRMMvnJ68uHvDWn3EziDXRUpCv
 QF9FJYKU3S4U7PQUPE8ieN3LdsFqvo14jMbUT5YP9MVb6bUpo5GpXiaDOPdLlx1YIqwAxnFZ
 vyHYqjBU5zJmziM+5NPGc1zH2rY=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6034ea11e87943df30ced76e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Feb 2021 11:42:09
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C760AC43463; Tue, 23 Feb 2021 11:42:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.102] (unknown [49.207.203.158])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C084C433CA;
        Tue, 23 Feb 2021 11:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8C084C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 03/13] arm64: dts: sc7280: Add basic dts/dtsi files for
 SC7280 soc
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1613114930-1661-1-git-send-email-rnayak@codeaurora.org>
 <1613114930-1661-4-git-send-email-rnayak@codeaurora.org>
 <161406585892.1254594.9748953968478715173@swboyd.mtv.corp.google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <14d2e157-2908-7c59-1c44-f662203fabc5@codeaurora.org>
Date:   Tue, 23 Feb 2021 17:12:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161406585892.1254594.9748953968478715173@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/23/2021 1:07 PM, Stephen Boyd wrote:
> Quoting Rajendra Nayak (2021-02-11 23:28:40)
>> Add initial device tree support for the SC7280 SoC and the IDP
>> boards based on this SoC
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> new file mode 100644
>> index 0000000..428f863
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> @@ -0,0 +1,47 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * sc7280 IDP board device tree source
> 
> Is it capitalized or not capitalized for SC?

:) I'll be consistent and make it not capitalized everywhere.

> 
>> + *
>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "sc7280.dtsi"
>> +
>> +/ {
>> +       model = "Qualcomm Technologies, Inc. SC7280 IDP platform";
> 
> Because it is capitalized here.
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
