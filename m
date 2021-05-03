Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDBF83723B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 01:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbhECXqJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 19:46:09 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:59396 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229594AbhECXqJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 19:46:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620085515; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=lU7hJpSw4xNqkbBNU53B86vvvEoKe/qzoLF4p+Az8e0=; b=TT1yXQjhGj026CBvPf0NuSyjdhSWYlBjdpoztCLbJOz7GIuqYYs+V4fGuH7oCOPrwZtY8IBG
 22YkRYRTsgPh3KnTEUp2ZVevxP3D1mL0KgaZc5BxGEBkFFsX1XBn1wr1mtWdlWUYGu02WwqK
 nxP0AT9L9+q7Tdnnh4hLak4E+PM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60908af89a9ff96d95c7f053 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 03 May 2021 23:44:56
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8F7F2C433D3; Mon,  3 May 2021 23:44:56 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ADEB0C433D3;
        Mon,  3 May 2021 23:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ADEB0C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v2] bus: mhi: core: Fix power down latency
To:     Loic Poulain <loic.poulain@linaro.org>, mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org
References: <1620029090-8975-1-git-send-email-loic.poulain@linaro.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <2b901961-b33d-1c63-8fde-c92e102aa48d@codeaurora.org>
Date:   Mon, 3 May 2021 16:44:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1620029090-8975-1-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/3/21 1:04 AM, Loic Poulain wrote:
> On graceful power-down/disable transition, when an MHI reset is
> performed, the MHI device loses its context, including interrupt
> configuration. However, the current implementation is waiting for
> event(irq) driven state change to confirm reset has been completed,
> which never happens, and causes reset timeout, leading to unexpected
> high latency of the mhi_power_down procedure (up to 45 seconds).
> 
> Fix that by moving to the recently introduced poll_reg_field method,
> waiting for the reset bit to be cleared, in the same way as the
> power_on procedure.
> 
> Fixes: a6e2e3522f29 ("bus: mhi: core: Add support for PM state transitions")
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
