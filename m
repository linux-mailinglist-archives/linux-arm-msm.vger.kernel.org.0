Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABDD53CA371
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jul 2021 18:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbhGORAj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 13:00:39 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:45289 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229554AbhGORAj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 13:00:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626368266; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=l4DRsUoZGtcADhEklaMtduzhydcdDx0wJqAoQU07Rn8=;
 b=Z1R6mZqROum3/H75W+zVcPEWZZY/ISBfB+xA/ZwHlLMKo/mNaO50Ze1n5dsuheT+VEMUXkdq
 d8ezPyDpcTYXAYIERpPHn+7EXLrs/xIl1UGKuAPrc22DTzjdSNZK8xoYnnZSX3FVVwUPLw0y
 jC+wU//zsX8XNtGnb+OLgab3Huw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60f068f3d0100c7cf9902543 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 15 Jul 2021 16:57:23
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F3AFBC4323A; Thu, 15 Jul 2021 16:57:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 38E22C43217;
        Thu, 15 Jul 2021 16:57:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 15 Jul 2021 09:57:22 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] bus: mhi: possible ABBA deadlock in mhi_pm_m0_transition()
 and mhi_send_cmd()
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <0a213c92-32d5-efc8-079b-dd20d5ecfe20@gmail.com>
References: <0a213c92-32d5-efc8-079b-dd20d5ecfe20@gmail.com>
Message-ID: <2fbeeb8dc647dc88e69ec6624c2078d1@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-15 02:45 AM, Jia-Ju Bai wrote:
> Hello,
> 
> I find there is a possible ABBA deadlock in the MHI driver in Linux 
> 5.10:
> 
> In mhi_pm_m0_transition():
> 262:     read_lock_bh(&mhi_cntrl->pm_lock);
> 281:     spin_lock_irq(&mhi_cmd->lock);
> 
> In mhi_send_cmd():
> 1181:   spin_lock_bh(&mhi_cmd->lock);
> 1207:   read_lock_bh(&mhi_cntrl->pm_lock);
> 
> When mhi_pm_m0_transition() and mhi_send_cmd() are concurrently
> executed, the deadlock can occur.
> 
> I check the code and find a possible case of such concurrent execution:
> 
> #CPU1:
> mhi_poll (mhi_event->process_event(...))
>   mhi_process_ctrl_ev_ring
>     mhi_pm_m0_transition
> 
> #CPU2:
> mhi_prepare_for_transfer
>   mhi_prepare_channel
>     mhi_send_cmd
> 
> Note that mhi_poll() and mhi_prepare_for_transfer() are both exported
> by EXPORT_SYMBOL.
> Thus, I guess these two functions could be concurrently called by a MHI 
> driver.
> 
> I am not quite sure whether this possible deadlock is real and how to
> fix it if it is real.
> Any feedback would be appreciated, thanks :)
> 
> 
> Best wishes,
> Jia-Ju Bai

Few pointers from your example:

1. mhi_poll() is currently not used by any client upstream yet.
2. Polling is not to be used for single event ring (shared control + 
data) cases
since it is meant to be for client drivers with dedicated data packets 
only.
3. mhi_send_cmd() will always be called after an mhi_pm_m0_transition() 
has
completed by design since we wait for the device to be held in M0 prior 
to it.

Would like to know what Mani and Hemant have to say. I don't think we 
can run in
to the scenario from your example so we should be safe.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
