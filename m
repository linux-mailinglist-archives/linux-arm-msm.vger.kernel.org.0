Return-Path: <linux-arm-msm+bounces-41310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5059EB178
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 14:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C000283DA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 13:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1081C1AA7AE;
	Tue, 10 Dec 2024 13:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDSk6Ptz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D238C1AA78C;
	Tue, 10 Dec 2024 13:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733835628; cv=none; b=Ei4OvTfQQShpupSLFkwQMXGgJ+Ajv/yaE6eFA6P6q9gGsZisKNKlXs3IhA60m6Rli13cs17wQ0YPRDv6boRO6lUAPbVYfNkDip9qF4eRC2RtDY4JeiUdoBa7Rx3NvoUtEPcyudtf84DG9n7zzsFBFTHcG6w4c8ZA0/rnYk6cxaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733835628; c=relaxed/simple;
	bh=1bMa4RwxSGLHT6yZdYAi4CzytNOmSpdDawd9zxd0lT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HWaZxK0DfSwOlVswcyCPXS9J0gO9hEGsf7oKH3jbDdcruMB+mLzxRHZKwC8DZ4bAEe2nndBsEyi90jXi+6smim+vAfKCuPzZSTGQZ0/WBpnBgfhOxK4UFk+6RTdxId3AcThJY5NlE+/6YyWSfMXbugGD0ihyuMwzXMgjja/CWQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDSk6Ptz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0C6C4CEDF;
	Tue, 10 Dec 2024 13:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733835628;
	bh=1bMa4RwxSGLHT6yZdYAi4CzytNOmSpdDawd9zxd0lT0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UDSk6PtzIE3aVE3METwdz5z1S7ap+TxjzQUTNcogBP/qi4cz2sp4ZgWWq25OL5gyl
	 jgATczp4uTxgwfiBwTHriylMmF3CSxYtrgtzCkgdfygm6FNnCMGrFvjMwBKh+/5WjG
	 tW4a4IL1pFQIJrDPmtgKvHQ+AsQKYe85qsAUyqY/7VUkxKA79gNvhITK61JVteQvoK
	 i4YQNO5PIyY/dux9i4Ex0Gx8LdgGEN3o/e6YvMbw+QKgB8L6thW1zxJp7lQ9CFpSIj
	 oKrrxZ9lwnIX2ik89PFi75HGfZwIDhzAVbzBciG5L2GL9Tapidh4UI0d2ARWMKpJsI
	 93MLagddlzgpA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>
In-Reply-To: <20241209094442.38900-1-krzysztof.kozlowski@linaro.org>
References: <20241209094442.38900-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/2] ASoC: codecs: wcd9335: Add define for number of
 DAIs
Message-Id: <173383562586.33694.2386567230568830171.b4-ty@kernel.org>
Date: Tue, 10 Dec 2024 13:00:25 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Mon, 09 Dec 2024 10:44:41 +0100, Krzysztof Kozlowski wrote:
> Number of DAIs in the codec is not really a binding, because it could
> grow, e.g. when we implement missing features.  Add the define to the
> driver, which will replace the one in the binding header.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: wcd9335: Add define for number of DAIs
      commit: 76c29db042e4f0fdea75c76cd4ad5f36080cd1c9
[2/2] ASoC: dt-bindings: qcom,wcd9335: Drop number of DAIs from the header
      commit: e9705da8472f306b44cbe1992ea2161bb96ece6e

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


