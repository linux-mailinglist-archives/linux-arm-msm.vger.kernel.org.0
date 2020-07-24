Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8628922C52B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 14:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgGXMae (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 08:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbgGXMae (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 08:30:34 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 484E6C0619D3;
        Fri, 24 Jul 2020 05:30:34 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 88ADF46A; Fri, 24 Jul 2020 14:30:31 +0200 (CEST)
Date:   Fri, 24 Jul 2020 14:30:30 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Baolin Wang <baolin.wang@linux.alibaba.com>
Cc:     Will Deacon <will@kernel.org>, robin.murphy@arm.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        matthias.bgg@gmail.com, robdclark@gmail.com, robh@kernel.org,
        tomeu.vizoso@collabora.com, steven.price@arm.com,
        alyssa.rosenzweig@collabora.com, airlied@linux.ie, daniel@ffwll.ch,
        baolin.wang7@gmail.com, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] iommu: Add gfp parameter to io_pgtable_ops->map()
Message-ID: <20200724123030.GT27672@8bytes.org>
References: <cover.1591930156.git.baolin.wang@linux.alibaba.com>
 <3093df4cb95497aaf713fca623ce4ecebb197c2e.1591930156.git.baolin.wang@linux.alibaba.com>
 <20200714082821.GC4516@willie-the-truck>
 <20200723113652.GA104096@VM20190228-100.tbsite.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723113652.GA104096@VM20190228-100.tbsite.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 23, 2020 at 07:36:52PM +0800, Baolin Wang wrote:
> Thanks Will. Joerg, could you apply this 2 patches if no objection from
> your side? Thanks.

Applied both, thanks. Modified the first patch because another patch
already made __iommu_map static.
