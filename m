Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA2331549A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 18:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232925AbhBIRDj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 12:03:39 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:10614 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233061AbhBIRDh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 12:03:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612890197; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=6o/6RLJ+Nd2zpwJacnDC5NcTpfXXzsslRlwdBtcYCKI=; b=lspTDLwzPS4PveCSm2JvKIKs8Le14blMMbcbhVMKMMPTqYUOVLiP2Qpsg2rZ2mEGw4zUEoaE
 EWVRacUrwtS6CUmnJIM7onGz2In5HACmFLJrBOTeepRUlupk1kOW3oO2+dmJeJ3bEIcRlwxu
 Y3gGJcLNLxqGZCM04a8HcMlQ97Y=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6022c013e4842e9128400565 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Feb 2021 17:02:11
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 004CCC433ED; Tue,  9 Feb 2021 17:02:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 105A2C43461;
        Tue,  9 Feb 2021 17:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 105A2C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] mhi: Fix double dma free
References: <1612885989-12288-1-git-send-email-loic.poulain@linaro.org>
        <CAMZdPi9xRTrhkZ+q4db0GKZb+AcJ9YXY_-_wTO6KNROCxipj0g@mail.gmail.com>
Date:   Tue, 09 Feb 2021 19:02:06 +0200
In-Reply-To: <CAMZdPi9xRTrhkZ+q4db0GKZb+AcJ9YXY_-_wTO6KNROCxipj0g@mail.gmail.com>
        (Loic Poulain's message of "Tue, 9 Feb 2021 16:55:04 +0100")
Message-ID: <87tuqltbsh.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Loic Poulain <loic.poulain@linaro.org> writes:

> Hi Kalle,
>
> On Tue, 9 Feb 2021 at 16:45, Loic Poulain <loic.poulain@linaro.org> wrote:
>>
>> mhi_deinit_chan_ctxt functionthat takes care of unitializing channel
>> resources, including unmapping coherent MHI areas, can be called
>> from different path in case of controller unregistering/removal:
>>  - From a client driver remove callback, via mhi_unprepare_channel
>>  - From mhi_driver_remove that unitialize all channels
>>
>> mhi_driver_remove()
>> |-> driver->remove()
>> |    |-> mhi_unprepare_channel()
>> |        |-> mhi_deinit_chan_ctxt()
>> |...
>> |-> mhi_deinit_chan_ctxt()
>>
>> This leads to double dma freeing...
>>
>> Fix that by preventing deinit for already uninitialized channel.
>>
>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>> Reported-by: Kalle Valo <kvalo@codeaurora.org>
>
> This is a 'blind' fix tentative, can you please check if it resolves
> the issue on your side?

I did a quick test few times and I don't see any crashes anymore, thanks!

Tested-by: Kalle Valo <kvalo@codeaurora.org>

And like Jeffrey said:

Fixes: a7f422f2f89e ("bus: mhi: Fix channel close issue on driver remove")

Is it too late to push this to v5.11? But this should go to v5.12.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
