Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBB7374C51
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 02:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229465AbhEFA0l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 20:26:41 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50900 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229603AbhEFA0k (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 20:26:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620260743; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=t86AX5J1LPQ0F9dkoMI/7zO/SFpx4ZgWBgEKui4KQrU=; b=rpygo6MCJ4lLq6PLDUqAvLyPB8NS3tBenjZlwhZIof0d4yrfuVdZKsdqhr9x9hR6BDNzlYoZ
 LR4oLlMV33ih0qbtHb2mdEnVE4WvwhzyUGi+4aJgO4kslYex+6nhbo7AYAdsBYwMb1uk218J
 E5xUZsamsib+LhnFUycswfry4FA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6093377879b6f9e57bf7b07d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 00:25:28
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 40F48C43460; Thu,  6 May 2021 00:25:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 27A70C433F1;
        Thu,  6 May 2021 00:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 27A70C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v3 1/6] bus: mhi: core: Set BHI/BHIe offsets on power up
 preparation
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        linux-wireless@vger.kernel.org, kvalo@codeaurora.org,
        ath11k@lists.infradead.org
References: <1620234501-30461-1-git-send-email-bbhatt@codeaurora.org>
 <1620234501-30461-2-git-send-email-bbhatt@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <d4371467-f9ea-a143-a1a0-3ce4bc86c6ed@codeaurora.org>
Date:   Wed, 5 May 2021 17:25:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1620234501-30461-2-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/5/21 10:08 AM, Bhaumik Bhatt wrote:
> Set the BHI and/or BHIe offsets in mhi_prepare_for_power_up(),
> rearrange the function, and remove the equivalent from
> mhi_async_power_up(). This helps consolidate multiple checks
> in different parts of the driver and can help MHI fail early on
> before power up begins if the offsets are not read correctly.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
