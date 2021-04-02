Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4CB7352F1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 20:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236001AbhDBSUw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 14:20:52 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:52016 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235247AbhDBSUv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 14:20:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617387650; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=KPgdLFSU5VWdJv96LkCBgqsMXn7vhM4Rp0QVozNLRHs=; b=MM7I38mDIJ95tUcjUyRjPjz4VTxiL0EQY3DTj5lgreE/VGrWzgO8hUfZ00gQjxyUpC6iN+su
 9dl+Y4ALQkF6rM3W124I0bw7L6ivrIhhRhKEDtsdHSlXEpNHD8YwKSpCiRRtaN314ahbeLm7
 oEFXFAo32ZNQdEu2VDSySE6Udtw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6067606d8166b7eff76f5b2f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 02 Apr 2021 18:20:29
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EA226C433ED; Fri,  2 Apr 2021 18:20:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C6F64C433C6;
        Fri,  2 Apr 2021 18:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C6F64C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [RESEND PATCH] bus: mhi: core: Remove pre_init flag used for
 power purposes
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, carl.yin@quectel.com,
        loic.poulain@linaro.org, kvalo@codeaurora.org
References: <1617313309-24035-1-git-send-email-bbhatt@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <efba8dbd-6c67-7e6f-9a39-27f594705faa@codeaurora.org>
Date:   Fri, 2 Apr 2021 11:20:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1617313309-24035-1-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/1/21 2:41 PM, Bhaumik Bhatt wrote:
> Some controllers can choose to skip preparation for power up.
> In that case, device context is initialized based on the pre_init
> flag not being set during mhi_prepare_for_power_up(). There is no
> reason MHI host driver should maintain and provide controllers
> with two separate paths for preparing MHI.
> 
> Going forward, all controllers will be required to call the
> mhi_prepare_for_power_up() API followed by their choice of sync
> or async power up. This allows MHI host driver to get rid of the
> pre_init flag and sets up a common way for all controllers to use
> MHI. This also helps controllers fail early on during preparation
> phase in some failure cases.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
> This patch was tested on arm64 architecture.

Change looks good as current MHI controllers ath11k and pci generic are 
not using pre_init.

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
