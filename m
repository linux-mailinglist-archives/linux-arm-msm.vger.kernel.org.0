Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8214C47FF8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 12:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbfFQKsP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 06:48:15 -0400
Received: from ns.iliad.fr ([212.27.33.1]:53100 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbfFQKsP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 06:48:15 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 699D620732;
        Mon, 17 Jun 2019 12:48:13 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 55E4A206B8;
        Mon, 17 Jun 2019 12:48:13 +0200 (CEST)
Subject: Re: [PATCH v3 3/4] iommu/arm-smmu: Add support to handle Qcom's
 wait-for-safe logic
To:     Vivek Gautam <vivek.gautam@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
 <20190612071554.13573-4-vivek.gautam@codeaurora.org>
 <6f85b50d-4ee8-d33a-37c9-72d45eb50a9d@free.fr>
 <ec7bdccb-f8db-6dce-2454-ac2073be2c45@codeaurora.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <c6d30912-17b3-3349-e742-bbf0ff02a50f@free.fr>
Date:   Mon, 17 Jun 2019 12:48:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ec7bdccb-f8db-6dce-2454-ac2073be2c45@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Mon Jun 17 12:48:13 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/06/2019 11:50, Vivek Gautam wrote:

> On 6/14/2019 6:45 PM, Marc Gonzalez wrote:
>
>> # dd if=/dev/sde of=/dev/null bs=1M status=progress
>> 3892314112 bytes (3.9 GB, 3.6 GiB) copied, 50.0042 s, 77.8 MB/s
>>
>> 80 MB/s on msm8998 -- vs -- 300 MB/s on sdm845
>>
>> Do you have the interconnect patches on sdm845 that allow boosting
>> the clock/bandwidth for specific HW blocks?
> 
> Umm, No. This is the upstream 5.2-rc4 plus 4-6 patches to enable display 
> and fix splash screen.
> Is this the performance for UFS? The numbers I posted were for UFS.

Correct, the numbers I provided were for msm8998 UFS...

Basically, it looks like sdm845 UFS is 4x faster than msm8998 UFS
using upstream. Which is surprising (may depend on specific Flash
chip in use though).

Would be good if somebody with both boards could post numbers.
I'll try to post "fresh" numbers when I can.

Regards.
