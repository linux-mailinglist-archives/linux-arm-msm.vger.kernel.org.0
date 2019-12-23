Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D775129336
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2019 09:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbfLWIng (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 03:43:36 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:54254 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725905AbfLWIng (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 03:43:36 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577090615; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=DBAwlHo4z9mxlOrvHQaCfIjZ0sNHg6zZbxKTPb32waE=;
 b=mmOW0DorWLph08GW315XAe6bURJWnT/UXe4yzG8vzFSAT34rV0K6wIdkXnjEE/+YawF640tw
 2ueU0LZ5bez2xFJVJVmDUkP9IC1TCtQz2+fzeDdKoV4LZwyqoqNNATaa+/kc48gQhBbxRLEI
 bp0kYhNcTAO63AoX2zMopt8tw/0=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e007e31.7f5339308378-smtp-out-n01;
 Mon, 23 Dec 2019 08:43:29 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 59B31C4479D; Mon, 23 Dec 2019 08:43:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D29BC43383;
        Mon, 23 Dec 2019 08:43:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Dec 2019 16:43:27 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] phy: qcom-qmp: Use register defines
In-Reply-To: <20191220101719.3024693-3-vkoul@kernel.org>
References: <20191220101719.3024693-1-vkoul@kernel.org>
 <20191220101719.3024693-3-vkoul@kernel.org>
Message-ID: <341446449242684d4b5a0296d3331b0c@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-20 18:17, Vinod Koul wrote:
> We already define register offsets so use them in register layout.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c
> b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 66f91726b8b2..1196c85aa023 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -166,8 +166,8 @@ static const unsigned int 
> sdm845_ufsphy_regs_layout[] = {
>  };
> 
>  static const unsigned int sm8150_ufsphy_regs_layout[] = {
> -	[QPHY_START_CTRL]		= 0x00,
> -	[QPHY_PCS_READY_STATUS]		= 0x180,
> +	[QPHY_START_CTRL]		= QPHY_V4_PHY_START,
> +	[QPHY_PCS_READY_STATUS]		= QPHY_V4_PCS_READY_STATUS,

Missed QPHY_SW_RESET?

Regards,
Can Guo.

>  };
> 
>  static const struct qmp_phy_init_tbl msm8996_pcie_serdes_tbl[] = {
