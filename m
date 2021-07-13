Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 773C23C68B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jul 2021 04:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233633AbhGMC70 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 22:59:26 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:31026 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230394AbhGMC70 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 22:59:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626144997; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=OwUzq8Bk0mCIp8T45P6IMfGxITW5wgytrVqOfCWjBDM=; b=Q0oGeV05Pi7oncpM6juWe/TtwGQ6kcxTwqjCFzU2HdcvmkxZG1iEc0oPUUgMSKHXdw81lX7X
 T7aB7bMMHWrieFqqRNBKC+DPv9RdwWlGyJSsGYBPccvqZd83BQSLg3ikQEAJL2ZMCLswPaAE
 YLFnvnhZD+vvUlnIm+0xt/YXFF0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60ed00de3a8b6d0a4551ff71 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Jul 2021 02:56:30
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E92DDC43460; Tue, 13 Jul 2021 02:56:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.100] (unknown [49.204.181.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 956C2C433F1;
        Tue, 13 Jul 2021 02:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 956C2C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: Add SC7280 DISPCC clock
 binding
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1619519590-3019-1-git-send-email-tdas@codeaurora.org>
 <1619519590-3019-2-git-send-email-tdas@codeaurora.org>
 <20210503191837.GA2220566@robh.at.kernel.org>
 <162261690404.4130789.10296098922791923637@swboyd.mtv.corp.google.com>
 <162261709373.4130789.1672298535915353982@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <6c108b5c-21a5-7186-7c73-2d984867cba8@codeaurora.org>
Date:   Tue, 13 Jul 2021 08:26:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <162261709373.4130789.1672298535915353982@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Stephen,
  Thanks for your review.

On 6/2/2021 12:28 PM, Stephen Boyd wrote:
> Quoting Stephen Boyd (2021-06-01 23:55:04)
>> Quoting Rob Herring (2021-05-03 12:18:37)
>>> On Tue, Apr 27, 2021 at 04:03:05PM +0530, Taniya Das wrote:
>>>> diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7280.h b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
>>>> new file mode 100644
>>>> index 0000000..2074b30
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
>>>> @@ -0,0 +1,55 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>
>>> Dual license please. I'm tired of telling the company that complained to
>>> me about having dual licensing for DT stuff not dual license their
>>> stuff. Please pass that on to your coworkers.
>>>
>>
>> Taniya, is this going to be resent?
> 
> Also, can you update the gcc binding that was already merged?
> 

Yes, it will be taken care in the next patch series.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
