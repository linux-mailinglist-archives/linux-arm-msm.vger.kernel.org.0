Return-Path: <linux-arm-msm+bounces-65433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2F7B08A27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 12:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E14CB586EC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 10:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D97F2989B3;
	Thu, 17 Jul 2025 10:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsID2V0s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6FA298994;
	Thu, 17 Jul 2025 10:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752746517; cv=none; b=LtUnhelzIaj6hV2CmOXmOQzhVjPOH4H8ZSYhUivEnlFB7/ACKygJNoQfu0V8ubAUxz7q8wDDOYCRUl580IsMk54+dJBu4WuZn0p1ZcKzfeO0gbKEJQMdgkXXBDw/455HCKHgKwRtH3mrOn3Vs1oBPIzNmPMYyMd8a3ov0CAoh0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752746517; c=relaxed/simple;
	bh=fJQ+2oEx65X73kZYLhyRibH8bNmQTyazpPzrgi/ip1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PFb7DxKq6mwI1OK2qxTtJcIbVtGxg24pG94WXHNNXosFl2n/cxe92thiyw+NQWKJtDcLB1prwiCm4iORRNNrJMcTtcuGp4BtTFNxyf13Hokg0YM6uYpcOl+eFtmhAmaN34c3ChCO/w3Aa4utvwbGW17waEbk5HJDeowLJLmgIcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsID2V0s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30F6C4CEEB;
	Thu, 17 Jul 2025 10:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752746516;
	bh=fJQ+2oEx65X73kZYLhyRibH8bNmQTyazpPzrgi/ip1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WsID2V0soseOGU9BAyxuzAMgdU0jAWJjMiXP1mJKtiYoh9vWjY0isSL5b1zJlopj2
	 /ZGr2CYFkjNNJa8Owr+PPRu91CPJJJdHIhhI/EQUTS8C+vGOAAs5OxcO12C8oaCs+w
	 MXuTCMjEB07ZcN3csUeoGU0iy7Hp/HG8Fepv5geMeHVeTpd9mKNMMJtGaTNbN2ETP6
	 Sq4+EBQ5JFu1zUR/vjBknjp7+e14Cr6o2s5kIZeukQc0OdyLCe/837clqpEsFBkfJI
	 nkmWhLZb0KmmZOLa5f7eKB2jRlPpuFdSeuadPLB5u5tw7SmNkqMps96Fh6s8+fUWiL
	 9jGivpbfd2nXw==
From: Will Deacon <will@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] Retire SDM845-cheza devboards
Date: Thu, 17 Jul 2025 11:01:30 +0100
Message-Id: <175274460748.247797.878702173890066148.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 16 Jul 2025 12:16:06 +0200, Konrad Dybcio wrote:
> Cheza was a prototype class of boards, based on the 2017 SDM845 SoC,
> used for bringing up ChromiumOS on Snapdragon platforms.
> 
> Today, almost none are left in existence, and the small amount of
> remaining ones don't get any real use.
> 
> To ease maintenance burden, remove it from the kernel tree.
> 
> [...]

Applied SMMU bindings change to iommu (arm/smmu/bindings), thanks!

[3/4] dt-bindings: arm-smmu: Remove sdm845-cheza specific entry
      https://git.kernel.org/iommu/c/ac1207f516c2

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

