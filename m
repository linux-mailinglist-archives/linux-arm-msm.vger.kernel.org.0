Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11BAB1BCB54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 20:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729215AbgD1S4R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 14:56:17 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:64802 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729205AbgD1S4Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 14:56:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588100176; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=wBBFoP1nlQZwT1olHqun3h+s+Vta5d2qFcH5weMHSD0=; b=Dqd2nQnSbQSLC8OVmEiD2KU2nDD3ND/BzC0dHDf7jdRiOrW1r1MDqYmpjZA4emC274VwxiOM
 x48YgW607YqjWzIyigUjeF1IoHrdhzZ4fh9ntvB7a7f876897aw9obslVm9j1M6s8wB1odWs
 QsbFXyTUvStuAeInqJUpyeM1LM4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea87c46.7f3530f41e30-smtp-out-n01;
 Tue, 28 Apr 2020 18:56:06 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4DF57C433F2; Tue, 28 Apr 2020 18:56:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4D712C43637;
        Tue, 28 Apr 2020 18:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4D712C43637
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v3 3/6] bus: mhi: core: Offload register accesses to the
 controller
To:     Jeffrey Hugo <jhugo@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1588003153-13139-1-git-send-email-jhugo@codeaurora.org>
 <1588003153-13139-4-git-send-email-jhugo@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <ba5e3217-afa0-95ae-406a-034d88d979b0@codeaurora.org>
Date:   Tue, 28 Apr 2020 11:56:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1588003153-13139-4-git-send-email-jhugo@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/27/20 8:59 AM, Jeffrey Hugo wrote:
> When reading or writing MHI registers, the core assumes that the physical
> link is a memory mapped PCI link.  This assumption may not hold for all
> MHI devices.  The controller knows what is the physical link (ie PCI, I2C,
> SPI, etc), and therefore knows the proper methods to access that link.
> The controller can also handle link specific error scenarios, such as
> reading -1 when the PCI link went down.
> 
> Therefore, it is appropriate that the MHI core requests the controller to
> make register accesses on behalf of the core, which abstracts the core
> from link specifics, and end up removing an unnecessary assumption.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
