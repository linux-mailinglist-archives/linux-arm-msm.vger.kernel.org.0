Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E7D25D49C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 11:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729903AbgIDJVS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 05:21:18 -0400
Received: from 8bytes.org ([81.169.241.247]:40944 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728205AbgIDJVR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 05:21:17 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id A1513A8D; Fri,  4 Sep 2020 11:21:15 +0200 (CEST)
Date:   Fri, 4 Sep 2020 11:21:14 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Will Deacon <will@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>, kernel-team@android.com,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: update QUALCOMM IOMMU after Arm SMMU
 drivers move
Message-ID: <20200904092114.GJ6714@8bytes.org>
References: <20200825053828.4166-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825053828.4166-1-lukas.bulwahn@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 25, 2020 at 07:38:28AM +0200, Lukas Bulwahn wrote:
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
> Acked-by: Will Deacon <will@kernel.org>

Applied, thanks.
