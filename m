Return-Path: <linux-arm-msm+bounces-58582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 940E2ABCD2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0EDC8A38F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 02:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA4125E476;
	Tue, 20 May 2025 02:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZE4ogUs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0482B257448;
	Tue, 20 May 2025 02:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707328; cv=none; b=KrvrST7LPuXEwqdeUuD4/RQGCBsvfDu7xO7KT1zuptLJ7UYviGqLZ1YdZLiJWP2OKF2aN87ENHHfToe867gXOWhsINy+F7EJ1zjBlBqaaURyz/PZO6VTmn3bp461wkQZWPI7++VC0Vsqf20QbjKcBKXWHmCnSyLj2R9GBH0nmRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707328; c=relaxed/simple;
	bh=1gOEH/1Uhv4xJAIyGp3ur+fWQR0tI2iUdl4HZJjWSr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MnBnGXnapToEhdWaxP/t+xisXGH61B1pDhhDPJO8GNj/WDr4JVzy3nKyVFTlh2vm5O3AJr114TmCXUafRJ3hachTWdIAXRICVh8V1Ny3Nj+ZzwVcPgEcz4Qfzsxe3fk4LGrY318E7d/6FBYrfacFMsyjJ4kBnDZgLgaoJVaBrjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZE4ogUs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A84C4CEED;
	Tue, 20 May 2025 02:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747707327;
	bh=1gOEH/1Uhv4xJAIyGp3ur+fWQR0tI2iUdl4HZJjWSr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QZE4ogUs4cHvmDz2ls2uewUpC9tBNawFptT1K4raLD3nN/ftM8cEOrciFGaHE1UsU
	 r8OFmoN0RvL6nfrSyPutbMgZoYK7t2l9p3pmQk9yf/I/PVu0lvSM9M8VQYo6aAvrmh
	 ydOoiP6swDfgdsx86OshiBgnZrpDbI9sn4MCoB3WU0q3JXssGsRwsx2S8m8udxCJHf
	 Y3wUkeTE2/NkxuBr9d3mDM8clwT8QbCUffX7Ia92t6///Za/HWzs7S9ivcQ4JC7TmF
	 c3RwH5jXbqZqOSixGVQB3owkuzYjiOyZhbXDjEziVQOJr6lzdaUlr5vYoXsAbSXs/0
	 tkhitUufn5l3Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: qcom: gcc: Update the force_mem_core for UFS ICE
Date: Mon, 19 May 2025 21:14:54 -0500
Message-ID: <174770727726.36693.3666336524459019833.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414-gcc_ufs_mem_core-v1-0-67b5529b9b5d@quicinc.com>
References: <20250414-gcc_ufs_mem_core-v1-0-67b5529b9b5d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Apr 2025 14:30:39 +0530, Taniya Das wrote:
> The MCQ feature of UFS requires the both UFS ice and UFS phy axi clocks
> to have the force_mem_core bit set to allow retention after power
> collapse.
> 
> 

Applied, thanks!

[1/2] clk: qcom: gcc: Set FORCE_MEM_CORE_ON for gcc_ufs_axi_clk for 8650/8750
      commit: da94a81ea6c6f1cd2f389c5631e33c145ac7b35b
[2/2] clk: qcom: gcc-x1e80100: Set FORCE MEM CORE for UFS clocks
      commit: 201bf08ba9e26eeb0a96ba3fd5c026f531b31aed

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

