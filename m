Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 157083DCDF3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Aug 2021 23:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhHAV4y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Aug 2021 17:56:54 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:18234 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229759AbhHAV4x (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Aug 2021 17:56:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627855005; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=JTVLibLIhzVL+OF0vkQCDZy/aFeSDgvciX407BJ967w=; b=H11RwiDbEaP0qA2B2c/fOmonMerZMZZfyyGILkS82CD7szDwrbMGJ73RS6vgAw309KWwXYQa
 9fVVBExvlD5utIVjv4XTMOqgrLs8e3F7mQMAfhDCg1LaRRMdzApX2ED8rBxuC2myqLeDLqSF
 HGzk4bAKNRaB3uXAhyWaZILdioI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6107188617c2b4047d79c804 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 01 Aug 2021 21:56:22
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2461EC43217; Sun,  1 Aug 2021 21:56:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.110.43.59] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 00A7AC433D3;
        Sun,  1 Aug 2021 21:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 00A7AC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: MHI driver issue with Sierra Wireless AirPrime EM919X
To:     Thomas Perrot <thomas.perrot@bootlin.com>,
        linux-arm-msm@vger.kernel.org
Cc:     manivannan.sadhasivam@linaro.org, bbhatt@codeaurora.org
References: <1e288e5bee3f2a18e0ddb8b7a50158ecb793822d.camel@bootlin.com>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <ddc50c84-13c6-7921-a4b0-cec22fd329b6@codeaurora.org>
Date:   Sun, 1 Aug 2021 14:56:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1e288e5bee3f2a18e0ddb8b7a50158ecb793822d.camel@bootlin.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thomas,

On 7/30/2021 10:52 AM, Thomas Perrot wrote:
> Hello,
> 
> I’m trying to use the MHI driver with a Sierra Wireless AirPrime EM919X
> connected to an NXP i.MX6DL through a PCIe gen2 bus, on 5.13.6, but the
> device initialisation fails, as follows:
> 
> [    3.029401] mhi-pci-generic 0000:01:00.0: BAR 0: assigned [mem
> 0x01100000-0x01100fff 64bit]
> [    3.041095] mhi-pci-generic 0000:01:00.0: enabling device (0140 ->
> 0142)
> [    3.118299] mhi mhi0: Requested to power ON
> [   11.370361] mhi mhi0: Power on setup success
> [   11.372503] mhi mhi0: Wait for device to enter SBL or Mission mode
> [   15.664068] mhi-pci-generic 0000:01:00.0: failed to suspend device:
> -16
> [   22.619948] mhi-pci-generic 0000:01:00.0: refused to change power
> state from D3hot to D0
> [   57.289998] mhi-pci-generic 0000:01:00.0: can't change power state
> from D3hot to D0 (config space inaccessible)
> [   73.769675] mhi-pci-generic 0000:01:00.0: can't change power state
> from D3cold to D0 (config space inaccessible)
> [   73.780188] mhi-pci-generic 0000:01:00.0: can't change power state
> from D3hot to D0 (config space inaccessible)
> [   73.836150] PC is at mhi_pci_read_reg+0xc/0x14
> [   73.840642] LR is at mhi_get_mhi_state+0x2c/0x5c
> [   74.121120] [<c05dcaf4>] (mhi_pci_read_reg) from [<c05d754c>]
> (mhi_get_mhi_state+0x2c/0x5c)
> [   74.129529] [<c05d754c>] (mhi_get_mhi_state) from [<c05da440>]
> (mhi_pm_resume+0x38/0x298)
> [   74.137754] [<c05da440>] (mhi_pm_resume) from [<c05dcbd0>]
> (mhi_pci_runtime_resume+0x70/0xe0)
> [   74.146326] [<c05dcbd0>] (mhi_pci_runtime_resume) from [<c0604da0>]
> (pci_pm_runtime_resume+0x84/0xa0)
> 
> Do you have any idea where the issue might come from?
> 
> MHI seems to enter in READY state and waiting to enter in SBL or
> Mission mode when the issue occurs, the host can start MHI
> initialization by programming MMIO registers and sets the device into
> MHI_M0 state.
If the issue is MHI host not getting SBL EE change event on primary 
event ring then, is it possible that there is some issue with FW image 
being flashed ? It is possible for you to enable dev_dbg logs to show up 
in dmesg for MHI core when you reproduce this issue? You can share the 
entire dmesg log with that. Are you observing this issue after moving to 
5.13.6? Do you know if the same FW worked on this device on any other 
kernel ver before?
> 
> Best regards,
> Thomas
> 

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
