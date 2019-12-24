Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8C6129DF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2019 06:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbfLXF4A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Dec 2019 00:56:00 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:20290 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726102AbfLXF4A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Dec 2019 00:56:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577166959; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JqNI8MG2qRqTWms62/1QwkKEoyIcXdEP2xErGcRNSOg=;
 b=abolrLkyN0/SWfalIeTfp2ys2ADIUpCey4xqNHT9D0EEsREQimjYijpBsGo/3oLQiLhx8eLf
 CeVW1LZWcW1aS505H2qkJNKpFgtImGp9X66LkJU+81seNBCrhD81eVgoOk5S3cQpagFhCYoc
 aEPEVYLYdzfOr86zSbd1Y1DgrEY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e01a86f.7f0166a5fc00-smtp-out-n02;
 Tue, 24 Dec 2019 05:55:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EEC37C4479F; Tue, 24 Dec 2019 05:55:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 73A2BC433CB;
        Tue, 24 Dec 2019 05:55:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 24 Dec 2019 13:55:57 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] phy: qcom-qmp: Add SW reset register
In-Reply-To: <20191223143046.3376299-5-vkoul@kernel.org>
References: <20191223143046.3376299-1-vkoul@kernel.org>
 <20191223143046.3376299-5-vkoul@kernel.org>
Message-ID: <ac2f6bf823e27fe51780be7a82541991@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-23 22:30, Vinod Koul wrote:
> For V4 QMP UFS Phy, we need to assert reset bits, configure the phy and
> then deassert it, so add the QPHY_SW_RESET register which does this.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Can Guo <cang@codeaurora.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c
> b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index ce5e18f188c3..7db2a94f7a99 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -168,6 +168,7 @@ static const unsigned int 
> sdm845_ufsphy_regs_layout[] = {
>  static const unsigned int sm8150_ufsphy_regs_layout[] = {
>  	[QPHY_START_CTRL]		= QPHY_V4_PHY_START,
>  	[QPHY_PCS_READY_STATUS]		= QPHY_V4_PCS_READY_STATUS,
> +	[QPHY_SW_RESET]			= QPHY_V4_SW_RESET,
>  };
> 
>  static const struct qmp_phy_init_tbl msm8996_pcie_serdes_tbl[] = {
