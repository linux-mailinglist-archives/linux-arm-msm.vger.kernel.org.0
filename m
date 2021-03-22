Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B04B343D0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 10:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbhCVJjw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 05:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhCVJjp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 05:39:45 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F6C9C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 02:39:34 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so10182427pjh.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 02:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wqHZMdC6rUxDyCcQ9/UiKhgX+/ervzY6iVzUm9vwHtE=;
        b=qIuXQoutDEgBKQInI7J0pFo7lPchsNyAgwQuoNJ2wFzSsG8ykCUIZ+YPFqtoS26Mz1
         hV+bXEEnX67VZq1EKNpC+7mrPcRdyeSCGU5S5GqBWysh6kfmKNA9gPwJQ1bHL+Lh06uh
         A2YPCKKulH2mRo2f8kBkgq+URI3KKFh/Bm4ZWJIt4eZwFDOvz2UXXHgW8FqGewIj6jP3
         mv7xXEha8ltbpZ6KxJVkVWp9JOEOdaOplsK+BIX0O1t0d3xgCvSW0CH/czcR/+Q4JI40
         kQuSyB69pnreP0f0a8ypQscp1vjsweLxYFDoJBjGN4WNvHua5X6klQRus5ri7IrB0UEj
         fzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wqHZMdC6rUxDyCcQ9/UiKhgX+/ervzY6iVzUm9vwHtE=;
        b=AQs8tcnqc+oQ6phywmmfA7zQUXdKymCZHvK7dVjU+d7mwMM/ktqI7sYMOW4FevT3Jn
         UNuz2W0WdnG/P1l0KCSbGUrHwtXIr+Q7tlDBe/vxNCwXzCmz+KkyXAeBJGN/nRolJJiL
         2JMflDbxco8vAGbRAY8B3Z113fht0F9xdHjg2t+akeXMugap4oEBSU6yVOxeL/Gsnwga
         4c3A1uqFDd9SDCOfHJ6b0f2mCdVU8LsiZWtM4s/8U9ydBX0oha+PBTwrC5ChSVqc9DiQ
         K03/VCmwVOjeQcoshUGirKbjOHgw7RHMsL4VSLb7BbB7ynbZV9GstV82qhJOtK49HP7c
         z/SQ==
X-Gm-Message-State: AOAM530DFWCSQs3TcCxBGhp4mNBS9RBIVbTI4HQTEZLAcrZhWDjZ6gPc
        dKb/WF/NF2xA/LrlTSl0sUew
X-Google-Smtp-Source: ABdhPJy8XVuIct7JmQJB4vmoUOg0R04Oj6ixVbI7Z072PYBkXC9iQpAALem0b+7e7hGmxDYKG2g67g==
X-Received: by 2002:a17:90a:d3d1:: with SMTP id d17mr12193992pjw.21.1616405974041;
        Mon, 22 Mar 2021 02:39:34 -0700 (PDT)
Received: from thinkpad ([2409:4072:88e:ef5e:dccf:398f:4151:2e02])
        by smtp.gmail.com with ESMTPSA id j188sm13320925pfd.64.2021.03.22.02.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 02:39:33 -0700 (PDT)
Date:   Mon, 22 Mar 2021 15:09:23 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v7 3/3] mtd: rawnand: Add support for secure regions in
 NAND memory
Message-ID: <20210322093923.GA70634@thinkpad>
References: <20210319150010.32122-1-manivannan.sadhasivam@linaro.org>
 <20210319150010.32122-4-manivannan.sadhasivam@linaro.org>
 <20210319175258.2cce6acd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319175258.2cce6acd@collabora.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 19, 2021 at 05:52:58PM +0100, Boris Brezillon wrote:
> On Fri, 19 Mar 2021 20:30:10 +0530
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> 
> > On a typical end product, a vendor may choose to secure some regions in
> > the NAND memory which are supposed to stay intact between FW upgrades.
> > The access to those regions will be blocked by a secure element like
> > Trustzone. So the normal world software like Linux kernel should not
> > touch these regions (including reading).
> > 
> > The regions are declared using a NAND chip DT property,
> > "secure-regions". So let's make use of this property in the raw NAND
> > core and skip access to the secure regions present in a system.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/mtd/nand/raw/nand_base.c | 111 +++++++++++++++++++++++++++++++
> >  include/linux/mtd/rawnand.h      |   4 ++
> >  2 files changed, 115 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> > index c33fa1b1847f..479a79e682cd 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -278,11 +278,47 @@ static int nand_block_bad(struct nand_chip *chip, loff_t ofs)
> >  	return 0;
> >  }
> >  
> > +/**
> > + * nand_check_secure_region() - Check if the region is secured
> > + * @chip: NAND chip object
> > + * @offset: Offset of the region to check
> > + * @size: Size of the region to check
> > + *
> > + * Checks if the region is secured by comparing the offset and size with the
> > + * list of secure regions obtained from DT. Returns -EIO if the region is
> > + * secured else 0.
> > + */
> > +static int nand_check_secure_region(struct nand_chip *chip, loff_t offset, u64 size)
> > +{
> > +	int i, j;
> > +
> > +	/* Skip touching the secure regions if present */
> > +	for (i = 0, j = 0; i < chip->nr_secure_regions; i++, j += 2) {
> > +		/* First compare the start offset */
> > +		if (offset >= chip->secure_regions[j] &&
> > +		    (offset < chip->secure_regions[j] + chip->secure_regions[j + 1]))
> > +			return -EIO;
> > +		/* ...then offset + size */
> > +		else if (offset < chip->secure_regions[i] &&
> > +			 (offset + size) >= chip->secure_regions[i])
> > +			return -EIO;
> 
> How about:
> 
> 		const struct nand_secure_region *region = &chip->secure_regions[i];
> 
> 		if (offset + size <= region->offset ||
> 		    offset >= region->offset +	region->size)
> 			continue;
> 
> 		return -EIO;
> 

I guess you mean this:

        /* Skip touching the secure regions if present */
        for (i = 0; i < chip->nr_secure_regions; i++) {
                const struct nand_secure_region *region = &chip->secure_regions[i];

                if (offset + size < region->offset ||
                    offset >= region->offset + region->size)
                        continue;

                return -EIO;
        }

	return 0;

> > +	}
> > +
> > +	return 0;
> > +}
> > +

[...]

> > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > index 6b3240e44310..d385c4fe8b0f 100644
> > --- a/include/linux/mtd/rawnand.h
> > +++ b/include/linux/mtd/rawnand.h
> > @@ -1086,6 +1086,8 @@ struct nand_manufacturer {
> >   *          NAND Controller drivers should not modify this value, but they're
> >   *          allowed to read it.
> >   * @read_retries: The number of read retry modes supported
> > + * @secure_regions: Array representing the secure regions
> > + * @nr_secure_regions: Number of secure regions
> >   * @controller: The hardware controller	structure which is shared among multiple
> >   *              independent devices
> >   * @ecc: The ECC controller structure
> > @@ -1135,6 +1137,8 @@ struct nand_chip {
> >  	unsigned int suspended : 1;
> >  	int cur_cs;
> >  	int read_retries;
> > +	u64 *secure_regions;
> 
> 
> Can you please define the following struct:
> 
> struct nand_secure_region {
> 	u64 offset;
> 	u64 size;
> };
> 
> instead of having an array of u64 where even entries encode the offset
> and odd ones the size.
> 

Hmm, I think you implicitly said this in your previous review as well and I
somehow lost it. Will incorporate. So we'll have something like this in
of_get_nand_secure_regions():

                for (i = 0, j = 0; i < chip->nr_secure_regions; i++, j += 2) {
                        of_property_read_u64_index(dn, "secure-regions", j,
                                                   &chip->secure_regions[i].offset);
                        of_property_read_u64_index(dn, "secure-regions", j + 1,
                                                   &chip->secure_regions[i].size);
                }


Thanks,
Mani
