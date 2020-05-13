Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0891D0E26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 11:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388519AbgEMJ6K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 05:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388178AbgEMJ6K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 05:58:10 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2406C061A0C;
        Wed, 13 May 2020 02:58:09 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 04F29379; Wed, 13 May 2020 11:58:07 +0200 (CEST)
Date:   Wed, 13 May 2020 11:58:06 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Samuel Zou <zou_wei@huawei.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] iommu/msm: Make msm_iommu_lock static
Message-ID: <20200513095806.GL9820@8bytes.org>
References: <1589249839-105820-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589249839-105820-1-git-send-email-zou_wei@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 12, 2020 at 10:17:19AM +0800, Samuel Zou wrote:
> Fix the following sparse warning:
> 
> drivers/iommu/msm_iommu.c:37:1: warning: symbol 'msm_iommu_lock' was not declared.
> 
> The msm_iommu_lock has only call site within msm_iommu.c
> It should be static
> 
> Fixes: 0720d1f052dc ("msm: Add MSM IOMMU support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Samuel Zou <zou_wei@huawei.com>
> ---
>  drivers/iommu/msm_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.
