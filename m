Return-Path: <linux-arm-msm+bounces-56589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8ADAA7C19
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 00:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DF997B6F2F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 22:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79964215F56;
	Fri,  2 May 2025 22:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+AE/QWq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C921E32D5;
	Fri,  2 May 2025 22:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746224494; cv=none; b=ENsJvfuGfx47nrvkGzl1yMbq90Y18WSqQ73GHU+Zi3JGdzVf0j565JEYKI27a4l+7ia1mnKB7RMn/v4FF6rzHxlVkYLZUFqk31fOok8AZ5O6mPiC6zwZgSXyMwhGOry63IejXq7n2r6rQUQJaHlXfMNurp3G4A7ed2TsSMOzlR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746224494; c=relaxed/simple;
	bh=fG3d8Fg02oXt1YvEIlNOJZJDDmmHsyAC/nldx3bMtys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gkxj8GPVaqzbZoruzWbmtLZvssTOVYbrrdGo815gRS70UprpWVu6GuW5xUD0Clcv4RxW+oHzbhyR2OKepwPGGmW3j6CK3hc1pdZsxdQb1tY1Z5Uih/9dSWQncEyi/DFuQ3VzRr6j2PwnI7fZMrM3p5ELAa+0u7hjrX3yu2e093g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+AE/QWq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB8EC4CEED;
	Fri,  2 May 2025 22:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746224493;
	bh=fG3d8Fg02oXt1YvEIlNOJZJDDmmHsyAC/nldx3bMtys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a+AE/QWqp48WrIEZhiOtaMhrcmSKcsN4ugRZFeXcq+pSqDawvHs5UjmckxRI+8JC0
	 ONAOJ7u8NjwogtHjdHgwtye/gQgITGDJZTiszeXjoe6vrYDTmI/K0G599D9UfYDTDY
	 GE0HpB601Z1xIpLd+izhLBxS6n30NYnjzs6M3mxBRUGqlKiR9PdyZD7+WOv9hOWEuy
	 chlf3xA7zlLQuaU5EP5pQ7bCbSV5o0HPnfR8dqRlr4W3Wcxlsw9lFteFNRRFP1xapB
	 OOR4w2BEXw+bMdiylcQih1v5Vbr2tbgNij6POYtkwmMyn6J73nuX3ogJZvb0SqJQ+u
	 Nqmb+nNUFfEPw==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: kernel test robot <lkp@intel.com>, Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250427105105.18164-3-krzysztof.kozlowski@linaro.org>
References: <20250427105105.18164-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: codecs: wsa88xx/wcd938x: Drop kerneldoc
 marker from inner comment
Message-Id: <174622448885.4079618.3910091697301287558.b4-ty@kernel.org>
Date: Sat, 03 May 2025 07:21:28 +0900
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Sun, 27 Apr 2025 12:51:06 +0200, Krzysztof Kozlowski wrote:
> Drop the kerneldoc marker from a comment within a function:
> 
>   wsa883x.c:1402: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: wsa88xx/wcd938x: Drop kerneldoc marker from inner comment
      commit: 9cd54a6bf119891711b281fb45789f66255c892d
[2/2] ASoC: codecs: tas2764: Fix Wvoid-pointer-to-enum-cast warning
      commit: c23c7c60711e34963c78f18fc3b9aaa313b6c8ce

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


