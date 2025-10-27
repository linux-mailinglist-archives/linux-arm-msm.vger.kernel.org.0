Return-Path: <linux-arm-msm+bounces-79061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05060C11D82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD03A56759A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C164534A76D;
	Mon, 27 Oct 2025 22:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUX4K6LR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964E134A3DF;
	Mon, 27 Oct 2025 22:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604528; cv=none; b=mvwCS8ahdEyFiyVpkSBijLfuLhvxpxC6MT6mOAfPudxqXYNnLxvBs9LiHvxcKuJEYOw936CAj8tLlsmzOT/NJEjrt0u1hvgI0Yzic5y6aLFRyz4InJWCyirJ1LcnCNw2AXB+YcN0tKsQN5dbUELKcq6Hi7voRouuuaMTfScEyQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604528; c=relaxed/simple;
	bh=1dEM3gWhB3GANHYUQZXkIjgmtnNPRmMVvaHmDYZ0MAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PXSBtBc+PWWrS68/ApkjmioB9gKLglBAURUmylVVfzzQZ1S733FvzMKjj7LIbuRJeJan7NQwRudltFWMruqxe+EYGKloeoHMe7JRDJG39pQdtCRX9DN/eKRdHVFpXumsJa4JCFtlgPUMZ/HXf8ptJs47YHrqRHOw4yJBdKabSoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUX4K6LR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC7CC113D0;
	Mon, 27 Oct 2025 22:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604528;
	bh=1dEM3gWhB3GANHYUQZXkIjgmtnNPRmMVvaHmDYZ0MAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SUX4K6LRd6EGxpTt39OwoV1YNW069uwWnqISo1Pyo+5AMIs8G9OeOOV5vv8DoP2K4
	 QCadfikedco2KC7NFkIy729w3+25MDOAFZ2n/jZNI58bqRjZAcYzLVEjAU7OU9W0fL
	 646ZMrjS3qlaJGqDNlGOdeYiUEmRMrByrH3c9uHREZ5f0sUQAV1Tc/q80ufj1Go/3V
	 aZxCG5cyllwkOTcQSSxXc+Z48/5YWwf7Zb90aFPe5udqpD66Q76/yGQe1oyO1fzg0F
	 ALwFnUpa+/WHs2eZ0gCb7SzbmUvu4Qvys2GyBBoJ2OHsK8w/IwchO18uuapFHCnUCO
	 j9g1MnnSEhNPg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans-evk: Add resin key code for PMM8654AU
Date: Mon, 27 Oct 2025 17:37:21 -0500
Message-ID: <176160465235.73268.728596820894012974.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015-add_pon_resin-v2-1-44e2e45de5f1@oss.qualcomm.com>
References: <20251015-add_pon_resin-v2-1-44e2e45de5f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 15 Oct 2025 18:04:55 +0530, Rakesh Kota wrote:
> Update the PMM8654AU resin input code to KEY_VOLUMEDOWN
> and enable it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: lemans-evk: Add resin key code for PMM8654AU
      commit: bc303efddf8b2b781d7c002a31bb89bc6579df2c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

