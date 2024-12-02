Return-Path: <linux-arm-msm+bounces-39773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1991A9DF9E0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 05:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6707BB21764
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 04:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A7F1E231E;
	Mon,  2 Dec 2024 04:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sMCcKlXg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EBB15B554;
	Mon,  2 Dec 2024 04:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733113509; cv=none; b=nxV6DG40Ds9Id3/yXkg3/4nmBjipyKavliQvvhaXgomjVm0QgegS7toeOWqF7qmVMnjRvzis97W3uNzeysj4ZDis3xhzEjAD+I63RhoVh2dEWsiMBxSGuWDSKyaWm1Sn7S97TjKiMBDlwt1YCKCRUV9iEpaZVNTw1aoxQJGllzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733113509; c=relaxed/simple;
	bh=gVP2RgkU37e0c+u2ZX03ORwYou3pnmMTnEi3FVfrRMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmdtwXR7K7+6g5H2o7AofX51yYLF6s9hbjqWz8tpLO7LTAHzDOLv3TQq3FUDhyPWsqDxe8zzeHDayB2C2gGsk4b89m3/EJ8aX1m01QLXLIYxA2U9Zq0pbJIIN5petjgFwpkoWVvTARV1113tt7hUvnLC1AkqIAcFXAw+K7/F17k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sMCcKlXg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09D7C4CED2;
	Mon,  2 Dec 2024 04:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733113509;
	bh=gVP2RgkU37e0c+u2ZX03ORwYou3pnmMTnEi3FVfrRMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sMCcKlXgUyjtqA2EguoYMnEtieCmHkXduMayY0vZohKm0hu5VGgBJ1uVFGmLZjMvg
	 Wfg1agFf0Z0lEGHWREmKRV2WumpXHfAJBkbYqMUqiWs1N8BzQIoJK1pY88HckXRwyo
	 zgUugNrp1ZlkVHulVQlvLj355KNY+CIqsGgAT75+p6ysDDZtEPWuzJNvt6xuPeikiC
	 qMJu3mUOJaWl/eFQRcW+F4kY4XmD1jPGDDt/Eiuw0xJ73g2oVmMneLd2v9Yj9yXuY5
	 RSQQ5AnUWELZVrNJflN3S4hXosh7Ln5wPVFinuKf4S/ocasCkgq9JPsYfs5sbc26q8
	 574XwHkNCJ9Rg==
Date: Sun, 1 Dec 2024 22:25:05 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Gabor Juhos <j4g8y7@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 00/11] Add support for videocc, camcc, dispcc and
 gpucc on Qualcomm QCS615 platform
Message-ID: <a4f6ojknv3hats4rwmdg5mw2rxhx7kq4u6axybdawak54crn5s@xnjbl7zno42s>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>

On Fri, Nov 08, 2024 at 09:39:17AM +0530, Taniya Das wrote:
> Add support for multimedia clock controllers on Qualcomm QCS615 platform.
> Update the defconfig to enable these clock controllers.
> 
> Global clock controller support
> https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>

Dropping this series from my queue, due to lack of response from author.

Taniya, please answer questions/feedback from Dmitry, Vladimir and
Bryan, and repose as necessary.

Thanks,
Bjorn

> ---
> Changes in v3:
> - update PLL configs to use BIT and GENMASK for vco_val and vco_mask for all CCs [Bryan O'Donoghue]
> - Link to v2: https://lore.kernel.org/r/20241101-qcs615-mm-clockcontroller-v2-0-d1a4870a4aed@quicinc.com
> 
> Changes in v2:
> - cleanups in clk_alpha_pll_slew_update and clk_alpha_pll_slew_enable functions [Christophe]
> - update PLL configs for "vco_val = 0x0" shift(20)  [Bryan O'Donoghue]
> - update PLL configs to use lower case for L value  [Dmitry]
> - Link parents for IFE/IPE/BPS GDSCs as Titan Top GDSC [Bryan O'Donoghue, Dmitry]
> - Remove DT_BI_TCXO_AO from camcc-qcs615           [Dmitry]
> - Remove HW_CTRL_TRIGGER from camcc-qcs615         [Bryan O'Donoghue]
> - Update platform name for default configuration   [Dmitry]
> - Link to v1: https://lore.kernel.org/r/20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com
> 
> ---
> Taniya Das (11):
>       clk: qcom: Update the support for alpha mode configuration
>       clk: qcom: clk-alpha-pll: Add support for dynamic update for slewing PLLs
>       dt-bindings: clock: Add Qualcomm QCS615 Camera clock controller
>       clk: qcom: camcc-qcs615: Add QCS615 camera clock controller driver
>       dt-bindings: clock: Add Qualcomm QCS615 Display clock controller
>       clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver
>       dt-bindings: clock: Add Qualcomm QCS615 Graphics clock controller
>       clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver
>       dt-bindings: clock: Add Qualcomm QCS615 Video clock controller
>       clk: qcom: videocc-qcs615: Add QCS615 video clock controller driver
>       arm64: defconfig: Enable QCS615 clock controllers
> 
>  .../bindings/clock/qcom,qcs615-camcc.yaml          |   60 +
>  .../bindings/clock/qcom,qcs615-dispcc.yaml         |   73 +
>  .../bindings/clock/qcom,qcs615-gpucc.yaml          |   66 +
>  .../bindings/clock/qcom,qcs615-videocc.yaml        |   64 +
>  arch/arm64/configs/defconfig                       |    4 +
>  drivers/clk/qcom/Kconfig                           |   35 +
>  drivers/clk/qcom/Makefile                          |    4 +
>  drivers/clk/qcom/camcc-qcs615.c                    | 1591 ++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.c                   |  172 +++
>  drivers/clk/qcom/clk-alpha-pll.h                   |    1 +
>  drivers/clk/qcom/dispcc-qcs615.c                   |  786 ++++++++++
>  drivers/clk/qcom/gpucc-qcs615.c                    |  525 +++++++
>  drivers/clk/qcom/videocc-qcs615.c                  |  332 ++++
>  include/dt-bindings/clock/qcom,qcs615-camcc.h      |  110 ++
>  include/dt-bindings/clock/qcom,qcs615-dispcc.h     |   52 +
>  include/dt-bindings/clock/qcom,qcs615-gpucc.h      |   39 +
>  include/dt-bindings/clock/qcom,qcs615-videocc.h    |   30 +
>  17 files changed, 3944 insertions(+)
> ---
> base-commit: 15e7d45e786a62a211dd0098fee7c57f84f8c681
> change-id: 20241016-qcs615-mm-clockcontroller-cff9aea7a006
> 
> Best regards,
> -- 
> Taniya Das <quic_tdas@quicinc.com>
> 

