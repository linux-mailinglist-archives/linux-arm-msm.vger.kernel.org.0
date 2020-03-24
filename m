Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C32051904D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 06:17:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgCXFQ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 01:16:56 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:37481 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725934AbgCXFQz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 01:16:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585027015; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=HJVvgeexErEjlhM7G8ecIrzeSjkVY0caLFRfY64utGo=; b=QOgKAD/Mqs2MS10qlFhd5aaiVU4nFtcEZy7ZZZUQgPXwNwKnJ0jWYTeAH2ddkyOJdEHsDI5w
 P9PklFTczNUdKtXCVdaVcepHXXubeZcyHOeFnPO4ekLxTMZGdNFuJjnwVhWKI6utCkgmS6dK
 e2u7433CFeJ0Kv1abJrRCvfS2LU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7997bf.7ff25d1ba928-smtp-out-n01;
 Tue, 24 Mar 2020 05:16:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 84445C43636; Tue, 24 Mar 2020 05:16:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.13] (unknown [183.83.138.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A65DAC433D2;
        Tue, 24 Mar 2020 05:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A65DAC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V5 3/3] dt-bindings: geni-se: Add binding for UART pin
 swap
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>, rojay@codeaurora.org,
        c_skakit@codeaurora.org, Matthias Kaehlcke <mka@chromium.org>
References: <1584095350-841-1-git-send-email-akashast@codeaurora.org>
 <1584095350-841-4-git-send-email-akashast@codeaurora.org>
 <CAL_JsqKLoiPUhiJDuYX+bSQwoCLTXOvtNyEB8ti__xMfEDyxNQ@mail.gmail.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <ee34573a-e4ff-ad43-64ed-53439206d534@codeaurora.org>
Date:   Tue, 24 Mar 2020 10:46:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKLoiPUhiJDuYX+bSQwoCLTXOvtNyEB8ti__xMfEDyxNQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On 3/20/2020 11:37 PM, Rob Herring wrote:
> On Fri, Mar 13, 2020 at 4:29 AM Akash Asthana <akashast@codeaurora.org> wrote:
>> Add documentation to support RX/TX/CTS/RTS pin swap in HW.
>>
>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>> ---
>> Changes in V5:
>>   -  As per Matthias's comment, remove rx-tx-cts-rts-swap property from UART
>>      child node.
>>
>>   Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
> STM32 folks need something similar. Can you move this to a common
> location. That's serial.txt, but that is being converted to DT schema.
>
> Rob

Okay, once serial.txt is converted to DT schema, I will move it there.

Regards,

Akash

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
