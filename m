Return-Path: <linux-arm-msm+bounces-29646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E89B961367
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 17:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53A461F23E68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 15:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2D41C68A5;
	Tue, 27 Aug 2024 15:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sy3XA0Wa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E269664A;
	Tue, 27 Aug 2024 15:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724774194; cv=none; b=s6VXyceacRUwmDbN5lGk0iqxLT9jA0Up+Rncgh5yfwn0MHx4XGx0VN7wySF3Bo7R24+wqh1iHzkFWA2fBGnPcF9umAbXQsFlQcRYup49cPZWWAVyUB7H8EL/o71udP7rIEeQN2HqAOfDnKinSFgnECeThMukjLJ5pIY08e8EJJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724774194; c=relaxed/simple;
	bh=X7xAwVEq7UYKmL5TsBc1FitSBnKcmqyZKM5lZxcTfHI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JGfXsTHM5cxRFJyaOuc8nOeoJd5uuiHe8/bICzngpKPjVWaMTU+xyBl30Ep+dR0XNB21EDF+2KSfBXyqY7bdohHXUZVx85U5O4GIMK7oU2LAL6T6s8dK3hcMk9OFEPmGKXXdCsJMWssWC9SInbLK2zxbgLgLcYvqxgGmjMtyZyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sy3XA0Wa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFADDC4AF1C;
	Tue, 27 Aug 2024 15:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724774190;
	bh=X7xAwVEq7UYKmL5TsBc1FitSBnKcmqyZKM5lZxcTfHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sy3XA0WabhyJwgn0NiKa1h7CVYh3pi7Mdd49gK2GhZ46acYPGYCZx8ct3G4G8LSis
	 bEqZEj9k6qoO4U4v6u03JpwsS9nWcvOTZZzkVwaDuu52RcDc7c9NF+jIaYFR2PRvEf
	 VaK+neDJ4oVd0Fq+db0Dif/ZyIglYb1EbvQhrxjQtQXC6C8axmWwZB0dW4gOFU1wkt
	 wj21fnZ07IKWWMX0xCFPWQ0HXhU6on5doCw+gqNzjsXXUGQE+r5sptuuSzJ65EkLtu
	 IbO/fau+KWuRqO9OzgQzUERs0GPI1zMhdkn7jVEyPWmdm1m9qRkjOqt5uqcrDh6e6t
	 Z0kqp4p51reJg==
From: Will Deacon <will@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Work around SDM845 Adreno SMMU w/ 16K pages
Date: Tue, 27 Aug 2024 16:56:21 +0100
Message-Id: <172476226608.403918.15668836720825051259.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240824-topic-845_gpu_smmu-v2-1-a302b8acc052@quicinc.com>
References: <20240824-topic-845_gpu_smmu-v2-1-a302b8acc052@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 24 Aug 2024 01:12:01 +0200, Konrad Dybcio wrote:
> SDM845's Adreno SMMU is unique in that it actually advertizes support
> for 16K (and 32M) pages, which doesn't hold for newer SoCs.
> 
> This however, seems either broken in the hardware implementation, the
> hypervisor middleware that abstracts the SMMU, or there's a bug in the
> Linux kernel somewhere down the line that nobody managed to track down.
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: Work around SDM845 Adreno SMMU w/ 16K pages
      https://git.kernel.org/will/c/2d42d3ba4437

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

