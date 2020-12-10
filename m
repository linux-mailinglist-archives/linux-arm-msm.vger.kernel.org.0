Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 779062D6AA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 23:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404714AbgLJVZo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 16:25:44 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:37157 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404710AbgLJVZe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 16:25:34 -0500
Received: from xps13 (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr [109.220.208.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id B52EE240008;
        Thu, 10 Dec 2020 21:24:48 +0000 (UTC)
Date:   Thu, 10 Dec 2020 22:24:47 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Add support for Qcom SMEM based NAND parser
Message-ID: <20201210222447.63f5dbcf@xps13>
In-Reply-To: <20201210040942.GD6466@thinkpad>
References: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
        <20201210040942.GD6466@thinkpad>
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
10 Dec 2020 09:39:42 +0530:

> Hi,
> 
> On Thu, Nov 19, 2020 at 12:43:04PM +0530, Manivannan Sadhasivam wrote:
> > Hello,
> > 
> > This series adds support for parsing the partitions defined in Shared
> > Memory (SMEM) of the Qualcomm platforms supporting NAND interface.
> > Current parser only supports V3 and V4 of the partition tables.
> > 
> > This series has been tested on SDX55 MTP board which has an onboard NAND
> > device.
> >   
> 
> Any update on this series?

Patches lgtm, I think Rob's Ack is still missing, let's wait for his
review.


Thanks,
Miquèl
