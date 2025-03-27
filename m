Return-Path: <linux-arm-msm+bounces-52653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C5DA733D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 15:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E310163060
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 14:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72254217668;
	Thu, 27 Mar 2025 14:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kK/lkz4p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401F4217659;
	Thu, 27 Mar 2025 14:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084210; cv=none; b=TNnni1phE+kg87nitcXZy7oZJSKnz2tO0KGh9SWU/kyaj0vk5lcqT0PQasswCFE8A0VIjuqYRkfiUmXur5RjgfWhHykwca/9sflXbS2XFZve16hx/2KD3PsJTf719TqwgjYFKgfsLTLa7TWsSthHKWvzlJ1A8zui3I33Da0P1wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084210; c=relaxed/simple;
	bh=Ere6yDlFtdZnixF8IZZFLqwv2K57cQtSZE11Z5h+QeM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Az1ibwtvK/fAjB+De+n83EHJLkUVe4zkxO73v68UIbH+FlcwPMNUhEcfKoPdA6Gg0S+yT0Qibw7EJZrOrtoLFUpymfMa7pF6v92p82TojH/88/Lu+XlnvOSwzxhSl1bTgO/h0YiypMwDE/79oiGPYi6G1bDOwLytAy60DYdbPqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kK/lkz4p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A89C4CEE4;
	Thu, 27 Mar 2025 14:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743084209;
	bh=Ere6yDlFtdZnixF8IZZFLqwv2K57cQtSZE11Z5h+QeM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kK/lkz4p3MYCeiAGRl8mSJQEbbBGfUFtH+RoDkAR4LTvoCSP5vL791KrWD4XDex/j
	 rl0jaAQ6HfqoK4FOY+GnSRvcxLujNpwfNxpHRuj76MoIoZ3pQjsbopIhz2YvWDdK4x
	 TkiX6NQWUA4KBi59419Bw6tPSWfZoi7ZlV/5NxhqY3WO2f2uC6AccjOFIdsOJYjZBj
	 NNvAMYitf5kPTVXts0h8yu51NJpv0wmNpqhc3CPwg0NpYcWqsV1rVk6Rb3pIgwfWTd
	 d6daHZFTbROun7aqVljj4FRQRRLGAY13dAn+/eiaVGWlg7XYS7E+m4oMCHJjwjZ7Eu
	 XmzcpD8fG0VYA==
Date: Thu, 27 Mar 2025 09:03:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Ajit Pandey <quic_ajipan@quicinc.com>, Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Taniya Das <quic_tdas@quicinc.com>, linux-clk@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Imran Shaik <quic_imrashai@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
Message-Id: <174308402961.604953.9426624739758687535.robh@kernel.org>
Subject: Re: [PATCH v3 00/18] clk: qcom: Add support to attach multiple
 power domains in cc probe


On Thu, 27 Mar 2025 15:22:20 +0530, Jagadeesh Kona wrote:
> In recent QCOM chipsets, PLLs require more than one power domain to be
> kept ON to configure the PLL. But the current code doesn't enable all
> the required power domains while configuring the PLLs, this leads to
> functional issues due to suboptimal settings of PLLs.
> 
> To address this, add support for handling runtime power management,
> configuring plls and enabling critical clocks from qcom_cc_really_probe.
> The clock controller can specify PLLs, critical clocks, and runtime PM
> requirements in the descriptor data. The code in qcom_cc_really_probe()
> ensures all necessary power domains are enabled before configuring PLLs
> or critical clocks.
> 
> This series fixes the below warning reported in SM8550 venus testing due
> to video_cc_pll0 not properly getting configured during videocc probe
> 
> [   46.535132] Lucid PLL latch failed. Output may be unstable!
> 
> The patch adding support to configure the PLLs from common code is
> picked from below series and updated it.
> https://lore.kernel.org/all/20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com/
> 
> This series is dependent on bindings patch in below Vladimir's series, hence
> included the Vladimir's series patches also in this series and updated them.
> https://lore.kernel.org/all/20250303225521.1780611-1-vladimir.zapolskiy@linaro.org/
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
> Changes in v3:
>  - Updated the videocc bindings patch to add required-opps for MXC power domain [Dmitry]
>    and added Bryan & Rob R/A-By tags received for this patch on v1.
>  - Included the Vladimir's bindings patch for SM8450 camcc bindings to
>    add multiple PD support and updated them to fix the bot warnings.
>  - Moved SC8280XP camcc bindings to SA8775P camcc since SC8280XP only
>    require single MMCX power domain
>  - Split runtime PM and PLL configuration to separate patches [Dmitry]
>  - Removed direct regmap_update_bits to configure clock CBCR's and
>    using clock helpers to configure the CBCR registers [Dmitry, Bryan]
>  - Added new helpers to configure all PLLs & update misc clock
>    register settings from common code [Dmitry, Bryan]
>  - Updated the name of qcom_clk_cfg structure to qcom_clk_reg_setting [Konrad]
>  - Updated the fields in structure from unsigned int to u32 and added
>    val field to this structure [Konrad]
>  - Added a new u32 array for cbcr branch clocks & num_clk_cbcrs fields
>    to maintain the list of critical clock cbcrs in clock controller
>    descriptor [Konrad]
>  - Updated the plls field to alpha_plls in descriptor structure [Konrad]
>  - Added WARN() in PLL configure function if PLL type passed is not
>    supported. The suggestion is to use BUG(), but updated it to
>    WARN() to avoid checkpatch warning. [Bjorn]
>  - Moved the pll configure and helper macros to PLL code from common code [Bjorn]
>  - Updated camcc drivers for SM8450, SM8550, SM8650 and X1E80100 targets
>    with support to configure PLLs from common code and added MXC power
>    domain in corresponding camcc DT nodes. [Bryan]
>  - Added Dmitry and Bryan R-By tags received on videocc DT node changes in v1
>  - Link to v2: https://lore.kernel.org/r/20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com
> 
> Changes in v2:
>  - Added support to handle rpm, PLL configuration and enable critical
>    clocks from qcom_cc_really_probe() in common code as per v1 commments
>    from Bryan, Konrad and Dmitry
>  - Added patches to configure PLLs from common code
>  - Updated the SM8450, SM8550 videocc patches to use the newly
>    added support to handle rpm, configure PLLs from common code
>  - Split the DT change for each target separately as per
>    Dmitry comments
>  - Added R-By and A-By tags received on v1
> - Link to v1: https://lore.kernel.org/r/20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com
> 
> ---
> Jagadeesh Kona (15):
>       dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
>       dt-bindings: clock: qcom: Update sc8280xp camcc bindings
>       clk: qcom: common: Handle runtime power management in qcom_cc_really_probe
>       clk: qcom: common: Add support to configure clk regs in qcom_cc_really_probe
>       clk: qcom: videocc-sm8450: Move PLL & clk configuration to really probe
>       clk: qcom: videocc-sm8550: Move PLL & clk configuration to really probe
>       clk: qcom: camcc-sm8450: Move PLL & clk configuration to really probe
>       clk: qcom: camcc-sm8550: Move PLL & clk configuration to really probe
>       clk: qcom: camcc-sm8650: Move PLL & clk configuration to really probe
>       clk: qcom: camcc-x1e80100: Move PLL & clk configuration to really probe
>       arm64: dts: qcom: Add MXC power domain to videocc node on SM8450
>       arm64: dts: qcom: Add MXC power domain to videocc node on SM8550
>       arm64: dts: qcom: Add MXC power domain to videocc node on SM8650
>       arm64: dts: qcom: Add MXC power domain to camcc node on SM8450
>       arm64: dts: qcom: Add MXC power domain to camcc node on SM8650
> 
> Taniya Das (1):
>       clk: qcom: clk-alpha-pll: Add support for common PLL configuration function
> 
> Vladimir Zapolskiy (2):
>       dt-bindings: clock: qcom: sm8450-camcc: Allow to specify two power domains
>       arm64: dts: qcom: sm8550: Additionally manage MXC power domain in camcc
> 
>  .../bindings/clock/qcom,sa8775p-camcc.yaml         |  2 +
>  .../bindings/clock/qcom,sm8450-camcc.yaml          | 20 +++--
>  .../bindings/clock/qcom,sm8450-videocc.yaml        | 18 +++--
>  arch/arm64/boot/dts/qcom/sm8450.dtsi               | 12 ++-
>  arch/arm64/boot/dts/qcom/sm8550.dtsi               | 12 ++-
>  arch/arm64/boot/dts/qcom/sm8650.dtsi               |  6 +-
>  drivers/clk/qcom/camcc-sm8450.c                    | 85 ++++++++++------------
>  drivers/clk/qcom/camcc-sm8550.c                    | 81 ++++++++++-----------
>  drivers/clk/qcom/camcc-sm8650.c                    | 79 ++++++++++----------
>  drivers/clk/qcom/camcc-x1e80100.c                  | 63 +++++++---------
>  drivers/clk/qcom/clk-alpha-pll.c                   | 63 ++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h                   |  3 +
>  drivers/clk/qcom/common.c                          | 65 ++++++++++++++---
>  drivers/clk/qcom/common.h                          | 20 +++++
>  drivers/clk/qcom/videocc-sm8450.c                  | 54 ++++++--------
>  drivers/clk/qcom/videocc-sm8550.c                  | 55 ++++++--------
>  16 files changed, 377 insertions(+), 261 deletions(-)
> ---
> base-commit: 138cfc44b3c4a5fb800388c6e27be169970fb9f7
> change-id: 20250218-videocc-pll-multi-pd-voting-d614dce910e7
> 
> Best regards,
> --
> Jagadeesh Kona <quic_jkona@quicinc.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: base-commit 138cfc44b3c4a5fb800388c6e27be169970fb9f7 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/next-20250327 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com:

arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('required-opps' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sa8775p-camcc.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('required-opps' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sa8775p-camcc.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('required-opps' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sa8775p-camcc.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('required-opps' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sa8775p-camcc.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('required-opps' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sa8775p-camcc.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('required-opps' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sa8775p-camcc.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('required-opps' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sa8775p-camcc.yaml#






