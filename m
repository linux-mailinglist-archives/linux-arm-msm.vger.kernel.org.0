Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9917F1942C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 16:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgCZPM4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 11:12:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:37916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726034AbgCZPM4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 11:12:56 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 71C1F206F8;
        Thu, 26 Mar 2020 15:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585235575;
        bh=03mOQkVXlkFBKtHce0kJ1Hjv4XLAxHKPWrBdcc+gBF0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pB6iYL+WEVZqT2WkDjiggFRumLwoyzjPLuJ1Jb+asfmoXqv1A2OM1FAKmtPyVQ48C
         YmBaV/UeyEvUQtjDY+VkWeHiF0D+DUlgSn9bQXxHQ1WHqPYhhnk1lo1hNj8fesnDbf
         wNyEl8BhD/Hg/SJU7WCVwTk9mel7DhYPoax6Ax7E=
Date:   Thu, 26 Mar 2020 16:12:53 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        guohanjun@huawei.com, Sudeep Holla <sudeep.holla@arm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v4 05/16] iommu: Rename struct iommu_param to dev_iommu
Message-ID: <20200326151253.GB1530064@kroah.com>
References: <20200326150841.10083-1-joro@8bytes.org>
 <20200326150841.10083-6-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326150841.10083-6-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 26, 2020 at 04:08:30PM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The term dev_iommu aligns better with other existing structures and
> their accessor functions.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Tested-by: Will Deacon <will@kernel.org> # arm-smmu
> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  drivers/iommu/iommu.c  | 28 ++++++++++++++--------------
>  include/linux/device.h |  6 +++---
>  include/linux/iommu.h  |  4 ++--
>  3 files changed, 19 insertions(+), 19 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
