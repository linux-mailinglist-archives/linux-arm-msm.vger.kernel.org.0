Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B947449726D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jan 2022 16:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237488AbiAWPXd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Jan 2022 10:23:33 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:54843 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237452AbiAWPXc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Jan 2022 10:23:32 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id C1F4E60002;
        Sun, 23 Jan 2022 15:23:27 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        mani@kernel.org, miquel.raynal@bootlin.com, architt@codeaurora.org,
        bbrezillon@kernel.org, absahu@codeaurora.org
Cc:     baruch@tkos.co.il
Subject: Re: [PATCH v2 1/2] mtd: rawnand: qcom: Fix clock sequencing in qcom_nandc_probe()
Date:   Sun, 23 Jan 2022 16:23:26 +0100
Message-Id: <20220123152326.529692-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220103030316.58301-2-bryan.odonoghue@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'58f030410f1c8ee5a04ac39720050b7a9ded4820'
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 2022-01-03 at 03:03:15 UTC, Bryan O'Donoghue wrote:
> Interacting with a NAND chip on an IPQ6018 I found that the qcomsmem NAND
> partition parser was returning -EPROBE_DEFER waiting for the main smem
> driver to load.
> 
> This caused the board to reset. Playing about with the probe() function
> shows that the problem lies in the core clock being switched off before the
> nandc_unalloc() routine has completed.
> 
> If we look at how qcom_nandc_remove() tears down allocated resources we see
> the expected order is
> 
> qcom_nandc_unalloc(nandc);
> 
> clk_disable_unprepare(nandc->aon_clk);
> clk_disable_unprepare(nandc->core_clk);
> 
> dma_unmap_resource(&pdev->dev, nandc->base_dma, resource_size(res),
> 		   DMA_BIDIRECTIONAL, 0);
> 
> Tweaking probe() to both bring up and tear-down in that order removes the
> reset if we end up deferring elsewhere.
> 
> Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
