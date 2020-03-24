Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 538E01909ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 10:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgCXJtd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 05:49:33 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41853 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgCXJtd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 05:49:33 -0400
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1jGgBZ-0008G8-MI; Tue, 24 Mar 2020 10:49:25 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1jGgBY-00070X-Ea; Tue, 24 Mar 2020 10:49:24 +0100
Date:   Tue, 24 Mar 2020 10:49:24 +0100
From:   Philipp Zabel <pza@pengutronix.de>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] phy: qcom-snps: Add SNPS USB PHY driver for QCOM
 based SOCs
Message-ID: <20200324094924.GA22281@pengutronix.de>
References: <1584994632-31193-1-git-send-email-wcheng@codeaurora.org>
 <1584994632-31193-3-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584994632-31193-3-git-send-email-wcheng@codeaurora.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:44:11 up 33 days, 17:14, 83 users,  load average: 0.32, 0.42,
 0.32
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Wesley,

On Mon, Mar 23, 2020 at 01:17:10PM -0700, Wesley Cheng wrote:
> This adds the SNPS FemtoPHY driver used in QCOM SOCs.  There
> are potentially multiple instances of this UTMI PHY on the
> SOC, all which can utilize this driver.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  drivers/phy/qualcomm/Kconfig             |  10 ++
>  drivers/phy/qualcomm/Makefile            |   1 +
>  drivers/phy/qualcomm/phy-qcom-snps-7nm.c | 294 +++++++++++++++++++++++++++++++
>  3 files changed, 305 insertions(+)
>  create mode 100644 drivers/phy/qualcomm/phy-qcom-snps-7nm.c
> 
[...]
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-7nm.c b/drivers/phy/qualcomm/phy-qcom-snps-7nm.c
> new file mode 100644
> index 0000000..8d4ba53
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-7nm.c
> @@ -0,0 +1,294 @@
[...]
> +static int qcom_snps_hsphy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct qcom_snps_hsphy *hsphy;
> +	struct phy_provider *phy_provider;
> +	struct phy *generic_phy;
> +	struct resource *res;
> +	int ret, i;
> +	int num;
> +
> +	hsphy = devm_kzalloc(dev, sizeof(*hsphy), GFP_KERNEL);
> +	if (!hsphy)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	hsphy->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(hsphy->base))
> +		return PTR_ERR(hsphy->base);
> +
> +	hsphy->ref_clk = devm_clk_get(dev, "ref");
> +	if (IS_ERR(hsphy->ref_clk)) {
> +		ret = PTR_ERR(hsphy->ref_clk);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "failed to get ref clk, %d\n", ret);
> +		return ret;
> +	}
> +
> +	hsphy->phy_reset = devm_reset_control_get_by_index(&pdev->dev, 0);
> +	if (IS_ERR(hsphy->phy_reset)) {
> +		dev_err(dev, "failed to get phy core reset\n");
> +		return PTR_ERR(hsphy->phy_reset);
> +	}

There is only a single reset specified, so there is no need for
_by_index. Also please explicitly request exclusive reset control
for this driver, I suggest:

	hsphy->phy_reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);

If you do want to prepare for future addition of other resets to the
bindings (but if so, why not specify those right now?), you should add
a reset-names property and request the reset control by id string
instead.

regards
Philipp
