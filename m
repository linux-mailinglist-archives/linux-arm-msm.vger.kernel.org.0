Return-Path: <linux-arm-msm+bounces-61041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC12AD665C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 06:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A00D87A97DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 03:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6831D63DD;
	Thu, 12 Jun 2025 04:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcqCyHAq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC1C1C32FF;
	Thu, 12 Jun 2025 04:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700855; cv=none; b=CzG1HuH7zQPdqJFm7DUfCcucUKPfCAeJyoqkwWYkyHcIs2JZzXMk374oWj0htjKOIeiXT0pOc1lNeWa3afcosbGHGFabejfv3OASgbKGWi2Vy1oUwBIpxJb+hJV22csqNjxVIxpo4XKnPiQ+L0h/s3FKc4YN44TnmW2yqkrGbto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700855; c=relaxed/simple;
	bh=RNOBAoQ4FlcbcHzSQexrGIpqp38M7Y0na4e0BuXj+JM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qpltrrPTBX4/JVqwDN6b+qh3nPcp6QrwcbkXNeQgDbFSUKqIvTl4Ob23hj7ZBUsqTAl20ZW2Cawa6AtMuTHYVJ8unG/RUE1w6vR4YPG6U/OjZamrzfNYDqp10QeF5nijRQflWeAlfXG26NTX/jlD5XdJkVnsbARybrTXUUW9dEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcqCyHAq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D45C4CEEA;
	Thu, 12 Jun 2025 04:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700854;
	bh=RNOBAoQ4FlcbcHzSQexrGIpqp38M7Y0na4e0BuXj+JM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bcqCyHAqCEeSXpfh9vxS0s0cbuiJMAzHt90Udk+csPYBm7HlJIhsE46fUXeTUgRQi
	 I0+FO7rZCu4g4b6WjXlblFOcDIxdxIiCvEtQeeSxVzu7F9jO1KKQRX0t2/msu4gHMh
	 heMwwrzsgEyqLQBc2DrpUUcxA8DXCdGZr3uy5bF4o8Q/SW3YLcItvJKaibOaMs7oXR
	 7THcfMK2hq8+spwOvm1m++f+Tte7uO6IbgIxntrPwkOFULgavoktqlCy5bhvO/3xYU
	 aQHsF/TugdzzxEdQx1lPljmOKrBMJ7IIHj2YiQzZnVcQbVSrFPTqIBNfmtxJmpxjl1
	 2K1OI1JA3FuEg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>
Cc: stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-ipq8074: fix broken freq table for nss_port6_tx_clk_src
Date: Wed, 11 Jun 2025 23:00:33 -0500
Message-ID: <174970084199.547582.1426735315594799373.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522202600.4028-1-ansuelsmth@gmail.com>
References: <20250522202600.4028-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 22 May 2025 22:25:55 +0200, Christian Marangi wrote:
> With the conversion done by commit e88f03230dc0 ("clk: qcom: gcc-ipq8074:
> rework nss_port5/6 clock to multiple conf") a Copy-Paste error was made
> for the nss_port6_tx_clk_src frequency table.
> 
> This was caused by the wrong setting of the parent in
> ftbl_nss_port6_tx_clk_src that was wrongly set to P_UNIPHY1_RX instead
> of P_UNIPHY2_TX.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-ipq8074: fix broken freq table for nss_port6_tx_clk_src
      commit: 077ec7bcec9a8987d2a133afb7e13011878c7576

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

