Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 891EF27312D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 19:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbgIURuy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 13:50:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:43816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbgIURuy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 13:50:54 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 81A752067D;
        Mon, 21 Sep 2020 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600710654;
        bh=kJ5R12A5zSEcL4lH72c1d+o9AME4QY3NjcOW4b+oD2E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MWTGlM4duqc7FMmw2RNe3C1k/JFeeyjmw8nyaUOKd9aKG9SQhCaap62LPMmM+p29s
         jOLQ8nuY31GUkfGcJFNpa/LzejSHN7ZLJiDUk2cqUPvROMj16n2Ftx6jxVyl7066wL
         UjqUs3Sl6g/ADwO7pVQFPQ3xEisyughhszxFQKPg=
Date:   Mon, 21 Sep 2020 18:50:49 +0100
From:   Will Deacon <will@kernel.org>
To:     Yu Kuai <yukuai3@huawei.com>
Cc:     robdclark@gmail.com, joro@8bytes.org,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        yi.zhang@huawei.com
Subject: Re: [PATCH] iommu/qcom: add missing put_device() call in
 qcom_iommu_of_xlate()
Message-ID: <20200921175048.GD3141@willie-the-truck>
References: <20200918011357.909335-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918011357.909335-1-yukuai3@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 18, 2020 at 09:13:57AM +0800, Yu Kuai wrote:
> if of_find_device_by_node() succeed, qcom_iommu_of_xlate() doesn't have
> a corresponding put_device(). Thus add put_device() to fix the exception
> handling for this function implementation.
> 
> Fixes: e86d1aa8b60f ("iommu/arm-smmu: Move Arm SMMU drivers into their own subdirectory")

That's probably not accurate, in that this driver used to live under
drivers/iommu/ and assumedly had this bug there as well.

> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

I guess Rob will pick this up.

Will
