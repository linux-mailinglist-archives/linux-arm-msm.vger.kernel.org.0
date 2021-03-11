Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7713336EB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 10:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231837AbhCKJSh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 04:18:37 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:64887 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231683AbhCKJST (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 04:18:19 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615454299; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ok6cPK/Vb4ERxLXoqpg6v2SP5UGXdOaJ+FyJ2UcaCK8=; b=Hb0jvN+Fy67F7pChzJyorghb8qfnnpFB1b5O/TA6vd9pBrfMRyq0/5GIahcksbuOe2oY0yvO
 s8GN6DhoR87j0PCEZEd4Yp5+/NS3HBy0n4f3W7Jq0ST4K//c2X1zApXdpQcJmiz/ih0Zlzq7
 W+LH2vdBa+H/kcqYc2SJ4UZmbJc=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6049e05bd3a53bc38fc40ad2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Mar 2021 09:18:19
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5E9B5C433ED; Thu, 11 Mar 2021 09:18:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.102] (unknown [49.207.203.158])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A4686C433C6;
        Thu, 11 Mar 2021 09:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A4686C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v2 03/14] arm64: dts: sc7280: Add basic dts/dtsi files for
 sc7280 soc
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1614773878-8058-1-git-send-email-rnayak@codeaurora.org>
 <1614773878-8058-4-git-send-email-rnayak@codeaurora.org>
 <161481644369.1478170.2626772524314654990@swboyd.mtv.corp.google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <58061b1a-c383-980b-487b-89e4553bcc83@codeaurora.org>
Date:   Thu, 11 Mar 2021 14:48:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161481644369.1478170.2626772524314654990@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/4/2021 5:37 AM, Stephen Boyd wrote:
> Quoting Rajendra Nayak (2021-03-03 04:17:47)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> new file mode 100644
>> index 0000000..4a56d9c
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -0,0 +1,299 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * sc7280 SoC device tree source
>> + *
>> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/clock/qcom,gcc-sc7280.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +/ {
>> +       interrupt-parent = <&intc>;
>> +
>> +       #address-cells = <2>;
>> +       #size-cells = <2>;
>> +
>> +       chosen { };
>> +
>> +       clocks {
>> +               xo_board: xo-board {
>> +                       compatible = "fixed-clock";
>> +                       clock-frequency = <76800000>;
> 
> If this is the correct frequency I think we need to update the rpmh clk
> driver to use the correct divider? Right now I think it is a 2 when it
> should be 4?

Looks like this is fixed now [1]

[1] https://lore.kernel.org/patchwork/patch/1393159/

> 
>> +                       #clock-cells = <0>;
>> +               };
>> +
>> +               sleep_clk: sleep-clk {
>> +                       compatible = "fixed-clock";
>> +                       clock-frequency = <32000>;
>> +                       #clock-cells = <0>;
>> +               };
>> +       };

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
