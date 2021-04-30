Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A404C36F4D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Apr 2021 06:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbhD3EUi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Apr 2021 00:20:38 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:36188 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhD3EUh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Apr 2021 00:20:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619756390; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=p96M617M0cLXWMwRYD86v31l/3RAtWy/K/4ZMBXEbpM=; b=EwYXk8xSlDiSegxDIgoDlSUpVdnqBjB/Vdhd08sH3o7uAN5dQgMJheksBLMWijEWJWl+fTNq
 RtnUwXgVpd92E4FONzdfdfm0El0ekZDkVDsC/qp4DPPkxbE7bGtSkJsBAxhF9KsdDs3YnB9k
 bjVv+octbZJ9mpExhRwbgqRHYv8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 608b8551a817abd39a570272 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Apr 2021 04:19:29
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F271BC4323A; Fri, 30 Apr 2021 04:19:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.15] (unknown [61.3.17.29])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8A251C433D3;
        Fri, 30 Apr 2021 04:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8A251C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7280: Add "google,senor" to the
 compatible
To:     "Robert P. J. Day" <rpjday@crashcourse.ca>,
        Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <1619674827-26650-1-git-send-email-rnayak@codeaurora.org>
 <1619674827-26650-2-git-send-email-rnayak@codeaurora.org>
 <CAD=FV=UUowpvn_2uPrOQG9hOCdX6GYZDojBdW+w8hg5q6PfvAQ@mail.gmail.com>
 <a26e7152-208e-3343-a9f8-8dfdeb222aeb@crashcourse.ca>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <8391f7e4-b727-f369-2494-86609438012c@codeaurora.org>
Date:   Fri, 30 Apr 2021 09:49:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <a26e7152-208e-3343-a9f8-8dfdeb222aeb@crashcourse.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 4/29/2021 7:13 PM, Robert P. J. Day wrote:
> On Thu, 29 Apr 2021, Doug Anderson wrote:
> 
>> Hi,
>>
>> On Wed, Apr 28, 2021 at 10:40 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>>
>>> The sc7280 IDP board is also called senor in the Chrome OS builds.
>>> Add the "google,senor" compatible so coreboot/depthcharge knows what
>>> device tree blob to pick
>>>
>>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sc7280-idp.dts | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
>    subject line contains "google,senor"

are you suggesting it should not?

> 
> rday
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
