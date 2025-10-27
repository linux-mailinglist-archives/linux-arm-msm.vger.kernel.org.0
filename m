Return-Path: <linux-arm-msm+bounces-79028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC32C11C47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BF3E24F5C7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58518330B30;
	Mon, 27 Oct 2025 22:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXYus5kE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2971A330B10;
	Mon, 27 Oct 2025 22:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604496; cv=none; b=me8ykg94tTEUlHqFWqUdFeAYlt4fCM54B/msuc6XzsYbYg51aNnL+hHeIlUaI7nK2UgY3hNEbfdyMygBFQvfoS7vVWtOZuA+U+k848NuNjo1AelkCZsyhqIxSpr1cWxho3cmV/MbSsu3TUn/7B7t1KKMjagdLuoOqMvE7fMYtpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604496; c=relaxed/simple;
	bh=pWpZ0NtE3UY90aOnsmJ2RNqSa67/Xlqpib85VILhX6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fDeZi+E1RPsqCFXBPbMCY6mZe6spqFjPR/gC54w5Z1/27xMlvsTJ6R0Hvahx5v3CNd9vXP0cFo/nYfj6eLrO9vk5ihayfOlDUYWCgLPqQJ49gQsjV/7cqLLu7LRNp7QUZHyEBcerAvcPjBbqx3DpQot/3kWzdLP1men25Y3PmVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXYus5kE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B993C16AAE;
	Mon, 27 Oct 2025 22:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604495;
	bh=pWpZ0NtE3UY90aOnsmJ2RNqSa67/Xlqpib85VILhX6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HXYus5kEs5KBC8XD+ruxTPpIxhJgGo7tY1I70pP/7UgRHdZ4G8awihdsf/vVVelEg
	 5p2R8Y30m5knpiPasEXmiPre7Yi4ATxU0wZnOXypAZNgQdr+tIazpGDUTXB0qF0TsG
	 BkLl/OJqv4qqEyVfgNrZHfAgbIAc/FgIf0JUNzsOL6Xi/8eczqsbz6DAB/do74V3y3
	 aGj4s7giKy+MX8LuhXgsIc6z7ZMQ1vmcu7OmlFFhg4QeZGOClg3hqkhov3D7B9d0XK
	 JooD8XBE83hPuHWKukPjrKY9oBVRAkEaqHv3LBoGFkSpBYkp3GaCp09xXbGZXkv/nB
	 Ts5SD/ffO7NdA==
From: Bjorn Andersson <andersson@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 00/14] arm64: dts: qcom: add refgen regulators where applicable
Date: Mon, 27 Oct 2025 17:36:49 -0500
Message-ID: <176160465180.73268.3344168499530806672.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
References: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 21 Sep 2025 10:09:16 +0300, Dmitry Baryshkov wrote:
> On several Qualcomm platforms the DSI internally is using the refgen
> regulator. Document the regulator for the SDM670, Lemans and QCS8300
> platforms. Add corresponding device nodes and link them as a supply to
> the DSI node.
> 
> 

Applied, thanks!

[01/14] regulator: dt-bindings: qcom,sdm845-refgen-regulator: document more platforms
        (no commit info)
[02/14] arm64: dts: qcom: lemans: move USB PHYs to a proper place
        commit: 883e20433fe586a6d3e1332d25f5e675921fefd9
[03/14] arm64: dts: qcom: lemans: add refgen regulator and use it for DSI
        commit: 7522c9ffaa97041a1a5dfdcb460d2a2b89f860b1
[04/14] arm64: dts: qcom: sc7180: add refgen regulator and use it for DSI
        commit: ac44b60f5d12cc5531dd04619b6fc31d84ee4091
[05/14] arm64: dts: qcom: sc7280: add refgen regulator and use it for DSI
        commit: f8cfb1932ce35c149bec81ea50fdf9b7472c6013
[06/14] arm64: dts: qcom: sc8180x: add refgen regulator and use it for DSI
        commit: 4be2ab8c4e7d35e287962f640a0994982776d4ce
[07/14] arm64: dts: qcom: sdm670: add refgen regulator and use it for DSI
        commit: 7223744176ef40969da0caa9dcc3588baa773b99
[08/14] arm64: dts: qcom: sdm845: add refgen regulator and use it for DSI
        commit: ca031c24bf66dc51e9304917243ca4d1a5dfa110
[09/14] arm64: dts: qcom: sm6350: add refgen regulator and use it for DSI
        commit: e53107df09622c3a6c534ff4bffad9634d05c41e
[10/14] arm64: dts: qcom: sm8150: add refgen regulator and use it for DSI
        commit: 0aa588760dd9f2f3d35eecd0a2120afe332b636d
[11/14] arm64: dts: qcom: sm8250: add refgen regulator and use it for DSI
        commit: 3aedde1859f341f0f631330928872c535769e20b
[12/14] arm64: dts: qcom: qcs8300: add refgen regulator
        commit: 2c9e4d7c6896ef285e884f0abf5c15d198cea469
[13/14] arm64: dts: qcom: sc8280xp: add refgen regulator
        commit: d4d1e799e9bf98ddd05023dd98860079e641c547
[14/14] arm64: dts: qcom: sm6375: add refgen regulator
        commit: afec70ac038bbd3666677436eb1ec0faf0504f72

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

