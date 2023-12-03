Return-Path: <linux-arm-msm+bounces-3102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D858020EB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 05:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C52741F20FE9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 04:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B12663D5;
	Sun,  3 Dec 2023 04:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vn6SCojk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0831D29A1;
	Sun,  3 Dec 2023 04:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36CAC433CA;
	Sun,  3 Dec 2023 04:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701579123;
	bh=ZBfzcLulAOvvJhQEAYYfDB7Z+ayWI/kok1IjU4/gA0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vn6SCojkEybCRbKi4FmI/T1TXpNxRPhCWP2wj7pMH3R2WZUCVCLVZysPXBuHCL0od
	 ixonDRHAvOPLon2y+ZsBogn5n6AtmOIcpXGgLqVuuU0NRRXl96i9c9cU9/eehkySP+
	 ptSnrXogUOe2SUN17WreTbIdENSgHynb1Y8Kg4laq50mwjSvtr7bG24Y8fmDlc11nc
	 EzVqCnEEAH9FThnzg258TRAHLQfYVP6iSiIUM7Q3HAFNr+cEb2u3E5qFw6XyyyHv2/
	 qlEDKWUgx7ikvdj7AiI83/yTiZ/1AuKYjsZWe6ib11T8PXr6DC9yjNjBXEp5p0mrJ5
	 d6d8mcSQ3F4jQ==
From: Bjorn Andersson <andersson@kernel.org>
To: dmitry.baryshkov@linaro.org,
	agross@kernel.org,
	konrad.dybcio@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: quic_varada@quicinc.com,
	quic_srichara@quicinc.com
Subject: Re: (subset) [PATCH V3 0/3] Add APSS clock driver support for IPQ5018
Date: Sat,  2 Dec 2023 20:54:49 -0800
Message-ID: <170157925793.1717511.11308464222863488586.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925102826.405446-1-quic_gokulsri@quicinc.com>
References: <20230925102826.405446-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 25 Sep 2023 15:58:23 +0530, Gokul Sriram Palanisamy wrote:
> This series adds support for the APSS clock to bump the CPU frequency
> above 800MHz. APSS PLL found in the IPQ5018 is of type Stromer.
> 
> - The first patch in the series adds the required a53pll compatible.
> 
> - The second patch reuses Stormer Plus PLL offsets, adds configuration values
>   for Stromer.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: ipq5018: enable the CPUFreq support
      commit: 3e4b53e04281ed3d9c7a4329c027097265c04d54

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

