Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B85B3352794
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 10:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbhDBIwC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 04:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbhDBIwC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 04:52:02 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52EE5C0613E6;
        Fri,  2 Apr 2021 01:52:01 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 42FC31F4671A;
        Fri,  2 Apr 2021 09:51:58 +0100 (BST)
Date:   Fri, 2 Apr 2021 10:51:54 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v10 3/4] mtd: rawnand: Add support for secure regions in
 NAND memory
Message-ID: <20210402105154.0a2a3af5@collabora.com>
In-Reply-To: <20210401161622.GH14052@work>
References: <20210401151955.143817-1-manivannan.sadhasivam@linaro.org>
        <20210401151955.143817-4-manivannan.sadhasivam@linaro.org>
        <20210401175421.65db63bf@collabora.com>
        <20210401161622.GH14052@work>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 1 Apr 2021 21:46:22 +0530
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:

> On Thu, Apr 01, 2021 at 05:54:21PM +0200, Boris Brezillon wrote:
> > On Thu,  1 Apr 2021 20:49:54 +0530
> > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> >   
> > > @@ -565,6 +608,11 @@ static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
> > >  
> > >  	if (!chip->bbt)
> > >  		return 0;
> > > +
> > > +	/* Check if the region is secured */
> > > +	if (nand_region_is_secured(chip, ofs, 0))
> > > +		return -EIO;  
> > 
> > That would is still wrong, you should never pass a 0 size to
> > nand_region_is_secured().
> >   
> 
> Size doesn't matter here, that's why I passed 0. Maybe 1 would be
> appropriate?

You're checking if a block is reserved, so I think passing the
eraseblock size would make more sense, but I actually don't understand
why you need to check if the region is secure here (looks like
nand_block_isreserved() does not access the flash).

