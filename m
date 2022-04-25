Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1139550E3F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Apr 2022 17:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242598AbiDYPG5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 11:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242706AbiDYPGy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 11:06:54 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD99BC8E
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 08:03:48 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id d5so6083770wrb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 08:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ewfzCt6PMLpZiYFpWwQvEOwRWap5vYUC7ioVDl1T6I4=;
        b=KXMKgSm99MB0M6aq9IZrvVG+SM0iCs6ImfcpCqmSy7f0sn2r+J0AGfOo1g5I13uHE1
         FRIEgN9KfW/EBqiYOlHFwQeYr44TcUf3g+pJj8qeFnyaeGrHHcldtpOa1OoopaFvGQsD
         1yMDUA3yLCimvMHfD16/OVThtJWNW6skR1XFaAwJFtoRN5B1bpJSzcxRKdhMHqU1aBdV
         nS6zpKjyJUHgLL9jKHDlOB+vYN7sp9x0aY3P4yslp4hbnoMHeAM/S2wXbxbNPk95mnag
         /HmwlN4Tzf+phhG924ocFLcUEnm31xMiqSprMTEaB4BEfzHVzJ9OAKmSzQxtvtAF5BSF
         Iskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ewfzCt6PMLpZiYFpWwQvEOwRWap5vYUC7ioVDl1T6I4=;
        b=XrYzGAijN0t2/YhIItUAv3Xwpck3BKNDDxjvkNwGkpg9sIZR94ekng2n6tfV1xwup0
         vL0txS35aXMwXNn1+oHz/Xv7dO1+puYJrHb3BKeYwBMKQGQu2ziZ7yjfwYX2UudNJM/q
         o59OcKefzdr3MS+rbEY5XcxYufT4je0tZUuTkU80e4IVJhh2YEUDcE04AlNbnA2/8M5W
         Mx71p9a1B9H1GVaWBzHZe4S23g+tRVKwvkhX7KJ3iRIJh7W0F1M0s65Z58V6HnoVmBo+
         4fohwMsoDFV9xTNejNsTlr7IRbcTPn8ltnC8ZsdWALr9oODJRlxcrG2hXnjzx3H2cis4
         IHNQ==
X-Gm-Message-State: AOAM530lN/DxUXI/GC/TaWhhHclr0U31wv2wXCO0hEWhn5kdMHn19qXs
        JWUbIrGpenC4M/p6huamM78PHQ==
X-Google-Smtp-Source: ABdhPJwUMHiW+olBZWfHEn1Lyj8Ba6MBbFi2T8we3fA/RXD5a2zwfdAtdxvNu9TPPOGi4MzyRKlIYg==
X-Received: by 2002:a5d:5309:0:b0:20a:cee3:9e3f with SMTP id e9-20020a5d5309000000b0020acee39e3fmr10981313wrv.570.1650899026767;
        Mon, 25 Apr 2022 08:03:46 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id v6-20020a056000144600b0020a9a1627e2sm9315232wrx.15.2022.04.25.08.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 08:03:45 -0700 (PDT)
Date:   Mon, 25 Apr 2022 16:03:43 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v13 2/9] mfd: qcom-spmi-pmic: expose the PMIC revid
 information to clients
Message-ID: <Yma4T1+AglaISe2l@google.com>
References: <20220323162820.110806-1-caleb@connolly.tech>
 <20220323162820.110806-3-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220323162820.110806-3-caleb@connolly.tech>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 23 Mar 2022, Caleb Connolly wrote:
> From: Caleb Connolly <caleb.connolly@linaro.org>
> 
> Some PMIC functions such as the RRADC need to be aware of the PMIC
> chip revision information to implement errata or otherwise adjust
> behaviour, export the PMIC information to enable this.
> 
> This is specifically required to enable the RRADC to adjust
> coefficients based on which chip fab the PMIC was produced in,
> this can vary per unique device and therefore has to be read at
> runtime.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/mfd/qcom-spmi-pmic.c      | 261 +++++++++++++++++++-----------
>  include/soc/qcom/qcom-spmi-pmic.h |  60 +++++++
>  2 files changed, 231 insertions(+), 90 deletions(-)
>  create mode 100644 include/soc/qcom/qcom-spmi-pmic.h

Apologies for the delay.  I've been snowed under.

> diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
> index 1cacc00aa6c9..d8e54d9d3448 100644
> --- a/drivers/mfd/qcom-spmi-pmic.c
> +++ b/drivers/mfd/qcom-spmi-pmic.c
> @@ -3,11 +3,16 @@
>   * Copyright (c) 2014, The Linux Foundation. All rights reserved.
>   */
>  
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/gfp.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/spmi.h>
> +#include <linux/types.h>
>  #include <linux/regmap.h>
>  #include <linux/of_platform.h>
> +#include <soc/qcom/qcom-spmi-pmic.h>
>  
>  #define PMIC_REV2		0x101
>  #define PMIC_REV3		0x102
> @@ -17,106 +22,151 @@
>  
>  #define PMIC_TYPE_VALUE		0x51
>  
> -#define COMMON_SUBTYPE		0x00
> -#define PM8941_SUBTYPE		0x01
> -#define PM8841_SUBTYPE		0x02
> -#define PM8019_SUBTYPE		0x03
> -#define PM8226_SUBTYPE		0x04
> -#define PM8110_SUBTYPE		0x05
> -#define PMA8084_SUBTYPE		0x06
> -#define PMI8962_SUBTYPE		0x07
> -#define PMD9635_SUBTYPE		0x08
> -#define PM8994_SUBTYPE		0x09
> -#define PMI8994_SUBTYPE		0x0a
> -#define PM8916_SUBTYPE		0x0b
> -#define PM8004_SUBTYPE		0x0c
> -#define PM8909_SUBTYPE		0x0d
> -#define PM8028_SUBTYPE		0x0e
> -#define PM8901_SUBTYPE		0x0f
> -#define PM8950_SUBTYPE		0x10
> -#define PMI8950_SUBTYPE		0x11
> -#define PM8998_SUBTYPE		0x14
> -#define PMI8998_SUBTYPE		0x15
> -#define PM8005_SUBTYPE		0x18
> -#define PM660L_SUBTYPE		0x1A
> -#define PM660_SUBTYPE		0x1B
> -#define PM8150_SUBTYPE		0x1E
> -#define PM8150L_SUBTYPE		0x1f
> -#define PM8150B_SUBTYPE		0x20
> -#define PMK8002_SUBTYPE		0x21
> -#define PM8009_SUBTYPE		0x24
> -#define PM8150C_SUBTYPE		0x26
> -#define SMB2351_SUBTYPE		0x29
> +struct qcom_spmi_dev {
> +	int num_usids;
> +	struct qcom_spmi_pmic pmic;
> +};
> +
> +#define N_USIDS(n)		((void *)n)
>  
>  static const struct of_device_id pmic_spmi_id_table[] = {
> -	{ .compatible = "qcom,pm660",     .data = (void *)PM660_SUBTYPE },
> -	{ .compatible = "qcom,pm660l",    .data = (void *)PM660L_SUBTYPE },
> -	{ .compatible = "qcom,pm8004",    .data = (void *)PM8004_SUBTYPE },
> -	{ .compatible = "qcom,pm8005",    .data = (void *)PM8005_SUBTYPE },
> -	{ .compatible = "qcom,pm8019",    .data = (void *)PM8019_SUBTYPE },
> -	{ .compatible = "qcom,pm8028",    .data = (void *)PM8028_SUBTYPE },
> -	{ .compatible = "qcom,pm8110",    .data = (void *)PM8110_SUBTYPE },
> -	{ .compatible = "qcom,pm8150",    .data = (void *)PM8150_SUBTYPE },
> -	{ .compatible = "qcom,pm8150b",   .data = (void *)PM8150B_SUBTYPE },
> -	{ .compatible = "qcom,pm8150c",   .data = (void *)PM8150C_SUBTYPE },
> -	{ .compatible = "qcom,pm8150l",   .data = (void *)PM8150L_SUBTYPE },
> -	{ .compatible = "qcom,pm8226",    .data = (void *)PM8226_SUBTYPE },
> -	{ .compatible = "qcom,pm8841",    .data = (void *)PM8841_SUBTYPE },
> -	{ .compatible = "qcom,pm8901",    .data = (void *)PM8901_SUBTYPE },
> -	{ .compatible = "qcom,pm8909",    .data = (void *)PM8909_SUBTYPE },
> -	{ .compatible = "qcom,pm8916",    .data = (void *)PM8916_SUBTYPE },
> -	{ .compatible = "qcom,pm8941",    .data = (void *)PM8941_SUBTYPE },
> -	{ .compatible = "qcom,pm8950",    .data = (void *)PM8950_SUBTYPE },
> -	{ .compatible = "qcom,pm8994",    .data = (void *)PM8994_SUBTYPE },
> -	{ .compatible = "qcom,pm8998",    .data = (void *)PM8998_SUBTYPE },
> -	{ .compatible = "qcom,pma8084",   .data = (void *)PMA8084_SUBTYPE },
> -	{ .compatible = "qcom,pmd9635",   .data = (void *)PMD9635_SUBTYPE },
> -	{ .compatible = "qcom,pmi8950",   .data = (void *)PMI8950_SUBTYPE },
> -	{ .compatible = "qcom,pmi8962",   .data = (void *)PMI8962_SUBTYPE },
> -	{ .compatible = "qcom,pmi8994",   .data = (void *)PMI8994_SUBTYPE },
> -	{ .compatible = "qcom,pmi8998",   .data = (void *)PMI8998_SUBTYPE },
> -	{ .compatible = "qcom,pmk8002",   .data = (void *)PMK8002_SUBTYPE },
> -	{ .compatible = "qcom,smb2351",   .data = (void *)SMB2351_SUBTYPE },
> -	{ .compatible = "qcom,spmi-pmic", .data = (void *)COMMON_SUBTYPE },
> +	{ .compatible = "qcom,pm660", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pm660l", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pm8004", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pm8005", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pm8019", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pm8028", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pm8110", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pm8150", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pm8150b", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pm8150c", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pm8150l", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pm8226", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pm8841", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pm8901", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pm8909", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pm8916", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pm8941", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pm8950", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pm8994", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pm8998", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pma8084", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pmd9635", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pmi8950", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pmi8962", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pmi8994", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pmi8998", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,pmk8002", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,smb2351", .data = N_USIDS(2) },
> +	{ .compatible = "qcom,spmi-pmic", .data = N_USIDS(1) },
>  	{ }
>  };
>  
> -static void pmic_spmi_show_revid(struct regmap *map, struct device *dev)
> +#undef N_USIDS

Why is this here?  Can't we use a unique macro instead?

> +/*
> + * A PMIC can be represented by multiple SPMI devices, but
> + * only the base PMIC device will contain a reference to
> + * the revision information.
> + *
> + * This function takes a pointer to a function device and
> + * returns a pointer to the base PMIC device.
> + *
> + * This only supports PMICs with 1 or 2 USIDs.
> + */
> +static struct spmi_device *qcom_pmic_get_base_usid(struct device *dev)
>  {
> -	unsigned int rev2, minor, major, type, subtype;
> -	const char *name = "unknown";
> -	int ret, i;
> +	struct spmi_device *sdev;
> +	struct qcom_spmi_dev *ctx;
> +	struct device_node *spmi_bus;
> +	struct device_node *other_usid = NULL;
> +	int function_parent_usid, ret;
> +	u32 pmic_addr;
>  
> -	ret = regmap_read(map, PMIC_TYPE, &type);
> -	if (ret < 0)
> -		return;
> +	if (!of_match_device(pmic_spmi_id_table, dev))
> +		return ERR_PTR(-EINVAL);

Can this happen?  How else would the device have been enumerated?

> +	sdev = to_spmi_device(dev);
> +	ctx = spmi_device_get_drvdata(sdev);

This function looks like abstraction for the sake of abstraction.

Why not just use dev_get_drvdata()?

> +	/*
> +	 * Quick return if the function device is already in the base
> +	 * USID. This will always be hit for PMICs with only 1 USID.
> +	 */
> +	if (sdev->usid % ctx->num_usids == 0)
> +		return sdev;
> +
> +	function_parent_usid = sdev->usid;
> +
> +	/*
> +	 * Walk through the list of PMICs until we find the sibling USID.
> +	 * The goal is to find the first USID which is less than the
> +	 * number of USIDs in the PMIC away, e.g. for a PMIC with 2 USIDs

"array" perhaps?

> +	 * where the function device is under USID 3, we want to find the
> +	 * device for USID 2.
> +	 */
> +	spmi_bus = of_get_parent(sdev->dev.of_node);
> +	do {
> +		other_usid = of_get_next_child(spmi_bus, other_usid);

'\n'

> +		ret = of_property_read_u32_index(other_usid, "reg", 0, &pmic_addr);
> +		if (ret)
> +			return ERR_PTR(ret);

'\n'

> +		sdev = spmi_device_from_of(other_usid);
> +		if (sdev == NULL) {

if (!sdev)

> +			/*
> +			 * If the base USID for this PMIC hasn't probed yet
> +			 * but the secondary USID has, then we need to defer
> +			 * the function driver so that it will attempt to
> +			 * probe again when the base USID is ready.
> +			 */
> +			if (pmic_addr == function_parent_usid  - (ctx->num_usids - 1))

Double "  ".

Over-bracketing of statements with matching operands.

> +				return ERR_PTR(-EPROBE_DEFER);
> +
> +			continue;
> +		}
> +
> +		if (pmic_addr == function_parent_usid  - (ctx->num_usids - 1))
> +			return sdev;

Wouldn't it be better written like this:

> +		if (pmic_addr == function_parent_usid - (ctx->num_usids - 1)) {
> +		        sdev = spmi_device_from_of(other_usid);
> +		        if (!sdev)
> +			        /*
> +			         * If the base USID for this PMIC hasn't probed yet
> +			         * but the secondary USID has, then we need to defer
> +			         * the function driver so that it will attempt to
> +			         * probe again when the base USID is ready.
> +			         */
> +				return ERR_PTR(-EPROBE_DEFER);
> +                     return sdev;
> +		}

[...]

> +	} while (other_usid->sibling);
> +
> +	return ERR_PTR(-ENODATA);
> +}
> +
> +static inline void pmic_print_info(struct device *dev, struct qcom_spmi_pmic *pmic)
> +{
> +	dev_dbg(dev, "%x: %s v%d.%d\n",
> +		pmic->subtype, pmic->name, pmic->major, pmic->minor);
> +}

More abstraction for no apparent reason.

> -	if (type != PMIC_TYPE_VALUE)
> -		return;
> +static int pmic_spmi_load_revid(struct regmap *map, struct device *dev,
> +				 struct qcom_spmi_pmic *pmic)
> +{
> +	int ret;
>  
> -	ret = regmap_read(map, PMIC_SUBTYPE, &subtype);
> +	ret = regmap_read(map, PMIC_TYPE, &pmic->type);
>  	if (ret < 0)
> -		return;
> +		return ret;
>  
> -	for (i = 0; i < ARRAY_SIZE(pmic_spmi_id_table); i++) {
> -		if (subtype == (unsigned long)pmic_spmi_id_table[i].data)
> -			break;
> -	}
> +	if (pmic->type != PMIC_TYPE_VALUE)
> +		return ret;
>  
> -	if (i != ARRAY_SIZE(pmic_spmi_id_table))
> -		name = pmic_spmi_id_table[i].compatible;
> +	ret = regmap_read(map, PMIC_SUBTYPE, &pmic->subtype);
> +	if (ret < 0)
> +		return ret;
> +
> +	pmic->name = of_match_device(pmic_spmi_id_table, dev)->compatible;
>  
> -	ret = regmap_read(map, PMIC_REV2, &rev2);
> +	ret = regmap_read(map, PMIC_REV2, &pmic->rev2);
>  	if (ret < 0)
> -		return;
> +		return ret;
>  
> -	ret = regmap_read(map, PMIC_REV3, &minor);
> +	ret = regmap_read(map, PMIC_REV3, &pmic->minor);
>  	if (ret < 0)
> -		return;
> +		return ret;
>  
> -	ret = regmap_read(map, PMIC_REV4, &major);
> +	ret = regmap_read(map, PMIC_REV4, &pmic->major);
>  	if (ret < 0)
> -		return;
> +		return ret;
>  
>  	/*
>  	 * In early versions of PM8941 and PM8226, the major revision number
> @@ -124,15 +174,34 @@ static void pmic_spmi_show_revid(struct regmap *map, struct device *dev)
>  	 * Increment the major revision number here if the chip is an early
>  	 * version of PM8941 or PM8226.
>  	 */
> -	if ((subtype == PM8941_SUBTYPE || subtype == PM8226_SUBTYPE) &&
> -	    major < 0x02)
> -		major++;
> +	if ((pmic->subtype == PM8941_SUBTYPE || pmic->subtype == PM8226_SUBTYPE) &&
> +	    pmic->major < 0x02)

Please define this magic number while you're at it.

> +		pmic->major++;
> +
> +	if (pmic->subtype == PM8110_SUBTYPE)
> +		pmic->minor = pmic->rev2;
> +
> +	pmic_print_info(dev, pmic);
>  
> -	if (subtype == PM8110_SUBTYPE)
> -		minor = rev2;
> +	return 0;
> +}
> +
> +/**
> + * qcom_pmic_get() - Get a pointer to the base PMIC device
> + *
> + * @dev: the pmic function device
> + * @return: the struct qcom_spmi_pmic* pointer associated with the function device
> + */
> +inline const struct qcom_spmi_pmic *qcom_pmic_get(struct device *dev)
> +{
> +	struct spmi_device *sdev = qcom_pmic_get_base_usid(dev->parent);
>  
> -	dev_dbg(dev, "%x: %s v%d.%d\n", subtype, name, major, minor);
> +	if (IS_ERR(sdev))
> +		return ERR_CAST(sdev);
> +
> +	return &((struct qcom_spmi_dev *)spmi_device_get_drvdata(sdev))->pmic;

This is horrible.  Please expand it out.

>  }
> +EXPORT_SYMBOL(qcom_pmic_get);
>  
>  static const struct regmap_config spmi_regmap_config = {
>  	.reg_bits	= 16,
> @@ -144,14 +213,26 @@ static const struct regmap_config spmi_regmap_config = {
>  static int pmic_spmi_probe(struct spmi_device *sdev)
>  {
>  	struct regmap *regmap;
> +	struct qcom_spmi_dev *ctx;
> +	int ret;
>  
>  	regmap = devm_regmap_init_spmi_ext(sdev, &spmi_regmap_config);
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
>  
> +	ctx = devm_kzalloc(&sdev->dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->num_usids = (long)of_device_get_match_data(&sdev->dev);

Why does this need to be long?

In fact, it's not is it?  It's an int:

   +struct qcom_spmi_dev {
   +	int num_usids;
   +	struct qcom_spmi_pmic pmic;
   +};

>  	/* Only the first slave id for a PMIC contains this information */
> -	if (sdev->usid % 2 == 0)
> -		pmic_spmi_show_revid(regmap, &sdev->dev);
> +	if (sdev->usid % ctx->num_usids == 0) {
> +		ret = pmic_spmi_load_revid(regmap, &sdev->dev, &ctx->pmic);
> +		if (ret < 0)
> +			return ret;
> +	}
> +	spmi_device_set_drvdata(sdev, ctx);
>  
>  	return devm_of_platform_populate(&sdev->dev);
>  }
> diff --git a/include/soc/qcom/qcom-spmi-pmic.h b/include/soc/qcom/qcom-spmi-pmic.h
> new file mode 100644
> index 000000000000..5400e6509fe8
> --- /dev/null
> +++ b/include/soc/qcom/qcom-spmi-pmic.h
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (c) 2021 Linaro. All rights reserved.
> + * Copyright (c) 2021 Caleb Connolly <caleb.connolly@linaro.org>

Your very own Copyright?  Why?

Any not Author: instead?

> + */
> +
> +#ifndef __QCOM_SPMI_PMIC_H__
> +#define __QCOM_SPMI_PMIC_H__
> +
> +#define COMMON_SUBTYPE		0x00
> +#define PM8941_SUBTYPE		0x01
> +#define PM8841_SUBTYPE		0x02
> +#define PM8019_SUBTYPE		0x03
> +#define PM8226_SUBTYPE		0x04
> +#define PM8110_SUBTYPE		0x05
> +#define PMA8084_SUBTYPE		0x06
> +#define PMI8962_SUBTYPE		0x07
> +#define PMD9635_SUBTYPE		0x08
> +#define PM8994_SUBTYPE		0x09
> +#define PMI8994_SUBTYPE		0x0a
> +#define PM8916_SUBTYPE		0x0b
> +#define PM8004_SUBTYPE		0x0c
> +#define PM8909_SUBTYPE		0x0d
> +#define PM8028_SUBTYPE		0x0e
> +#define PM8901_SUBTYPE		0x0f
> +#define PM8950_SUBTYPE		0x10
> +#define PMI8950_SUBTYPE		0x11
> +#define PM8998_SUBTYPE		0x14
> +#define PMI8998_SUBTYPE		0x15
> +#define PM8005_SUBTYPE		0x18
> +#define PM660L_SUBTYPE		0x1A
> +#define PM660_SUBTYPE		0x1B
> +#define PM8150_SUBTYPE		0x1E
> +#define PM8150L_SUBTYPE		0x1f
> +#define PM8150B_SUBTYPE		0x20
> +#define PMK8002_SUBTYPE		0x21
> +#define PM8009_SUBTYPE		0x24
> +#define PM8150C_SUBTYPE		0x26
> +#define SMB2351_SUBTYPE		0x29
> +
> +#define PMI8998_FAB_ID_SMIC	0x11
> +#define PMI8998_FAB_ID_GF	0x30
> +
> +#define PM660_FAB_ID_GF		0x0
> +#define PM660_FAB_ID_TSMC	0x2
> +#define PM660_FAB_ID_MX		0x3
> +
> +struct qcom_spmi_pmic {
> +	unsigned int type;
> +	unsigned int subtype;
> +	unsigned int major;
> +	unsigned int minor;
> +	unsigned int rev2;
> +	const char *name;
> +};
> +
> +struct device;

Can't you just include the correct header?

> +inline const struct qcom_spmi_pmic *qcom_pmic_get(struct device *dev);
> +
> +#endif /* __QCOM_SPMI_PMIC_H__ */

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
