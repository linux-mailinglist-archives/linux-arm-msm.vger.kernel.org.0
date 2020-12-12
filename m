Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99C252D84A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Dec 2020 06:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbgLLFMn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Dec 2020 00:12:43 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:26795 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727081AbgLLFMa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Dec 2020 00:12:30 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607749929; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=RnmhzVf0N18QH7Gpf+Zs6kg6BKxPRoDjpSeAI7txg2E=; b=cRdJR9EVfp5wCUZ+NtKK2z3bFU86dBvlG9GRYrBuZveK/EEOEvAr8DkknxbH7ovZMMSJ5FMO
 ne9boqzX/g+qbAq74HFev7agO/LtPBdKw7XB+X+aDhXcvZ9lvVErApSl4MvqsPuH2wRgdD99
 olrm92FJfN7i2xsMXSpJq31OiFc=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fd45104ac06f8705342e6f3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 12 Dec 2020 05:11:32
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2DC67C43462; Sat, 12 Dec 2020 05:11:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 63CB1C433C6;
        Sat, 12 Dec 2020 05:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 63CB1C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     ath11k@lists.infradead.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "open list\:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>
Subject: Re: ath11k/mhi backtraces on shutdown with linux-next
References: <CAA8EJppRhRCVOrXT0=nxomCFonna3YHhNEv-YFLyjaQX4gRptw@mail.gmail.com>
Date:   Sat, 12 Dec 2020 07:11:28 +0200
In-Reply-To: <CAA8EJppRhRCVOrXT0=nxomCFonna3YHhNEv-YFLyjaQX4gRptw@mail.gmail.com>
        (Dmitry Baryshkov's message of "Sat, 12 Dec 2020 04:23:25 +0300")
Message-ID: <878sa34ni7.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Hello,
>
> I've noticed the following backtrace during shutdown stage when
> rebooting RB5 board,
> using linux-next/master:
>
> [   31.060483] ath11k_pci 0000:01:00.0: shutdown
> [   31.067844] ------------[ cut here ]------------
> [   31.073111] WARNING: CPU: 4 PID: 101 at
> drivers/iommu/io-pgtable-arm.c:583 __arm_lpae_unmap+0x39c/0x550

Do you have CONFIG_DMA_API_DEBUG disabled? There is one commit fixing a
DMA API debug warning but that should be in linux-next already:

cd6181ff7e93 ath11k: dp_rx: fix monitor status dma unmap direction

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
