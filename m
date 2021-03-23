Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF3293465C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 17:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233223AbhCWQ5z convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 12:57:55 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:38733 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231842AbhCWQ5X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 12:57:23 -0400
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 804FBE0006;
        Tue, 23 Mar 2021 16:57:16 +0000 (UTC)
Date:   Tue, 23 Mar 2021 17:57:15 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v8 3/3] mtd: rawnand: Add support for secure regions in
 NAND memory
Message-ID: <20210323175715.38b4740a@xps13>
In-Reply-To: <20210323073930.89754-4-manivannan.sadhasivam@linaro.org>
References: <20210323073930.89754-1-manivannan.sadhasivam@linaro.org>
        <20210323073930.89754-4-manivannan.sadhasivam@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Manivannan,

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Tue,
23 Mar 2021 13:09:30 +0530:

> On a typical end product, a vendor may choose to secure some regions in
> the NAND memory which are supposed to stay intact between FW upgrades.
> The access to those regions will be blocked by a secure element like
> Trustzone. So the normal world software like Linux kernel should not
> touch these regions (including reading).
> 
> The regions are declared using a NAND chip DT property,
> "secure-regions". So let's make use of this property in the raw NAND
> core and skip access to the secure regions present in a system.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 105 +++++++++++++++++++++++++++++++
>  include/linux/mtd/rawnand.h      |  14 +++++
>  2 files changed, 119 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index c33fa1b1847f..2a990219f498 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -278,11 +278,46 @@ static int nand_block_bad(struct nand_chip *chip, loff_t ofs)
>  	return 0;
>  }
>  
> +/**
> + * nand_check_secure_region() - Check if the region is secured
> + * @chip: NAND chip object
> + * @offset: Offset of the region to check
> + * @size: Size of the region to check
> + *
> + * Checks if the region is secured by comparing the offset and size with the
> + * list of secure regions obtained from DT. Returns -EIO if the region is
> + * secured else 0.
> + */
> +static int nand_check_secure_region(struct nand_chip *chip, loff_t offset, u64 size)

I think I would prefer a boolean return value here, with a rename:

static bool nand_region_is_secured() or
nand_region_is_accessible/reachable/whatever()

then something lik:

	if (nand_region_is_secured())
		return -EIO;

> +{
> +	int i;
> +
> +	/* Skip touching the secure regions if present */
> +	for (i = 0; i < chip->nr_secure_regions; i++) {
> +		const struct nand_secure_region *region = &chip->secure_regions[i];
> +
> +		if (offset + size < region->offset ||
> +		    offset >= region->offset + region->size)

I think as-is the condition does not work.

Let's assume we want to check the region { .offset = 1, size = 1 } and
the region { .offset = 2, size = 1 } is reserved. This is:

		if ((1 + 1 < 2) /* false */ ||
		    (1 >= 2 + 1) /* false */)
			continue;
		return -EIO; /* EIO is returned while the area is valid
		*/

> +			continue;
> +

Perhaps a dev_dbg() entry here would make sense.

> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +

[...]

> +static int of_get_nand_secure_regions(struct nand_chip *chip)
> +{
> +	struct device_node *dn = nand_get_flash_node(chip);
> +	struct property *prop;
> +	int length, nr_elem, i, j;
> +
> +	prop = of_find_property(dn, "secure-regions", &length);
> +	if (prop) {

I generally prefer the below logic:

	if (!prop)
		return 0;

Then you earn an indentation level.

> +		nr_elem = length / sizeof(u64);

of_property_count_elems_of_size() ?

> +		chip->nr_secure_regions = nr_elem / 2;
> +
> +		chip->secure_regions = kcalloc(nr_elem, sizeof(*chip->secure_regions), GFP_KERNEL);

IIRC ->secure_regions is a structure with lengths and offset, so you
don't want to allocate nr_elem but nr_secure_regions number of
items here.

> +		if (!chip->secure_regions)
> +			return -ENOMEM;
> +
> +		for (i = 0, j = 0; i < chip->nr_secure_regions; i++, j += 2) {
> +			of_property_read_u64_index(dn, "secure-regions", j,
> +						   &chip->secure_regions[i].offset);
> +			of_property_read_u64_index(dn, "secure-regions", j + 1,
> +						   &chip->secure_regions[i].size);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int rawnand_dt_init(struct nand_chip *chip)
>  {
>  	struct nand_device *nand = mtd_to_nanddev(nand_to_mtd(chip));
>  	struct device_node *dn = nand_get_flash_node(chip);
> +	int ret;
>  
>  	if (!dn)
>  		return 0;
> @@ -5015,6 +5107,16 @@ static int rawnand_dt_init(struct nand_chip *chip)
>  	of_get_nand_ecc_user_config(nand);
>  	of_get_nand_ecc_legacy_user_config(chip);
>  
> +	/*
> +	 * Look for secure regions in the NAND chip. These regions are supposed
> +	 * to be protected by a secure element like Trustzone. So the read/write
> +	 * accesses to these regions will be blocked in the runtime by this
> +	 * driver.
> +	 */
> +	ret = of_get_nand_secure_regions(chip);
> +	if (!ret)
> +		return ret;

I think we can do this initialization pretty much when we want in the
init process as long as it is done before the BBT parsing logic.

Here, besides the fact the memory will not be freed from
rawnand_dt_init()'s caller if something goes wrong, we are at a point
where nand_cleanup will not be called. nand_cleanup() will only be
called if the controller driver encounters an error *after* a
successful nand_scan().

We could perhaps move this call to nand_scan() which would simply solve
the situation. We don't need it in rawnand_dt_init() as this won't be
rawnand specific anyway...

> +
>  	/*
>  	 * If neither the user nor the NAND controller have
> requested a specific
>  	 * ECC engine type, we will default to
> NAND_ECC_ENGINE_TYPE_ON_HOST. @@ -6068,6 +6170,9 @@ void
> nand_cleanup(struct nand_chip *chip) /* Free manufacturer priv data.
> */ nand_manufacturer_cleanup(chip);
>  
> +	/* Free secure regions data */
> +	kfree(chip->secure_regions);
> +
>  	/* Free controller specific allocations after chip
> identification */ nand_detach(chip);
>  
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 6b3240e44310..17ddc900a1dc 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1036,6 +1036,16 @@ struct nand_manufacturer {
>  	void *priv;
>  };
>  
> +/**
> + * struct nand_secure_region - NAND secure region structure
> + * @offset: Offset of the start of the secure region
> + * @size: Size of the secure region
> + */
> +struct nand_secure_region {
> +	u64 offset;
> +	u64 size;
> +};
> +
>  /**
>   * struct nand_chip - NAND Private Flash Chip Data
>   * @base: Inherit from the generic NAND device
> @@ -1086,6 +1096,8 @@ struct nand_manufacturer {
>   *          NAND Controller drivers should not modify this value,
> but they're
>   *          allowed to read it.
>   * @read_retries: The number of read retry modes supported
> + * @secure_regions: Structure containing the secure regions info
> + * @nr_secure_regions: Number of secure regions
>   * @controller: The hardware controller	structure which is
> shared among multiple
>   *              independent devices
>   * @ecc: The ECC controller structure
> @@ -1135,6 +1147,8 @@ struct nand_chip {
>  	unsigned int suspended : 1;
>  	int cur_cs;
>  	int read_retries;
> +	struct nand_secure_region *secure_regions;
> +	u8 nr_secure_regions;
>  
>  	/* Externals */
>  	struct nand_controller *controller;

Thanks,
Miquèl
