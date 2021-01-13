Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFEA2F456C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 08:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbhAMHl1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 02:41:27 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:42073 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbhAMHl1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 02:41:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610523666; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=o+bEyOuV8qLl66hULtpvyiZg0Sf1gcXndJpcnNWYXRg=; b=NarAJ8uUihIP/QLxvTWfig7hXzToBUclzqYvfqQp4esvUxUEje5Kk6KlrWFouG7AhBo1MwAS
 UsAUy9DzQ8KkwLSiIz0G4FIr5J53JScOgImT69yzAQeSeksOD7neheVDkmeUSImbqa/JlSJW
 ECsfP5NI2thPy7IjXAwNJoSp4JY=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5ffea3e9f1be2d22c4d5c686 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Jan 2021 07:40:25
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 86E30C43461; Wed, 13 Jan 2021 07:40:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CCA8AC433CA;
        Wed, 13 Jan 2021 07:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CCA8AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Carl Huang <cjhuang@codeaurora.org>, hemantk@codeaurora.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3] mhi: use irq_flags if controller driver configures it
References: <20210104101128.8217-1-cjhuang@codeaurora.org>
        <20210104170359.GE2256@work>
Date:   Wed, 13 Jan 2021 09:40:19 +0200
In-Reply-To: <20210104170359.GE2256@work> (Manivannan Sadhasivam's message of
        "Mon, 4 Jan 2021 22:33:59 +0530")
Message-ID: <87o8hti8t8.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> On Mon, Jan 04, 2021 at 06:11:28PM +0800, Carl Huang wrote:
>> If controller driver has specified the irq_flags, mhi uses this specified
>> irq_flags. Otherwise, mhi uses default irq_flags.
>> 
>> The purpose of this change is to support one MSI vector for QCA6390.
>> MHI will use one same MSI vector too in this scenario.
>> 
>> In case of one MSI vector, IRQ_NO_BALANCING is needed when irq handler
>> is requested. The reason is if irq migration happens, the msi_data may
>> change too. However, the msi_data is already programmed to QCA6390
>> hardware during initialization phase. This msi_data inconsistence will
>> result in crash in kernel.
>> 
>> Another issue is in case of one MSI vector, IRQF_NO_SUSPEND will trigger
>> WARNINGS because QCA6390 wants to disable the IRQ during the suspend.
>> 
>> To avoid above two issues, QCA6390 driver specifies the irq_flags in case
>> of one MSI vector when mhi_register_controller is called.
>> 
>> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>
> Applied to mhi-next!

Would it be possible again to have an immutable branch for this commit?
We need it for implementing one MHI support to ath11k[1] required by
Dell XPS 13 9310 laptops, which a lot of people are waiting. Otherwise I
can only apply the feature for v5.13, which will be released on July.

[1] https://patchwork.kernel.org/project/linux-wireless/list/?series=405591&state=*

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
