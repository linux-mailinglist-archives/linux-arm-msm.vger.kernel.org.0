Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69622415DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 06:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgHKEs3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 00:48:29 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:60940 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725942AbgHKEs2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 00:48:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597121308; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0cJt+WgRXB1nbIu2m8++kElnkIQWCS3PK5eceIKAvUk=; b=Qzl5bTDqN2qNflTHO9RLbXyMpFQYo5jiQCSYtRZVfe/Kzhk3I5dRwfp9ailoaqKFuYgKHyn5
 nHqcsROxwY0Ipc5c5klqFXz3iAcL0ChLMXx6BbVgPI4Nmv4lT7jRDViu3laX7JFMt7QV8RMx
 2jVTNWVqB1UFJexMPamIrqDzJv4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f32231491f8def8b2098407 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 Aug 2020 04:48:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AC99BC433CA; Tue, 11 Aug 2020 04:48:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.4] (unknown [122.170.228.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: gkohli)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2B6E8C433C9;
        Tue, 11 Aug 2020 04:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2B6E8C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=gkohli@codeaurora.org
Subject: Re: [PATCH] arm64: Skip apply SSBS call for non SSBS system
To:     will@kernel.org, linux-arm-kernel@lists.infradead.org,
        maz@kernel.org, Catalin Marinas <catalin.marinas@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        neeraju@codeaurora.org
References: <1596550484-11029-1-git-send-email-gkohli@codeaurora.org>
From:   Gaurav Kohli <gkohli@codeaurora.org>
Message-ID: <16e9b436-5919-39df-3f1a-a717d4229651@codeaurora.org>
Date:   Tue, 11 Aug 2020 10:18:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1596550484-11029-1-git-send-email-gkohli@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Please let us know, is below patch good to have
or not for non ssbs systems.

On 8/4/2020 7:44 PM, Gaurav Kohli wrote:
> In a system where no cpu's implement SSBS, for
> them no need to set pstate. This might help to save
> few cpu cycles during context switch.
> 
> Signed-off-by: Gaurav Kohli <gkohli@codeaurora.org>
> 
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 6089638..79f80f1 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -477,6 +477,13 @@ static void ssbs_thread_switch(struct task_struct *next)
>   	struct pt_regs *regs = task_pt_regs(next);
>   
>   	/*
> +	 * For Targets which don't have SSBS support, they
> +	 * can return from here.
> +	 */
> +	if (!IS_ENABLED(CONFIG_ARM64_SSBD))
> +		return;
> +
> +	/*
>   	 * Nothing to do for kernel threads, but 'regs' may be junk
>   	 * (e.g. idle task) so check the flags and bail early.
>   	 */
> 

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center,
Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
