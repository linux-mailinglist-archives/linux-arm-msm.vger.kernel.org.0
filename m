Return-Path: <linux-arm-msm+bounces-37847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 323AA9C7A32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 18:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEB301F23985
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 17:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E851E2038BC;
	Wed, 13 Nov 2024 17:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hy2Ag0n3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B590F70835;
	Wed, 13 Nov 2024 17:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731520023; cv=none; b=Sjb2GrsNUNIQ0RAmCPEcNSPSbJd4oS/EH307oqKThiQse29cD8kpa7AP2S8XiHcUKCYu+0ku3OUw1mPs5mSRyUZGV6sibV2QvBqIUTPjmBKPIoaEAboGnZ+VDyGVfGne6/TwZJCYgqZb7IiydQtLFNjOrDSVqPtIx5UdBlYsbgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731520023; c=relaxed/simple;
	bh=sp2Hn25t7hN6k+aTKbbqhD9q90LPBrBZkVKJf8hXhQA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QVfGmL0Xdt1XE+k+bNfrBDNXCgTOwLi+RmTVvwsKsXwjlHg0pVNdnSOagM5aBlscqlB8BiEDq4M3ybqRu2M3RMbw7TkauDuHWADcrvJMT/cIHfoh4obTe2GM7L+IaRLZLYdhgpJNndY0B7L6EI8/4VJpnjmp+z+97igTDRJAbrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hy2Ag0n3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13643C4CECF;
	Wed, 13 Nov 2024 17:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731520023;
	bh=sp2Hn25t7hN6k+aTKbbqhD9q90LPBrBZkVKJf8hXhQA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hy2Ag0n3qR+jRMLfPsbJAOiC+wKBfeEZxk+PQg5skVRyHQ944oATib6Szx4ZZiS1q
	 NxQLAwe8FHb4Bax6YLE2r3vDRE8i4hvnftF/tKTCiOCNC0fqK/JRVy13kRT37Q5F9Y
	 jfdxdMY5RJVEbJOiliY9AaEfK6C+dD5L5Pj/fZDT0SFaGmwxp77YbUxvt0OsNz4oYa
	 XueEQwuKAMSYUpi5lDltUa24qJepreGWAueDuAV1lMq2pEz8d7a6euiVTyFfa1LUed
	 FLUeSp/M/q8DqK9ENTr5oxLyLvlZwWVD8jmHbqSmkuiSsPEXaZ5QExtpXZsEs8F3fg
	 Z1kUU62fZRXyw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Trilok Soni <quic_tsoni@quicinc.com>, 
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
 Melody Olvera <quic_molvera@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20241112003544.2807368-1-quic_molvera@quicinc.com>
References: <20241112003544.2807368-1-quic_molvera@quicinc.com>
Subject: Re: [PATCH] regulator: dt-bindings: qcom,rpmh: Correct PM8550VE
 supplies
Message-Id: <173152002055.471967.17159431728276837850.b4-ty@kernel.org>
Date: Wed, 13 Nov 2024 17:47:00 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8

On Mon, 11 Nov 2024 16:35:44 -0800, Melody Olvera wrote:
> The PM8550VE has two more supplies (s1-8) than the PM8550VS (s1-6),
> so move to a correct if:then: clause to accurately reflect that.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: dt-bindings: qcom,rpmh: Correct PM8550VE supplies
      commit: 21ccadc64dae18bd092f1255bdbaf595f53381d5

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


