Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1022E129DF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2019 06:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfLXF4X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Dec 2019 00:56:23 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:21386 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726020AbfLXF4W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Dec 2019 00:56:22 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577166982; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=N78ejg9rqJGWEVBDpiZaJ8zMo/6RK3GuNyY8fajolbU=;
 b=D2s5SS70aEftc8TnUTzXCQL9MqB1afoEiLj7GyOkEgk2mU+gcKPIbkqiQeUMlFTrAndssDBc
 HXmHX09TUzhU6geBZ/82tjgD9zQcm3s/LZhAf7AqLAtgyUqyZgllUvC6Q3mj3xIUj/Iy3uBL
 guEIqTR4Ivaz1JJKEwR83a6H8ZI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e01a882.7fc08109fbc8-smtp-out-n01;
 Tue, 24 Dec 2019 05:56:18 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CA6E0C4479F; Tue, 24 Dec 2019 05:56:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=2.0 tests=ALL_TRUSTED,TVD_SUBJ_WIPE_DEBT,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 84677C433CB;
        Tue, 24 Dec 2019 05:56:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 24 Dec 2019 13:56:17 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] phy: qcom-qmp: remove duplicate powerdown write
In-Reply-To: <20191223143046.3376299-3-vkoul@kernel.org>
References: <20191223143046.3376299-1-vkoul@kernel.org>
 <20191223143046.3376299-3-vkoul@kernel.org>
Message-ID: <e4de5d5bc0a1ddc9117055499b143bf3@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-23 22:30, Vinod Koul wrote:
> We already write to QPHY_POWER_DOWN_CONTROL in qcom_qmp_phy_com_init()
> before invoking qcom_qmp_phy_configure() so remove the duplicate write.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Can Guo <cang@codeaurora.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c
> b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 1196c85aa023..4f2e65c7cf45 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -885,7 +885,6 @@ static const struct qmp_phy_init_tbl
> msm8998_usb3_pcs_tbl[] = {
>  };
> 
>  static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] = {
> -	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
>  	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0xd9),
>  	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x11),
>  	QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_HS_SWITCH_SEL, 0x00),
