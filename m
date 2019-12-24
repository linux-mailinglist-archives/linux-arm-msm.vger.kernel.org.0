Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB25129DED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2019 06:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbfLXFzh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Dec 2019 00:55:37 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:44992 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726009AbfLXFzh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Dec 2019 00:55:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577166936; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=74FMng3hv9ilS9hZKBfHAtY9S5qw42v4EAr1RQNFN6g=;
 b=kvR1TqscoiaGHMTIfYXgHzVUgg3NQm0uVo8azjZtfHp3aoFFgiuEjASb2GdPF+DewcROLlLI
 dm2ri8TfW95Lb6CxEG3Ip8KbmMHylaCvGFBgbJX5a6rv7n/IlNpkOOI0zQEfFFP/FbGigYE6
 BT1w9FdbXzVBJKPG0U0dTZOeg3k=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e01a857.7f0166a52b90-smtp-out-n02;
 Tue, 24 Dec 2019 05:55:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E67EAC447A0; Tue, 24 Dec 2019 05:55:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6A679C433CB;
        Tue, 24 Dec 2019 05:55:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 24 Dec 2019 13:55:34 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] phy: qcom-qmp: remove no_pcs_sw_reset for sm8150
In-Reply-To: <20191223143046.3376299-4-vkoul@kernel.org>
References: <20191223143046.3376299-1-vkoul@kernel.org>
 <20191223143046.3376299-4-vkoul@kernel.org>
Message-ID: <d62293044b96dac113f9670ff511bf2f@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-23 22:30, Vinod Koul wrote:
> SM8150 QMPY phy for UFS and onwards the PHY_SW_RESET is present in 
> PHY's
> PCS register so we should not mark no_pcs_sw_reset for sm8150 and
> onwards
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Can Guo <cang@codeaurora.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c
> b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 4f2e65c7cf45..ce5e18f188c3 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -1389,7 +1389,6 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg 
> = {
>  	.pwrdn_ctrl		= SW_PWRDN,
> 
>  	.is_dual_lane_phy	= true,
> -	.no_pcs_sw_reset	= true,
>  };
> 
>  static void qcom_qmp_phy_configure(void __iomem *base,
