Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 985B7219A09
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 09:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgGIHdk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 03:33:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:44080 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbgGIHdj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 03:33:39 -0400
Received: from localhost (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 43E6520767;
        Thu,  9 Jul 2020 07:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594280019;
        bh=egKqkdwX9z5kdRrXLcad3F+Q12AeoGgHsWBcKCW0Cbo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nnUpnt8QvxDxM750v0L6hAcTKPWBSNG9X2ixsGlzQPDmWQr+LI9uw4Up43fNMGfXe
         ktx1qN1AeFuemE2NqUtwNQ9sw1VFX/zyq4kjOGEYtoQ789blkG6kDhW9Bqzn1O6cHk
         O6NoSnxjJT1tVbhzxZaukzFy1CRHSAd2LqQaXJ+U=
Date:   Thu, 9 Jul 2020 13:03:30 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/5] iommu/arm-smmu: Support maintaining bootloader
 mappings
Message-ID: <20200709073330.GI34333@vkoul-mobl>
References: <20200709050145.3520931-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709050145.3520931-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-07-20, 22:01, Bjorn Andersson wrote:
> Based on previous attempts and discussions this is the latest attempt at
> inheriting stream mappings set up by the bootloader, for e.g. boot splash or
> efifb.
> 
> The first patch is an implementation of Robin's suggestion that we should just
> mark the relevant stream mappings as BYPASS. Relying on something else to set
> up the stream mappings wanted - e.g. by reading it back in platform specific
> implementation code.
> 
> The series then tackles the problem seen in most versions of Qualcomm firmware,
> that the hypervisor intercepts BYPASS writes and turn them into FAULTs. It does
> this by allocating context banks for identity domains as well, with translation
> disabled.
> 
> Lastly it amends the stream mapping initialization code to allocate a specific
> identity domain that is used for any mappings inherited from the bootloader, if
> above Qualcomm quirk is required.
> 
> 
> The series has been tested and shown to allow booting SDM845, SDM850, SM8150,
> SM8250 with boot splash screen setup by the bootloader. Specifically it also
> allows the Lenovo Yoga C630 to boot with SMMU and efifb enabled.

This resolves issue on RB3 for me so:

Tested-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
