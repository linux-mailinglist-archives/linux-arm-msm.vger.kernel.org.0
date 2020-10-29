Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCAA129E5E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 09:12:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgJ2IMq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 04:12:46 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:50866 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbgJ2IMo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 04:12:44 -0400
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 442083B29ED;
        Thu, 29 Oct 2020 07:54:20 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1E0AC240002;
        Thu, 29 Oct 2020 07:53:45 +0000 (UTC)
Date:   Thu, 29 Oct 2020 08:53:44 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     mdalam@codeaurora.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, richard@nod.at,
        vigneshr@ti.com, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sricharan@codeaurora.org
Subject: Re: [PATCH 0/5] mtd: rawnand: qcom: Add support for QSPI nand
Message-ID: <20201029085344.5b2a4b51@xps13>
In-Reply-To: <10db598eed716d7759bc0125b6977cf1@codeaurora.org>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
        <20201028104835.3dc31745@xps13>
        <10db598eed716d7759bc0125b6977cf1@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

mdalam@codeaurora.org wrote on Wed, 28 Oct 2020 23:54:23 +0530:

> On 2020-10-28 15:18, Miquel Raynal wrote:
> > Hello,
> > 
> > Md Sadre Alam <mdalam@codeaurora.org> wrote on Sat, 10 Oct 2020
> > 11:01:37 +0530:
> >   
> >> QPIC 2.0 supports Serial NAND support in addition to all features and
> >> commands in QPIC 1.0 for parallel NAND. Parallel and Serial NAND >> cannot
> >> operate simultaneously. QSPI nand devices will connect to QPIC >> IO_MACRO
> >> block of QPIC controller. There is a separate IO_MACRO clock for >> IO_MACRO
> >> block. Default IO_MACRO block divide the input clock by 4. so if >> IO_MACRO
> >> input clock is 320MHz then on bus it will be 80MHz, so QSPI nand >> device
> >> should also support this frequency.  
> >> >> QPIC provides 4 data pins to QSPI nand. In standard SPI mode (x1 mode) >> data  
> >> transfer will occur on only 2 pins one pin for Serial data in and one >> for
> >> serial data out. In QUAD SPI mode (x4 mode) data transfer will occur >> at all
> >> the four data lines. QPIC controller supports command for x1 mode and >> x4 mode.  
> >> >> Md Sadre Alam (5):  
> >>   dt-bindings: qcom_nandc: IPQ5018 QPIC NAND documentation
> >>   mtd: rawnand: qcom: Add initial support for qspi nand
> >>   mtd: rawnand: qcom: Read QPIC version
> >>   mtd: rawnand: qcom: Enable support for erase,read & write for serial
> >>     nand.
> >>   mtd: rawnand: qcom: Add support for serial training.  
> >> >>  .../devicetree/bindings/mtd/qcom_nandc.txt         |   3 +  
> >>  drivers/mtd/nand/raw/nand_ids.c                    |  13 +
> >>  drivers/mtd/nand/raw/qcom_nandc.c                  | 502 >> ++++++++++++++++++++-
> >>  3 files changed, 494 insertions(+), 24 deletions(-)  
> >> > > I'm sorry but this series clearly breaks the current layering. I cannot  
> > authorize SPI-NAND code to fall into the raw NAND subsystem.
> >   
> 
> I am agree with you, we should not add SPI-NAND changes inside
> raw NAND subsystem.
> 
> > As both typologies cannot be used at the same time, I guess you should
> > have another driver handling this feature under the spi/ subsystem +
> > a few declarations in the SPI-NAND devices list.
> >   
> 
> Initially I was started writing separate driver under SPI-NAND subsystem then I
> realized that more than 85% of raw/qcom_nand.c code getting duplicated.
> 
> That's why I have added this SPI-NAND change in raw/qcom_nand.c since
> more than 85% of code will be reused.
> 
> If I will add this change inside SPI-NAND subsystem then much of
> raw/qcom_nand.c code will get duplicated. Would it be ok ?

What about moving the generic code to drivers/mtd/nand/common/ and
referring to it from drivers/mtd/nand/raw/qcom_nand.c and
drivers/spi/spi-qcom.c (or such)?

Thanks,
Miquèl
