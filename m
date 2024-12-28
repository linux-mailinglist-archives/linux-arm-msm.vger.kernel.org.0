Return-Path: <linux-arm-msm+bounces-43537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F469FD8EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 04:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5AE93A2572
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2024 03:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADD554727;
	Sat, 28 Dec 2024 03:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyq7v4YG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F53487B0;
	Sat, 28 Dec 2024 03:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735357198; cv=none; b=BHE5FM+cuH1Ai6k4LCTtoMc7rotUYFb6z3aEZw1YbCs3HFr5fXjpL+qyWg/1sugonEk7BgsmzNj2CL1jp3Uz7BKyBa+PzvGXufSPD8vlgLbeQsdZIjcPXqAZxihiFm8VAD9iUoosNYYwCd3CyR7KJcCc9j+ONeKJTULXu7YdC4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735357198; c=relaxed/simple;
	bh=Hr93u6NipALdguYsRVh3QelrGJBOGReO5Jet5dtvAek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XnqA3FQZVoDm7PLvr7DeV6URccqrHKKMlI5PXQc6SA4u8QTftw3E1xlEqhw/uCv75BzqAnhdpR81Je5k/vBXKrCRBllbguOCXhY1EBFp1IB8BL5f/6TN9t94MfJsw30UcZr5L4V5yiR7EbU3nG6q1zKbLqPgHGaKmEwVTcDz5jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyq7v4YG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCF3EC4CEDE;
	Sat, 28 Dec 2024 03:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735357197;
	bh=Hr93u6NipALdguYsRVh3QelrGJBOGReO5Jet5dtvAek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eyq7v4YGG494yakGhDaiIt7MEGFXugCpZbYpz3X68Y2N4yAEOmf0X5mrpTOqcap7O
	 N6XyufdnsumNdp83U+BRm3IJz5FW+/wtyk+nnEPO+ybNi2zuUwytFrim71oMaLztRw
	 FzmjAIdaJiuAn2taELEHimH5uD9bQj6Lq8801+kF0FRkyZWSfloKxUEuk2LO4fdleo
	 0pMRkeRsoMoNPooldG13NrmtgTOJhnpf4rTBEYtPPPC0RTeM4ZyUS7htwi1jkWqc4z
	 CI+j3LA+JE1rPMZWf1owXDlNHAJsmGw3BupHp0PqmmM0k/gvVuCbo6q+ruvxLk9hr+
	 uC0Bw7HIEgLpQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH] clk: qcom: camcc-x1e80100: Set titan_top_gdsc as the parent GDSC of subordinate GDSCs
Date: Fri, 27 Dec 2024 21:39:54 -0600
Message-ID: <173535719176.1533665.10648474831196129784.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241227-b4-linux-next-24-12-16-titan-top-gdsc-v1-1-c96ef62fc307@linaro.org>
References: <20241227-b4-linux-next-24-12-16-titan-top-gdsc-v1-1-c96ef62fc307@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 27 Dec 2024 13:23:03 +0000, Bryan O'Donoghue wrote:
> The Titan TOP GDSC is the parent GDSC for all other GDSCs in the CAMCC
> block. None of the subordinate blocks will switch on without the parent
> GDSC switched on.
> 
> 

Applied, thanks!

[1/1] clk: qcom: camcc-x1e80100: Set titan_top_gdsc as the parent GDSC of subordinate GDSCs
      commit: d9377941f2732d2f6f53ec9520321a19c687717a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

