Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE4EF3567A4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 11:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349933AbhDGJG7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 05:06:59 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:51421 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349931AbhDGJG6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 05:06:58 -0400
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 202A5100004;
        Wed,  7 Apr 2021 09:06:45 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH v11 3/4] mtd: rawnand: Add support for secure regions in NAND memory
Date:   Wed,  7 Apr 2021 11:06:45 +0200
Message-Id: <20210407090645.45522-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210402150128.29128-4-manivannan.sadhasivam@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'13b89768275d6ca9764bf91449e4cafe46ba706b'
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 2021-04-02 at 15:01:27 UTC, Manivannan Sadhasivam wrote:
> On a typical end product, a vendor may choose to secure some regions in
> the NAND memory which are supposed to stay intact between FW upgrades.
> The access to those regions will be blocked by a secure element like
> Trustzone. So the normal world software like Linux kernel should not
> touch these regions (including reading).
> 
> The regions are declared using a NAND chip DT property,
> "secure-regions". So let's make use of this property in the raw NAND
> core and skip access to the secure regions present in a system.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
