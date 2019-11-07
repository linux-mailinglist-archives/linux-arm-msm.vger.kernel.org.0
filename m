Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E572F336B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 16:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbfKGPgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 10:36:02 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:50086 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727020AbfKGPgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 10:36:01 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E96DC61017; Thu,  7 Nov 2019 15:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573140961;
        bh=uS6h0oAJoENnCNWRepIvCzatEd8f1mu+GozvC7RMuXI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=m1iNdsLoG7VsIOGSCGRDH+S4A4CuwCiVkZ2Ej9DA1WdJ1t9GpRXyUyZQU3Ctsp5WB
         PD93Y1EMokUUIhJtPPcuO9yNAKsaN+W/zWK2WAt/lXW3Jw6yCaLAbf0TdPWQc4zpnR
         Lve+eT7OJOvuwB5dn8Qalg0HXt+tIAAxOBt5IXZs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.7] (unknown [106.212.237.132])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mgautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E4BFD60FCF;
        Thu,  7 Nov 2019 15:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573140958;
        bh=uS6h0oAJoENnCNWRepIvCzatEd8f1mu+GozvC7RMuXI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=l+hCbMXpRA7DOPzE/JI9r6b13aT+X4dcgAdEY7M+bs1GIAh9I9jq4eX4clwNAGl2Q
         JtEZ95dSw2X2DuL4ks2ZLBjKBTOi7AM9ljlVKBtlLr7j+BlJhbCdNH2MwRgPKZfWPT
         CEypsr38yP8L0P35vP3rlBbUYi5jpk2p47XFVpi4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E4BFD60FCF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=mgautam@codeaurora.org
Subject: Re: [PATCH 1/2] phy: qcom-qmp: Add QMP V3 USB3 PHY support for SC7180
To:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <1572418544-11593-1-git-send-email-sanm@codeaurora.org>
 <1572418544-11593-2-git-send-email-sanm@codeaurora.org>
From:   Manu Gautam <mgautam@codeaurora.org>
Message-ID: <21fb2f4b-1b24-70f8-a77c-4530cebb76b1@codeaurora.org>
Date:   Thu, 7 Nov 2019 21:05:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572418544-11593-2-git-send-email-sanm@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/30/2019 12:25 PM, Sandeep Maheswaram wrote:
> Adding QMP v3 USB3 phy support for SC7180.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 091e203..52275c5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (c) 2017, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
>   */
>  
>  #include <linux/clk.h>
> @@ -2118,6 +2118,9 @@ static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
>  	}, {
>  		.compatible = "qcom,sm8150-qmp-ufs-phy",
>  		.data = &sm8150_ufsphy_cfg,
> +	}, {
> +		.compatible = "qcom,sc7180-qmp-usb3-phy",
> +		.data = &qmp_v3_usb3phy_cfg,

SC7180 has single QMP PHY with each lane dedicated for USB and DP.
USB driver should perform only PHY reset, not the global reset.


>  	},
>  	{ },
>  };

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

