Return-Path: <linux-arm-msm+bounces-44302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2DDA05246
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 05:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D20A3A6EBE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 04:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863241AA786;
	Wed,  8 Jan 2025 04:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4NG0S0g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5778C1AA1EE;
	Wed,  8 Jan 2025 04:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736311439; cv=none; b=rMXBNAmPlMKJq9n5N8EiKRYMm9kSymeQC5DP9mwC7hjn4X/2toibs+9Xz7iJGXTsv1IM8A3ljGYUhlgo4icKEF0zT95BkVsZviIUpXVMsBw1qPIPw3389o7Co9LQ/D2f0niu12Wlm6Ed5KYywTDhUimX3aj8Sp6rUX6d/1+bE7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736311439; c=relaxed/simple;
	bh=36ms4CYMKb/pnrih3Z2etPkGz7WnBHowpU5ewuBqfYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P2SjkITr/TKdLrsGSiJ8xRQyMkriInhIQnzYKwuqBBUkBGPMrTd/G7CvLjE9Q34wvNcV9It2kQz/HSpf1pYAqkBnnS2CHZEcgJEVUSdbDy8vm1pdaP6E4CvwbUti4/S9/BagMMX3ysAzpOuaa7szQbeRzh1v03u6GKh063fh2/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4NG0S0g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88207C4CEE0;
	Wed,  8 Jan 2025 04:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736311439;
	bh=36ms4CYMKb/pnrih3Z2etPkGz7WnBHowpU5ewuBqfYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I4NG0S0gX0VQVyZahsaoKb1VplzrZ2UelxGPw/VIgWu/VDdgFwcDMbPpxIvqkujT9
	 l6QRlthj7vxiKx5FuzDX8w3IbaihM6ICxVpui0+LYhU1rqvd5bLrDj/adFlcMdvXgT
	 66ASxLeAlLP+AywURD7sY4WtxuVBAykMTYMI1TZG8BAU5D4mPIA8lRnWCRmK4YlZiV
	 7GMbbMoRWH3egw7YVlCJ0FvtcndRkP+ObQ3RU6U3NAPzQVAVE5Hds6iRAdwb049mue
	 OYjxBBO6wuQMu9isSvlG9B2AUFJP52hv1ixoOGEbKaJtHnd45ZTQEVrt9MexHSC83S
	 px+nO3eFMspeQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luo Jie <quic_luoj@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	quic_kkumarcs@quicinc.com,
	quic_suruchia@quicinc.com,
	quic_pavir@quicinc.com,
	quic_linchen@quicinc.com,
	quic_leiwei@quicinc.com,
	bartosz.golaszewski@linaro.org,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v8 0/5] Add CMN PLL clock controller driver for IPQ9574
Date: Tue,  7 Jan 2025 22:43:46 -0600
Message-ID: <173631142079.110881.10241987285937979220.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250103-qcom_ipq_cmnpll-v8-0-c89fb4d4849d@quicinc.com>
References: <20250103-qcom_ipq_cmnpll-v8-0-c89fb4d4849d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 03 Jan 2025 15:31:33 +0800, Luo Jie wrote:
> The CMN PLL clock controller in Qualcomm IPQ chipsets provides
> the clocks to the networking hardware blocks that are internal
> or external to the SoC, and to the GCC. This driver configures
> the CMN PLL clock controller to enable the output clocks. The
> networking blocks include the internal blocks such as PPE
> (Packet Process Engine) and PCS blocks, and external hardware
> such as Ethernet PHY or switch. The CMN PLL block also outputs
> fixed rate clocks to GCC, such as 24 MHZ as XO clock and 32 KHZ
> as sleep clock supplied to GCC.
> 
> [...]

Applied, thanks!

[3/5] arm64: defconfig: Enable Qualcomm IPQ CMN PLL clock controller
      commit: 1fe6c70fec8fd8c823afee66467f85f028b0d22c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

