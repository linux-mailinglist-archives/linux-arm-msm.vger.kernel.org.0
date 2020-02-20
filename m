Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D96E3165963
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 09:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgBTIjz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 03:39:55 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:52397 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726541AbgBTIjz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 03:39:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582187993; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7LPj5WqUryWegMigWujZeMgopaFTsdUb2SSnoYMCyNg=;
 b=o63Khg90Adx6CR/FXkAvnKlBMvhQuiljuOK5zGKqteKEIKY59XQYEGIhIRzVCvBv8g2e3wne
 WsTwuc+Bss3kVSe9Oha2mEHKEvc4M3wrtwqVkUnG3/NlFzhCr53BX/+y/vTBPGMOGzM7l8vk
 yGOcrDHHuXo7clK7OSavoSsy1wc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4e45d6.7f0e0786a880-smtp-out-n03;
 Thu, 20 Feb 2020 08:39:50 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5A804C447A5; Thu, 20 Feb 2020 08:39:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4FF5BC433A2;
        Thu, 20 Feb 2020 08:39:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 20 Feb 2020 14:09:49 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     ulf.hansson@linaro.org, robh+dt@kernel.org,
        asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, cang@codeaurora.org,
        rampraka@codeaurora.org, dianders@google.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-msm-owner@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH V2] mmc: mmc_test: Pass different sg lists for
 non-blocking requests
In-Reply-To: <1582105474-27866-1-git-send-email-vbadigan@codeaurora.org>
References: <1581413771-18005-1-git-send-email-vbadigan@codeaurora.org>
 <1582105474-27866-1-git-send-email-vbadigan@codeaurora.org>
Message-ID: <b12ac35f4f896a786ae5a109cf196b12@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-19 15:14, Veerabhadrarao Badiganti wrote:
> Supply a separate sg list for each of the request in non-blocking
> IO test cases where two requests will be issued at same time.
> 
> Otherwise, sg memory may get unmapped when a request is done while
> same memory is being accessed by controller from the other request,
> and it leads to iommu errors with below call stack:
> 
> 	__arm_lpae_unmap+0x2e0/0x478
> 	arm_lpae_unmap+0x54/0x70
> 	arm_smmu_unmap+0x64/0xa4
> 	__iommu_unmap+0xb8/0x1f0
> 	iommu_unmap_fast+0x38/0x48
> 	__iommu_dma_unmap+0x88/0x108
> 	iommu_dma_unmap_sg+0x90/0xa4
> 	sdhci_post_req+0x5c/0x78
> 	mmc_test_start_areq+0x10c/0x120 [mmc_test]
> 	mmc_test_area_io_seq+0x150/0x264 [mmc_test]
> 	mmc_test_rw_multiple+0x174/0x1c0 [mmc_test]
> 	mmc_test_rw_multiple_sg_len+0x44/0x6c [mmc_test]
> 	mmc_test_profile_sglen_wr_nonblock_perf+0x6c/0x94 [mmc_test]
> 	mtf_test_write+0x238/0x3cc [mmc_test]
> 
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> 

Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

This is reproducible on Dragonboard845c as well when performing 
nonblocking tests
and the patch fixes the issue.

/ # emmc_dev=mmc0:0002
  / # echo $emmc_dev > /sys/bus/mmc/drivers/mmcblk/unbind
  / # echo $emmc_dev > /sys/bus/mmc/drivers/mmc_test/bind
  [   23.715673] mmc_test mmc0:0002: Card claimed for testing.
  / # cd /sys/kernel/debug/mmc*/${emmc_dev}
  /sys/kernel/debug/mmc0/mmc0:0002 # echo 42 > test
  [   32.074182] mmc0: Starting tests of card mmc0:0002...
  [   32.079484] mmc0: Test case 42. Write performance non-blocking req 1 
to 512 sg elems...
  [   32.783439] mmc0: ADMA error: 0x02000000
  [   32.787411] mmc0: sdhci: ============ SDHCI REGISTER DUMP 
===========
  [   32.796336] mmc0: sdhci: Sys addr:  0x00000000 | Version:  
0x00006c02
  [   32.804533] mmc0: sdhci: Blk size:  0x00000200 | Blk cnt:  
0x00000280
  [   32.811046] mmc0: sdhci: Argument:  0x001d0400 | Trn mode: 
0x00000023
  [   32.817555] mmc0: sdhci: Present:   0x01f801f6 | Host ctl: 
0x0000001f
  [   32.824062] mmc0: sdhci: Power:     0x00000001 | Blk gap:  
0x00000000
  [   32.830566] mmc0: sdhci: Wake-up:   0x00000000 | Clock:    
0x00000007
  [   32.837074] mmc0: sdhci: Timeout:   0x0000000e | Int stat: 
0x02008000
  [   32.843582] mmc0: sdhci: Int enab:  0x03ff100b | Sig enab: 
0x03ff100b
  [   32.850089] mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 
0x00000000
  [   32.856596] mmc0: sdhci: Caps:      0x362dc8b2 | Caps_1:   
0x0000808f
  [   32.863104] mmc0: sdhci: Cmd:       0x0000193a | Max curr: 
0x00000000
  [   32.869612] mmc0: sdhci: Resp[0]:   0x00000900 | Resp[1]:  
0x5b590000
  [   32.876121] mmc0: sdhci: Resp[2]:   0x1d9b7f80 | Resp[3]:  
0x0a40003a
  [   32.882627] mmc0: sdhci: Host ctl2: 0x00000000
  [   32.887121] mmc0: sdhci: ADMA Err:  0x00000001 | ADMA Ptr: 
0x0000000ffffff248
  [   32.894320] mmc0: sdhci: 
============================================
  [   32.900831] mmc0: sdhci: ffffff200: DMA 0x0000000fffe80000, LEN 
0x0000, Attr=0x21
  [   32.908391] mmc0: sdhci: ffffff20c: DMA 0x0000000fffe90000, LEN 
0x0000, Attr=0x21
  [   32.915951] mmc0: sdhci: ffffff218: DMA 0x0000000fffea0000, LEN 
0x0000, Attr=0x21
  [   32.923511] mmc0: sdhci: ffffff224: DMA 0x0000000fffeb0000, LEN 
0x0000, Attr=0x21
  [   32.931070] mmc0: sdhci: ffffff230: DMA 0x0000000fffec0000, LEN 
0x0000, Attr=0x21
  [   32.938630] mmc0: sdhci: ffffff23c: DMA 0x0000000fffed0000, LEN 
0x0000, Attr=0x21
  [   32.946190] mmc0: sdhci: ffffff248: DMA 0x0000000fffee0000, LEN 
0x0000, Attr=0x21
  [   32.953750] mmc0: sdhci: ffffff254: DMA 0x0000000fffef0000, LEN 
0x0000, Attr=0x21
  [   32.961309] mmc0: sdhci: ffffff260: DMA 0x0000000000000000, LEN 
0x0000, Attr=0x03
  [   32.968982] arm-smmu 15000000.iommu: Unhandled context fault: 
fsr=0x402, iova=0xfffe80480, fsynr=0x390003, cbfrsynra=0xa0, cb=1
<snip>...
  [   33.424884] [mmc_test_rw_multiple] error
  [   33.428849] mmc0: Result: ERROR (-5)
  [   33.432465] mmc0: Tests completed.
  /sys/kernel/debug/mmc0/mmc0:0002 #

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
