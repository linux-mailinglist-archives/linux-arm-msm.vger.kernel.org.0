Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDEF929E6E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 10:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725898AbgJ2JH4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 05:07:56 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43464 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbgJ2JH4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 05:07:56 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 35D211F458B8;
        Thu, 29 Oct 2020 09:07:54 +0000 (GMT)
Date:   Thu, 29 Oct 2020 10:07:51 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Md Sadre Alam <mdalam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sricharan@codeaurora.org
Subject: Re: [PATCH 2/5] mtd: rawnand: qcom: Add initial support for qspi
 nand
Message-ID: <20201029100751.713e27df@collabora.com>
In-Reply-To: <1602307902-16761-3-git-send-email-mdalam@codeaurora.org>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
        <1602307902-16761-3-git-send-email-mdalam@codeaurora.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

On Sat, 10 Oct 2020 11:01:39 +0530
Md Sadre Alam <mdalam@codeaurora.org> wrote:

> This change will add initial support for qspi (serial nand).
> 
> QPIC Version v.2.0 onwards supports serial nand as well so this
> change will initialize all required register to enable qspi (serial
> nand).
> 
> This change is supporting very basic functionality of qspi nand flash.
> 
> 1. Reset device (Reset QSPI NAND device).
> 
> 2. Device detection (Read id QSPI NAND device).

Unfortunately, that's not going to work in the long term. You're
basically hacking the raw NAND framework to make SPI NANDs fit. I do
understand the rationale behind this decision (re-using the code for
ECC and probably other things), but that's not going to work. So I'd
recommend doing the following instead:

1/ implement a SPI-mem controller driver
2/ implement an ECC engine driver so the ECC logic can be shared
   between the SPI controller and raw NAND controller drivers
3/ convert the raw NAND driver to the exec_op() interface (none of
   this hack would have been possible if the driver was using the new
   API)

Regards,

Boris
