Return-Path: <linux-arm-msm+bounces-72077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF01B43F48
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01EF5188B802
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 14:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A7E322DCF;
	Thu,  4 Sep 2025 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFNzUUFo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C39321456;
	Thu,  4 Sep 2025 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996542; cv=none; b=Crs6bColUwl84BbU5ANRJ2KQgpGD+E96bmpjxtm2AyyI6h5YSDM/ZrBmK3HunDIJSW/a27dHUnKsN08ejecA0q6RcBn91AfHIE33jkqMRYfiLlCMwK/OZJkxzLmOnKA1bwN3uGaOUiGs5lq+UttLOBSczY+jv5QadIdOfQUObBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996542; c=relaxed/simple;
	bh=HQN5W8Iww011ad22/ejwqbcQnnbtgnNCsPC/R+sWpmQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c/yMkJAct7As4byvgKdmZyNbOOfrugJnQCc1ksRYY95eWtLsR6/AP9wWhRGLlMHufgmjHLckXg2AQY5RuynAgLf3CEnEBPFCwcqL46elVeb/L8nsH5lxIrHU5L2Cg4gnYKctx3uaQ0iaQ0fJ3rbvGq2z0hDO5jk/3OGFngCEyw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFNzUUFo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829ACC4CEF6;
	Thu,  4 Sep 2025 14:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756996542;
	bh=HQN5W8Iww011ad22/ejwqbcQnnbtgnNCsPC/R+sWpmQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PFNzUUFozLdiWXu75euYv5Y39PfiN2i+voAUF2iRDMnrsJqJOZk5eWOTXxIkWhI26
	 VtRIDoh0F3BF/XKL9k/QwwFmqFcLRbXfGSf80mQigH8iZcAYY3fXKexEgWhfPv8Cfu
	 j6lZOJgAhYINkzsOD+k6u0gTchS+ocu7LlwWdfCJfdGQt6wKBx3NqS0r1CCG4TG4Bb
	 LxU+Kce+BQQ4JmV5gJnnhfndBAs0RYxvZ6mVooO2+poVaig3OfntFpZaHwyxeAop1Z
	 4zqySnCDNlcfQzrDUhoSU4T68Th52zoykLWm4o1or514nbRnki+1DpbV7mkJgODmhn
	 /v9CIBbWj2oRw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] clk: qcom: milos: Constify 'struct qcom_cc_desc'
Date: Thu,  4 Sep 2025 09:35:34 -0500
Message-ID: <175699653018.2182903.2284967246473813714.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250820124821.149141-2-krzysztof.kozlowski@linaro.org>
References: <20250820124821.149141-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 20 Aug 2025 14:48:22 +0200, Krzysztof Kozlowski wrote:
> 'struct qcom_cc_desc' is passed to qcom_cc_map() and
> qcom_cc_really_probe() only as pointer to const, so make the memory
> const for safety.
> 
> 

Applied, thanks!

[1/1] clk: qcom: milos: Constify 'struct qcom_cc_desc'
      commit: d923b9682e12bb63b8a1353110e67869a9bd0ba8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

