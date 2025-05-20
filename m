Return-Path: <linux-arm-msm+bounces-58575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA78ABCD06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59A194A4548
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 02:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF08C25CC56;
	Tue, 20 May 2025 02:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DkmhgfdY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D8725CC52;
	Tue, 20 May 2025 02:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707319; cv=none; b=rQtvUyfrcM3D1opGkl5518T7lumlstNhyOtGMTDagd0Yej23V2LTO7kws6aY4dLuok5DkAma/6seHEbC61dyXAiYdGKoi1FSs0MaoNtw4c4Gha03f/eehH6Ve+Lro5naMVmK4hwJT+qc3UVjgHEEfO0g++3d+mqm6b/MlDBt8HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707319; c=relaxed/simple;
	bh=aif4sok9hdrX1kOdyNvSgLbob0/jzF6fPaaMyDfNVxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lqx/62siyOrPpzE8Og8YaaMEoBAxVQQy3zjvLDJl+7jZM1nX/HfYHZHbOOO9M+qc2VOmnKy55+GwFierBO3WnwPQWv6Wy5lRr6iQlWGpHJryCG/W/2zmw75KBan3Ye1fMLyERPqt3q9T585LpiVt9ZeYjUjsI8CPXpYRJemJOuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DkmhgfdY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ECCBC4CEF1;
	Tue, 20 May 2025 02:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747707319;
	bh=aif4sok9hdrX1kOdyNvSgLbob0/jzF6fPaaMyDfNVxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DkmhgfdYwT5Vh8x1usHObIkAnZn/FeTxix/NtYBappoORV2G5oa3NR1ohd40NOVpo
	 CeAKtsfMzG99qwpdxb/GOpEEBPr+CBFrnKQhMPs2hc1yCXkmg1M/qhJgDQLo3HqV6I
	 J6HYK9jh1eIil1VyRWrl5eB2a15sKotOIjTVejDbMyU+tiLcucAIlh5ns7gyf7RRNi
	 0Q922mXQxbdaRfCtyJ6+2C3V7SWOKC2xg6bSFoTxTb6LNDH5Zjxbek59sPlxYKEv1t
	 EpYn6jc8EV7AwO9KIf4U9bwV5uRXY773ct8+XNVAePlKxkSNxC9sBqZ9WY2xUN/WoY
	 KCNhv3xUCz17w==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: rpmh: make clkaN optional
Date: Mon, 19 May 2025 21:14:47 -0500
Message-ID: <174770727726.36693.18423131505308837812.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413172205.175789-1-mitltlatltl@gmail.com>
References: <20250413172205.175789-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Apr 2025 01:22:04 +0800, Pengyu Luo wrote:
> On SM8650, clkaN are missing in cmd-db for some specific devices. This
> caused a boot failure. Printing log during initramfs phase, I found
> 
> [    0.053281] clk-rpmh 17a00000.rsc:clock-controller: missing RPMh resource address for clka1
> 
> Adding the optional property to avoid probing failure which causes
> countless deferred probe. In the downstream tree,similar workarounds
> are introduced for SM7635, SM8550, SM8635, SM8650, SM8750.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: rpmh: make clkaN optional
      commit: 166e65bc6ce317be41368d9340b870edbdbaa2aa

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

