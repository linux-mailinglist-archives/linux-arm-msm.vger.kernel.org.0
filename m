Return-Path: <linux-arm-msm+bounces-30521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 353B7969DE0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 14:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B264AB20B39
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 12:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD451CB539;
	Tue,  3 Sep 2024 12:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sFkMQFJK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63F41C9877;
	Tue,  3 Sep 2024 12:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367223; cv=none; b=Pe4MlEbEKQAGhs16P0fb434pGSNZUo2VoYhyB+iOo79hAgrOAIC/DjAir2BGrUzEs/ZXK75JLCaoKiiA4hSeiU9RySaylM5eBbJmk0SCKuA98uQekqJ3a9w5C/yY+g+5j2FUWg0gWAmvsFcaXbSqvZAGBWq328EghvKsZlsYp9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367223; c=relaxed/simple;
	bh=izkBs4bxUC1PwiJW7FvWem3hD4YQoDnnapyU6W/SLmA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qTNSrTRktkpGjGCw90YaGduCl3FUnpY8vEWqZe4ci+iDg6zLMnpPzqQfN1Y7VV6wLjDL53qNsA+2EHnGIzaqCyDuCDPYx16mPhR/CwWCYPrrY3QM/JCJTzLmajx5kkCcLsPnq4A4gpHVPlnLDnLM4cGfb1vKnUUomLlWnMnspVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sFkMQFJK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67064C4CEC4;
	Tue,  3 Sep 2024 12:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725367223;
	bh=izkBs4bxUC1PwiJW7FvWem3hD4YQoDnnapyU6W/SLmA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sFkMQFJKXWZyoZ2sX0aypDomqaQrB7h43pDn6kA5kPREXtQebHzyWOHjElggrc9rJ
	 Fs+nGQEtNNvQSS68qdz/juC0wmjMx+hgKycTfpV4OR8rWmcFUO99sFZRklxK1g9IuY
	 MvH3Kswf2+4TP0rHPtU3q2o8oi4dUrNlIBTPYCacLkMj4TRtQDv5P1+lsDaPETI2Xv
	 QVGBjkAUUihlJ0oDTiobP8SJOQXSrX4x7hf5jNu7J784CamY24Sgw57E4YAT56NPTF
	 W7n7Dn1CnlxXprZq4LoIVR9H0RePi2zQiy0iyTKLNFoqOV1RJ5Gjxo8DZ4kGanCpgr
	 A6b81XnV+GmxA==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marc Gonzalez <mgonzalez@freebox.fr>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240812-tdp158-v5-0-78684a84ec23@freebox.fr>
References: <20240812-tdp158-v5-0-78684a84ec23@freebox.fr>
Subject: Re: [PATCH v5 0/2] Basic support for TI TDP158
Message-Id: <172536721812.2552069.2889737892670833119.b4-ty@kernel.org>
Date: Tue, 03 Sep 2024 14:40:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

On Mon, 12 Aug 2024 16:51:00 +0200, Marc Gonzalez wrote:
> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> 
> Like the TFP410, the TDP158 can be set up in 2 different ways:
> 1) hard-coding its configuration settings using pin-strapping resistors
> 2) placing it on an I2C bus, and defer set-up until run-time
> 
> The mode is selected by pin 8 = I2C_EN
> I2C_EN = 1 ==> I2C Control Mode
> I2C_EN = 0 ==> Pin Strap Mode
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: display: bridge: add TI TDP158
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/887665792b99
[2/2] drm/bridge: add support for TI TDP158
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a15710027afb



Rob



