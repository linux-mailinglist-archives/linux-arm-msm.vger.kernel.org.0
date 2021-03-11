Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC31733718A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 12:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232816AbhCKLjs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 06:39:48 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:40455 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232882AbhCKLjZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 06:39:25 -0500
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 001DA100003;
        Thu, 11 Mar 2021 11:39:22 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Baruch Siach <baruch@tkos.co.il>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2] mtd: parsers: qcom: incompatible with spi-nor 4k sectors
Date:   Thu, 11 Mar 2021 12:39:22 +0100
Message-Id: <20210311113922.306015-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To:  <0a2611f885b894274436ded3ca78bc0440fca74a.1614790096.git.baruch@tkos.co.il>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'8f62f59f83c3bc902af91c80732cfcd17e0d7069'
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 2021-03-03 at 16:48:16 UTC, Baruch Siach wrote:
> Partition size and offset value are in block size units, which is the
> same as 'erasesize'. But when 4K sectors are enabled erasesize is set to
> 4K. Bail out in that case.
> 
> Fixes: 803eb124e1a64 ("mtd: parsers: Add Qcom SMEM parser")
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
