Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 973DD47ED2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 11:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727561AbfFQJud (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 05:50:33 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56560 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfFQJud (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 05:50:33 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DAE3560A63; Mon, 17 Jun 2019 09:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560765031;
        bh=G+Mh/Th62W8DiS2tkdPJylcX50k7ywJSYRreIQb9Vb0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=T5U8wSvMh8oAM0FBKhDwK64rOWuB408NqixPM8QSIWO6ERQOT9X4pEHjbugP9RLYZ
         fi2A2Yz6/0Ayk+GBIpSNKguVVCwn/SECg/L1RK0+m4hK21MZqBG4DGXr+paQoy7KUj
         oyqbjXJ4M91jrdR3dIFxbTtRGgB8EcDEVDuD2288=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.129.104] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7462E60274;
        Mon, 17 Jun 2019 09:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560765031;
        bh=G+Mh/Th62W8DiS2tkdPJylcX50k7ywJSYRreIQb9Vb0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=T5U8wSvMh8oAM0FBKhDwK64rOWuB408NqixPM8QSIWO6ERQOT9X4pEHjbugP9RLYZ
         fi2A2Yz6/0Ayk+GBIpSNKguVVCwn/SECg/L1RK0+m4hK21MZqBG4DGXr+paQoy7KUj
         oyqbjXJ4M91jrdR3dIFxbTtRGgB8EcDEVDuD2288=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7462E60274
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Subject: Re: [PATCH v3 3/4] iommu/arm-smmu: Add support to handle Qcom's
 wait-for-safe logic
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
 <20190612071554.13573-4-vivek.gautam@codeaurora.org>
 <6f85b50d-4ee8-d33a-37c9-72d45eb50a9d@free.fr>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Message-ID: <ec7bdccb-f8db-6dce-2454-ac2073be2c45@codeaurora.org>
Date:   Mon, 17 Jun 2019 15:20:28 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <6f85b50d-4ee8-d33a-37c9-72d45eb50a9d@free.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/14/2019 6:45 PM, Marc Gonzalez wrote:
> On 12/06/2019 09:15, Vivek Gautam wrote:
>
>> This change is inspired by the downstream change from Patrick Daly
>> to address performance issues with display and camera by handling
>> this wait-for-safe within separte io-pagetable ops to do TLB
>> maintenance. So a big thanks to him for the change.
>>
>> Without this change the UFS reads are pretty slow:
>> $ time dd if=/dev/sda of=/dev/zero bs=1048576 count=10 conv=sync
>> 10+0 records in
>> 10+0 records out
>> 10485760 bytes (10.0MB) copied, 22.394903 seconds, 457.2KB/s
>> real    0m 22.39s
>> user    0m 0.00s
>> sys     0m 0.01s
>>
>> With this change they are back to rock!
>> $ time dd if=/dev/sda of=/dev/zero bs=1048576 count=300 conv=sync
>> 300+0 records in
>> 300+0 records out
>> 314572800 bytes (300.0MB) copied, 1.030541 seconds, 291.1MB/s
>> real    0m 1.03s
>> user    0m 0.00s
>> sys     0m 0.54s
> This issue does not affect msm8998, I presume?
>
> Nevertheless, I see much lower performance on msm8998:
>
> # dd if=/dev/sde of=/dev/null bs=1M status=progress
> 3892314112 bytes (3.9 GB, 3.6 GiB) copied, 50.0042 s, 77.8 MB/s
>
> 80 MB/s on msm8998 -- vs -- 300 MB/s on sdm845
>
> Do you have the interconnect patches on sdm845 that allow boosting
> the clock/bandwidth for specific HW blocks?

Umm, No. This is the upstream 5.2-rc4 plus 4-6 patches to enable display 
and fix splash screen.
Is this the performance for UFS? The numbers i posted were for UFS.

Thanks
Vivek
