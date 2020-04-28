Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB531BCB14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 20:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729477AbgD1SyJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 14:54:09 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:11416 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730049AbgD1SyH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 14:54:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588100047; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0e4Q4kCLbMcxnWJZ9yvWd0DliCAIiPdcXMbvbzquWlY=; b=RMPLFyiCBEj+OmDZ57BpWJqXF0OJnlUCd4YufBf3oZ/L0RptF5cuYEQzZUqhSlVXkz084Dd8
 1tUCE0oecmE0nBg7XeH+kjMUaLWvdjkfiiq9oTnIkSHlUbQQD2ikXy5XWteqmzmazKj/pwTR
 Ok7qQFrl5w42Unqk0P5RMv9d9fs=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea87bce.7fef5834e458-smtp-out-n04;
 Tue, 28 Apr 2020 18:54:06 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 21E0DC43637; Tue, 28 Apr 2020 18:54:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C94AC433D2;
        Tue, 28 Apr 2020 18:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4C94AC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v3 2/6] bus: mhi: core: Remove link_status() callback
To:     Jeffrey Hugo <jhugo@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1588003153-13139-1-git-send-email-jhugo@codeaurora.org>
 <1588003153-13139-3-git-send-email-jhugo@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <b81dd0ff-9c85-ae7e-55db-0055c57df801@codeaurora.org>
Date:   Tue, 28 Apr 2020 11:54:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1588003153-13139-3-git-send-email-jhugo@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/27/20 8:59 AM, Jeffrey Hugo wrote:
> If the MHI core detects invalid data due to a PCI read, it calls into
> the controller via link_status() to double check that the link is infact
> down.  All in all, this is pretty pointless, and racy.  There are no good
> reasons for this, and only drawbacks.
> 
> Its pointless because chances are, the controller is going to do the same
> thing to determine if the link is down - attempt a PCI access and compare
> the result.  This does not make the link status decision any smarter.
> 
> Its racy because its possible that the link was down at the time of the
> MHI core access, but then recovered before the controller access.  In this
> case, the controller will indicate the link is not down, and the MHI core
> will precede to use a bad value as the MHI core does not attempt to retry
> the access.
> 
> Retrying the access in the MHI core is a bad idea because again, it is
> racy - what if the link is down again?  Furthermore, there may be some
> higher level state associated with the link status, that is now invalid
> because the link went down.
> 
> The only reason why the MHI core could see "invalid" data when doing a PCI
> access, that is actually valid, is if the register actually contained the
> PCI spec defined sentinel for an invalid access.  In this case, it is
> arguable that the MHI implementation broken, and should be fixed, not
> worked around.
> 
> Therefore, remove the link_status() callback before anyone attempts to
> implement it.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
