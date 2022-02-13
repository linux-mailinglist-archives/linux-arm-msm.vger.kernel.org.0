Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC974B3C98
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Feb 2022 18:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236509AbiBMRmt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Feb 2022 12:42:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbiBMRms (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Feb 2022 12:42:48 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0AAB5A089;
        Sun, 13 Feb 2022 09:42:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 65242611F5;
        Sun, 13 Feb 2022 17:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39E2C004E1;
        Sun, 13 Feb 2022 17:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644774159;
        bh=GE4t5vtOd5Son+cQQlxQpSDH79C3ZLVTtW8j5k63zBA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gJTl9D1M+Uwr0KI+3nrmyfEOyga9LBz32wUknHWYoLlnk0wWQbXVDhI9FopjASPdZ
         Ip5povJmpVUzvEaI1TfTXvt2GY5Lu4YFsfou6bqSFCfHZw4WzXk+I/kP3zesmJznzG
         7JxmDl/aYmsLHSsqtVzQR0duanLKSxY8M79WUaYH+cJnDvzmaGNcWhRH+imkXbAov7
         8m09zzJgWcmou5BZDsDaeyHA8kKmpuNQx5es8RhBxMqodQehfa+dIsF6pny/uCcirE
         MxpUMv0axNgajn1GGxvEGVnlHrwdBv6/728itNnT817mrSPJ2JAKhj1L6jmJhwZSl8
         Tr2KCO1iVgrGA==
Date:   Sun, 13 Feb 2022 17:49:18 +0000
From:   Jonathan Cameron <jic23@kernel.org>
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
Subject: Re: [PATCH v4 4/8] iio: adc: qcom-spmi-rradc: introduce round robin
 adc
Message-ID: <20220213174918.00a84a0a@jic23-huawei>
In-Reply-To: <20220211211959.502514-5-caleb.connolly@linaro.org>
References: <20220211211959.502514-1-caleb.connolly@linaro.org>
        <20220211211959.502514-5-caleb.connolly@linaro.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 11 Feb 2022 21:19:55 +0000
Caleb Connolly <caleb.connolly@linaro.org> wrote:

> The Round Robin ADC is responsible for reading data about the rate of
> charge from the USB or DC input ports, it can also read the battery
> ID (resistence), skin temperature and the die temperature of the pmic.
> It is found on the PMI8998 and PM660 Qualcomm PMICs.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>

Hi Caleb,

Looks pretty good to me.  A few minor things inline.
It may be worth a few more comments where you've had to do slightly odd
looking maths to avoid overflows.   If we document those they don't
get 'fixed' in future which is an annoyingly common form of bugs in
patches that look 'obviously correct'.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/Kconfig           |   13 +
>  drivers/iio/adc/Makefile          |    1 +
>  drivers/iio/adc/qcom-spmi-rradc.c | 1014 +++++++++++++++++++++++++++++
>  3 files changed, 1028 insertions(+)
>  create mode 100644 drivers/iio/adc/qcom-spmi-rradc.c
> 
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 4fdc8bfbb407..21fdf9d58552 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -812,6 +812,19 @@ config QCOM_PM8XXX_XOADC
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called qcom-pm8xxx-xoadc.
>  
> +config QCOM_SPMI_RRADC
> +	tristate "Qualcomm SPMI RRADC"
> +	depends on MFD_SPMI_PMIC
> +	help
> +	  This is for the PMIC Round Robin ADC driver.
> +
> +	  This driver exposes the battery ID resistor, battery thermal, PMIC die
> +	  temperature, charger USB in and DC in voltage and current.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called qcom-qpmi-rradc.
> +

Single blank line only

> +
>  config QCOM_SPMI_IADC
>  	tristate "Qualcomm SPMI PMIC current ADC"
>  	depends on SPMI
> diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> index 4a8f1833993b..b0dd7f142abd 100644
> --- a/drivers/iio/adc/Makefile
> +++ b/drivers/iio/adc/Makefile
> @@ -77,6 +77,7 @@ obj-$(CONFIG_NPCM_ADC) += npcm_adc.o
>  obj-$(CONFIG_PALMAS_GPADC) += palmas_gpadc.o
>  obj-$(CONFIG_QCOM_SPMI_ADC5) += qcom-spmi-adc5.o
>  obj-$(CONFIG_QCOM_SPMI_IADC) += qcom-spmi-iadc.o
> +obj-$(CONFIG_QCOM_SPMI_RRADC) += qcom-spmi-rradc.o
>  obj-$(CONFIG_QCOM_VADC_COMMON) += qcom-vadc-common.o
>  obj-$(CONFIG_QCOM_SPMI_VADC) += qcom-spmi-vadc.o
>  obj-$(CONFIG_QCOM_PM8XXX_XOADC) += qcom-pm8xxx-xoadc.o
> diff --git a/drivers/iio/adc/qcom-spmi-rradc.c b/drivers/iio/adc/qcom-spmi-rradc.c
> new file mode 100644
> index 000000000000..27195edbbcb4
> --- /dev/null
> +++ b/drivers/iio/adc/qcom-spmi-rradc.c
> @@ -0,0 +1,1014 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2021 Linaro Limited.

Could update the date now.

> + *  Author: Caleb Connolly <caleb.connolly@linaro.org>
> + *
> + * This driver is for the Round Robin ADC found in the pmi8998 and pm660 PMICs.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/iio/iio.h>
> +#include <linux/iio/types.h>
> +#include <linux/kernel.h>
> +#include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/spmi.h>
> +#include <linux/types.h>
> +#include <asm-generic/unaligned.h>

Shouldn't be directly including asm-generic.

> +#include <linux/units.h>
> +#include <soc/qcom/qcom-spmi-pmic.h>

There are various conventions for header ordering but one that tends
to work well is alphabetical order in blocks.

general linux/

asm/*

specific linux/iio

Driver specific so here the soc/qcom


> +
> +#define RR_ADC_EN_CTL 0x46
> +#define RR_ADC_SKIN_TEMP_LSB 0x50
> +#define RR_ADC_SKIN_TEMP_MSB 0x51
> +#define RR_ADC_CTL 0x52
> +#define RR_ADC_CTL_CONTINUOUS_SEL BIT(3)
> +#define RR_ADC_LOG 0x53
> +#define RR_ADC_LOG_CLR_CTRL BIT(0)
> +
> +#define RR_ADC_FAKE_BATT_LOW_LSB 0x58
> +#define RR_ADC_FAKE_BATT_LOW_MSB 0x59
> +#define RR_ADC_FAKE_BATT_HIGH_LSB 0x5A
> +#define RR_ADC_FAKE_BATT_HIGH_MSB 0x5B
> +
> +#define RR_ADC_BATT_ID_CTRL 0x60
> +#define RR_ADC_BATT_ID_CTRL_CHANNEL_CONV BIT(0)
> +#define RR_ADC_BATT_ID_TRIGGER 0x61
> +#define RR_ADC_BATT_ID_STS 0x62
> +#define RR_ADC_BATT_ID_CFG 0x63
> +#define BATT_ID_SETTLE_MASK GENMASK(7, 5)
> +#define RR_ADC_BATT_ID_5_LSB 0x66
> +#define RR_ADC_BATT_ID_5_MSB 0x67
> +#define RR_ADC_BATT_ID_15_LSB 0x68
> +#define RR_ADC_BATT_ID_15_MSB 0x69
> +#define RR_ADC_BATT_ID_150_LSB 0x6A
> +#define RR_ADC_BATT_ID_150_MSB 0x6B
> +
> +#define RR_ADC_BATT_THERM_CTRL 0x70
> +#define RR_ADC_BATT_THERM_TRIGGER 0x71
> +#define RR_ADC_BATT_THERM_STS 0x72
> +#define RR_ADC_BATT_THERM_CFG 0x73
> +#define RR_ADC_BATT_THERM_LSB 0x74
> +#define RR_ADC_BATT_THERM_MSB 0x75
> +#define RR_ADC_BATT_THERM_FREQ 0x76
> +
> +#define RR_ADC_AUX_THERM_CTRL 0x80
> +#define RR_ADC_AUX_THERM_TRIGGER 0x81
> +#define RR_ADC_AUX_THERM_STS 0x82
> +#define RR_ADC_AUX_THERM_CFG 0x83
> +#define RR_ADC_AUX_THERM_LSB 0x84
> +#define RR_ADC_AUX_THERM_MSB 0x85
> +
> +#define RR_ADC_SKIN_HOT 0x86
> +#define RR_ADC_SKIN_TOO_HOT 0x87
> +
> +#define RR_ADC_AUX_THERM_C1 0x88
> +#define RR_ADC_AUX_THERM_C2 0x89
> +#define RR_ADC_AUX_THERM_C3 0x8A
> +#define RR_ADC_AUX_THERM_HALF_RANGE 0x8B
> +
> +#define RR_ADC_USB_IN_V_CTRL 0x90
> +#define RR_ADC_USB_IN_V_TRIGGER 0x91
> +#define RR_ADC_USB_IN_V_STS 0x92
> +#define RR_ADC_USB_IN_V_LSB 0x94
> +#define RR_ADC_USB_IN_V_MSB 0x95
> +#define RR_ADC_USB_IN_I_CTRL 0x98
> +#define RR_ADC_USB_IN_I_TRIGGER 0x99
> +#define RR_ADC_USB_IN_I_STS 0x9A
> +#define RR_ADC_USB_IN_I_LSB 0x9C
> +#define RR_ADC_USB_IN_I_MSB 0x9D
> +
> +#define RR_ADC_DC_IN_V_CTRL 0xA0
> +#define RR_ADC_DC_IN_V_TRIGGER 0xA1
> +#define RR_ADC_DC_IN_V_STS 0xA2
> +#define RR_ADC_DC_IN_V_LSB 0xA4
> +#define RR_ADC_DC_IN_V_MSB 0xA5
> +#define RR_ADC_DC_IN_I_CTRL 0xA8
> +#define RR_ADC_DC_IN_I_TRIGGER 0xA9
> +#define RR_ADC_DC_IN_I_STS 0xAA
> +#define RR_ADC_DC_IN_I_LSB 0xAC
> +#define RR_ADC_DC_IN_I_MSB 0xAD
> +
> +#define RR_ADC_PMI_DIE_TEMP_CTRL 0xB0
> +#define RR_ADC_PMI_DIE_TEMP_TRIGGER 0xB1
> +#define RR_ADC_PMI_DIE_TEMP_STS 0xB2
> +#define RR_ADC_PMI_DIE_TEMP_CFG 0xB3
> +#define RR_ADC_PMI_DIE_TEMP_LSB 0xB4
> +#define RR_ADC_PMI_DIE_TEMP_MSB 0xB5
> +
> +#define RR_ADC_CHARGER_TEMP_CTRL 0xB8
> +#define RR_ADC_CHARGER_TEMP_TRIGGER 0xB9
> +#define RR_ADC_CHARGER_TEMP_STS 0xBA
> +#define RR_ADC_CHARGER_TEMP_CFG 0xBB
> +#define RR_ADC_CHARGER_TEMP_LSB 0xBC
> +#define RR_ADC_CHARGER_TEMP_MSB 0xBD
> +#define RR_ADC_CHARGER_HOT 0xBE
> +#define RR_ADC_CHARGER_TOO_HOT 0xBF
> +
> +#define RR_ADC_GPIO_CTRL 0xC0
> +#define RR_ADC_GPIO_TRIGGER 0xC1
> +#define RR_ADC_GPIO_STS 0xC2
> +#define RR_ADC_GPIO_LSB 0xC4
> +#define RR_ADC_GPIO_MSB 0xC5
> +
> +#define RR_ADC_ATEST_CTRL 0xC8
> +#define RR_ADC_ATEST_TRIGGER 0xC9
> +#define RR_ADC_ATEST_STS 0xCA
> +#define RR_ADC_ATEST_LSB 0xCC
> +#define RR_ADC_ATEST_MSB 0xCD
> +#define RR_ADC_SEC_ACCESS 0xD0
> +
> +#define RR_ADC_PERPH_RESET_CTL2 0xD9
> +#define RR_ADC_PERPH_RESET_CTL3 0xDA
> +#define RR_ADC_PERPH_RESET_CTL4 0xDB
> +#define RR_ADC_INT_TEST1 0xE0
> +#define RR_ADC_INT_TEST_VAL 0xE1
> +
> +#define RR_ADC_TM_TRIGGER_CTRLS 0xE2
> +#define RR_ADC_TM_ADC_CTRLS 0xE3
> +#define RR_ADC_TM_CNL_CTRL 0xE4
> +#define RR_ADC_TM_BATT_ID_CTRL 0xE5
> +#define RR_ADC_TM_THERM_CTRL 0xE6
> +#define RR_ADC_TM_CONV_STS 0xE7
> +#define RR_ADC_TM_ADC_READ_LSB 0xE8
> +#define RR_ADC_TM_ADC_READ_MSB 0xE9
> +#define RR_ADC_TM_ATEST_MUX_1 0xEA
> +#define RR_ADC_TM_ATEST_MUX_2 0xEB
> +#define RR_ADC_TM_REFERENCES 0xED
> +#define RR_ADC_TM_MISC_CTL 0xEE
> +#define RR_ADC_TM_RR_CTRL 0xEF
> +
> +#define RR_ADC_TRIGGER_EVERY_CYCLE BIT(7)
> +#define RR_ADC_TRIGGER_CTL BIT(0)
> +
> +#define RR_ADC_BATT_ID_RANGE 820
> +
> +#define RR_ADC_BITS 10
> +#define RR_ADC_CHAN_MSB (1 << RR_ADC_BITS)
> +#define RR_ADC_FS_VOLTAGE_MV 2500
> +
> +/* BATT_THERM 0.25K/LSB */
> +#define RR_ADC_BATT_THERM_LSB_K 4
> +
> +#define RR_ADC_TEMP_FS_VOLTAGE_NUM 5000000
> +#define RR_ADC_TEMP_FS_VOLTAGE_DEN 3
> +#define RR_ADC_DIE_TEMP_OFFSET 601400
> +#define RR_ADC_DIE_TEMP_SLOPE 2
> +#define RR_ADC_DIE_TEMP_OFFSET_MILLI_DEGC 25000
> +
> +#define RR_ADC_CHG_TEMP_GF_OFFSET_UV 1303168
> +#define RR_ADC_CHG_TEMP_GF_SLOPE_UV_PER_C 3784
> +#define RR_ADC_CHG_TEMP_SMIC_OFFSET_UV 1338433
> +#define RR_ADC_CHG_TEMP_SMIC_SLOPE_UV_PER_C 3655
> +#define RR_ADC_CHG_TEMP_660_GF_OFFSET_UV 1309001
> +#define RR_ADC_CHG_TEMP_660_GF_SLOPE_UV_PER_C 3403
> +#define RR_ADC_CHG_TEMP_660_SMIC_OFFSET_UV 1295898
> +#define RR_ADC_CHG_TEMP_660_SMIC_SLOPE_UV_PER_C 3596
> +#define RR_ADC_CHG_TEMP_660_MGNA_OFFSET_UV 1314779
> +#define RR_ADC_CHG_TEMP_660_MGNA_SLOPE_UV_PER_C 3496
> +#define RR_ADC_CHG_TEMP_OFFSET_MILLI_DEGC 25000
> +#define RR_ADC_CHG_THRESHOLD_SCALE 4
> +
> +#define RR_ADC_VOLT_INPUT_FACTOR 8
> +#define RR_ADC_CURR_INPUT_FACTOR 2000
> +#define RR_ADC_CURR_USBIN_INPUT_FACTOR_MIL 1886
> +#define RR_ADC_CURR_USBIN_660_FACTOR_MIL 9
> +#define RR_ADC_CURR_USBIN_660_UV_VAL 579500
> +
> +#define RR_ADC_GPIO_FS_RANGE 5000
> +#define RR_ADC_COHERENT_CHECK_RETRY 5
> +#define RR_ADC_CHAN_MAX_CONTINUOUS_BUFFER_LEN 16
> +
> +#define RR_ADC_STS_CHANNEL_READING_MASK 0x3

GENMASK()

> +#define RR_ADC_STS_CHANNEL_STS 0x2

BIT(1)

> +
> +#define RR_ADC_TP_REV_VERSION1 21
> +#define RR_ADC_TP_REV_VERSION2 29
> +#define RR_ADC_TP_REV_VERSION3 32
> +
> +#define RRADC_BATT_ID_DELAY_MAX 8
> +
> +enum rradc_channel_id {
> +	RR_ADC_BATT_ID = 0,
> +	RR_ADC_BATT_THERM,
> +	RR_ADC_SKIN_TEMP,
> +	RR_ADC_USBIN_I,
> +	RR_ADC_USBIN_V,
> +	RR_ADC_DCIN_I,
> +	RR_ADC_DCIN_V,
> +	RR_ADC_DIE_TEMP,
> +	RR_ADC_CHG_TEMP,
> +	RR_ADC_GPIO,
> +	RR_ADC_CHAN_MAX
> +};
> +
> +struct rradc_chip;
> +
> +/**
> + * struct rradc_channel - rradc channel data

label?
Always check warnings from the kernel-doc script

> + * @lsb:		Channel least significant byte
> + * @status:		Channel status address
> + * @size:		number of bytes to read
> + * @trigger_addr:	Trigger address, trigger is only used on some channels
> + * @trigger_mask:	Trigger mask
> + * @scale_fn:		Post process callback for channels which can't be exposed
> + *			as offset + scale.
> + */
> +struct rradc_channel {
> +	const char *label;
> +	u8 lsb;
> +	u8 status;
> +	int size;
> +	int trigger_addr;
> +	int trigger_mask;
> +	int (*scale_fn)(struct rradc_chip *chip, u16 adc_code, int *result);
> +};
> +
> +struct rradc_chip {
> +	struct device *dev;
> +	const struct qcom_spmi_pmic *pmic;

> +	/* Lock held while accessing the rradc registers */
Why?  regmap locks protect the registers.  Basically mention specific
reasons why it is needed. I assume read modify write cycles for example.

> +	struct mutex conversion_lock;
> +	struct regmap *regmap;
> +	u32 base;
> +	int batt_id_delay;
> +	u16 batt_id_data;
> +};
> +
> +static const int batt_id_delays[] = { 0, 1, 4, 12, 20, 40, 60, 80 };
> +static const struct rradc_channel rradc_chans[RR_ADC_CHAN_MAX];
> +static const struct iio_chan_spec rradc_iio_chans[RR_ADC_CHAN_MAX];
> +

> +static int rradc_get_fab_coeff(struct rradc_chip *chip, int64_t *offset,
> +			       int64_t *slope)
> +{
> +	if (chip->pmic->subtype == PM660_SUBTYPE) {
> +		switch (chip->pmic->fab_id) {
> +		case PM660_FAB_ID_GF:
> +			*offset = RR_ADC_CHG_TEMP_660_GF_OFFSET_UV;
> +			*slope = RR_ADC_CHG_TEMP_660_GF_SLOPE_UV_PER_C;
> +			break;
> +		case PM660_FAB_ID_TSMC:
> +			*offset = RR_ADC_CHG_TEMP_660_SMIC_OFFSET_UV;
> +			*slope = RR_ADC_CHG_TEMP_660_SMIC_SLOPE_UV_PER_C;
> +			break;
> +		default:
> +			*offset = RR_ADC_CHG_TEMP_660_MGNA_OFFSET_UV;
> +			*slope = RR_ADC_CHG_TEMP_660_MGNA_SLOPE_UV_PER_C;
> +		}
> +	} else if (chip->pmic->subtype == PMI8998_SUBTYPE) {
> +		switch (chip->pmic->fab_id) {
> +		case PMI8998_FAB_ID_GF:
> +			*offset = RR_ADC_CHG_TEMP_GF_OFFSET_UV;
> +			*slope = RR_ADC_CHG_TEMP_GF_SLOPE_UV_PER_C;
> +			break;
> +		case PMI8998_FAB_ID_SMIC:
> +			*offset = RR_ADC_CHG_TEMP_SMIC_OFFSET_UV;
> +			*slope = RR_ADC_CHG_TEMP_SMIC_SLOPE_UV_PER_C;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	} else {
> +		return -EINVAL;
> +	}
> +

Unreachable so remove.

> +	return 0;
> +}
> +


> +static int rradc_prepare_batt_id_conversion(struct rradc_chip *chip,
> +					    enum rradc_channel_id chan_id,
> +					    u16 *data)
> +{
> +	int ret, batt_id_delay;
> +
> +	ret = regmap_update_bits(chip->regmap, chip->base + RR_ADC_BATT_ID_CTRL,
> +				 RR_ADC_BATT_ID_CTRL_CHANNEL_CONV,
> +				 RR_ADC_BATT_ID_CTRL_CHANNEL_CONV);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "Enabling BATT ID channel failed:%d\n", ret);
> +		return ret;
> +	}
> +
> +	if (chip->batt_id_delay != -EINVAL) {
As mentioned below, can you avoid this special casing by just reading
back the value if it's not provided in DT and then updating it
to the same thing here (should be harmless I think?)

For that matter why do you need to write this every time rather than a
single time at boot?

> +		batt_id_delay =
> +			FIELD_PREP(BATT_ID_SETTLE_MASK, chip->batt_id_delay);
> +		ret = regmap_update_bits(chip->regmap,
> +					 chip->base + RR_ADC_BATT_ID_CFG,
> +					 batt_id_delay, batt_id_delay);
> +		if (ret < 0) {
> +			dev_err(chip->dev,
> +				"BATT_ID settling time config failed:%d\n",
> +				ret);
> +			goto out_disable_batt_id;
> +		}
> +	}
> +
> +	ret = regmap_update_bits(chip->regmap,
> +				 chip->base + RR_ADC_BATT_ID_TRIGGER,
> +				 RR_ADC_TRIGGER_CTL, RR_ADC_TRIGGER_CTL);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "BATT_ID trigger set failed:%d\n", ret);
> +		goto out_disable_batt_id;
> +	}
> +
> +	ret = rradc_read_status_in_cont_mode(chip, chan_id);
> +
> +	/*
> +	 * Reset registers back to default values
> +	 */
> +	regmap_update_bits(chip->regmap, chip->base + RR_ADC_BATT_ID_TRIGGER,
> +			   RR_ADC_TRIGGER_CTL, 0);
> +
> +out_disable_batt_id:
> +	regmap_update_bits(chip->regmap, chip->base + RR_ADC_BATT_ID_CTRL,
> +			   RR_ADC_BATT_ID_CTRL_CHANNEL_CONV, 0);
> +
> +	return ret;
> +}
> +

> +static int rradc_read_scale(struct rradc_chip *chip, int chan_id, int *val,
> +			    int *val2)
> +{
> +	int64_t fab_offset, fab_slope;
> +	int ret;
> +
> +	ret = rradc_get_fab_coeff(chip, &fab_offset, &fab_slope);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "Unable to get fab id coefficients\n");
> +		return -EINVAL;
> +	}
> +
> +	switch (chan_id) {
> +	case RR_ADC_SKIN_TEMP:
> +		*val = MILLI / RR_ADC_BATT_THERM_LSB_K;
> +		return IIO_VAL_INT;

Why not IIO_VAL_FRACTIONAL;

> +	case RR_ADC_USBIN_I:
> +		*val = RR_ADC_CURR_USBIN_INPUT_FACTOR_MIL *
> +		       RR_ADC_FS_VOLTAGE_MV;
> +		*val2 = RR_ADC_CHAN_MSB;
> +		return IIO_VAL_FRACTIONAL;

IIO_VAL_FRACTIONAL_LOG2 might be better here though it doesn't really matter.

> +	case RR_ADC_DCIN_I:
> +		*val = RR_ADC_CURR_INPUT_FACTOR * RR_ADC_FS_VOLTAGE_MV;
> +		*val2 = RR_ADC_CHAN_MSB;
> +		return IIO_VAL_FRACTIONAL;
> +	case RR_ADC_USBIN_V:
> +	case RR_ADC_DCIN_V:
> +		*val = RR_ADC_VOLT_INPUT_FACTOR * RR_ADC_FS_VOLTAGE_MV * MILLI;
> +		*val2 = RR_ADC_CHAN_MSB;
> +		return IIO_VAL_FRACTIONAL;
> +	case RR_ADC_GPIO:
> +		*val = RR_ADC_GPIO_FS_RANGE;
> +		*val2 = RR_ADC_CHAN_MSB;
> +		return IIO_VAL_FRACTIONAL;
> +	case RR_ADC_CHG_TEMP:
> +		*val = -RR_ADC_TEMP_FS_VOLTAGE_NUM;
> +		*val2 = div64_s64(RR_ADC_TEMP_FS_VOLTAGE_DEN * RR_ADC_CHAN_MSB *
> +					  fab_slope,
> +				  MILLI);

Add a comment here on why you need to divide by MILLI to keep this in range
as opposed to making MILLI part of the val value.

> +
> +		return IIO_VAL_FRACTIONAL;
> +	case RR_ADC_DIE_TEMP:
> +		*val = RR_ADC_TEMP_FS_VOLTAGE_NUM;
> +		*val2 = RR_ADC_TEMP_FS_VOLTAGE_DEN * RR_ADC_CHAN_MSB *
> +			RR_ADC_DIE_TEMP_SLOPE;
> +
> +		return IIO_VAL_FRACTIONAL;
> +	default:
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int rradc_read_offset(struct rradc_chip *chip, int chan_id, int *val)
> +{
> +	int64_t fab_offset, fab_slope;
> +	int64_t offset1, offset2;
> +	int ret;
> +
> +	switch (chan_id) {
> +	case RR_ADC_SKIN_TEMP:
> +		/*
> +		 * Offset from kelvin to degC, divided by the
> +		 * scale factor (250). We lose some precision here.
> +		 * 273150 / 250 = 1092.6
> +		 */
> +		*val = div64_s64(ABSOLUTE_ZERO_MILLICELSIUS,
> +				 (MILLI / RR_ADC_BATT_THERM_LSB_K));
> +		return IIO_VAL_INT;
> +	case RR_ADC_CHG_TEMP:
> +		ret = rradc_get_fab_coeff(chip, &fab_offset, &fab_slope);
> +		if (ret < 0) {
> +			dev_err(chip->dev,
> +				"Unable to get fab id coefficients\n");
> +			return -EINVAL;
> +		}
> +		offset1 = -(fab_offset * RR_ADC_TEMP_FS_VOLTAGE_DEN *
> +			    RR_ADC_CHAN_MSB);
> +		offset1 += (int64_t)RR_ADC_TEMP_FS_VOLTAGE_NUM / (int64_t)2;

For constants 2ULL etc will force the type and is neater.
It gets less obvious when they are hidden behind defines as it then
isn't visible here.  Check each of the type casts are actually useful. I
doubt the one above is.

> +		offset1 = div64_s64(offset1,
> +				    (int64_t)(RR_ADC_TEMP_FS_VOLTAGE_NUM));
> +
> +		offset2 = (int64_t)RR_ADC_CHG_TEMP_OFFSET_MILLI_DEGC *
> +			  RR_ADC_TEMP_FS_VOLTAGE_DEN * RR_ADC_CHAN_MSB *
> +			  (int64_t)fab_slope;
> +		offset2 += ((int64_t)MILLI * RR_ADC_TEMP_FS_VOLTAGE_NUM) / 2;
> +		offset2 = div64_s64(
> +			offset2, ((int64_t)MILLI * RR_ADC_TEMP_FS_VOLTAGE_NUM));
> +
> +		/*
> +		 * The -1 is to compensate for lost precision.
> +		 * It should actually be -0.7906976744186046.
> +		 * This works out to every value being off
> +		 * by about +91 after applying offset and scale.

What's +91 mean in typical case?  Millidegrees?

> +		 */
> +		*val = (int)(offset1 - offset2 - 1);
> +		return IIO_VAL_INT;
> +	case RR_ADC_DIE_TEMP:
> +		offset1 = -RR_ADC_DIE_TEMP_OFFSET *
> +			  (int64_t)RR_ADC_TEMP_FS_VOLTAGE_DEN *
> +			  (int64_t)RR_ADC_CHAN_MSB;
> +		offset1 = div64_s64(offset1, RR_ADC_TEMP_FS_VOLTAGE_NUM);
> +
> +		offset2 = -(int64_t)RR_ADC_CHG_TEMP_OFFSET_MILLI_DEGC *
> +			  RR_ADC_TEMP_FS_VOLTAGE_DEN * RR_ADC_CHAN_MSB *
> +			  RR_ADC_DIE_TEMP_SLOPE;
> +		offset2 = div64_s64(offset2,
> +				    ((int64_t)RR_ADC_TEMP_FS_VOLTAGE_NUM));
> +
> +		/*
> +		 * The result is -339, it should be
> +		 * -338.69789, this results in the calculated
> +		 * die temp being off by -0.004 - -0.0175
> +		 */
> +		*val = (int)(offset1 - offset2);
> +		return IIO_VAL_INT;
> +	default:
> +		break;
> +	}
> +	return -EINVAL;
> +}
> +
> +static int rradc_read_raw(struct iio_dev *indio_dev,
> +			  struct iio_chan_spec const *chan_spec, int *val,
> +			  int *val2, long mask)
> +{
> +	struct rradc_chip *chip = iio_priv(indio_dev);
> +	const struct rradc_channel *chan;
> +	int ret;
> +	u16 adc_code;
> +
> +	if (chan_spec->channel >= RR_ADC_CHAN_MAX) {
> +		dev_err(chip->dev, "Invalid channel index:%d\n",
> +			chan_spec->channel);
> +		return -EINVAL;
> +	}
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE:
> +		return rradc_read_scale(chip, chan_spec->channel, val, val2);
> +	case IIO_CHAN_INFO_OFFSET:
> +		return rradc_read_offset(chip, chan_spec->channel, val);
> +	default:
> +		break;
> +	}
> +
> +	chan = &rradc_chans[chan_spec->channel];
> +	ret = rradc_do_conversion(chip, chan_spec->channel, &adc_code);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		*val = adc_code;
> +		return IIO_VAL_INT;
> +	case IIO_CHAN_INFO_PROCESSED:
> +		if (chan->scale_fn)
> +			chan->scale_fn(chip, adc_code, val);
> +		else
> +			return -EINVAL;
> +		return IIO_VAL_INT;
> +	default:
> +		return -EINVAL;
> +	}

The above is a complex flow just to avoid duplicating 3 lines.  I'd
just duplicate them as it's easier to read.

	switch (mask) {
	case IIO_CHAN_INFO_SCALE:
		return rradc_read_scale(chip, chan_spec->channel, val, val2);
	case IIO_CHAN_INFO_OFFSET:
		return rradc_read_offset(chip, chan_spec->channel, val);
	case IIO_CHAN_INFO_RAW:
		chan = &rradc_chans[chan_spec->channel];
		ret = rradc_do_conversion(chip, chan_spec->channel, &adc_code);
		if (ret < 0)
			return ret;

		*val = adc_code;
		return IIO_VAL_INT;
	case IIO_CHAN_INFO_PROCESSED:
		chan = &rradc_chans[chan_spec->channel];
		if (!chan->scale_fn)
			return -EINVAL; //if the check makes sense do it early.
		ret = rradc_do_conversion(chip, chan_spec->channel, &adc_code);
		if (ret < 0)
			return ret;

		chan->scale_fn(chip, adc_code, val);
		return IIO_VAL_INT;
	default:
		return -EINVAL;
	}

> +}
> +
> +static int rradc_read_label(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan, char *label)
> +{
> +	return snprintf(label, PAGE_SIZE, "%s\n",
> +			rradc_chans[chan->channel].label);
> +}
> +
> +static const struct iio_info rradc_info = {
> +	.read_raw = rradc_read_raw,
> +	.read_label = rradc_read_label,
> +};
> +
> +static const struct rradc_channel rradc_chans[RR_ADC_CHAN_MAX] = {
> +	{
> +		.label = "batt_id",
> +		.scale_fn = rradc_post_process_batt_id,
> +		.lsb = RR_ADC_BATT_ID_5_LSB,
> +		.status = RR_ADC_BATT_ID_STS,
> +		.size = 6,
> +		.trigger_addr = RR_ADC_BATT_ID_TRIGGER,
> +		.trigger_mask = BIT(0),
> +	},
> +	{
> +		.label = "batt",
> +		.lsb = RR_ADC_BATT_THERM_LSB,
> +		.status = RR_ADC_BATT_THERM_STS,
> +		.size = 2,
> +		.trigger_addr = RR_ADC_BATT_THERM_TRIGGER,
> +	},
> +	{
> +		.label = "pmi8998_skin",
> +		.lsb = RR_ADC_SKIN_TEMP_LSB,
> +		.status = RR_ADC_AUX_THERM_STS,
> +		.size = 2,
> +		.trigger_addr = RR_ADC_AUX_THERM_TRIGGER,
> +	},
> +	{
> +		.label = "usbin_i",
> +		.lsb = RR_ADC_USB_IN_I_LSB,
> +		.status = RR_ADC_USB_IN_I_STS,
> +		.size = 2,
> +		.trigger_addr = RR_ADC_USB_IN_I_TRIGGER,
> +	},
> +	{
> +		.label = "usbin_v",
> +		.lsb = RR_ADC_USB_IN_V_LSB,
> +		.status = RR_ADC_USB_IN_V_STS,
> +		.size = 2,
> +		.trigger_addr = RR_ADC_USB_IN_V_TRIGGER,
> +		.trigger_mask = BIT(7),
> +	},
> +	{
> +		.label = "dcin_i",
> +		.lsb = RR_ADC_DC_IN_I_LSB,
> +		.status = RR_ADC_DC_IN_I_STS,
> +		.size = 2,
> +		.trigger_addr = RR_ADC_DC_IN_I_TRIGGER,
> +	},
> +	{
> +		.label = "dcin_v",
> +		.lsb = RR_ADC_DC_IN_V_LSB,
> +		.status = RR_ADC_DC_IN_V_STS,
> +		.size = 2,
> +		.trigger_addr = RR_ADC_DC_IN_V_TRIGGER,
> +	},
> +	{
> +		.label = "pmi8998_die",
> +		.lsb = RR_ADC_PMI_DIE_TEMP_LSB,
> +		.status = RR_ADC_PMI_DIE_TEMP_STS,
> +		.size = 2,
> +		.trigger_addr = RR_ADC_PMI_DIE_TEMP_TRIGGER,
> +		.trigger_mask = RR_ADC_TRIGGER_EVERY_CYCLE,
> +	},
> +	{
> +		.label = "chg",
> +		.lsb = RR_ADC_CHARGER_TEMP_LSB,
> +		.status = RR_ADC_CHARGER_TEMP_STS,
> +		.size = 2,
> +		.trigger_addr = RR_ADC_CHARGER_TEMP_TRIGGER,
> +	},
> +	{
> +		.label = "gpio",
> +		.lsb = RR_ADC_GPIO_LSB,
> +		.status = RR_ADC_GPIO_STS,
> +		.size = 2,
> +		.trigger_addr = RR_ADC_GPIO_TRIGGER,
> +	},
> +};
> +
> +static const struct iio_chan_spec rradc_iio_chans[RR_ADC_CHAN_MAX] = {
> +	{
> +		.type = IIO_RESISTANCE,
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
> +		.channel = RR_ADC_BATT_ID,

Normal IIO convention (though not strictly rule as we allow gaps in
channel indexes) is to index from 0 for each channel type.

	in_resistance0_raw
	in_temp0_raw
	in_temp1_raw
	in_current0_raw
	etc

If you need to store an index for internal use, then .address tends to
get used for that.

> +		.indexed = 1,
> +	},
> +	{

Could use the more compact
	}, {
not important though, just gets more code on my screen ;)

> +		.type = IIO_TEMP,
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
> +		.channel = RR_ADC_BATT_THERM,
> +		.indexed = 1,
> +	},
> +	{
> +		.type = IIO_TEMP,
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
> +				      BIT(IIO_CHAN_INFO_SCALE) |
> +				      BIT(IIO_CHAN_INFO_OFFSET),
> +		.channel = RR_ADC_SKIN_TEMP,
> +		.indexed = 1,
> +	},
> +	{
> +		.type = IIO_CURRENT,
> +		.info_mask_separate =
> +			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE),
> +		.channel = RR_ADC_USBIN_I,
> +		.indexed = 1,
> +	},
> +	{
> +		.type = IIO_VOLTAGE,
> +		.info_mask_separate =
> +			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE),
> +		.channel = RR_ADC_USBIN_V,
> +		.indexed = 1,
> +	},
> +	{
> +		.type = IIO_CURRENT,
> +		.info_mask_separate =
> +			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE),
> +		.channel = RR_ADC_DCIN_I,
> +		.indexed = 1,
> +	},
> +	{
> +		.type = IIO_VOLTAGE,
> +		.info_mask_separate =
> +			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE),
> +		.channel = RR_ADC_DCIN_V,
> +		.indexed = 1,
> +	},
> +	{
> +		.type = IIO_TEMP,
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
> +				      BIT(IIO_CHAN_INFO_SCALE) |
> +				      BIT(IIO_CHAN_INFO_OFFSET),
> +		.channel = RR_ADC_DIE_TEMP,
> +		.indexed = 1,
> +	},
> +	{
> +		.type = IIO_TEMP,
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
> +				      BIT(IIO_CHAN_INFO_OFFSET) |
> +				      BIT(IIO_CHAN_INFO_SCALE),
> +		.channel = RR_ADC_CHG_TEMP,
> +		.indexed = 1,
> +	},
> +	{
> +		.type = IIO_VOLTAGE,
> +		.info_mask_separate =
> +			BIT(IIO_CHAN_INFO_RAW) | BIT(IIO_CHAN_INFO_SCALE),

I'd be consistent in how you format these.  As it is 2 lines anyway
		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
				      BIT(IIO_CHAN_INFO_SCALE);
is more consistent with the cases where you have 3 elements.

> +		.channel = RR_ADC_GPIO,
> +		.indexed = 1,
> +	},
> +};
> +
> +static int rradc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct iio_dev *indio_dev;
> +	struct rradc_chip *chip;
> +	int ret, i;
> +
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*chip));
> +	if (!indio_dev)
> +		return -ENOMEM;
> +
> +	chip = iio_priv(indio_dev);
> +	chip->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!chip->regmap) {
> +		dev_err(dev, "Couldn't get parent's regmap\n");
> +		return -EINVAL;
> +	}
> +
> +	chip->dev = dev;
> +	mutex_init(&chip->conversion_lock);
> +
> +	ret = device_property_read_u32(dev, "reg", &chip->base);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "Couldn't find reg address, ret = %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	chip->batt_id_delay = -EINVAL;

As you never return the error code, I'd be tempted to use -1 as the
marker instead of -EINVAL.  Where you check it could also be cleaner
as < 0 rather than a specific match to -EINVAL.

It would be different if you were to store multiple error values in
there but with just one -EINVAL has no strong relevance as you
are using it both for not present and for failure to match.

I'm a bit confused by the intent here in general.  Is it meant to be
a way to allow DT to not specify the value because firmware has
already set it to something suitable?   If so why not just read it
back from the device and avoid the special case paths?
 
> +	ret = device_property_read_u32(dev, "qcom,batt-id-delay-ms",
> +				       &chip->batt_id_delay);
> +	if (!ret) {
> +		for (i = 0; i < RRADC_BATT_ID_DELAY_MAX; i++) {
> +			if (chip->batt_id_delay == batt_id_delays[i])
> +				break;
> +		}
> +		if (i == RRADC_BATT_ID_DELAY_MAX)
> +			chip->batt_id_delay = -EINVAL;
> +	}
> +
> +	/* Get the PMIC revision ID, we need to handle some varying coefficients */
> +	chip->pmic = qcom_pmic_get(chip->dev);
> +	if (IS_ERR_VALUE(chip->pmic)) {
> +		dev_err(chip->dev, "Unable to get reference to PMIC device\n");
> +		return PTR_ERR(chip->pmic);
> +	}
> +
> +	indio_dev->name = pdev->name;

This should be the part number.  I suspect that's not what pdev->name is
set to.  In this case I'd expect something like pmi8998-rradc

Note we've missed this in review in the past so there are examples in tree
we can't now fix as it would be an ABI change :(


> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->info = &rradc_info;
> +	indio_dev->channels = rradc_iio_chans;
> +	indio_dev->num_channels = RR_ADC_CHAN_MAX;

Whilst obviously same thing, preference for ARRAY_SIZE(rradc_iio_chans);
to save reviewers having to check they are the same size.

> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}
