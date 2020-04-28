Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 658AC1BBA4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 11:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgD1Jtn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 05:49:43 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:14329 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726904AbgD1Jtn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 05:49:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588067383; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=xfElqjHv0o0l7dEGWhAPUtysztIlWw5zreVDtxxMQh4=; b=tAHdqKlxm8iHs78n3m8TWWQlc3G6v0pxjkLq44Pj0I2kj2F9p1l2REm9EJ77sGNB/erupx20
 DDv0ypRR4TtkICHG3aHakPVGBSZM7td4F5jTi4TnO34B+Xxt4/s9SAZzyoqOGwoFbKS0gQQn
 5og2ixeGHQDsoRSZH+c0gHJSRIk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea7fc35.7fc83ca7bf80-smtp-out-n03;
 Tue, 28 Apr 2020 09:49:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11CEAC433F2; Tue, 28 Apr 2020 09:49:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [192.168.43.98] (unknown [157.48.58.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 49E77C433D2;
        Tue, 28 Apr 2020 09:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 49E77C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH V5 3/3] dt-bindings: geni-se: Add binding for UART pin
 swap
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>, rojay@codeaurora.org,
        c_skakit@codeaurora.org
References: <1584095350-841-1-git-send-email-akashast@codeaurora.org>
 <1584095350-841-4-git-send-email-akashast@codeaurora.org>
 <CAL_JsqKLoiPUhiJDuYX+bSQwoCLTXOvtNyEB8ti__xMfEDyxNQ@mail.gmail.com>
 <ee34573a-e4ff-ad43-64ed-53439206d534@codeaurora.org>
 <20200424205701.GE4525@google.com>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <36e01303-05d7-dbaa-45df-a04138102439@codeaurora.org>
Date:   Tue, 28 Apr 2020 15:19:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424205701.GE4525@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias

Thanks for notifying, I will make the changes.

Regards,

Akash

On 4/25/2020 2:27 AM, Matthias Kaehlcke wrote:
> Hi Akash,
>
> On Tue, Mar 24, 2020 at 10:46:40AM +0530, Akash Asthana wrote:
>> Hi Rob,
>>
>> On 3/20/2020 11:37 PM, Rob Herring wrote:
>>> On Fri, Mar 13, 2020 at 4:29 AM Akash Asthana <akashast@codeaurora.org> wrote:
>>>> Add documentation to support RX/TX/CTS/RTS pin swap in HW.
>>>>
>>>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
>>>> ---
>>>> Changes in V5:
>>>>    -  As per Matthias's comment, remove rx-tx-cts-rts-swap property from UART
>>>>       child node.
>>>>
>>>>    Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>> STM32 folks need something similar. Can you move this to a common
>>> location. That's serial.txt, but that is being converted to DT schema.
>>>
>>> Rob
>> Okay, once serial.txt is converted to DT schema, I will move it there.
> It has landed upstream:
>
> 175a7427bb72 dt-bindings: serial: Convert generic bindings to json-schema

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
