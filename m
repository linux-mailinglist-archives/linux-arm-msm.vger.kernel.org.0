Return-Path: <linux-arm-msm+bounces-44027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D90CDA02F16
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 18:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6241E1884DED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 17:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C3A1DF73B;
	Mon,  6 Jan 2025 17:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUBcxNbC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF2A1DF72D;
	Mon,  6 Jan 2025 17:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736184876; cv=none; b=ITru4sy4HgCp3ZhlPmk54AmBhBHwzcut9UruLegt3VSJMYpSxHlWb/7ThHexvu4pX0MK4Wi0ju0yB1YUvw5BaEzHrZbWTTBkUowwUFEjdOBZTKDOduNfOYEcPgef9xZMREdkzUdDMqBATUhgR5F01rZ+gvqQeIglHCEWEi/pHr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736184876; c=relaxed/simple;
	bh=NXXw7LdqhHN1ui0cPUYeRBsBiyI9MlhDZU/1lW1eXNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aXV2w7fAoXfOlNWYUeSPPrGInWmm1v+sS47Rzdf/JISAHqXIQpI1DXNZpfVDEKl+zQoH5G7v1GAoTIf3Dmlko1XAB2e9eWMsUKIVJg2BM8m6gCjt/mlePYOCl1f8rorfB3ZG+2rCM+ycgVBpvZZKb8XDXXcR0WWdtTAvGSky9d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUBcxNbC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E01C4CED2;
	Mon,  6 Jan 2025 17:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736184876;
	bh=NXXw7LdqhHN1ui0cPUYeRBsBiyI9MlhDZU/1lW1eXNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hUBcxNbCEm4doAfYu9iA8nNiBSwb6syomAgpQzw6KEoZ9flFyzYwiNvW7k1y5YYTV
	 SgNAESXZfSIdt+3KssXqxDR0qrRAg1o5WCnK+OQ0PfEJzAxvCP4i4W3gKo8UJI7H0w
	 J/xoTcs8G/dFwaW9VJk3FmAEHyjBcYRKN+/3BQp7j1ONyck47h6R9dVhQGg/IeV9Nv
	 GrMjhDjRtVC75LOGCvDOWUp5D1swAM9QkFeWbu3npsy/svF/0omZYdBDgHvOGwgR2j
	 7Ki5QxCXNDRtbFa8rhXXXWwTK0m/2wUEgr6STGjM3nvUQsahvVWWO3QIIpsa2uUNqP
	 8GnfvIpQhd37w==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v3 0/8] clks: qcom: Introduce clks for SM8750
Date: Mon,  6 Jan 2025 11:34:30 -0600
Message-ID: <173618486751.8645.16180550664443756781.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com>
References: <20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 04 Dec 2024 11:37:12 -0800, Melody Olvera wrote:
> Add GCC, RPMH, and TCSR clocks for the SM8750 SoC.
> 
> The Qualcomm Technologies, Inc. SM8750 SoC is the latest in the line of
> consumer mobile device SoCs. See more at:
> https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/images/company/news-media/media-center/press-kits/snapdragon-summit-2024/day-1/documents/Snapdragon8EliteProductBrief.pdf
> 
> Changes in V3:
> - removed unused rfclka4 and rfclka5 from clk-rpmh [Dmitry]
> - split the SC7280 match table to a new commit [Dmitry]
> - There are bindings difference between SM8650 and SM8750, so bring back
>   the v1 binding https://patchwork.kernel.org/project/linux-clk/patch/20241021230359.2632414-5-quic_molvera@quicinc.com/
>   and fix the unused bindings.
> - Update the DT indexes as per the GCC bindings
> - Use the qcom_cc_probe() instead of qcom_cc_really_probe() for TCSRCC [Dmitry]
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for SM8750
      commit: 6badb455ae983f4b2b7e91e3083db64765662a6c
[2/8] clk: qcom: rpmh: Sort the match table alphabetically
      commit: d7df7a718fd661960f268ef353fdca66fc693f3d
[3/8] clk: qcom: rpmh: Add support for SM8750 rpmh clocks
      commit: c035a9e265dd80a018cfde0fd07ceca9e1d07c98
[4/8] clk: qcom: clk-alpha-pll: Add support for controlling Taycan PLLs
      commit: 745d755b8551319a100adafc6e776a2766102ea9
[6/8] clk: qcom: Add support for GCC on SM8750
      commit: 3267c774f3ff61fc945a7531b2ae6784c37cd14f
[8/8] clk: qcom: Add TCSR clock driver for SM8750
      commit: 806761852608ebc4d924c2e1c031fb72dcb33ed0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

