Return-Path: <linux-arm-msm+bounces-20497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D43458CF791
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7275A1F21623
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8701FBA;
	Mon, 27 May 2024 03:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhneOmv+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31521D53F;
	Mon, 27 May 2024 03:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778855; cv=none; b=JczQqRCJpWY2Soo7DPzZg0G7mwn97hf+xMSkmD4LIatP4kmnltxol0SMqCEsm/P2sVkhLoAoZNMZfky3Yh8KQEwa4i9P8h62HUJzpNYPuZ/IOHTGsiYMcx9fVMV801sN2HkWiJUc63iwccaLMn2k5A6Gy/ReG7YepVQFvP5QfYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778855; c=relaxed/simple;
	bh=cjtXXm2phmfe6tZ3Dfr+4vLrieOMtsHK1BRhOat5euk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tt2vg4HoFoRN2s4rIfkAmBz05SZWoDsMpiSyOwX4qvWEVrPM8iTto+15kMiKxqWEJwUhx7jqV7IjBgWMXus+/lXzMYaBeU+nXzky9MhqYJWEVJ+/C9WTYXjR7drK2B4wctYFVn5Fht/fwSYbu/AhtLKKxRAIP6HZ3KesO5ndL/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhneOmv+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38B8C2BD10;
	Mon, 27 May 2024 03:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778854;
	bh=cjtXXm2phmfe6tZ3Dfr+4vLrieOMtsHK1BRhOat5euk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dhneOmv+/BT2SDiaEuQieLSOmKercEhFdbLUVEMlHgJb14VxqwVzfW2pXtB9uS4bW
	 7HzfsnC940DitlsZYsHAelqFSb26+qKH5Dch19FtsYeYziQJf2DGjMgoZPFCn8PG8o
	 +VaAORKGa7XoOeAewmuciR/gVwYB26g00aKCtxo7atkwyh/ct1+bKEhn0AJ8bLuNQO
	 4DeI2Rj174DE84yVpSspHwHmPqR00LRjc07Qb1WUrarzjOwgbIiOZ4uudYh28U5XVu
	 oH0iKE41sglTbOUds9TvvD0IRNOO2Tcwohynnoz9uFRkrkE0xveLlohi/BaynclzmV
	 eSovQh11AQaEA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x: Fix LLCC reg property again
Date: Sun, 26 May 2024 22:00:23 -0500
Message-ID: <171677884194.490947.13980440447323803565.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240525-sc8180x-llcc-reg-fixup-v1-1-0c13d4ea94f2@quicinc.com>
References: <20240525-sc8180x-llcc-reg-fixup-v1-1-0c13d4ea94f2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 25 May 2024 10:44:11 -0700, Bjorn Andersson wrote:
> Commit '74cf6675c35e ("arm64: dts: qcom: sc8180x: Fix LLCC reg
> property")' transitioned the SC8180X LLCC node to describe each memory
> region individually, but did not include all the regions.
> 
> The result is that Linux fails to find the last regions, so extend the
> definition to cover all the blocks.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc8180x: Fix LLCC reg property again
      commit: 3df1627d8370a9c420b49743976b3eeba32afbbc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

