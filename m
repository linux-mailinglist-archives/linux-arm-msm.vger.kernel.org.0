Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6025025B551
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 22:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgIBUbh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 16:31:37 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:32170 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726247AbgIBUbh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 16:31:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599078696; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=M3HCSgrFIcERdT6PLNPpnWvnlnIy20ha7vSbY2UY8kw=; b=AREmYMKyBC74c1YQEDrkJNTdaJSI6Elnq5Cg5wpivC0cb4U3X0mQ/pSW9EBKqyVe6Zqi48Fm
 s1bu6mj93Al7YUczMVEHplhcE4X7UoyipCW8MKc3Jb8YrVZHJv+gtJ1N6LL0J9onLhc4eEky
 f4k+BLsxrs9Hd1hTuhVw/GRpLts=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f500127252c522440fe6323 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Sep 2020 20:31:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 92B25C433CA; Wed,  2 Sep 2020 20:31:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CAA0FC433C9;
        Wed,  2 Sep 2020 20:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CAA0FC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v5 0/4] user space client interface driver
To:     gregkh@linuxfoundation.org, manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
References: <1596696063-17802-1-git-send-email-hemantk@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <81cdf27e-b962-3b0b-3f78-dfd95e2cf9bc@codeaurora.org>
Date:   Wed, 2 Sep 2020 13:31:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1596696063-17802-1-git-send-email-hemantk@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeff and Mani,
On 8/5/20 11:40 PM, Hemant Kumar wrote:
> V5:
> - Removed mhi_uci_drv structure.
> - Used idr instead of creating global list of uci devices.
> - Used kref instead of local ref counting for uci device and
>    open count.
> - Removed unlikely macro.
> 
> V4:
> - Fix locking to protect proper struct members.
> - Updated documentation describing uci client driver use cases.
> - Fixed uci ref counting in mhi_uci_open for error case.
> - Addressed style related review comments.
> 
> V3: Added documentation for MHI UCI driver.
> 
> V2: Added mutex lock to prevent multiple readers to access same
> mhi buffer which can result into use after free.
> 
> Hemant Kumar (4):
>    bus: mhi: core: Add helper API to return number of free TREs
>    bus: mhi: core: Move MHI_MAX_MTU to external header file
>    docs: Add documentation for userspace client interface
>    bus: mhi: clients: Add userspace client interface driver
> 
>   Documentation/mhi/index.rst      |   1 +
>   Documentation/mhi/uci.rst        |  39 +++
>   drivers/bus/mhi/Kconfig          |   6 +
>   drivers/bus/mhi/Makefile         |   1 +
>   drivers/bus/mhi/clients/Kconfig  |  15 +
>   drivers/bus/mhi/clients/Makefile |   3 +
>   drivers/bus/mhi/clients/uci.c    | 662 +++++++++++++++++++++++++++++++++++++++
>   drivers/bus/mhi/core/internal.h  |   1 -
>   drivers/bus/mhi/core/main.c      |  12 +
>   include/linux/mhi.h              |  12 +
>   10 files changed, 751 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/mhi/uci.rst
>   create mode 100644 drivers/bus/mhi/clients/Kconfig
>   create mode 100644 drivers/bus/mhi/clients/Makefile
>   create mode 100644 drivers/bus/mhi/clients/uci.c
> 

Could you please review my changes on V5? I tried addressing Greg's 
comment and would need help getting it reviewed from other contributors 
to MHI driver as well.

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
