Return-Path: <linux-arm-msm+bounces-64806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8EDB03DC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 13:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F295F7A5BC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 11:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4DA0248F66;
	Mon, 14 Jul 2025 11:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q8koG8gj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9931F247DEA;
	Mon, 14 Jul 2025 11:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752494087; cv=none; b=SpeCRxsd9YJd+0ifP/BJMOe3s5LBZ3zx2xXCIQ7F09yUABwdW0gSYYYzC9bdtlxBK5Bk280XrFRv+Od9Ntd76smflyE1rVLYhuh7xg+b4gqFESOfkyNMQrhKZd1ykFnSRAluqrHnWptG2yqo992rt214+rjtRVYbO9H1Gr97Kb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752494087; c=relaxed/simple;
	bh=BEdI4suDCa1AJOjae1DPirfKUedWtLNitntVz/0EeU8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QFPBN3lVIi8CLBvtOr5xfOS5TYTSMAtUpZbtY+c8okgXlG2aDpyWr0p/YPqGSHg3Pco8tQhbqfcC+l0c9/aN/l2W+zZqowKfRfUy42V5wuvaN66TcQ9N9NAbKVLrs+6V5hEkpwanlVJHSvC4fomEXST3W8Vejf3Nsv+OSNDBlNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q8koG8gj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E076BC4CEF4;
	Mon, 14 Jul 2025 11:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752494085;
	bh=BEdI4suDCa1AJOjae1DPirfKUedWtLNitntVz/0EeU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q8koG8gjVjygdannSoTdETsTOxp8Rw2grBIrU7MX++iiGT9Uw0JkA/IQXnrDBQgdQ
	 vFVHzsxPHggBECuaYnCaFxQZvie9awwqVUGz1HbWPyp2zBpaEuuuHqS1rp+CpdfTD3
	 BsSZtMEdcQdgerBcm2pjQUHzukvtcNvHY9H0pIvA8TNTMEvm10rxg95xcEX9WSVk/8
	 ++LecqB7nrZ3X3w1W24ibBToDW0mN0DzJzKNDrkjzrhu8mPjBjBZltSKlXkXcqQHWC
	 3vyi1lwKXDABeyMgFf+BzxLWnEQpW3AjK2x9OPOhlRzDK/WcuhfR04yunvVa6MbprT
	 d5JrqifJtlNYg==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Bibek Kumar Patro <quic_bibekkum@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iommu/arm-smmu: disable PRR on SM8250
Date: Mon, 14 Jul 2025 12:54:29 +0100
Message-Id: <175249192027.1455700.18242171323809718995.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
References: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 05 Jul 2025 19:08:33 +0300, Dmitry Baryshkov wrote:
> On SM8250 / QRB5165-RB5 using PRR bits resets the device, most likely
> because of the hyp limitations. Disable PRR support on that platform.
> 
> 

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu: disable PRR on SM8250
      https://git.kernel.org/iommu/c/b9bb7e814cd0

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

