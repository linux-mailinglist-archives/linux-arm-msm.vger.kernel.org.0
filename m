Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897E22F84FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 20:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728324AbhAOTDS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 14:03:18 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:61105 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbhAOTDS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 14:03:18 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610737377; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=bQX+qrjQlTesxdVEvUU3xEoWA196VqapN+k/7ckimuA=; b=rcKJTRcdKIctG7z3WXS43YzoxKEih8y+KQ8tMrHPBn1K4906p3RFIiqbxSFF4YV9YVeL1sOb
 XT/W/2FGeZhE9gYsVVQ+j64xuhTDrEwfu2miAauy5+cHvBHcXbsb+QQIreiozeqbtZ9jbGD2
 bAgaIqlVsphIxQOB30YMf2qV11E=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 6001e6c63b6dceb132d6a2d8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 15 Jan 2021 19:02:30
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E8EA3C433CA; Fri, 15 Jan 2021 19:02:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2E125C433C6;
        Fri, 15 Jan 2021 19:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2E125C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v2 3/3] bus: mhi: core: Process execution environment
 changes serially
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org
References: <1610651795-31287-1-git-send-email-bbhatt@codeaurora.org>
 <1610651795-31287-4-git-send-email-bbhatt@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <02206c10-f44f-bf6a-91ce-3cff8e7d0ea8@codeaurora.org>
Date:   Fri, 15 Jan 2021 11:02:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1610651795-31287-4-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/14/21 11:16 AM, Bhaumik Bhatt wrote:
> In current design, whenever the BHI interrupt is fired, the execution
> environment is updated. This can cause race conditions and impede any
> ongoing power up/down processing. For example, if a power down is in
> progress and the host has updated the execution environment to a
> local "disabled" state, any BHI interrupt firing later could replace
> it with the value from the BHI EE register.
Can we add what is the real issue observed when mhi_cntrl->ee changed in 
above scenario?
  Another example would be
> that the device can enter mission mode while device creation for SBL
> is still going on, leading to multiple attempts at opening the same
> channel.
Even for this scenario, can we add the real issue that was observed e.g. 
same device was attempting to get created twice and caused xyz issue?
> 
> Ensure that EE changes are handled only from appropriate places and
> occur one after another and handle only PBL or RDDM EE changes as
> critical events directly from the interrupt handler. This also makes
> sure that we use the correct execution environment to notify the
> controller driver when the device resets to one of the PBL execution
> environments.
> 
[..]

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
