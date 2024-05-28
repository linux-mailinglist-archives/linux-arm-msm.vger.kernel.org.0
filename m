Return-Path: <linux-arm-msm+bounces-20686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B62F8D12BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32BF31F22EEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0FC0770F9;
	Tue, 28 May 2024 03:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEJ6271u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED5F770EB;
	Tue, 28 May 2024 03:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867177; cv=none; b=Y2m3dlFA8BCKuJZJV5zXFEGqZT3g0VxuSnsghFOes4w9XRvxppGNZ9/0RB+MKI+LWyKtqk9GKDeU0DTbyYjYaBatGKRl7TmCMqhC1+oxCKdE1ZnQPrQXT4W2x2KJuVV1sZoeaUYPdrLROXcaU9Jg0mDq7vUTE2S/mwCVyj1Imyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867177; c=relaxed/simple;
	bh=p0xyb7fqak+0yHFBMltmTH/YOTsYExkhQUF1Aa7Y7jw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jqDnBaUCZAXH1tx3Rn3Tk3WTr5/vpHZXD1aH0j4p6D9udx8e04FAA8xlPHhvmIB5kAMUWPwrs9/05qP1eygqQRu1QUKJdQZokAcNObGaYks2Ukhv26vj39plCgM7nqTzvTbeQW+Gm/82x9mb9HvqyJbb9QfV3b4qnamsuuXLxqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TEJ6271u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56E5C4AF07;
	Tue, 28 May 2024 03:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867177;
	bh=p0xyb7fqak+0yHFBMltmTH/YOTsYExkhQUF1Aa7Y7jw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TEJ6271ulxaWFPUetfpguvjPL1Kc9dGTgEgdxoJKkcZgP+OCB4DYuc+zLy/cfHChU
	 OdcZUCnh+2A9WYYFOVTcp4r+KBuarX1L5LB2cugyeKwh3wvSAcw1YZFIH0Y2tFATwQ
	 /1XNSSCTBVTMaUSrcMKox5xr3AUqzgs+mYI6nLWfsS4TPs0CO8KU7EmMVphlkEd70H
	 pdjffoqxc6ervpAJIu5d01jz0PaQuxJL7rWqs0bvx4qRFxplRCKrnkWoUt9IWLby+j
	 IT6OGMfljVNPKOkx1sHhVlaLlLbn7bbKFRYlL6BseD+kNob8p7h6aP8zxjj9pc0/gU
	 cmoRbCuJAGs9Q==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	"G.Shark Jeong" <gshark.jeong@gmail.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maximilian Weigand <mweigand@mweigand.net>,
	Luca Weiss <luca@z3ntu.xyz>
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] Various fixes for the lm3630a backlight driver
Date: Mon, 27 May 2024 22:32:19 -0500
Message-ID: <171686715165.523693.10910758933738092076.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
References: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 20 Feb 2024 00:11:18 +0100, Luca Weiss wrote:
> On the MSM8974 Nexus 5 and OnePlus One phones (latter doesn't have
> display upstream) the display backlight was turning off whenever you
> would write a brightness to sysfs since a recent commit to the driver
> (kernel v6.5).
> 
>   backlight: lm3630a: Turn off both led strings when display is blank
> 
> [...]

Applied, thanks!

[4/4] ARM: dts: qcom: msm8974-hammerhead: Hook up backlight
      commit: e23dfb4ee30a120a947abb94a718ccc1eb5f87ff

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

