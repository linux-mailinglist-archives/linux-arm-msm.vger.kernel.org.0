Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD76D20D717
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2020 22:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731416AbgF2T0v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 15:26:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732365AbgF2T0u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 15:26:50 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C8A9C03E979
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 12:26:50 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id c1so1179616pja.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 12:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ux/TL9JinISTCTe5Xn0ffSNFbU+bBeSHqbe8qk9rExo=;
        b=N7G2EaPCIEo9rdUpvKRRz9VXfQT3MbdHQS3cyJTCnZaADW9dTKeDzGdckSJhcmRTyu
         QebueaaYwONzFOxZrB2/TgqFobyT4mhYBuCoJeSxNQ/RB8gh2qMvpfox4XrA4ogK4bB7
         FsNbp+trir5XRGRS/sY06RaLeN3e/cEvi5zY9dcIsTPrC57l2R1cc3tNzlfgHb8UJVVq
         RK27xgR136AoxvU9E8QfWJwNDVlnqeTY6OIKjOlEMY8KKodzazDYehuiXoBySNuWmYFW
         uV2WN8rNV9zseOgvlWP0nWqL7w7FuIGwb1DVSWcQo4+RIhscaq0wocvWa7RC17Gt3akM
         OSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ux/TL9JinISTCTe5Xn0ffSNFbU+bBeSHqbe8qk9rExo=;
        b=ZwSqlsPTic474PR5FVOYl27+uq5347ZLQGoJ4seafTwYyahEiaa5MPf+L1HZCHnvDv
         bjoSvVa1L6cf+ZkzaNATy56gSQDfQuVH1le+fFrLlbcVXNXHh6FWEei24TSQoeOIBZTQ
         /9S04Wi7g9y3GemsB6GXQHOn7MSHTr+ja2LQ4/iNSP2kW8y1cNSjVyRw4BXdNzCTPBRS
         hrXYQyOBWIrXOxgpI11O+avK92M2oWXrx52mqcp36Oe6JX57GBuDQlOU1cdKV3FomP+N
         H+rxDlZSgkWtqvx8LMPSbpreHiKzeQmrvHB+UvU890b/0/iaWO86nFBzo7cLkuTo0SFS
         H+BQ==
X-Gm-Message-State: AOAM5310s0ARlACyMSjLN7lSOx6Efa+r8FCPF7zmt+jnUy0F9+FdNVcH
        wWtPPjwPOzJuDKiUF/sJnxbnYg==
X-Google-Smtp-Source: ABdhPJwZGUlXpouAxaqV2q43UFHaR7Zt6hf0JGvaS6fjoH6QXcLuz4v8IUnfo9T0EHCS7EhnJ0FFDQ==
X-Received: by 2002:a17:90a:2ec1:: with SMTP id h1mr17414550pjs.134.1593458809227;
        Mon, 29 Jun 2020 12:26:49 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c12sm424737pfn.162.2020.06.29.12.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 12:26:48 -0700 (PDT)
Date:   Mon, 29 Jun 2020 12:24:16 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: remove ufs qmp phy driver
Message-ID: <20200629192416.GJ388985@builder.lan>
References: <20200629145452.123035-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629145452.123035-1-vkoul@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 29 Jun 07:54 PDT 2020, Vinod Koul wrote:

> UFS QMP phy drivers are duplicate as we are supposed to use common QMP
> phy driver which is working fine on various platforms. So remove the
> unused driver
> 

This describes the current state, but the UFS QMP driver had a purpose
not that long ago and I would like the commit message to describe what
changed and why it's now fine to remove the driver.


I'm happy with the patch itself (i.e. the removal of the driver) though.

Regards,
Bjorn

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/phy/qualcomm/Kconfig                 |  24 -
>  drivers/phy/qualcomm/Makefile                |   3 -
>  drivers/phy/qualcomm/phy-qcom-ufs-i.h        | 131 ----
>  drivers/phy/qualcomm/phy-qcom-ufs-qmp-14nm.c | 172 -----
>  drivers/phy/qualcomm/phy-qcom-ufs-qmp-14nm.h | 168 -----
>  drivers/phy/qualcomm/phy-qcom-ufs-qmp-20nm.c | 226 -------
>  drivers/phy/qualcomm/phy-qcom-ufs-qmp-20nm.h | 226 -------
>  drivers/phy/qualcomm/phy-qcom-ufs.c          | 648 -------------------
>  8 files changed, 1598 deletions(-)
>  delete mode 100644 drivers/phy/qualcomm/phy-qcom-ufs-i.h
>  delete mode 100644 drivers/phy/qualcomm/phy-qcom-ufs-qmp-14nm.c
>  delete mode 100644 drivers/phy/qualcomm/phy-qcom-ufs-qmp-14nm.h
>  delete mode 100644 drivers/phy/qualcomm/phy-qcom-ufs-qmp-20nm.c
>  delete mode 100644 drivers/phy/qualcomm/phy-qcom-ufs-qmp-20nm.h
>  delete mode 100644 drivers/phy/qualcomm/phy-qcom-ufs.c
> 
> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index ca9ce7e84a5c..e6f0e514fb1f 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
> @@ -59,30 +59,6 @@ config PHY_QCOM_QUSB2
>  	  PHY which is usually paired with either the ChipIdea or Synopsys DWC3
>  	  USB IPs on MSM SOCs.
>  
> -config PHY_QCOM_UFS
> -	tristate "Qualcomm UFS PHY driver"
> -	depends on OF && ARCH_QCOM
> -	select GENERIC_PHY
> -	help
> -	  Support for UFS PHY on QCOM chipsets.
> -
> -if PHY_QCOM_UFS
> -
> -config PHY_QCOM_UFS_14NM
> -	tristate
> -	default PHY_QCOM_UFS
> -	help
> -	  Support for 14nm UFS QMP phy present on QCOM chipsets.
> -
> -config PHY_QCOM_UFS_20NM
> -	tristate
> -	default PHY_QCOM_UFS
> -	depends on BROKEN
> -	help
> -	  Support for 20nm UFS QMP phy present on QCOM chipsets.
> -
> -endif
> -
>  config PHY_QCOM_USB_HS
>  	tristate "Qualcomm USB HS PHY module"
>  	depends on USB_ULPI_BUS
> diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
> index 86fb32efab79..a767915decd0 100644
> --- a/drivers/phy/qualcomm/Makefile
> +++ b/drivers/phy/qualcomm/Makefile
> @@ -6,9 +6,6 @@ obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
>  obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
>  obj-$(CONFIG_PHY_QCOM_QMP)		+= phy-qcom-qmp.o
>  obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
> -obj-$(CONFIG_PHY_QCOM_UFS)		+= phy-qcom-ufs.o
> -obj-$(CONFIG_PHY_QCOM_UFS_14NM)		+= phy-qcom-ufs-qmp-14nm.o
> -obj-$(CONFIG_PHY_QCOM_UFS_20NM)		+= phy-qcom-ufs-qmp-20nm.o
>  obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o
>  obj-$(CONFIG_PHY_QCOM_USB_HSIC) 	+= phy-qcom-usb-hsic.o
>  obj-$(CONFIG_PHY_QCOM_USB_HS_28NM)	+= phy-qcom-usb-hs-28nm.o
> diff --git a/drivers/phy/qualcomm/phy-qcom-ufs-i.h b/drivers/phy/qualcomm/phy-qcom-ufs-i.h
> deleted file mode 100644
> index 9bf973a0d8c3..000000000000
> --- a/drivers/phy/qualcomm/phy-qcom-ufs-i.h
> +++ /dev/null
> @@ -1,131 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (c) 2013-2015, Linux Foundation. All rights reserved.
> - */
> -
> -#ifndef UFS_QCOM_PHY_I_H_
> -#define UFS_QCOM_PHY_I_H_
> -
> -#include <linux/module.h>
> -#include <linux/clk.h>
> -#include <linux/phy/phy.h>
> -#include <linux/regulator/consumer.h>
> -#include <linux/reset.h>
> -#include <linux/slab.h>
> -#include <linux/platform_device.h>
> -#include <linux/io.h>
> -#include <linux/delay.h>
> -#include <linux/iopoll.h>
> -
> -#define UFS_QCOM_PHY_CAL_ENTRY(reg, val)	\
> -	{				\
> -		.reg_offset = reg,	\
> -		.cfg_value = val,	\
> -	}
> -
> -#define UFS_QCOM_PHY_NAME_LEN	30
> -
> -enum {
> -	MASK_SERDES_START       = 0x1,
> -	MASK_PCS_READY          = 0x1,
> -};
> -
> -enum {
> -	OFFSET_SERDES_START     = 0x0,
> -};
> -
> -struct ufs_qcom_phy_stored_attributes {
> -	u32 att;
> -	u32 value;
> -};
> -
> -
> -struct ufs_qcom_phy_calibration {
> -	u32 reg_offset;
> -	u32 cfg_value;
> -};
> -
> -struct ufs_qcom_phy_vreg {
> -	const char *name;
> -	struct regulator *reg;
> -	int max_uA;
> -	int min_uV;
> -	int max_uV;
> -	bool enabled;
> -};
> -
> -struct ufs_qcom_phy {
> -	struct list_head list;
> -	struct device *dev;
> -	void __iomem *mmio;
> -	void __iomem *dev_ref_clk_ctrl_mmio;
> -	struct clk *tx_iface_clk;
> -	struct clk *rx_iface_clk;
> -	bool is_iface_clk_enabled;
> -	struct clk *ref_clk_src;
> -	struct clk *ref_clk_parent;
> -	struct clk *ref_clk;
> -	bool is_ref_clk_enabled;
> -	bool is_dev_ref_clk_enabled;
> -	struct ufs_qcom_phy_vreg vdda_pll;
> -	struct ufs_qcom_phy_vreg vdda_phy;
> -	struct ufs_qcom_phy_vreg vddp_ref_clk;
> -	unsigned int quirks;
> -
> -	/*
> -	* If UFS link is put into Hibern8 and if UFS PHY analog hardware is
> -	* power collapsed (by clearing UFS_PHY_POWER_DOWN_CONTROL), Hibern8
> -	* exit might fail even after powering on UFS PHY analog hardware.
> -	* Enabling this quirk will help to solve above issue by doing
> -	* custom PHY settings just before PHY analog power collapse.
> -	*/
> -	#define UFS_QCOM_PHY_QUIRK_HIBERN8_EXIT_AFTER_PHY_PWR_COLLAPSE	BIT(0)
> -
> -	u8 host_ctrl_rev_major;
> -	u16 host_ctrl_rev_minor;
> -	u16 host_ctrl_rev_step;
> -
> -	char name[UFS_QCOM_PHY_NAME_LEN];
> -	struct ufs_qcom_phy_calibration *cached_regs;
> -	int cached_regs_table_size;
> -	struct ufs_qcom_phy_specific_ops *phy_spec_ops;
> -
> -	enum phy_mode mode;
> -	struct reset_control *ufs_reset;
> -};
> -
> -/**
> - * struct ufs_qcom_phy_specific_ops - set of pointers to functions which have a
> - * specific implementation per phy. Each UFS phy, should implement
> - * those functions according to its spec and requirements
> - * @start_serdes: pointer to a function that starts the serdes
> - * @is_physical_coding_sublayer_ready: pointer to a function that
> - * checks pcs readiness. returns 0 for success and non-zero for error.
> - * @set_tx_lane_enable: pointer to a function that enable tx lanes
> - * @power_control: pointer to a function that controls analog rail of phy
> - * and writes to QSERDES_RX_SIGDET_CNTRL attribute
> - */
> -struct ufs_qcom_phy_specific_ops {
> -	int (*calibrate)(struct ufs_qcom_phy *ufs_qcom_phy, bool is_rate_B);
> -	void (*start_serdes)(struct ufs_qcom_phy *phy);
> -	int (*is_physical_coding_sublayer_ready)(struct ufs_qcom_phy *phy);
> -	void (*set_tx_lane_enable)(struct ufs_qcom_phy *phy, u32 val);
> -	void (*power_control)(struct ufs_qcom_phy *phy, bool val);
> -};
> -
> -struct ufs_qcom_phy *get_ufs_qcom_phy(struct phy *generic_phy);
> -int ufs_qcom_phy_power_on(struct phy *generic_phy);
> -int ufs_qcom_phy_power_off(struct phy *generic_phy);
> -int ufs_qcom_phy_init_clks(struct ufs_qcom_phy *phy_common);
> -int ufs_qcom_phy_init_vregulators(struct ufs_qcom_phy *phy_common);
> -int ufs_qcom_phy_remove(struct phy *generic_phy,
> -		       struct ufs_qcom_phy *ufs_qcom_phy);
> -struct phy *ufs_qcom_phy_generic_probe(struct platform_device *pdev,
> -			struct ufs_qcom_phy *common_cfg,
> -			const struct phy_ops *ufs_qcom_phy_gen_ops,
> -			struct ufs_qcom_phy_specific_ops *phy_spec_ops);
> -int ufs_qcom_phy_calibrate(struct ufs_qcom_phy *ufs_qcom_phy,
> -			struct ufs_qcom_phy_calibration *tbl_A, int tbl_size_A,
> -			struct ufs_qcom_phy_calibration *tbl_B, int tbl_size_B,
> -			bool is_rate_B);
> -#endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-ufs-qmp-14nm.c b/drivers/phy/qualcomm/phy-qcom-ufs-qmp-14nm.c
> deleted file mode 100644
> index 54b355bfc24c..000000000000
> --- a/drivers/phy/qualcomm/phy-qcom-ufs-qmp-14nm.c
> +++ /dev/null
> @@ -1,172 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (c) 2013-2015, Linux Foundation. All rights reserved.
> - */
> -
> -#include "phy-qcom-ufs-qmp-14nm.h"
> -
> -#define UFS_PHY_NAME "ufs_phy_qmp_14nm"
> -#define UFS_PHY_VDDA_PHY_UV	(925000)
> -
> -static
> -int ufs_qcom_phy_qmp_14nm_phy_calibrate(struct ufs_qcom_phy *ufs_qcom_phy,
> -					bool is_rate_B)
> -{
> -	int tbl_size_A = ARRAY_SIZE(phy_cal_table_rate_A);
> -	int tbl_size_B = ARRAY_SIZE(phy_cal_table_rate_B);
> -	int err;
> -
> -	err = ufs_qcom_phy_calibrate(ufs_qcom_phy, phy_cal_table_rate_A,
> -		tbl_size_A, phy_cal_table_rate_B, tbl_size_B, is_rate_B);
> -
> -	if (err)
> -		dev_err(ufs_qcom_phy->dev,
> -			"%s: ufs_qcom_phy_calibrate() failed %d\n",
> -			__func__, err);
> -	return err;
> -}
> -
> -static
> -void ufs_qcom_phy_qmp_14nm_advertise_quirks(struct ufs_qcom_phy *phy_common)
> -{
> -	phy_common->quirks =
> -		UFS_QCOM_PHY_QUIRK_HIBERN8_EXIT_AFTER_PHY_PWR_COLLAPSE;
> -}
> -
> -static
> -int ufs_qcom_phy_qmp_14nm_set_mode(struct phy *generic_phy,
> -				   enum phy_mode mode, int submode)
> -{
> -	struct ufs_qcom_phy *phy_common = get_ufs_qcom_phy(generic_phy);
> -
> -	phy_common->mode = PHY_MODE_INVALID;
> -
> -	if (mode > 0)
> -		phy_common->mode = mode;
> -
> -	return 0;
> -}
> -
> -static
> -void ufs_qcom_phy_qmp_14nm_power_control(struct ufs_qcom_phy *phy, bool val)
> -{
> -	writel_relaxed(val ? 0x1 : 0x0, phy->mmio + UFS_PHY_POWER_DOWN_CONTROL);
> -	/*
> -	 * Before any transactions involving PHY, ensure PHY knows
> -	 * that it's analog rail is powered ON (or OFF).
> -	 */
> -	mb();
> -}
> -
> -static inline
> -void ufs_qcom_phy_qmp_14nm_set_tx_lane_enable(struct ufs_qcom_phy *phy, u32 val)
> -{
> -	/*
> -	 * 14nm PHY does not have TX_LANE_ENABLE register.
> -	 * Implement this function so as not to propagate error to caller.
> -	 */
> -}
> -
> -static inline void ufs_qcom_phy_qmp_14nm_start_serdes(struct ufs_qcom_phy *phy)
> -{
> -	u32 tmp;
> -
> -	tmp = readl_relaxed(phy->mmio + UFS_PHY_PHY_START);
> -	tmp &= ~MASK_SERDES_START;
> -	tmp |= (1 << OFFSET_SERDES_START);
> -	writel_relaxed(tmp, phy->mmio + UFS_PHY_PHY_START);
> -	/* Ensure register value is committed */
> -	mb();
> -}
> -
> -static int ufs_qcom_phy_qmp_14nm_is_pcs_ready(struct ufs_qcom_phy *phy_common)
> -{
> -	int err = 0;
> -	u32 val;
> -
> -	err = readl_poll_timeout(phy_common->mmio + UFS_PHY_PCS_READY_STATUS,
> -		val, (val & MASK_PCS_READY), 10, 1000000);
> -	if (err)
> -		dev_err(phy_common->dev, "%s: poll for pcs failed err = %d\n",
> -			__func__, err);
> -	return err;
> -}
> -
> -static const struct phy_ops ufs_qcom_phy_qmp_14nm_phy_ops = {
> -	.power_on	= ufs_qcom_phy_power_on,
> -	.power_off	= ufs_qcom_phy_power_off,
> -	.set_mode	= ufs_qcom_phy_qmp_14nm_set_mode,
> -	.owner		= THIS_MODULE,
> -};
> -
> -static struct ufs_qcom_phy_specific_ops phy_14nm_ops = {
> -	.calibrate		= ufs_qcom_phy_qmp_14nm_phy_calibrate,
> -	.start_serdes		= ufs_qcom_phy_qmp_14nm_start_serdes,
> -	.is_physical_coding_sublayer_ready = ufs_qcom_phy_qmp_14nm_is_pcs_ready,
> -	.set_tx_lane_enable	= ufs_qcom_phy_qmp_14nm_set_tx_lane_enable,
> -	.power_control		= ufs_qcom_phy_qmp_14nm_power_control,
> -};
> -
> -static int ufs_qcom_phy_qmp_14nm_probe(struct platform_device *pdev)
> -{
> -	struct device *dev = &pdev->dev;
> -	struct phy *generic_phy;
> -	struct ufs_qcom_phy_qmp_14nm *phy;
> -	struct ufs_qcom_phy *phy_common;
> -	int err = 0;
> -
> -	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> -	if (!phy) {
> -		err = -ENOMEM;
> -		goto out;
> -	}
> -	phy_common = &phy->common_cfg;
> -
> -	generic_phy = ufs_qcom_phy_generic_probe(pdev, phy_common,
> -				&ufs_qcom_phy_qmp_14nm_phy_ops, &phy_14nm_ops);
> -
> -	if (!generic_phy) {
> -		err = -EIO;
> -		goto out;
> -	}
> -
> -	err = ufs_qcom_phy_init_clks(phy_common);
> -	if (err)
> -		goto out;
> -
> -	err = ufs_qcom_phy_init_vregulators(phy_common);
> -	if (err)
> -		goto out;
> -
> -	phy_common->vdda_phy.max_uV = UFS_PHY_VDDA_PHY_UV;
> -	phy_common->vdda_phy.min_uV = UFS_PHY_VDDA_PHY_UV;
> -
> -	ufs_qcom_phy_qmp_14nm_advertise_quirks(phy_common);
> -
> -	phy_set_drvdata(generic_phy, phy);
> -
> -	strlcpy(phy_common->name, UFS_PHY_NAME, sizeof(phy_common->name));
> -
> -out:
> -	return err;
> -}
> -
> -static const struct of_device_id ufs_qcom_phy_qmp_14nm_of_match[] = {
> -	{.compatible = "qcom,ufs-phy-qmp-14nm"},
> -	{.compatible = "qcom,msm8996-ufs-phy-qmp-14nm"},
> -	{},
> -};
> -MODULE_DEVICE_TABLE(of, ufs_qcom_phy_qmp_14nm_of_match);
> -
> -static struct platform_driver ufs_qcom_phy_qmp_14nm_driver = {
> -	.probe = ufs_qcom_phy_qmp_14nm_probe,
> -	.driver = {
> -		.of_match_table = ufs_qcom_phy_qmp_14nm_of_match,
> -		.name = "ufs_qcom_phy_qmp_14nm",
> -	},
> -};
> -
> -module_platform_driver(ufs_qcom_phy_qmp_14nm_driver);
> -
> -MODULE_DESCRIPTION("Universal Flash Storage (UFS) QCOM PHY QMP 14nm");
> -MODULE_LICENSE("GPL v2");
> diff --git a/drivers/phy/qualcomm/phy-qcom-ufs-qmp-14nm.h b/drivers/phy/qualcomm/phy-qcom-ufs-qmp-14nm.h
> deleted file mode 100644
> index ceca654b9338..000000000000
> --- a/drivers/phy/qualcomm/phy-qcom-ufs-qmp-14nm.h
> +++ /dev/null
> @@ -1,168 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (c) 2013-2015, Linux Foundation. All rights reserved.
> - */
> -
> -#ifndef UFS_QCOM_PHY_QMP_14NM_H_
> -#define UFS_QCOM_PHY_QMP_14NM_H_
> -
> -#include "phy-qcom-ufs-i.h"
> -
> -/* QCOM UFS PHY control registers */
> -#define COM_OFF(x)	(0x000 + x)
> -#define PHY_OFF(x)	(0xC00 + x)
> -#define TX_OFF(n, x)	(0x400 + (0x400 * n) + x)
> -#define RX_OFF(n, x)	(0x600 + (0x400 * n) + x)
> -
> -/* UFS PHY QSERDES COM registers */
> -#define QSERDES_COM_BG_TIMER			COM_OFF(0x0C)
> -#define QSERDES_COM_BIAS_EN_CLKBUFLR_EN		COM_OFF(0x34)
> -#define QSERDES_COM_SYS_CLK_CTRL		COM_OFF(0x3C)
> -#define QSERDES_COM_LOCK_CMP1_MODE0		COM_OFF(0x4C)
> -#define QSERDES_COM_LOCK_CMP2_MODE0		COM_OFF(0x50)
> -#define QSERDES_COM_LOCK_CMP3_MODE0		COM_OFF(0x54)
> -#define QSERDES_COM_LOCK_CMP1_MODE1		COM_OFF(0x58)
> -#define QSERDES_COM_LOCK_CMP2_MODE1		COM_OFF(0x5C)
> -#define QSERDES_COM_LOCK_CMP3_MODE1		COM_OFF(0x60)
> -#define QSERDES_COM_CP_CTRL_MODE0		COM_OFF(0x78)
> -#define QSERDES_COM_CP_CTRL_MODE1		COM_OFF(0x7C)
> -#define QSERDES_COM_PLL_RCTRL_MODE0		COM_OFF(0x84)
> -#define QSERDES_COM_PLL_RCTRL_MODE1		COM_OFF(0x88)
> -#define QSERDES_COM_PLL_CCTRL_MODE0		COM_OFF(0x90)
> -#define QSERDES_COM_PLL_CCTRL_MODE1		COM_OFF(0x94)
> -#define QSERDES_COM_SYSCLK_EN_SEL		COM_OFF(0xAC)
> -#define QSERDES_COM_RESETSM_CNTRL		COM_OFF(0xB4)
> -#define QSERDES_COM_LOCK_CMP_EN			COM_OFF(0xC8)
> -#define QSERDES_COM_LOCK_CMP_CFG		COM_OFF(0xCC)
> -#define QSERDES_COM_DEC_START_MODE0		COM_OFF(0xD0)
> -#define QSERDES_COM_DEC_START_MODE1		COM_OFF(0xD4)
> -#define QSERDES_COM_DIV_FRAC_START1_MODE0	COM_OFF(0xDC)
> -#define QSERDES_COM_DIV_FRAC_START2_MODE0	COM_OFF(0xE0)
> -#define QSERDES_COM_DIV_FRAC_START3_MODE0	COM_OFF(0xE4)
> -#define QSERDES_COM_DIV_FRAC_START1_MODE1	COM_OFF(0xE8)
> -#define QSERDES_COM_DIV_FRAC_START2_MODE1	COM_OFF(0xEC)
> -#define QSERDES_COM_DIV_FRAC_START3_MODE1	COM_OFF(0xF0)
> -#define QSERDES_COM_INTEGLOOP_GAIN0_MODE0	COM_OFF(0x108)
> -#define QSERDES_COM_INTEGLOOP_GAIN1_MODE0	COM_OFF(0x10C)
> -#define QSERDES_COM_INTEGLOOP_GAIN0_MODE1	COM_OFF(0x110)
> -#define QSERDES_COM_INTEGLOOP_GAIN1_MODE1	COM_OFF(0x114)
> -#define QSERDES_COM_VCO_TUNE_CTRL		COM_OFF(0x124)
> -#define QSERDES_COM_VCO_TUNE_MAP		COM_OFF(0x128)
> -#define QSERDES_COM_VCO_TUNE1_MODE0		COM_OFF(0x12C)
> -#define QSERDES_COM_VCO_TUNE2_MODE0		COM_OFF(0x130)
> -#define QSERDES_COM_VCO_TUNE1_MODE1		COM_OFF(0x134)
> -#define QSERDES_COM_VCO_TUNE2_MODE1		COM_OFF(0x138)
> -#define QSERDES_COM_VCO_TUNE_TIMER1		COM_OFF(0x144)
> -#define QSERDES_COM_VCO_TUNE_TIMER2		COM_OFF(0x148)
> -#define QSERDES_COM_CLK_SELECT			COM_OFF(0x174)
> -#define QSERDES_COM_HSCLK_SEL			COM_OFF(0x178)
> -#define QSERDES_COM_CORECLK_DIV			COM_OFF(0x184)
> -#define QSERDES_COM_CORE_CLK_EN			COM_OFF(0x18C)
> -#define QSERDES_COM_CMN_CONFIG			COM_OFF(0x194)
> -#define QSERDES_COM_SVS_MODE_CLK_SEL		COM_OFF(0x19C)
> -#define QSERDES_COM_CORECLK_DIV_MODE1		COM_OFF(0x1BC)
> -
> -/* UFS PHY registers */
> -#define UFS_PHY_PHY_START			PHY_OFF(0x00)
> -#define UFS_PHY_POWER_DOWN_CONTROL		PHY_OFF(0x04)
> -#define UFS_PHY_PCS_READY_STATUS		PHY_OFF(0x168)
> -
> -/* UFS PHY TX registers */
> -#define QSERDES_TX_HIGHZ_TRANSCEIVER_BIAS_DRVR_EN	TX_OFF(0, 0x68)
> -#define QSERDES_TX_LANE_MODE				TX_OFF(0, 0x94)
> -
> -/* UFS PHY RX registers */
> -#define QSERDES_RX_UCDR_FASTLOCK_FO_GAIN	RX_OFF(0, 0x40)
> -#define QSERDES_RX_RX_TERM_BW			RX_OFF(0, 0x90)
> -#define QSERDES_RX_RX_EQ_GAIN1_LSB		RX_OFF(0, 0xC4)
> -#define QSERDES_RX_RX_EQ_GAIN1_MSB		RX_OFF(0, 0xC8)
> -#define QSERDES_RX_RX_EQ_GAIN2_LSB		RX_OFF(0, 0xCC)
> -#define QSERDES_RX_RX_EQ_GAIN2_MSB		RX_OFF(0, 0xD0)
> -#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2	RX_OFF(0, 0xD8)
> -#define QSERDES_RX_SIGDET_CNTRL			RX_OFF(0, 0x114)
> -#define QSERDES_RX_SIGDET_LVL			RX_OFF(0, 0x118)
> -#define QSERDES_RX_SIGDET_DEGLITCH_CNTRL	RX_OFF(0, 0x11C)
> -#define QSERDES_RX_RX_INTERFACE_MODE		RX_OFF(0, 0x12C)
> -
> -/*
> - * This structure represents the 14nm specific phy.
> - * common_cfg MUST remain the first field in this structure
> - * in case extra fields are added. This way, when calling
> - * get_ufs_qcom_phy() of generic phy, we can extract the
> - * common phy structure (struct ufs_qcom_phy) out of it
> - * regardless of the relevant specific phy.
> - */
> -struct ufs_qcom_phy_qmp_14nm {
> -	struct ufs_qcom_phy common_cfg;
> -};
> -
> -static struct ufs_qcom_phy_calibration phy_cal_table_rate_A[] = {
> -	UFS_QCOM_PHY_CAL_ENTRY(UFS_PHY_POWER_DOWN_CONTROL, 0x01),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_CMN_CONFIG, 0x0e),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_SYSCLK_EN_SEL, 0xd7),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_CLK_SELECT, 0x30),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_SYS_CLK_CTRL, 0x06),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_BG_TIMER, 0x0a),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_HSCLK_SEL, 0x05),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_CORECLK_DIV, 0x0a),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_CORECLK_DIV_MODE1, 0x0a),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_LOCK_CMP_EN, 0x01),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_VCO_TUNE_CTRL, 0x10),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_RESETSM_CNTRL, 0x20),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_CORE_CLK_EN, 0x00),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_LOCK_CMP_CFG, 0x00),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_VCO_TUNE_TIMER1, 0xff),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_VCO_TUNE_TIMER2, 0x3f),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_VCO_TUNE_MAP, 0x14),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_SVS_MODE_CLK_SEL, 0x05),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_DEC_START_MODE0, 0x82),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x00),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x00),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_CP_CTRL_MODE0, 0x0b),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_CCTRL_MODE0, 0x28),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x80),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_VCO_TUNE1_MODE0, 0x28),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_VCO_TUNE2_MODE0, 0x02),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_LOCK_CMP1_MODE0, 0xff),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_LOCK_CMP2_MODE0, 0x0c),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_DEC_START_MODE1, 0x98),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_DIV_FRAC_START1_MODE1, 0x00),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_DIV_FRAC_START2_MODE1, 0x00),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_DIV_FRAC_START3_MODE1, 0x00),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_CP_CTRL_MODE1, 0x0b),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_RCTRL_MODE1, 0x16),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_CCTRL_MODE1, 0x28),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_INTEGLOOP_GAIN0_MODE1, 0x80),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_INTEGLOOP_GAIN1_MODE1, 0x00),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_VCO_TUNE1_MODE1, 0xd6),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_VCO_TUNE2_MODE1, 0x00),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_LOCK_CMP1_MODE1, 0x32),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_LOCK_CMP2_MODE1, 0x0f),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_LOCK_CMP3_MODE1, 0x00),
> -
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_TX_HIGHZ_TRANSCEIVER_BIAS_DRVR_EN, 0x45),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_TX_LANE_MODE, 0x02),
> -
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_SIGDET_LVL, 0x24),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_SIGDET_CNTRL, 0x02),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_INTERFACE_MODE, 0x00),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x18),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0B),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_TERM_BW, 0x5B),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN1_LSB, 0xFF),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN1_MSB, 0x3F),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN2_LSB, 0xFF),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN2_MSB, 0x0F),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0E),
> -};
> -
> -static struct ufs_qcom_phy_calibration phy_cal_table_rate_B[] = {
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_VCO_TUNE_MAP, 0x54),
> -};
> -
> -#endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-ufs-qmp-20nm.c b/drivers/phy/qualcomm/phy-qcom-ufs-qmp-20nm.c
> deleted file mode 100644
> index 3e9d8b71e995..000000000000
> --- a/drivers/phy/qualcomm/phy-qcom-ufs-qmp-20nm.c
> +++ /dev/null
> @@ -1,226 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (c) 2013-2015, Linux Foundation. All rights reserved.
> - */
> -
> -#include "phy-qcom-ufs-qmp-20nm.h"
> -
> -#define UFS_PHY_NAME "ufs_phy_qmp_20nm"
> -
> -static
> -int ufs_qcom_phy_qmp_20nm_phy_calibrate(struct ufs_qcom_phy *ufs_qcom_phy,
> -					bool is_rate_B)
> -{
> -	struct ufs_qcom_phy_calibration *tbl_A, *tbl_B;
> -	int tbl_size_A, tbl_size_B;
> -	u8 major = ufs_qcom_phy->host_ctrl_rev_major;
> -	u16 minor = ufs_qcom_phy->host_ctrl_rev_minor;
> -	u16 step = ufs_qcom_phy->host_ctrl_rev_step;
> -	int err;
> -
> -	if ((major == 0x1) && (minor == 0x002) && (step == 0x0000)) {
> -		tbl_size_A = ARRAY_SIZE(phy_cal_table_rate_A_1_2_0);
> -		tbl_A = phy_cal_table_rate_A_1_2_0;
> -	} else if ((major == 0x1) && (minor == 0x003) && (step == 0x0000)) {
> -		tbl_size_A = ARRAY_SIZE(phy_cal_table_rate_A_1_3_0);
> -		tbl_A = phy_cal_table_rate_A_1_3_0;
> -	} else {
> -		dev_err(ufs_qcom_phy->dev, "%s: Unknown UFS-PHY version, no calibration values\n",
> -			__func__);
> -		err = -ENODEV;
> -		goto out;
> -	}
> -
> -	tbl_size_B = ARRAY_SIZE(phy_cal_table_rate_B);
> -	tbl_B = phy_cal_table_rate_B;
> -
> -	err = ufs_qcom_phy_calibrate(ufs_qcom_phy, tbl_A, tbl_size_A,
> -						tbl_B, tbl_size_B, is_rate_B);
> -
> -	if (err)
> -		dev_err(ufs_qcom_phy->dev, "%s: ufs_qcom_phy_calibrate() failed %d\n",
> -			__func__, err);
> -
> -out:
> -	return err;
> -}
> -
> -static
> -void ufs_qcom_phy_qmp_20nm_advertise_quirks(struct ufs_qcom_phy *phy_common)
> -{
> -	phy_common->quirks =
> -		UFS_QCOM_PHY_QUIRK_HIBERN8_EXIT_AFTER_PHY_PWR_COLLAPSE;
> -}
> -
> -static
> -int ufs_qcom_phy_qmp_20nm_set_mode(struct phy *generic_phy,
> -				   enum phy_mode mode, int submode)
> -{
> -	struct ufs_qcom_phy *phy_common = get_ufs_qcom_phy(generic_phy);
> -
> -	phy_common->mode = PHY_MODE_INVALID;
> -
> -	if (mode > 0)
> -		phy_common->mode = mode;
> -
> -	return 0;
> -}
> -
> -static
> -void ufs_qcom_phy_qmp_20nm_power_control(struct ufs_qcom_phy *phy, bool val)
> -{
> -	bool hibern8_exit_after_pwr_collapse = phy->quirks &
> -		UFS_QCOM_PHY_QUIRK_HIBERN8_EXIT_AFTER_PHY_PWR_COLLAPSE;
> -
> -	if (val) {
> -		writel_relaxed(0x1, phy->mmio + UFS_PHY_POWER_DOWN_CONTROL);
> -		/*
> -		 * Before any transactions involving PHY, ensure PHY knows
> -		 * that it's analog rail is powered ON.
> -		 */
> -		mb();
> -
> -		if (hibern8_exit_after_pwr_collapse) {
> -			/*
> -			 * Give atleast 1us delay after restoring PHY analog
> -			 * power.
> -			 */
> -			usleep_range(1, 2);
> -			writel_relaxed(0x0A, phy->mmio +
> -				       QSERDES_COM_SYSCLK_EN_SEL_TXBAND);
> -			writel_relaxed(0x08, phy->mmio +
> -				       QSERDES_COM_SYSCLK_EN_SEL_TXBAND);
> -			/*
> -			 * Make sure workaround is deactivated before proceeding
> -			 * with normal PHY operations.
> -			 */
> -			mb();
> -		}
> -	} else {
> -		if (hibern8_exit_after_pwr_collapse) {
> -			writel_relaxed(0x0A, phy->mmio +
> -				       QSERDES_COM_SYSCLK_EN_SEL_TXBAND);
> -			writel_relaxed(0x02, phy->mmio +
> -				       QSERDES_COM_SYSCLK_EN_SEL_TXBAND);
> -			/*
> -			 * Make sure that above workaround is activated before
> -			 * PHY analog power collapse.
> -			 */
> -			mb();
> -		}
> -
> -		writel_relaxed(0x0, phy->mmio + UFS_PHY_POWER_DOWN_CONTROL);
> -		/*
> -		 * ensure that PHY knows its PHY analog rail is going
> -		 * to be powered down
> -		 */
> -		mb();
> -	}
> -}
> -
> -static
> -void ufs_qcom_phy_qmp_20nm_set_tx_lane_enable(struct ufs_qcom_phy *phy, u32 val)
> -{
> -	writel_relaxed(val & UFS_PHY_TX_LANE_ENABLE_MASK,
> -			phy->mmio + UFS_PHY_TX_LANE_ENABLE);
> -	mb();
> -}
> -
> -static inline void ufs_qcom_phy_qmp_20nm_start_serdes(struct ufs_qcom_phy *phy)
> -{
> -	u32 tmp;
> -
> -	tmp = readl_relaxed(phy->mmio + UFS_PHY_PHY_START);
> -	tmp &= ~MASK_SERDES_START;
> -	tmp |= (1 << OFFSET_SERDES_START);
> -	writel_relaxed(tmp, phy->mmio + UFS_PHY_PHY_START);
> -	mb();
> -}
> -
> -static int ufs_qcom_phy_qmp_20nm_is_pcs_ready(struct ufs_qcom_phy *phy_common)
> -{
> -	int err = 0;
> -	u32 val;
> -
> -	err = readl_poll_timeout(phy_common->mmio + UFS_PHY_PCS_READY_STATUS,
> -			val, (val & MASK_PCS_READY), 10, 1000000);
> -	if (err)
> -		dev_err(phy_common->dev, "%s: poll for pcs failed err = %d\n",
> -			__func__, err);
> -	return err;
> -}
> -
> -static const struct phy_ops ufs_qcom_phy_qmp_20nm_phy_ops = {
> -	.power_on	= ufs_qcom_phy_power_on,
> -	.power_off	= ufs_qcom_phy_power_off,
> -	.set_mode	= ufs_qcom_phy_qmp_20nm_set_mode,
> -	.owner		= THIS_MODULE,
> -};
> -
> -static struct ufs_qcom_phy_specific_ops phy_20nm_ops = {
> -	.calibrate		= ufs_qcom_phy_qmp_20nm_phy_calibrate,
> -	.start_serdes		= ufs_qcom_phy_qmp_20nm_start_serdes,
> -	.is_physical_coding_sublayer_ready = ufs_qcom_phy_qmp_20nm_is_pcs_ready,
> -	.set_tx_lane_enable	= ufs_qcom_phy_qmp_20nm_set_tx_lane_enable,
> -	.power_control		= ufs_qcom_phy_qmp_20nm_power_control,
> -};
> -
> -static int ufs_qcom_phy_qmp_20nm_probe(struct platform_device *pdev)
> -{
> -	struct device *dev = &pdev->dev;
> -	struct phy *generic_phy;
> -	struct ufs_qcom_phy_qmp_20nm *phy;
> -	struct ufs_qcom_phy *phy_common;
> -	int err = 0;
> -
> -	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> -	if (!phy) {
> -		err = -ENOMEM;
> -		goto out;
> -	}
> -	phy_common = &phy->common_cfg;
> -
> -	generic_phy = ufs_qcom_phy_generic_probe(pdev, phy_common,
> -				&ufs_qcom_phy_qmp_20nm_phy_ops, &phy_20nm_ops);
> -
> -	if (!generic_phy) {
> -		err = -EIO;
> -		goto out;
> -	}
> -
> -	err = ufs_qcom_phy_init_clks(phy_common);
> -	if (err)
> -		goto out;
> -
> -	err = ufs_qcom_phy_init_vregulators(phy_common);
> -	if (err)
> -		goto out;
> -
> -	ufs_qcom_phy_qmp_20nm_advertise_quirks(phy_common);
> -
> -	phy_set_drvdata(generic_phy, phy);
> -
> -	strlcpy(phy_common->name, UFS_PHY_NAME, sizeof(phy_common->name));
> -
> -out:
> -	return err;
> -}
> -
> -static const struct of_device_id ufs_qcom_phy_qmp_20nm_of_match[] = {
> -	{.compatible = "qcom,ufs-phy-qmp-20nm"},
> -	{},
> -};
> -MODULE_DEVICE_TABLE(of, ufs_qcom_phy_qmp_20nm_of_match);
> -
> -static struct platform_driver ufs_qcom_phy_qmp_20nm_driver = {
> -	.probe = ufs_qcom_phy_qmp_20nm_probe,
> -	.driver = {
> -		.of_match_table = ufs_qcom_phy_qmp_20nm_of_match,
> -		.name = "ufs_qcom_phy_qmp_20nm",
> -	},
> -};
> -
> -module_platform_driver(ufs_qcom_phy_qmp_20nm_driver);
> -
> -MODULE_DESCRIPTION("Universal Flash Storage (UFS) QCOM PHY QMP 20nm");
> -MODULE_LICENSE("GPL v2");
> diff --git a/drivers/phy/qualcomm/phy-qcom-ufs-qmp-20nm.h b/drivers/phy/qualcomm/phy-qcom-ufs-qmp-20nm.h
> deleted file mode 100644
> index 8ce79f524eed..000000000000
> --- a/drivers/phy/qualcomm/phy-qcom-ufs-qmp-20nm.h
> +++ /dev/null
> @@ -1,226 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (c) 2013-2015, Linux Foundation. All rights reserved.
> - */
> -
> -#ifndef UFS_QCOM_PHY_QMP_20NM_H_
> -#define UFS_QCOM_PHY_QMP_20NM_H_
> -
> -#include "phy-qcom-ufs-i.h"
> -
> -/* QCOM UFS PHY control registers */
> -
> -#define COM_OFF(x)     (0x000 + x)
> -#define PHY_OFF(x)     (0xC00 + x)
> -#define TX_OFF(n, x)   (0x400 + (0x400 * n) + x)
> -#define RX_OFF(n, x)   (0x600 + (0x400 * n) + x)
> -
> -/* UFS PHY PLL block registers */
> -#define QSERDES_COM_SYS_CLK_CTRL		COM_OFF(0x0)
> -#define QSERDES_COM_PLL_VCOTAIL_EN		COM_OFF(0x04)
> -#define QSERDES_COM_PLL_CNTRL			COM_OFF(0x14)
> -#define QSERDES_COM_PLL_IP_SETI			COM_OFF(0x24)
> -#define QSERDES_COM_CORE_CLK_IN_SYNC_SEL	COM_OFF(0x28)
> -#define QSERDES_COM_BIAS_EN_CLKBUFLR_EN		COM_OFF(0x30)
> -#define QSERDES_COM_PLL_CP_SETI			COM_OFF(0x34)
> -#define QSERDES_COM_PLL_IP_SETP			COM_OFF(0x38)
> -#define QSERDES_COM_PLL_CP_SETP			COM_OFF(0x3C)
> -#define QSERDES_COM_SYSCLK_EN_SEL_TXBAND	COM_OFF(0x48)
> -#define QSERDES_COM_RESETSM_CNTRL		COM_OFF(0x4C)
> -#define QSERDES_COM_RESETSM_CNTRL2		COM_OFF(0x50)
> -#define QSERDES_COM_PLLLOCK_CMP1		COM_OFF(0x90)
> -#define QSERDES_COM_PLLLOCK_CMP2		COM_OFF(0x94)
> -#define QSERDES_COM_PLLLOCK_CMP3		COM_OFF(0x98)
> -#define QSERDES_COM_PLLLOCK_CMP_EN		COM_OFF(0x9C)
> -#define QSERDES_COM_BGTC			COM_OFF(0xA0)
> -#define QSERDES_COM_DEC_START1			COM_OFF(0xAC)
> -#define QSERDES_COM_PLL_AMP_OS			COM_OFF(0xB0)
> -#define QSERDES_COM_RES_CODE_UP_OFFSET		COM_OFF(0xD8)
> -#define QSERDES_COM_RES_CODE_DN_OFFSET		COM_OFF(0xDC)
> -#define QSERDES_COM_DIV_FRAC_START1		COM_OFF(0x100)
> -#define QSERDES_COM_DIV_FRAC_START2		COM_OFF(0x104)
> -#define QSERDES_COM_DIV_FRAC_START3		COM_OFF(0x108)
> -#define QSERDES_COM_DEC_START2			COM_OFF(0x10C)
> -#define QSERDES_COM_PLL_RXTXEPCLK_EN		COM_OFF(0x110)
> -#define QSERDES_COM_PLL_CRCTRL			COM_OFF(0x114)
> -#define QSERDES_COM_PLL_CLKEPDIV		COM_OFF(0x118)
> -
> -/* TX LANE n (0, 1) registers */
> -#define QSERDES_TX_EMP_POST1_LVL(n)		TX_OFF(n, 0x08)
> -#define QSERDES_TX_DRV_LVL(n)			TX_OFF(n, 0x0C)
> -#define QSERDES_TX_LANE_MODE(n)			TX_OFF(n, 0x54)
> -
> -/* RX LANE n (0, 1) registers */
> -#define QSERDES_RX_CDR_CONTROL1(n)		RX_OFF(n, 0x0)
> -#define QSERDES_RX_CDR_CONTROL_HALF(n)		RX_OFF(n, 0x8)
> -#define QSERDES_RX_RX_EQ_GAIN1_LSB(n)		RX_OFF(n, 0xA8)
> -#define QSERDES_RX_RX_EQ_GAIN1_MSB(n)		RX_OFF(n, 0xAC)
> -#define QSERDES_RX_RX_EQ_GAIN2_LSB(n)		RX_OFF(n, 0xB0)
> -#define QSERDES_RX_RX_EQ_GAIN2_MSB(n)		RX_OFF(n, 0xB4)
> -#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2(n)	RX_OFF(n, 0xBC)
> -#define QSERDES_RX_CDR_CONTROL_QUARTER(n)	RX_OFF(n, 0xC)
> -#define QSERDES_RX_SIGDET_CNTRL(n)		RX_OFF(n, 0x100)
> -
> -/* UFS PHY registers */
> -#define UFS_PHY_PHY_START			PHY_OFF(0x00)
> -#define UFS_PHY_POWER_DOWN_CONTROL		PHY_OFF(0x4)
> -#define UFS_PHY_TX_LANE_ENABLE			PHY_OFF(0x44)
> -#define UFS_PHY_PWM_G1_CLK_DIVIDER		PHY_OFF(0x08)
> -#define UFS_PHY_PWM_G2_CLK_DIVIDER		PHY_OFF(0x0C)
> -#define UFS_PHY_PWM_G3_CLK_DIVIDER		PHY_OFF(0x10)
> -#define UFS_PHY_PWM_G4_CLK_DIVIDER		PHY_OFF(0x14)
> -#define UFS_PHY_CORECLK_PWM_G1_CLK_DIVIDER	PHY_OFF(0x34)
> -#define UFS_PHY_CORECLK_PWM_G2_CLK_DIVIDER	PHY_OFF(0x38)
> -#define UFS_PHY_CORECLK_PWM_G3_CLK_DIVIDER	PHY_OFF(0x3C)
> -#define UFS_PHY_CORECLK_PWM_G4_CLK_DIVIDER	PHY_OFF(0x40)
> -#define UFS_PHY_OMC_STATUS_RDVAL		PHY_OFF(0x68)
> -#define UFS_PHY_LINE_RESET_TIME			PHY_OFF(0x28)
> -#define UFS_PHY_LINE_RESET_GRANULARITY		PHY_OFF(0x2C)
> -#define UFS_PHY_TSYNC_RSYNC_CNTL		PHY_OFF(0x48)
> -#define UFS_PHY_PLL_CNTL			PHY_OFF(0x50)
> -#define UFS_PHY_TX_LARGE_AMP_DRV_LVL		PHY_OFF(0x54)
> -#define UFS_PHY_TX_SMALL_AMP_DRV_LVL		PHY_OFF(0x5C)
> -#define UFS_PHY_TX_LARGE_AMP_POST_EMP_LVL	PHY_OFF(0x58)
> -#define UFS_PHY_TX_SMALL_AMP_POST_EMP_LVL	PHY_OFF(0x60)
> -#define UFS_PHY_CFG_CHANGE_CNT_VAL		PHY_OFF(0x64)
> -#define UFS_PHY_RX_SYNC_WAIT_TIME		PHY_OFF(0x6C)
> -#define UFS_PHY_TX_MIN_SLEEP_NOCONFIG_TIME_CAPABILITY	PHY_OFF(0xB4)
> -#define UFS_PHY_RX_MIN_SLEEP_NOCONFIG_TIME_CAPABILITY	PHY_OFF(0xE0)
> -#define UFS_PHY_TX_MIN_STALL_NOCONFIG_TIME_CAPABILITY	PHY_OFF(0xB8)
> -#define UFS_PHY_RX_MIN_STALL_NOCONFIG_TIME_CAPABILITY	PHY_OFF(0xE4)
> -#define UFS_PHY_TX_MIN_SAVE_CONFIG_TIME_CAPABILITY	PHY_OFF(0xBC)
> -#define UFS_PHY_RX_MIN_SAVE_CONFIG_TIME_CAPABILITY	PHY_OFF(0xE8)
> -#define UFS_PHY_RX_PWM_BURST_CLOSURE_LENGTH_CAPABILITY	PHY_OFF(0xFC)
> -#define UFS_PHY_RX_MIN_ACTIVATETIME_CAPABILITY		PHY_OFF(0x100)
> -#define UFS_PHY_RX_SIGDET_CTRL3				PHY_OFF(0x14c)
> -#define UFS_PHY_RMMI_ATTR_CTRL			PHY_OFF(0x160)
> -#define UFS_PHY_RMMI_RX_CFGUPDT_L1	(1 << 7)
> -#define UFS_PHY_RMMI_TX_CFGUPDT_L1	(1 << 6)
> -#define UFS_PHY_RMMI_CFGWR_L1		(1 << 5)
> -#define UFS_PHY_RMMI_CFGRD_L1		(1 << 4)
> -#define UFS_PHY_RMMI_RX_CFGUPDT_L0	(1 << 3)
> -#define UFS_PHY_RMMI_TX_CFGUPDT_L0	(1 << 2)
> -#define UFS_PHY_RMMI_CFGWR_L0		(1 << 1)
> -#define UFS_PHY_RMMI_CFGRD_L0		(1 << 0)
> -#define UFS_PHY_RMMI_ATTRID			PHY_OFF(0x164)
> -#define UFS_PHY_RMMI_ATTRWRVAL			PHY_OFF(0x168)
> -#define UFS_PHY_RMMI_ATTRRDVAL_L0_STATUS	PHY_OFF(0x16C)
> -#define UFS_PHY_RMMI_ATTRRDVAL_L1_STATUS	PHY_OFF(0x170)
> -#define UFS_PHY_PCS_READY_STATUS		PHY_OFF(0x174)
> -
> -#define UFS_PHY_TX_LANE_ENABLE_MASK		0x3
> -
> -/*
> - * This structure represents the 20nm specific phy.
> - * common_cfg MUST remain the first field in this structure
> - * in case extra fields are added. This way, when calling
> - * get_ufs_qcom_phy() of generic phy, we can extract the
> - * common phy structure (struct ufs_qcom_phy) out of it
> - * regardless of the relevant specific phy.
> - */
> -struct ufs_qcom_phy_qmp_20nm {
> -	struct ufs_qcom_phy common_cfg;
> -};
> -
> -static struct ufs_qcom_phy_calibration phy_cal_table_rate_A_1_2_0[] = {
> -	UFS_QCOM_PHY_CAL_ENTRY(UFS_PHY_POWER_DOWN_CONTROL, 0x01),
> -	UFS_QCOM_PHY_CAL_ENTRY(UFS_PHY_RX_SIGDET_CTRL3, 0x0D),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_VCOTAIL_EN, 0xe1),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_CRCTRL, 0xcc),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_SYSCLK_EN_SEL_TXBAND, 0x08),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_CLKEPDIV, 0x03),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_RXTXEPCLK_EN, 0x10),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_DEC_START1, 0x82),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_DEC_START2, 0x03),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_DIV_FRAC_START1, 0x80),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_DIV_FRAC_START2, 0x80),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_DIV_FRAC_START3, 0x40),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLLLOCK_CMP1, 0xff),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLLLOCK_CMP2, 0x19),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLLLOCK_CMP3, 0x00),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLLLOCK_CMP_EN, 0x03),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_RESETSM_CNTRL, 0x90),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_RESETSM_CNTRL2, 0x03),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_CDR_CONTROL1(0), 0xf2),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_CDR_CONTROL_HALF(0), 0x0c),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_CDR_CONTROL_QUARTER(0), 0x12),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_CDR_CONTROL1(1), 0xf2),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_CDR_CONTROL_HALF(1), 0x0c),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_CDR_CONTROL_QUARTER(1), 0x12),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN1_LSB(0), 0xff),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN1_MSB(0), 0xff),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN2_LSB(0), 0xff),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN2_MSB(0), 0x00),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN1_LSB(1), 0xff),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN1_MSB(1), 0xff),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN2_LSB(1), 0xff),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN2_MSB(1), 0x00),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_CP_SETI, 0x3f),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_IP_SETP, 0x1b),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_CP_SETP, 0x0f),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_IP_SETI, 0x01),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_TX_EMP_POST1_LVL(0), 0x2F),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_TX_DRV_LVL(0), 0x20),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_TX_EMP_POST1_LVL(1), 0x2F),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_TX_DRV_LVL(1), 0x20),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_TX_LANE_MODE(0), 0x68),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_TX_LANE_MODE(1), 0x68),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2(1), 0xdc),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2(0), 0xdc),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x3),
> -};
> -
> -static struct ufs_qcom_phy_calibration phy_cal_table_rate_A_1_3_0[] = {
> -	UFS_QCOM_PHY_CAL_ENTRY(UFS_PHY_POWER_DOWN_CONTROL, 0x01),
> -	UFS_QCOM_PHY_CAL_ENTRY(UFS_PHY_RX_SIGDET_CTRL3, 0x0D),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_VCOTAIL_EN, 0xe1),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_CRCTRL, 0xcc),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_SYSCLK_EN_SEL_TXBAND, 0x08),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_CLKEPDIV, 0x03),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_RXTXEPCLK_EN, 0x10),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_DEC_START1, 0x82),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_DEC_START2, 0x03),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_DIV_FRAC_START1, 0x80),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_DIV_FRAC_START2, 0x80),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_DIV_FRAC_START3, 0x40),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLLLOCK_CMP1, 0xff),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLLLOCK_CMP2, 0x19),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLLLOCK_CMP3, 0x00),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLLLOCK_CMP_EN, 0x03),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_RESETSM_CNTRL, 0x90),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_RESETSM_CNTRL2, 0x03),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_CDR_CONTROL1(0), 0xf2),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_CDR_CONTROL_HALF(0), 0x0c),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_CDR_CONTROL_QUARTER(0), 0x12),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_CDR_CONTROL1(1), 0xf2),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_CDR_CONTROL_HALF(1), 0x0c),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_CDR_CONTROL_QUARTER(1), 0x12),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN1_LSB(0), 0xff),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN1_MSB(0), 0xff),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN2_LSB(0), 0xff),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN2_MSB(0), 0x00),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN1_LSB(1), 0xff),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN1_MSB(1), 0xff),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN2_LSB(1), 0xff),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQ_GAIN2_MSB(1), 0x00),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_CP_SETI, 0x2b),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_IP_SETP, 0x38),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_CP_SETP, 0x3c),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_RES_CODE_UP_OFFSET, 0x02),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_RES_CODE_DN_OFFSET, 0x02),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_IP_SETI, 0x01),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLL_CNTRL, 0x40),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_TX_LANE_MODE(0), 0x68),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_TX_LANE_MODE(1), 0x68),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2(1), 0xdc),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2(0), 0xdc),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x3),
> -};
> -
> -static struct ufs_qcom_phy_calibration phy_cal_table_rate_B[] = {
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_DEC_START1, 0x98),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLLLOCK_CMP1, 0x65),
> -	UFS_QCOM_PHY_CAL_ENTRY(QSERDES_COM_PLLLOCK_CMP2, 0x1e),
> -};
> -
> -#endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-ufs.c b/drivers/phy/qualcomm/phy-qcom-ufs.c
> deleted file mode 100644
> index 763c8d396af1..000000000000
> --- a/drivers/phy/qualcomm/phy-qcom-ufs.c
> +++ /dev/null
> @@ -1,648 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (c) 2013-2015, Linux Foundation. All rights reserved.
> - */
> -
> -#include "phy-qcom-ufs-i.h"
> -
> -#define MAX_PROP_NAME              32
> -#define VDDA_PHY_MIN_UV            1000000
> -#define VDDA_PHY_MAX_UV            1000000
> -#define VDDA_PLL_MIN_UV            1800000
> -#define VDDA_PLL_MAX_UV            1800000
> -#define VDDP_REF_CLK_MIN_UV        1200000
> -#define VDDP_REF_CLK_MAX_UV        1200000
> -
> -int ufs_qcom_phy_calibrate(struct ufs_qcom_phy *ufs_qcom_phy,
> -			   struct ufs_qcom_phy_calibration *tbl_A,
> -			   int tbl_size_A,
> -			   struct ufs_qcom_phy_calibration *tbl_B,
> -			   int tbl_size_B, bool is_rate_B)
> -{
> -	int i;
> -	int ret = 0;
> -
> -	if (!tbl_A) {
> -		dev_err(ufs_qcom_phy->dev, "%s: tbl_A is NULL", __func__);
> -		ret = EINVAL;
> -		goto out;
> -	}
> -
> -	for (i = 0; i < tbl_size_A; i++)
> -		writel_relaxed(tbl_A[i].cfg_value,
> -			       ufs_qcom_phy->mmio + tbl_A[i].reg_offset);
> -
> -	/*
> -	 * In case we would like to work in rate B, we need
> -	 * to override a registers that were configured in rate A table
> -	 * with registers of rate B table.
> -	 * table.
> -	 */
> -	if (is_rate_B) {
> -		if (!tbl_B) {
> -			dev_err(ufs_qcom_phy->dev, "%s: tbl_B is NULL",
> -				__func__);
> -			ret = EINVAL;
> -			goto out;
> -		}
> -
> -		for (i = 0; i < tbl_size_B; i++)
> -			writel_relaxed(tbl_B[i].cfg_value,
> -				ufs_qcom_phy->mmio + tbl_B[i].reg_offset);
> -	}
> -
> -	/* flush buffered writes */
> -	mb();
> -
> -out:
> -	return ret;
> -}
> -EXPORT_SYMBOL_GPL(ufs_qcom_phy_calibrate);
> -
> -/*
> - * This assumes the embedded phy structure inside generic_phy is of type
> - * struct ufs_qcom_phy. In order to function properly it's crucial
> - * to keep the embedded struct "struct ufs_qcom_phy common_cfg"
> - * as the first inside generic_phy.
> - */
> -struct ufs_qcom_phy *get_ufs_qcom_phy(struct phy *generic_phy)
> -{
> -	return (struct ufs_qcom_phy *)phy_get_drvdata(generic_phy);
> -}
> -EXPORT_SYMBOL_GPL(get_ufs_qcom_phy);
> -
> -static
> -int ufs_qcom_phy_base_init(struct platform_device *pdev,
> -			   struct ufs_qcom_phy *phy_common)
> -{
> -	struct device *dev = &pdev->dev;
> -	struct resource *res;
> -	int err = 0;
> -
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "phy_mem");
> -	phy_common->mmio = devm_ioremap_resource(dev, res);
> -	if (IS_ERR((void const *)phy_common->mmio)) {
> -		err = PTR_ERR((void const *)phy_common->mmio);
> -		phy_common->mmio = NULL;
> -		dev_err(dev, "%s: ioremap for phy_mem resource failed %d\n",
> -			__func__, err);
> -		return err;
> -	}
> -
> -	/* "dev_ref_clk_ctrl_mem" is optional resource */
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -					   "dev_ref_clk_ctrl_mem");
> -	phy_common->dev_ref_clk_ctrl_mmio = devm_ioremap_resource(dev, res);
> -	if (IS_ERR((void const *)phy_common->dev_ref_clk_ctrl_mmio))
> -		phy_common->dev_ref_clk_ctrl_mmio = NULL;
> -
> -	return 0;
> -}
> -
> -struct phy *ufs_qcom_phy_generic_probe(struct platform_device *pdev,
> -				struct ufs_qcom_phy *common_cfg,
> -				const struct phy_ops *ufs_qcom_phy_gen_ops,
> -				struct ufs_qcom_phy_specific_ops *phy_spec_ops)
> -{
> -	int err;
> -	struct device *dev = &pdev->dev;
> -	struct phy *generic_phy = NULL;
> -	struct phy_provider *phy_provider;
> -
> -	err = ufs_qcom_phy_base_init(pdev, common_cfg);
> -	if (err) {
> -		dev_err(dev, "%s: phy base init failed %d\n", __func__, err);
> -		goto out;
> -	}
> -
> -	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> -	if (IS_ERR(phy_provider)) {
> -		err = PTR_ERR(phy_provider);
> -		dev_err(dev, "%s: failed to register phy %d\n", __func__, err);
> -		goto out;
> -	}
> -
> -	generic_phy = devm_phy_create(dev, NULL, ufs_qcom_phy_gen_ops);
> -	if (IS_ERR(generic_phy)) {
> -		err =  PTR_ERR(generic_phy);
> -		dev_err(dev, "%s: failed to create phy %d\n", __func__, err);
> -		generic_phy = NULL;
> -		goto out;
> -	}
> -
> -	common_cfg->phy_spec_ops = phy_spec_ops;
> -	common_cfg->dev = dev;
> -
> -out:
> -	return generic_phy;
> -}
> -EXPORT_SYMBOL_GPL(ufs_qcom_phy_generic_probe);
> -
> -static int ufs_qcom_phy_get_reset(struct ufs_qcom_phy *phy_common)
> -{
> -	struct reset_control *reset;
> -
> -	if (phy_common->ufs_reset)
> -		return 0;
> -
> -	reset = devm_reset_control_get_exclusive_by_index(phy_common->dev, 0);
> -	if (IS_ERR(reset))
> -		return PTR_ERR(reset);
> -
> -	phy_common->ufs_reset = reset;
> -	return 0;
> -}
> -
> -static int __ufs_qcom_phy_clk_get(struct device *dev,
> -			 const char *name, struct clk **clk_out, bool err_print)
> -{
> -	struct clk *clk;
> -	int err = 0;
> -
> -	clk = devm_clk_get(dev, name);
> -	if (IS_ERR(clk)) {
> -		err = PTR_ERR(clk);
> -		if (err_print)
> -			dev_err(dev, "failed to get %s err %d", name, err);
> -	} else {
> -		*clk_out = clk;
> -	}
> -
> -	return err;
> -}
> -
> -static int ufs_qcom_phy_clk_get(struct device *dev,
> -			 const char *name, struct clk **clk_out)
> -{
> -	return __ufs_qcom_phy_clk_get(dev, name, clk_out, true);
> -}
> -
> -int ufs_qcom_phy_init_clks(struct ufs_qcom_phy *phy_common)
> -{
> -	int err;
> -
> -	if (of_device_is_compatible(phy_common->dev->of_node,
> -				"qcom,msm8996-ufs-phy-qmp-14nm"))
> -		goto skip_txrx_clk;
> -
> -	err = ufs_qcom_phy_clk_get(phy_common->dev, "tx_iface_clk",
> -				   &phy_common->tx_iface_clk);
> -	if (err)
> -		goto out;
> -
> -	err = ufs_qcom_phy_clk_get(phy_common->dev, "rx_iface_clk",
> -				   &phy_common->rx_iface_clk);
> -	if (err)
> -		goto out;
> -
> -skip_txrx_clk:
> -	err = ufs_qcom_phy_clk_get(phy_common->dev, "ref_clk_src",
> -				   &phy_common->ref_clk_src);
> -	if (err)
> -		goto out;
> -
> -	/*
> -	 * "ref_clk_parent" is optional hence don't abort init if it's not
> -	 * found.
> -	 */
> -	__ufs_qcom_phy_clk_get(phy_common->dev, "ref_clk_parent",
> -				   &phy_common->ref_clk_parent, false);
> -
> -	err = ufs_qcom_phy_clk_get(phy_common->dev, "ref_clk",
> -				   &phy_common->ref_clk);
> -
> -out:
> -	return err;
> -}
> -EXPORT_SYMBOL_GPL(ufs_qcom_phy_init_clks);
> -
> -static int ufs_qcom_phy_init_vreg(struct device *dev,
> -				  struct ufs_qcom_phy_vreg *vreg,
> -				  const char *name)
> -{
> -	int err = 0;
> -
> -	char prop_name[MAX_PROP_NAME];
> -
> -	vreg->name = name;
> -	vreg->reg = devm_regulator_get(dev, name);
> -	if (IS_ERR(vreg->reg)) {
> -		err = PTR_ERR(vreg->reg);
> -		dev_err(dev, "failed to get %s, %d\n", name, err);
> -		goto out;
> -	}
> -
> -	if (dev->of_node) {
> -		snprintf(prop_name, MAX_PROP_NAME, "%s-max-microamp", name);
> -		err = of_property_read_u32(dev->of_node,
> -					prop_name, &vreg->max_uA);
> -		if (err && err != -EINVAL) {
> -			dev_err(dev, "%s: failed to read %s\n",
> -					__func__, prop_name);
> -			goto out;
> -		} else if (err == -EINVAL || !vreg->max_uA) {
> -			if (regulator_count_voltages(vreg->reg) > 0) {
> -				dev_err(dev, "%s: %s is mandatory\n",
> -						__func__, prop_name);
> -				goto out;
> -			}
> -			err = 0;
> -		}
> -	}
> -
> -	if (!strcmp(name, "vdda-pll")) {
> -		vreg->max_uV = VDDA_PLL_MAX_UV;
> -		vreg->min_uV = VDDA_PLL_MIN_UV;
> -	} else if (!strcmp(name, "vdda-phy")) {
> -		vreg->max_uV = VDDA_PHY_MAX_UV;
> -		vreg->min_uV = VDDA_PHY_MIN_UV;
> -	} else if (!strcmp(name, "vddp-ref-clk")) {
> -		vreg->max_uV = VDDP_REF_CLK_MAX_UV;
> -		vreg->min_uV = VDDP_REF_CLK_MIN_UV;
> -	}
> -
> -out:
> -	return err;
> -}
> -
> -int ufs_qcom_phy_init_vregulators(struct ufs_qcom_phy *phy_common)
> -{
> -	int err;
> -
> -	err = ufs_qcom_phy_init_vreg(phy_common->dev, &phy_common->vdda_pll,
> -		"vdda-pll");
> -	if (err)
> -		goto out;
> -
> -	err = ufs_qcom_phy_init_vreg(phy_common->dev, &phy_common->vdda_phy,
> -		"vdda-phy");
> -
> -	if (err)
> -		goto out;
> -
> -	err = ufs_qcom_phy_init_vreg(phy_common->dev, &phy_common->vddp_ref_clk,
> -				     "vddp-ref-clk");
> -
> -out:
> -	return err;
> -}
> -EXPORT_SYMBOL_GPL(ufs_qcom_phy_init_vregulators);
> -
> -static int ufs_qcom_phy_cfg_vreg(struct device *dev,
> -			  struct ufs_qcom_phy_vreg *vreg, bool on)
> -{
> -	int ret = 0;
> -	struct regulator *reg = vreg->reg;
> -	const char *name = vreg->name;
> -	int min_uV;
> -	int uA_load;
> -
> -	if (regulator_count_voltages(reg) > 0) {
> -		min_uV = on ? vreg->min_uV : 0;
> -		ret = regulator_set_voltage(reg, min_uV, vreg->max_uV);
> -		if (ret) {
> -			dev_err(dev, "%s: %s set voltage failed, err=%d\n",
> -					__func__, name, ret);
> -			goto out;
> -		}
> -		uA_load = on ? vreg->max_uA : 0;
> -		ret = regulator_set_load(reg, uA_load);
> -		if (ret >= 0) {
> -			/*
> -			 * regulator_set_load() returns new regulator
> -			 * mode upon success.
> -			 */
> -			ret = 0;
> -		} else {
> -			dev_err(dev, "%s: %s set optimum mode(uA_load=%d) failed, err=%d\n",
> -					__func__, name, uA_load, ret);
> -			goto out;
> -		}
> -	}
> -out:
> -	return ret;
> -}
> -
> -static int ufs_qcom_phy_enable_vreg(struct device *dev,
> -			     struct ufs_qcom_phy_vreg *vreg)
> -{
> -	int ret = 0;
> -
> -	if (!vreg || vreg->enabled)
> -		goto out;
> -
> -	ret = ufs_qcom_phy_cfg_vreg(dev, vreg, true);
> -	if (ret) {
> -		dev_err(dev, "%s: ufs_qcom_phy_cfg_vreg() failed, err=%d\n",
> -			__func__, ret);
> -		goto out;
> -	}
> -
> -	ret = regulator_enable(vreg->reg);
> -	if (ret) {
> -		dev_err(dev, "%s: enable failed, err=%d\n",
> -				__func__, ret);
> -		goto out;
> -	}
> -
> -	vreg->enabled = true;
> -out:
> -	return ret;
> -}
> -
> -static int ufs_qcom_phy_enable_ref_clk(struct ufs_qcom_phy *phy)
> -{
> -	int ret = 0;
> -
> -	if (phy->is_ref_clk_enabled)
> -		goto out;
> -
> -	/*
> -	 * reference clock is propagated in a daisy-chained manner from
> -	 * source to phy, so ungate them at each stage.
> -	 */
> -	ret = clk_prepare_enable(phy->ref_clk_src);
> -	if (ret) {
> -		dev_err(phy->dev, "%s: ref_clk_src enable failed %d\n",
> -				__func__, ret);
> -		goto out;
> -	}
> -
> -	/*
> -	 * "ref_clk_parent" is optional clock hence make sure that clk reference
> -	 * is available before trying to enable the clock.
> -	 */
> -	if (phy->ref_clk_parent) {
> -		ret = clk_prepare_enable(phy->ref_clk_parent);
> -		if (ret) {
> -			dev_err(phy->dev, "%s: ref_clk_parent enable failed %d\n",
> -					__func__, ret);
> -			goto out_disable_src;
> -		}
> -	}
> -
> -	ret = clk_prepare_enable(phy->ref_clk);
> -	if (ret) {
> -		dev_err(phy->dev, "%s: ref_clk enable failed %d\n",
> -				__func__, ret);
> -		goto out_disable_parent;
> -	}
> -
> -	phy->is_ref_clk_enabled = true;
> -	goto out;
> -
> -out_disable_parent:
> -	if (phy->ref_clk_parent)
> -		clk_disable_unprepare(phy->ref_clk_parent);
> -out_disable_src:
> -	clk_disable_unprepare(phy->ref_clk_src);
> -out:
> -	return ret;
> -}
> -
> -static int ufs_qcom_phy_disable_vreg(struct device *dev,
> -			      struct ufs_qcom_phy_vreg *vreg)
> -{
> -	int ret = 0;
> -
> -	if (!vreg || !vreg->enabled)
> -		goto out;
> -
> -	ret = regulator_disable(vreg->reg);
> -
> -	if (!ret) {
> -		/* ignore errors on applying disable config */
> -		ufs_qcom_phy_cfg_vreg(dev, vreg, false);
> -		vreg->enabled = false;
> -	} else {
> -		dev_err(dev, "%s: %s disable failed, err=%d\n",
> -				__func__, vreg->name, ret);
> -	}
> -out:
> -	return ret;
> -}
> -
> -static void ufs_qcom_phy_disable_ref_clk(struct ufs_qcom_phy *phy)
> -{
> -	if (phy->is_ref_clk_enabled) {
> -		clk_disable_unprepare(phy->ref_clk);
> -		/*
> -		 * "ref_clk_parent" is optional clock hence make sure that clk
> -		 * reference is available before trying to disable the clock.
> -		 */
> -		if (phy->ref_clk_parent)
> -			clk_disable_unprepare(phy->ref_clk_parent);
> -		clk_disable_unprepare(phy->ref_clk_src);
> -		phy->is_ref_clk_enabled = false;
> -	}
> -}
> -
> -/* Turn ON M-PHY RMMI interface clocks */
> -static int ufs_qcom_phy_enable_iface_clk(struct ufs_qcom_phy *phy)
> -{
> -	int ret = 0;
> -
> -	if (phy->is_iface_clk_enabled)
> -		goto out;
> -
> -	ret = clk_prepare_enable(phy->tx_iface_clk);
> -	if (ret) {
> -		dev_err(phy->dev, "%s: tx_iface_clk enable failed %d\n",
> -				__func__, ret);
> -		goto out;
> -	}
> -	ret = clk_prepare_enable(phy->rx_iface_clk);
> -	if (ret) {
> -		clk_disable_unprepare(phy->tx_iface_clk);
> -		dev_err(phy->dev, "%s: rx_iface_clk enable failed %d. disabling also tx_iface_clk\n",
> -				__func__, ret);
> -		goto out;
> -	}
> -	phy->is_iface_clk_enabled = true;
> -
> -out:
> -	return ret;
> -}
> -
> -/* Turn OFF M-PHY RMMI interface clocks */
> -static void ufs_qcom_phy_disable_iface_clk(struct ufs_qcom_phy *phy)
> -{
> -	if (phy->is_iface_clk_enabled) {
> -		clk_disable_unprepare(phy->tx_iface_clk);
> -		clk_disable_unprepare(phy->rx_iface_clk);
> -		phy->is_iface_clk_enabled = false;
> -	}
> -}
> -
> -static int ufs_qcom_phy_start_serdes(struct ufs_qcom_phy *ufs_qcom_phy)
> -{
> -	int ret = 0;
> -
> -	if (!ufs_qcom_phy->phy_spec_ops->start_serdes) {
> -		dev_err(ufs_qcom_phy->dev, "%s: start_serdes() callback is not supported\n",
> -			__func__);
> -		ret = -ENOTSUPP;
> -	} else {
> -		ufs_qcom_phy->phy_spec_ops->start_serdes(ufs_qcom_phy);
> -	}
> -
> -	return ret;
> -}
> -
> -int ufs_qcom_phy_set_tx_lane_enable(struct phy *generic_phy, u32 tx_lanes)
> -{
> -	struct ufs_qcom_phy *ufs_qcom_phy = get_ufs_qcom_phy(generic_phy);
> -	int ret = 0;
> -
> -	if (!ufs_qcom_phy->phy_spec_ops->set_tx_lane_enable) {
> -		dev_err(ufs_qcom_phy->dev, "%s: set_tx_lane_enable() callback is not supported\n",
> -			__func__);
> -		ret = -ENOTSUPP;
> -	} else {
> -		ufs_qcom_phy->phy_spec_ops->set_tx_lane_enable(ufs_qcom_phy,
> -							       tx_lanes);
> -	}
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL_GPL(ufs_qcom_phy_set_tx_lane_enable);
> -
> -void ufs_qcom_phy_save_controller_version(struct phy *generic_phy,
> -					  u8 major, u16 minor, u16 step)
> -{
> -	struct ufs_qcom_phy *ufs_qcom_phy = get_ufs_qcom_phy(generic_phy);
> -
> -	ufs_qcom_phy->host_ctrl_rev_major = major;
> -	ufs_qcom_phy->host_ctrl_rev_minor = minor;
> -	ufs_qcom_phy->host_ctrl_rev_step = step;
> -}
> -EXPORT_SYMBOL_GPL(ufs_qcom_phy_save_controller_version);
> -
> -static int ufs_qcom_phy_is_pcs_ready(struct ufs_qcom_phy *ufs_qcom_phy)
> -{
> -	if (!ufs_qcom_phy->phy_spec_ops->is_physical_coding_sublayer_ready) {
> -		dev_err(ufs_qcom_phy->dev, "%s: is_physical_coding_sublayer_ready() callback is not supported\n",
> -			__func__);
> -		return -ENOTSUPP;
> -	}
> -
> -	return ufs_qcom_phy->phy_spec_ops->
> -			is_physical_coding_sublayer_ready(ufs_qcom_phy);
> -}
> -
> -int ufs_qcom_phy_power_on(struct phy *generic_phy)
> -{
> -	struct ufs_qcom_phy *phy_common = get_ufs_qcom_phy(generic_phy);
> -	struct device *dev = phy_common->dev;
> -	bool is_rate_B = false;
> -	int err;
> -
> -	err = ufs_qcom_phy_get_reset(phy_common);
> -	if (err)
> -		return err;
> -
> -	err = reset_control_assert(phy_common->ufs_reset);
> -	if (err)
> -		return err;
> -
> -	if (phy_common->mode == PHY_MODE_UFS_HS_B)
> -		is_rate_B = true;
> -
> -	err = phy_common->phy_spec_ops->calibrate(phy_common, is_rate_B);
> -	if (err)
> -		return err;
> -
> -	err = reset_control_deassert(phy_common->ufs_reset);
> -	if (err) {
> -		dev_err(dev, "Failed to assert UFS PHY reset");
> -		return err;
> -	}
> -
> -	err = ufs_qcom_phy_start_serdes(phy_common);
> -	if (err)
> -		return err;
> -
> -	err = ufs_qcom_phy_is_pcs_ready(phy_common);
> -	if (err)
> -		return err;
> -
> -	err = ufs_qcom_phy_enable_vreg(dev, &phy_common->vdda_phy);
> -	if (err) {
> -		dev_err(dev, "%s enable vdda_phy failed, err=%d\n",
> -			__func__, err);
> -		goto out;
> -	}
> -
> -	phy_common->phy_spec_ops->power_control(phy_common, true);
> -
> -	/* vdda_pll also enables ref clock LDOs so enable it first */
> -	err = ufs_qcom_phy_enable_vreg(dev, &phy_common->vdda_pll);
> -	if (err) {
> -		dev_err(dev, "%s enable vdda_pll failed, err=%d\n",
> -			__func__, err);
> -		goto out_disable_phy;
> -	}
> -
> -	err = ufs_qcom_phy_enable_iface_clk(phy_common);
> -	if (err) {
> -		dev_err(dev, "%s enable phy iface clock failed, err=%d\n",
> -			__func__, err);
> -		goto out_disable_pll;
> -	}
> -
> -	err = ufs_qcom_phy_enable_ref_clk(phy_common);
> -	if (err) {
> -		dev_err(dev, "%s enable phy ref clock failed, err=%d\n",
> -			__func__, err);
> -		goto out_disable_iface_clk;
> -	}
> -
> -	/* enable device PHY ref_clk pad rail */
> -	if (phy_common->vddp_ref_clk.reg) {
> -		err = ufs_qcom_phy_enable_vreg(dev,
> -					       &phy_common->vddp_ref_clk);
> -		if (err) {
> -			dev_err(dev, "%s enable vddp_ref_clk failed, err=%d\n",
> -				__func__, err);
> -			goto out_disable_ref_clk;
> -		}
> -	}
> -
> -	goto out;
> -
> -out_disable_ref_clk:
> -	ufs_qcom_phy_disable_ref_clk(phy_common);
> -out_disable_iface_clk:
> -	ufs_qcom_phy_disable_iface_clk(phy_common);
> -out_disable_pll:
> -	ufs_qcom_phy_disable_vreg(dev, &phy_common->vdda_pll);
> -out_disable_phy:
> -	ufs_qcom_phy_disable_vreg(dev, &phy_common->vdda_phy);
> -out:
> -	return err;
> -}
> -EXPORT_SYMBOL_GPL(ufs_qcom_phy_power_on);
> -
> -int ufs_qcom_phy_power_off(struct phy *generic_phy)
> -{
> -	struct ufs_qcom_phy *phy_common = get_ufs_qcom_phy(generic_phy);
> -
> -	phy_common->phy_spec_ops->power_control(phy_common, false);
> -
> -	if (phy_common->vddp_ref_clk.reg)
> -		ufs_qcom_phy_disable_vreg(phy_common->dev,
> -					  &phy_common->vddp_ref_clk);
> -	ufs_qcom_phy_disable_ref_clk(phy_common);
> -	ufs_qcom_phy_disable_iface_clk(phy_common);
> -
> -	ufs_qcom_phy_disable_vreg(phy_common->dev, &phy_common->vdda_pll);
> -	ufs_qcom_phy_disable_vreg(phy_common->dev, &phy_common->vdda_phy);
> -	reset_control_assert(phy_common->ufs_reset);
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(ufs_qcom_phy_power_off);
> -
> -MODULE_AUTHOR("Yaniv Gardi <ygardi@codeaurora.org>");
> -MODULE_AUTHOR("Vivek Gautam <vivek.gautam@codeaurora.org>");
> -MODULE_DESCRIPTION("Universal Flash Storage (UFS) QCOM PHY");
> -MODULE_LICENSE("GPL v2");
> -- 
> 2.26.2
> 
