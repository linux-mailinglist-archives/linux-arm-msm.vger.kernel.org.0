Return-Path: <linux-arm-msm+bounces-23510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE914911B17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 08:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56051281CA1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 06:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B5916D300;
	Fri, 21 Jun 2024 06:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hpHlthpw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F8316CD01;
	Fri, 21 Jun 2024 06:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950302; cv=none; b=RFuG20XLm3z1U9ufltR2WCaIpA0rLE2h9nIUprBOBu4pfa8CYL38V34u2yzBv8XQEPWxSOMS4CMrCsuu5AJnrDZMNG+CoiFF801QaXN4QCsUWE+W9ZmZuyRrfZ4sRRMcJbipyRgggP0+Zx6Wf4+h676qbsrgWLLbPUxSbUNR3RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950302; c=relaxed/simple;
	bh=/7p4EWibp+39wGze2VFodXuE1Nowh/+3gCWNSzr3Nr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e8vx8NelsfuD1eoiCpXy+aHvgBL1Xlzun9ir0dzzXxQjU3Qg3rSkCTgirBcUc+U+SsewbZCpLkMM5ESh+O+kVGf4WysKoE/D1XvSCZ78tc+kcdszJIA2Gqu8M1OAmIC+2VkKZXw/7RBoF39nxzbyxzv4YLhFM7niK9ywdbt8asQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hpHlthpw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F37FBC4AF07;
	Fri, 21 Jun 2024 06:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718950301;
	bh=/7p4EWibp+39wGze2VFodXuE1Nowh/+3gCWNSzr3Nr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hpHlthpwytipg6gG/9C87OKCNE/lAfftm8kmfwJuCaKpdLSARO1ypo6w4UT09DNfu
	 L3bcyT/qys8b5KsuHoAZ0SC9Iaply6PANyu5l7tAUNGvX2L1i68FbaOC7kSaKaY8H8
	 MVLKFKFuuNmQCykeL4UEFbNXxZQvxTlaNGGbEWjoj1Jnx6fqxDddXEhhluKpsR0Gvs
	 CGhJUqw5jKXQDrklVAdJ4lTr0WgNYAZHa5Qhjc2TXlzHnMgQEbTJGSmk+HdPffYAUZ
	 zkuQnKD1NYacn1T8OCcsfyQwxskp/cptG77luLVKLzXrC38vHPzPyRLQvZktdrsSfb
	 g7zKEmwrK0cLw==
From: Bjorn Andersson <andersson@kernel.org>
To: cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Clark <robdclark@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180-trogdor: Disable pwmleds node where unused
Date: Fri, 21 Jun 2024 01:11:23 -0500
Message-ID: <171895028800.12506.5847544505762232246.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240614-sc7180-pwmleds-probe-v1-1-e2c3f1b42a43@collabora.com>
References: <20240614-sc7180-pwmleds-probe-v1-1-e2c3f1b42a43@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 14 Jun 2024 16:59:36 -0400, Nícolas F. R. A. Prado wrote:
> Currently the keyboard backlight is described in the common
> sc7180-trogdor dtsi as an led node below a pwmleds node, and the led
> node is set to disabled. Only the boards that have a keyboard backlight
> enable it.
> 
> However, since the parent pwmleds node is still enabled everywhere, even
> on boards that don't have keyboard backlight it is probed and fails,
> resulting in an error:
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc7180-trogdor: Disable pwmleds node where unused
      commit: 99e94768c890c7522af020ff0e5e5317b2d046d9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

