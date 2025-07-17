Return-Path: <linux-arm-msm+bounces-65364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D552B08413
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DED07A3DE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1822C224891;
	Thu, 17 Jul 2025 04:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dvlkx32r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A56223DF5;
	Thu, 17 Jul 2025 04:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726698; cv=none; b=Wsvx9HKZRxdhGsQhjC2470hbtuIYUkVp0l8IRe14l5ZZhwGyvmPuenRfZn98sjzzBxb7TkLUli7OoMOI3XRLxaQ3VIo6/QOM5TRjjskvrlYvrYeJpQHjHY0AFmUhWrlFwmLoXRb1ektS5iNCndmpxkgnvae3X0Y6omP18VKVXeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726698; c=relaxed/simple;
	bh=ScESvwrDPB4QE4Ks7/zQBRjrq8rnfHpoothkInVWLes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=THOAHgrjmDZTCmNX/BQ7T+J88dM0CEyDqECpSdtb+HsM90zHcjau+qTpfaNQmnMkmKICJGD2XdchjKMrPD8GsLyJbymFjMOWvtJsRGJjy4lCSrQPBdl/uJG4z93nZawgL+DMb8q17/KlkDpGtoVlDeZ7NoQs3HGBfsDeSrpLung=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dvlkx32r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E92C4CEE3;
	Thu, 17 Jul 2025 04:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726698;
	bh=ScESvwrDPB4QE4Ks7/zQBRjrq8rnfHpoothkInVWLes=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dvlkx32rncSoYi/PjzS2cFYfoaiJLT6ej4p86IucRvNFuDypIUZDRKmASUMTYzMDy
	 QOOjCp6aCMjjLVknkaywWfQO/l983u/UV11AfdCxOsJ5cy1yiVU9iQoiOezpOgCaVV
	 UjqFpthtJtrz2Rb5ORo1GT8xZy1Eu5JqSszGeBvxwy7ufej4FiwwYcbJca/kaZWPW5
	 a+sYrKYy16nkw0fvsFv2Blx0B4s5Fg4P3reuxBaBRpeYGkoXcPR/Spt3nLQsAl9Tmr
	 1G/4pfpnAu5CieDqbif79mgTaIOTzH0nCsYrAbf3DgGqFoz3kpZAuyEzPtHIR5j7P3
	 P/kPnPh1V9M7Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luo Jie <quic_luoj@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_kkumarcs@quicinc.com,
	quic_suruchia@quicinc.com,
	quic_pavir@quicinc.com,
	quic_linchen@quicinc.com,
	quic_leiwei@quicinc.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/4] Add CMN PLL clock controller support for IPQ5424
Date: Wed, 16 Jul 2025 23:31:10 -0500
Message-ID: <175272667144.130869.2385318144957432159.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610-qcom_ipq5424_cmnpll-v3-0-ceada8165645@quicinc.com>
References: <20250610-qcom_ipq5424_cmnpll-v3-0-ceada8165645@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 10 Jun 2025 18:35:17 +0800, Luo Jie wrote:
> The CMN PLL block of IPQ5424 is almost same as that of IPQ9574
> which is currently supported by the driver. The only difference
> is that the fixed output clocks to NSS and PPE from CMN PLL have
> a different clock rate. In IPQ5424, the output clocks are supplied
> to NSS at 300 MHZ and to PPE at 375 MHZ.
> 
> This patch series extends the CMN PLL driver to support IPQ5424.
> It also adds the SoC specific header file to export the CMN PLL
> output clock specifiers for IPQ5424. The new table of output
> clocks is added for the CMN PLL of IPQ5424, which is acquired
> from the device according to the compatible.
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: ipq5424: Add CMN PLL node
      commit: 0c8ad32ea8acbcd5959ec21f15c6ea794b957b1a
[4/4] arm64: dts: qcom: Update IPQ5424 xo_board to use fixed factor clock
      commit: 671606d2807550f34e6064f12b227eb489e9cc77

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

