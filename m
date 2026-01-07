Return-Path: <linux-arm-msm+bounces-87957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 267BFCFFA5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 20:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3F073023D2E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 19:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA5F35C197;
	Wed,  7 Jan 2026 18:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tQVaYSRr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D709F35BDD6;
	Wed,  7 Jan 2026 18:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767811117; cv=none; b=H/A6MRT1stpmklvb3Q4FMc4xdJpE39kqkf+eGK7U/EGOvI2DZvux7ynaC0UCfBuuSaFHlAFeXLZeU9DuSPToujTVtvGk3wyJZduVf5I+Wh/us12o5DheJluWkV9DW+NITyuJ0y1sNSCBCnl/Mf0DXCtT8TSFnvdnA4xg3KERy7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767811117; c=relaxed/simple;
	bh=4gA87dpy4WxHWsQQHfKYdtr3VgTSzDJcgdqZ1ZKqS5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZCUQBzWiOtMbd/s6xF/ojGifFFWn/8wh2xvRExIubRPUFfoiS/4c/PffZwVRttcIsTcnOnlv2mCbGzqfaNmki1lSSxUUwGnS4V9WH1j7vWa8rWitv6bNf2y6gGumbOMz0PHXUYCLHSHnKD7OntUmunmXwIa4TujGmmA6p7GsQjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tQVaYSRr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92277C4CEF7;
	Wed,  7 Jan 2026 18:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767811116;
	bh=4gA87dpy4WxHWsQQHfKYdtr3VgTSzDJcgdqZ1ZKqS5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tQVaYSRrv57g3xq+kAmlC19X9l1YrEqk2QaB2GpoZTPFVevg3P3KkXc25r2GpHX8l
	 ZObuwh7UZNmDoOnfmOlnyT/EFy9uhNPFrvrh3w0dG2Zjq+nLl2mYdAK5vL/CgFm2vs
	 ZfuS2TgIGTuZ3VzQC0CfesccxDi7Z9+o45yJzO+JnyUTsgIhEbZLNc58LNsVhYBpUN
	 bPH8qSM7xgULMJQ1KCY9XXYxm3g7Y7CumXp7WvPgip4nMI/pNVyKKTW/0zQUEkVfwb
	 0JWT/LBEYHwITDg2rfoa3IyUD51V6P+R+vMy+9XU5LBNIX5l+wzkZK2+T+v5RTjMcv
	 XuKDvuik7uCsA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH v3 00/11] Add support for Multimedia Clock controllers for Kaanapali
Date: Wed,  7 Jan 2026 12:38:22 -0600
Message-ID: <176781109972.3262943.12550481124214869830.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 07 Jan 2026 15:13:03 +0530, Taniya Das wrote:
> Add support for Display clock controller, Video, Camera and GPU
> clock controller for the Qualcomm Kaanapali SoC.
> 
> Changes in v3:
>  - Add RB tag for CAMCC dt-bindings [Krzysztof]
>  - Add more description, commit message for the newly added GX Clock controller
>    for GPUCC dt-bindings. Update the complete region for the controller. [Krzysztof]
>  - Add RB tag for display clock controller [Konrad]
>  - Fix the below for the Video clock controller
> 	- use lowercase for mem_enable/mem_ack reg.
> 	- use GENMASK for mem_enable_ack_mask.
> 	- fix the indentation issue.
> 	- update to use regmap_set_bits().
>  - Fix the below for gx clock controller
> 	- update offset for gdsc as per new mapping
> 	- update regmap_config as per new mapping
>  - Link to v2: https://lore.kernel.org/lkml/20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[01/11] clk: qcom: clk-alpha-pll: Update the PLL support for cal_l
        commit: 0f85ef379064b50ad573c6af4c0ffd39673f6968
[02/11] clk: qcom: clk-alpha-pll: Add support for controlling Pongo EKO_T PLL
        commit: 6d3e77facbce8e684321d9ba65137a76f2575372
[03/11] clk: qcom: clk-alpha-pll: Add support for controlling Rivian PLL
        commit: a419f7bfb714703b9c12fab387b60cb0e0f7ec47
[08/11] clk: qcom: dispcc: Add support for display clock controller Kaanapali
        commit: 6c6750b7061ca5b12deaeb246439b5b64a84f9c1
[09/11] clk: qcom: camcc: Add support for camera clock controller for Kaanapali
        commit: 92aae35f667cd62359f5938e3259dc72e080e28c
[10/11] clk: qcom: Add support for VideoCC driver for Kaanapali
        commit: a4ceaf4b18dd4310c17852efbf880e1c5cd5dc36
[11/11] clk: qcom: Add support for GPUCC and GXCLK for Kaanapali
        commit: 685ec348339b118bec728458d0bc3b3e7da1ef0d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

