Return-Path: <linux-arm-msm+bounces-44172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17633A04689
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FE40166442
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD8686321;
	Tue,  7 Jan 2025 16:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDcOg3fX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2A527456;
	Tue,  7 Jan 2025 16:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267940; cv=none; b=CA3xAUlR9jX72FP6OYj/hoGuZRbnIqiSiqUm0h1WK0WsLbTRY5oT+aXJOSy7ihrq2pYYVIiroCfhmqQ6opmKZjnrINBmF9B7b5TbqWe7aFvNnNRRcwcz/Pn7eVVe/zwvFSXqEC2SVS/OHIphS8JK/8Kwqi8K4iJjULB9tw3CzYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267940; c=relaxed/simple;
	bh=DWQx8WEsKESUFPjj9BAWon46/zlSGKReSKnzZTffylw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eE53UgjkocKWdW2J1Tdrdwi/KWwJ5aImfrRSQ7QQe1+J9e3vRiI+hnfillfNFndME9zoFqtLeBhZ2Gj6K9PtUBTsELgmdvGnyVwcSFXlBzBqAnoThgpMIh87Ih1w3iYazNTNA/B/qS1tsIpEOYdbJDkzQ1zwwoxK15tpLrhJSrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDcOg3fX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F5CC4CED6;
	Tue,  7 Jan 2025 16:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267940;
	bh=DWQx8WEsKESUFPjj9BAWon46/zlSGKReSKnzZTffylw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KDcOg3fXeJGDwKxUdQdYyo/WbZOm5UJT9EmQU/AChEMLs9pjM7Ny7DXTik+OcUx+t
	 1pdP+sR+Rjyn3WHBI3X8KEiruwC0i5sN4JOmczs5T2qYX3MudY89xeE3caug1r0VLz
	 0d4ad6sQTm3MoNhWkzQMISbVgjmhELkWejetOPCSPSkI5tJvB9sOZO7g6G7xPAcKG0
	 PxG3H+pd0x3HT0qDcuc4+ojckrGWCT4hhFOpGjCJHkKxz3OnGluhVDHeetlpG8VJPX
	 dqUQmeXW7uZVJGUKg7692QjuL0jjF6JW1UyQ8Wp9ahSz9aoo/D3RcQsPbP5aZ1xj/f
	 kKWwOQU6dfouw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] clk: qcom: mmcc-msm8960: add support for the LVDS clock
Date: Tue,  7 Jan 2025 10:38:36 -0600
Message-ID: <173626793399.69400.17960011602514940539.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241224-apq8064-fix-mmcc-v1-0-c95d2e2bf143@linaro.org>
References: <20241224-apq8064-fix-mmcc-v1-0-c95d2e2bf143@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 24 Dec 2024 12:12:12 +0200, Dmitry Baryshkov wrote:
> On MSM8960 and APQ8064 MultiMedia Clock Controller handles special LVDS
> clock to be used for the MDP4 LVDS / LCD controller. Define
> corresponding clocks in the bindings and handle branch clocks in the
> driver.
> 
> 

Applied, thanks!

[1/4] dt-bindings: clock: qcom,mmcc: support LVDS PLL input for apq8064
      commit: 2b5add606ceac9fe4ea84ecd34351427b5602893
[2/4] dt-bindings: clock: qcom,mmcc-msm8960: add LCDC-related clocks
      commit: 0a0693fb2642604b4e14390dbf792f36e3485aaa
[3/4] clk: qcom: rcg: add 1/1 pixel clock ratio
      commit: a34d21d89c85e8bb72ecd83b7cde2cba1aa718f4
[4/4] clk: qcom: mmcc-msm8960: handle LVDS clock
      commit: 672daf24866bf002d0a7f2dca61e770a570e8cc3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

