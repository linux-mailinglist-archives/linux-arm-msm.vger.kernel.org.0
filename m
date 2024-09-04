Return-Path: <linux-arm-msm+bounces-30790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 276BF96C6DF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 20:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61D3EB22367
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 18:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEFE1E1331;
	Wed,  4 Sep 2024 18:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sT2DyTsz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056451E00BD
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 18:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725476116; cv=none; b=K2AWfDXdkXwbOxMa9vLw4oZhFo6GvSEMk6LYV5LsYRsh3UyDZwpX8ptqOD1h2MFffGbDI6QtbP9TLUMA8Fzhbv+PV7nnxDBUX/JKP8GmxE3ajQ+GIHBV+bS1BtasC+SvZWmUAlrwvCwq78lAz1OaDKhWLMcAEjaSdTj9ByE/3eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725476116; c=relaxed/simple;
	bh=xyH6QfeKEcqi+ighZ1bR3+c3TUJ5S3B+Wd59sd5LGho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oR/Z5XnEpMGLmozfVqO5M+Lenf+uBYyE+vqX8XqfPbcsqzCb0R+mkosUeH+CrJGtQxQLhpiJXa/79w5D1BZNs/N84AZMumpsrnfA3DN6Wih4n21U1A1/dbot2o5KSNt3y95Sf7P8ghRS39bHoiLARCgtydF9iAe6QK7UB2JhAKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sT2DyTsz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-427fc97a88cso9710315e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 11:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725476112; x=1726080912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5BnJNWWxj9Y5CcR/wzSsqQQXnJ8gVicv7euXtJqtTNI=;
        b=sT2DyTszNAw1D3v0wjSOQ/t4eR/Xk1+0Z4RrEIhu/7g2P7E0rAdv3jNVbRj3QutTZU
         8rTyNE2Kpno+7GD1ZunL+qNTzx0sEy1NWxSlB6G3EFtxoHUvbkc+IwMxN+T5liUfHUrR
         ss8e/66UqUyXLxfa7KGEvvLPgwrUeCd4ed1gWL5mVRW22D6w5Zcv289ZzKglySxa5/9z
         QLHvCodKW9b/x4fpHgvmfgUDinMIEZ8RtNMBNBVHeRwfokPLBXptflWDCczJOu6anIdo
         Tpk0GoqkfAIpYdvYT7z4ZK+7vZ6FjIhy0UexsxXvPA5ck8k0j3pJclWmyrH77VWoV8R/
         gx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725476112; x=1726080912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BnJNWWxj9Y5CcR/wzSsqQQXnJ8gVicv7euXtJqtTNI=;
        b=rlrS5EUhO+cggs1Ob0NuLwVW8aABPUkTjhwL3x/6jGUthbWqWbuJilKU3lkR0Rtg3X
         NrBccJ+U6NJQpG7mCi0uW9MGtFOBe3fUthWYeNYpHm0yQAMjGMKakqWckHSRbigT9pnf
         AYvEyVGAN2ljzuqzGC4Y0SmJy7gUrJXcKhy9GkOKMWR/6jZRW2yf0V1XHHTnWdA36iUT
         tsbd/kFcQOphJrHofLyMa9hQ4jh7JIDyW98b5QntYlevgqzwwZwOnaRoB7OIR3Slm/bL
         ms23CMgFDtnM1wjE2NrBG7WtpnAvz8DmcKiuMGU7gggo/WzKnaBSZgKATMuwupBfZyyc
         ietQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTYWbZRFmO18l0H98mjkrv/BBt0VM2JtqudNpiDh8z3OZb7appmRBjHJt+xcJ38oKm5is0BOvlfv/WG9+m@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqt1BzvZYW+go2+thU2KB7QxQNZLRs6lpX4e35YpODdvmC9fxe
	bRbFr1CnLghIDg675TVmEAkaZ/i5+oYLYP2QaF2l90YOGeieImyMPUuaDgyfZsw=
X-Google-Smtp-Source: AGHT+IG9MzAiKjiiz8mSz1v+ffHxE0mtmepMzP466hIyOXTY314HonwSWI/rdMK63kivSXjoXq6sLg==
X-Received: by 2002:a5d:4c49:0:b0:374:b6f3:728d with SMTP id ffacd0b85a97d-37770c702famr2183950f8f.46.1725476112057;
        Wed, 04 Sep 2024 11:55:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c71140bbsm10351836f8f.110.2024.09.04.11.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 11:55:11 -0700 (PDT)
Date: Wed, 4 Sep 2024 21:55:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Yu Jiaoliang <yujiaoliang@vivo.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v1] soc: qcom: pbs: Simplify with dev_err_probe()
Message-ID: <6267a1fe-0073-4aca-ab19-a63a7565f116@stanley.mountain>
References: <20240829124813.3264437-1-yujiaoliang@vivo.com>
 <894145dc-46fb-451f-a461-d0b9ff1e50dd@kernel.org>
 <10fad15b-d2a6-4ec1-8af7-bde8f7bf39be@kernel.org>
 <63162b67-22ef-482f-9600-861e9dbaf4fc@stanley.mountain>
 <08e8f26a-d87e-4d3e-9896-b809d5f0c3a0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="BtPCO9uUB2+Ay3RA"
Content-Disposition: inline
In-Reply-To: <08e8f26a-d87e-4d3e-9896-b809d5f0c3a0@kernel.org>


--BtPCO9uUB2+Ay3RA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 30, 2024 at 05:31:14PM +0200, Konrad Dybcio wrote:
> > 
> > There are a few things which we could do:
> > 
> > 1) Returning -EPROBE_DEFER to an ioctl or something besides a probe()
> >    This is a bug right?  -EPROBE_DEFER is basically kernel internal for probe()
> >    functions.  It tried to write this but it was complicated so I gave up.
> 
> Maybe call_tree.pl can somehow be used with an if name[-5:] == "probe"
> or something along those lines..
> 

I wrote the call_tree.pl script before I had the database.  These days I tend to
use the database instead.

I've implemented this check but it only looks at ioctls.  I'll test it tonight.

> > 
> > 2) Printing an error message for -EPROBE_DEFER warnings
> >    I've written this check and I can test it tonight.
> > 

I've done this.  See the attached check and the dont_print.list file attached.
The line numbers are based on linux next.  The false positives from here are
pretty harmless because calling dev_err_probe() is fine.

> > 3) Not propagating the -EPROBE_DEFER returns
> >    This shouldn't be too hard to write.
> > 

I've done this too.  The false positives from this could be bad, because we only
want to propagate -EPROBE_DEFER back from probe() functions.

See propagate.list.

regards,
dan carpenter

--BtPCO9uUB2+Ay3RA
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="check_returning_EPROBE_DEFER.c"

/*
 * Copyright 2024 Linaro Ltd.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/copyleft/gpl.txt
 */

#include "smatch.h"
#include "smatch_slist.h"
#include "smatch_extra.h"

static int my_id;

static unsigned long is_ioctl;

static void function_start(struct symbol *sym)
{
	struct string_list *ptrs;
	char *ptr;

	ptrs = get_caller_ptrs(sym);
	FOR_EACH_PTR(ptrs, ptr) {
		if (strcmp(ptr, "(struct file_operations)->unlocked_ioctl") == 0 ||
		    strcmp(ptr, "(struct file_operations)->compat_ioctl") == 0) {
			is_ioctl = true;
			return;
		}
	} END_FOR_EACH_PTR(ptr);
}

static void match_return(struct expression *expr)
{
	char *name;

	if (!is_ioctl)
		return;
	if (!is_EPROBE_DEFER(expr))
		return;

	name = expr_to_str(expr);
	sm_warning("EPROBE_DEFER is only for probe functions '%s'", name);
	free_string(name);
}

void check_returning_EPROBE_DEFER(int id)
{
	my_id = id;

	if (option_project != PROJ_KERNEL)
		return;

	add_function_data(&is_ioctl);

	add_hook(&function_start, FUNC_DEF_HOOK);
	add_hook(&match_return, RETURN_HOOK);
}

--BtPCO9uUB2+Ay3RA
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="check_eprobe_defer_is_silent.c"

/*
 * Copyright 2023 Linaro Ltd.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/copyleft/gpl.txt
 */

#include "smatch.h"
#include "smatch_slist.h"
#include "smatch_extra.h"

static int my_id;

static struct statement *get_if_statement(struct expression *expr)
{
	struct statement *stmt, *parent;
	struct expression *tmp;
	int count = 0;

	stmt = get_parent_stmt(expr);
	if (!stmt)
		return NULL;
	stmt = stmt_get_parent_stmt(stmt);
	while (stmt &&
	       stmt->pos.line == expr->pos.line &&
	       stmt->pos.pos == expr->pos.pos) {
		if (count++ >= 5)
			break;
		parent = stmt_get_parent_stmt(stmt);
		if (!parent) {
			tmp = stmt_get_parent_expr(stmt);
			parent = get_parent_stmt(tmp);
		}
		stmt = parent;
	}

	if (!stmt)
		return NULL;
	if (stmt->type == STMT_COMPOUND)
		stmt = stmt_get_parent_stmt(stmt);
	if (!stmt || stmt->type != STMT_IF)
		return NULL;

	return stmt;
}

static struct expression *get_condition_var(struct expression *expr)
{
	expr = strip_expr(expr);

	if (expr->type == EXPR_COMPARE &&
	    (expr->op == SPECIAL_NOTEQUAL || expr->op == '<') &&
	    expr_is_zero(expr->right))
		return expr->left;

	return expr;
}

static void match_warn(const char *fn, struct expression *expr, void *_unused)
{
	struct statement *stmt;
	struct expression *var;

	stmt = get_if_statement(expr);
	if (!stmt)
		return;
	var = get_condition_var(stmt->if_conditional);
	if (!is_EPROBE_DEFER(var))
		return;

	sm_msg("EPROBE_DEFER path should not print warnings");
}

void check_eprobe_defer_is_silent(int id)
{
	const char *warn_fn[] = {
		"_dev_emerg", "_dev_crit", "_dev_alert", "_dev_err",
		"_dev_warn", "_dev_notice", "printk", "_printk"};
	int i;

	my_id = id;

	if (option_project != PROJ_KERNEL)
		return;

	for (i = 0; i < ARRAY_SIZE(warn_fn); i++)
		add_function_hook(warn_fn[i], &match_warn, NULL);
}

--BtPCO9uUB2+Ay3RA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dont_print.list"

drivers/rpmsg/rpmsg_core.c:569 rpmsg_dev_probe() EPROBE_DEFER path should not print warnings
drivers/platform/x86/x86-android-tablets/core.c:107 x86_acpi_irq_helper_get() EPROBE_DEFER path should not print warnings
drivers/platform/surface/surface_hotplug.c:237 surface_hotplug_probe() EPROBE_DEFER path should not print warnings
drivers/input/joystick/as5011.c:274 as5011_probe() EPROBE_DEFER path should not print warnings
drivers/input/keyboard/gpio_keys.c:551 gpio_keys_setup_key() EPROBE_DEFER path should not print warnings
drivers/input/keyboard/imx_sc_key.c:157 imx_sc_key_probe() EPROBE_DEFER path should not print warnings
drivers/input/keyboard/matrix_keypad.c:283 matrix_keypad_init_gpio() EPROBE_DEFER path should not print warnings
drivers/input/keyboard/matrix_keypad.c:296 matrix_keypad_init_gpio() EPROBE_DEFER path should not print warnings
drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c:174 sun8i_dw_hdmi_bind() EPROBE_DEFER path should not print warnings
drivers/gpu/drm/tegra/output.c:158 tegra_output_probe() EPROBE_DEFER path should not print warnings
drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:171 acp_genpd_add_device() EPROBE_DEFER path should not print warnings
drivers/gpu/drm/omapdrm/omap_drv.c:723 omapdrm_init() EPROBE_DEFER path should not print warnings
drivers/gpu/drm/i915/i915_driver.c:426 i915_pcode_init() EPROBE_DEFER path should not print warnings
drivers/gpu/drm/i915/intel_pcode.c:237 intel_pcode_init() EPROBE_DEFER path should not print warnings
drivers/gpu/drm/vc4/vc4_hdmi.c:2300 vc4_hdmi_audio_init() EPROBE_DEFER path should not print warnings
drivers/gpu/drm/bridge/sil-sii8620.c:2332 sii8620_probe() EPROBE_DEFER path should not print warnings
drivers/gpu/host1x/context.c:72 host1x_memory_context_list_init() EPROBE_DEFER path should not print warnings
drivers/gpu/host1x/dev.c:612 host1x_probe() EPROBE_DEFER path should not print warnings
drivers/tty/serial/serial_mctrl_gpio.c:243 mctrl_gpio_init() EPROBE_DEFER path should not print warnings
drivers/memory/samsung/exynos5422-dmc.c:1503 exynos5_dmc_probe() EPROBE_DEFER path should not print warnings
drivers/usb/common/usb-conn-gpio.c:229 usb_conn_probe() EPROBE_DEFER path should not print warnings
drivers/usb/common/usb-conn-gpio.c:246 usb_conn_probe() EPROBE_DEFER path should not print warnings
drivers/usb/misc/brcmstb-usb-pinmap.c:311 brcmstb_usb_pinmap_probe() EPROBE_DEFER path should not print warnings
drivers/usb/typec/tcpm/fusb302.c:1640 init_gpio() EPROBE_DEFER path should not print warnings
drivers/usb/typec/anx7411.c:1340 anx7411_get_gpio_irq() EPROBE_DEFER path should not print warnings
drivers/vfio/fsl-mc/vfio_fsl_mc.c:474 vfio_fsl_mc_init_device() EPROBE_DEFER path should not print warnings
drivers/extcon/extcon-usb-gpio.c:154 usb_extcon_probe() EPROBE_DEFER path should not print warnings
drivers/extcon/extcon-usb-gpio.c:172 usb_extcon_probe() EPROBE_DEFER path should not print warnings
drivers/extcon/extcon-max3355.c:93 max3355_probe() EPROBE_DEFER path should not print warnings
drivers/extcon/extcon-ptn5150.c:273 ptn5150_i2c_probe() EPROBE_DEFER path should not print warnings
drivers/extcon/extcon-palmas.c:287 palmas_usb_probe() EPROBE_DEFER path should not print warnings
drivers/extcon/extcon-palmas.c:338 palmas_usb_probe() EPROBE_DEFER path should not print warnings
drivers/extcon/extcon-intel-int3496.c:147 int3496_probe() EPROBE_DEFER path should not print warnings
drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c:347 ns2_drd_phy_probe() EPROBE_DEFER path should not print warnings
drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c:353 ns2_drd_phy_probe() EPROBE_DEFER path should not print warnings
drivers/phy/motorola/phy-mapphone-mdm6600.c:486 phy_mdm6600_deferred_power_on() EPROBE_DEFER path should not print warnings
drivers/soc/rockchip/io-domain.c:677 rockchip_iodomain_probe() EPROBE_DEFER path should not print warnings
drivers/hte/hte-tegra194-test.c:140 tegra_hte_test_probe() EPROBE_DEFER path should not print warnings
drivers/devfreq/devfreq.c:1318 devfreq_add_governor() EPROBE_DEFER path should not print warnings
drivers/devfreq/devfreq.c:1482 governor_store() EPROBE_DEFER path should not print warnings
drivers/devfreq/devfreq.c:1489 governor_store() EPROBE_DEFER path should not print warnings
drivers/devfreq/devfreq.c:1910 timer_store() EPROBE_DEFER path should not print warnings
drivers/devfreq/mtk-cci-devfreq.c:54 mtk_ccifreq_set_voltage() EPROBE_DEFER path should not print warnings
drivers/devfreq/mtk-cci-devfreq.c:60 mtk_ccifreq_set_voltage() EPROBE_DEFER path should not print warnings
drivers/devfreq/mtk-cci-devfreq.c:158 mtk_ccifreq_target() EPROBE_DEFER path should not print warnings
drivers/firmware/imx/imx-scu.c:333 imx_scu_probe() EPROBE_DEFER path should not print warnings
drivers/firmware/imx/imx-scu.c:337 imx_scu_probe() EPROBE_DEFER path should not print warnings
drivers/firmware/arm_scmi/driver.c:2708 scmi_txrx_setup() EPROBE_DEFER path should not print warnings
drivers/uio/uio_dfl.c:42 uio_dfl_probe() EPROBE_DEFER path should not print warnings
drivers/uio/uio_pdrv_genirq.c:250 uio_pdrv_genirq_probe() EPROBE_DEFER path should not print warnings
drivers/uio/uio_hv_generic.c:340 hv_uio_probe() EPROBE_DEFER path should not print warnings
drivers/nfc/nfcmrvl/main.c:121 nfcmrvl_nci_register_dev() EPROBE_DEFER path should not print warnings
drivers/net/wireless/intersil/p54/p54spi.c:613 p54spi_probe() EPROBE_DEFER path should not print warnings
drivers/net/wireless/intersil/p54/p54spi.c:619 p54spi_probe() EPROBE_DEFER path should not print warnings
drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c:542 stm32_dwmac_probe() EPROBE_DEFER path should not print warnings
drivers/net/ethernet/mellanox/mlx4/main.c:4013 mlx4_devlink_reload_up() EPROBE_DEFER path should not print warnings
drivers/net/ethernet/mellanox/mlx4/main.c:4263 mlx4_restart_one_up() EPROBE_DEFER path should not print warnings
drivers/net/ethernet/mellanox/mlx4/main.c:4400 mlx4_pci_resume() EPROBE_DEFER path should not print warnings
drivers/net/can/m_can/tcan4x5x-core.c:452 tcan4x5x_can_probe() EPROBE_DEFER path should not print warnings
drivers/cpufreq/scmi-cpufreq.c:388 scmi_cpufreq_probe() EPROBE_DEFER path should not print warnings
drivers/cpufreq/mediatek-cpufreq-hw.c:329 mtk_cpufreq_hw_driver_probe() EPROBE_DEFER path should not print warnings
drivers/cpufreq/amd-pstate.c:1948 amd_pstate_init() EPROBE_DEFER path should not print warnings
drivers/cpufreq/mediatek-cpufreq.c:89 mtk_cpufreq_voltage_tracking() EPROBE_DEFER path should not print warnings
drivers/cpufreq/mediatek-cpufreq.c:96 mtk_cpufreq_voltage_tracking() EPROBE_DEFER path should not print warnings
drivers/cpufreq/mediatek-cpufreq.c:224 mtk_cpufreq_set_target() EPROBE_DEFER path should not print warnings
drivers/cpufreq/mediatek-cpufreq.c:257 mtk_cpufreq_set_target() EPROBE_DEFER path should not print warnings
drivers/cpufreq/mediatek-cpufreq.c:299 mtk_cpufreq_set_target() EPROBE_DEFER path should not print warnings
drivers/cpufreq/mediatek-cpufreq.c:336 mtk_cpufreq_opp_notifier() EPROBE_DEFER path should not print warnings
drivers/cpufreq/qcom-cpufreq-hw.c:725 qcom_cpufreq_hw_driver_probe() EPROBE_DEFER path should not print warnings
drivers/cpufreq/cpufreq-dt.c:327 dt_cpufreq_probe() EPROBE_DEFER path should not print warnings
drivers/cpufreq/scpi-cpufreq.c:204 scpi_cpufreq_probe() EPROBE_DEFER path should not print warnings
drivers/media/platform/amphion/vpu_imx8q.c:206 vpu_imx8q_get_fuse() EPROBE_DEFER path should not print warnings
drivers/media/platform/mediatek/mdp/mtk_mdp_core.c:200 mtk_mdp_probe() EPROBE_DEFER path should not print warnings
drivers/media/platform/mediatek/mdp/mtk_mdp_vpu.c:69 mtk_mdp_vpu_register() EPROBE_DEFER path should not print warnings
drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c:1102 mtk_mdp_m2m_open() EPROBE_DEFER path should not print warnings
drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c:132 mdp_vpu_register() EPROBE_DEFER path should not print warnings
drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c:114 mdp_vpu_get_locked() EPROBE_DEFER path should not print warnings
drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c:169 mdp_m2m_start_streaming() EPROBE_DEFER path should not print warnings
drivers/media/platform/mediatek/vpu/mtk_vpu.c:875 mtk_vpu_probe() EPROBE_DEFER path should not print warnings
drivers/media/usb/em28xx/em28xx-dvb.c:742 em28xx_pctv_290e_set_lna() EPROBE_DEFER path should not print warnings
drivers/media/usb/em28xx/em28xx-dvb.c:1713 em28xx_dvb_init() EPROBE_DEFER path should not print warnings
drivers/media/dvb-frontends/tc90522.c:583 tc90522_sleep() EPROBE_DEFER path should not print warnings
drivers/media/dvb-frontends/tc90522.c:616 tc90522_init() EPROBE_DEFER path should not print warnings
drivers/media/pci/sta2x11/sta2x11_vip.c:902 vip_gpio_reserve() EPROBE_DEFER path should not print warnings
drivers/media/i2c/hi556.c:1336 hi556_probe() EPROBE_DEFER path should not print warnings
drivers/media/i2c/ov13b10.c:1505 ov13b10_probe() EPROBE_DEFER path should not print warnings
drivers/media/cec/platform/seco/seco-cec.c:549 secocec_acpi_probe() EPROBE_DEFER path should not print warnings
drivers/cxl/pci.c:840 cxl_pci_probe() EPROBE_DEFER path should not print warnings
drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c:847 gmin_v1p8_ctrl() EPROBE_DEFER path should not print warnings
drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c:928 gmin_v2p8_ctrl() EPROBE_DEFER path should not print warnings
drivers/bluetooth/hci_intel.c:1171 intel_probe() EPROBE_DEFER path should not print warnings
drivers/pci/controller/dwc/pcie-tegra194.c:2050 tegra_pcie_config_ep() EPROBE_DEFER path should not print warnings
drivers/regulator/vctrl-regulator.c:195 vctrl_set_voltage_sel() EPROBE_DEFER path should not print warnings
drivers/regulator/vctrl-regulator.c:502 vctrl_probe() EPROBE_DEFER path should not print warnings
drivers/regulator/max5970-regulator.c:634 max597x_regulator_probe() EPROBE_DEFER path should not print warnings
drivers/power/supply/olpc_battery.c:540 olpc_bat_eeprom_read() EPROBE_DEFER path should not print warnings
drivers/power/supply/lt3651-charger.c:159 lt3651_charger_probe() EPROBE_DEFER path should not print warnings
drivers/power/supply/lt3651-charger.c:169 lt3651_charger_probe() EPROBE_DEFER path should not print warnings
drivers/power/supply/lt3651-charger.c:179 lt3651_charger_probe() EPROBE_DEFER path should not print warnings
drivers/power/supply/sc27xx_fuel_gauge.c:1239 sc27xx_fgu_probe() EPROBE_DEFER path should not print warnings
drivers/mfd/arizona-irq.c:367 arizona_irq_init() EPROBE_DEFER path should not print warnings
drivers/mfd/aat2870-core.c:373 aat2870_i2c_probe() EPROBE_DEFER path should not print warnings
drivers/mfd/si476x-i2c.c:725 si476x_core_probe() EPROBE_DEFER path should not print warnings
drivers/mfd/wm8994-irq.c:211 wm8994_irq_init() EPROBE_DEFER path should not print warnings
drivers/hwtracing/intel_th/sth.c:230 intel_th_sth_probe() EPROBE_DEFER path should not print warnings
drivers/hwtracing/stm/ftrace.c:72 stm_ftrace_init() EPROBE_DEFER path should not print warnings
drivers/gpio/gpiolib-acpi.c:463 acpi_gpiochip_alloc_event() EPROBE_DEFER path should not print warnings
drivers/gpio/gpiolib.c:1386 gpiochip_set_hierarchical_irqchip() EPROBE_DEFER path should not print warnings
drivers/gpio/gpiolib.c:1466 gpiochip_hierarchy_irq_domain_alloc() EPROBE_DEFER path should not print warnings
drivers/iio/adc/stm32-adc-core.c:544 stm32_adc_core_hw_start() EPROBE_DEFER path should not print warnings
drivers/iio/adc/stm32-adc-core.c:652 stm32_adc_core_switches_probe() EPROBE_DEFER path should not print warnings
drivers/iio/adc/stm32-adc-core.c:773 stm32_adc_probe() EPROBE_DEFER path should not print warnings
drivers/iio/adc/meson_saradc.c:692 meson_sar_adc_iio_info_read_raw() EPROBE_DEFER path should not print warnings
drivers/iio/dac/ltc1660.c:62 ltc1660_read_raw() EPROBE_DEFER path should not print warnings
drivers/iio/dac/ad7293.c:845 ad7293_init() EPROBE_DEFER path should not print warnings
drivers/iio/dac/ad7293.c:854 ad7293_init() EPROBE_DEFER path should not print warnings
drivers/iio/dac/ad8801.c:139 ad8801_probe() EPROBE_DEFER path should not print warnings
drivers/iio/dac/ad8801.c:162 ad8801_probe() EPROBE_DEFER path should not print warnings
drivers/iio/dac/stm32-dac-core.c:135 stm32_dac_probe() EPROBE_DEFER path should not print warnings
drivers/iio/dac/ad5761.c:324 ad5761_get_vref() EPROBE_DEFER path should not print warnings
drivers/iio/dac/max5821.c:346 max5821_probe() EPROBE_DEFER path should not print warnings
drivers/iio/proximity/srf04.c:304 srf04_probe() EPROBE_DEFER path should not print warnings
drivers/iio/proximity/ping.c:121 ping_read() EPROBE_DEFER path should not print warnings
drivers/iio/light/gp2ap002.c:539 gp2ap002_probe() EPROBE_DEFER path should not print warnings
drivers/iio/humidity/dht11.c:311 dht11_probe() EPROBE_DEFER path should not print warnings
sound/soc/rockchip/rockchip_i2s_tdm.c:1369 rockchip_i2s_tdm_probe() EPROBE_DEFER path should not print warnings
sound/soc/rockchip/rockchip_pdm.c:642 rockchip_pdm_probe() EPROBE_DEFER path should not print warnings
sound/soc/rockchip/rockchip_i2s.c:835 rockchip_i2s_probe() EPROBE_DEFER path should not print warnings
sound/soc/rockchip/rockchip_spdif.c:354 rk_spdif_probe() EPROBE_DEFER path should not print warnings
sound/soc/amd/acp/acp-legacy-mach.c:168 acp_asoc_probe() EPROBE_DEFER path should not print warnings
sound/soc/atmel/atmel-i2s.c:715 atmel_i2s_probe() EPROBE_DEFER path should not print warnings
sound/soc/atmel/mchp-spdifrx.c:1161 mchp_spdifrx_probe() EPROBE_DEFER path should not print warnings
sound/soc/atmel/mchp-pdmc.c:1098 mchp_pdmc_probe() EPROBE_DEFER path should not print warnings
sound/soc/atmel/mchp-spdiftx.c:857 mchp_spdiftx_probe() EPROBE_DEFER path should not print warnings
sound/soc/atmel/mchp-i2s-mcc.c:1078 mchp_i2s_mcc_probe() EPROBE_DEFER path should not print warnings
sound/soc/atmel/atmel-pdmic.c:659 atmel_pdmic_probe() EPROBE_DEFER path should not print warnings
sound/soc/atmel/atmel-classd.c:586 atmel_classd_probe() EPROBE_DEFER path should not print warnings
sound/soc/bcm/bcm2835-i2s.c:904 bcm2835_i2s_probe() EPROBE_DEFER path should not print warnings
sound/soc/fsl/lpc3xxx-pcm.c:65 lpc3xxx_pcm_register() EPROBE_DEFER path should not print warnings
sound/soc/fsl/fsl_xcvr.c:1402 fsl_xcvr_probe() EPROBE_DEFER path should not print warnings
sound/soc/fsl/fsl_aud2htx.c:242 fsl_aud2htx_probe() EPROBE_DEFER path should not print warnings
sound/soc/fsl/fsl_micfil.c:1246 fsl_micfil_probe() EPROBE_DEFER path should not print warnings
sound/soc/samsung/speyside.c:156 speyside_wm8996_init() EPROBE_DEFER path should not print warnings
sound/soc/samsung/aries_wm8994.c:376 aries_late_probe() EPROBE_DEFER path should not print warnings
sound/soc/sunxi/sun4i-codec.c:1795 sun4i_codec_probe() EPROBE_DEFER path should not print warnings
sound/soc/sunxi/sun4i-i2s.c:1610 sun4i_i2s_probe() EPROBE_DEFER path should not print warnings
sound/soc/starfive/jh7110_tdm.c:618 jh7110_tdm_probe() EPROBE_DEFER path should not print warnings
sound/soc/sof/imx/imx8.c:235 imx8_probe() EPROBE_DEFER path should not print warnings
sound/soc/intel/avs/boards/hdaudio.c:151 avs_probing_link_init() EPROBE_DEFER path should not print warnings
sound/soc/intel/keembay/kmb_platform.c:892 kmb_plat_dai_probe() EPROBE_DEFER path should not print warnings
sound/soc/dwc/dwc-i2s.c:1027 dw_i2s_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/tlv320aic32x4.c:1386 aic32x4_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/twl4030.c:266 twl4030_init_chip() EPROBE_DEFER path should not print warnings
sound/soc/codecs/tas2764.c:726 tas2764_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/tlv320dac33.c:1507 dac33_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/tas2770.c:680 tas2770_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/cs42l52.c:1148 cs42l52_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/arizona-jack.c:1331 arizona_jack_codec_dev_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/arizona-jack.c:1363 arizona_jack_codec_dev_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/tas2780.c:615 tas2780_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/tpa6130a2.c:261 tpa6130a2_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/cs42l73.c:1321 cs42l73_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/cs42l56.c:1206 cs42l56_i2c_probe() EPROBE_DEFER path should not print warnings

--BtPCO9uUB2+Ay3RA
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="check_propagate_EPROBE_DEFER2.c"

/*
 * Copyright 2023 Linaro Ltd.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/copyleft/gpl.txt
 */

#include "smatch.h"
#include "smatch_slist.h"
#include "smatch_extra.h"

static int my_id;

static unsigned long warned;

static void match_return(struct expression *expr)
{
	static int eprobe_id;
	struct symbol *type;
	struct sm_state *sm;
	sval_t sval;

	if (warned)
		return;

	if (!expr || !get_value(expr, &sval))
		return;
	if (sval.value == -517)
		return;

	type = cur_func_return_type();
	if (type != &int_ctype)
		return;

	if (eprobe_id == 0)
		eprobe_id = id_from_name("register_kernel_EPROBE_DEFER");

	FOR_EACH_MY_SM(eprobe_id, __get_cur_stree(), sm) {
		if (strncmp(sm->name, "__fake_", 7) == 0)
			continue;
		if (!is_EPROBE_DEFER_name_sym(sm->name, sm->sym))
			continue;
		if (sm->state != &undefined) {
			sm_warning("why not propogate EPROBE_DEFER from '%s'", sm->name);
			warned = 1;
		}
		return;
	} END_FOR_EACH_SM(sm);
}

void check_propagate_EPROBE_DEFER2(int id)
{
	my_id = id;

	if (option_project != PROJ_KERNEL)
		return;

	add_function_data(&warned);
	add_hook(&match_return, RETURN_HOOK);
}

--BtPCO9uUB2+Ay3RA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="propagate.list"

drivers/platform/cznic/turris-omnia-mcu-trng.c:102 omnia_mcu_register_trng() warn: why not propogate EPROBE_DEFER from 'irq'
drivers/input/misc/soc_button_array.c:149 soc_button_lookup_gpio() warn: why not propogate EPROBE_DEFER from '*irq_ret'
drivers/input/keyboard/mpr121_touchkey.c:252 mpr_touchkey_probe() warn: why not propogate EPROBE_DEFER from 'vdd_uv'
drivers/gpu/drm/panel/panel-novatek-nt35950.c:354 nt35950_sharp_init_vregs() warn: why not propogate EPROBE_DEFER from 'ret'
drivers/gpu/drm/omapdrm/dss/dsi.c:4328 omap_dsi_register_te_irq() warn: why not propogate EPROBE_DEFER from 'te_irq'
drivers/gpu/drm/bridge/samsung-dsim.c:1697 samsung_dsim_register_te_irq() warn: why not propogate EPROBE_DEFER from 'te_gpio_irq'
drivers/gpu/drm/bridge/display-connector.c:381 display_connector_probe() warn: why not propogate EPROBE_DEFER from 'conn->hpd_irq'
drivers/gpu/drm/bridge/ti-tpd12s015.c:179 tpd12s015_probe() warn: why not propogate EPROBE_DEFER from 'tpd->hpd_irq'
drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:104 gk20a_volt_vid_get() warn: why not propogate EPROBE_DEFER from 'uv'
drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:171 gk20a_volt_ctor() warn: why not propogate EPROBE_DEFER from 'uv'
drivers/clk/clk-si5341.c:1381 si5341_dt_parse_dt() warn: why not propogate EPROBE_DEFER from 'vdd'
drivers/usb/gadget/udc/pch_udc.c:1401 pch_vbus_gpio_init() warn: why not propogate EPROBE_DEFER from 'irq_num'
drivers/mmc/core/regulator.c:157 mmc_regulator_set_voltage_if_supported() warn: why not propogate EPROBE_DEFER from 'current_uV'
drivers/mmc/core/regulator.c:274 mmc_regulator_get_supply() warn: why not propogate EPROBE_DEFER from 'ret'
drivers/phy/allwinner/phy-sun4i-usb.c:901 sun4i_usb_phy_probe() warn: why not propogate EPROBE_DEFER from 'data->id_det_irq'
drivers/base/dd.c:1134 device_driver_attach() warn: why not propogate EPROBE_DEFER from 'ret'
drivers/uio/uio_aec.c:120 probe() warn: why not propogate EPROBE_DEFER from 'ret'
drivers/nfc/trf7970a.c:2135 trf7970a_probe() warn: why not propogate EPROBE_DEFER from 'uvolts'
drivers/net/phy/broadcom.c:1170 bcm54xx_phy_probe() warn: why not propogate EPROBE_DEFER from 'priv->wake_irq'
drivers/net/mdio/acpi_mdio.c:59 __acpi_mdiobus_register() warn: why not propogate EPROBE_DEFER from 'ret'
drivers/net/ethernet/broadcom/cnic.c:1340 cnic_alloc_bnx2x_resc() warn: why not propogate EPROBE_DEFER from 'ret'
drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c:171 mdp_m2m_start_streaming() warn: why not propogate EPROBE_DEFER from 'ret'
drivers/media/cec/platform/seco/seco-cec.c:550 secocec_acpi_probe() warn: why not propogate EPROBE_DEFER from 'irq'
drivers/media/cec/platform/cec-gpio/cec-gpio.c:255 cec_gpio_probe() warn: why not propogate EPROBE_DEFER from 'cec->cec_irq'
drivers/hwmon/sht15.c:1008 sht15_probe() warn: why not propogate EPROBE_DEFER from 'data->supply_uv'
drivers/hwmon/gpio-fan.c:91 fan_alarm_init() warn: why not propogate EPROBE_DEFER from 'alarm_irq'
drivers/hwmon/ads7828.c:134 ads7828_probe() warn: why not propogate EPROBE_DEFER from '__x'
drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c:932 gmin_v2p8_ctrl() warn: why not propogate EPROBE_DEFER from 'ret'
drivers/staging/greybus/arche-platform.c:545 arche_platform_probe() warn: why not propogate EPROBE_DEFER from 'arche_pdata->wake_detect_irq'
drivers/bluetooth/hci_bcm.c:1173 bcm_get_resources() warn: why not propogate EPROBE_DEFER from 'dev->irq'
drivers/bluetooth/hci_intel.c:1191 intel_probe() warn: why not propogate EPROBE_DEFER from 'idev->irq'
drivers/bluetooth/hci_nokia.c:751 nokia_bluetooth_serdev_probe() warn: why not propogate EPROBE_DEFER from 'btdev->wake_irq'
drivers/pci/controller/dwc/pcie-qcom-ep.c:754 qcom_pcie_ep_enable_irq_resources() warn: why not propogate EPROBE_DEFER from 'pcie_ep->perst_irq'
drivers/regulator/vctrl-regulator.c:142 vctrl_set_voltage() warn: why not propogate EPROBE_DEFER from 'orig_ctrl_uV'
drivers/regulator/core.c:3565 _regulator_call_set_voltage() warn: why not propogate EPROBE_DEFER from 'data.old_uV'
drivers/regulator/core.c:3589 _regulator_call_set_voltage_sel() warn: why not propogate EPROBE_DEFER from 'data.old_uV'
drivers/power/supply/gpio-charger.c:350 gpio_charger_probe() warn: why not propogate EPROBE_DEFER from 'charge_status_irq'
drivers/power/supply/lt3651-charger.c:184 lt3651_charger_probe() warn: why not propogate EPROBE_DEFER from 'ret'
drivers/power/supply/sbs-battery.c:1222 sbs_probe() warn: why not propogate EPROBE_DEFER from 'irq'
drivers/mfd/stmpe.c:1450 stmpe_probe() warn: why not propogate EPROBE_DEFER from 'stmpe->irq'
drivers/gpio/gpiolib-cdev.c:1062 debounce_setup() warn: why not propogate EPROBE_DEFER from 'irq'
drivers/gpio/gpiolib-cdev.c:1177 edge_detector_setup() warn: why not propogate EPROBE_DEFER from 'irq'
drivers/gpio/gpiolib-sysfs.c:181 gpio_sysfs_request_irq() warn: why not propogate EPROBE_DEFER from 'data->irq'
drivers/iio/adc/vf610_adc.c:907 vf610_adc_probe() warn: why not propogate EPROBE_DEFER from 'info->vref_uv'
drivers/iio/adc/rcar-gyroadc.c:230 rcar_gyroadc_read_raw() warn: why not propogate EPROBE_DEFER from 'vref'
drivers/iio/adc/imx7d_adc.c:324 imx7d_adc_read_raw() warn: why not propogate EPROBE_DEFER from 'info->vref_uv'
drivers/iio/adc/max11100.c:91 max11100_read_raw() warn: why not propogate EPROBE_DEFER from 'vref_uv'
drivers/iio/adc/ad4130.c:1707 ad4310_parse_fw() warn: why not propogate EPROBE_DEFER from 'avdd_uv'
drivers/iio/adc/ti-ads1100.c:148 ads1100_set_scale() warn: why not propogate EPROBE_DEFER from 'microvolts'
drivers/iio/adc/ad7173.c:852 ad7173_read_raw() warn: why not propogate EPROBE_DEFER from '*val'
drivers/iio/adc/npcm_adc.c:181 npcm_adc_read_raw() warn: why not propogate EPROBE_DEFER from 'vref_uv'
drivers/iio/adc/ad7298.c:258 ad7298_read_raw() warn: why not propogate EPROBE_DEFER from '*val'
drivers/iio/dac/max5522.c:91 max5522_read_raw() warn: why not propogate EPROBE_DEFER from 'ret'
drivers/iio/dac/ad5592r-base.c:449 ad5592r_read_raw() warn: why not propogate EPROBE_DEFER from 'ret'
drivers/iio/addac/ad74413r.c:666 ad74413r_get_output_current_scale() warn: why not propogate EPROBE_DEFER from '*val'
drivers/iio/humidity/dht11.c:312 dht11_probe() warn: why not propogate EPROBE_DEFER from 'dht11->irq'
sound/soc/samsung/aries_wm8994.c:377 aries_late_probe() warn: why not propogate EPROBE_DEFER from 'irq'

--BtPCO9uUB2+Ay3RA--

