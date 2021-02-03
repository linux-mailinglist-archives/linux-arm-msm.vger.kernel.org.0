Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6AE930E0AC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 18:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbhBCROg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 12:14:36 -0500
Received: from so15.mailgun.net ([198.61.254.15]:42952 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231458AbhBCROe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 12:14:34 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612372456; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=PDGS0kSwjfrKGH/MU1nmUxOqH+GF8S+OVnxMte90Y/I=; b=PqE5Bivot6gbDnO7zSIfKuW5YaDhpRtFSrncBrw4iMFJkCRLqtUSMPlMBOo1KBgZ7qdv6XdR
 /XxkAX4s8YuwKvGostlU36BJALdbzuOvAJNhTFSVjCPvpYf2qmtJfEQFaH2Vuo7QnMw64J7D
 0csVN1EtF2I27V12atozA3M+zm0=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 601ad9cd5a2f264828112c27 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Feb 2021 17:13:49
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 35FADC43461; Wed,  3 Feb 2021 17:13:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 819E6C43461;
        Wed,  3 Feb 2021 17:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 819E6C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v2] mhi: pci_generic: Print warning in case of firmware
 crash
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org
References: <1612370382-21643-1-git-send-email-loic.poulain@linaro.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <d953136f-ba87-61e6-64a0-43fac4d789a5@codeaurora.org>
Date:   Wed, 3 Feb 2021 09:13:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612370382-21643-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/3/21 8:39 AM, Loic Poulain wrote:
> Print warning when MHI detects sys error.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>   v2: remove useless fallthough & unused mhi_pdev variable
> 
>   drivers/bus/mhi/pci_generic.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
