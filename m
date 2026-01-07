Return-Path: <linux-arm-msm+bounces-87952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF02CFF9B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 20:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A69E130242BD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 19:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CF934A77C;
	Wed,  7 Jan 2026 18:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2RvgzIR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2294434A773;
	Wed,  7 Jan 2026 18:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767811109; cv=none; b=F9+QfXx/JLvVQYj4j6aYQA6q9JawBJ9m2cBdiOoacV7r9jvR5vBeQZ1lskrp2YPEYpaUnAXQHOJMc1tERTlfl/gBfxAt9ZSWrx9RwF8fHBRPocUy+pzPcC737b2v3CPU3S9jrxxUb7gjirWqXcTtuAXrD0TfVzrTzcu7XMOtHLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767811109; c=relaxed/simple;
	bh=ILzARUgL8KTi0QD49We7SA7OHkkw6swzfzVK56zVIac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o6M+8XvehjoBEmbUirBFa4Emuag5ktFyVsDLXV77BvbbUttG2pBf+59Afc2nIFa6sTVYeuRRnIUdASNfTqtsTYsMGktlB1mtapI3OHwI6r+I+S/s5InUW0Xqnx/YetW6m/EAYcyMyq1/wLgpdXCstHn2/S199mMAy29gL9KpFQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2RvgzIR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A772BC19422;
	Wed,  7 Jan 2026 18:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767811108;
	bh=ILzARUgL8KTi0QD49We7SA7OHkkw6swzfzVK56zVIac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N2RvgzIR2XtXlgB79JbTx6/iOahkB8ZDWY6fe0ej0QB7efY26diMTK59yA+rqA+Hm
	 57m99ocNWyFxjb3hMbYTpXpLdclHtwjVdn6e7JApv1ulqoeoN1kVZUVkEwRw650JGw
	 K7aI8yEDz8WEM371Y+ODF95v1nyQE6hEkqsJG0Z53mUnsRgyNKkZA45b4YeIdUiT2e
	 nd5hAq98J0EaPKXzz22XzG2yjndlldBPhtJ+Jd4KI7HF5Ouo9l9HVZYRVNZyHUGi4i
	 GvVDYvu7lsbjRWSufC23F7uRpSVkwnO4bSQCNijsLj6wZkN8qWxGltajfKb+qKGgcK
	 4YluRw05K+TIA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adam Skladowski <a_skl39@protonmail.com>,
	Sireesh Kodali <sireeshkodali@protonmail.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH v2 0/4] Add Global Clock Controller for MSM8940 and SDM439
Date: Wed,  7 Jan 2026 12:38:17 -0600
Message-ID: <176781109960.3262943.14096756489283237069.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251117-gcc-msm8940-sdm439-v2-0-4af57c8bc7eb@mainlining.org>
References: <20251117-gcc-msm8940-sdm439-v2-0-4af57c8bc7eb@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 17 Nov 2025 17:57:05 +0100, Barnabás Czémán wrote:
> Add GCC support for MSM8940 and SDM439.
> 
> 

Applied, thanks!

[1/4] dt-bindings: clock: qcom: Add MSM8940 Global Clock Controller
      commit: d88d5bedb502eed6f439838b1e6148942a9232b7
[2/4] clk: qcom: gcc: Add support for Global Clock controller found on MSM8940
      commit: b97a6150050c7274d72a349afe017fb1fed34799
[3/4] dt-bindings: clock: qcom: Add SDM439 Global Clock Controller
      commit: 7a5a8a67c06ecba23d547a57d9fd317f628e1790
[4/4] clk: qcom: gcc: Add support for Global Clock controller found on SDM439
      commit: a6df111d55ffea7926fc7b136f96f16b314ad362

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

