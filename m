Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9392DC69B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Dec 2020 19:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731264AbgLPSfy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Dec 2020 13:35:54 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:56866 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731259AbgLPSfy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Dec 2020 13:35:54 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608143730; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=d+gh/fylH0hrmnaA52j5UKNxuzxbDoS81ggDzi83+Hw=; b=bTvtT3oN/nIE/ZHR3JuhMFYNUsPHK6ZW9OBrP0vC89M94UbZGVd2WfpZ8iOC3Q1IFcHbKG46
 tXOvRRK1dzFXko1dkdf4y1OMH7m8+LAFNB4LglCVcguVnG09OVVQY0ZF85OvgCEqmXCbeorf
 2R9OFHW5U40I0aFuBHlqXswPOh4=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5fda5353065be8d8351c39ab (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Dec 2020 18:34:59
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2E63BC43461; Wed, 16 Dec 2020 18:34:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 74C5DC433C6;
        Wed, 16 Dec 2020 18:34:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 74C5DC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     "open list\:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, ath11k@lists.infradead.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: ath11k/mhi backtraces on shutdown with linux-next
References: <CAA8EJppRhRCVOrXT0=nxomCFonna3YHhNEv-YFLyjaQX4gRptw@mail.gmail.com>
        <878sa34ni7.fsf@codeaurora.org>
        <CAA8EJppwnfy-Hi9pabGL-g9BgEcac6bs3jn8J1n=PPr9-y-d-A@mail.gmail.com>
Date:   Wed, 16 Dec 2020 20:34:55 +0200
In-Reply-To: <CAA8EJppwnfy-Hi9pabGL-g9BgEcac6bs3jn8J1n=PPr9-y-d-A@mail.gmail.com>
        (Dmitry Baryshkov's message of "Sun, 13 Dec 2020 00:04:45 +0300")
Message-ID: <87y2hxvbu8.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Sat, 12 Dec 2020 at 08:11, Kalle Valo <kvalo@codeaurora.org> wrote:
>>
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>>
>> > Hello,
>> >
>> > I've noticed the following backtrace during shutdown stage when
>> > rebooting RB5 board,
>> > using linux-next/master:
>> >
>> > [   31.060483] ath11k_pci 0000:01:00.0: shutdown
>> > [   31.067844] ------------[ cut here ]------------
>> > [   31.073111] WARNING: CPU: 4 PID: 101 at
>> > drivers/iommu/io-pgtable-arm.c:583 __arm_lpae_unmap+0x39c/0x550
>>
>> Do you have CONFIG_DMA_API_DEBUG disabled? There is one commit fixing a
>> DMA API debug warning but that should be in linux-next already:
>>
>> cd6181ff7e93 ath11k: dp_rx: fix monitor status dma unmap direction
>
> I have enabled CONFIG_DMA_API_DEBUG (and _SG too). Got no additional
> traces during boot and the same trace during reboot.

On x86 I see this during rmmod when iommu is enabled:

[  +0.012066] DMAR: DRHD: handling fault status reg 2
[  +0.000022] DMAR: [DMA Write] Request device [06:00.0] PASID ffffffff fault addr 0 [fault reason 05] PTE Write access is not set
[  +0.014657] DMAR: DRHD: handling fault status reg 2
[  +0.000017] DMAR: [DMA Write] Request device [06:00.0] PASID ffffffff fault addr 0 [fault reason 05] PTE Write access is not set

Is that the similar issue you are seeing, but just the printouts are
different due to different iommu implementation?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
