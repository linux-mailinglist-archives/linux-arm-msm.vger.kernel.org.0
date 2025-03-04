Return-Path: <linux-arm-msm+bounces-50172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00647A4DE02
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 13:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 538BC7A5114
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 12:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5469320409A;
	Tue,  4 Mar 2025 12:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhcQ5yCL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243372036E6;
	Tue,  4 Mar 2025 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741091628; cv=none; b=ssgI92sVt76dK34Q51QDJ9z69GwVFmT3l0GEnpNgt4ebsnke9xB69Yzork60Pu5dwfNOwa18Tti80/fg5FtamEyP5SZF9JKfXdBO/x3m8aVxjfCKjlcntgYL2SjrRx1wIjPXOJln9W48RjJtIn8z84NzpIrfvUu9emv4vunOpes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741091628; c=relaxed/simple;
	bh=rB/uyJghjRZ9Y1X1fJ21a32rEF+Ml0D56Cgz3IRTFh4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sl5ZcUm8UCKmaSuPaOPfKJaTjImyKe71QQDp8Xm3uuv5FiO67mLd8BCn8R6FAEW9fmnlVAIH0Mt+HsGZg8a5xv0Zmz8HOkrDZeiMziljV0YH7KzwSglFoiUezFIqxkbtP49e8wvf33w4IlUw7PyF4MHp0ZdXOShcvjMhJUtciII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhcQ5yCL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472B0C4CEE7;
	Tue,  4 Mar 2025 12:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741091627;
	bh=rB/uyJghjRZ9Y1X1fJ21a32rEF+Ml0D56Cgz3IRTFh4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WhcQ5yCLYgyfBw7MF8n8axEuh0VK4rtikfH64EshCL0KIv13ZQTnLSCjDVP4HVLKf
	 Q4WL0Z7SBNkbPRT5UjAQbcJW8gVZt6FABVlDVX3FIjOVFZwIhnZ751xgvXyDLvj/xo
	 8R989Zbd/hJ4NPZRCHSu9XwhnBbjhegDMciMzDZuNdUpo69hgsC5FM3Yh4KGP7bXkv
	 4wp49/7CMcmcK5yLEt/hYiEatUzZVbqzGrp1gH9l60eBrZwWW67vVnBCAoO9y9CqfZ
	 UlVgS83zcGgl03WHkqsen/Q+kWgLA11Sz1NQAz8xNgya5gK4wSYEqejxgCP8QIskaZ
	 oP+19WCk8akRg==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org, lgirdwood@gmail.com, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, abel.vesa@linaro.org, 
 neil.armstrong@linaro.org, perex@perex.cz, tiwai@suse.com, 
 jdelvare@suse.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org
In-Reply-To: <20250221044024.1207921-1-alexey.klimov@linaro.org>
References: <20250221044024.1207921-1-alexey.klimov@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: wsa884x: report temps to hwmon in
 millidegree of Celsius
Message-Id: <174109162502.25452.5105677983342188583.b4-ty@kernel.org>
Date: Tue, 04 Mar 2025 12:33:45 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Fri, 21 Feb 2025 04:40:24 +0000, Alexey Klimov wrote:
> Temperatures are reported in units of Celsius however hwmon expects
> values to be in millidegree of Celsius. Userspace tools observe values
> close to zero and report it as "Not available" or incorrect values like
> 0C or 1C. Add a simple conversion to fix that.
> 
> Before the change:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wsa884x: report temps to hwmon in millidegree of Celsius
      commit: d776f016d24816f15033169dcd081f077b6c10f4

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


