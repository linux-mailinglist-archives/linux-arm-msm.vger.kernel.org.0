Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACA41A5F71
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2020 19:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbgDLRGo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Apr 2020 13:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:58358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbgDLRGo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Apr 2020 13:06:44 -0400
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info [104.130.122.27])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id BBB26C0A3BF0
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2020 10:06:41 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586711203; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=zIDzD0EzbXqwgB4oG5u62ICxJEfPXcrgnzopJvH6e60=; b=E0CQ/l7/tHQ10zsn7AerzanWfhApHz5POiB7u6PP6ostvwFy5IMsn7uqz6yfgOQyozJZyypw
 LjKHFkeQUZP9zC9fi9U1Ra6Ce/f7zkrrdG9RoU3bCBVUdzGxqVTQ3De10NRc3FTvJYIISyEE
 v5DlS00I6gezOo0x0DzaWNFBnKw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e934a93.7f2208b99fb8-smtp-out-n05;
 Sun, 12 Apr 2020 17:06:27 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E48E7C43636; Sun, 12 Apr 2020 17:06:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.105] (unknown [183.83.68.142])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C91F4C433F2;
        Sun, 12 Apr 2020 17:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C91F4C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH V1 4/4] mmc: sdhci-msm: Enable ADMA length mismatch error
 interrupt
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     bjorn.andersson@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>
References: <1586706808-27337-1-git-send-email-vbadigan@codeaurora.org>
 <1586706808-27337-5-git-send-email-vbadigan@codeaurora.org>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <520046b7-44ee-521e-ff6d-8ee72c55cd44@codeaurora.org>
Date:   Sun, 12 Apr 2020 22:36:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1586706808-27337-5-git-send-email-vbadigan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 4/12/2020 9:23 PM, Veerabhadrarao Badiganti wrote:
> ADMA_ERR_SIZE_EN bit of VENDOR_SPECIFIC_FUNC register controls
> ADMA length mismatch error interrupt. Enable it by default.
>
> And update all bit shift defines with BIT macro.
>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
>   drivers/mmc/host/sdhci-msm.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 482045b..660e1bc 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -56,19 +56,19 @@
>   #define CORE_FLL_CYCLE_CNT	BIT(18)
>   #define CORE_DLL_CLOCK_DISABLE	BIT(21)
>   
> -#define CORE_VENDOR_SPEC_POR_VAL 0xa1c
> +#define CORE_VENDOR_SPEC_POR_VAL 0xa3c
Sorry . This should be 0xa9c, not 0xa3c. Correcting it.
>   #define CORE_CLK_PWRSAVE	BIT(1)
>   #define CORE_HC_MCLK_SEL_DFLT	(2 << 8)
>   #define CORE_HC_MCLK_SEL_HS400	(3 << 8)
>   #define CORE_HC_MCLK_SEL_MASK	(3 << 8)
> -#define CORE_IO_PAD_PWR_SWITCH_EN	(1 << 15)
> -#define CORE_IO_PAD_PWR_SWITCH  (1 << 16)
> +#define CORE_IO_PAD_PWR_SWITCH_EN	BIT(15)
> +#define CORE_IO_PAD_PWR_SWITCH	BIT(16)
>   #define CORE_HC_SELECT_IN_EN	BIT(18)
>   #define CORE_HC_SELECT_IN_HS400	(6 << 19)
>   #define CORE_HC_SELECT_IN_MASK	(7 << 19)
>   
> -#define CORE_3_0V_SUPPORT	(1 << 25)
> -#define CORE_1_8V_SUPPORT	(1 << 26)
> +#define CORE_3_0V_SUPPORT	BIT(25)
> +#define CORE_1_8V_SUPPORT	BIT(26)
>   #define CORE_VOLT_SUPPORT	(CORE_3_0V_SUPPORT | CORE_1_8V_SUPPORT)
>   
>   #define CORE_CSR_CDC_CTLR_CFG0		0x130
