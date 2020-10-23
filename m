Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA5212975B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 19:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751828AbgJWRW0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 13:22:26 -0400
Received: from z5.mailgun.us ([104.130.96.5]:54850 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753311AbgJWRWZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 13:22:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603473745; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=DWn/rqx3OrIlRsjoSgcpz7Qb10m3vaDCTP9An8Owmzc=; b=jOlm/0eFmeCRZ4xEdq6vXFXseRnuF6oK+UmA2WSX2UXdJmIrWUvPwvTr0pqCwhsA+YAuXqR/
 nPtO4uCKq5oQyGY0US+tSk8/dw3lYpWtyJm1h4r2rEu1NSViQq4gizurgITdHrEPF/E/9/+R
 riyDtMC0fdGiB8QKEw8ZVYxxpxw=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f93114d86718f090a8dfda0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Oct 2020 17:22:21
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 96CF2C433C9; Fri, 23 Oct 2020 17:22:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AA13DC433C9;
        Fri, 23 Oct 2020 17:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AA13DC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v8 0/4] userspace MHI client interface driver
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     manivannan.sadhasivam@linaro.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org
References: <1603354958-24025-1-git-send-email-hemantk@codeaurora.org>
 <20201023093734.7b06694e@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <58b8c981-491e-3d02-3adc-7224c5692d61@codeaurora.org>
Date:   Fri, 23 Oct 2020 10:22:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201023093734.7b06694e@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jakub,

On 10/23/20 9:37 AM, Jakub Kicinski wrote:
> On Thu, 22 Oct 2020 01:22:34 -0700 Hemant Kumar wrote:
>> This patch series adds support for UCI driver. UCI driver enables userspace
>> clients to communicate to external MHI devices like modem and WLAN. UCI driver
>> probe creates standard character device file nodes for userspace clients to
>> perform open, read, write, poll and release file operations. These file
>> operations call MHI core layer APIs to perform data transfer using MHI bus
>> to communicate with MHI device. Patch is tested using arm64 based platform.
> 
> Until you CC netdev on this (as suggested [1]), here's my:
> 
> Nacked-by: Jakub Kicinski <kuba@kernel.org>
> 
> [1]
> https://lore.kernel.org/netdev/20201016183759.7fa7c0ef@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com/
> 

UCI driver patch series includes following patches

1)   bus: mhi: core: Add helper API to return number of free TREs
2)   bus: mhi: core: Move MHI_MAX_MTU to external header file
3)   docs: Add documentation for userspace client interface
4)   bus: mhi: Add userspace client interface driver

mhi net driver can use  #1 and #2 and these two are part of MHI core 
driver change. These are helper API/macro which can be used by any mhi 
clients like UCI or mhi net dev.

#3 and #4 are MHI UCI character driver completely unrelated to netdev.

How about splitting the patch series between #1,#2 and #3, #4 and add 
netdev to #1, #2?

#1,#2 were already reviewed by two folks in community so it would be 
much easier for netdev folks to refer that in context of mhi net device 
driver.

Please let me know what do you think about this idea.

Thanks,
Hemant

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
