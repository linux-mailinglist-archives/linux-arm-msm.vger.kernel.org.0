Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D93093269CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 23:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhBZWHr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 17:07:47 -0500
Received: from z11.mailgun.us ([104.130.96.11]:53766 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229946AbhBZWHq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 17:07:46 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614377243; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=bSGUK32O8UCe/VfHem0U/voNTp1WJZFoh+x84Rxcu/U=; b=MfwytL7kJA1/CdSBpTQjghu0KdFCNPjirPsIiGLVc2JpAUUIMR/2cO/ze6JBpcZu3FzRRzsb
 eokjMrxJpMs3EHHygquPJMMu2L++QUJKQhIC2P8jMd+AiKHv89s+h2oFDI7ify6b4zMoCgWF
 EC607NkuruXpLcryXJ0EPcQogBI=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 603970ed8f0d5ba6c58b9dba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Feb 2021 22:06:37
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 95A7AC433C6; Fri, 26 Feb 2021 22:06:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F555C433C6;
        Fri, 26 Feb 2021 22:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7F555C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v6 1/4] bus: mhi: core: Destroy SBL devices when moving to
 mission mode
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com
References: <1614208985-20851-1-git-send-email-bbhatt@codeaurora.org>
 <1614208985-20851-2-git-send-email-bbhatt@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <6790d212-5980-39bd-ac4c-1176225604fd@codeaurora.org>
Date:   Fri, 26 Feb 2021 14:06:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1614208985-20851-2-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/24/21 3:23 PM, Bhaumik Bhatt wrote:
> Currently, client devices are created in SBL or AMSS (mission
> mode) and only destroyed after power down or SYS ERROR. When
> moving between certain execution environments, such as from SBL
> to AMSS, no clean-up is required. This presents an issue where
> SBL-specific channels are left open and client drivers now run in
> an execution environment where they cannot operate. Fix this by
> expanding the mhi_destroy_device() to do an execution environment
> specific clean-up if one is requested. Close the gap and destroy
> devices in such scenarios that allow SBL client drivers to clean
> up once device enters mission mode.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
It make sense to clean up previous execution env related resources.

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
