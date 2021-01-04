Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BEEA2E933F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 11:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbhADK0x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 05:26:53 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:51195 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbhADK0w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 05:26:52 -0500
X-Originating-IP: 90.89.98.255
Received: from localhost.localdomain (lfbn-tou-1-1535-bdcst.w90-89.abo.wanadoo.fr [90.89.98.255])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 9B0291BF211;
        Mon,  4 Jan 2021 10:26:08 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4 4/4] mtd: parsers: afs: Fix freeing the part name memory in failure
Date:   Mon,  4 Jan 2021 11:26:06 +0100
Message-Id: <20210104102607.8771-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210104041137.113075-5-manivannan.sadhasivam@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: f6fbcc42a06f089915152b1f8ea5a56be85a3ce4
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 2021-01-04 at 04:11:37 UTC, Manivannan Sadhasivam wrote:
> In the case of failure while parsing the partitions, the iterator should
> be pre decremented by one before starting to free the memory allocated
> by kstrdup(). Because in the failure case, kstrdup() will not succeed
> and thus no memory will be allocated for the current iteration.
> 
> Fixes: 1fca1f6abb38 ("mtd: afs: simplify partition parsing")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
