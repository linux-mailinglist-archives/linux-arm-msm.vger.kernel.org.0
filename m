Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3CE194E14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 01:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbgC0AdC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 20:33:02 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:23526 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727600AbgC0AdB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 20:33:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585269181; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=HWFSGxDxH1xLw/mnlgsnciPmd1tg7V0DxLsgC5MxQz4=; b=KzgM2j1TBqgJ8kjkDVYAgDlmDOevKmMke2c54+8l3au8ADj3n2Fgio9mpUjD0hGQKadfqw+D
 SvCNL+9ei6dyeERbPV7rk2eJHeCNtCgl08hNNtC0GlLRwgAdEHWtvoSFHyFd47tuRR9d7SAS
 13OMYU7PKvC2KRSsRXF8TP4HWo8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7d49b0.7fb76e165c70-smtp-out-n05;
 Fri, 27 Mar 2020 00:32:48 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1CC62C433D2; Fri, 27 Mar 2020 00:32:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.28.199] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 02DCEC433F2;
        Fri, 27 Mar 2020 00:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 02DCEC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v3 4/4] phy: qcom-qmp: Use proper PWRDOWN offset for
 sm8150 USB
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1585158184-5907-1-git-send-email-wcheng@codeaurora.org>
 <1585158184-5907-5-git-send-email-wcheng@codeaurora.org>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <398efe83-ee2a-0b40-7423-0d0c386d65a9@codeaurora.org>
Date:   Thu, 26 Mar 2020 17:32:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1585158184-5907-5-git-send-email-wcheng@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/25/2020 10:43 AM, Wesley Cheng wrote:
> The register map for SM8150 QMP USB SSPHY has moved
> QPHY_POWER_DOWN_CONTROL to a different offset.  Allow for
> an offset in the register table to override default value
> if it is a DP capable PHY.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index cc04471..71a230a 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -164,6 +164,7 @@ enum qphy_reg_layout {
>  	[QPHY_SW_RESET]			= 0x00,
>  	[QPHY_START_CTRL]		= 0x44,
>  	[QPHY_PCS_STATUS]		= 0x14,
> +	[QPHY_COM_POWER_DOWN_CONTROL]	= 0x40,
>  };
>  
>  static const unsigned int sdm845_ufsphy_regs_layout[] = {
> @@ -1627,6 +1628,9 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
>  	if (cfg->has_phy_com_ctrl)
>  		qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
>  			     SW_PWRDN);
> +	else if (!cfg->has_phy_com_ctrl && cfg->regs[QPHY_COM_POWER_DOWN_CONTROL])
> +		qphy_setbits(pcs, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
> +			     cfg->pwrdn_ctrl);
>  	else
>  		qphy_setbits(pcs, QPHY_POWER_DOWN_CONTROL, cfg->pwrdn_ctrl);
>  
> 

Will add logic to the qcom_qmp_phy_com_exit() API as well to fix the
power down offset if DP com is being used, and will check for
has_phy_dp_com_ctrl instead of !has_phy_com_ctrl, as to ensure this only
applies to PHYs that have DP COM.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
