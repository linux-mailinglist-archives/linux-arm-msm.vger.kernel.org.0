Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBB3302917
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jan 2021 18:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730995AbhAYRiV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 12:38:21 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:30413 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731073AbhAYRiA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 12:38:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611596245; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=22axXwf5Mw+tKBhvbOQLUF2dKW4sQ8w9RfN61rAA2hY=; b=rnve34BlGxzYpT+bT/6BMl2EnR1UOllYnUnbi7VCacH2feluvgeubXq28rmMpmZFMSKeQBb2
 QcP34teuC2K182MptqbxqTycjPh/qUP/KSeoM0VnYpy2hckba+tPAWs32PNWmQioWzsaWl5f
 jY6kmteywKPTyAlRg1pPvSnBLNw=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 600f01afad4c9e395bcad061 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 25 Jan 2021 17:36:47
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BEE3AC43463; Mon, 25 Jan 2021 17:36:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 84DE4C43461;
        Mon, 25 Jan 2021 17:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 84DE4C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Mon, 25 Jan 2021 09:36:42 -0800
From:   Jack Pham <jackp@codeaurora.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] phy: qcom-qmp: Add UFS v4 registers found in SM8350
Message-ID: <20210125173641.GA27487@jackp-linux.qualcomm.com>
References: <20210125100906.4004908-1-vkoul@kernel.org>
 <20210125100906.4004908-4-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125100906.4004908-4-vkoul@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vinod,

On Mon, Jan 25, 2021 at 03:39:05PM +0530, Vinod Koul wrote:
> Add the registers for few new registers found in SM8350. Also the UFS
> phy used in SM8350 seems to have different offsets than V4 phy, although
> it claims it is v4 phy, so add the new offsets with SM8350 tag instead
> of V4 tag.

Actually I believe SM8350 UFS PHY is on V5, as the internal IP revision
shows 5.0.0. So IMO some of the below definitions should just be using
the V5 macros for consistency with the ones I recently added for USB3.

And like USB3 QMP, it seems we have mixed usage of V4/V5 macros in the
sequence tables, mainly wherever the offsets are identical between IP
revisions. Hope this doesn't turn out to be a maintenance nightmare...

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
> index dff7be5a1cc1..bba1d5e3eb73 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
> @@ -451,6 +451,7 @@
>  #define QSERDES_V4_TX_RES_CODE_LANE_OFFSET_RX 		0x40
>  #define QSERDES_V4_TX_LANE_MODE_1			0x84
>  #define QSERDES_V4_TX_LANE_MODE_2			0x88
> +#define QSERDES_V4_TX_LANE_MODE_3			0x8C
>  #define QSERDES_V4_TX_RCV_DETECT_LVL_2			0x9c
>  #define QSERDES_V4_TX_PWM_GEAR_1_DIVIDER_BAND0_1	0xd8
>  #define QSERDES_V4_TX_PWM_GEAR_2_DIVIDER_BAND0_1	0xdC
> @@ -459,6 +460,13 @@
>  #define QSERDES_V4_TX_TRAN_DRVR_EMP_EN			0xb8
>  #define QSERDES_V4_TX_PI_QEC_CTRL		0x104
>  
> +/* Only for SM8350 QMP V4 Phy TX offsets different from V4 */
> +#define QSERDES_SM8350_TX_PWM_GEAR_1_DIVIDER_BAND0_1	0x178
> +#define QSERDES_SM8350_TX_PWM_GEAR_2_DIVIDER_BAND0_1	0x17c
> +#define QSERDES_SM8350_TX_PWM_GEAR_3_DIVIDER_BAND0_1	0x180
> +#define QSERDES_SM8350_TX_PWM_GEAR_4_DIVIDER_BAND0_1	0x184
> +#define QSERDES_SM8350_TX_TRAN_DRVR_EMP_EN		0xc0

These could be augmented to the V5 TX defintions? Although they are not
present for USB, so not sure if you want to add "V5_UFS" to the prefix.
But since they are at offsets past the end of the USB TX bank it should
also be ok to share in the QSERDES_V5_TX namespace.

> +
>  /* Only for QMP V4 PHY - RX registers */
>  #define QSERDES_V4_RX_UCDR_FO_GAIN			0x008
>  #define QSERDES_V4_RX_UCDR_SO_GAIN			0x014
> @@ -514,6 +522,24 @@
>  #define QSERDES_V4_RX_DCC_CTRL1				0x1bc
>  #define QSERDES_V4_RX_VTH_CODE				0x1c4
>  
> +/* Only for SM8350 QMP V4 Phy RX offsets different from V4 */
> +#define QSERDES_SM8350_RX_RX_MODE_00_LOW		0x15c
> +#define QSERDES_SM8350_RX_RX_MODE_00_HIGH		0x160
> +#define QSERDES_SM8350_RX_RX_MODE_00_HIGH2		0x164
> +#define QSERDES_SM8350_RX_RX_MODE_00_HIGH3		0x168
> +#define QSERDES_SM8350_RX_RX_MODE_00_HIGH4		0x16c
> +#define QSERDES_SM8350_RX_RX_MODE_01_LOW		0x170
> +#define QSERDES_SM8350_RX_RX_MODE_01_HIGH		0x174
> +#define QSERDES_SM8350_RX_RX_MODE_01_HIGH2		0x178
> +#define QSERDES_SM8350_RX_RX_MODE_01_HIGH3		0x17c
> +#define QSERDES_SM8350_RX_RX_MODE_01_HIGH4		0x180
> +#define QSERDES_SM8350_RX_RX_MODE_10_LOW		0x184
> +#define QSERDES_SM8350_RX_RX_MODE_10_HIGH		0x188
> +#define QSERDES_SM8350_RX_RX_MODE_10_HIGH2		0x18c
> +#define QSERDES_SM8350_RX_RX_MODE_10_HIGH3		0x190
> +#define QSERDES_SM8350_RX_RX_MODE_10_HIGH4		0x194
> +#define QSERDES_SM8350_RX_DCC_CTRL1			0x1a8

These are identical to the "V5" offsets I had added for SM8350 USB.

Thanks,
Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
