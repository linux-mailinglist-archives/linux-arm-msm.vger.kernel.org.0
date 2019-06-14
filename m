Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0262F4593A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 11:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbfFNJuM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 05:50:12 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35496 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbfFNJuM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 05:50:12 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B994960795; Fri, 14 Jun 2019 09:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560505811;
        bh=MyOIZxRkGgLbqjLqfPrshqHSuC7b4kOHm7rZYQQkQKY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=m/leHmXoxScKBERlX6fPGhe2ZFYsH3hQ9qj0K/po0300bKDBye7axc6BzTkakWdSk
         ZLj6eD0SY4Xohy6ebZ1VFJKJZs48Y7uQ1/TLgXOyQccyoOq7FzjBaEn6U6bDYmQK3t
         Ko9RY92ncSk8R8v/n1s08fWMqkzmDnRWqNvWgy0g=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.128.120] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F09EA60265;
        Fri, 14 Jun 2019 09:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560505811;
        bh=MyOIZxRkGgLbqjLqfPrshqHSuC7b4kOHm7rZYQQkQKY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=m/leHmXoxScKBERlX6fPGhe2ZFYsH3hQ9qj0K/po0300bKDBye7axc6BzTkakWdSk
         ZLj6eD0SY4Xohy6ebZ1VFJKJZs48Y7uQ1/TLgXOyQccyoOq7FzjBaEn6U6bDYmQK3t
         Ko9RY92ncSk8R8v/n1s08fWMqkzmDnRWqNvWgy0g=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F09EA60265
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Subject: Re: [PATCH v1] phy: qcom-qmp: Raise qcom_qmp_phy_enable() polling
 delay
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Kishon Vijay Abraham <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <92d97c68-d226-6290-37d6-f46f42ea604b@free.fr>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Message-ID: <a3a50cf5-083a-5aa8-e77c-6feb2f2fd866@codeaurora.org>
Date:   Fri, 14 Jun 2019 15:20:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <92d97c68-d226-6290-37d6-f46f42ea604b@free.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marc,

On 6/13/2019 5:02 PM, Marc Gonzalez wrote:
> readl_poll_timeout() calls usleep_range() to sleep between reads.
> usleep_range() doesn't work efficiently for tiny values.
>
> Raise the polling delay in qcom_qmp_phy_enable() to bring it in line
> with the delay in qcom_qmp_phy_com_init().
>
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---
> Vivek, do you remember why you didn't use the same delay value in
> qcom_qmp_phy_enable) and qcom_qmp_phy_com_init() ?

phy_qcom_init() thingy came from the PCIE phy driver from downstream 
msm-3.18
PCIE did something as below:

-----
do {
         if (pcie_phy_is_ready(dev))
                 break;
         retries++;
         usleep_range(REFCLK_STABILIZATION_DELAY_US_MIN,
                                  REFCLK_STABILIZATION_DELAY_US_MAX);
} while (retries < PHY_READY_TIMEOUT_COUNT);

REFCLK_STABILIZATION_DELAY_US_MIN/MAX ==> 1000/1005
PHY_READY_TIMEOUT_COUNT ==> 10
-----


phy_enable() from the usb phy driver from downstream.
  /* Wait for PHY initialization to be done */
  do {
          if (readl_relaxed(phy->base +
                  phy->phy_reg[USB3_PHY_PCS_STATUS]) & PHYSTATUS)
                  usleep_range(1, 2);
else
break;
  } while (--init_timeout_usec);

init_timeout_usec ==> 1000
-----
USB never had a COM_PHY status bit.

So clearly the resolutions were different.

Does this change solves an issue at hand?

> ---
>   drivers/phy/qualcomm/phy-qcom-qmp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index bb522b915fa9..34ff6434da8f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -1548,7 +1548,7 @@ static int qcom_qmp_phy_enable(struct phy *phy)
>   	status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
>   	mask = cfg->mask_pcs_ready;
>   
> -	ret = readl_poll_timeout(status, val, val & mask, 1,
> +	ret = readl_poll_timeout(status, val, val & mask, 10,
>   				 PHY_INIT_COMPLETE_TIMEOUT);
>   	if (ret) {
>   		dev_err(qmp->dev, "phy initialization timed-out\n");

