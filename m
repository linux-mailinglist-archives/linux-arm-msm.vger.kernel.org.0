Return-Path: <linux-arm-msm+bounces-43455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A363C9FD010
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 05:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBEA43A05D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 04:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A736130E58;
	Fri, 27 Dec 2024 04:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HpU3wx7v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C9F7F477;
	Fri, 27 Dec 2024 04:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735272935; cv=none; b=IYG6mBpKPkmN9sbCdlWVihNXeyrCmWp9NnK2xpArWBVOl24wSWNP/pvHIAqMThoZz+v5s8MQBfV7sLcDGSo9skV2fs63MtZTZXNEBesQnRMqAhqSOXfqd7gxfvkgLS6HBeoQHFfUG4p189L+3llTYo9Eux9vDxU4aXbS6oUwriI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735272935; c=relaxed/simple;
	bh=oNZ7NpxQ+vK45h1d+1Yg6PCD2GlzgTJH4CY8gyo9jeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P01eNExbq9dPnb7UD6RT//SUPr4IVyqT2lbVmrX9bevOltYtIlbFnQPIAElli8b0/AmBuvfsSgjvO2v8fkUASvQBhnSnq2M5yVN9RVt4vUylh5tE9YZtCfEb4vOz/CBknRqOJDIsi2u/VskXcY3bzIjVBhHUhSmy86S5jjNOqdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HpU3wx7v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C623BC4CEE1;
	Fri, 27 Dec 2024 04:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735272934;
	bh=oNZ7NpxQ+vK45h1d+1Yg6PCD2GlzgTJH4CY8gyo9jeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HpU3wx7voBbyl3CyXZqoxkrCYOYHMlqDasfjENdlxLQNYtao/DTQYNCg7hwwXtjsz
	 xFCVeu7Xhe6kVApbmcRjfGaGsY1qWVYvyzzcioRuKWC50cr7Kft1J92z5soPxyf1A6
	 bjn5bfAbD+FjSmw/dpy+sUkKME2tb3Y+KoMvqJObHANA87M92VfVUydQZpytAgELAF
	 OEP3UsXbXHBODJZioJ9Y/6RNa+8TTQmjJgFC9ic9WEa53gd9OlmRJ41ZUY5amrHNKU
	 hH1Pbq8I1s2ssCf2rw9ZmhL/J3fpm33jMBb019UAvFN2BBFsxJKX1PQZFsmVXzIvoL
	 yprB1G9cljcRQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: fix alpha mode configuration
Date: Thu, 26 Dec 2024 22:15:22 -0600
Message-ID: <173527291942.1467503.9219912935387229437.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241021-fix-alpha-mode-config-v1-1-f32c254e02bc@gmail.com>
References: <20241021-fix-alpha-mode-config-v1-1-f32c254e02bc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 21 Oct 2024 19:32:48 +0200, Gabor Juhos wrote:
> Commit c45ae598fc16 ("clk: qcom: support for alpha mode configuration")
> added support for configuring alpha mode, but it seems that the feature
> was never working in practice.
> 
> The value of the alpha_{en,mode}_mask members of the configuration gets
> added to the value parameter passed to the regmap_update_bits() function,
> however the same values are not getting applied to the bitmask. As the
> result, the respective bits in the USER_CTL register are never modifed
> which leads to improper configuration of several PLLs.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: clk-alpha-pll: fix alpha mode configuration
      commit: 33f1722eb86e45320a3dd7b3d42f6593a1d595c2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

