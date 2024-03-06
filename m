Return-Path: <linux-arm-msm+bounces-13442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C178C873109
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 09:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 196BCB23BB2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 08:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB7E5D8EF;
	Wed,  6 Mar 2024 08:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="stq7j7xN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00105C8F9
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 08:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709714769; cv=none; b=fdYuMUwGZvVvjKqu+mPwsPM73mREKrZFvrQ3qnkzP2Jpcgds7Xx5gY2469QshQ+JQKolALN2xug7nvrifQtTMvsPqMz75xD5RYP5gwLUl3yz84tCU1yfjPJMXDxmzrNLaCwqnJkt51IF7/yQJlhzsv1o7UPC4sEVAaC+DCtyCfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709714769; c=relaxed/simple;
	bh=WZ5QWaUGozVJ8ytUqUbrYrimDXEqJpfu8iwzrJUMHD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tyr4p+OdZDXtfmPPQe4Z679IXbBhMCUMR/aggq3gAR7Vek9y+R6xarRB6/o2nIZ1BNon02RQv8kefCvgljy+8jyhwLSCCI/EHgK1N89jZnqvKzm78oVCYI3CM722WBPkEGgfzm80kp5iDu8xS+zc2oPVfCaprTK4IjLwDtQgnm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=stq7j7xN; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6093e067220so62495077b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 00:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709714765; x=1710319565; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GZ8J6OviUeTpQm6dGP0Uxk1HK+9lM/907YSJzRo6fBo=;
        b=stq7j7xNC9du9jMEReR0TWkvzFERBAQgyOsLOBNf+HY6duhA/sZjffiB+1bUV6YBpK
         5AFTfDwQAIS7wWZ8qGdWb1rhPu1qLHg/Fv81DFtd79GMDwZ5ciBWS2hRLqOlJU4LrzFy
         VR/xCrsrxYFbStYhN7ia27DGolFUoQZKroTVp/62rQG2CMXwnphbppZ8O/uiwqPfRhjm
         BBNmDdfgm+B2NxuVuxEgck5XJiq2pHzq0A3ZONmvNigyl3r8AHpLpw2BapqTGzTR1xdS
         SbfKczNvBluNL0VDlgJVeuxso0yuzkIaW3YznjjYQR1AxcaFtRJt8LD5ofTwAORIh33a
         /18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709714765; x=1710319565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZ8J6OviUeTpQm6dGP0Uxk1HK+9lM/907YSJzRo6fBo=;
        b=SlevFQ4nynD7Xpir7nOSf8+FGbLTRYxiYiBd+e49UUzaUI8LonzoM1U93SedI3umF7
         7M9dCo/AgRb067v0a/YfQtuulezi5lXQVGgnchapX7vD9Pv81tb02JmhKma4+tYXugJB
         xqpO5UpmFn+WXsUEkXBLWy+Pe4vZTN0auvxizFTMy8YOXqD7W3NGtCukdjn6Wd8yjLLf
         InlmjH7UwaW/CtCXWUHBZ46a2xLQPVmhyn7ex3OrlV1Po0F7uBjoeKV4eyEcJVBz28Om
         fxd6zgjREWrNWP92ICzjnG6E/heI1rDEWRYqXngeRf4qEol+Tb9TUXx1in5/67c+PNon
         tdOw==
X-Forwarded-Encrypted: i=1; AJvYcCV2gRleptmaIRsXLkcw9f1vpMcphozZdkOUKhZYRVy6zS5aRYYPSDrtDlWjHt8l+uNg7MooaYV2SozIt7r9KbE2fxP1A30AkqxYp4ZrSw==
X-Gm-Message-State: AOJu0YxdHkPYfqJuMVBFdvH3R9FFDtZ1xxhgzw+LpBCdwh4fUzhm3S7x
	5ITmDwCxvta5OdmAkyesLzg4fdf9ZOT2QZKbz/8dhKcKQ9KD8kfRd7zqxMTwuXXq+mb20LaY3kH
	eNfLysIt4ZGs0VjNyvF8ovMV1L+aMDDqlcwYb7w==
X-Google-Smtp-Source: AGHT+IHgK5ktzU0hIDw+cg2BlFwP4ErvqHs/4Ga8gvuEeKpVGdumpMC0Oev4zHBVsIK/5WTTrIxaOX6xIufivN/bwEo=
X-Received: by 2002:a81:9a09:0:b0:609:da4d:b2f with SMTP id
 r9-20020a819a09000000b00609da4d0b2fmr880038ywg.5.1709714764353; Wed, 06 Mar
 2024 00:46:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1709657858-8563-1-git-send-email-quic_sriramd@quicinc.com> <1709657858-8563-3-git-send-email-quic_sriramd@quicinc.com>
In-Reply-To: <1709657858-8563-3-git-send-email-quic_sriramd@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 10:45:52 +0200
Message-ID: <CAA8EJpoi0T-riqxbTzVymHwZmBHg5xO_Rwqy0ck-7cvGy291_A@mail.gmail.com>
Subject: Re: [RFC 2/3] USB: dwc3: qcom: Add support for firmware managed resources
To: Sriram Dash <quic_sriramd@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org, 
	kishon@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, quic_wcheng@quicinc.com, 
	Thinh.Nguyen@synopsys.com, p.zabel@pengutronix.de, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, quic_psodagud@quicinc.com, quic_nkela@quicinc.com, 
	manivannan.sadhasivam@linaro.org, ulf.hansson@linaro.org, 
	sudeep.holla@arm.com, quic_shazhuss@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Mar 2024 at 18:59, Sriram Dash <quic_sriramd@quicinc.com> wrote:
>
> Some target systems allow multiple resources to be managed by firmware.
> On these targets, tasks related to clocks, regulators, resets, and
> interconnects can be delegated to the firmware, while the remaining
> responsibilities are handled by Linux.
>
> The driver is responsible for managing multiple power domains and
> linking them to consumers as needed. Incase there is only single
> power domain, it is considered to be a standard GDSC hooked on to
> the qcom dt node which is read and assigned to device structure
> (by genpd framework) before the driver probe even begins.
>
> This differentiation logic allows the driver to determine whether
> device resources are managed by Linux or firmware, ensuring
> backward compatibility.
>
> Furthermore, minor cleanup is performed for the private data of
> the SNPS Femto PHY. However, ACPI handling is omitted due to the
> absence of clients on the ACPI side.
>
> Signed-off-by: Sriram Dash <quic_sriramd@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 290 ++++++++++++++++++++------
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 213 +++++++++++++++----
>  drivers/usb/dwc3/dwc3-qcom.c                  | 259 +++++++++++++++++------

Thank you for mixing three different drivers in a single patch. This
saves us from sending two more letters. In future please abstain from
doing that and group your changes logically and atomically. Although
QMP and SNPS PHYs are maintained within the same subsystem, changing
them are two separate patches, as the changes are similar but
unrelated.

>  3 files changed, 594 insertions(+), 168 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> index 8525393..1ac1b50 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
> @@ -21,6 +21,9 @@
>
>  #include "phy-qcom-qmp-common.h"
>
> +#include <linux/pm_opp.h>
> +#include <linux/pm_domain.h>
> +
>  #include "phy-qcom-qmp.h"
>  #include "phy-qcom-qmp-pcs-misc-v3.h"
>  #include "phy-qcom-qmp-pcs-misc-v4.h"
> @@ -1212,6 +1215,9 @@ struct qmp_phy_cfg {
>         unsigned int pcs_usb_offset;
>  };
>
> +#define DOMAIN_GENPD_TRANSFER                  0
> +#define DOMAIN_GENPD_CORE                      1

Why do you need them defined on a global level if later you copy
necessary data away from the list?

> +
>  struct qmp_usb {
>         struct device *dev;
>
> @@ -1236,6 +1242,19 @@ struct qmp_usb {
>         struct phy *phy;
>
>         struct clk_fixed_rate pipe_clk_fixed;
> +
> +       struct dev_pm_domain_list *pd_list;
> +       struct device *genpd_core;
> +       struct device *genpd_transfer;
> +
> +       bool fw_managed;
> +       /* separate resource management for fw_managed vs locally managed devices */
> +       struct qmp_usb_device_ops {

Do you see nested structure definitions in this file? I don't think so.

> +               int (*bus_resume_resource)(struct qmp_usb *qmp);
> +               int (*runtime_resume_resource)(struct qmp_usb *qmp);
> +               int (*bus_suspend_resource)(struct qmp_usb *qmp);
> +               int (*runtime_suspend_resource)(struct qmp_usb *qmp);
> +       } qmp_usb_device_ops;

Just ops, pm_ops or bus_pm_ops.

>  };
>
>  static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
> @@ -1598,6 +1617,41 @@ static const struct qmp_phy_cfg x1e80100_usb3_uniphy_cfg = {
>         .regs                   = qmp_v7_usb3phy_regs_layout,
>  };
>
> +static void qmp_fw_managed_domain_remove(struct qmp_usb *qmp)
> +{
> +       dev_pm_domain_detach_list(qmp->pd_list);

This looks like a candidate for devm_add_action_or_reset

> +}
> +
> +static int qmp_fw_managed_domain_init(struct qmp_usb *qmp)
> +{
> +       struct device *dev = qmp->dev;
> +       struct dev_pm_domain_attach_data pd_data = {
> +               .pd_flags       = PD_FLAG_NO_DEV_LINK,
> +               .pd_names       = (const char*[]) { "usb_transfer", "usb_core" },
> +               .num_pd_names   = 2,
> +       };

Can you pass an empty list instead? Or instead call
dev_pm_domain_attach twice, if you are not using the pd_list later on?

> +       int ret = 0;
> +
> +       if (!dev->pm_domain) {
> +               ret = dev_pm_domain_attach_list(dev, &pd_data, &qmp->pd_list);
> +               if (ret < 0) {
> +                       dev_err(dev, "domain attach failed %d)\n", ret);
> +                       return ret;
> +               }
> +
> +               qmp->genpd_transfer = qmp->pd_list->pd_devs[DOMAIN_GENPD_TRANSFER];
> +               qmp->genpd_core = qmp->pd_list->pd_devs[DOMAIN_GENPD_CORE];
> +
> +
> +               dev_dbg(dev, "domains attached successfully\n");
> +       } else {
> +               dev_dbg(dev, "domain attach fail\n");
> +               return -ENODEV;
> +       }
> +
> +       return 0;
> +}
> +
>  static int qmp_usb_serdes_init(struct qmp_usb *qmp)
>  {
>         const struct qmp_phy_cfg *cfg = qmp->cfg;
> @@ -1610,11 +1664,20 @@ static int qmp_usb_serdes_init(struct qmp_usb *qmp)
>         return 0;
>  }
>
> -static int qmp_usb_init(struct phy *phy)
> +static int fw_managed_ssphy_bus_init(struct qmp_usb *qmp)

Please take a look around. All functions have a common naming
structure, which you are not following. Please do not do that _ever_.

> +{
> +       int ret = 0;
> +
> +       ret = pm_runtime_get_sync(qmp->genpd_core);
> +       if (ret < 0)
> +               dev_err(qmp->dev, "Failed to enable fw managed resources");
> +
> +       return ret;
> +}
> +
> +static int locally_managed_ssphy_bus_init(struct qmp_usb *qmp)
>  {
> -       struct qmp_usb *qmp = phy_get_drvdata(phy);
>         const struct qmp_phy_cfg *cfg = qmp->cfg;
> -       void __iomem *pcs = qmp->pcs;
>         int ret;
>
>         ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
> @@ -1639,8 +1702,11 @@ static int qmp_usb_init(struct phy *phy)
>         if (ret)
>                 goto err_assert_reset;
>
> -       qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
> -
> +       ret = clk_prepare_enable(qmp->pipe_clk);
> +       if (ret) {
> +               dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
> +               return ret;
> +       }

Here (and further in the file) you are changing the order of SW_PWRDN
bit toggling and pipe_clk enablement / disablement. Is this a safe
change?
Have you tested it? If so, on which platforms?

>         return 0;
>
>  err_assert_reset:
> @@ -1651,11 +1717,22 @@ static int qmp_usb_init(struct phy *phy)
>         return ret;
>  }
>
> -static int qmp_usb_exit(struct phy *phy)
> +static int fw_managed_ssphy_bus_exit(struct qmp_usb *qmp)
> +{
> +       int ret = 0;
> +
> +       ret = pm_runtime_put_sync(qmp->genpd_core);
> +       if (ret < 0)
> +               dev_err(qmp->dev, "Failed to disable fw managed resources");
> +
> +       return 0;
> +}
> +
> +static int locally_managed_ssphy_bus_exit(struct qmp_usb *qmp)
>  {
> -       struct qmp_usb *qmp = phy_get_drvdata(phy);
>         const struct qmp_phy_cfg *cfg = qmp->cfg;
>
> +       clk_disable_unprepare(qmp->pipe_clk);
>         reset_control_bulk_assert(qmp->num_resets, qmp->resets);
>
>         clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
> @@ -1677,13 +1754,9 @@ static int qmp_usb_power_on(struct phy *phy)
>         unsigned int val;
>         int ret;
>
> -       qmp_usb_serdes_init(qmp);
> +       qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
>
> -       ret = clk_prepare_enable(qmp->pipe_clk);
> -       if (ret) {
> -               dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
> -               return ret;
> -       }
> +       qmp_usb_serdes_init(qmp);
>
>         /* Tx, Rx, and PCS configurations */
>         qmp_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
> @@ -1708,15 +1781,10 @@ static int qmp_usb_power_on(struct phy *phy)
>                                  PHY_INIT_COMPLETE_TIMEOUT);
>         if (ret) {
>                 dev_err(qmp->dev, "phy initialization timed-out\n");
> -               goto err_disable_pipe_clk;
> +               return ret;
>         }
>
>         return 0;
> -
> -err_disable_pipe_clk:
> -       clk_disable_unprepare(qmp->pipe_clk);
> -
> -       return ret;
>  }
>
>  static int qmp_usb_power_off(struct phy *phy)
> @@ -1724,8 +1792,6 @@ static int qmp_usb_power_off(struct phy *phy)
>         struct qmp_usb *qmp = phy_get_drvdata(phy);
>         const struct qmp_phy_cfg *cfg = qmp->cfg;
>
> -       clk_disable_unprepare(qmp->pipe_clk);
> -
>         /* PHY reset */
>         qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>
> @@ -1742,27 +1808,30 @@ static int qmp_usb_power_off(struct phy *phy)
>
>  static int qmp_usb_enable(struct phy *phy)
>  {
> +       struct qmp_usb *qmp = phy_get_drvdata(phy);
>         int ret;
>
> -       ret = qmp_usb_init(phy);
> +       ret = qmp->qmp_usb_device_ops.bus_resume_resource(qmp);
>         if (ret)
>                 return ret;
>
>         ret = qmp_usb_power_on(phy);
>         if (ret)
> -               qmp_usb_exit(phy);
> +               qmp->qmp_usb_device_ops.bus_suspend_resource(qmp);
>
>         return ret;
>  }
>
>  static int qmp_usb_disable(struct phy *phy)
>  {
> +       struct qmp_usb *qmp = phy_get_drvdata(phy);
>         int ret;
>
>         ret = qmp_usb_power_off(phy);
>         if (ret)
>                 return ret;
> -       return qmp_usb_exit(phy);
> +
> +       return qmp->qmp_usb_device_ops.bus_suspend_resource(qmp);
>  }
>
>  static int qmp_usb_set_mode(struct phy *phy, enum phy_mode mode, int submode)
> @@ -1828,6 +1897,25 @@ static void qmp_usb_disable_autonomous_mode(struct qmp_usb *qmp)
>         qphy_clrbits(pcs_usb, cfg->regs[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR], IRQ_CLEAR);
>  }
>
> +static int locally_managed_ssphy_runtime_exit(struct qmp_usb *qmp)
> +{
> +       clk_disable_unprepare(qmp->pipe_clk);
> +       clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
> +
> +       return 0;
> +}
> +
> +static int fw_managed_ssphy_runtime_exit(struct qmp_usb *qmp)
> +{
> +       int ret = 0;
> +
> +       ret = pm_runtime_put_sync(qmp->genpd_transfer);
> +       if (ret < 0)
> +               dev_err(qmp->dev, "Failed to disable fw managed resources");
> +
> +       return 0;
> +}
> +
>  static int __maybe_unused qmp_usb_runtime_suspend(struct device *dev)
>  {
>         struct qmp_usb *qmp = dev_get_drvdata(dev);
> @@ -1841,16 +1929,44 @@ static int __maybe_unused qmp_usb_runtime_suspend(struct device *dev)
>
>         qmp_usb_enable_autonomous_mode(qmp);
>
> -       clk_disable_unprepare(qmp->pipe_clk);
> -       clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
> +       qmp->qmp_usb_device_ops.runtime_suspend_resource(qmp);
>
>         return 0;
>  }
>
> +static int locally_managed_ssphy_runtime_init(struct qmp_usb *qmp)
> +{
> +       int ret = 0;
> +
> +       ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
> +       if (ret)
> +               return ret;
> +
> +       ret = clk_prepare_enable(qmp->pipe_clk);
> +       if (ret) {
> +               dev_err(qmp->dev, "pipe_clk enable failed, err=%d\n", ret);
> +               clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int fw_managed_ssphy_runtime_init(struct qmp_usb *qmp)
> +{
> +       int ret = 0;
> +
> +       ret = pm_runtime_get_sync(qmp->genpd_transfer);
> +       if (ret < 0)
> +               dev_err(qmp->dev, "Failed to enable fw managed resources");
> +
> +       return ret;
> +}
> +
>  static int __maybe_unused qmp_usb_runtime_resume(struct device *dev)
>  {
> +       int ret;
>         struct qmp_usb *qmp = dev_get_drvdata(dev);
> -       int ret = 0;
>
>         dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
>
> @@ -1859,17 +1975,10 @@ static int __maybe_unused qmp_usb_runtime_resume(struct device *dev)
>                 return 0;
>         }
>
> -       ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
> +       ret = qmp->qmp_usb_device_ops.runtime_resume_resource(qmp);
>         if (ret)
>                 return ret;
>
> -       ret = clk_prepare_enable(qmp->pipe_clk);
> -       if (ret) {
> -               dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
> -               clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
> -               return ret;
> -       }
> -
>         qmp_usb_disable_autonomous_mode(qmp);
>
>         return 0;
> @@ -2059,22 +2168,24 @@ static int qmp_usb_parse_dt_legacy(struct qmp_usb *qmp, struct device_node *np)
>                 qmp->pcs_misc = NULL;
>         }
>
> -       qmp->pipe_clk = devm_get_clk_from_child(dev, np, NULL);
> -       if (IS_ERR(qmp->pipe_clk)) {
> -               return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
> -                                    "failed to get pipe clock\n");
> -       }
> +       if (!qmp->fw_managed) {
> +               qmp->pipe_clk = devm_get_clk_from_child(dev, np, NULL);
> +               if (IS_ERR(qmp->pipe_clk)) {
> +                       return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
> +                                            "failed to get pipe clock\n");
> +               }
>
> -       ret = devm_clk_bulk_get_all(qmp->dev, &qmp->clks);
> -       if (ret < 0)
> -               return ret;
> +               ret = devm_clk_bulk_get_all(qmp->dev, &qmp->clks);
> +               if (ret < 0)
> +                       return ret;
>
> -       qmp->num_clks = ret;
> +               qmp->num_clks = ret;
>
> -       ret = qmp_usb_reset_init(qmp, usb3phy_legacy_reset_l,
> -                                ARRAY_SIZE(usb3phy_legacy_reset_l));
> -       if (ret)
> -               return ret;
> +               ret = qmp_usb_reset_init(qmp, usb3phy_legacy_reset_l,
> +                                        ARRAY_SIZE(usb3phy_legacy_reset_l));
> +               if (ret)
> +                       return ret;
> +       }
>
>         return 0;
>  }
> @@ -2104,21 +2215,23 @@ static int qmp_usb_parse_dt(struct qmp_usb *qmp)
>         qmp->tx = base + offs->tx;
>         qmp->rx = base + offs->rx;
>
> -       ret = qmp_usb_clk_init(qmp);
> -       if (ret)
> -               return ret;
> -
> -       qmp->pipe_clk = devm_clk_get(dev, "pipe");
> -       if (IS_ERR(qmp->pipe_clk)) {
> -               return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
> -                                    "failed to get pipe clock\n");
> +       if (!qmp->fw_managed) {
> +               ret = qmp_usb_clk_init(qmp);
> +               if (ret)
> +                       return ret;
> +
> +               qmp->pipe_clk = devm_clk_get(dev, "pipe");
> +               if (IS_ERR(qmp->pipe_clk)) {
> +                       return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
> +                                            "failed to get pipe clock\n");
> +               }
> +
> +               ret = qmp_usb_reset_init(qmp, usb3phy_reset_l,
> +                                        ARRAY_SIZE(usb3phy_reset_l));
> +               if (ret)
> +                       return ret;
>         }
>
> -       ret = qmp_usb_reset_init(qmp, usb3phy_reset_l,
> -                                ARRAY_SIZE(usb3phy_reset_l));
> -       if (ret)
> -               return ret;
> -
>         return 0;
>  }
>
> @@ -2140,9 +2253,36 @@ static int qmp_usb_probe(struct platform_device *pdev)
>         if (!qmp->cfg)
>                 return -EINVAL;
>
> -       ret = qmp_usb_vreg_init(qmp);
> -       if (ret)
> -               return ret;
> +       qmp->fw_managed  = device_property_read_bool(dev, "qmp,fw-managed");
> +       if (qmp->fw_managed) {
> +               ret = qmp_fw_managed_domain_init(qmp);
> +               if (ret) {
> +                       dev_err(dev, "Failed to init domains. Bail out");
> +                       return ret;
> +               }
> +
> +               qmp->qmp_usb_device_ops.bus_resume_resource =
> +                                               fw_managed_ssphy_bus_init;
> +               qmp->qmp_usb_device_ops.runtime_resume_resource =
> +                                               fw_managed_ssphy_runtime_init;
> +               qmp->qmp_usb_device_ops.bus_suspend_resource =
> +                                               fw_managed_ssphy_bus_exit;
> +               qmp->qmp_usb_device_ops.runtime_suspend_resource =
> +                                               fw_managed_ssphy_runtime_exit;

Use a pointer to ops and constant data instead of setting function
pointers manually.

> +       } else {
> +               ret = qmp_usb_vreg_init(qmp);
> +               if (ret)
> +                       return ret;
> +
> +               qmp->qmp_usb_device_ops.bus_resume_resource =
> +                                               locally_managed_ssphy_bus_init;
> +               qmp->qmp_usb_device_ops.runtime_resume_resource =
> +                                               locally_managed_ssphy_runtime_init;
> +               qmp->qmp_usb_device_ops.bus_suspend_resource =
> +                                               locally_managed_ssphy_bus_exit;
> +               qmp->qmp_usb_device_ops.runtime_suspend_resource =
> +                                               locally_managed_ssphy_runtime_exit;
> +       }
>
>         /* Check for legacy binding with child node. */
>         np = of_get_next_available_child(dev->of_node, NULL);
> @@ -2165,9 +2305,11 @@ static int qmp_usb_probe(struct platform_device *pdev)
>          */
>         pm_runtime_forbid(dev);
>
> -       ret = phy_pipe_clk_register(qmp, np);
> -       if (ret)
> -               goto err_node_put;
> +       if (!qmp->fw_managed) {
> +               ret = phy_pipe_clk_register(qmp, np);
> +               if (ret)
> +                       goto err_node_put;

pipe_clk is an input to the GCC. If you are not registering it here,
how would GCC get it?

> +       }
>
>         qmp->phy = devm_phy_create(dev, np, &qmp_usb_phy_ops);
>         if (IS_ERR(qmp->phy)) {
> @@ -2186,9 +2328,22 @@ static int qmp_usb_probe(struct platform_device *pdev)
>
>  err_node_put:
>         of_node_put(np);
> +       if (qmp->fw_managed)
> +               qmp_fw_managed_domain_remove(qmp);
>         return ret;
>  }
>
> +static void qmp_usb_remove(struct platform_device *pdev)
> +{
> +       struct qmp_usb *qmp = platform_get_drvdata(pdev);
> +
> +       if (qmp->fw_managed) {
> +               pm_runtime_put_sync(qmp->genpd_core);
> +               qmp_fw_managed_domain_remove(qmp);
> +       }
> +}
> +
> +
>  static const struct of_device_id qmp_usb_of_match_table[] = {
>         {
>                 .compatible = "qcom,ipq6018-qmp-usb3-phy",
> @@ -2239,6 +2394,7 @@ MODULE_DEVICE_TABLE(of, qmp_usb_of_match_table);
>
>  static struct platform_driver qmp_usb_driver = {
>         .probe          = qmp_usb_probe,
> +       .remove_new     = qmp_usb_remove,
>         .driver = {
>                 .name   = "qcom-qmp-usb-phy",
>                 .pm     = &qmp_usb_pm_ops,
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> index eb0b0f6..9a1377f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> @@ -17,6 +17,9 @@
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>
> +#include <linux/pm_opp.h>
> +#include <linux/pm_domain.h>
> +
>  #define USB2_PHY_USB_PHY_UTMI_CTRL0            (0x3c)
>  #define SLEEPM                                 BIT(0)
>  #define OPMODE_MASK                            GENMASK(4, 3)
> @@ -89,7 +92,7 @@ struct override_param {
>         u8      reg_val;
>  };
>
> -struct override_param_map {
> +struct snps_femto_v2_priv_data {
>         const char *prop_name;
>         const struct override_param *param_table;
>         u8 table_size;
> @@ -106,6 +109,9 @@ struct phy_override_seq {
>
>  #define NUM_HSPHY_TUNING_PARAMS        (9)
>
> +#define DOMAIN_GENPD_TRANSFER                  0
> +#define DOMAIN_GENPD_CORE                      1

You guessed it, see my comments for the QMP PHY changes.

> +
>  /**
>   * struct qcom_snps_hsphy - snps hs phy attributes
>   *
> @@ -136,8 +142,54 @@ struct qcom_snps_hsphy {
>         bool phy_initialized;
>         enum phy_mode mode;
>         struct phy_override_seq update_seq_cfg[NUM_HSPHY_TUNING_PARAMS];
> +
> +       struct dev_pm_domain_list *pd_list;
> +       struct device *genpd_core;
> +       struct device *genpd_transfer;
> +
> +       bool fw_managed;
> +       /* separate resource management for fw_managed vs locally managed devices */
> +       struct snps_femto_v2_device_ops {
> +               int (*resume_resource)(struct qcom_snps_hsphy *hsphy);
> +               int (*suspend_resource)(struct qcom_snps_hsphy *hsphy);
> +       } snps_femto_v2_device_ops;
> +
>  };
>
> +static void hsphy_fw_managed_domain_remove(struct qcom_snps_hsphy *hsphy)

qcom_snps_hsphy_ prefix.

> +{
> +       dev_pm_domain_detach_list(hsphy->pd_list);
> +}
> +
> +static int hsphy_fw_managed_domain_init(struct qcom_snps_hsphy *hsphy)
> +{
> +       struct device *dev = hsphy->dev;
> +       struct dev_pm_domain_attach_data pd_data = {
> +               .pd_flags       = PD_FLAG_NO_DEV_LINK,
> +               .pd_names       = (const char*[]) { "usb_transfer", "usb_core" },
> +               .num_pd_names   = 2,
> +       };
> +       int ret = 0;
> +
> +       if (!dev->pm_domain) {
> +               ret = dev_pm_domain_attach_list(dev, &pd_data, &hsphy->pd_list);
> +               if (ret < 0) {
> +                       dev_err(dev, "domain attach failed %d)\n", ret);
> +                       return ret;
> +               }
> +
> +               hsphy->genpd_transfer = hsphy->pd_list->pd_devs[DOMAIN_GENPD_TRANSFER];
> +               hsphy->genpd_core = hsphy->pd_list->pd_devs[DOMAIN_GENPD_CORE];
> +
> +               dev_dbg(dev, "domains attached successfully\n");
> +       } else {
> +               dev_dbg(dev, "domain attach fail\n");
> +               return -ENODEV;
> +       }
> +
> +       return 0;
> +}
> +
>  static int qcom_snps_hsphy_clk_init(struct qcom_snps_hsphy *hsphy)
>  {
>         struct device *dev = hsphy->dev;
> @@ -316,27 +368,27 @@ static const struct override_param ls_fs_output_impedance_sc7280[] = {
>         { 1310, 0 },
>  };
>
> -static const struct override_param_map sc7280_snps_7nm_phy[] = {
> +static const struct snps_femto_v2_priv_data sc7280_snps_7nm_phy[] = {

What does this have in common with the clocks / regulators being
fw-managed or not?

>         {
>                 "qcom,hs-disconnect-bp",
>                 hs_disconnect_sc7280,
>                 ARRAY_SIZE(hs_disconnect_sc7280),
>                 USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X0,
> -               HS_DISCONNECT_MASK
> +               HS_DISCONNECT_MASK,

Why? Does it require to be changed?

>         },
>         {
>                 "qcom,squelch-detector-bp",
>                 squelch_det_threshold_sc7280,
>                 ARRAY_SIZE(squelch_det_threshold_sc7280),
>                 USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X0,
> -               SQUELCH_DETECTOR_MASK
> +               SQUELCH_DETECTOR_MASK,
>         },
>         {
>                 "qcom,hs-amplitude-bp",
>                 hs_amplitude_sc7280,
>                 ARRAY_SIZE(hs_amplitude_sc7280),
>                 USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X1,
> -               HS_AMPLITUDE_MASK
> +               HS_AMPLITUDE_MASK,
>         },
>         {
>                 "qcom,pre-emphasis-duration-bp",
> @@ -357,14 +409,14 @@ static const struct override_param_map sc7280_snps_7nm_phy[] = {
>                 hs_rise_fall_time_sc7280,
>                 ARRAY_SIZE(hs_rise_fall_time_sc7280),
>                 USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X2,
> -               HS_RISE_FALL_MASK
> +               HS_RISE_FALL_MASK,
>         },
>         {
>                 "qcom,hs-crossover-voltage-microvolt",
>                 hs_crossover_voltage_sc7280,
>                 ARRAY_SIZE(hs_crossover_voltage_sc7280),
>                 USB2_PHY_USB_PHY_HS_PHY_OVERRIDE_X2,
> -               HS_CROSSOVER_VOLTAGE_MASK
> +               HS_CROSSOVER_VOLTAGE_MASK,
>         },
>         {
>                 "qcom,hs-output-impedance-micro-ohms",
> @@ -383,12 +435,31 @@ static const struct override_param_map sc7280_snps_7nm_phy[] = {
>         {},
>  };
>
> -static int qcom_snps_hsphy_init(struct phy *phy)
> +static int fw_managed_hsphy_init(struct qcom_snps_hsphy *hsphy)
>  {
> -       struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
> -       int ret, i;
> +       int ret = 0;

Why do you need a value here if later on you set it again?

>
> -       dev_vdbg(&phy->dev, "%s(): Initializing SNPS HS phy\n", __func__);
> +       ret = pm_runtime_get_sync(hsphy->genpd_core);
> +       if (ret < 0)
> +               dev_err(hsphy->dev, "Failed to enable fw managed resources");
> +
> +       return ret;
> +}
> +
> +static int fw_managed_hsphy_exit(struct qcom_snps_hsphy *hsphy)
> +{
> +       int ret = 0;
> +
> +       ret = pm_runtime_put_sync(hsphy->genpd_core);
> +       if (ret < 0)
> +               dev_err(hsphy->dev, "Failed to disable fw managed resources");
> +
> +       return 0;
> +}
> +
> +static int locally_managed_hsphy_init(struct qcom_snps_hsphy *hsphy)
> +{
> +       int ret;
>
>         ret = regulator_bulk_enable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
>         if (ret)
> @@ -396,13 +467,13 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>
>         ret = clk_bulk_prepare_enable(hsphy->num_clks, hsphy->clks);
>         if (ret) {
> -               dev_err(&phy->dev, "failed to enable clocks, %d\n", ret);
> +               dev_err(hsphy->dev, "failed to enable clocks, %d\n", ret);
>                 goto poweroff_phy;
>         }
>
>         ret = reset_control_assert(hsphy->phy_reset);
>         if (ret) {
> -               dev_err(&phy->dev, "failed to assert phy_reset, %d\n", ret);
> +               dev_err(hsphy->dev, "failed to assert phy_reset, %d\n", ret);
>                 goto disable_clks;
>         }
>
> @@ -410,10 +481,42 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>
>         ret = reset_control_deassert(hsphy->phy_reset);
>         if (ret) {
> -               dev_err(&phy->dev, "failed to de-assert phy_reset, %d\n", ret);
> +               dev_err(hsphy->dev, "failed to de-assert phy_reset, %d\n", ret);
>                 goto disable_clks;
>         }
>
> +       return 0;
> +
> +disable_clks:
> +       clk_bulk_disable_unprepare(hsphy->num_clks, hsphy->clks);
> +poweroff_phy:
> +       regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
> +
> +       return ret;
> +}
> +
> +static int locally_managed_hsphy_exit(struct qcom_snps_hsphy *hsphy)
> +{
> +       reset_control_assert(hsphy->phy_reset);
> +       clk_bulk_disable_unprepare(hsphy->num_clks, hsphy->clks);
> +       regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
> +
> +       return 0;
> +}
> +
> +static int qcom_snps_hsphy_init(struct phy *phy)
> +{
> +       struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
> +       int ret, i;
> +
> +       dev_vdbg(&phy->dev, "%s(): Initializing SNPS HS phy\n", __func__);
> +
> +       ret = hsphy->snps_femto_v2_device_ops.resume_resource(hsphy);
> +       if (ret) {
> +               dev_err(&phy->dev, "Error resumeing hsphy resources %d\n", ret);
> +               return ret;
> +       }
> +
>         qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
>                                         UTMI_PHY_CMN_CTRL_OVERRIDE_EN,
>                                         UTMI_PHY_CMN_CTRL_OVERRIDE_EN);
> @@ -467,22 +570,19 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>         hsphy->phy_initialized = true;
>
>         return 0;
> -
> -disable_clks:
> -       clk_bulk_disable_unprepare(hsphy->num_clks, hsphy->clks);
> -poweroff_phy:
> -       regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
> -
> -       return ret;
>  }
>
>  static int qcom_snps_hsphy_exit(struct phy *phy)
>  {
>         struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
> +       int ret = 0;
> +
> +       ret = hsphy->snps_femto_v2_device_ops.suspend_resource(hsphy);
> +       if (ret) {
> +               dev_err(&phy->dev, "Error suspending hsphy resources %d\n", ret);
> +               return ret;
> +       }
>
> -       reset_control_assert(hsphy->phy_reset);
> -       clk_bulk_disable_unprepare(hsphy->num_clks, hsphy->clks);
> -       regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
>         hsphy->phy_initialized = false;
>
>         return 0;
> @@ -497,7 +597,8 @@ static const struct phy_ops qcom_snps_hsphy_gen_ops = {
>
>  static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
>         { .compatible   = "qcom,sm8150-usb-hs-phy", },
> -       { .compatible   = "qcom,usb-snps-hs-5nm-phy", },
> +       { .compatible   = "qcom,sa8775p-usb-hs-phy", },
> +       { .compatible   = "qcom,sc8280xp-usb-hs-phy", },

WTF? Please keep the fallback entry in place. It looks to me that
somebody didn't read documentation on the OF device matching. Please
read the code first.

>         {
>                 .compatible     = "qcom,usb-snps-hs-7nm-phy",
>                 .data           = &sc7280_snps_7nm_phy,
> @@ -513,7 +614,7 @@ static const struct dev_pm_ops qcom_snps_hsphy_pm_ops = {
>  };
>
>  static void qcom_snps_hsphy_override_param_update_val(
> -                       const struct override_param_map map,
> +                       const struct snps_femto_v2_priv_data map,
>                         s32 dt_val, struct phy_override_seq *seq_entry)
>  {
>         int i;
> @@ -541,7 +642,7 @@ static void qcom_snps_hsphy_read_override_param_seq(struct device *dev)
>         s32 val;
>         int ret, i;
>         struct qcom_snps_hsphy *hsphy;
> -       const struct override_param_map *cfg = of_device_get_match_data(dev);
> +       const struct snps_femto_v2_priv_data *cfg = of_device_get_match_data(dev);
>
>         if (!cfg)
>                 return;
> @@ -580,24 +681,39 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>         if (IS_ERR(hsphy->base))
>                 return PTR_ERR(hsphy->base);
>
> -       ret = qcom_snps_hsphy_clk_init(hsphy);
> -       if (ret)
> -               return dev_err_probe(dev, ret, "failed to initialize clocks\n");
>
> -       hsphy->phy_reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> -       if (IS_ERR(hsphy->phy_reset)) {
> -               dev_err(dev, "failed to get phy core reset\n");
> -               return PTR_ERR(hsphy->phy_reset);
> -       }
> +       hsphy->fw_managed  = device_property_read_bool(dev, "hsphy,fw-managed");
> +       if (hsphy->fw_managed) {
> +               ret = hsphy_fw_managed_domain_init(hsphy);
> +               if (ret) {
> +                       dev_err(dev, "Failed to init domains. Bail out");
> +                       return ret;
> +               }
>
> -       num = ARRAY_SIZE(hsphy->vregs);
> -       for (i = 0; i < num; i++)
> -               hsphy->vregs[i].supply = qcom_snps_hsphy_vreg_names[i];
> +               hsphy->snps_femto_v2_device_ops.resume_resource = fw_managed_hsphy_init;
> +               hsphy->snps_femto_v2_device_ops.suspend_resource = fw_managed_hsphy_exit;
> +       } else {
> +               ret = qcom_snps_hsphy_clk_init(hsphy);
> +               if (ret)
> +                       return dev_err_probe(dev, ret, "failed to initialize clocks\n");
>
> -       ret = devm_regulator_bulk_get(dev, num, hsphy->vregs);
> -       if (ret)
> -               return dev_err_probe(dev, ret,
> -                                    "failed to get regulator supplies\n");
> +               hsphy->phy_reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +               if (IS_ERR(hsphy->phy_reset)) {
> +                       dev_err(dev, "failed to get phy core reset\n");
> +                       return PTR_ERR(hsphy->phy_reset);
> +               }
> +
> +               num = ARRAY_SIZE(hsphy->vregs);
> +               for (i = 0; i < num; i++)
> +                       hsphy->vregs[i].supply = qcom_snps_hsphy_vreg_names[i];
> +
> +               ret = devm_regulator_bulk_get(dev, num, hsphy->vregs);
> +               if (ret)
> +                       return dev_err_probe(dev, ret,
> +                                            "failed to get regulator supplies\n");
> +               hsphy->snps_femto_v2_device_ops.resume_resource = locally_managed_hsphy_init;
> +               hsphy->snps_femto_v2_device_ops.suspend_resource = locally_managed_hsphy_exit;
> +       }
>
>         pm_runtime_set_active(dev);
>         pm_runtime_enable(dev);
> @@ -609,6 +725,8 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>
>         generic_phy = devm_phy_create(dev, NULL, &qcom_snps_hsphy_gen_ops);
>         if (IS_ERR(generic_phy)) {
> +               if (hsphy->fw_managed)
> +                       hsphy_fw_managed_domain_remove(hsphy);
>                 ret = PTR_ERR(generic_phy);
>                 dev_err(dev, "failed to create phy, %d\n", ret);
>                 return ret;
> @@ -628,8 +746,19 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>         return PTR_ERR_OR_ZERO(phy_provider);
>  }
>
> +static void qcom_snps_hsphy_remove(struct platform_device *pdev)
> +{
> +       struct qcom_snps_hsphy *hsphy = platform_get_drvdata(pdev);
> +
> +       if (hsphy->fw_managed) {
> +               pm_runtime_put_sync(hsphy->genpd_core);
> +               hsphy_fw_managed_domain_remove(hsphy);
> +       }
> +}
> +
>  static struct platform_driver qcom_snps_hsphy_driver = {
>         .probe          = qcom_snps_hsphy_probe,
> +       .remove_new     = qcom_snps_hsphy_remove,
>         .driver = {
>                 .name   = "qcom-snps-hs-femto-v2-phy",
>                 .pm = &qcom_snps_hsphy_pm_ops,
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index dbd6a5b..aea11d0 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -22,6 +22,8 @@
>  #include <linux/iopoll.h>
>  #include <linux/usb/hcd.h>
>  #include <linux/usb.h>
> +#include <linux/pm_opp.h>
> +#include <linux/pm_domain.h>
>  #include "core.h"
>
>  /* USB QSCRATCH Hardware registers */
> @@ -53,6 +55,9 @@
>  #define APPS_USB_AVG_BW 0
>  #define APPS_USB_PEAK_BW MBps_to_icc(40)
>
> +#define DOMAIN_GENPD_TRANSFER                  0
> +#define DOMAIN_GENPD_CORE                      1

Same comments as before

> +
>  struct dwc3_acpi_pdata {
>         u32                     qscratch_base_offset;
>         u32                     qscratch_base_size;
> @@ -91,8 +96,54 @@ struct dwc3_qcom {
>         bool                    pm_suspended;
>         struct icc_path         *icc_path_ddr;
>         struct icc_path         *icc_path_apps;
> +
> +       struct dev_pm_domain_list *pd_list;
> +       struct device *genpd_core;
> +       struct device *genpd_transfer;
> +
> +       bool                    fw_managed;
> +       /* separate resource management for fw_managed vs locally managed devices */
> +       struct qcom_dwc3_device_ops {
> +               int (*resume_resource)(struct dwc3_qcom *qcom);
> +               void (*suspend_resource)(struct dwc3_qcom *qcom);
> +               void (*exit_resource)(struct dwc3_qcom *qcom);
> +       } qcom_dwc3_device_ops;
>  };
>
> +static void dwc3_qcom_fw_managed_domain_remove(struct dwc3_qcom *qcom)
> +{
> +       dev_pm_domain_detach_list(qcom->pd_list);
> +}
> +
> +static int dwc3_qcom_fw_managed_domain_init(struct dwc3_qcom *qcom)
> +{
> +       struct device *dev = qcom->dev;
> +       struct dev_pm_domain_attach_data pd_data = {
> +               .pd_flags       = PD_FLAG_NO_DEV_LINK,
> +               .pd_names       = (const char*[]) { "usb_transfer", "usb_core" },
> +               .num_pd_names   = 2,
> +       };
> +       int ret = 0;
> +
> +       if (!dev->pm_domain) {
> +               ret = dev_pm_domain_attach_list(dev, &pd_data, &qcom->pd_list);
> +               if (ret < 0) {
> +                       dev_err(dev, "domain attach failed %d)\n", ret);
> +                       return ret;
> +               }
> +
> +               qcom->genpd_transfer = qcom->pd_list->pd_devs[DOMAIN_GENPD_TRANSFER];
> +               qcom->genpd_core = qcom->pd_list->pd_devs[DOMAIN_GENPD_CORE];
> +
> +               dev_dbg(dev, "domains attached successfully\n");
> +       } else {
> +               dev_dbg(dev, "domain attach fail\n");
> +               return -ENODEV;
> +       }
> +
> +       return 0;
> +}
> +
>  static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32 val)
>  {
>         u32 reg;
> @@ -417,10 +468,87 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>         dwc3_qcom_enable_wakeup_irq(qcom->ss_phy_irq, 0);
>  }
>
> +static void locally_managed_exit_resource(struct dwc3_qcom *qcom)
> +{
> +       int i;
> +
> +       for (i = qcom->num_clocks - 1; i >= 0; i--) {
> +               clk_disable_unprepare(qcom->clks[i]);
> +               clk_put(qcom->clks[i]);
> +       }
> +       qcom->num_clocks = 0;
> +
> +       dwc3_qcom_interconnect_exit(qcom);
> +       reset_control_assert(qcom->resets);
> +}
> +
> +static void fw_managed_exit_resource(struct dwc3_qcom *qcom)
> +{
> +       int ret = 0;
> +
> +       ret = pm_runtime_put_sync(qcom->genpd_core);
> +
> +       if (ret < 0)
> +               dev_err(qcom->dev, "Failed to disable fw managed resources");
> +
> +       dwc3_qcom_fw_managed_domain_remove(qcom);
> +}
> +
> +static int locally_managed_resume_resource(struct dwc3_qcom *qcom)
> +{
> +       int ret, i;
> +
> +       for (i = 0; i < qcom->num_clocks; i++) {
> +               ret = clk_prepare_enable(qcom->clks[i]);
> +               if (ret < 0) {
> +                       while (--i >= 0)
> +                               clk_disable_unprepare(qcom->clks[i]);
> +                       return ret;
> +               }
> +       }
> +
> +       ret = dwc3_qcom_interconnect_enable(qcom);
> +       if (ret)
> +               dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
> +
> +       return 0;
> +}
> +
> +static int fw_managed_resume_resource(struct dwc3_qcom *qcom)
> +{
> +       int ret = 0;
> +
> +       ret = pm_runtime_get_sync(qcom->genpd_transfer);
> +       if (ret < 0)
> +               dev_err(qcom->dev, "Failed to enable fw managed resources");
> +
> +       return ret;
> +}
> +
> +static void locally_managed_suspend_resource(struct dwc3_qcom *qcom)
> +{
> +       int i, ret;
> +
> +       for (i = qcom->num_clocks - 1; i >= 0; i--)
> +               clk_disable_unprepare(qcom->clks[i]);
> +
> +       ret = dwc3_qcom_interconnect_disable(qcom);
> +       if (ret)
> +               dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
> +}
> +
> +static void fw_managed_suspend_resource(struct dwc3_qcom *qcom)
> +{
> +       int ret = 0;
> +
> +       ret = pm_runtime_put_sync(qcom->genpd_transfer);
> +       if (ret < 0)
> +               dev_err(qcom->dev, "Failed to disable fw managed resources");
> +}
> +
>  static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>  {
>         u32 val;
> -       int i, ret;
>
>         if (qcom->is_suspended)
>                 return 0;
> @@ -429,12 +557,7 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>         if (!(val & PWR_EVNT_LPM_IN_L2_MASK))
>                 dev_err(qcom->dev, "HS-PHY not in L2\n");
>
> -       for (i = qcom->num_clocks - 1; i >= 0; i--)
> -               clk_disable_unprepare(qcom->clks[i]);
> -
> -       ret = dwc3_qcom_interconnect_disable(qcom);
> -       if (ret)
> -               dev_warn(qcom->dev, "failed to disable interconnect: %d\n", ret);
> +       qcom->qcom_dwc3_device_ops.suspend_resource(qcom);

Does SCMI manage interconnects too?

>
>         /*
>          * The role is stable during suspend as role switching is done from a
> @@ -453,7 +576,6 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>  static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
>  {
>         int ret;
> -       int i;
>
>         if (!qcom->is_suspended)
>                 return 0;
> @@ -461,18 +583,9 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
>         if (dwc3_qcom_is_host(qcom) && wakeup)
>                 dwc3_qcom_disable_interrupts(qcom);
>
> -       for (i = 0; i < qcom->num_clocks; i++) {
> -               ret = clk_prepare_enable(qcom->clks[i]);
> -               if (ret < 0) {
> -                       while (--i >= 0)
> -                               clk_disable_unprepare(qcom->clks[i]);
> -                       return ret;
> -               }
> -       }
> -
> -       ret = dwc3_qcom_interconnect_enable(qcom);
> -       if (ret)
> -               dev_warn(qcom->dev, "failed to enable interconnect: %d\n", ret);
> +       ret = qcom->qcom_dwc3_device_ops.resume_resource(qcom);
> +       if (ret < 0)
> +               return ret;
>
>         /* Clear existing events from PHY related to L2 in/out */
>         dwc3_qcom_setbits(qcom->qscratch_base, PWR_EVNT_IRQ_STAT_REG,
> @@ -833,30 +946,54 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>                 }
>         }
>
> -       qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
> -       if (IS_ERR(qcom->resets)) {
> -               return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
> -                                    "failed to get resets\n");
> -       }
> +       qcom->fw_managed  = device_property_read_bool(dev, "qcom,fw-managed");
> +       if (qcom->fw_managed) {
> +               ret = dwc3_qcom_fw_managed_domain_init(qcom);
> +               if (ret) {
> +                       dev_err(dev, "Failed to init domains. Bail out\n");
> +                       return ret;
> +               }
> +               ret = pm_runtime_resume_and_get(qcom->genpd_core);
> +               if (ret < 0) {
> +                       dev_err(qcom->dev, "Failed to enable %s", __func__);
> +                       dwc3_qcom_fw_managed_domain_remove(qcom);
> +                       return ret;
> +               }
>
> -       ret = reset_control_assert(qcom->resets);
> -       if (ret) {
> -               dev_err(&pdev->dev, "failed to assert resets, err=%d\n", ret);
> -               return ret;
> -       }
> +               qcom->qcom_dwc3_device_ops.resume_resource = fw_managed_resume_resource;
> +               qcom->qcom_dwc3_device_ops.exit_resource = fw_managed_exit_resource;
> +               qcom->qcom_dwc3_device_ops.suspend_resource = fw_managed_suspend_resource;
> +       } else {
> +               qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
> +               if (IS_ERR(qcom->resets)) {
> +                       return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
> +                                            "failed to get resets\n");
> +               }
>
> -       usleep_range(10, 1000);
> +               ret = reset_control_assert(qcom->resets);
> +               if (ret) {
> +                       dev_err(&pdev->dev, "failed to assert resets, err=%d\n", ret);
> +                       return ret;
> +               }
>
> -       ret = reset_control_deassert(qcom->resets);
> -       if (ret) {
> -               dev_err(&pdev->dev, "failed to deassert resets, err=%d\n", ret);
> -               goto reset_assert;
> -       }
> +               usleep_range(10, 1000);
>
> -       ret = dwc3_qcom_clk_init(qcom, of_clk_get_parent_count(np));
> -       if (ret) {
> -               dev_err_probe(dev, ret, "failed to get clocks\n");
> -               goto reset_assert;
> +               ret = reset_control_deassert(qcom->resets);
> +               if (ret) {
> +                       dev_err(&pdev->dev, "failed to deassert resets, err=%d\n", ret);
> +                       goto reset_assert;
> +               }
> +
> +               ret = dwc3_qcom_clk_init(qcom, of_clk_get_parent_count(np));
> +               if (ret) {
> +                       dev_err_probe(dev, ret, "failed to get clocks\n");
> +                       goto reset_assert;
> +               }
> +
> +               //Map the functions here for suspend resume
> +               qcom->qcom_dwc3_device_ops.resume_resource = locally_managed_resume_resource;
> +               qcom->qcom_dwc3_device_ops.exit_resource = locally_managed_exit_resource;
> +               qcom->qcom_dwc3_device_ops.suspend_resource = locally_managed_suspend_resource;
>         }
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> @@ -916,9 +1053,11 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>                 goto free_urs;
>         }
>
> -       ret = dwc3_qcom_interconnect_init(qcom);
> -       if (ret)
> -               goto depopulate;
> +       if (!qcom->fw_managed) {
> +               ret = dwc3_qcom_interconnect_init(qcom);
> +               if (ret)
> +                       goto depopulate;
> +       }
>
>         qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
>
> @@ -928,8 +1067,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>
>         /* register extcon to override sw_vbus on Vbus change later */
>         ret = dwc3_qcom_register_extcon(qcom);
> -       if (ret)
> -               goto interconnect_exit;
> +       if (ret) {
> +               if (!qcom->fw_managed)
> +                       goto interconnect_exit;
> +               else
> +                       goto depopulate;
> +       }
>
>         wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
>         device_init_wakeup(&pdev->dev, wakeup_source);
> @@ -956,13 +1099,19 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>         if (qcom->urs_usb)
>                 dwc3_qcom_destroy_urs_usb_platdev(qcom->urs_usb);
>  clk_disable:
> -       for (i = qcom->num_clocks - 1; i >= 0; i--) {
> -               clk_disable_unprepare(qcom->clks[i]);
> -               clk_put(qcom->clks[i]);
> +       if (!qcom->fw_managed) {
> +               for (i = qcom->num_clocks - 1; i >= 0; i--) {
> +                       clk_disable_unprepare(qcom->clks[i]);
> +                       clk_put(qcom->clks[i]);
> +               }

Please stick to a single style. Either have ops and functions or
fw_managed checks through the code. Mixing both of them doesn't look
good.

>         }
>  reset_assert:
> -       reset_control_assert(qcom->resets);
> -
> +       if (qcom->fw_managed) {
> +               pm_runtime_put_sync(qcom->genpd_core);
> +               dwc3_qcom_fw_managed_domain_remove(qcom);
> +       } else {
> +               reset_control_assert(qcom->resets);
> +       }
>         return ret;
>  }
>
> @@ -971,7 +1120,6 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
>         struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
>         struct device_node *np = pdev->dev.of_node;
>         struct device *dev = &pdev->dev;
> -       int i;
>
>         if (np) {
>                 of_platform_depopulate(&pdev->dev);
> @@ -984,14 +1132,7 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
>         if (qcom->urs_usb)
>                 dwc3_qcom_destroy_urs_usb_platdev(qcom->urs_usb);
>
> -       for (i = qcom->num_clocks - 1; i >= 0; i--) {
> -               clk_disable_unprepare(qcom->clks[i]);
> -               clk_put(qcom->clks[i]);
> -       }
> -       qcom->num_clocks = 0;
> -
> -       dwc3_qcom_interconnect_exit(qcom);
> -       reset_control_assert(qcom->resets);
> +       qcom->qcom_dwc3_device_ops.exit_resource(qcom);
>
>         pm_runtime_allow(dev);
>         pm_runtime_disable(dev);
> --
> 2.7.4
>
>


-- 
With best wishes
Dmitry

