Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C20BD351A1A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 20:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236039AbhDAR6N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 13:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236720AbhDARzK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 13:55:10 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 633AEC02D567;
        Thu,  1 Apr 2021 08:50:57 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 45ACE1F4687C;
        Thu,  1 Apr 2021 16:50:55 +0100 (BST)
Date:   Thu, 1 Apr 2021 17:50:52 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>, richard@nod.at,
        vigneshr@ti.com, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v8 3/3] mtd: rawnand: Add support for secure regions in
 NAND memory
Message-ID: <20210401175052.1ff2bad2@collabora.com>
In-Reply-To: <20210401101812.GE14052@work>
References: <20210323073930.89754-1-manivannan.sadhasivam@linaro.org>
        <20210323073930.89754-4-manivannan.sadhasivam@linaro.org>
        <20210323175715.38b4740a@xps13>
        <20210401101812.GE14052@work>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 1 Apr 2021 15:48:12 +0530
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:

>  static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
>  {
> +       struct mtd_info *mtd = nand_to_mtd(chip);
> +       int last_page = ((mtd->erasesize - mtd->writesize) >>
> +                        chip->page_shift) & chip->pagemask;
>         int ret;
>  
>         if (chip->options & NAND_NO_BBM_QUIRK)
>                 return 0;
>  
>         /* Check if the region is secured */
> -       ret = nand_check_secure_region(chip, ofs, 0);
> +       ret = nand_check_secure_region(chip, ofs, last_page);

or just:

	ret = nand_check_secure_region(chip, ofs, mtd->erasesize);


>         if (ret)
>                 return ret;
> 
> > 		*/
> > 
