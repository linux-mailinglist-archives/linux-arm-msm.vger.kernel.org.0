Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3DF21D9E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 17:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbgGMPP2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 11:15:28 -0400
Received: from 8bytes.org ([81.169.241.247]:52590 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729027AbgGMPP2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 11:15:28 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 42E01379; Mon, 13 Jul 2020 17:15:27 +0200 (CEST)
Date:   Mon, 13 Jul 2020 17:15:25 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Will Deacon <will@kernel.org>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iommu/arm-smmu: Mark qcom_smmu_client_of_match as
 possibly unused
Message-ID: <20200713151525.GS27672@8bytes.org>
References: <20200604203905.31964-1-jcrouse@codeaurora.org>
 <20200608151308.GB8060@willie-the-truck>
 <20200713133326.GB2739@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713133326.GB2739@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 13, 2020 at 02:33:26PM +0100, Will Deacon wrote:
> I can't see this in Joerg's tree or in linux-next. Joerg: did you pick this
> one up? (I thought you did, but I can't find it!).

Yes, its in the tree and and will be pushed soon. I'll also send it to
Linus today.


	Joerg
