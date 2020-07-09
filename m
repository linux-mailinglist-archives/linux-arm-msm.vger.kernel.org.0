Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DB4219C9F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 11:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgGIJzB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 05:55:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:40028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726302AbgGIJzB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 05:55:01 -0400
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 97C0B20708;
        Thu,  9 Jul 2020 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594288500;
        bh=WYBY1L9rfI/f0RydLUyxDK/WRY5EDDEKQJfFVEthvWs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qyIDax7m4TgyTLCIp1Q0JmUO/W17WT2VrZkfCFZhRj0wnjnQVtubhoNQCrUfRNWX3
         YQwF15pmfIbAhMsdH21mRA8Zy6jobjhUW+P7CuBXQVfaXvcTXdXHzgY1fbBSojbzBl
         rvMz+4Bg+kLLdQhb+1f+qY+3KyAjYtGow1gytM0Y=
From:   Will Deacon <will@kernel.org>
To:     linux-arm-msm@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        open list <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 0/8] arm64: dts: qcom: smmu/USB nodes and HDK855/HDK865 dts
Date:   Thu,  9 Jul 2020 10:54:39 +0100
Message-Id: <159428494402.676142.15012748158989141396.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200609194030.17756-1-jonathan@marek.ca>
References: <20200609194030.17756-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 9 Jun 2020 15:40:18 -0400, Jonathan Marek wrote:
> Add dts nodes for apps_smmu and USB for both sm8150 and sm8250.
> 
> Also add initial dts files for HDK855 and HDK865, based on mtp dts, with a
> few changes. Notably, the HDK865 dts has regulator config changed a bit based
> on downstream (I think sm8250-mtp.dts is wrong and copied too much from sm8150).
> 
> V2 changes:
> * Added two patches for sm8150 and sm8250 iommu compatibles
> * Changed apps_smmu node patches to use new compatibles
> * Updated commit messages for apps_smmu patches to be more correct
> * Updated HDK dts patches based on Bjorn's comments
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/2] dt-bindings: arm-smmu: Add sm8150 and sm8250 compatible strings
      https://git.kernel.org/will/c/7b6b70d88b10
[2/2] iommu: arm-smmu-impl: Use qcom impl for sm8150 and sm8250 compatibles
      https://git.kernel.org/will/c/2c5c3cfb2da5

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
