Return-Path: <linux-arm-msm+bounces-24905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2592C92476E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 20:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 576B11C23EAC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 18:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4ED1CB31C;
	Tue,  2 Jul 2024 18:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pW2/DNLq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD71F1DFE3;
	Tue,  2 Jul 2024 18:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719945857; cv=none; b=kFEtemLfUevI0J1r3HHd33ZvHl6uFWwQnpMzrpBKj5mdDWOMEP/lFy3KWbSLeP1rBvN1MGPr+xaCbkPJS3f6LvGEhlX6kJYhZyRAlJT6OUL1Ps+cRmGoGN80NOWsIWKBqzJB7QHosRZJJG4pblj/p7v7kYtDx8whtN7cTjEeshw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719945857; c=relaxed/simple;
	bh=81DVEaGVuhgaL3qUhWK3WtVKi0kz5H+uUytvhWe3MrM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PvpysUWBgLJONwNqSULjnv6NltUWumRiDRrrTgJzSn3d340HNhRWVx49PLfdByBMb4Aj49j9JHrIId2VmN7BBP7P0NaL+y7MDHy5ISDBZpAKmiMrellgvRUsQw+YDTTc6bwU9veMF1Hbs/Hqf/H4p4XU2Sm3N8yFUJ/wvPy8/ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pW2/DNLq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD46C4AF0A;
	Tue,  2 Jul 2024 18:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719945857;
	bh=81DVEaGVuhgaL3qUhWK3WtVKi0kz5H+uUytvhWe3MrM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pW2/DNLqngPdKmnWt0jlXQiAJdlCYqmvJrjSIqeo52Kg/w/PoE4oelx3hLHcHrr4T
	 6PRGpKFW5zCCzKCQkYs5N3jCCC8Fne+B5LLdxKiPv744PXpdIH1/Mvj+/Ujs0aNv7P
	 Uh+Sws1kyCXeTzCPQyAYvrOUkrXZcG6FoaJnm1QGZodrUhYgd/W9L0o0CAco3umxbu
	 Zq77z8+m2yXDx4D85hZIqFwc/X78wRQvC6WN58t9SqJpiePb7Z9xgh6i9lmD9+7+5X
	 BljiFE5QoDuis6yjwHG0G7PcGs8aX3raRT3IZ0QkTB09DXCzLziAlKS+QSiWdXU2fv
	 N+w8c2+jCN2ow==
From: Will Deacon <will@kernel.org>
To: freedreno <freedreno@lists.freedesktop.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sean Paul <sean@poorly.run>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Support for Adreno X1-85 GPU
Date: Tue,  2 Jul 2024 19:43:59 +0100
Message-Id: <171993892905.1967989.351563734585007693.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240629015111.264564-1-quic_akhilpo@quicinc.com>
References: <20240629015111.264564-1-quic_akhilpo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 29 Jun 2024 07:19:33 +0530, Akhil P Oommen wrote:
> This series adds support for the Adreno X1-85 GPU found in Qualcomm's
> compute series chipset, Snapdragon X1 Elite (x1e80100). In this new
> naming scheme for Adreno GPU, 'X' stands for compute series, '1' denotes
> 1st generation and '8' & '5' denotes the tier and the SKU which it
> belongs.
> 
> X1-85 has major focus on doubling core clock frequency and bandwidth
> throughput. It has a dedicated collapsible Graphics MX rail (gmxc) to
> power the memories and double the number of data channels to improve
> bandwidth to DDR.
> 
> [...]

Applied SMMU bindings change to will (for-joerg/arm-smmu/bindings),
thanks!

[4/5] dt-bindings: arm-smmu: Add X1E80100 GPU SMMU
      https://git.kernel.org/will/c/d6c102881b30

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

