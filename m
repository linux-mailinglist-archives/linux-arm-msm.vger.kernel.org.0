Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8682B32C167
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389233AbhCCVfN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Wed, 3 Mar 2021 16:35:13 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:44893 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1839390AbhCCIEq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 03:04:46 -0500
X-Originating-IP: 86.206.8.148
Received: from xps13 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 8AF5DE0015;
        Wed,  3 Mar 2021 08:03:43 +0000 (UTC)
Date:   Wed, 3 Mar 2021 09:03:42 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     richard@nod.at, vigneshr@ti.com, linux-arm-msm@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH 0/2] Handle probe defer properly in MTD core
Message-ID: <20210303090342.635130fb@xps13>
In-Reply-To: <20210302132757.225395-1-manivannan.sadhasivam@linaro.org>
References: <20210302132757.225395-1-manivannan.sadhasivam@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Manivannan,

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Tue,
2 Mar 2021 18:57:55 +0530:

> Hello,
> 
> These two patches aims at fixing the -EPROBE_DEFER handling in the MTD
> core and also in the Qcom nand driver. The "qcomsmem" parser depends on
> the QCOM_SMEM driver to parse the partitions defined in the shared
> memory. Due to the DT layout, the SMEM driver might probe after the NAND
> driver. In that case, the -EPROBE_DEFER returned by qcom_smem_get() in
> the parser will fail to propagate till the driver core. So this will
> result in the partitions not getting parsed even after the SMEM driver is
> available.
> 
> So fix this issue by handling the -EPROBE_DEFER error properly in both
> MTD core and in the Qcom nand driver. This issue is observed on Qcom SDX55
> based Telit FN980 EVB and in SDX55-MTP.

Applied manually on top of nand/next as infradead.org is dead at the
moment and the patches were not collected by patchwork.

Thanks,
Miquèl
