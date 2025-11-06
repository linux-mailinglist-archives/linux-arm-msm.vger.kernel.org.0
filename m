Return-Path: <linux-arm-msm+bounces-80677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0FEC3DE65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 00:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 294613AB898
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 23:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDF7355042;
	Thu,  6 Nov 2025 23:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JM1mg6if"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6476355023;
	Thu,  6 Nov 2025 23:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762473249; cv=none; b=LwFF/E0J6qkv9Co+rl4CephANFiZvlm/O0x9Kt4+5SyzJ7vBT4kcSxXKasZqQy+0W5v6sp6T86bIe23jEtCzVOcBIQJcRGci+/PEfZJJIzslH+otRQL9kY6RNuv8eisfQi6NdEIHG2zK9ntrr/RvkxzPqDOPYTaLo5KJek/Bym4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762473249; c=relaxed/simple;
	bh=2tO0Eyx9WlJ8GPbppW2T3TCce1uJrZBsLpQZbLlk9SE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uUeNEqIKYHG6JrPDdL9geP4AjMZmrhzYQmxHEM2+OXjXxHA2a3/hbuseMPZbdaZXT0uxQQ3sCG0ww3vTnspE+rYjV06T/t8IF1aEUsxkS1k+Rh5g+CEf32NIlY19dh2G6u+q7C4LjGrRxbg/MO9dv8CZlHG0Rk9SNLX+IZoMkOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JM1mg6if; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4185C116D0;
	Thu,  6 Nov 2025 23:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762473248;
	bh=2tO0Eyx9WlJ8GPbppW2T3TCce1uJrZBsLpQZbLlk9SE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JM1mg6if3vb/1NeNKxu6NrcgvOU6a/Gy8jKpB+KpEQLIoZILoF2/RNzIFon4SlIy3
	 75P7pCiKW67hqXr5zJeQv0wgiQ5z8WOGV8lIOSyCuNvXhhfqB+GxvTGSZX/tNsnCOh
	 +fYVzMVC/bSW6EqjaeRt5BCbWjxNICw6YYjC3qqRLxEsltAh8Tp3o6qohJu1EwsLbU
	 NsIfZF9CXq7aIuBrjVmAJQBz+94vkQwAVETGFgKCAbyKw3lX6zl+eXZLvvx6w7zYZs
	 Ur191WTbqHx6VBUldKzBSYJvg43WTywHtattgf0aiguNErVKLQGHyivxIrAtyJ7xez
	 658jacTlKs6IA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/20] ASoC: qcom: q6dsp: fixes and updates
Message-Id: <176247324556.2482911.14776461140754207169.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 23:54:05 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3

On Thu, 23 Oct 2025 11:24:24 +0100, Srinivas Kandagatla wrote:
> This patchset has 4 fixes and some enhancements to the Elite DSP driver
> support.
> Fixes includes
> 	- setting correct flags for expected behaviour of appl_ptr
> 	- fix closing of copp instances
> 	- fix buffer alignment.
> 	- fix state checks before closing asm stream
> Enhancements include:
> 	- adding q6asm_get_hw_pointer and ack callback support
> 	- simplify code via __free(kfree) mechanism.
> 	- use spinlock guards
> 	- few cleanups discovered during doing above 2.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/20] ASoC: qcom: q6apm-dai: set flags to reflect correct operation of appl_ptr
        commit: 950a4e5788fc7dc6e8e93614a7d4d0449c39fb8d
[02/20] ASoC: qcom: q6adm: the the copp device only during last instance
        commit: 74cc4f3ea4e99262ba0d619c6a4ee33e2cd47f65
[03/20] ASoC: qcom: qdsp6: q6asm-dai: set 10 ms period and buffer alignment.
        commit: 81c53b52de21b8d5a3de55ebd06b6bf188bf7efd
[04/20] ASoC: qcom: q6asm-dai: perform correct state check before closing
        commit: bfbb12dfa144d45575bcfe139a71360b3ce80237
[05/20] ASoC: qcom: q6asm: handle the responses after closing
        commit: a354f030dbce17ab3cf299660a38b162d97f7151
[06/20] ASoC: qcom: q6asm-dai: schedule all available frames to avoid dsp under-runs
        commit: e386c2cf3df2b62a6cc78d2f7984102b64753bee
[07/20] ASoC: qcom: q6asm: add q6asm_get_hw_pointer
        commit: b6a1d7243ec3a3fe1a3c2969fcd32c802fb5d2a9
[08/20] ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer
        commit: 44432315444cbbedadbb9d808c9fc8c8b21cb4bf
[09/20] ASoC: qcom: q6asm: set runtime correctly for each stream
        commit: f678ea19e8f60b05b8d3a5bcda9a238d5355bd50
[10/20] ASoc: qcom: audioreach: remove unused variables
        commit: bcb3f6f5286b96ff0a7106d2ca7208744b20b37e
[11/20] ASoc: qcom: audioreach: Use automatic cleanup of kfree()
        commit: 88a5f8e628ef745bb94bdf2fa019d9f8e069ccea
[12/20] ASoc: qcom: q6adm: Use automatic cleanup of kfree()
        commit: 896f1e4e106449ac2b39f0ca62b6afaed540f758
[13/20] ASoc: qcom: q6afe: Use automatic cleanup of kfree()
        commit: 55094e55ae36c7566e29ae0473d205dbc9d2f4a8
[14/20] ASoc: qcom: q6apm: Use automatic cleanup of kfree()
        commit: 89cf2223ee7bd83d45c6bef3ac52bedd018f77dd
[15/20] ASoc: qcom: q6prm: Use automatic cleanup of kfree()
        commit: de8e95773c48bad9d7339ccb376ad22d93932468
[16/20] ASoc: qcom: q6asm: Use automatic cleanup of kfree()
        commit: 6e00112d31c86029ad0440f8c29ee0d131984cda
[17/20] ASoC: qcom: q6afe: Use guard() for spin locks
        commit: 4b1edbb028fb95b546893068b321a983b1ef50bc
[18/20] ASoC: qcom: q6apm-dai: Use guard() for spin locks
        commit: b828059f86f67729aae3934650ae9e44a59ff9d8
[19/20] ASoC: qcom: q6asm-dai: Use guard() for spin locks
        commit: 680c683c8f49455bcfa1604eac4e508ba96ccbfa
[20/20] ASoC: qcom: q6asm: Use guard() for spin locks
        commit: 655079ac8a7721ac215a0596e3f33b740e01144a

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


