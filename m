Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A455132D885
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 18:23:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbhCDRW2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 12:22:28 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:20812 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231294AbhCDRV7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 12:21:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614878500; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=ktAWgMbXCvDZwWNBGkjqcNePucXjOUTQyk0mtbVGRoM=; b=SwmEaJNnrZ2u8nIY0xAW+bsR3xYetgdOdNvAqnhOGMcVSaUWiFRIIgCmd1ecOvbJYAn7DB8x
 QHC3YAt8pS0l/d4XiSE0zz3Hv9HZrDWgruwjEGUXq0NAMNbSug37GHDrTOmXra6xPSRXqBFy
 3QRQawOA2BnuSAI8v88A5O8kug4=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60411711f7ec0ea57cd0869e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Mar 2021 17:21:21
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ABF14C43461; Thu,  4 Mar 2021 17:21:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 70726C433CA;
        Thu,  4 Mar 2021 17:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 70726C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [regression] mhi: mhi_pm_st_worker blocked for more than 61 seconds.
References: <87im6755ii.fsf@codeaurora.org> <20210304151004.GA29563@work>
Date:   Thu, 04 Mar 2021 19:21:16 +0200
In-Reply-To: <20210304151004.GA29563@work> (Manivannan Sadhasivam's message of
        "Thu, 4 Mar 2021 20:40:04 +0530")
Message-ID: <87blby6dir.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> Hi Kalle,
>
> On Thu, Mar 04, 2021 at 04:59:33PM +0200, Kalle Valo wrote:
>> Hi MHI folks,
>> 
>> I upgraded my QCA6390 x86 test box to v5.12-rc1 and started seeing
>> kernel crashes when testing ath11k. I don't recall seeing this on v5.11
>> so it looks like a new problem, but I cannot be 100% sure. Netconsole
>> output is below. I have most of the kernel debug functionality enabled
>> (KASAN etc).
>> 
>> I can fairly easy reproduce this by looping insmod and rmmod of mhi,
>> wireless and ath11k modules. It does not happen every time, but I would
>> say I can reproduce the problem within 10 test loops or so.
>> 
>> Any ideas what could cause this? I have not bisected this due to lack of
>> time, but I can test patches etc.
>> 
>
> Not sure if this is related, Loic sent a patch which fixes an issue with
> "mhi_pm_state_worker":
>
> https://patchwork.kernel.org/project/linux-arm-msm/patch/1614161930-8513-1-git-send-email-loic.poulain@linaro.org/
>
> Can you please test see if it fixes your issue also?

Thanks for the link, but unfortunately not :( I was able to reproduce
the issue just after 3 insmod/rmmod loops.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
