Return-Path: <linux-arm-msm+bounces-28687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F28F953BCB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 514881C22262
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EA515C146;
	Thu, 15 Aug 2024 20:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceJfi+GG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A0414E2D8;
	Thu, 15 Aug 2024 20:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754479; cv=none; b=ij812BjUAHaFo/oDi9FtcGcXS1RcfF7qCD22UK2NSJaIoffVGRBPLWJtAcMh2KsHs/G3WoeffYcLxYmNglxwhNXoSxCjyLI6Vna+Yun6C0ha5UdeNLnv7ksTzT7VdeB1pc9olBBzuVNthiniARBeP50fQPbpwn6dWvCZ8Pmn5K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754479; c=relaxed/simple;
	bh=wcFLYvU5K4hLAYQGtjndlpUrjhP3wgf4ZXBKPB7BOHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=knOaGJcgkZlyy1tBJAWX3EgU2DjGwEZKQhyECLq4mYFaCQzgdr9bBBF5KfBi7tJPaUyMv20Tn/MJjqZ8VKHGNIEm1T8rNJzUvyziYYnvxUx6Ba/FsQJvA7bSvqiGBeDYWwn55pxvHW1HirAUV6D3tgTLDMJITUqxvu6SZuxChII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceJfi+GG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52217C4AF0E;
	Thu, 15 Aug 2024 20:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754479;
	bh=wcFLYvU5K4hLAYQGtjndlpUrjhP3wgf4ZXBKPB7BOHs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ceJfi+GGIT550jwuU/TgjEwEqsYSVTHsD6rIF3bSklhKSE9w52ytjZKPKj7Vqg6Wu
	 ac9N+/9U+IhJ+CkCcV4+OgFfu/Lv8hnz8uXbcb2ZKhpOW59a0pRqsq5jdhCBNbY9GO
	 n1HNCLPe6P28KeCr61XJrBBmER6r0Q0eb6BCTxq2zMZf+adi3LTYg/uePaM4NZ8bHZ
	 cLqb/N8zwakiC5/FsvTHKKthyufpbn4iZVUcdlVpkErofPgsFucYwDLYrjOEO7YCit
	 RKqWn0YdQDdlYoUO09lVW2C/1bTAjFqRLnyrNEW3bTVHroj3B3oZ8WGe/27W7zyTh/
	 E+Rqjb6SDRMCA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Ajit Pandey <quic_ajipan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Subject: Re: (subset) [PATCH V4 0/8] clk: qcom: Add support for DISPCC, CAMCC and GPUCC on SM4450
Date: Thu, 15 Aug 2024 15:40:33 -0500
Message-ID: <172375444795.1011236.2878325032012172766.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240611133752.2192401-1-quic_ajipan@quicinc.com>
References: <20240611133752.2192401-1-quic_ajipan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 11 Jun 2024 19:07:44 +0530, Ajit Pandey wrote:
> This patch series add dt-bindings, driver and device tree support for DISPCC, CAMCC
> and GPUCC on QCOM SM4450 platform and also includes a fix related to LUCID EVO PLL
> config issue in clk-alpha-pll driver which is required for correct scaling of few
> supported frequencies in graphics clock controllers on SM4450.
> 
> Changes in V4:
> - [PATCH 8/8]: Sorted nodes with address and minor updates for review comments on v2.
> - [PATCH 7/8]: Added Reviewed-by: Konrad Dybcio received in v2.
> - Link to V3: https://lore.kernel.org/all/20240528114254.3147988-1-quic_ajipan@quicinc.com/
> 
> [...]

Applied, thanks!

[1/8] clk: qcom: clk-alpha-pll: Fix CAL_L_VAL override for LUCID EVO PLL
      commit: fff617979f97c773aaa9432c31cf62444b3bdbd4
[3/8] clk: qcom: Add DISPCC driver support for SM4450
      commit: 76f05f1ec7664cc7ef7f26364aaa09044a34f8ac
[5/8] clk: qcom: Add CAMCC driver support for SM4450
      commit: ef404007677931b19896429151056d9926c6d5c5
[7/8] clk: qcom: Add GPUCC driver support for SM4450
      commit: d63c77c5269652c32ad12eea98948a00cb6002ac

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

