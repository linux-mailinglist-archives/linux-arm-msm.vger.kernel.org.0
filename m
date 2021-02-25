Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 293BC324B7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 08:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235114AbhBYHr4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 02:47:56 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:40379 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233137AbhBYHrz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 02:47:55 -0500
X-Originating-IP: 86.250.253.134
Received: from xps13 (lfbn-tou-1-813-134.w86-250.abo.wanadoo.fr [86.250.253.134])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id CF320E0005;
        Thu, 25 Feb 2021 07:47:03 +0000 (UTC)
Date:   Thu, 25 Feb 2021 08:47:02 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v2 3/3] mtd: rawnand: qcom: Add support for secure
 regions in NAND memory
Message-ID: <20210225084702.2c753b99@xps13>
In-Reply-To: <20210225041129.58576-4-manivannan.sadhasivam@linaro.org>
References: <20210225041129.58576-1-manivannan.sadhasivam@linaro.org>
        <20210225041129.58576-4-manivannan.sadhasivam@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Manivannan,

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Thu,
25 Feb 2021 09:41:29 +0530:

> On a typical end product, a vendor may choose to secure some regions in
> the NAND memory which are supposed to stay intact between FW upgrades.
> The access to those regions will be blocked by a secure element like
> Trustzone. So the normal world software like Linux kernel should not
> touch these regions (including reading).
> 
> The regions are declared using a NAND chip DT property,
> "nand-secure-regions". So let's make use of this property and skip
> access to the secure regions present in a system.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

[...]

>  	config_nand_page_write(nandc);
> @@ -2830,7 +2865,8 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
>  	struct nand_chip *chip = &host->chip;
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  	struct device *dev = nandc->dev;
> -	int ret;
> +	struct property *prop;
> +	int ret, length, nr_elem;
>  
>  	ret = of_property_read_u32(dn, "reg", &host->cs);
>  	if (ret) {
> @@ -2886,6 +2922,24 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
>  		}
>  	}
>  
> +	/*
> +	 * Look for secure regions in the NAND chip. These regions are supposed
> +	 * to be protected by a secure element like Trustzone. So the read/write
> +	 * accesses to these regions will be blocked in the runtime by this
> +	 * driver.
> +	 */
> +	prop = of_find_property(dn, "nand-secure-regions", &length);

I'm not sure the nand- prefix on this property is needed here, but
whatever.

> +	if (prop) {
> +		nr_elem = length / sizeof(u32);
> +		host->nr_sec_regions = nr_elem / 2;
> +
> +		host->sec_regions = devm_kcalloc(dev, nr_elem, sizeof(u32), GFP_KERNEL);
> +		if (!host->sec_regions)
> +			return -ENOMEM;
> +
> +		of_property_read_u32_array(dn, "nand-secure-regions", host->sec_regions, nr_elem);
> +	}
> +

I would move this before nand_scan().

If you don't, you should bail out with a nand_cleanup() upon error.

>  	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
>  	if (ret)
>  		nand_cleanup(chip);


Otherwise lgtm.

Thanks,
Miquèl
