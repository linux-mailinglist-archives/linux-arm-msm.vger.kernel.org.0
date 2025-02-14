Return-Path: <linux-arm-msm+bounces-48076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 742F4A3686C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 23:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBB093B2740
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 22:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602C11FECC1;
	Fri, 14 Feb 2025 22:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkPXlsYE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344071FECB1;
	Fri, 14 Feb 2025 22:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739572715; cv=none; b=qH6axGGy06p2c8i+LHouKlqYn9+AFwkvmHmx7AQW2VD/HpUWpud5V1zBjslLv04h+qrTnYcbPJXDlT8CGHyfqZ+P9LqDz7MkJqXn6sCnHKXR9NTIatwXhQG8daRp72OyMEfdoRw9uMjBCBUfC7XSM0jAUAhGIFY70UB6WgZaSxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739572715; c=relaxed/simple;
	bh=SonK1RL6LWHVqF6G4bq4fgSAbCdSHpjIaRoELfh8dFk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KwqX7OHxmXoHXfnwNYckBHhslx85YSXDH/5VOGjcwDsmLXW0GAowyQW3jr/nqz+XbLwUq7YkWK2fqd93Ohl7s5RBF6Ry9u2XPvvL+VmSRSmU475/EqOmQ39Sz+/GMiPbpPPQPlnI57ZE4fbVPV8XOOpAlN80bVyNbNJwV0zg/WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkPXlsYE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0E3C4CED1;
	Fri, 14 Feb 2025 22:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739572715;
	bh=SonK1RL6LWHVqF6G4bq4fgSAbCdSHpjIaRoELfh8dFk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UkPXlsYEEN/NPUxKPEYnFnfIGQxg/8gORTj/v2vZjRZlZ6pHHp+x18W6mpXm8+4iE
	 MAm6H/W0oTEVdlesldMiashSRfX6ie1x/ZZEXozFwfA4L+G7VR0t/36yDjJf7jwIxQ
	 UNYf8zTDgGIjC2JjjHnUyZUhaVCEK8MZ72JCtF/qQGKUwh6czX1pQDRtANa1U/4kAY
	 jt2k+QwOT7XeBzPfQxo07wgQ/Iw2S8Ncx3WrhRO4JWfuIJVMqhOTFO/LcFZGW398aM
	 BqZA8RUwUC1tjmSCb553PP/HxM3ngzwPSmc8PPOEjaS/uJMZCAxrVlGE3aG40KWA2S
	 r2/Ano4BGeUcA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] clk: qcom: dispcc-sm8750: Allow dumping regmap
Date: Fri, 14 Feb 2025 16:38:17 -0600
Message-ID: <173957268922.110887.3323253803073136690.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212163243.237658-1-krzysztof.kozlowski@linaro.org>
References: <20250212163243.237658-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Feb 2025 17:32:43 +0100, Krzysztof Kozlowski wrote:
> Reading few registers at the end of the block (e.g. 0x10000, 0x10004)
> results in synchronous external abort, so limit the regmap to the last
> readable register which allows dumping the regs for debugging.
> 
> 

Applied, thanks!

[1/1] clk: qcom: dispcc-sm8750: Allow dumping regmap
      commit: d81901a5406eaf65a097b80ab48edc398de598a5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

