Return-Path: <linux-arm-msm+bounces-88352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6237D0DADD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 20:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58B6330222EF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 19:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D142C11DD;
	Sat, 10 Jan 2026 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CxbLz8p+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483462BEC5A;
	Sat, 10 Jan 2026 19:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768072296; cv=none; b=aZ/Q+K10bYZHFSzycgAUOBpOMq/GlZDVr+aSyrgP1/KMJ94iZRdKS0O7uyaxJdr7YFNBnbyfHGs0Zyzub2lCHZjk2igr0lYcQnButjC0uZXWhz+YM44eAvDuQTg64VNDdPyUI/hq8S+7EmcqdgakxxF8Vp8ci+VL/JMYupXuJ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768072296; c=relaxed/simple;
	bh=dUU57ymxvufvDgmbt5zDhcUmxnru5mFqX0o/mD8AXM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bItyD2PL6EvyJk66jmTNyqf9zvk9J/9FFfXrUsQ/8eM/rt/c8UCr8ZV5GhGcoS3e/zJU3EecHkjno0H33641/ltkJIxr8aQ1nYSiVPICNJBR9sSjUVx6smPuuaOq2ixSo3Rhlk/ZN0+dA5dFmTvQ04J0w/tsJ1QclZj8xwyNjbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CxbLz8p+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E56C116D0;
	Sat, 10 Jan 2026 19:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768072295;
	bh=dUU57ymxvufvDgmbt5zDhcUmxnru5mFqX0o/mD8AXM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CxbLz8p+Ze0TB7+oai204mntkTVnaWATnJYva9qi+qwOLdALqoFrYKRCPUA2FIrQ+
	 F72btm4wo4SQo6DmmuLQ/dqZCCoLX/WjaKuatOyeXKbqwDiC6kzbPa+q6HsGaI2SZZ
	 8II48JPsW9H1hzOGbPE4de7MolqAu9owD/NqnLhnwwt1Qc9KotSGNUcCDOQ62UCYug
	 DcLqAfwgJiHiIfoMjcD9zGs7nYQZOuKiGfjdA/CAPQDyHVfvXjoPddTxBk4Ayl9+ND
	 LU/o5LvCcq/TVl3Bm9nI+LEmtTuAzwcyB7KXEVCvdS6Ud/g3ER+DCm3arjyFlEwFkZ
	 DFHkYdxXIqQkg==
From: Bjorn Andersson <andersson@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH v4 0/2] Enable CTCU device for QCS8300
Date: Sat, 10 Jan 2026 13:11:18 -0600
Message-ID: <176807228444.3708332.17299201888079444801.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
References: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Nov 2025 15:06:20 +0800, Jie Gan wrote:
> Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
> the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
> configurations as SA8775p platform.
> 
> Changes in V4:
> 1. dtsi file has been renamed from qcs8300.dtsi -> monaco.dtsi
> Link to V3 - https://lore.kernel.org/all/20251013-enable-ctcu-for-qcs8300-v3-0-611e6e0d3085@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: monaco: Add CTCU and ETR nodes
      commit: 4f791e008807a1e7743cf6048822bab259b2ad0c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

