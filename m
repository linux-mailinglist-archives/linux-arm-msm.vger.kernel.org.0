Return-Path: <linux-arm-msm+bounces-20694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C898D12D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 05:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23CF2B21ADB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 03:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5494D13DDA2;
	Tue, 28 May 2024 03:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVxWiwik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BDB13DBB2;
	Tue, 28 May 2024 03:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716867187; cv=none; b=TyVX1TV4ne1onxcX/uUp0moXEgLwtJn2grgq0ZJD0YpCSLHm6aG+Oen8E8gFO7XyTva7RWX6XGcNLz6Oyashpju7sL4vHVTvO9YC3wZB7RoF5S0ZcxTj5xp8kQzO/znAMHtG3BEjs3lAz612RoNDOyfNSPupkRarjNkBXD8UF/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716867187; c=relaxed/simple;
	bh=dDB4MzbcSFElqtZt9+bRCY+BKriajCFjzAiGgxz1qL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b7cWK2gF1iBtFSrofcxzn2t4RjjNhbuEBgfQCLBE2pulVIQc24kvhVcF9tzri+ZaD1pmNkQ6vehY+/oWHKRL1hE1l49z9Z/qIecsYKyrC6ASf/sTe473d3JPkoJoJRhctPpoX1OCyiBpRzWxCHRGQBow+jixnGvAN/wX/iYWUXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVxWiwik; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1BFC4AF08;
	Tue, 28 May 2024 03:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716867187;
	bh=dDB4MzbcSFElqtZt9+bRCY+BKriajCFjzAiGgxz1qL4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cVxWiwikRGNE4EPKQu0iFvfx/C6DP8dhPsvbIolVUSo56ZCWP2KdK0pC5uJUEPqns
	 Yza6NRm+AtKM06GZ3At/+wqBRT44t50YycI7Gfg0qrPi0MMk2NTTEU1xVoP9j5Y13H
	 neE9K++ipWj3kl2Cl+8WxUpYd3IwXGGwjcmwFOxBx93hpA9/hwEh0n2sHhAIetQjaa
	 XJHKOZCEPbQpPA1K8Bx6J2Go04vhffHk1h24Tt64zAKeDKFfAV0qb4sgr25/2yG+Rr
	 FAcimTFfCszwrki2oCYCAj5/Ipt/pLIu437Iukcu9kgJMfujwSkW+BwC5vLmcRQRny
	 pRObck0UeWvHA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: add missing MODULE_DESCRIPTION() macros
Date: Mon, 27 May 2024 22:32:27 -0500
Message-ID: <171686715141.523693.13801639740847509045.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240516-qcom-clk-md-v1-1-baca27dd2fb2@quicinc.com>
References: <20240516-qcom-clk-md-v1-1-baca27dd2fb2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 16 May 2024 17:19:10 -0700, Jeff Johnson wrote:
> Fix the following from 'make W=1' with allmodconfig:
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/qcom/clk-qcom.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/qcom/gcc-msm8976.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/qcom/lpass-gfm-sm8250.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/qcom/videocc-sdm845.o
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: add missing MODULE_DESCRIPTION() macros
      commit: 65424b99a1c24ef668b3c0ab0ca98e415b3e0f06

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

