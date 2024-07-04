Return-Path: <linux-arm-msm+bounces-25280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 142F3927823
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 16:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 451651C20E64
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 14:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45991AEFF4;
	Thu,  4 Jul 2024 14:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9aG9BH+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BC41B121F;
	Thu,  4 Jul 2024 14:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720102762; cv=none; b=eVH04GZ8DaUBtnBbkQ7n/fzJd6C7A0WCRkD2chv6/Xi6kT6ptc3xnI0Uy6VWogzFLNwNjSzfz2uGjOKRBcOVS20weeS05v4O70kNeKgFgjBWfNaedjk9XZA7yPKOOv3p9zddQlbIWoPgHq3IUTkc0onN7sSOZEVsot1feH64KN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720102762; c=relaxed/simple;
	bh=6Y9qZ3fNkjbyQPNWRJ1xf59z0Mvtn36Cx293JPlnnt4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UGBoZoKQx/EOZcKCRxy8cX55K7qu9hkhBf6ztYKZRwqfsY+nb3k/jNgsvhFC3mkiQ26bF3galGLnUCCRi/CIgx5oluK0KU0mftaarEbLBEmD/bgMHwe+0k8eKLPEnqieEMLOadfut30vRcIkN0RMoMARwN4Mnh2+KK/URY7/DYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9aG9BH+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8321C32781;
	Thu,  4 Jul 2024 14:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720102762;
	bh=6Y9qZ3fNkjbyQPNWRJ1xf59z0Mvtn36Cx293JPlnnt4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D9aG9BH+YFweLMCX7Lv3XuM8z5QGT2yVCGJ6W8U05lVPLOUtIbZ08FffZSNF/4CuY
	 EnMxMo8uJ5rGapSra8wDo7z7L4CwGhMeqMfuFgXH/IlvTOB2Oba02QbhdxGxpxBbZ4
	 FWsVWV/eKzTyx4FW1DLv9k2sTJq4FnfuQf7EgtmRNUj3j9uShD7NXW+gf22KA5gPI9
	 aLy1auhXqVE8T8FA85XEKXk8r7gW+cS/JzBnOf5ut81Fse2p6deeQiOsXBvunxqxFb
	 OFlysP5V8ChSWuvza6Dc7zPyNDxYhVjiDNCDX8R635hjw2bewmpgqHnCx/d+VN1JN5
	 5POKKl3hdxkTg==
From: Will Deacon <will@kernel.org>
To: dmitry.baryshkov@linaro.org,
	Georgi Djakov <quic_c_gdjako@quicinc.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	robin.murphy@arm.com,
	joro@8bytes.org,
	iommu@lists.linux.dev,
	robdclark@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	djakov@kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Register the TBU driver in qcom_smmu_impl_init
Date: Thu,  4 Jul 2024 15:19:00 +0100
Message-Id: <172009639255.3545038.8121726579305332079.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240704010759.507798-1-quic_c_gdjako@quicinc.com>
References: <20240704010759.507798-1-quic_c_gdjako@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 03 Jul 2024 18:07:59 -0700, Georgi Djakov wrote:
> Currently the TBU driver will only probe when CONFIG_ARM_SMMU_QCOM_DEBUG
> is enabled. The driver not probing would prevent the platform to reach
> sync_state and the system will remain in sub-optimal power consumption
> mode while waiting for all consumer drivers to probe. To address this,
> let's register the TBU driver in qcom_smmu_impl_init(), so that it can
> probe, but still enable its functionality only when the debug option in
> Kconfig is enabled.
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: Register the TBU driver in qcom_smmu_impl_init
      https://git.kernel.org/will/c/0b4eeee2876f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

