Return-Path: <linux-arm-msm+bounces-61047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B77E6AD6671
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 06:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0875117FE80
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 04:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B70F2192EC;
	Thu, 12 Jun 2025 04:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjVLvHu6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8B7214A7C;
	Thu, 12 Jun 2025 04:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700860; cv=none; b=BM/EV8Io/LZBTiJVKgDzH9LEhgsjlH+OqUSGulnzXaSk/E9rSbGl4SU0wY5KGWt48hqrT/Sg1+hk0qYmgnj5ay4j7G13CZL7ZoO6cuGadLeStG2pjq2dURt48Os3XvplMkrZK2RdSxSXhgUPOFtNU7NCZjg1P/ia1Rmeh1mFTcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700860; c=relaxed/simple;
	bh=pDRU92uHlGJ5yI50jxsfiGWXXJPvSCxz68BeIKGRH7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rDoHnp9o6GYo2Ja4OcM+o2ocIqQE1V7pq5meMiIcoXvIGzS37/l9UPsc0iq9qdcDxfj9RHMeaj3TQZW7db/DgFHi/St4uXgpj0osoohpvXESfX46spbdkVfQpfr5cVQdf8Cz+8T1YAWxo1zXDhNYEtn2UQH/kIhcl+bwLQzJkBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjVLvHu6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BEAC4CEEB;
	Thu, 12 Jun 2025 04:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700860;
	bh=pDRU92uHlGJ5yI50jxsfiGWXXJPvSCxz68BeIKGRH7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gjVLvHu6xm7HAer3xppPj2JLMnkmEkvPO6afVfWM1nu7m2Vjod4v0+pqEOUTDlcRi
	 0wRlag4+MV9nfsfEFVZOTxqi67JAblftQAuGtlUV8jI8JMRI6VYdXHZx3QmmrdhHet
	 kbFAsG5YX8KH61o0+ZNwVpu8dNxQ5ZNTGaNfjdkyP8yXvJXicNNuozzyGH/k2nKpyw
	 rXPrjHk5qm4cfAouSboStFJ4AMHsA+hMigJf+yAhwm6RkH0mEWqkBde8poL+mG2Z9X
	 ZJG9ErLrF+Av2U8sGejaDluwgCrICLyxtKhtKapbC2rMBVwBA70T5Hwjd0TT7gMnVy
	 euN5AiBob6sCg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v6] clk: qcom: dispcc-sm8750: Fix setting rate byte and pixel clocks
Date: Wed, 11 Jun 2025 23:00:40 -0500
Message-ID: <174970084199.547582.700390478777102209.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520090741.45820-2-krzysztof.kozlowski@linaro.org>
References: <20250520090741.45820-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 20 May 2025 11:07:42 +0200, Krzysztof Kozlowski wrote:
> On SM8750 the setting rate of pixel and byte clocks, while the parent
> DSI PHY PLL, fails with:
> 
>   disp_cc_mdss_byte0_clk_src: rcg didn't update its configuration.
> 
> DSI PHY PLL has to be unprepared and its "PLL Power Down" bits in
> CMN_CTRL_0 asserted.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: dispcc-sm8750: Fix setting rate byte and pixel clocks
      commit: 0acf9e65a47d1e489c8b24c45a64436e30bcccf4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

