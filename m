Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21B3E243AB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 15:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgHMNTn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 09:19:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:38790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbgHMNTn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 09:19:43 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D15620774;
        Thu, 13 Aug 2020 13:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597324782;
        bh=SknD/q4aQWNYq5Nk/fIPKkA97wOWHoR/XOtsWCarsUg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KyQtPDjjhE0RUI+jOnEFEBNw/+u3ZIzQvrcfs2bqJcSclzMEqquyp5iHRtp1RNgLN
         0GHvoyF53tu5IMoeKYfshHf8pzTzkTlYFu4UrJiZttWR4h8heT83viHSVM3LlABhmz
         fUatW3ekpHN47Oz+hbzPT5iwPkIrwjnHUHdfpCyU=
Date:   Thu, 13 Aug 2020 14:19:33 +0100
From:   Will Deacon <will@kernel.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        iommu@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Brian Masney <masneyb@onstation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Douglas Anderson <dianders@chromium.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hanna Hawa <hannah@marvell.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pritesh Raithatha <praithatha@nvidia.com>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 00/13] iommu/arm-smmu: Add Adreno SMMU specific
 implementation
Message-ID: <20200813131933.GC10256@willie-the-truck>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 10, 2020 at 04:26:44PM -0600, Jordan Crouse wrote:
> This series adds an Adreno SMMU implementation to arm-smmu to allow GPU hardware
> pagetable switching.
> 
> The Adreno GPU has built in capabilities to switch the TTBR0 pagetable during
> runtime to allow each individual instance or application to have its own
> pagetable.  In order to take advantage of the HW capabilities there are certain
> requirements needed of the SMMU hardware.

"capabilities" is a polite way of putting it ;)

Anyway, modulo two design comments, I think this is about as nice as we're
going to get this. Thanks for persevering, and sorry that you have to deal
with such dreadful hardware.

Hopefully the next version will be the one, although I'd like Robin to take
a quick look as well if he gets a chance.

Will
