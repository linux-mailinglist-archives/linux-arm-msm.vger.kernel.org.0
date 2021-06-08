Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40FF639FD5B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 19:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232229AbhFHRSt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 13:18:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:52994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232007AbhFHRSs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 13:18:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3F7E61351;
        Tue,  8 Jun 2021 17:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623172615;
        bh=DaPFTt06ZX9vrnUdxgsyoxWQxOB00PNGVCYx24PpEGY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VK2XP8JOZiplEBMfE6qiNiXA3oNdqTFu374He9eycmhA/IWpRAegRF9Pj9zjPXqq+
         mMKtfN0gTk1J9XHTC/VoFQS3Scd1juZ/gjTpRoG46Eq8tfFH+JPX3FOczigR01GUqE
         Gtb06n3zf9naCHxEerD2PUvcisjN8QL+tGki3MYbc9ESvcAfbYUbwLNOHDgh7RpiQv
         2QwPF/pr/V7mqYbGEMUUjBxnByIBpi9NMF+mPoKGthxDC7ZZ+3WZLhzgcswWwsPpNW
         9c2O8dvR2ondNB1wwt4CPrxUwyULAKAZpDptWcAXVmQ5P+V7WfuOzGONDlwEMM+slZ
         2losHzMFS0IJQ==
From:   Will Deacon <will@kernel.org>
To:     Rob Clark <robdclark@gmail.com>,
        Amey Narkhede <ameynarkhede03@gmail.com>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-kernel@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Barry Song <song.bao.hua@hisilicon.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] iommu/arm: Cleanup resources in case of probe error path
Date:   Tue,  8 Jun 2021 18:16:47 +0100
Message-Id: <162317119382.2860700.13290595260136409197.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210608164559.204023-1-ameynarkhede03@gmail.com>
References: <20210608164559.204023-1-ameynarkhede03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 8 Jun 2021 22:15:59 +0530, Amey Narkhede wrote:
> If device registration fails, remove sysfs attribute
> and if setting bus callbacks fails, unregister the device
> and cleanup the sysfs attribute.

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm: Cleanup resources in case of probe error path
      https://git.kernel.org/will/c/249c9dc6aa0d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
