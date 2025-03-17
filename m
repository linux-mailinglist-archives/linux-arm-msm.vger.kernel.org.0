Return-Path: <linux-arm-msm+bounces-51568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E880DA63C71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 03:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44B6B165CC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 02:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443981BEF8C;
	Mon, 17 Mar 2025 02:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjYTRhpY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41EB1B983F;
	Mon, 17 Mar 2025 02:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742180183; cv=none; b=Bh7zIT6l4z9ZfIKrkoJPpwbNYapD2ne/i/8Qzypwcs5uxUMABj34cNUbO3AkJi7q0EpVshPEkukkiuw52yhrGEHNcWca3SZ+jUwZaERuqJLlpzXTTW2YnSBYK8lfKuFOQRaIXSZmMS4M0HpEIF6ZWJQAMq+frBvuWm1dTvBV5ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742180183; c=relaxed/simple;
	bh=Nvu8e/7BVeQgaTWguP+hHQ9KMgjFTA19FNA3cyENUhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dYh2FpVsu6t/7MTaXAUu5hwuxqNS4Agv98qtQvWsDiXBEW6xnv0W9aAVE1V4F9PTSuQgYgt4yBRZHxW21P6LAXPMtis2P+CbG3qyeTmIIX4rVIHDcHYxAwnnTtPP7yC2QQPD6HdcPSWfnGjnRw1Anj9af9jt7/MSFL01vTUBTrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjYTRhpY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C15C4CEF1;
	Mon, 17 Mar 2025 02:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742180182;
	bh=Nvu8e/7BVeQgaTWguP+hHQ9KMgjFTA19FNA3cyENUhU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hjYTRhpYj2GJOk6Mx1mRcJS5PwwPDSQPFFBhFe5IKnO+kA860slU67i7nNF7/ETFo
	 e/4sCoFNu39wiIZjIISgIY3A9VqSJJAxI9x1otXwl9WzLr6VtHsU+fTowKqi7lQw0y
	 WJRI2ccn/verycTKvolhF8+Dx0m5/pGf9lKdyD1aDZHc7rq/5B2H6nM6N17IGut0yC
	 dKvS/lqQ//EeilPMnLh8aPqbVQmWalvCjSQdruX/ukvJPbRdEcFNvA/6mMzoC0s7mW
	 HAeBK3UTBWnTYek2sJ5vhelRFbG2Un01FizKMRwJnx3XUqt4lYF6QkIi4UJMBf8C5k
	 muDvcr5+rgu/A==
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: qcom,x1e80100-camcc: Fix the list of required-opps
Date: Sun, 16 Mar 2025 21:56:01 -0500
Message-ID: <174218015901.1913428.7605554612020111297.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304143152.1799966-1-vladimir.zapolskiy@linaro.org>
References: <20250304143152.1799966-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 04 Mar 2025 16:31:52 +0200, Vladimir Zapolskiy wrote:
> The switch to multiple power domains implies that the required-opps
> property shall be updated accordingly, a record in one property
> corresponds to a record in another one.
> 
> 

Applied, thanks!

[1/1] dt-bindings: clock: qcom,x1e80100-camcc: Fix the list of required-opps
      commit: d547913e87a6a40b8690c069492cddc0cef6c573

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

