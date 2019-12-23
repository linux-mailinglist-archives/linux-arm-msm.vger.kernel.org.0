Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B17612937D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2019 10:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbfLWJIt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 04:08:49 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:13849 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726027AbfLWJIt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 04:08:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577092128; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=c7mOfwiSyiAwsq0BDVqLJVggtQ+/XeOB+YJPSnlrgvY=; b=mla8ZmhYF+uqbDnxvFkINPrYpD8MFWoksVUwFM9QLCS8e8nMjUF7u+BqZ+5Pw/8qQPeFq/h1
 QJ1a57JnVwch5pLGXlhyzSGK5EB6q+XcxquDxNJe3EsOVWiyxh66QtcHp42g7IUz3bZKGFR9
 Uk6Df12i2gMo4iBS3NTbIG2Hcxc=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e00841f.7f7763386ea0-smtp-out-n02;
 Mon, 23 Dec 2019 09:08:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A8F00C433CB; Mon, 23 Dec 2019 09:08:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.214] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mgautam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A6472C43383;
        Mon, 23 Dec 2019 09:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A6472C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mgautam@codeaurora.org
Subject: Re: [PATCH v2 3/5] phy: qcom-qmp: Add optional SW reset
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, Can Guo <cang@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-kernel@vger.kernel.org
References: <20191220101719.3024693-1-vkoul@kernel.org>
 <20191220101719.3024693-4-vkoul@kernel.org>
From:   Manu Gautam <mgautam@codeaurora.org>
Message-ID: <5dc55690-61cc-de35-2e02-ec812f086bf5@codeaurora.org>
Date:   Mon, 23 Dec 2019 14:38:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191220101719.3024693-4-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 12/20/2019 3:47 PM, Vinod Koul wrote:
> For V4 QMP UFS Phy, we need to assert reset bits, configure the phy and
> then deassert it, so add optional has_sw_reset flag and use that to
> configure the QPHY_SW_RESET register.
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 1196c85aa023..47a66d55107d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -168,6 +168,7 @@ static const unsigned int sdm845_ufsphy_regs_layout[] = {
>  static const unsigned int sm8150_ufsphy_regs_layout[] = {
>  	[QPHY_START_CTRL]		= QPHY_V4_PHY_START,
>  	[QPHY_PCS_READY_STATUS]		= QPHY_V4_PCS_READY_STATUS,
> +	[QPHY_SW_RESET]			= QPHY_V4_SW_RESET,
>  };
>  
>  static const struct qmp_phy_init_tbl msm8996_pcie_serdes_tbl[] = {
> @@ -1023,6 +1024,9 @@ struct qmp_phy_cfg {
>  
>  	/* true, if PCS block has no separate SW_RESET register */
>  	bool no_pcs_sw_reset;
> +
> +	/* true if sw reset needs to be invoked */
> +	bool has_sw_reset;


There is no need to add new flag. Existing code will take care of it for UFS once you
clear no_pcs_sw_reset flag.

>  };
>  
>  /**
> @@ -1391,6 +1395,7 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
>  
>  	.is_dual_lane_phy	= true,
>  	.no_pcs_sw_reset	= true,
> +	.has_sw_reset		= true,
>  };
>  
>  static void qcom_qmp_phy_configure(void __iomem *base,
> @@ -1475,6 +1480,9 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
>  			     SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
>  	}
>  
> +	if (cfg->has_sw_reset)
> +		qphy_setbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
> +

Not needed. POR value of the bit is '1'.


>  	if (cfg->has_phy_com_ctrl)
>  		qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
>  			     SW_PWRDN);
> @@ -1651,6 +1659,9 @@ static int qcom_qmp_phy_enable(struct phy *phy)
>  	if (cfg->has_phy_dp_com_ctrl)
>  		qphy_clrbits(dp_com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
>  
> +	if (cfg->has_sw_reset)
> +		qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
> +

There is no need to add UFS specific change here as existing PHY driver can
handle PCS based PHY sw_reset and already does it for USB and PCIe.


>  	/* start SerDes and Phy-Coding-Sublayer */
>  	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
>  

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
