Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC81D1BCAE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 20:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729998AbgD1SxN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 14:53:13 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:11416 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729503AbgD1SxM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 14:53:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588099991; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=FsLzJHNr0VXH8rbASHfDq+8KzuyxXUdIT4i76FNX04c=; b=BylCteEZ9s7P0yR7/LkJWizfppSzc4I4+4ClEeScg43myjJlm+OC8l2nI7/1ULBiw089/zzt
 R6Usa/yz6fhWP0PtbfC/1fOGHQCiTE2RJ/CfFYFCzGFWfTxweJLpyTTUSe6FsztW8jNR+WyS
 1mvfUAVgK5bV56jxMYa2uK2rajA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea87b75.7f167c8cb148-smtp-out-n02;
 Tue, 28 Apr 2020 18:52:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ABADCC44791; Tue, 28 Apr 2020 18:52:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 47788C44791;
        Tue, 28 Apr 2020 18:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 47788C44791
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v3 1/6] bus: mhi: core: Make sure to powerdown if
 mhi_sync_power_up fails
To:     Jeffrey Hugo <jhugo@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1588003153-13139-1-git-send-email-jhugo@codeaurora.org>
 <1588003153-13139-2-git-send-email-jhugo@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <330fe8ab-5ae3-12f1-0298-0c18bfc7ace9@codeaurora.org>
Date:   Tue, 28 Apr 2020 11:52:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1588003153-13139-2-git-send-email-jhugo@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/27/20 8:59 AM, Jeffrey Hugo wrote:
> Powerdown is necessary if mhi_sync_power_up fails due to a timeout, to
> clean up the resources.  Otherwise a BUG could be triggered when
> attempting to clean up MSIs because the IRQ is still active from a
> request_irq().
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
