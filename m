Return-Path: <linux-arm-msm+bounces-77770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4352FBE8863
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 14:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAA19626680
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 12:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF9F2D3EE4;
	Fri, 17 Oct 2025 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsCKHhUA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07962E6122;
	Fri, 17 Oct 2025 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760703184; cv=none; b=G4EwsDdAnsp7rLaIh01qka3fRONho1SDV0y28PmC+yreEXffMlJyis+8IrJ26VNa/M9bIeNqgjhV/AT/cOUn9isEVYP6uftQ/jX7nu/pj/kYvFSJj7agfGDe3n07LsoH7i74bds7eBSzlJjDpKxPCebBvo7MqPy+m9hv1xUJADE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760703184; c=relaxed/simple;
	bh=8BmUp4VDyPpHD3kmyBsQAiKThyIv/1V6ZE7dXLhnVeo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=khxeDsvZQJMVomeqzooXV9BJyMcOsGnpAO/XzvArSVeWHGIYmciYURx5TK03udLN+hwJijQKyaP9vjyOzanRJ+ImBq2lkEKsqDCDFTWeP7jPhh4iG6qHoLFZCMDac4kCeD6zji8FMGXCjJQqT0AR0lZMexP8evpmw3fqhA44hDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsCKHhUA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C280FC4CEE7;
	Fri, 17 Oct 2025 12:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760703184;
	bh=8BmUp4VDyPpHD3kmyBsQAiKThyIv/1V6ZE7dXLhnVeo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CsCKHhUA3/7vqBPMBFreZBAGlwQs/eJTNJHXnHigh1IP61TTRouU6wXBUzkJ+F8mu
	 SFEAh++jDxVF2XNUpHFefhsVHn5Itu2v75a1yWJgs7LXacq4TCyJN9q0XUpUNao3JG
	 p1ssQk162uzRDwp60kZUZGGw1lug+tswodeoZFyCPnqTOeFHRYUWViZ795VC9bW8FH
	 +zAakdVhCSllJpsUR0vxkcQEtr2VId2gkPdts1m9jU4/ec/gpytk3hdE84FtLZnofR
	 IvQZCfan9JEBWqmYn4IsbFUbQu6ElJNC6RKkR/BWhdqrmJqfeCoUFPCV4R1m5wZ6cq
	 7t4e3Gs0rO17g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20250918-glymur-rpmh-regulator-driver-v3-0-184c09678be3@oss.qualcomm.com>
References: <20250918-glymur-rpmh-regulator-driver-v3-0-184c09678be3@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] rpmh-regulators: Update rpmh-regulator driver
 and dt-bindings for Glymur
Message-Id: <176070318151.57631.15443673679580823321.b4-ty@kernel.org>
Date: Fri, 17 Oct 2025 13:13:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268

On Thu, 18 Sep 2025 14:57:00 +0530, Kamal Wadhwa wrote:
> This series contains patches to update rpmh-regulator driver and
> dt-bindings for supporting the PMIC voltage regulators present on the
> boards with Qualcomm's next gen compute SoC - Glymur.
> 
> Device tree changes aren't part of this series and will be posted
> separately after the official announcement of the Glymur SoC.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/4] dt-bindings: rpmh-regulator : Add compatibles for PMH01XX & PMCX0102
      commit: 835dfb12fc389f36eb007657f163bd1c539dcd45
[2/4] dt-bindings: rpmh-regulator: Update pmic-id DT prop info for new CMD-DB
      commit: 1356c98ef911e14ccfaf374800840ce5bdcb3bbd
[3/4] regulator: rpmh-regulator: Add support for new resource name format
      commit: 6a8cdef7dc2a4c0dbde3f7d7100b3d99712a766b
[4/4] regulator: rpmh-regulator: Add RPMH regulator support for Glymur
      commit: 65efe5404d151767653c7b7dd39bd2e7ad532c2d

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


