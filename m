Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABE121EB44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 10:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgGNI07 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jul 2020 04:26:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:56244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725793AbgGNI07 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jul 2020 04:26:59 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9C99E21835;
        Tue, 14 Jul 2020 08:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594715218;
        bh=rkHskXC0fiwa6QUMtcIea2p7i/6OpQKyeZInBl3W1JQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lcclkXtI6xPp5/1tsah+tsY4T4lVY3Dinfx5gzN3lmgiev/hCZ9q8C3ykXyXyNw+D
         rZKK1DCidNuCplg0/JzhvaiYgJidPKjCuFRlTALJMHMrGfZ20EivrOEkbCKuv3CieV
         SLO6dVBOWw7JYumLD1zzF9sVCOTiq10Z7ma3wZ9g=
Date:   Tue, 14 Jul 2020 09:26:52 +0100
From:   Will Deacon <will@kernel.org>
To:     Baolin Wang <baolin.wang@linux.alibaba.com>
Cc:     joro@8bytes.org, robin.murphy@arm.com, agross@kernel.org,
        bjorn.andersson@linaro.org, matthias.bgg@gmail.com,
        robdclark@gmail.com, robh@kernel.org, tomeu.vizoso@collabora.com,
        steven.price@arm.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, baolin.wang7@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] iommu: Mark __iommu_map/__iommu_map_sg as static
Message-ID: <20200714082652.GB4516@willie-the-truck>
References: <cover.1591930156.git.baolin.wang@linux.alibaba.com>
 <ab722e9970739929738066777b8ee7930e32abd5.1591930156.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab722e9970739929738066777b8ee7930e32abd5.1591930156.git.baolin.wang@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 12, 2020 at 11:39:54AM +0800, Baolin Wang wrote:
> Now the __iommu_map() and __iommu_map_sg() are used only in iommu.c
> file, so mark them as static.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  drivers/iommu/iommu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

(I'm assuming Joerg will pick this up for 5.9)

Thanks,

Will
