Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72E761642BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 11:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgBSK4h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 05:56:37 -0500
Received: from 8bytes.org ([81.169.241.247]:54938 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726270AbgBSK4h (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 05:56:37 -0500
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 9D7A536A; Wed, 19 Feb 2020 11:56:35 +0100 (CET)
Date:   Wed, 19 Feb 2020 11:56:34 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     robdclark@gmail.com, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, stephan@gerhold.net,
        linux-arm-msm@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH] iommu/qcom: Fix bogus detach logic
Message-ID: <20200219105634.GF1961@8bytes.org>
References: <be92829c6e5467634b109add002351e6cf9e18d2.1582049382.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be92829c6e5467634b109add002351e6cf9e18d2.1582049382.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 18, 2020 at 06:12:41PM +0000, Robin Murphy wrote:
> Currently, the implementation of qcom_iommu_domain_free() is guaranteed
> to do one of two things: WARN() and leak everything, or dereference NULL
> and crash. That alone is terrible, but in fact the whole idea of trying
> to track the liveness of a domain via the qcom_domain->iommu pointer as
> a sanity check is full of fundamentally flawed assumptions. Make things
> robust and actually functional by not trying to be quite so clever.
> 
> Reported-by: Brian Masney <masneyb@onstation.org>
> Tested-by: Brian Masney <masneyb@onstation.org>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Fixes: 0ae349a0f33f ("iommu/qcom: Add qcom_iommu")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/qcom_iommu.c | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)

Applied, thanks.
