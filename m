Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81EB141EAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 10:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729801AbfFLIKx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 04:10:53 -0400
Received: from 8bytes.org ([81.169.241.247]:43512 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726716AbfFLIKx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 04:10:53 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id A4896398; Wed, 12 Jun 2019 10:10:51 +0200 (CEST)
Date:   Wed, 12 Jun 2019 10:10:51 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        iommu <iommu@lists.linux-foundation.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3] iommu/arm-smmu: Avoid constant zero in TLBI writes
Message-ID: <20190612081051.GD21613@8bytes.org>
References: <f523effd-ef81-46fe-1f9e-1a0cb42c8b7b@free.fr>
 <20190529130559.GB11023@fuggles.cambridge.arm.com>
 <84791515-e0ae-0322-78aa-02ca0b40d157@free.fr>
 <09a290f1-27a0-5ee3-16b9-659ef2ba99dc@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09a290f1-27a0-5ee3-16b9-659ef2ba99dc@free.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 03, 2019 at 02:15:37PM +0200, Marc Gonzalez wrote:
>  drivers/iommu/arm-smmu.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

Applied, thanks. It should show up in linux-next in the next days.

