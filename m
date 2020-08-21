Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0628C24D972
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 18:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgHUQLI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 12:11:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:42626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725828AbgHUQLH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 12:11:07 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AEF24207BB;
        Fri, 21 Aug 2020 16:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598026266;
        bh=KoJWYj9R3egfhrmAUtzdmQ4aHcirpe1luSVDllQR65M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yrHjjTtz8bmAAarxqFRyCKp+eUzDy45aPAVgTpRquqvqFnM2Q3B/KMmajkF5M6yRP
         JyG3hI6KbQmfq//EsQ6UFchVq138yTLtw8f6zx0ArEmlIXMNHfioz5ksl7E4tQk5La
         UeC/R4IRIiGU3nWuuLWAUqlvju6DQl64nMKyW+is=
Date:   Fri, 21 Aug 2020 17:11:01 +0100
From:   Will Deacon <will@kernel.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>, kernel-team@android.com,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: update QUALCOMM IOMMU after Arm SSMU
 drivers move
Message-ID: <20200821161101.GF21517@willie-the-truck>
References: <20200802065320.7470-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200802065320.7470-1-lukas.bulwahn@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Aug 02, 2020 at 08:53:20AM +0200, Lukas Bulwahn wrote:
> Commit e86d1aa8b60f ("iommu/arm-smmu: Move Arm SMMU drivers into their own
> subdirectory") moved drivers/iommu/qcom_iommu.c to
> drivers/iommu/arm/arm-smmu/qcom_iommu.c amongst other moves, adjusted some
> sections in MAINTAINERS, but missed adjusting the QUALCOMM IOMMU section.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches    F:    drivers/iommu/qcom_iommu.c
> 
> Update the file entry in MAINTAINERS to the new location.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Will, please ack.

Typo in subject: s/SSMU/SMMU/

With that:

Acked-by: Will Deacon <will@kernel.org>

> Joerg, please pick this minor non-urgent patch for your -next branch.

Joerg -- can you queue this as a fix for 5.9-rc, please?

Thanks,

Will
