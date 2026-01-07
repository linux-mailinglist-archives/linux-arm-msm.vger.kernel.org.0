Return-Path: <linux-arm-msm+bounces-87956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 705AFCFFD33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 20:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 400993278C92
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 19:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7B1359F84;
	Wed,  7 Jan 2026 18:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zjtv75C8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD770358D2A;
	Wed,  7 Jan 2026 18:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767811114; cv=none; b=Y7/e21abYvLtVQR7sf6Ygb0aTHxJWgR4uzuOId/L99QwL/GjT+YBpe6kiSQOyJGboHj0w1yxwLDx+z7hO7nlGoYr5Ew/opm/Caaso9DJDQ/t0jJXm6badicWkarav61HDx6DmFoqWSW+r3TRU/F2QRKxap/oK8laQqCJg1WaXYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767811114; c=relaxed/simple;
	bh=UnoGgK3rZulvQ7+7qKRL2PAUxy2h9dm7tc2RPR5H5pk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RZXn4e5wkWfwEJVsnKFhnQvRVKu/l+HwmDyUj+moJDDVGFBC9Z9B3RydeC/AnRzozbKTMjOzZXgyQwYQnqgCLQyJH85POV/gHxoVPui8haBoaGXK8qRfeERPZ/uKGENV3mroWNEqA7g8uy8Ymu9IjyEyGEr+C92SDFBWYOm8x9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zjtv75C8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11763C19423;
	Wed,  7 Jan 2026 18:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767811114;
	bh=UnoGgK3rZulvQ7+7qKRL2PAUxy2h9dm7tc2RPR5H5pk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zjtv75C8bU6LOSZ3PZHsIZhImci8OB9N3l4n+g4QJw9+EZUskkZVAM1UPtmIWq8qD
	 9y/QTHTfTxYeOHOawoKRbbL6WzEkQNUcZ9t+s6O58Apsi/7VGvWziIs5WaDXdB3xIT
	 ZZ4PTBLu72sZtSwmLEO3QscMYE8XJSixFJRNEqmKAKNd+EAEgG7e2pE1qc+hBXwn3x
	 7R8UKQBuL2Q0mUw7X6NTXCKWmje4q8fy/C+ZG61+QtwTbCNWAZOHIOYRNySKRWDYn1
	 iIPWudv/JqxQTi8ZwuwCYId8saayD+UOlRFVcAhLT7cLWzNCC0xoZEU1dm//iCbSlV
	 khtt+7PhnJH5g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 0/3] Add the support for SM8750 Camera clock controller
Date: Wed,  7 Jan 2026 12:38:21 -0600
Message-ID: <176781109968.3262943.4143830345398842895.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 02 Dec 2025 15:56:24 +0530, Taniya Das wrote:
> Support the Camera clock controller for SM8750 Qualcomm SoC.
>  - The camera MCLK BIST clock controller, which is required
>    for functional MCLKs.
>  - The camera CC (clock controller) for managing camera-related
>     clocks.
>   - Additionally, the Rivian ELU PLL is utilized within the
>     SM8750 clock controller, so support for this PLL is also added.
> 
> [...]

Applied, thanks!

[1/3] clk: qcom: clk-alpha-pll: Add support for Rivian ELU PLL
      (no commit info)
[3/3] clk: qcom: camcc: Add camera clock controller driver for SM8750 SoC
      commit: f9580bafd39cff31bd51031e8784ea44acddf20e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

