Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89B7B1942BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 16:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbgCZPMZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 11:12:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:37730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726496AbgCZPMZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 11:12:25 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1AEB206F8;
        Thu, 26 Mar 2020 15:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585235545;
        bh=39YFqBA/iJuWa5ADd6XMv4viTdNuFwmWvDAdaPeea1Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kpk77p+Mx9sZ5lG2ymWwMZ8mWBk6Tse0ZNm35PUK0F3k06EVy5eT0XlSAtZwWA/MW
         n+twRkj9cUHWYQZtlPowlvfpsrocDxxWpw2C1ItmlmS2nteGefzKowWPcmrAkHCsu2
         a0k3Io5zp+eVogZ8aJd7eYWCEuIiDlWIjrmpi+u0=
Date:   Thu, 26 Mar 2020 16:12:22 +0100
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
Subject: Re: [PATCH v4 06/16] iommu: Move iommu_fwspec to struct dev_iommu
Message-ID: <20200326151222.GA1530064@kroah.com>
References: <20200326150841.10083-1-joro@8bytes.org>
 <20200326150841.10083-7-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326150841.10083-7-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 26, 2020 at 04:08:31PM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Move the iommu_fwspec pointer in struct device into struct dev_iommu.
> This is a step in the effort to reduce the iommu related pointers in
> struct device to one.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Tested-by: Will Deacon <will@kernel.org> # arm-smmu
> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  drivers/iommu/iommu.c  |  3 +++
>  include/linux/device.h |  3 ---
>  include/linux/iommu.h  | 12 ++++++++----
>  3 files changed, 11 insertions(+), 7 deletions(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

