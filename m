Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3F422D40A4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Dec 2020 12:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730161AbgLILGI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 06:06:08 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:21390 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730359AbgLILFw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 06:05:52 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607511924; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=R1eA7K+kLgc5Me1oF+PjqvgKANOliO8GkXvNmcPSg7A=; b=ZlQfFhIJi6kGOQPGBGdyGu6rSGdyyuZb38y9UU5O4AHZOr02A2zYBRtXGilrS+KKlbHYg0/b
 ZBSrJFtxSn/dPxLfBjhVw+g3PXFZE3kk8YSpOJSEbM7WDrq0+7Gmw0+nf6CDCyn8CFe629WF
 xxCaXFdPmmxEU1IOmb7pY0gMrY8=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fd0af526d5c2f1d20013054 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 09 Dec 2020 11:04:50
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B3D80C43461; Wed,  9 Dec 2020 11:04:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.77.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5FE48C433C6;
        Wed,  9 Dec 2020 11:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5FE48C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH] drivers: qcom: rpmh-rsc: Do not read back the register
 write on trigger
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Srinivas Rao L <lsrao@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
References: <1606211610-15168-1-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=Xk_1=eCvqLPPnYLrQWf1zVy+iEHs=DWEubb6n5ub3Wxw@mail.gmail.com>
 <CAD=FV=XafiNR+vZc2nM6JzhU7xPm9v3eeeR5SMhBM3k3mmsZDQ@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <37d7a6e4-8773-6de2-8914-b39e656ed2f0@codeaurora.org>
Date:   Wed, 9 Dec 2020 16:34:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XafiNR+vZc2nM6JzhU7xPm9v3eeeR5SMhBM3k3mmsZDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

On 12/4/2020 2:47 AM, Doug Anderson wrote:
> Hi,
>
> On Thu, Dec 3, 2020 at 1:15 PM Doug Anderson <dianders@chromium.org> wrote:
>> Hi,
>>
>> On Tue, Nov 24, 2020 at 1:53 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>>> From: Lina Iyer <ilina@codeaurora.org>
>>>
>>> When triggering a TCS to send its contents, reading back the trigger
>>> value may return an incorrect value. That is because, writing the
>>> trigger may raise an interrupt which could be handled immediately and
>>> the trigger value could be reset in the interrupt handler.
>>>
>>> A write_tcs_reg_sync() would read back the value that is written and try
>>> to match it to the value written to ensure that the value is written,
>>> but if that value is different, we may see false error for same.
>>>
>>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>>> ---
>>>   drivers/soc/qcom/rpmh-rsc.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> Fixes: 658628e7ef78 ("drivers: qcom: rpmh-rsc: add RPMH controller for
>> QCOM SoCs")
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Ugh, brain-fart.  Not Signed-off-by, but:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks for the review, i will send v2 adding Fixes: tag.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

