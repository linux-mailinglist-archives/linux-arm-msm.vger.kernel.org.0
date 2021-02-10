Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84D98317181
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 21:41:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232169AbhBJUj4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 15:39:56 -0500
Received: from so15.mailgun.net ([198.61.254.15]:41720 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231543AbhBJUjx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 15:39:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612989577; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=re3ZX68dLN252XNiKSoMfqe2KqpIK7+F3HQtYq/7pnA=; b=CKCYnie922yBcRWb8wNSFkrNDQcADV6fgL+oErlFSE6NWSGgwEIj0G/JJDEpml4wnPisXhlf
 Ut36iYOADPep4ASDnjvFrwP/T2areNmDtDIPq1ZXweoNjj3seCHlwewgYmAGFiIUeOSYt+yh
 Lo3NXk7a1uIBiHuIIyn2WmLOTEE=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60244455e3df861f4b343afb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Feb 2021 20:38:45
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CF99FC43462; Wed, 10 Feb 2021 20:38:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DFB99C43461;
        Wed, 10 Feb 2021 20:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DFB99C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] bus: mhi: pci_generic: Increase num of elements in hw
 event ring
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
References: <1612514195-8257-1-git-send-email-loic.poulain@linaro.org>
 <20210205123400.GD3221@thinkpad>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <95e7164b-9829-dd16-f485-4d24c25ea2c0@codeaurora.org>
Date:   Wed, 10 Feb 2021 13:38:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205123400.GD3221@thinkpad>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/5/2021 5:34 AM, Manivannan Sadhasivam wrote:
> On Fri, Feb 05, 2021 at 09:36:35AM +0100, Loic Poulain wrote:
>> We met some sporadic modem crashes during high throughput testing, this
>> has been root caused to a lack of elements in the event ring. Indeed,
>> the modem is simply crashing when event ring becomes empty.
>>
>> It appears that the total number event ring elements is too low given
>> the performances of the modem (IPA hardware accelerator). This change
>> increases the number of elements in the hardware event ring to 2048,
>> which is aligned with what is defined in downstream version:
>> https://source.codeaurora.org/quic/la/kernel/msm-4.14/tree/arch/arm64/boot/dts/qcom/sm8150-mhi.dtsi?h=msm-4.14#n482
>>
>> With this change, modem coes not crash anymore.
>>
>> Note: An event ring element is 16-Byte, so the total memory usage of
>> a hardware event ring is now 32KB.
>>
>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> 
> Applied to mhi-next!
> 
> Thanks,
> Mani


Probably too late, but there is a typo in the commit text.  "modem coes 
not crash" should be "modem does not crash".

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
