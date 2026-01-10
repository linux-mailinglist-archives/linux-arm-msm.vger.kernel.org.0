Return-Path: <linux-arm-msm+bounces-88360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 331DDD0DB2B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 20:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC2C73079CA9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 19:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12CB2D73B1;
	Sat, 10 Jan 2026 19:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qsP27Wm4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76922C3259;
	Sat, 10 Jan 2026 19:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768072306; cv=none; b=tACyVP0EhprppH4j99TpcqpWjS55xsqk6+fYZkeM6KCIB2r8eSX3NzaA5+dfPBhn3T70zAKObvcH4zCZvRG1Dq0hyI1VFNH0pSB8SSeDJAA2LXIfmP5/iSmYIOioavHRO1Odz0TydFxD/gLXjdjQR1t52BtRYQ2gIPyV16kPkMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768072306; c=relaxed/simple;
	bh=QjuNfSoQf8+iBun95t5TTn336v0Eo+E0PnL4sJVY4vY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gKkW4sNx/ycCsdoeeJR9oYLEO6vr36l+dWE78ZHH4uNAOV9IB8QSgUPlIP7RP2V5lAHLhXF8FQ/hhCQ61QT0INp7KH2UCPUt6UCXHCdhmaWPyJG70o2E6GuskZZVZfjTHejXtZbTKOFtjCPMVXd1iiJCmFK5TR4QKq56iykFIjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qsP27Wm4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CDC3C2BC9E;
	Sat, 10 Jan 2026 19:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768072300;
	bh=QjuNfSoQf8+iBun95t5TTn336v0Eo+E0PnL4sJVY4vY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qsP27Wm4UkiOBihWUzxPSgJK+6gs9qrhSQsRlP03R7+1xGZDCqT4viQHC0kMH1eiV
	 xyTq7qo36oQ0Gm2q7xZl8xb6Xtb2Q626Hv/0Nvt+TzIV+Gt43hOhKWu4LUP6MsRIKC
	 YmQjXGC1A2LIkmII7tM+DmXJANBwVjHpdo7xX1kVVR1wwiECtwntSJn7QFwhmqwltf
	 TdvikWCmfx1JjIYv+xi9yYyAQwr10Q2ydCxd3qXsyhJsZw6yOaeVMN/iL1sULxYHZY
	 r/++MECRE82x2EsNTKcLQbhOydhWQQuhoTf80SozUzoKCsCl93KOw/xu5yed2f0Sb3
	 ue0ukgGbsvCXg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Bhushan Shah <bhushan.shah@machinesoul.in>,
	Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
	Alexandre Ferrieux <alexandre.ferrieux@orange.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Add missing clock votes for lpass_tlmm
Date: Sat, 10 Jan 2026 13:11:23 -0600
Message-ID: <176807228432.3708332.16539699536661954658.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109-kodiak-lpass-tlmm-clocks-v1-1-746112687772@fairphone.com>
References: <20260109-kodiak-lpass-tlmm-clocks-v1-1-746112687772@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 09 Jan 2026 16:14:34 +0100, Luca Weiss wrote:
> Without the correct clock votes set, we may be hitting a synchronous
> external abort error when touching the lpi registers.
> 
>   Internal error: synchronous external abort: 0000000096000010 [#1]  SMP
>   <...>
>   Call trace:
>    lpi_gpio_read.isra.0+0x2c/0x58 (P)
>    pinmux_enable_setting+0x218/0x300
>    pinctrl_commit_state+0xb0/0x280
>    pinctrl_select_state+0x28/0x48
>    pinctrl_bind_pins+0x1f4/0x2a0
>    really_probe+0x64/0x3a8
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: kodiak: Add missing clock votes for lpass_tlmm
      commit: ee021b27333b657d0799ac791c1a6b9ddb293547

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

