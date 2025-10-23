Return-Path: <linux-arm-msm+bounces-78628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCEDC026CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 18:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C7E919A8478
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 16:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88422D7DC5;
	Thu, 23 Oct 2025 16:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzRmWjcH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC762D24B7;
	Thu, 23 Oct 2025 16:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761236587; cv=none; b=iHNPm1+r5Fxrnz0CRhAm/IOz4k1MaAqMdI4FCCjVQbzKcabrZdW2Ubo+zw8oHCalxiUdhO1tZ1QTRvKJ5L4bsdB9/U2i7ieoQZOf4Cx9jiXI7zL8elza6+CEJhFjO9mQvm7csLckUSaeGbq4NsBYOWjuoFwz/ymPdE8+ay8SiMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761236587; c=relaxed/simple;
	bh=BEFQib/TtAwUFZRizyTVeeX4zYZsDjrK31A+CP0AWm0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YiBEfb82cAXdSCSiZPcFATnMlL5aACuvnt18ja8Zjd7Vqnosue70muXuRHUDqqub1Bzh2Sx2Cygl0hfwGcaAAHhsuIcXoE6+ZiCgIbN2gtAklVfDhATd9T1b5pZAfvmRCUVohIVResi3njU+DXzxRSPal+wO5a9UlgKXPU9JWTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FzRmWjcH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285D7C4CEE7;
	Thu, 23 Oct 2025 16:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761236587;
	bh=BEFQib/TtAwUFZRizyTVeeX4zYZsDjrK31A+CP0AWm0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FzRmWjcHem+VwxKVkKklWt3F3LLGoeuot0UCfKjQiP8l3+ULlq4mxVKozlOi8fzja
	 Yfub9kvkxpr4yw8Yh+j4UDdXc53Weo8dco80aEgMW9tdZVlwdpSyidS64h94xm5LsQ
	 5JuGcgHR7aC3F5Qbd/lA6IOGOVLpOxyqJknIRe/jn7omL91WLOiNkLYxKwzqSdPnN2
	 sYiKN7/HF+ExsYIGn9AA9KG/5iT0cE6NV2znM514QqAyB7Ajho+NkD4VXR1UY7LzYO
	 0vPomlVyQ57HhKtIfL0NBYGkG6P0q7WhOjzlIvp/YHcOcZJId6v1nfgxbtq+WfMpXJ
	 0cDJMdd6quhqw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 jingyi.wang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
 kamal.wadhwa@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
 dmitry.baryshkov@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com, 
 yijie.yang@oss.qualcomm.com
In-Reply-To: <20251023-pmr735d_regulator-v2-0-452e1b28cd38@oss.qualcomm.com>
References: <20251023-pmr735d_regulator-v2-0-452e1b28cd38@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] Add rpmh regulator support for Kaanapali
Message-Id: <176123658389.145979.7696667247648761396.b4-ty@kernel.org>
Date: Thu, 23 Oct 2025 17:23:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Thu, 23 Oct 2025 14:14:35 +0530, Jishnu Prakash wrote:
> Add rpmh regulator support for Kaanapali by adding PMR735D RPMh
> regulators.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: dt-bindings: qcom,rpmh: Add support for PMR735D
      commit: f76dbe127f1b5910e37dfe307d2de5c13d61ed89
[2/2] regulator: rpmh-regulator: Add RPMH regulator support for PMR735D
      commit: d054cc3a2ccfb19484f3b54d69b6e416832dc8f4

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


