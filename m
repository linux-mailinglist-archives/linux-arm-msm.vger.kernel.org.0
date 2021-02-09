Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB523152C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 16:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232682AbhBIP1u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 10:27:50 -0500
Received: from so15.mailgun.net ([198.61.254.15]:47559 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232520AbhBIP0j (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 10:26:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612884377; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=oq5INHOENsPvBDSGhKLY5rHnMSycJSg4zHZVqtqS9sA=; b=DBSkplbH8hwd++5humotlChQJPVq3buNaZ1rB+taSG7gg6EwPADnBqEuC6fhT/jhlC5rXAip
 KxjiZuzdbi47a/jzi69zRYoyLCMeJiZJ29Lq9ns9Ey7Osn4SjmORZts51qHyPBbP/L5+sBYf
 rS+I1OZJDJvvu18RJbao/klAF88=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6022a97681f6c45dce2df64d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Feb 2021 15:25:42
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E1419C433ED; Tue,  9 Feb 2021 15:25:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5C04BC433CA;
        Tue,  9 Feb 2021 15:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5C04BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        ath11k@lists.infradead.org, Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [regression] mhi: rmmod ath11k_pci crashing on v5.11
References: <8735y5uwke.fsf@codeaurora.org>
        <CAMZdPi9pFHA-p3-e+-HNp8y3QPwg7GOgDucJ+HG8ETtxqZ=_9A@mail.gmail.com>
Date:   Tue, 09 Feb 2021 17:25:37 +0200
In-Reply-To: <CAMZdPi9pFHA-p3-e+-HNp8y3QPwg7GOgDucJ+HG8ETtxqZ=_9A@mail.gmail.com>
        (Loic Poulain's message of "Tue, 9 Feb 2021 16:21:28 +0100")
Message-ID: <87y2fxtg9a.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Loic Poulain <loic.poulain@linaro.org> writes:

> On Tue, 9 Feb 2021 at 15:48, Kalle Valo <kvalo@codeaurora.org> wrote:
>>
>> Hi Loic,
>>
>> I noticed that v5.11-rc6 was crashing on my ath11k test box with
>> QCA6390. The box was down for few weeks so I only noticed it late in the
>> cycle. After some manual testing I found out that reverting this commit
>> fixes the issue:
>>
>> a7f422f2f89e bus: mhi: Fix channel close issue on driver remove
>>
>> The crash happens when I issue 'sudo rmmod ath11k_pci' and it happens
>> every time. Through netconsole I get:
>>
>> Feb 9 16:43:30 nuc1 [ 313.202778] ath11k_pci 0000:06:00.0: qmi
>> failed set mode request, mode: 4, err = -110
>> Feb 9 16:43:30 nuc1 [ 313.202932] ath11k_pci 0000:06:00.0: qmi
>> failed to send wlan mode off
>> Feb  9 16:43:30 nuc1 [  313.225017] ------------[ cut here ]------------
>> Feb 9 16:43:30 nuc1 [ 313.225118] DMA-API: ath11k_pci 0000:06:00.0:
>> device driver tries to free DMA memory it has not allocated [device
>> address=0x00000000fffbc000] [size=2047 bytes]
>> Feb 9 16:43:30 nuc1 [ 313.225146] WARNING: CPU: 2 PID: 94 at
>> kernel/dma/debug.c:963 check_unmap+0x54a/0x8b0
>> Feb 9 16:43:30 nuc1 [ 313.225173] Modules linked in: ath11k_pci(-)
>> ath11k mac80211 libarc4 cfg80211 qmi_helpers qrtr_mhi mhi qrtr ns
>> mos7840 usbserial nvme nvme_core
>> Feb 9 16:43:30 nuc1 [ 313.225222] CPU: 2 PID: 94 Comm: kworker/u17:0
>> Not tainted 5.11.0-rc6 #362
>> Feb 9 16:43:30 nuc1 [ 313.225243] Hardware name: Intel(R) Client
>> Systems NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0049.2018.0801.1601
>> 08/01/2018
>> Feb  9 16:43:30 nuc1 [  313.225263] Workqueue: mhi_hiprio_wq mhi_pm_st_worker [mhi]
>> Feb  9 16:43:30 nuc1 [  313.225290] RIP: 0010:check_unmap+0x54a/0x8b0
>> Feb 9 16:43:30 nuc1 [ 313.225312] Code: 4d 85 e4 75 03 4c 8b 27 4c
>> 89 04 24 e8 8f 78 66 00 4c 8b 04 24 48 89 c6 4c 89 e9 4c 89 e2 48 c7
>> c7 c8 be 16 8f e8 26 39 ae 00 <0f> 0b 44 8b 1d 6d c2 9b 01 45 85 db
>> 0f 84 5f 02 00 00 48 83 c4 18
>> Feb  9 16:43:30 nuc1 [  313.225333] RSP: 0018:ffffbab5c08f3ab0 EFLAGS: 00010282
>> Feb 9 16:43:30 nuc1 [ 313.225355] RAX: 0000000000000000 RBX:
>> 00000000fffbc000 RCX: ffff99dbf55d9fb8
>> Feb 9 16:43:30 nuc1 [ 313.225375] RDX: 00000000ffffffd8 RSI:
>> 0000000000000027 RDI: ffff99dbf55d9fb0
>> Feb 9 16:43:30 nuc1 [ 313.225395] RBP: ffffbab5c08f3b00 R08:
>> 0000000000000001 R09: 0000000000000000
>> Feb 9 16:43:30 nuc1 [ 313.225415] R10: 0000000000000003 R11:
>> 3fffffffffffffff R12: ffff99da84c525d0
>> Feb 9 16:43:30 nuc1 [ 313.225434] R13: 00000000fffbc000 R14:
>> ffffffff90b96c90 R15: 0000000000000000
>> Feb 9 16:43:30 nuc1 [ 313.225453] FS: 0000000000000000(0000)
>> GS:ffff99dbf5400000(0000) knlGS:0000000000000000
>> Feb 9 16:43:30 nuc1 [ 313.225479] CS: 0010 DS: 0000 ES: 0000 CR0:
>> 0000000080050033
>> Feb 9 16:43:30 nuc1 [ 313.225500] CR2: 0000556d03a34250 CR3:
>> 000000010d9e2003 CR4: 00000000003706e0
>> Feb  9 16:43:30 nuc1 [  313.225520] Call Trace:
>> Feb  9 16:43:30 nuc1 [  313.225541]  ? __lock_acquire+0x3bd/0x6d0
>> Feb  9 16:43:30 nuc1 [  313.225565]  debug_dma_free_coherent+0xb0/0xf0
>> Feb  9 16:43:30 nuc1 [  313.225594]  ? mhi_driver_remove+0x11d/0x290 [mhi]
>> Feb  9 16:43:30 nuc1 [  313.225620]  ? __mutex_lock+0x6ca/0x8f0
>> Feb  9 16:43:30 nuc1 [  313.225643]  ? qcom_mhi_qrtr_remove+0x18/0x30 [qrtr_mhi]
>> Feb  9 16:43:30 nuc1 [  313.225668]  dma_free_attrs+0x48/0xb0
>> Feb  9 16:43:30 nuc1 [  313.225710]  mhi_driver_remove+0x21e/0x290 [mhi]
>> Feb  9 16:43:30 nuc1 [  313.225742]  __device_release_driver+0x17b/0x230
>
> Ok, I think it's because there are two paths leading to
> 'mhi_deinit_chan_ctxt' and causing double page free (driver's remove
> callback via channel_unprepare and mhi_driver_remove via deinit loop).
> Checking and going to provide a fix.

Great, thank you. Feel free to send me any test patches, it's very easy
for me to reproduce the crash.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
