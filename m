Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E71FE254A16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 17:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgH0P6r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Aug 2020 11:58:47 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:56809 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727075AbgH0P6r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Aug 2020 11:58:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598543926; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=PXU1GxiflHtQGjyx5Lj/J5bd/WptB1Xkp5e6b+wuZz8=; b=I9iYMGYctvcOtT7A1uATwzFmaf1pEoMHbUwyQLacjTpJ/e4FIYayNccEHHHibYT7XL9tEJPt
 UeU4wMrITGlCiIq3EFZ0tmwvtDVvtC4Yeq1w7BpXyxQBKvm0/Kv5leDGT6QLIIhu9Ikh0jUi
 0wtflhq65iiR3bdlTelHgsJCNnA=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f47d836883d7674772131a3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 27 Aug 2020 15:58:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5AA31C433CA; Thu, 27 Aug 2020 15:58:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.101] (unknown [182.74.172.118])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C8255C433C6;
        Thu, 27 Aug 2020 15:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C8255C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
Subject: Re: [PATCH V2 0/2] Enable DVFS support for IPQ6018
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, sivaprak@codeaurora.org,
        devicetree@vger.kernel.org
References: <1597648720-13649-1-git-send-email-kathirav@codeaurora.org>
From:   Kathiravan T <kathirav@codeaurora.org>
Message-ID: <8de1b3ac-518c-ae82-4e2e-d4b24de7fcf1@codeaurora.org>
Date:   Thu, 27 Aug 2020 21:28:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597648720-13649-1-git-send-email-kathirav@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bjorn,


Can you help to share your comments on this series?


Thanks,

Kathiravan T.


On 8/17/2020 12:48 PM, Kathiravan T wrote:
> Add A53 PLL, APCS clock, RPM Glink, RPM message RAM, cpu-opp-table,
> SMPA2 regulator to enable the cpu frequency on IPQ6018.
>
> [v2]
> 	- Rebased on v5.9-rc1
> 	- Picked up the Rob's Acked-by tag for mailbox YAML
> 	- Regulator binding in V1 was picked by Mark and available in v5.9-rc1
>
> Kathiravan T (2):
>    dt-bindings: mailbox: add compatible for the IPQ6018 SoC
>    arm64: dts: ipq6018: enable DVFS support
>
>   .../bindings/mailbox/qcom,apcs-kpss-global.yaml    |  1 +
>   arch/arm64/boot/dts/qcom/ipq6018.dtsi              | 96 +++++++++++++++++++++-
>   2 files changed, 94 insertions(+), 3 deletions(-)
>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

