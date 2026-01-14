Return-Path: <linux-arm-msm+bounces-89015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA959D1F4C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 15:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7865308F599
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 14:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BB92C032C;
	Wed, 14 Jan 2026 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izGnrmi1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9295D272813;
	Wed, 14 Jan 2026 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768399296; cv=none; b=Y+pcJ+Qw0A9n/3Zl3ov3D/BGf3xhw3M5hpT9JszsOmoyy6KTJYBd299zxzWd8KurF5tV/1REoLMKOnq9mVhNvhpH2KrmWjs7SpWUbHzU4PZTb30glNCk0I0l7ujmTgYiw9HPOsMpZLEU7mJwmN9U07VtE2qKrBH+uHb/xaOvCTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768399296; c=relaxed/simple;
	bh=qsyHjUwkY0nxEJlAVVtGXwHiPYNJv+cAJVY64U8He2g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lC2kW++MBLLwW6whgLtviw8VZ7Kv+VaHCN5csmAxiJrAzCWvfLaeyLT4I+319CU8LpV8MmWBblALa33Yf0xZzI742wuFkIDcVga1hvQpN1hPX718ACj3w45B84imN4HDEq26GFgSCpXOb6W20V3RB3BYF1hs0wHmp+jGxB0wxmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izGnrmi1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 228A6C4CEF7;
	Wed, 14 Jan 2026 14:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768399296;
	bh=qsyHjUwkY0nxEJlAVVtGXwHiPYNJv+cAJVY64U8He2g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=izGnrmi1Xi5mqc1+k/VAn5XqxpLTOyJDwEaLYBGIIOB2C+bkJMzWnVPCbJI4981V4
	 aI1HM40PDlHhvNF4gcZ6hkjxHD3eYDXhneyQM3S7Lx5jQgzO2Ix2Gftt7gZr4eL8cw
	 8m2Li0IOFBCU4sRGDPLoDtI6+EDAfVUNzwbjuclOuoo0BRRDhc8/eGJJBrPvG3ZWS9
	 LtAEAxrsQeOxWSqtAMCm7RCj9PpGXm68uFTmko53L+BhBRghuBxby4TFfd+Wfch5EA
	 PlQ5FOHzYNtrtLDwDh7FJpVPloM67GjYnJGrG5hYv7OGojEVpxr2xLLVO+TEzDTkjS
	 V7AprclsA5buA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abelvesa@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Val Packett <val@packett.cool>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260111083317.604754-1-val@packett.cool>
References: <20260111083317.604754-1-val@packett.cool>
Subject: Re: [PATCH v2] phy: qcom: edp: Fix NULL pointer dereference for
 phy v6 (x1e80100)
Message-Id: <176839929376.937923.9426049740721011950.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 19:31:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sun, 11 Jan 2026 05:25:59 -0300, Val Packett wrote:
> For Glymur SoC support, the com_clk_fwd_cfg callback was added, and a
> stub implementation was added for the v4 of the hardware. However it
> was omitted for the v6, causing a NULL pointer dereference oops on
> Hamoa/Purwa (X1E/X1P) SoC devices. Fix by adding the appropriate stub.
> 
> 

Applied, thanks!

[1/1] phy: qcom: edp: Fix NULL pointer dereference for phy v6 (x1e80100)
      commit: 70812056fbfb9348788e35b7641ff959b711840e

Best regards,
-- 
~Vinod



