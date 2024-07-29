Return-Path: <linux-arm-msm+bounces-27176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 490D993EC3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 06:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD611280C92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B10413BAD7;
	Mon, 29 Jul 2024 03:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0i5DxQz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3054A13B7BE;
	Mon, 29 Jul 2024 03:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225535; cv=none; b=Q+wpQZQuXn6MQsVt9tJZjzLssOPInhlpli8M3Q5NQFi/eGPYvdOKQZWja3p8lWn3eC+qO04c72uWKklRq7BrddaJGGTu6hpL/XsttLqGUdzy5EgdYfXfPA5huRoxeR5xjLJlqtC0GyQmw5xNztW2ceg7aNVNyHjD+qivTHbHS4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225535; c=relaxed/simple;
	bh=VqGHeVHANwWL/8GfM9MB8YYAt2hiOqKp0PHxhvnaqaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jW6qAiP9t0sHBP36BMqn/P/DBXGKqy5goGZK9F7ROC8/HWXO73w/8lVbE6zmfMu+dfr2RFB4CXcK4X9d0ERrR3T9A6jpaD3nRgoAxfS5SDlSSobtfgZiMtWGJuQN6yEj9ZfgJT/czO7w24ub9KP5rVYVuMUa6ciRwDoQAoVO0YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0i5DxQz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA443C4AF13;
	Mon, 29 Jul 2024 03:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225535;
	bh=VqGHeVHANwWL/8GfM9MB8YYAt2hiOqKp0PHxhvnaqaI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k0i5DxQzlsqhuPsgFgAzqaD27n6aS8HjaEZwUcPHLGR/544TXlKGY5yvY1Y/4gDBz
	 Gs4XCPHdrS8yBiDkcEFz9YaCRAorBVwwVf9Gf0cKYLft8pyv8K7GQR5xdOsD6Uk/dA
	 RQMEyln1Erk6e7TkWLKTzQ2RHiupIPvVAFvrmTiH5RHsHD79AjxctZTH8xGPNXDaXn
	 VIucLaieKuFGseAcRcQgZpL6583lYlxmtsPffzNrZLAcQxndO6nQvf1jOBY0WhqNxl
	 mCn0YJeoJv2nj0RzQcvSL5UOnsuS6BGEO1lDtAklAyGpq8yUdp4uv9lqr4A3CC7MPB
	 8Vd5nNBZy735A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Maulik Shah <quic_mkshah@quicinc.com>
Cc: caleb.connolly@linaro.org,
	stephan@gerhold.net,
	swboyd@chromium.org,
	dianders@chromium.org,
	robdclark@gmail.com,
	nikita@trvn.ru,
	quic_eberman@quicinc.com,
	quic_pkondeti@quicinc.com,
	quic_lsrao@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	stable@vger.kernel.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v2] soc: qcom: cmd-db: Map shared memory as WC, not WB
Date: Sun, 28 Jul 2024 22:58:20 -0500
Message-ID: <172222551317.175430.12484132433706298927.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718-cmd_db_uncached-v2-1-f6cf53164c90@quicinc.com>
References: <20240718-cmd_db_uncached-v2-1-f6cf53164c90@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 18 Jul 2024 11:33:23 +0530, Maulik Shah wrote:
> Linux does not write into cmd-db region. This region of memory is write
> protected by XPU. XPU may sometime falsely detect clean cache eviction
> as "write" into the write protected region leading to secure interrupt
> which causes an endless loop somewhere in Trust Zone.
> 
> The only reason it is working right now is because Qualcomm Hypervisor
> maps the same region as Non-Cacheable memory in Stage 2 translation
> tables. The issue manifests if we want to use another hypervisor (like
> Xen or KVM), which does not know anything about those specific mappings.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: cmd-db: Map shared memory as WC, not WB
      commit: f9bb896eab221618927ae6a2f1d566567999839d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

