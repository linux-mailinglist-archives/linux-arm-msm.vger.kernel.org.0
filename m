Return-Path: <linux-arm-msm+bounces-20689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5965D8D12C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E96C8B22DD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CAB13C816;
	Tue, 28 May 2024 03:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KebHt+it"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D4313C812
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 03:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867181; cv=none; b=ajTunGaRm0E41n/XifhWG6FMu+79b7CahVSciaDiyJWsMnavwFsnisYM0HTsNb2l/NG85wtuET/UiPeg1kkmcjyx5MOoh/4oLOz/5s3j0RKXjNHBlCrBRIau49urn76aUMnhM9mLJmUFFyLHV3AbmwoV6L1RSxTgK8NGiKJY6SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867181; c=relaxed/simple;
	bh=zHzPimdv2KnLlpvH1GAVPTimdIR9npkRiUWf44lJ1t0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pVqh/8TAMMScF7h44JfK3LIR+HIQVEJaSUU0LRMitKPoAA555Puwd4N4kDD2uPpCTwMx5CsSpbazbqX1IGnPo2BLrb2zS0LRCJ3++muudoZ2yqD/rU/xJIkD9eH0N0jQtp0FzN0SrajWe5LEpnHFUbXD3luFfu9p6Nyxh9ntNIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KebHt+it; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D77C3277B;
	Tue, 28 May 2024 03:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867180;
	bh=zHzPimdv2KnLlpvH1GAVPTimdIR9npkRiUWf44lJ1t0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KebHt+itAEv9yfI2JA9+XW32CQUiTkzPgYQSpMtY5GiMwicgpm3v47lHd8R/ZAmEA
	 NNbxkZyVA0h3x0ETmvO1kchMY7TCHukkFEfN8Xl8blQRNCRVUVDOnGYdvcbPpCuy1k
	 4naSMEoH3R71l8XiPhC4mX+Qokck++Dk/cLwcCFGUsOpdExDkGkm3KommKVN5Hm8WU
	 ipEKvJ/h2jGPGE1nDWc3NnEPaILGlbhg2j1Xnweang0q1P6i1jtDh6gplSFYCLfqkD
	 VCllth9x5vbKialVa9gHcaS+AQ10VBmA9K2c3F3jasVRiaxi4f5TNu8tgOGI2m70WV
	 KQB7bZGBoWL9Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Marc Gonzalez <mgonzalez@freebox.fr>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
	freedreno@lists.freedesktop.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bryan O Donoghue <bryan.odonoghue@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Arnaud Vrac <avrac@freebox.fr>
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8998: enable adreno_smmu by default
Date: Mon, 27 May 2024 22:32:22 -0500
Message-ID: <171686715153.523693.15237677868673432565.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <be51d1a4-e8fc-48d1-9afb-a42b1d6ca478@freebox.fr>
References: <be51d1a4-e8fc-48d1-9afb-a42b1d6ca478@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 15 May 2024 16:27:44 +0200, Marc Gonzalez wrote:
> 15 qcom platform DTSI files define an adreno_smmu node.
> msm8998 is the only one with adreno_smmu disabled by default.
> 
> There's no reason why this SMMU should be disabled by default,
> it doesn't need any further configuration.
> 
> Bring msm8998 in line with the 14 other platforms.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: msm8998: enable adreno_smmu by default
      commit: 98a0c4f2278b4d6c1c7722735c20b2247de6293f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

