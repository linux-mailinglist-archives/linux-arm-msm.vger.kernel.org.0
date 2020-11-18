Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B95412B76D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Nov 2020 08:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgKRHTz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Nov 2020 02:19:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgKRHTz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Nov 2020 02:19:55 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C43C0613D4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 23:19:55 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id 34so563632pgp.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 23:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ogAqzoWb6CN+6DA0U4kbAuwXiWSIUBjOQhukqqaTMWo=;
        b=U1GoIM1AdmuL58NN4XCeb2w7fxo0jF8vBuA/6z7kciUFM/PGFVLarqF/CD/rUGIBec
         zCSqu8XcBIH4CRT4geHYFcs41uy7Bgjl8lZAURJb12FYD1rOAZWfJxBd7tLOaMZSqWPb
         dw2Jxyk1mCon9uig7mYnxDhHOuLrjj+xNZXSYRLwO2ZIwGpBK0fExFQJ+eFhnRWmzbXl
         rmlplR88Zi8UDPDZ1E61nCx3kjmec1UWS+rzNYI41VEigLg2LAxg3LnqKn9VKhQBUMRC
         OYFMYYKm7LV71qkUKTr7vaxPjlEEeHrrpgQRK5KiDRdM6IFnwhQ5gg4VlyWGc9pCgW6Y
         RUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ogAqzoWb6CN+6DA0U4kbAuwXiWSIUBjOQhukqqaTMWo=;
        b=mgIWe8KkSwwqzpCtA8Mz3/K119dhq/F7XM/3Aeb8Sx8yU1z7C6MiFF95Ljo4YkLpMZ
         oQdDvYdszBOfK23X8/73YSqzC2DgZ2P4Iu7uoFZzSyFXZRyrIi8MZoRYnbBvaxG/cNv2
         iWvnjE4NgP8ZaSLODwMKPIEbAknewX4cgj87v/+8Fd4KyTd2/fELtrd68moYwFPLftJ6
         YBb1OwyIzHVG+Of5YH/oP333szRnb3LKaBT9T0jPoUlwMd49t8KZH+3WBzxeFrBTcIYx
         Luz1msm7eDu3qusf0gBlIhe9Km+RUFXlOyKaNLIZUjwnYpXJGMstPp+WntdpjUOgJNqb
         mhLQ==
X-Gm-Message-State: AOAM533cB39uW4fuKlfl2OaQuBKGSKcP24IA+x2OtI3gJKJEztBAsAWu
        PQstcVeNr/za4r4IofTN/cum
X-Google-Smtp-Source: ABdhPJzKPAtFVRCbCKxNDq+2mj9Roy24FWwpRwKrKmMA9dbc3IHJxH1l9zjkYhMbcHX0Q0fTfEv3mA==
X-Received: by 2002:a62:7e14:0:b029:18a:d515:dc47 with SMTP id z20-20020a627e140000b029018ad515dc47mr3552810pfc.78.1605683994282;
        Tue, 17 Nov 2020 23:19:54 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id q23sm23942973pfg.192.2020.11.17.23.19.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2020 23:19:53 -0800 (PST)
Date:   Wed, 18 Nov 2020 12:49:47 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] mtd: parsers: Add Qcom SMEM parser
Message-ID: <20201118071947.GB3286@work>
References: <20201117174845.28684-1-manivannan.sadhasivam@linaro.org>
 <20201117174845.28684-3-manivannan.sadhasivam@linaro.org>
 <20201118042033.GH8532@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118042033.GH8532@builder.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 17, 2020 at 10:20:33PM -0600, Bjorn Andersson wrote:
> On Tue 17 Nov 11:48 CST 2020, Manivannan Sadhasivam wrote:
> 
> > NAND based Qualcomm platforms have the partition table populated in the
> > Shared Memory (SMEM). Hence, add a parser for parsing the partitions
> > from it.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/mtd/parsers/Kconfig        |   8 ++
> >  drivers/mtd/parsers/Makefile       |   1 +
> >  drivers/mtd/parsers/qcomsmempart.c | 169 +++++++++++++++++++++++++++++
> >  3 files changed, 178 insertions(+)
> >  create mode 100644 drivers/mtd/parsers/qcomsmempart.c
> > 
> > diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
> > index e72354322f62..d90c30229052 100644
> > --- a/drivers/mtd/parsers/Kconfig
> > +++ b/drivers/mtd/parsers/Kconfig
> > @@ -160,3 +160,11 @@ config MTD_REDBOOT_PARTS_READONLY
> >  	  'FIS directory' images, enable this option.
> >  
> >  endif # MTD_REDBOOT_PARTS
> > +
> > +config MTD_QCOMSMEM_PARTS
> > +	tristate "Qualcomm SMEM NAND flash partition parser"
> > +	depends on MTD_NAND_QCOM || COMPILE_TEST
> > +	depends on QCOM_SMEM
> > +	help
> > +	  This provides support for parsing partitions from Shared Memory (SMEM)
> > +	  for NAND flash on Qualcomm platforms.
> > diff --git a/drivers/mtd/parsers/Makefile b/drivers/mtd/parsers/Makefile
> > index b0c5f62f9e85..50eb0b0a2210 100644
> > --- a/drivers/mtd/parsers/Makefile
> > +++ b/drivers/mtd/parsers/Makefile
> > @@ -9,3 +9,4 @@ obj-$(CONFIG_MTD_AFS_PARTS)		+= afs.o
> >  obj-$(CONFIG_MTD_PARSER_TRX)		+= parser_trx.o
> >  obj-$(CONFIG_MTD_SHARPSL_PARTS)		+= sharpslpart.o
> >  obj-$(CONFIG_MTD_REDBOOT_PARTS)		+= redboot.o
> > +obj-$(CONFIG_MTD_QCOMSMEM_PARTS)	+= qcomsmempart.o
> > diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
> > new file mode 100644
> > index 000000000000..d8c2a3fa4dfe
> > --- /dev/null
> > +++ b/drivers/mtd/parsers/qcomsmempart.c
> > @@ -0,0 +1,169 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Qualcomm SMEM NAND flash partition parser
> > + *
> > + * Copyright (C) 2020, Linaro Ltd.
> > + */
> > +
> > +#include <linux/ctype.h>
> > +#include <linux/module.h>
> > +#include <linux/mtd/mtd.h>
> > +#include <linux/mtd/partitions.h>
> > +#include <linux/slab.h>
> > +#include <linux/soc/qcom/smem.h>
> > +
> > +#define SMEM_AARM_PARTITION_TABLE	9
> > +#define SMEM_APPS			0
> > +
> > +#define SMEM_FLASH_PART_MAGIC1		0x55ee73aa
> > +#define SMEM_FLASH_PART_MAGIC2		0xe35ebddb
> > +#define SMEM_FLASH_PTABLE_V3		3
> > +#define SMEM_FLASH_PTABLE_V4		4
> > +#define SMEM_FLASH_PTABLE_MAX_PARTS_V3	16
> > +#define SMEM_FLASH_PTABLE_MAX_PARTS_V4	48
> > +#define SMEM_FLASH_PTABLE_HDR_LEN	(4 * sizeof(u32))
> > +#define SMEM_FLASH_PTABLE_NAME_SIZE	16
> > +
> > +/**
> > + * struct smem_flash_pentry - SMEM Flash partition entry
> > + * @name: Name of the partition
> > + * @offset: Offset in blocks
> > + * @length: Length of the partition in blocks
> > + * @attr: Flags for this partition
> > + */
> > +struct smem_flash_pentry {
> > +	char name[SMEM_FLASH_PTABLE_NAME_SIZE];
> > +	u32 offset;
> 
> It would be nice if you noted that these are little endian (using
> __le32) and used le32_to_cpu() below.
> 
> 

Good catch! Will do.

> Apart from that I think this looks really good.
> 

[...]

> > +	}
> > +
> > +	pr_debug("SMEM partition table found: ver: %d len: %d\n",
> > +		 ptable->version, ptable->numparts);
> > +	*pparts = parts;
> > +
> > +	return i;
> 
> Had to check a few times, but afaict this is just ptable->numparts in
> disguise... So how about just writing that instead?
> 

Sure, will do.

Thanks,
Mani
