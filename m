Return-Path: <linux-arm-msm+bounces-78929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35574C0E3CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FFA6188E1C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EDF2BD5AF;
	Mon, 27 Oct 2025 14:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXOG54m2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275711F4161;
	Mon, 27 Oct 2025 14:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761573989; cv=none; b=WqJRkRZ1dfH1xGJZ1dEC//j8Vc7RNz17k/klUm33/6qGeVf0OjfHsetkz2YVj6KcmbflybWjlBaagaXa+WNej/sG53WUrazLetkuDYq+0YNI5qaM9KP9pR/Tn1nYCAHeHqcdiV8ASRbtvG9iTSYtFfBLdcPsorc932AOzmg758I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761573989; c=relaxed/simple;
	bh=WfPSZu7LSHG4fLrBFHtsbqrLYPx6fVlrmAr8kHkI/Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dXKaFecJMJUkk7EiPoicGewCZQ+/qNzwxdqEfWVD44GPP4EjWe7+6lL13WOJlqrDZmTbSkPGlcMMFmpsGwTAC92QERu34LdRw/nJvO9oOmnACpQAGsOUcwos255CfMeg32A+9xLB43NADTZ4wcyo7LvVNt0lDhPDz6AdUr9qKOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NXOG54m2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F54EC113D0;
	Mon, 27 Oct 2025 14:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761573988;
	bh=WfPSZu7LSHG4fLrBFHtsbqrLYPx6fVlrmAr8kHkI/Oo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NXOG54m2L61PkB2ZoNhNafdgbTAV4c+1x2i8FnfOHtAaPErMALEYp+Wnv3lSJjwWS
	 77DVS+pIc0WNv1jL8aiMZbtAKoj5qP/MFPqwstn/wFVW7aV+2OsMeVFItIBdaFpnnn
	 4IRD1Y0bjQzkRwusdZdvCv2WUQwhuyaHaoaAiPIm38mTgQnNr/6k4acll0/9rBOlmK
	 Yuap6URJimT737azuhwc7AIbJoAD+tK+o9Xc9Q+EQq2tmPLQ9QP6d5Sp2vjDmgFUMC
	 T6dRtGAxieAHxXmXr01gHtEcmQVLcWbYktZw0dlWqy2QaKaVEG3x+IQJqV3UCo/YWU
	 rQchvoaUIPC/g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	David Wronek <david@mainlining.org>,
	Jens Reidel <adrian@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH 0/3] Fixes for SM7150 dispcc driver
Date: Mon, 27 Oct 2025 09:09:02 -0500
Message-ID: <176157405447.8818.12328266826871564632.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919-sm7150-dispcc-fixes-v1-0-308ad47c5fce@mainlining.org>
References: <20250919-sm7150-dispcc-fixes-v1-0-308ad47c5fce@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 19 Sep 2025 14:34:29 +0200, Jens Reidel wrote:
> The MDSS needs a reference to the MDSS_CORE reset since 6.17-rc,
> otherwise video mode panel initialization appears to be broken.
> 
> Also ensure that the parent of dispcc_mdss_pclk0_clk_src gets prepared
> and enabled to fix an "rcg didn't update its configuration" warning that
> started occurring recently.
> 
> [...]

Applied, thanks!

[2/3] clk: qcom: dispcc-sm7150: Add MDSS_CORE reset
      commit: 176465fd8c4e2cbb4410b5a66f6ba74ed491d2a5
[3/3] clk: qcom: dispcc-sm7150: Fix dispcc_mdss_pclk0_clk_src
      commit: e3c13e0caa8ceb7dec1a7c4fcfd9dbef56a69fbe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

