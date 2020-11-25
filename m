Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3632C491D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 21:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730016AbgKYUck (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 15:32:40 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:42609 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729937AbgKYUcj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 15:32:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606336359; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=T6tfjbXzjuiVmiiMnsXOIqV/fCW1WFmdP8ZbLczkG+A=; b=uQ5FpKHVyhrb60v/kifuLG0xAzSVyTOdFDGBh6k5R1kLX88uuW74crVb7NjsJ7ZdO6Ghjj2w
 FpM2zahAnzjzyHFw55FcM/7AghiDN0Ljpo1JHaz/heljP7WF4p3+bVNZKsuPGyshjED+q5TL
 1SDM8vblLSSqU0JFTORUmoWc6zM=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fbebf659e87e163528d4a16 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Nov 2020 20:32:37
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 94EA7C433C6; Wed, 25 Nov 2020 20:32:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DC503C433ED;
        Wed, 25 Nov 2020 20:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DC503C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v5] bus: mhi: core: Fix device hierarchy
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        jhugo@codeaurora.org
References: <1606310689-7189-1-git-send-email-loic.poulain@linaro.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <d8bae07b-f7f3-44e8-5d2a-7616f33d7c47@codeaurora.org>
Date:   Wed, 25 Nov 2020 12:32:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1606310689-7189-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/25/20 5:24 AM, Loic Poulain wrote:
> This patch fixes the hierarchical structure of MHI devices. Indeed,
> MHI client devices are directly 'enumerated' from the mhi controller
> and therefore must be direct descendants/children of their mhi
> controller device, in accordance with the Linux Device Model.
> 
> Today both MHI clients and controller devices are at the same level,
> this patch ensures that MHI controller is parent of its client devices.
> 
> The hierarchy is especially important for power management (safe
> suspend/resume order). It is also useful for userspace to determine
> relationship between MHI client devices and controllers.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
