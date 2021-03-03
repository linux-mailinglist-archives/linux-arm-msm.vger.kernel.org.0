Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69C5632C204
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:03:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389682AbhCCVj7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Wed, 3 Mar 2021 16:39:59 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:20127 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443229AbhCCOUx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 09:20:53 -0500
X-Originating-IP: 86.206.8.148
Received: from xps13 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5C106240007;
        Wed,  3 Mar 2021 14:19:56 +0000 (UTC)
Date:   Wed, 3 Mar 2021 15:19:55 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] mtd: parsers: qcom: incompatible with spi-nor 4k
 sectors
Message-ID: <20210303151955.7af6e017@xps13>
In-Reply-To: <71e3fe832d35bd34a7da87146ba7d52f89278665.1614780732.git.baruch@tkos.co.il>
References: <71e3fe832d35bd34a7da87146ba7d52f89278665.1614780732.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Baruch,

Baruch Siach <baruch@tkos.co.il> wrote on Wed,  3 Mar 2021 16:12:12
+0200:

> Partition size and offset value are in block size units, which is the
> same as 'erasesize'. But when 4K sectors are enabled erasesize is set to
> 4K. Bail out in that case.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Could you add a Fixes tag?

LGTM otherwise.

Thanks,
Miquèl
