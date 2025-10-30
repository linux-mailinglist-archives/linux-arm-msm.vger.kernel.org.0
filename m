Return-Path: <linux-arm-msm+bounces-79663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6658EC1FB64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 12:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF8503B3BD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25399335BAF;
	Thu, 30 Oct 2025 11:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jT+p3rrv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87C83451CE;
	Thu, 30 Oct 2025 11:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822546; cv=none; b=V3ni9lQZIEaH88zxPYsNKt4lTANwyg+PGEzIzXqgt+zuVcHpqLCAOGI7UXYUxuAbNSnZX/jOiZKHmbWxIPcBuJQz2qh/SSI7eiW++q7AmfR7jk5NUhrw7P/NaXCDJtS0+lljrpt/mGz0NYoZdCNAQ9AKRqcGvduSJiiFZcHUD84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822546; c=relaxed/simple;
	bh=FCX7kNsLtyLNRubAudMV6rykTX7imV/sp3uCo7Q9xcw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uWffV/4lNIfWFaenAZKS3saujt/Wb8FbeyMObSPUjWUbZzSbJ2aE02oC+MucKCM6xLBhJjFRrZWb6t32Afk+Rx5I81oY1mDrF1AELlJVrry6XDVM7Id6FrDwn2X/Ei2354kZEtoeSLgCMBHZCEpMar1PBbSOO6mVMD5nulqQBk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jT+p3rrv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F935C4CEF8;
	Thu, 30 Oct 2025 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761822545;
	bh=FCX7kNsLtyLNRubAudMV6rykTX7imV/sp3uCo7Q9xcw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jT+p3rrvueaTyZ+BHjB/QHqFfsKtnfxdsnxKbDRU8JxqFhdUvkwVANSu8JeCoU5yu
	 pBi5lWLRF38b7M/RTVlPR8tgLkulLgexFG7bHDTqXSHRIoNO4Eyy8loQzglD4Z6/zv
	 ZNkxQ9qZOr++5Mj01AP0pm/+4S56bqTc5spjUN4Wvj/dJqoQv9nH75tz01/EcAJmN1
	 65fE0JPttKhH8GTuhUW8xF2U0WV6nfm2FeVZSgmUBJzDUlgMp/9dPubRVnswroxU65
	 SXw7ORSxCXkQoMgWWiQGmQJ2PKo1bqKxf9uIPcOJ24E/aM35SGPqPykYRX+kUbVvJM
	 kTSooJYfbE8vQ==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 perex@perex.cz, tiwai@suse.com, srini@kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20251029144636.357203-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251029144636.357203-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: dt-bindings: pm4125-sdw: correct number of
 soundwire ports
Message-Id: <176182254287.10093.1638379572271955116.b4-ty@kernel.org>
Date: Thu, 30 Oct 2025 11:09:02 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 29 Oct 2025 14:46:36 +0000, Srinivas Kandagatla wrote:
> For some reason we ended up limiting the number of soundwire ports to 2
> in the bindings, the actual codec supports 4 rx and 5 tx ports.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: pm4125-sdw: correct number of soundwire ports
      commit: 5e5c8aa73d99f1daa9f2ec1474b7fc1a6952764b

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


