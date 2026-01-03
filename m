Return-Path: <linux-arm-msm+bounces-87321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3C3CF029D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 17:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 70AC43005F04
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 16:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49ECE30E0D1;
	Sat,  3 Jan 2026 16:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gV7UDu6F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2406B231A23;
	Sat,  3 Jan 2026 16:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767456192; cv=none; b=J/bDtKaxRf8WzRIru8kIUHH6oxUpJYAJ3+XS3zCRAz35tU3mX5ey6vKk/LemETb4Q0hj6vYtfAryXM/pdzGbo/3RB0P6sOtYULWL8eBuyxdFWrtfWTm1HIjeoXMGMZAXSeEqmPatfMCLubGaoms24r5VGrjf+BTSrNme8uYKfB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767456192; c=relaxed/simple;
	bh=qjC0Tm761Jl4eqSv8TYPB74QGobq6a82kzEuKcpOkmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gQASOc0e5GODBtL9uempMnyp8UhSv9MAfOcb1TIWrYY+foW6JwmteW/IQ4lrVWH+iAa3Gb8zt/azY8WRd1dAR6tJFiYXZk+QV9w+8AVqtVbsHlyE5PURgD86fEDcs8QtcjHmOywMIe4qUsFWj7urAGx23JgLng+mi98bVUYaXpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gV7UDu6F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6DAC116C6;
	Sat,  3 Jan 2026 16:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767456191;
	bh=qjC0Tm761Jl4eqSv8TYPB74QGobq6a82kzEuKcpOkmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gV7UDu6FFkYSeSaR1OUtVAN8QuiV3TfnA52IIugZBC/8WkjpfgnFUo3Gn8CbXdU8+
	 kiRSXwR0hrs2WQ9JXiy4tTP6g5se9yYRnpsdF76Cfk+WZR20w6DPM4LR0B5XWt8RYi
	 N0HOz9kD7hf5dVsZbt9FVzz1Fn6hAl2bXheOGuckH8zYcq+n6u8Akx/XxyYYkzJLuX
	 c2hFprriyPYIEU36jEW3d1N6OprWb7L6HUaP3fufCWSTmwc7RX65LXJwZL6hehQ2Nt
	 eh7T7H9rRtOgPJf3iCqf2CsMpNwa1L7f6zCEM0wfYkN2HjRf5nrAqtKnufEhXf6/nf
	 Av03b3nMQzPmw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sm8650: Enable S5KJN1 image sensor
Date: Sat,  3 Jan 2026 10:02:59 -0600
Message-ID: <176745617446.2631416.7464905538168539576.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251023025913.2421822-1-vladimir.zapolskiy@linaro.org>
References: <20251023025913.2421822-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 23 Oct 2025 05:59:10 +0300, Vladimir Zapolskiy wrote:
> Enable Samsung S5KJN1 image sensor on SM8650-QRD and SM8650-HDK/RCC boards.
> 
> The changeset is based and tested on v6.18-rc2 and it has two dependencies:
> 1) added Qualcomm SM8650 CAMSS support:
> - https://lore.kernel.org/linux-media/20251017031131.2232687-1-vladimir.zapolskiy@linaro.org
> 
> 2) a new Samsung S5KJN1 camera sensor driver:
> - https://lore.kernel.org/linux-media/20251023025356.2421327-1-vladimir.zapolskiy@linaro.org
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: sm8650: Add description of MCLK pins
      commit: 0ddb0d63453f320806727604702b6f6636a645c3
[2/3] arm64: dts: qcom: sm8650-qrd: Enable CAMSS and Samsung S5KJN1 camera sensor
      commit: 328407ba89ae6656c143967ba65465c50150aaf8
[3/3] arm64: dts: qcom: sm8650-hdk: Add support for the Rear Camera Card overlay
      commit: 1c20a021de58a23bdc264b91d75e944d19e49ba2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

