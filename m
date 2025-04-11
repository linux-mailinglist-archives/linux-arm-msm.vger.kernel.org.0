Return-Path: <linux-arm-msm+bounces-53939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFCCA8540D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 08:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C12259A06FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 06:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E9027D76A;
	Fri, 11 Apr 2025 06:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rKsMFCn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4374367;
	Fri, 11 Apr 2025 06:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744352502; cv=none; b=MKgy148NSA92I/OYynSQoe9Pvaa3vB0D7bjzAz6jklmqIBR0yAOBOmXg4ALiVnCCDPqul2bx4Puq8YpxbLAwA0QLP8zoqT6KKSQOveXOcyicPkxp3jsmo5yCxVFa9iD64dsZSVWBk0aoi+XozSEKGpWbowH8w0AWoF/6cB7VpkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744352502; c=relaxed/simple;
	bh=uwwzJRyfNXL+Pb3Ntu55xpbTfqnsLWcsMS2/4C8sR9A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=apr0rPXHWjrtklFO9rIkzNaFoq/2l7cMrjY2BxN36PmB546G0o6QBEQspMcbdWUaGGvjH8c9HG+lYkD7n82XBOPyVyvv2IbbnmkmuUhi1izRYo9PyGFDiDuUSol6ZUts9lddQt5dFcUN7Yz+ToJQRR0akBds/uv4kxlU63GRLyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rKsMFCn2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18731C4CEE5;
	Fri, 11 Apr 2025 06:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744352501;
	bh=uwwzJRyfNXL+Pb3Ntu55xpbTfqnsLWcsMS2/4C8sR9A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rKsMFCn2k5vXBWmjWgqIe7kPyUtQb8IywjE2Ac9CTEnF9C55TJ+sPU8XRJon6hLG3
	 9/nAVaOkfLqn+1MResUe3oxi+rGAlnIsgMNCVLbcOFqa/KDvLwdFKsRGe4JKEGMJQn
	 uHS2n9pVMPy2mtFS74ASGiEUZz2I6W+sxOwx3ja/RAscwlN/1i4Pd4Cg7xn7+2+pPE
	 IPYbbvHRNlrgmMy9X8HMdyrRAnHIOYdCra/4VAAJk+B8gkvNsGTDoFsjtgIy948qxw
	 QjmolFIm2yd1DwY0kFvu81U99Ss8VhmgwASVorhr8TXTyysPoEHvWkiVxhCBMdLo2b
	 XlZkw1rdBff1w==
From: Mark Brown <broonie@kernel.org>
To: gregkh@linuxfoundation.org, srinivas.kandagatla@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, srini@kernel.org
In-Reply-To: <20250410103713.24875-1-srinivas.kandagatla@linaro.org>
References: <20250410103713.24875-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/2] MAINTAINERS: update my email address
Message-Id: <174435249981.1315708.17163326951823552256.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 07:21:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 10 Apr 2025 11:37:11 +0100, srinivas.kandagatla@linaro.org wrote:
> Update .mailmap and MAINTAINERS to point to the @kernel.org instead of
> the @linaro.org. Linaro address will stop working in few days.
> 
> Mark or Greg, could you please pick these two patches?
> 
> Srinivas Kandagatla (2):
>   MAINTAINERS: use kernel.org alias
>   mailmap: Add entry for Srinivas Kandagatla
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] MAINTAINERS: use kernel.org alias
      commit: 7f33f247138554b84729688169dfbe87724b70ef
[2/2] mailmap: Add entry for Srinivas Kandagatla
      commit: 807c1c83152138e2fc22101a57b9346159ad4f4c

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


