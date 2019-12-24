Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2E4129D1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2019 04:40:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbfLXDkL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 22:40:11 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:46556 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726832AbfLXDkL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 22:40:11 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577158811; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=v6Ff3fA1ZPCK3+R3GMObXgK55iZJ2yur9ICPiGrNwFU=; b=jraJgzzJX4yxv/OryQeKFIt/uOHgHPZgb3+mcQLQ9ftjfLN3u6dI2syTyvnwDmuuLmHZS5Pj
 43HDdxF6DYTxbkO8PlO7Cf7vjAZwDGm15FoklkvxKHscYWIFsgGMdMAS5LW2msNGbzywMWN+
 NoRnU6+RB8UipwkbwY78JyKEGBs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e018895.7f82852a5458-smtp-out-n02;
 Tue, 24 Dec 2019 03:40:05 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6AFE6C4479F; Tue, 24 Dec 2019 03:40:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from [10.206.24.214] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mgautam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 82792C43383;
        Tue, 24 Dec 2019 03:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 82792C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mgautam@codeaurora.org
Subject: Re: [PATCH v3 2/4] phy: qcom-qmp: remove duplicate powerdown write
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, Can Guo <cang@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-kernel@vger.kernel.org
References: <20191223143046.3376299-1-vkoul@kernel.org>
 <20191223143046.3376299-3-vkoul@kernel.org>
From:   Manu Gautam <mgautam@codeaurora.org>
Message-ID: <37fc7e23-eb22-c6c9-ba71-b01992936030@codeaurora.org>
Date:   Tue, 24 Dec 2019 09:09:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191223143046.3376299-3-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 12/23/2019 8:00 PM, Vinod Koul wrote:
> We already write to QPHY_POWER_DOWN_CONTROL in qcom_qmp_phy_com_init()
> before invoking qcom_qmp_phy_configure() so remove the duplicate write.
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 1196c85aa023..4f2e65c7cf45 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -885,7 +885,6 @@ static const struct qmp_phy_init_tbl msm8998_usb3_pcs_tbl[] = {
>  };
>  
>  static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] = {
> -	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
>  	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0xd9),
>  	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x11),
>  	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_HS_SWITCH_SEL, 0x00),

Reviewed-by: Manu Gautam <mgautam@codeaurora.org>

-- 

The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
