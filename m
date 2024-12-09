Return-Path: <linux-arm-msm+bounces-41144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BEE9E9F9C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 20:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 908051882290
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 19:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFBD1990AD;
	Mon,  9 Dec 2024 19:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TlLkSEct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8D7195980;
	Mon,  9 Dec 2024 19:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772512; cv=none; b=im5KgbfhQjmW91EgHrqIsKbgt2+V5iWzA61a+fJRrpf84BPpDdSktAqqdypOjmIbpVbu1Rv9CS5VQyDjG5BV/wXT/Jr3fIEYkFgf3JwQWeXc7b7QLwCMnMYDDZWsDIbhgvHWeGvHcvgqaeRXmB14Mua2M7BSkIZok1JRCkNhOe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772512; c=relaxed/simple;
	bh=y1PS3vCZPcXrFlz4qQcjRUU8em10d57GeSZKnlpeRpU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YZnhtaAfZlIod8AhKwrHOQmim8TARKRFSklcCiKOc7Bv3twGweeTM8ymVn6Vxs+pX+QsS5BqQB6b9S1QmSx0w6puANcCFiOML0cCAc9CLVLAdgyZR1ajoE1KXSWom8OvZHJJuPtg2kUypOUaQd+K39NqngMJnzSyt1QjmYW7/p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TlLkSEct; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845FCC4CED1;
	Mon,  9 Dec 2024 19:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733772512;
	bh=y1PS3vCZPcXrFlz4qQcjRUU8em10d57GeSZKnlpeRpU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TlLkSEct9oZwOI28pznT8pybo6CA0OucG4Jos1P09giB7y7H1u6lKsoYsKPhc3NY1
	 nPYU5SCJmoNsP2yJkuMlxdLJ+CKS8/1i519+yVIHkM4vY9jO6zSXFt3AevzDVQBeyV
	 mWU6LkXhN7ehdfKnPyfglZw66ygeFwQ2qQqc9izSvWQ8D3Hbt5tKDwFxXU3PtUVFyN
	 tj11KvkcxfbiGFDhxz+pvKt2i+Td+iXreF62k2nPbrgFUIJkTNcJu72gzdy9mPCqO3
	 c+Y69IRpZeg9cW3+qV5hbmuq32SrhxRe11l1jzuf6W47WatJ4QZBGlLqKAV9azodHF
	 Ib1HPcCD38hdA==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 0/2] iommu/arm-smmu-qcom: Add SDM670 SMMU v2
Date: Mon,  9 Dec 2024 19:28:24 +0000
Message-Id: <173377135109.3922978.5202199234250494714.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241114004713.42404-4-mailingradian@gmail.com>
References: <20241114004713.42404-4-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 13 Nov 2024 19:47:14 -0500, Richard Acayan wrote:
> This adds the SMMU v2 for the Snapdragon 670, used for the Adreno GPU.
> 
> Changes since v1 (20240730013820.41702-4-mailingradian@gmail.com):
> - explain need for specific compatible in iommu driver patch (2/2)
> 
> Richard Acayan (2):
>   dt-bindings: iommu: arm,smmu: add sdm670 adreno iommu compatible
>   iommu/arm-smmu-qcom: add sdm670 adreno iommu compatible
> 
> [...]

I applied the bindings change to will (for-joerg/arm-smmu/bindings)

[1/2] dt-bindings: iommu: arm,smmu: add sdm670 adreno iommu compatible
      https://git.kernel.org/will/c/87cafa082ce3

and the driver change to will (for-joerg/arm-smmu/updates), thanks!

[2/2] iommu/arm-smmu-qcom: add sdm670 adreno iommu compatible
      https://git.kernel.org/will/c/423147389063

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

