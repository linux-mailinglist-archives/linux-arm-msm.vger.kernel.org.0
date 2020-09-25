Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 577CD279006
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Sep 2020 20:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727751AbgIYSDX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Sep 2020 14:03:23 -0400
Received: from z5.mailgun.us ([104.130.96.5]:10731 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727733AbgIYSDW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Sep 2020 14:03:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601057001; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=qY4VJvItq00HpQ9BTONtJKsVJWDUImIVuhzVMFuGVJg=; b=XxMwxo0julerqOh4fDvREfpVXXiMV082Gm1cwGSuYXyvElaBYTnp5BvCJnuxhw4g7seJMEvS
 UNLF5uavdLSwiAbqjPvouHCtSSQLddJwD8AXCrrB4CS/e55GauNuSnybzvmnvfDyw2XXby1g
 JNAa++SU7F7+xwBYdSbnISXL0OI=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f6e3095b51786209ca925c2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 25 Sep 2020 18:01:57
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6DBB3C433FF; Fri, 25 Sep 2020 18:01:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DE82EC433C8;
        Fri, 25 Sep 2020 18:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DE82EC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] bus: mhi: core: debugfs: Use correct format specifiers
 for addresses
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200925171608.30881-1-manivannan.sadhasivam@linaro.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <c63ae2c3-43ae-6a94-cf27-efb6cc038f83@codeaurora.org>
Date:   Fri, 25 Sep 2020 12:01:54 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20200925171608.30881-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/25/2020 11:16 AM, Manivannan Sadhasivam wrote:
> For exposing the addresses of read/write pointers and doorbell register,
> let's use the correct format specifiers. This fixes the following issues
> generated using W=1 build in ARM32 and reported by Kbuild bot:
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/bus/mhi/core/debugfs.c:75:7: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
>                                mhi_event->db_cfg.db_val);
>                                ^~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/bus/mhi/core/debugfs.c:123:7: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
>                                mhi_chan->db_cfg.db_val);
>                                ^~~~~~~~~~~~~~~~~~~~~~~
>     2 warnings generated.
> 
> drivers/bus/mhi/core/debugfs.c: In function ‘mhi_debugfs_events_show’:
> drivers/bus/mhi/core/debugfs.c:74:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>     seq_printf(m, " local rp: 0x%llx db: 0x%pad\n", (u64)ring->rp,
>                                                     ^
> drivers/bus/mhi/core/debugfs.c: In function ‘mhi_debugfs_channels_show’:
> drivers/bus/mhi/core/debugfs.c:122:7: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>         (u64)ring->rp, (u64)ring->wp,
>         ^
> drivers/bus/mhi/core/debugfs.c:122:22: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>         (u64)ring->rp, (u64)ring->wp,
>                        ^
> drivers/bus/mhi/core/debugfs.c:121:62: warning: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 5 has type ‘dma_addr_t {aka unsigned int}’ [-Wformat=]
>     seq_printf(m, " local rp: 0x%llx local wp: 0x%llx db: 0x%llx\n",
>                                                             ~~~^
>                                                             %x
> drivers/bus/mhi/core/debugfs.c:123:7:
>         mhi_chan->db_cfg.db_val);
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> 
> Greg: This fixes the issue seen while testing the char-misc/char-misc-testing
> branch.
> 
>   drivers/bus/mhi/core/debugfs.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/debugfs.c b/drivers/bus/mhi/core/debugfs.c
> index 53d05a8e168d..2536ff92b76f 100644
> --- a/drivers/bus/mhi/core/debugfs.c
> +++ b/drivers/bus/mhi/core/debugfs.c
> @@ -71,8 +71,8 @@ static int mhi_debugfs_events_show(struct seq_file *m, void *d)
>   		seq_printf(m, " rp: 0x%llx wp: 0x%llx", er_ctxt->rp,
>   			   er_ctxt->wp);
>   
> -		seq_printf(m, " local rp: 0x%llx db: 0x%llx\n", (u64)ring->rp,
> -			   mhi_event->db_cfg.db_val);
> +		seq_printf(m, " local rp: 0x%px db: 0x%pad\n", ring->rp,
> +			   &mhi_event->db_cfg.db_val);
>   	}
>   
>   	return 0;
> @@ -118,9 +118,9 @@ static int mhi_debugfs_channels_show(struct seq_file *m, void *d)
>   		seq_printf(m, " base: 0x%llx len: 0x%llx wp: 0x%llx",
>   			   chan_ctxt->rbase, chan_ctxt->rlen, chan_ctxt->wp);
>   
> -		seq_printf(m, " local rp: 0x%llx local wp: 0x%llx db: 0x%llx\n",
> -			   (u64)ring->rp, (u64)ring->wp,
> -			   mhi_chan->db_cfg.db_val);
> +		seq_printf(m, " local rp: 0x%px local wp: 0x%px db: 0x%pad\n",
> +			   ring->rp, ring->wp,
> +			   &mhi_chan->db_cfg.db_val);
>   	}
>   
>   	return 0;
> 

Documentation/printk-formats.txt seems to point out that %px is 
"insecure" and thus perhaps not preferred.  Are we assuming that debugfs 
is only accessible by root, and thus the %px usage here is effectively 
the same as %pK?

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
