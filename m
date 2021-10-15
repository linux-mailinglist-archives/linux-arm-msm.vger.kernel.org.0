Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1167242EF7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 13:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238399AbhJOLR4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 07:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238308AbhJOLR4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 07:17:56 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC971C061755
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 04:15:49 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id y26so40275286lfa.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 04:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SoAMm9zfIaRxGLiq4U4bzfav0HDBMnpQ6glgM94v2RM=;
        b=O5Bn3Tw8YACJBZhL+cCJ1tIKiz8Dh/xMTsRJiTEOSc40mCtt3lGhuCrdSupgGY1+ID
         MQcmGxo0g4ZwekT7Xg1j3GwV71/mMzHiVPxCedhbQ5VnSxoWv27QDwio+H9D0ytTWjAa
         YoD80G87nolQhl/+qpmprpxO8AulO1gbk2m5yrV//JQLuphJV55Gv9UpeBZe5H4Kg0YV
         9AqSXc9Ijnm3kXm/1TWTthNaXqgtH7x6NRM5AdViAc24R2B/OaFmxGv4Jwz1/J7lAwIf
         ZzARUbMLOcYFBwsX3P0AHfOls0VrVEej/oAE9Qe+lULEguvhOZMlVj5MxDeU97x+jK6+
         KO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SoAMm9zfIaRxGLiq4U4bzfav0HDBMnpQ6glgM94v2RM=;
        b=z9p+qXh2tQwirpRylnbXaZOOk+eGM4PMaFxwFA1rUkt4vnZ3ah/gwEawETxe3CmVHI
         hmauWcDTNH3mZ4/Ln1w55K0riv2l0N7jMMGPekF5oabYavICr49G9rWwjb3+QKQHG4oc
         TBExd3IYk813e2p/YGvXVWrHE6f0lAn96zmESdSyswyJopPYEEuhqkyRFpmm+eu28Xoi
         5T9hSH7ea9lkhweziPk/Rv1b56JiYzTFvbhBrSwe9x7eH44EY22a4SUSkx/rwvaZ7Seo
         Sre0VataC1aDZ1CuRUh0G1/MvA9a7GQE5W/vwpYcLj4BpfSWOztSrLAl2MfyBokUYJMY
         Pg6Q==
X-Gm-Message-State: AOAM533rcPer1tf4t8jxcatKOYAb+SWMH1yoel46e4pCZieoP4PoZJ5Y
        7iZYouZjBkGFwJa/wNet6WICJQ==
X-Google-Smtp-Source: ABdhPJyqBUHHyS+wHiYne+mR1ViK4L9BWnybmX/bwRIMtF9RjTEIR/IEHgZ/B3ONWrJba10pR9MfEw==
X-Received: by 2002:a2e:a584:: with SMTP id m4mr12067452ljp.489.1634296548225;
        Fri, 15 Oct 2021 04:15:48 -0700 (PDT)
Received: from [192.168.1.102] (62-248-207-242.elisa-laajakaista.fi. [62.248.207.242])
        by smtp.gmail.com with ESMTPSA id u15sm520231lji.21.2021.10.15.04.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 04:15:47 -0700 (PDT)
Subject: Re: [PATCH v7 1/6] soc: qcom: cpr: Move common functions to new file
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, jami.kettunen@somainline.org,
        paul.bouchara@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, jeffrey.l.hugo@gmail.com,
        robh@kernel.org
References: <20210901155735.629282-1-angelogioacchino.delregno@somainline.org>
 <20210901155735.629282-2-angelogioacchino.delregno@somainline.org>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Message-ID: <b9a082b1-e545-b1b9-3ded-bda5114b8bf7@linaro.org>
Date:   Fri, 15 Oct 2021 14:15:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210901155735.629282-2-angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi AngeloGioacchino,

On 9/1/21 6:57 PM, AngeloGioacchino Del Regno wrote:
> In preparation for implementing a new driver that will be handling
> CPRv3, CPRv4 and CPR-Hardened, format out common functions to a new
> file.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>   drivers/soc/qcom/Makefile     |   2 +-
>   drivers/soc/qcom/cpr-common.c | 362 ++++++++++++++++++++++++++++++
>   drivers/soc/qcom/cpr-common.h | 111 ++++++++++
>   drivers/soc/qcom/cpr.c        | 399 ++--------------------------------
>   4 files changed, 497 insertions(+), 377 deletions(-)
>   create mode 100644 drivers/soc/qcom/cpr-common.c
>   create mode 100644 drivers/soc/qcom/cpr-common.h
> 
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index ad675a6593d0..8d1262a2e23c 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -3,7 +3,7 @@ CFLAGS_rpmh-rsc.o := -I$(src)
>   obj-$(CONFIG_QCOM_AOSS_QMP) +=	qcom_aoss.o
>   obj-$(CONFIG_QCOM_GENI_SE) +=	qcom-geni-se.o
>   obj-$(CONFIG_QCOM_COMMAND_DB) += cmd-db.o
> -obj-$(CONFIG_QCOM_CPR)		+= cpr.o
> +obj-$(CONFIG_QCOM_CPR)		+= cpr-common.o cpr.o
>   obj-$(CONFIG_QCOM_GSBI)	+=	qcom_gsbi.o
>   obj-$(CONFIG_QCOM_MDT_LOADER)	+= mdt_loader.o
>   obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
> diff --git a/drivers/soc/qcom/cpr-common.c b/drivers/soc/qcom/cpr-common.c
> new file mode 100644
> index 000000000000..41fcc5863e72
> --- /dev/null
> +++ b/drivers/soc/qcom/cpr-common.c
> @@ -0,0 +1,362 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2019, Linaro Limited
> + */
> +
> +#include <linux/module.h>
> +#include <linux/err.h>
> +#include <linux/debugfs.h>
> +#include <linux/string.h>
> +#include <linux/kernel.h>
> +#include <linux/list.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/bitops.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_opp.h>
> +#include <linux/interrupt.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>

Please consider to sort the list of included headers alphabetically,
also I find that some of them are not needed, for instance the two
includes above are definitely excessive.

I understand that the list have been just copied, nevertheless, it
might be a good opportunity to shrink it.

> +#include <linux/regulator/consumer.h>
> +#include <linux/clk.h>
> +#include <linux/nvmem-consumer.h>
> +#include "cpr-common.h"
> +
> +int cpr_populate_ring_osc_idx(struct device *dev,
> +			      struct fuse_corner *fuse_corner,
> +			      const struct cpr_fuse *cpr_fuse,
> +			      int num_fuse_corners)
> +{
> +	struct fuse_corner *end = fuse_corner + num_fuse_corners;
> +	u32 data;
> +	int ret;
> +
> +	for (; fuse_corner < end; fuse_corner++, cpr_fuse++) {
> +		ret = nvmem_cell_read_variable_le_u32(dev, cpr_fuse->ring_osc, &data);
> +		if (ret)
> +			return ret;
> +		fuse_corner->ring_osc_idx = data;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(cpr_populate_ring_osc_idx);
> +
> +int cpr_read_fuse_uV(int init_v_width, int step_size_uV, int ref_uV,
> +		     int adj, int step_volt, const char *init_v_efuse,
> +		     struct device *dev)
> +{
> +	int steps, uV;
> +	u32 bits = 0;
> +	int ret;
> +
> +	ret = nvmem_cell_read_variable_le_u32(dev, init_v_efuse, &bits);
> +	if (ret)
> +		return ret;
> +
> +	steps = bits & (BIT(init_v_width - 1) - 1);
> +	/* Not two's complement.. instead highest bit is sign bit */
> +	if (bits & BIT(init_v_width - 1))
> +		steps = -steps;
> +
> +	uV = ref_uV + steps * step_size_uV;
> +
> +	/* Apply open-loop fixed adjustments to fused values */
> +	uV += adj;
> +
> +	return DIV_ROUND_UP(uV, step_volt) * step_volt;
> +}
> +EXPORT_SYMBOL_GPL(cpr_read_fuse_uV);

This function should be static and unexported, since I see no its users
outside of the object scope.

> +const struct cpr_fuse *cpr_get_fuses(struct device *dev, int tid,
> +				     int num_fuse_corners)

 From struct cpr_thread_desc the field 'num_fuse_corners' is unsigned,
please consider to change the type here to unsigned also.

> +{
> +	struct cpr_fuse *fuses;
> +	int i;

Then 'i' can be changed to unsigned also.

> +
> +	fuses = devm_kcalloc(dev, num_fuse_corners,
> +			     sizeof(struct cpr_fuse),

A common practice is to specify the size as 'sizeof(*fuses)'.

> +			     GFP_KERNEL);
> +	if (!fuses)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = 0; i < num_fuse_corners; i++) {
> +		char tbuf[50];
> +
> +		snprintf(tbuf, sizeof(tbuf), "cpr%d_ring_osc%d", tid, i + 1);
> +		fuses[i].ring_osc = devm_kstrdup(dev, tbuf, GFP_KERNEL);
> +		if (!fuses[i].ring_osc)
> +			return ERR_PTR(-ENOMEM);
> +
> +		snprintf(tbuf, sizeof(tbuf),
> +			 "cpr%d_init_voltage%d", tid, i + 1);
> +		fuses[i].init_voltage = devm_kstrdup(dev, tbuf,
> +						     GFP_KERNEL);

It should fit into one line, no need to wrap.

> +		if (!fuses[i].init_voltage)
> +			return ERR_PTR(-ENOMEM);
> +
> +		snprintf(tbuf, sizeof(tbuf), "cpr%d_quotient%d", tid, i + 1);
> +		fuses[i].quotient = devm_kstrdup(dev, tbuf, GFP_KERNEL);
> +		if (!fuses[i].quotient)
> +			return ERR_PTR(-ENOMEM);
> +
> +		snprintf(tbuf, sizeof(tbuf),
> +			 "cpr%d_quotient_offset%d", tid, i + 1);
> +		fuses[i].quotient_offset = devm_kstrdup(dev, tbuf,
> +							GFP_KERNEL);

Here as well.

> +		if (!fuses[i].quotient_offset)
> +			return ERR_PTR(-ENOMEM);
> +	}
> +
> +	return fuses;
> +}
> +EXPORT_SYMBOL_GPL(cpr_get_fuses);
> +
> +int cpr_populate_fuse_common(struct device *dev,
> +			     struct fuse_corner_data *fdata,
> +			     const struct cpr_fuse *cpr_fuse,
> +			     struct fuse_corner *fuse_corner,
> +			     int step_volt, int init_v_width,
> +			     int init_v_step)
> +{
> +	int uV, ret;
> +
> +	/* Populate uV */
> +	uV = cpr_read_fuse_uV(init_v_width, init_v_step,
> +			      fdata->ref_uV, fdata->volt_oloop_adjust,
> +			      step_volt, cpr_fuse->init_voltage, dev);
> +	if (uV < 0)
> +		return uV;
> +
> +	/*
> +	 * Update SoC voltages: platforms might choose a different
> +	 * regulators than the one used to characterize the algorithms
> +	 * (ie, init_voltage_step).
> +	 */
> +	fdata->min_uV = roundup(fdata->min_uV, step_volt);
> +	fdata->max_uV = roundup(fdata->max_uV, step_volt);
> +
> +	fuse_corner->min_uV = fdata->min_uV;
> +	fuse_corner->max_uV = fdata->max_uV;
> +	fuse_corner->uV = clamp(uV, fuse_corner->min_uV, fuse_corner->max_uV);
> +
> +	/* Populate target quotient by scaling */
> +	ret = nvmem_cell_read_variable_le_u32(dev, cpr_fuse->quotient, &fuse_corner->quot);
> +	if (ret)
> +		return ret;
> +
> +	fuse_corner->quot *= fdata->quot_scale;
> +	fuse_corner->quot += fdata->quot_offset;
> +	fuse_corner->quot += fdata->quot_adjust;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(cpr_populate_fuse_common);
> +
> +/*
> + * Returns: Index of the initial corner or negative number for error.
> + */
> +int cpr_find_initial_corner(struct device *dev, struct clk *cpu_clk,
> +			    struct corner *corners, int num_corners)
> +{
> +	unsigned long rate;
> +	struct corner *iter, *corner;
> +	const struct corner *end;
> +	unsigned int ret = 0;
> +
> +	if (!cpu_clk)
> +		return -EINVAL;
> +
> +	end = &corners[num_corners - 1];
> +	rate = clk_get_rate(cpu_clk);
> +
> +	/*
> +	 * Some bootloaders set a CPU clock frequency that is not defined
> +	 * in the OPP table. When running at an unlisted frequency,
> +	 * cpufreq_online() will change to the OPP which has the lowest
> +	 * frequency, at or above the unlisted frequency.
> +	 * Since cpufreq_online() always "rounds up" in the case of an
> +	 * unlisted frequency, this function always "rounds down" in case
> +	 * of an unlisted frequency. That way, when cpufreq_online()
> +	 * triggers the first ever call to cpr_set_performance_state(),
> +	 * it will correctly determine the direction as UP.
> +	 */
> +	for (iter = corners; iter <= end; iter++) {
> +		if (iter->freq > rate)
> +			break;
> +		ret++;
> +		if (iter->freq == rate) {
> +			corner = iter;
> +			break;
> +		}
> +		if (iter->freq < rate)
> +			corner = iter;
> +	}
> +
> +	if (!corner) {
> +		dev_err(dev, "boot up corner not found\n");
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(dev, "boot up perf state: %u\n", ret);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(cpr_find_initial_corner);
> +
> +u32 cpr_get_fuse_corner(struct dev_pm_opp *opp, u32 tid)
> +{
> +	struct device_node *np;
> +	u32 fc;
> +
> +	np = dev_pm_opp_get_of_node(opp);
> +	if (of_property_read_u32_index(np, "qcom,opp-fuse-level", tid, &fc)) {
> +		pr_debug("%s: missing 'qcom,opp-fuse-level' property\n",
> +			 __func__);
> +		fc = 0;
> +	}
> +
> +	of_node_put(np);
> +
> +	return fc;
> +}
> +EXPORT_SYMBOL_GPL(cpr_get_fuse_corner);
> +
> +unsigned long cpr_get_opp_hz_for_req(struct dev_pm_opp *ref,
> +				     struct device *cpu_dev)
> +{
> +	u64 rate = 0;
> +	struct device_node *ref_np;
> +	struct device_node *desc_np;
> +	struct device_node *child_np = NULL;
> +	struct device_node *child_req_np = NULL;
> +
> +	desc_np = dev_pm_opp_of_get_opp_desc_node(cpu_dev);
> +	if (!desc_np)
> +		return 0;
> +
> +	ref_np = dev_pm_opp_get_of_node(ref);
> +	if (!ref_np)
> +		goto out_ref;
> +
> +	do {
> +		of_node_put(child_req_np);
> +		child_np = of_get_next_available_child(desc_np, child_np);
> +		child_req_np = of_parse_phandle(child_np, "required-opps", 0);
> +	} while (child_np && child_req_np != ref_np);

There is a potential to reuse for_each_available_child_of_node() helper.

> +
> +	if (child_np && child_req_np == ref_np)
> +		of_property_read_u64(child_np, "opp-hz", &rate);
> +
> +	of_node_put(child_req_np);
> +	of_node_put(child_np);
> +	of_node_put(ref_np);
> +out_ref:
> +	of_node_put(desc_np);
> +
> +	return (unsigned long) rate;
> +}
> +EXPORT_SYMBOL_GPL(cpr_get_opp_hz_for_req);
> +
> +int cpr_calculate_scaling(const char *quot_offset,
> +			  struct device *dev,

Please consider to make 'dev' argument as the first one in the list.

> +			  const struct fuse_corner_data *fdata,
> +			  const struct corner *corner)
> +{
> +	u32 quot_diff = 0;
> +	unsigned long freq_diff;
> +	int scaling;
> +	const struct fuse_corner *fuse, *prev_fuse;
> +	int ret;

I personally prefer a Reverse Christmas Tree Format ordering of local
variable declarations (see https://lwn.net/Articles/758552), not sure
if you'd prefer to follow it...

> +
> +	fuse = corner->fuse_corner;
> +	prev_fuse = fuse - 1;
> +
> +	if (quot_offset) {
> +		ret = nvmem_cell_read_variable_le_u32(dev, quot_offset, &quot_diff);
> +		if (ret)
> +			return ret;
> +
> +		quot_diff *= fdata->quot_offset_scale;
> +		quot_diff += fdata->quot_offset_adjust;
> +	} else {
> +		quot_diff = fuse->quot - prev_fuse->quot;
> +	}
> +
> +	freq_diff = fuse->max_freq - prev_fuse->max_freq;
> +	freq_diff /= 1000000; /* Convert to MHz */
> +	scaling = 1000 * quot_diff / freq_diff;
> +	return min(scaling, fdata->max_quot_scale);
> +}
> +EXPORT_SYMBOL_GPL(cpr_calculate_scaling);
> +
> +int cpr_interpolate(const struct corner *corner, int step_volt,
> +		    const struct fuse_corner_data *fdata)
> +{
> +	unsigned long f_high, f_low, f_diff;
> +	int uV_high, uV_low, uV;
> +	u64 temp, temp_limit;
> +	const struct fuse_corner *fuse, *prev_fuse;
> +
> +	fuse = corner->fuse_corner;
> +	prev_fuse = fuse - 1;
> +
> +	f_high = fuse->max_freq;
> +	f_low = prev_fuse->max_freq;
> +	uV_high = fuse->uV;
> +	uV_low = prev_fuse->uV;
> +	f_diff = fuse->max_freq - corner->freq;
> +
> +	/*
> +	 * Don't interpolate in the wrong direction. This could happen
> +	 * if the adjusted fuse voltage overlaps with the previous fuse's
> +	 * adjusted voltage.
> +	 */
> +	if (f_high <= f_low || uV_high <= uV_low || f_high <= corner->freq)
> +		return corner->uV;
> +
> +	temp = f_diff * (uV_high - uV_low);
> +	do_div(temp, f_high - f_low);
> +
> +	/*
> +	 * max_volt_scale has units of uV/MHz while freq values
> +	 * have units of Hz.  Divide by 1000000 to convert to.
> +	 */
> +	temp_limit = f_diff * fdata->max_volt_scale;
> +	do_div(temp_limit, 1000000);
> +
> +	uV = uV_high - min(temp, temp_limit);
> +	return roundup(uV, step_volt);
> +}
> +EXPORT_SYMBOL_GPL(cpr_interpolate);
> +
> +int cpr_check_vreg_constraints(struct device *dev, struct regulator *vreg,
> +			       struct fuse_corner *f)
> +{
> +	int ret;
> +
> +	ret = regulator_is_supported_voltage(vreg, f->min_uV, f->min_uV);
> +	if (!ret) {
> +		dev_err(dev, "min uV: %d not supported by regulator\n",
> +			f->min_uV);
> +		return -EINVAL;
> +	}
> +
> +	ret = regulator_is_supported_voltage(vreg, f->max_uV, f->max_uV);
> +	if (!ret) {
> +		dev_err(dev, "max uV: %d not supported by regulator\n",
> +			f->max_uV);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(cpr_check_vreg_constraints);
> +
> +MODULE_DESCRIPTION("Core Power Reduction (CPR) common");
> +MODULE_LICENSE("GPL v2");

--
Best wishes,
Vladimir
