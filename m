Return-Path: <linux-arm-msm+bounces-44025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82219A02F0E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 18:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BEC11884D29
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 17:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5761DE8A6;
	Mon,  6 Jan 2025 17:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aa+EX5RZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAB618A6AC;
	Mon,  6 Jan 2025 17:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736184874; cv=none; b=nMHghH43hmjFVB1X42ba/t4arjsNbRJ6s7O/na+EQ5fJ3Nl0Lr7Z59nb5HgCALSdWmeLBpoTb9Ewb2nEunN8ss1r2ydLEePJC3OfWdsE114V7zTzUAbT2p/gTNSAdXOdU7cRrEtaiFSpmDG/314xhO9M7KWN41KOA+dDW07TUBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736184874; c=relaxed/simple;
	bh=fv+f7FxuniZy7LfuEPvM5Ax8o5xA/QU4e+xtVxisUFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FyOpdxUbSqSJ77bSCGD9pjvurZZgJ5+KgYvb9g1pbNVmYViAE0v2O+YUGr/LP7ucVmhf3bRWXiCJnTOU+powNmdbTIUZ5FR1uxbX3ZUcrYuLoYgvFyVN+2uq23YW/rMqnHyBTXbx8w3GBGwvNcNEyvNDcJyDaMYr7C5ru8oJsjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aa+EX5RZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89EFBC4CED2;
	Mon,  6 Jan 2025 17:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736184873;
	bh=fv+f7FxuniZy7LfuEPvM5Ax8o5xA/QU4e+xtVxisUFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aa+EX5RZebCtGpiDuga7N1uwUpNl6bYEBw4qyHXznNGAtwe6nodLkIJA1rKldCIz2
	 J0SmZIJ9wpQ0Qz/Ali2boZeNRhLqNxJAzLIEVb4NZljklQNN240gbQ3b0nqXfSVls2
	 jL+cczchrEQ+aqc1kq5biE969ivgQSuSXmvbb7AA55uUGgsr0kd83qATnfu2SQFRRD
	 ++aI/lTs9Q0ut40NiUxhTkPsFxWQzn3cDk51ZjlfsXBHiDstQ2fbUzKJM/4kkeRJUj
	 EA7cra3sl3A9BMDOTpmorFSzR4Z9lpSFeWYkmfAMDavtg57hkvBiK3b5avsRKoUdjH
	 BGsmJFyiHJ14g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v2 0/3] clk: qcom: sm8750: Add sm8750-dispcc clock controller
Date: Mon,  6 Jan 2025 11:34:28 -0600
Message-ID: <173618486753.8645.8229026736689275726.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106-sm8750-dispcc-v2-0-6f42beda6317@linaro.org>
References: <20250106-sm8750-dispcc-v2-0-6f42beda6317@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 06 Jan 2025 14:44:28 +0100, Krzysztof Kozlowski wrote:
> Add Display clock controller for SM8750.
> 
> Changes in v2:
> - Implement feedback from Stephen - see individual patches changelog.
> - Few cleanups found during testing/review - see individual patches changelog.
> - Use clk_rcg2_shared_ops, where applicable.
> - Link to v1: https://lore.kernel.org/r/20241128-sm8750-dispcc-v1-0-120705a4015c@linaro.org
> 
> [...]

Applied, thanks!

[2/3] clk: qcom: clk-alpha-pll: Add Pongo PLL
      commit: 1adc528937c62324f319ca02d6827a865beafd0b
[3/3] clk: qcom: dispcc-sm8750: Add SM8750 Display clock controller
      commit: f1080d8dab0f1f83c47850a71c32833c768e3666

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

