Return-Path: <linux-arm-msm+bounces-27185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 607B093EC5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 06:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17A39281D9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD5614388F;
	Mon, 29 Jul 2024 03:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHaOVZTI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCAF143876;
	Mon, 29 Jul 2024 03:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225544; cv=none; b=PYT9uxK7Eokgui+91bsDXiaXp82/Qlo2AaxMIHc66N6DAa+B9LWO37D/rZBosZdSAlHCLUX8GksCsNwEHzLYDPBrGFnbPJMJvAzh9ND4RFO0cvg5bj3uUfx8CtsaSR/ek8U+ax3NqoR8+PF89dj6/JNDu0MnTOD76hsHwL7qR2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225544; c=relaxed/simple;
	bh=5GUEJV9MXDB7l0vlcjqUpgR1m+lYPH6IQd45Mjdjr+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oILPGHCi2/fm3iVJX3z8lluQXEgs32YO9GqmmFuBN1lInn5bUq4qinydpAzlLTahCUxbVvrPO3+frZteycWaMs/1/v2cMTi0sOKKVdRE7TNbDQkTyrx5SdWBJA46F88owQAsL2AxWEj5R11WQS3RiWKjb0kBBrRf7v6WF73Ayq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHaOVZTI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC3EC4AF09;
	Mon, 29 Jul 2024 03:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225544;
	bh=5GUEJV9MXDB7l0vlcjqUpgR1m+lYPH6IQd45Mjdjr+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FHaOVZTI2Y2fLiuRRZYXwb3izKM6GxB+4USpLUCx0Xk78IXaVMmNjvPv2vZ6KfhFq
	 3UnmmN6l8tT7YlX9YWg9mBGC3trWKQt+gqSXv3/cKp7OKwABLFi6buzCXOeWtFgOjD
	 ChE02isb4CzsHBnrAnH+ttDbAeAZaimBujwW88vvu3cfasraVaQbR+GOpe2JJBAyTl
	 Aui/eBw39RlKyMbVyGIrGognJdXJjCzLsR/KYqaHTw2qDhwGUH6LkHlafh4G9C9QDy
	 0RPY6AF/qx5igAj2t+EE0qisfFrNCjZhx5qc8dql0C6d1QlxKE9hjyCEpDLAQCYCPb
	 XJlVesao6G7lQ==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8939-samsung-a7: rename pwm node to conform to dtschema
Date: Sun, 28 Jul 2024 22:58:29 -0500
Message-ID: <172222551312.175430.7931052918795017037.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716135339.87192-1-rayyan.ansari@linaro.org>
References: <20240716135339.87192-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 16 Jul 2024 14:53:38 +0100, Rayyan Ansari wrote:
> Rename the pwm node from "pwm-vibrator" to "pwm" to conform to the dt schema.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8939-samsung-a7: rename pwm node to conform to dtschema
      commit: 6b18c5d2cd61ac0b526a9524110d4068ecfb1298

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

