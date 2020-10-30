Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C199F2A0C68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 18:27:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgJ3R1b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 13:27:31 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:33511 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbgJ3R1b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 13:27:31 -0400
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B3F111BF208;
        Fri, 30 Oct 2020 17:27:26 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Kathiravan T <kathirav@codeaurora.org>, agross@kernel.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org, sivaprak@codeaurora.org, peter.ujfalusi@ti.com,
        boris.brezillon@collabora.com, linux-arm-msm@vger.kernel.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mtd: rawnand: qcom: Support for IPQ6018 QPIC NAND controller
Date:   Fri, 30 Oct 2020 18:27:25 +0100
Message-Id: <20201030172725.29166-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1602566124-13456-3-git-send-email-kathirav@codeaurora.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 0704639af3af3599712d2a2ef8772116d6b75b98
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 2020-10-13 at 05:15:23 UTC, Kathiravan T wrote:
> Add the compatible string for IPQ6018 QPIC NAND controller
> version 1.5.0. It's properties are same as IPQ8074, so reuse
> the same.
> 
> Signed-off-by: Kathiravan T <kathirav@codeaurora.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
