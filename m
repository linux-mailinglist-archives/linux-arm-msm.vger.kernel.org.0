Return-Path: <linux-arm-msm+bounces-28717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 138AE953D70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 00:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF3981F237FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 22:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FF1156C5F;
	Thu, 15 Aug 2024 22:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmTzdKA9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2E7156972;
	Thu, 15 Aug 2024 22:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723761881; cv=none; b=edWPEHEzxogZzeHAbU2PgOXN82xPFA9Jzz+lZQnuxPVLknxD4scgdLoG/KZ+ThXhQQm3agltm0M4Ff11vpHxoUvScNvK7DYdt+a5+plybKSDuJNkKOhdfd9it/b6Ta1f8dTKUX7xaKp6fHAbUHbTvtjhqO/WOmyKZSZsb1xPOBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723761881; c=relaxed/simple;
	bh=6BX6LlM+/9YRhdRC9rGB0dA+8/tDU6laaRcniMah7T0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bx97Y1VyKMHsEGCcreFUZOySVdQMLVzSxqMUT+Yb2DGZ5DCq3OR1L1dffM6WGakg4vMgU1J+ghOq/r8gekKbABDOYfdZWrPWmpmWm6Mu30QdP/vrNHfaZVTXx+Y/uWvBPMJaTkOlg9JymSOmCQ1I8lV96qySOlArxG7F679+1NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmTzdKA9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C47F1C4AF14;
	Thu, 15 Aug 2024 22:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723761880;
	bh=6BX6LlM+/9YRhdRC9rGB0dA+8/tDU6laaRcniMah7T0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EmTzdKA9wfjdJyBQ4GigJAWQKBS4852jcrci7u6KvcNKwqckmRB8MoRjCdGCCgZeU
	 QmUbygWfiuLTjLn6vimjeHsStkdtVdyejHBDKt1elpfOpl0RSsjjNbk8+Qi/I/l9vx
	 KqiOl+dG4OR7rEGS1WgWJetBC/nNj+dF9glE8DtPWzMpcfpTQUR8/nwj92VezjQ4Sk
	 8NsdN6MKp+N5H1M4A7TTJaex4Bb3p8Q+mhgPiCBqZB4ddmW2EIkhxw35ZHia5ocEG0
	 cyPvU/orKzthnxmtrGq1lszkbEEtB4St0hJOg+Eet83qqbTE1t49lqop1X1MPWrEY/
	 uXGdoGmVEQGvQ==
From: Bjorn Andersson <andersson@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	amit.pundir@linaro.org,
	dmitry.baryshkov@linaro.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: move lpass codec macros to use clks directly
Date: Thu, 15 Aug 2024 17:44:34 -0500
Message-ID: <172376187134.1033860.18374130175521613821.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240815170542.20754-1-srinivas.kandagatla@linaro.org>
References: <20240815170542.20754-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 15 Aug 2024 18:05:42 +0100, srinivas.kandagatla@linaro.org wrote:
> Move lpass codecs va and wsa macros to use the clks directly from
> AFE clock controller instead of going via gfm mux like other codec macros
> and SoCs.
> 
> This makes it more align with the other SoCs and codec macros in this SoC
> which take AFE clocks directly. This will also avoid an extra clk mux layer,
> provides consistency and avoids the buggy mux driver which will be removed.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8250: move lpass codec macros to use clks directly
      commit: be7399872f79201c6ed7e97fb10e335b4cc87ea9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

