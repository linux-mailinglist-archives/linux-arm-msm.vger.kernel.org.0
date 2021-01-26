Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8385303D25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 13:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731494AbhAZMjY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 07:39:24 -0500
Received: from m42-8.mailgun.net ([69.72.42.8]:22412 "EHLO m42-8.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403949AbhAZKPB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 05:15:01 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611656077; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=VJRxFY8ci75sUTvygaKMgJ009Mw8EC58s0wPRv5AOG4=; b=L28xRo3csmr/BF1G/C1kB1QfExpWYS423glXgS9kP1qVio7dedjHq9nonfOX9PStN9MyjZso
 IW17mVqB9TFEc0XM36MymvdcMEV718U3Kca4eEedvFCr4D1HebJ9ubZ7MfpMAe5a2aAjZZy3
 2f8D0ceuSWPIvgpqnUfmtbfx+Tw=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 600feb712c36b2106d36caa6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Jan 2021 10:14:09
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F1352C43461; Tue, 26 Jan 2021 10:14:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 89D80C433C6;
        Tue, 26 Jan 2021 10:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 89D80C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        Carl Huang <cjhuang@codeaurora.org>,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mhi: use irq_flags if controller driver configures it
References: <20210104101128.8217-1-cjhuang@codeaurora.org>
        <20210104170359.GE2256@work> <87o8hti8t8.fsf@codeaurora.org>
        <20210121075242.GB30041@thinkpad>
Date:   Tue, 26 Jan 2021 12:14:04 +0200
In-Reply-To: <20210121075242.GB30041@thinkpad> (Manivannan Sadhasivam's
        message of "Thu, 21 Jan 2021 13:22:42 +0530")
Message-ID: <87k0s0atub.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> On Wed, Jan 13, 2021 at 09:40:19AM +0200, Kalle Valo wrote:
>> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
>> 
>> > On Mon, Jan 04, 2021 at 06:11:28PM +0800, Carl Huang wrote:
>> >> If controller driver has specified the irq_flags, mhi uses this specified
>> >> irq_flags. Otherwise, mhi uses default irq_flags.
>> >> 
>> >> The purpose of this change is to support one MSI vector for QCA6390.
>> >> MHI will use one same MSI vector too in this scenario.
>> >> 
>> >> In case of one MSI vector, IRQ_NO_BALANCING is needed when irq handler
>> >> is requested. The reason is if irq migration happens, the msi_data may
>> >> change too. However, the msi_data is already programmed to QCA6390
>> >> hardware during initialization phase. This msi_data inconsistence will
>> >> result in crash in kernel.
>> >> 
>> >> Another issue is in case of one MSI vector, IRQF_NO_SUSPEND will trigger
>> >> WARNINGS because QCA6390 wants to disable the IRQ during the suspend.
>> >> 
>> >> To avoid above two issues, QCA6390 driver specifies the irq_flags in case
>> >> of one MSI vector when mhi_register_controller is called.
>> >> 
>> >> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
>> >> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> >
>> > Applied to mhi-next!
>> 
>> Would it be possible again to have an immutable branch for this commit?
>> We need it for implementing one MHI support to ath11k[1] required by
>> Dell XPS 13 9310 laptops, which a lot of people are waiting. Otherwise I
>> can only apply the feature for v5.13, which will be released on July.
>> 
>
> Dropped this patch from mhi-next and applied to mhi-ath11k-immutable branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/log/?h=mhi-ath11k-immutable
>
> This branch will also be merged into mhi-next.

Thanks a lot!

And Greg will also pull this directly so that commit ids won't change?
Just trying to avoid conflicts between ath and mhi trees as much as
possible.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
