Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64EBE3F3338
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Aug 2021 20:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237816AbhHTSV3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Aug 2021 14:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237305AbhHTSUk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Aug 2021 14:20:40 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75EAEC0612AB
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Aug 2021 11:19:26 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id k12-20020a056830150c00b0051abe7f680bso10754152otp.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Aug 2021 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MR1xudCQ8b9bEEOVgtL7Trzti99clNDPsP7ZgaQV2RU=;
        b=fcz4xlEjV4GG/M536WW+c9udeGoDoOLI1ZkOW/OSZZfmZb6WaSmJuHa4W00o5ZgH91
         Jyf/OJpwLOGKGPcEZUBdgi4bW0+m8tQ/u1YqxW/RpIXwlhmMAWIvrY6zYLXkiX4ydbgL
         gNLveKeetZs0qDkRGbuWd6ayaY/M594hffh2dYmdjR6uydHiQdSZG50gfBXv8+8t64IK
         Yz3w8no1q3Hwwc9Q8zFlwm1FtAj0TZva2wiSNiCGKpkQx/z4uTV/ztgxKiu6K4XsqfbF
         rRkdgStyO3tWAjU+BsDVozfSA2nZHiByKWgSMO9lQA/fQscJWi5TOlLLI7dUheAm9bs4
         imvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MR1xudCQ8b9bEEOVgtL7Trzti99clNDPsP7ZgaQV2RU=;
        b=uSMf/RJ9nYDrXmgyOnqDHwXpKdRNPCr6A4WPTuTbMy8le1pQBOnrR4zOCSWEbxXrgl
         itJMoSotVqdXS4OJMeLVGY2hKmzuH7QdqrU/j4H/KaQxkaOgDNptEZCtYay4JjCaC5U0
         3f6Bir0NSVD0VMZwp3hKO/RNCft9Y2MXro4mpRxy5xBdzU5Qn6Gf0fkPJ+dN20+4OJAL
         M1a1HkLfqeKnqycOsWtDFh0bwIJBvq5ApHTyXwULQJXgQbY3iMxWVBBqPsfa69dQH1cl
         GRALEuW6hyGpp+eEF0GAHb2h8AeOq8ztZAkIkMP+x/XsPnqPyrmozMmoXNQktcXGNBiB
         Kh/w==
X-Gm-Message-State: AOAM530f1pw1iCgcJZazJVsme+XwAeHqJKQ08pbxoAIoVUvNCR6LGQF9
        pWDhPJDxHunvwQ9NaMMUqgbpFw==
X-Google-Smtp-Source: ABdhPJx1n+XBytzFplZaJNfQkcYINHAf0bJ6jbIviFaflZy864lkWv84ykdf8v7OVCAXLXRS8WzzzQ==
X-Received: by 2002:aca:3b85:: with SMTP id i127mr259624oia.28.1629483565163;
        Fri, 20 Aug 2021 11:19:25 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y33sm1623755ota.66.2021.08.20.11.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 11:19:24 -0700 (PDT)
Date:   Fri, 20 Aug 2021 11:20:47 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     chevron <chevron.li@bayhubtech.com>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, shaper.liu@bayhubtech.com,
        xiaoguang.yu@bayhubtech.com, shirley.her@bayhubtech.com
Subject: Re: [PATCH V1 1/1]mmc:sdhci-bayhub:fix Qualcomm sd host 845 SD card
 compatibility issue
Message-ID: <YR/yfwu28f9LH+MB@ripper>
References: <20210728174357.21400-1-chevron.li@bayhubtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728174357.21400-1-chevron.li@bayhubtech.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 28 Jul 10:43 PDT 2021, chevron wrote:

> Improve the signal integrity for long SD bus trace by using 845+BH201 SD host redriver chip
> 

This is a large patch with a very short commit message, which likely is
the reason why you've not gotten any reviews.

What is this hardware? The commit message gives me a feeling that the
BH201 is an external redriver that has been paired with the SDM845
sometimes?

Please describe properly how the hardware setup looks like.


I did skim through the patch trying to figure out what you're doing and
gave you some feedback below, but this is far from a complete review.
And many of the things I point out repeats throughout the patch.

I think the first step is to figure out what this is and if your design
is the right one...

> Signed-off-by: chevron.li <chevron.li@bayhubtech.com>

Is your name really chevron.li? Perhaps Chevron Li?

> ---
> change in V1:

I'm not able to find v0, can you point me to it, because I would like to
understand why these changes was made:

> 1. copy Qualcomm driver base from sdhci-msm.c to sdhci-bayhub.c

Why do we need to duplicate all this code.

> 2. implement the BH201 chip initialization function at sdhci-bayhub.c

Submitting this as a large "copy sdhci-msm and implement BH201" makes it
impossible to figure out what the BH201 specific pieces (that needs the
review) are.

> 3. implement the BH201 chip power control function at sdhci-bayhub.c
> 4. implement the BH201 chip tuning function at sdhci-bayhub.c
> 5. re-implement mmc_rescan to match BH201 mode switch flow at sdhci-bayhub.c

If this is an external redriver, can this be paired with any other SDHCI
controller?

> ---
> ---
[..]
> diff --git a/drivers/mmc/host/sdhci-bayhub.c b/drivers/mmc/host/sdhci-bayhub.c
> new file mode 100644
> index 000000000000..75029470bd22
> --- /dev/null
> +++ b/drivers/mmc/host/sdhci-bayhub.c
> @@ -0,0 +1,6563 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Bayhub Technologies, Inc. BH201 SDHCI bridge IC for
> + * VENDOR SDHCI platform driver source file
> + *
> + * Copyright (c) 2012-2018, The Linux Foundation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

The SPDX header covers this, so don't repeat the license text here.

> + */
> +
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/delay.h>
> +#include <linux/mmc/mmc.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/pm_opp.h>
> +#include <linux/slab.h>
> +#include <linux/iopoll.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/interconnect.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/mmc/host.h>
> +#include <linux/mmc/card.h>
> +#include <linux/mmc/sd.h>
> +#include <linux/io.h>
> +#include <linux/of_gpio.h>
> +
> +#include "sdhci-pltfm.h"
> +#include "cqhci.h"
> +#include "../core/core.h"
> +#include "../core/sd_ops.h"
> +#include "../core/sdio_ops.h"
> +#include "../core/mmc_ops.h"
> +#include "../core/sd.h"
> +#include "../core/bus.h"
> +#include "../core/host.h"
> +#include "../core/card.h"
> +#include "../core/pwrseq.h"
> +
> +#define TRUE	1
> +#define FALSE	0

Use "true" and "false"...

> +
> +#define	SD_FNC_AM_SDR50		0x2
> +#define	SD_FNC_AM_SDR104	0x3
> +#define BIT_PASS_MASK  (0x7ff)
> +#define SDR104_MANUAL_INJECT 0x3ff
> +#define SDR50_MANUAL_INJECT  0x77f
> +
[..]
> +#define TUNING_PHASE_SIZE	11
> +#define GGC_CFG_DATA {0x07000000, 0x07364022, 0x01015412, 0x01062400,\
> +	0x10400076, 0x00025432, 0x01046076, 0x62011000,\
> +	0x30503106, 0x64141711, 0x10057513, 0x00336200,\
> +	0x00020006, 0x40000400, 0x12200310, 0x3A314177}
> +
> +struct ggc_bus_mode_cfg_t {

Does "_t" say this is a struct? No need for that as "struct ggc..."
already says "it's a struct".

> +	u32 tx_selb_tb[TUNING_PHASE_SIZE];
> +	u32 all_selb_tb[TUNING_PHASE_SIZE];
> +	u32 tx_selb_failed_history;
> +	int bus_mode;
> +	int default_sela;
> +	int default_selb;
> +	u32 default_delaycode;
> +	u32 dll_voltage_unlock_cnt[4];
> +	u32 max_delaycode;
> +	u32 min_delaycode;
> +	u32 delaycode_narrowdown_index;
> +	u32 fail_phase;
> +};
> +
> +enum tuning_stat_et {

Does "_et" make this an enum?

> +	NO_TUNING = 0,
> +	OUTPUT_PASS_TYPE = 1,
> +	SET_PHASE_FAIL_TYPE = 2,
> +	TUNING_FAIL_TYPE = 3,
> +	READ_STATUS_FAIL_TYPE = 4,
> +	TUNING_CMD7_TIMEOUT = 5,
> +	RETUNING_CASE = 6,
> +};
> +
> +
> +struct t_gg_reg_strt {

What is a "t gg reg strt"?

> +	u32 ofs;
> +	u32 mask;
> +	u32 value;
> +};
> +
> +struct rl_bit_lct {
> +	u8 bits;
> +	u8 rl_bits;
> +};
> +
> +struct chk_type_t {

This only time this is used, it's there to pass 3 bools into a function.
Just use function arguments.

> +	u8 right_valid:1;
> +	u8 first_valid:1;
> +	u8 record_valid:1;
> +	u8 reserved:5;
> +};
> +
> +static const char *const op_dbg_str[] = {
> +	"no tuning",
> +	"pass",
> +	"set_phase_fail",
> +	"tuning fail",
> +	"read status fail",
> +	"tuning CMD7 timeout",
> +	"retuning case"
> +};
> +
> +struct ggc_platform_t {

What is this "ggc" and what "platform" does this represent?

> +	struct ggc_bus_mode_cfg_t sdr50;
> +	struct ggc_bus_mode_cfg_t sdr104;
> +	struct ggc_bus_mode_cfg_t *cur_bus_mode;
> +
> +	struct t_gg_reg_strt pha_stas_rx_low32;
> +	struct t_gg_reg_strt pha_stas_rx_high32;
> +	struct t_gg_reg_strt pha_stas_tx_low32;
> +	struct t_gg_reg_strt pha_stas_tx_high32;
> +	struct t_gg_reg_strt dll_sela_after_mask;
> +	struct t_gg_reg_strt dll_selb_after_mask;
> +
> +	struct t_gg_reg_strt dll_delay_100m_backup;
> +	struct t_gg_reg_strt dll_delay_200m_backup;
> +
> +	struct t_gg_reg_strt dll_sela_100m_cfg;
> +	struct t_gg_reg_strt dll_sela_200m_cfg;
> +	struct t_gg_reg_strt dll_selb_100m_cfg;
> +	struct t_gg_reg_strt dll_selb_200m_cfg;
> +	struct t_gg_reg_strt dll_selb_100m_cfg_en;
> +	struct t_gg_reg_strt dll_selb_200m_cfg_en;
> +	struct t_gg_reg_strt internl_tuning_en_100m;
> +	struct t_gg_reg_strt internl_tuning_en_200m;
> +	struct t_gg_reg_strt cmd19_cnt_cfg;
> +
> +	struct t_gg_reg_strt inject_failure_for_tuning_enable_cfg;
> +	struct t_gg_reg_strt inject_failure_for_200m_tuning_cfg;
> +	struct t_gg_reg_strt inject_failure_for_100m_tuning_cfg;
> +
> +	int def_sela_100m;
> +	int def_sela_200m;
> +	int def_selb_100m;
> +	int def_selb_200m;
> +
> +	u32 _gg_reg_cur[16];
> +	u8 _cur_read_buf[512];

Why does these have a '_' prefix?

> +
> +	bool dll_unlock_reinit_flg;
> +	u8 driver_strength_reinit_flg;
> +	bool tuning_cmd7_timeout_reinit_flg;
> +	u32 tuning_cmd7_timeout_reinit_cnt;
> +	u32 ggc_cur_sela;
> +	bool selx_tuning_done_flag;
> +	u32 ggc_cmd_tx_selb_failed_range;
> +	int ggc_sw_selb_tuning_first_selb;
> +	enum tuning_stat_et ggc_sela_tuning_result[11];
> +	int dll_voltage_scan_map[4];
> +	int cur_dll_voltage_idx;
> +	int sdr50_notuning_sela_inject_flag;
> +	int sdr50_notuning_crc_error_flag;
> +	u32 sdr50_notuning_sela_rx_inject;
> +	u32 bh201_sdr50_sela_sw_inject;
> +	u32 bh201_sdr50_selb_hw_inject;
> +	u32 bh201_sdr104_selb_hw_inject;
> +	u32 bh201_drive_strength;
> +	bool tuning_in_progress;
> +	int bh201_used;
> +	int pwr_gpio; /* External power enable pin for Redriver IC */
> +	int det_gpio;
> +};
[..]
> +static const struct sdhci_msm_bayhub_offset sdhci_msm_bayhub_v5_offset = {
> +	.core_mci_data_cnt = 0x35c,
> +	.core_mci_status = 0x324,
> +	.core_mci_fifo_cnt = 0x308,
> +	.core_mci_version = 0x318,
> +	.core_generics = 0x320,
> +	.core_testbus_config = 0x32c,
> +	.core_testbus_sel2_bit = 3,
> +	.core_testbus_ena = (1 << 31),
> +	.core_testbus_sel2 = (1 << 3),
> +	.core_pwrctl_status = 0x240,
> +	.core_pwrctl_mask = 0x244,
> +	.core_pwrctl_clear = 0x248,
> +	.core_pwrctl_ctl = 0x24c,
> +	.core_sdcc_debug_reg = 0x358,
> +	.core_dll_config = 0x200,
> +	.core_dll_status = 0x208,
> +	.core_vendor_spec = 0x20c,
> +	.core_vendor_spec_adma_err_addr0 = 0x214,
> +	.core_vendor_spec_adma_err_addr1 = 0x218,
> +	.core_vendor_spec_func2 = 0x210,
> +	.core_vendor_spec_capabilities0 = 0x21c,
> +	.core_ddr_200_cfg = 0x224,
> +	.core_vendor_spec3 = 0x250,
> +	.core_dll_config_2 = 0x254,
> +	.core_dll_config_3 = 0x258,
> +	.core_ddr_config = 0x25c,
> +	.core_dll_usr_ctl = 0x388,
> +};
> +
> +static const struct sdhci_msm_bayhub_offset sdhci_msm_bayhub_mci_offset = {

This is unused and as such you don't need the sdhci_msm_bayhub_offset
either.

> +	.core_hc_mode = 0x78,
> +	.core_mci_data_cnt = 0x30,
> +	.core_mci_status = 0x34,
> +	.core_mci_fifo_cnt = 0x44,
> +	.core_mci_version = 0x050,
> +	.core_generics = 0x70,
> +	.core_testbus_config = 0x0cc,
> +	.core_testbus_sel2_bit = 4,
> +	.core_testbus_ena = (1 << 3),
> +	.core_testbus_sel2 = (1 << 4),
> +	.core_pwrctl_status = 0xdc,
> +	.core_pwrctl_mask = 0xe0,
> +	.core_pwrctl_clear = 0xe4,
> +	.core_pwrctl_ctl = 0xe8,
> +	.core_sdcc_debug_reg = 0x124,
> +	.core_dll_config = 0x100,
> +	.core_dll_status = 0x108,
> +	.core_vendor_spec = 0x10c,
> +	.core_vendor_spec_adma_err_addr0 = 0x114,
> +	.core_vendor_spec_adma_err_addr1 = 0x118,
> +	.core_vendor_spec_func2 = 0x110,
> +	.core_vendor_spec_capabilities0 = 0x11c,
> +	.core_ddr_200_cfg = 0x184,
> +	.core_vendor_spec3 = 0x1b0,
> +	.core_dll_config_2 = 0x1b4,
> +	.core_ddr_config_old = 0x1b8,
> +	.core_ddr_config = 0x1bc,
> +};
> +
[..]
> +static const unsigned int freqs[] = { 400000, 300000, 200000, 100000 };
> +
> +static void cfg_bit_2_bt(int max_bit, int tar, int *byt, int *bit)
> +{
> +	struct rl_bit_lct cfg_bit_map[6] = {
> +		{0, 6},	{1, 5},	{2, 4},
> +		{3, 2},	{4, 1},	{5, 0},
> +	};

So you have an array of tuples, where the first entry in the tuple is
the index in the array? And then you only use rl_bits anyways...

How about:
	u8 bit_map[6] = { 6, 5, 4, 2, 1, 0 }

> +
> +	*byt = (max_bit - tar) / 6;
> +	*bit = cfg_bit_map[(max_bit - tar) % 6].rl_bits;
> +}
> +
> +static u32 cfg_read_bits_ofs_mask(u8 *cfg, struct t_gg_reg_strt *bts)
> +{
> +	u32 rv = 0;
> +	u32 msk = bts->mask;
> +	int byt = 0, bit = 0;
> +	int i = 0;
> +
> +	do {
> +		cfg_bit_2_bt(MAX_CFG_BIT_VAL, bts->ofs + i, &byt, &bit);

So "bt" is short for "byte" and "bts" is "bytes"?

> +		if (cfg[byt] & (1 << bit))
> +			rv |= 1 << i;
> +
> +		i++;
> +		msk >>= 1;
> +		if (msk == 0)
> +			break;

There's no case where mask is 0 (and I don't see why it would be), so

	while (msk) {
		...;
		msk >>= 1;
	}

Seems cleaner


But all of this would benefit from better naming and probably some
comments describing the actual format/structure of these bits and bytes.

> +	} while (1);
> +	return rv;
> +}
> +
> +static void get_default_setting(struct sdhci_host *host, u8 *data)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_bayhub_host *vendor_host = sdhci_pltfm_priv(pltfm_host);
> +
> +	vendor_host->ggc.def_sela_100m =
> +		cfg_read_bits_ofs_mask(data, &vendor_host->ggc.dll_sela_100m_cfg);
> +	vendor_host->ggc.def_sela_200m =
> +		cfg_read_bits_ofs_mask(data, &vendor_host->ggc.dll_sela_200m_cfg);
> +	vendor_host->ggc.def_selb_100m =
> +		cfg_read_bits_ofs_mask(data, &vendor_host->ggc.dll_sela_100m_cfg);
> +	vendor_host->ggc.def_selb_200m =
> +		cfg_read_bits_ofs_mask(data, &vendor_host->ggc.dll_sela_200m_cfg);
> +}
> +
> +static void cfg_write_bits_ofs_mask(u8 *cfg,
> +		struct t_gg_reg_strt *bts, u32 w_value)
> +{
> +	u32 wv = w_value & bts->mask;
> +	u32 msk = bts->mask;
> +	int byt = 0, bit = 0;
> +	int i = 0;
> +
> +	do {
> +		cfg_bit_2_bt(MAX_CFG_BIT_VAL, bts->ofs + i, &byt, &bit);
> +		if (wv & 1)
> +			cfg[byt] |= (u8) (1 << bit);
> +		else
> +			cfg[byt] &= (u8) (~(1 << bit));
> +
> +		i++;
> +		wv >>= 1;
> +		msk >>= 1;
> +		if (msk == 0)
> +			break;
> +	} while (1);
> +}
> +
> +static void ram_bit_2_bt(int tar, int *byt, int *bit)

So the "ram" variant is just a regular bitmap with 8 bits per byte?
include/linux/bitmap.h gives your an interface for dealing with those.

> +{
> +	*byt = tar / 8;
> +	*bit = tar % 8;
> +}
> +
> +static void set_gg_reg_cur_val(struct ggc_platform_t  *ggc,
> +	u8 *data, u8 len)
> +{
> +	memcpy(&ggc->_gg_reg_cur[0], data, len);
> +}
> +
> +static void get_gg_reg_cur_val(struct ggc_platform_t  *ggc,
> +	u8 *data, u8 len)
> +{
> +	memcpy(data, &ggc->_gg_reg_cur[0], len);
> +}
> +
> +static void get_gg_reg_def(struct sdhci_host *host, u8 *data)
> +{
> +	u32 gg_sw_def[16] = GGC_CFG_DATA;
> +
> +	memcpy(data, (u8 *)&(gg_sw_def[0]), sizeof(gg_sw_def));

(u8 *)&(gg_sw_def[0])... The address of the first element, type casted
to a (u8*), then passed to a void *?

Isn't that the same thing as just typing "gg_sw_def"?


But why is GGC_CFG_DATA a define and not just a static const u32 array,
in which case you can replace this function with just a simple memcpy in
ggc_chip_init().

> +}
> +
> +static u32 read_ram_bits_ofs_mask(u8 *cfg, struct t_gg_reg_strt *bts)
> +{
> +	u32 rv = 0;
> +	u32 msk = bts->mask;
> +	int byt = 0, bit = 0;
> +	int i = 0;
> +
> +	do {
> +		ram_bit_2_bt(bts->ofs + i, &byt, &bit);
> +		if (cfg[byt] & (1 << bit))
> +			rv |= 1 << i;
> +
> +		i++;
> +		msk >>= 1;
> +		if (msk == 0)
> +			break;
> +
> +	} while (1);
> +	return rv;
> +}
> +
> +static void ggc_dll_voltage_init(struct sdhci_host *host)
> +{
> +	int i = 0;
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_bayhub_host *vendor_host =
> +						sdhci_pltfm_priv(pltfm_host);
> +
> +	for (i = 0; i < 4; i++) {
> +		vendor_host->ggc.dll_voltage_scan_map[i] = 0;
> +		vendor_host->ggc.sdr50.dll_voltage_unlock_cnt[i] = 0;
> +		vendor_host->ggc.sdr104.dll_voltage_unlock_cnt[i] = 0;
> +	}
> +}
> +
> +static void ggc_chip_init(struct sdhci_host *host)
> +{
> +	u8 data[512] = { 0 };
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_bayhub_host *vendor_host =
> +						sdhci_pltfm_priv(pltfm_host);
> +
> +	get_gg_reg_def(host, data);
> +	get_default_setting(host, data);
> +	set_gg_reg_cur_val(&vendor_host->ggc, data, 64);
> +}
> +
> +static int driver_send_command7(struct sdhci_host *host)
> +{
> +	int ret = 0;
> +	int err;
> +	struct mmc_host *mmc = host->mmc;
> +	struct mmc_command cmd = {0};
> +
> +	cmd.opcode = MMC_SELECT_CARD;
> +	cmd.arg = 0;
> +	cmd.flags = MMC_RSP_NONE | MMC_CMD_AC;
> +	err = mmc_wait_for_cmd(mmc, &cmd, 3);
> +	if (err)
> +		ret = 0;
> +	else
> +		ret = 1;
> +
> +	return ret;

return mmc_wait_for_cmd() seems more reasonable, but you don't check the
return value in any off the call sites...

> +}
> +
> +static void driver_send_command24(struct sdhci_host *host,
> +		u32 *cfg_data, int data_len)
> +{
> +	struct mmc_host *mmc = host->mmc;
> +	struct mmc_request mrq = {0};
> +	struct mmc_command cmd = { 0 };
> +	struct mmc_data data = { 0 };
> +	struct scatterlist sg;
> +	u8 *data1 = kzalloc(PAGE_SIZE, GFP_KERNEL);

This allocation needs a NULL check.

> +
> +	memcpy(data1, (u8 *)&(cfg_data[0]), data_len);
> +	sg_init_one(&sg, data1, 512);
> +
> +	cmd.opcode = MMC_WRITE_BLOCK;
> +	cmd.arg = 0;
> +	cmd.flags = MMC_RSP_R1 | MMC_CMD_ADTC;
> +	data.blksz = 512;
> +	data.blocks = 1;
> +	data.flags = MMC_DATA_WRITE;
> +	data.timeout_ns = 1000 * 1000 * 1000;
> +	data.sg = &sg;
> +	data.sg_len = 1;
> +	mrq.cmd = &cmd;
> +	mrq.data = &data;
> +	mrq.stop = NULL;
> +
> +	mmc_wait_for_req(mmc, &mrq);
> +	kfree(data1);
> +}
> +
> +static void bht_update_cfg(struct mmc_host *mmc_host,
> +	struct mmc_card *card, u32 *cfg_data, int data_len)
> +{
> +	int ret = 0;

This is unused.

> +	struct sdhci_host *host;
> +
> +	host = mmc_priv(mmc_host);
> +	mmc_set_bus_width(mmc_host, MMC_BUS_WIDTH_4);
> +	if (host->ops->reset)
> +		host->ops->reset(host, SDHCI_RESET_CMD|SDHCI_RESET_DATA);
> +
> +	driver_send_command7(host);
> +	driver_send_command24(host, cfg_data, data_len);
> +	driver_send_command7(host);
> +
> +	mmc_set_bus_width(mmc_host, MMC_BUS_WIDTH_1);
> +}
> +
> +
[..]
> +static void bht_load_hw_inject(struct mmc_host *mmc_host,
> +	struct mmc_card *card, u32 *cfg_data, int data_len,
> +	u32 sel200, u32 sel100)
> +{
> +	struct sdhci_host *host = mmc_priv(mmc_host);
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_bayhub_host *vendor_host =
> +						sdhci_pltfm_priv(pltfm_host);
> +	u32 gg_hw_inj[16] = GGC_CFG_DATA;
> +
> +	gg_hw_inj[1] = 0x7364032;
> +
> +	if (vendor_host->ggc.bh201_sdr104_selb_hw_inject)
> +		gg_hw_inj[11] = vendor_host->ggc.bh201_sdr104_selb_hw_inject;
> +	else
> +		gg_hw_inj[11] = 0x57336200;

Make this the default value of bh201_sdr50_selb_hw_inject and you don't
need to make these conditionals throughout the code.

> +
> +	if (vendor_host->ggc.bh201_sdr50_selb_hw_inject)
> +		gg_hw_inj[12] = vendor_host->ggc.bh201_sdr50_selb_hw_inject;
> +	else
> +		gg_hw_inj[12] = 0x00725777;
> +
> +	if (vendor_host->ggc.bh201_drive_strength)
> +		gg_hw_inj[15] = vendor_host->ggc.bh201_drive_strength;
> +
> +	bht_update_cfg(mmc_host, card, gg_hw_inj, data_len);
> +}
> +
[..]
> +static void sdhci_msm_bayhub_writeb(struct sdhci_host *host, u8 val, int reg)
> +{
> +	u32 req_type = 0;

Don't initialize variables when the next operation on that variable is
an assignment.

> +
> +	req_type = __sdhci_msm_bayhub_check_write(host, val, reg);
> +
> +	writeb_relaxed(val, host->ioaddr + reg);
> +
> +	if (req_type)
> +		sdhci_msm_bayhub_check_power_status(host, req_type);
> +}
[..]
> +static int sdhci_msm_bayhub_probe(struct platform_device *pdev)
> +{
[..]
> +	if (of_find_property(node, "use-bayhub-bh201", NULL)) {

Why would someone use the bayhub compatible, but not have the bh201?

Isn't this a leftover from a previous version where this was a patch
ontop of sdhci-msm?

> +		sdhci_bh201_parse(msm_bayhub_host->mmc);
> +		INIT_DELAYED_WORK(&host->mmc->detect, mmc_rescan_bayhub);
> +	} else
> +		msm_bayhub_host->ggc.bh201_used = 0;
> +

Regards,
Bjorn
