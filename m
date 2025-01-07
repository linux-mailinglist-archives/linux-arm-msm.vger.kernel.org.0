Return-Path: <linux-arm-msm+bounces-44182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A212A046AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42769166437
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAED31F76CF;
	Tue,  7 Jan 2025 16:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZunkHfJz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B38C1F76CA;
	Tue,  7 Jan 2025 16:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267957; cv=none; b=qqqtYqOnRBHZfZvlTOSKw9d3D1nVPHQQEuGyGhxOpFUAO3Ro7ZBZ6K6c5O5mUsHUEx3Y5nWRFRbaUWY+AvUQpzZHwwKd18Lk79QImsV1wNtIbfBT0c12ShVmx3YIKtgBfxcodfSw61tJ4yBJAQSruIT5FgsI2VItWEGmvWbFuok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267957; c=relaxed/simple;
	bh=dGGq1GOMLGpltwL115aYMu82H56aoheRTxWP/kPyr/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PIYh3zisnOAyPY033e8JmuMRkhOWfExP17s7saXjR1keWzzfPc9/SHEUMut83IGznplehUTdE5btq8o+KoPCsJYpuYF/CGeMCnh9nSAQlkh9F0UXcJ5WkyPg1iJG9Bq0YkBhsMgNGmCzDk1a+0H0AdcPYUHZR/amu7fygg9fcto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZunkHfJz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4391EC4CEE1;
	Tue,  7 Jan 2025 16:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267957;
	bh=dGGq1GOMLGpltwL115aYMu82H56aoheRTxWP/kPyr/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZunkHfJzDOlkGbJq5kZU+VL5TeBxTaCTAWBc1G4iXHRlA0JaPtXsj/mxLDpCW0L3d
	 oxFaxsmRgifC5V0oQdSQRnnOABOoDScprP1YWVozmk2r3o828nb87T7zsYwJBYc74p
	 DmAcgNhlPdHtTXasL4+Npymbxp0V6j+mqqIGxhBQvxwV6qGAYJ5nLFUAF6Bi4svcwS
	 eluaIzzL85K2644+UsTYj1I5CNyZT/JF54dODLy1PTxiW7yDlSYl5r9kPB43P7NmbO
	 d5He9q/v+OV91bJxQdageOLoOGUyIHO/0Y0PxSS+wCGZ0ncSrJyZgXtTU+rCWAhGoh
	 kcyubVx75OEkw==
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
Date: Tue,  7 Jan 2025 10:38:46 -0600
Message-ID: <173626793388.69400.11516262692578602679.b4-ty@kernel.org>
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

[2/5] clk: qcom: Add CMN PLL clock controller driver for IPQ SoC
      commit: f81715a4c87c3b75ca2640bb61b6c66506061a64

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

