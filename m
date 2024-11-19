Return-Path: <linux-arm-msm+bounces-38403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A459D2E91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 20:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B784B29417
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 19:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26EC1D0147;
	Tue, 19 Nov 2024 19:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qZCf/9J/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8321F148FF0;
	Tue, 19 Nov 2024 19:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732042949; cv=none; b=k4K/HFvBISpiFQ2yYsEES5abGYk02Or4fquqW8iW1zF/GocP3NoXM9tJ4JddAyp273WMhHSGCwHjRw3qHdPuqgu54yhgsCvukv5QA9SdYxZTgQrp5UxYaIyuj1IGo2vnNgkwj0CpbT2QCIXCoyhRuEnXwTyfYKtA/TOmJ+V4MXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732042949; c=relaxed/simple;
	bh=E49jqmxuC52oXSPUAi1XEszqvt4bPFByFmxllcDYwkk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mROxgGwYtL2BjE74wkpoOj+Yuqn0Vu4X5c68YjRV5ewX34jkxMx1ESmrxwjxstXE8mJ9i/M6JkVpaSdVPsCNjGjK/5YiuujIUN7GaKjVp373ObCLZlqhB10+XDtmAqFWCbzb1fWIrKYoqSLPLTddszVHsOkix9vK8nqKTQMP66Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qZCf/9J/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D4CC4CECF;
	Tue, 19 Nov 2024 19:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732042948;
	bh=E49jqmxuC52oXSPUAi1XEszqvt4bPFByFmxllcDYwkk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qZCf/9J/OPpskuZ8lhWsKMw16bDbGfcJ5D7q/rqWCH+LzaLm0v2PB4eFGJdmuv8hR
	 fHRfMy0096T5yyJGNA6WHlCcuaxxNFbX+13FbND1xdEQIaeSWqTsjJYhYsQkW5fYVN
	 S5/JNkflj20EnXC9UnDStHtv/ZcrmqiWEZblP/Zr+qGznIT/JjvwSaMFPYfZ/MURxR
	 xYA6KsCdkLoJx+LEqZB0tklf/3DC0oNwfLXOGVRz8I+Q5aeL5wKu8ei95siQMqcLnc
	 PPpuqqHUPTdQHZW70Kpje/b3daDVJ0/ATipnunZt43/m5l892H70pO1ELhKVv7INiY
	 yXiAAjh7mMtMg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20241115-topic-sdm450-upstream-lab-ibb-bindings-v1-1-1f4bff4583b0@linaro.org>
References: <20241115-topic-sdm450-upstream-lab-ibb-bindings-v1-1-1f4bff4583b0@linaro.org>
Subject: Re: [PATCH] dt-bindings: regulator: qcom-labibb-regulator:
 document the pmi8950 labibb regulator
Message-Id: <173204294600.75287.4594724569290758580.b4-ty@kernel.org>
Date: Tue, 19 Nov 2024 19:02:26 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Fri, 15 Nov 2024 11:04:26 +0100, Neil Armstrong wrote:
> Document the pmi8950 labibb regulator with the pmi8998 compatible
> as fallback since they share the same hardware settings.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] dt-bindings: regulator: qcom-labibb-regulator: document the pmi8950 labibb regulator
      commit: 5262bcbb41d526f944a91a6a6c88dfb6fba3889b

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


