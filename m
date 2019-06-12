Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C89A842C1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 18:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502084AbfFLQYJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 12:24:09 -0400
Received: from ns.iliad.fr ([212.27.33.1]:55940 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502083AbfFLQYJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 12:24:09 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 7B63620C11;
        Wed, 12 Jun 2019 18:24:06 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 5F6C520BC5;
        Wed, 12 Jun 2019 18:24:06 +0200 (CEST)
Subject: Re: [PATCH] phy: qcom-qmp: Correct READY_STATUS poll break condition
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
References: <20190604232443.3417-1-bjorn.andersson@linaro.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <619d2559-6d88-e795-76e0-3078236933ef@free.fr>
Date:   Wed, 12 Jun 2019 18:24:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190604232443.3417-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Jun 12 18:24:06 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/06/2019 01:24, Bjorn Andersson wrote:

> After issuing a PHY_START request to the QMP, the hardware documentation
> states that the software should wait for the PCS_READY_STATUS to become
> 1.
> 
> With the introduction of c9b589791fc1 ("phy: qcom: Utilize UFS reset
> controller") an additional 1ms delay was introduced between the start
> request and the check of the status bit. This greatly increases the
> chances for the hardware to actually becoming ready before the status
> bit is read.
> 
> The result can be seen in that UFS PHY enabling is now reported as a
> failure in 10% of the boots on SDM845, which is a clear regression from
> the previous rare/occasional failure.
> 
> This patch fixes the "break condition" of the poll to check for the
> correct state of the status bit.
> 
> Unfortunately PCIe on 8996 and 8998 does not specify the mask_pcs_ready
> register, which means that the code checks a bit that's always 0. So the
> patch also fixes these, in order to not regress these targets.
> 
> Cc: stable@vger.kernel.org
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Cc: Vivek Gautam <vivek.gautam@codeaurora.org>
> Fixes: 73d7ec899bd8 ("phy: qcom-qmp: Add msm8998 PCIe QMP PHY support")
> Fixes: e78f3d15e115 ("phy: qcom-qmp: new qmp phy driver for qcom-chipsets")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> @Kishon, this is a regression spotted in v5.2-rc1, so please consider applying
> this towards v5.2.
> 
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index cd91b4179b10..43abdfd0deed 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -1074,6 +1074,7 @@ static const struct qmp_phy_cfg msm8996_pciephy_cfg = {
>  
>  	.start_ctrl		= PCS_START | PLL_READY_GATE_EN,
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> +	.mask_pcs_ready		= PHYSTATUS,
>  	.mask_com_pcs_ready	= PCS_READY,
>  
>  	.has_phy_com_ctrl	= true,
> @@ -1253,6 +1254,7 @@ static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
>  
>  	.start_ctrl             = SERDES_START | PCS_START,
>  	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
> +	.mask_pcs_ready		= PHYSTATUS,
>  	.mask_com_pcs_ready	= PCS_READY,
>  };
>  
> @@ -1547,7 +1549,7 @@ static int qcom_qmp_phy_enable(struct phy *phy)
>  	status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
>  	mask = cfg->mask_pcs_ready;
>  
> -	ret = readl_poll_timeout(status, val, !(val & mask), 1,
> +	ret = readl_poll_timeout(status, val, val & mask, 1,
>  				 PHY_INIT_COMPLETE_TIMEOUT);
>  	if (ret) {
>  		dev_err(qmp->dev, "phy initialization timed-out\n");

Your patch made me realize that:
msm8998_pciephy_cfg.has_phy_com_ctrl = false
thus
msm8998_pciephy_cfg.mask_com_pcs_ready is useless, AFAICT.

(I copied msm8996_pciephy_cfg for msm8998_pciephy_cfg)

Does msm8996_pciephy_cfg really need both mask_pcs_ready AND
mask_com_pcs_ready?

I'll test your patch tomorrow.

Regards.
