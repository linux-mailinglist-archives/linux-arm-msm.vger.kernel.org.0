Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA3F425009
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 11:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240610AbhJGJ3a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 05:29:30 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:27033 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240592AbhJGJ3Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 05:29:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633598851; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=UG+p5YLM6Eum4VbBhk0do8XgFzWdXG+uYfvVRUIhFuk=; b=N1AL961qTW8Vfhf39c/2RF7cQLq2jrR1e04zTl8aPuwzS9VDy8wcMIM79URlF1I1iVPoMsU8
 O+pUgoMaQrv/e3LEAyBjKs9ulWEX6eoRaJVT+/fy90Qq/4nCovztGIHd4BGDk2Ejl3whxh5P
 jW2/S2y1mEVOBeSmUZU4YQgRci0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 615ebd7230ce13d2b4d69a7c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Oct 2021 09:27:14
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F13B3C43616; Thu,  7 Oct 2021 09:27:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 372A4C4338F;
        Thu,  7 Oct 2021 09:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 372A4C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     "open list\:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, ath11k@lists.infradead.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: ath11k/mhi backtraces on shutdown with linux-next
References: <CAA8EJppRhRCVOrXT0=nxomCFonna3YHhNEv-YFLyjaQX4gRptw@mail.gmail.com>
        <878sa34ni7.fsf@codeaurora.org>
        <CAA8EJppwnfy-Hi9pabGL-g9BgEcac6bs3jn8J1n=PPr9-y-d-A@mail.gmail.com>
        <87y2hxvbu8.fsf@codeaurora.org>
Date:   Thu, 07 Oct 2021 12:27:09 +0300
In-Reply-To: <87y2hxvbu8.fsf@codeaurora.org> (Kalle Valo's message of "Wed, 16
        Dec 2020 20:34:55 +0200")
Message-ID: <871r4xchhu.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
>> On Sat, 12 Dec 2020 at 08:11, Kalle Valo <kvalo@codeaurora.org> wrote:
>>>
>>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>>>
>>> > Hello,
>>> >
>>> > I've noticed the following backtrace during shutdown stage when
>>> > rebooting RB5 board,
>>> > using linux-next/master:
>>> >
>>> > [   31.060483] ath11k_pci 0000:01:00.0: shutdown
>>> > [   31.067844] ------------[ cut here ]------------
>>> > [   31.073111] WARNING: CPU: 4 PID: 101 at
>>> > drivers/iommu/io-pgtable-arm.c:583 __arm_lpae_unmap+0x39c/0x550
>>>
>>> Do you have CONFIG_DMA_API_DEBUG disabled? There is one commit fixing a
>>> DMA API debug warning but that should be in linux-next already:
>>>
>>> cd6181ff7e93 ath11k: dp_rx: fix monitor status dma unmap direction
>>
>> I have enabled CONFIG_DMA_API_DEBUG (and _SG too). Got no additional
>> traces during boot and the same trace during reboot.
>
> On x86 I see this during rmmod when iommu is enabled:
>
> [  +0.012066] DMAR: DRHD: handling fault status reg 2
> [ +0.000022] DMAR: [DMA Write] Request device [06:00.0] PASID ffffffff
> fault addr 0 [fault reason 05] PTE Write access is not set
> [  +0.014657] DMAR: DRHD: handling fault status reg 2
> [ +0.000017] DMAR: [DMA Write] Request device [06:00.0] PASID ffffffff
> fault addr 0 [fault reason 05] PTE Write access is not set
>
> Is that the similar issue you are seeing, but just the printouts are
> different due to different iommu implementation?

BTW, this patch should fix this:

https://patchwork.kernel.org/project/linux-wireless/patch/20210913180246.193388-5-jouni@codeaurora.org/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
