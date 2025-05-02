Return-Path: <linux-arm-msm+bounces-56575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46069AA7A3C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 21:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E94C51BC7CD4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CDD21DB125;
	Fri,  2 May 2025 19:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOkfOJei"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2837D2DC78C;
	Fri,  2 May 2025 19:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746214291; cv=none; b=cx+vKxJEqJI1EXonnrDbkXxjAlMQR7A1HNUozPt3rVaGQLVlfsWYgTMhNYOwGgMYLfUTklv3AhMnwGM77ZKLrIRMsWDJqs5Ol/MYiktZl8OkjbqZmwe+CZ/Ow58/Ds8qvwx/D7Q48+nElorY3ztVsb0sJr2+i+TjcxHqyfUlPB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746214291; c=relaxed/simple;
	bh=M5hI8igvUh0TJ227AgSlnOH2SgqlqQg9EBsxC0vnAG0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GJS6qg44zw9Fn7ltCiBSC9ZmBS96bZ6IsuKDfuJEPKTaqC1Z4oirkvcCFuowrTSO2nnBkdxPwal6u7Keb+zQlt258bLVvVGg4h0AqQ4aYbqEtcolZOAl65Rw95lNVVfZkYYCPAN0vCB766xsnrAqVpQ8r7av1btYJS/LqXMNscU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOkfOJei; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5853DC4CEE4;
	Fri,  2 May 2025 19:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746214290;
	bh=M5hI8igvUh0TJ227AgSlnOH2SgqlqQg9EBsxC0vnAG0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kOkfOJeiVHTOyVqOJ+strKRh1AI1dqd8XRTs68spQ6Z5fyslISqXUm6tB13300tJt
	 uNbqQwrKftoWK01j40VkWbcDo667egy2Qv8URS3YzanZKLV06UjvEjvBItt35w+rLD
	 pYQWr0nAgA4GLypZxtY6h0tGaD5an2ZqIE7JtBprxwmMsxjlIMp/VY0HIC1luyvsBj
	 8vLYKpxIX5BzBMlBQ6/e9It7LQ0BzH5PflQztEnTNX+ZxsqoI3d/FQHl4eY3wu4Szp
	 82nF3IaeGsUVFGPqv4PpLBUi1+JOlTCz0TpY1Z6rQNRo4DS0K5D7udAD921qp8a4vz
	 0MQ/ff9ranQ9Q==
Date: Fri, 02 May 2025 14:31:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 Luo Jie <quic_luoj@quicinc.com>
To: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
Message-Id: <174621422446.2300145.5789096612500039953.robh@kernel.org>
Subject: Re: [PATCH 0/6] Add CMN PLL clock controller support for IPQ5018


On Fri, 02 May 2025 14:15:42 +0400, George Moussalem wrote:
> The CMN PLL block of IPQ5018 supplies output clocks for XO at 24 MHZ,
> sleep at 32KHZ, and the ethernet block at 50MHZ.
> 
> This patch series extends the CMN PLL driver to support IPQ5018.
> It also adds the SoC specific header file to export the CMN PLL
> output clock specifiers for IPQ5018. The new table of output
> clocks is added for the CMN PLL of IPQ5018, which is acquired
> from the device according to the compatible.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
> George Moussalem (6):
>       dt-bindings: clock: qcom: Add CMN PLL support for IPQ5018 SoC
>       clk: qcom: ipq5018: mark XO clock as critical
>       clk: qcom: ipq-cmn-pll: Add IPQ5018 SoC support
>       dt-bindings: mfd: qcom,tcsr: Add compatible for IPQ5018
>       arm64: dts: ipq5018: Add CMN PLL node
>       arm64: dts: qcom: Update IPQ5018 xo_board_clk to use fixed factor clock
> 
>  .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       | 11 +++-
>  .../devicetree/bindings/mfd/qcom,tcsr.yaml         |  1 +
>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |  3 +-
>  .../dts/qcom/ipq5018-tplink-archer-ax55-v1.dts     |  3 +-
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi              | 40 +++++++++++-
>  drivers/clk/qcom/gcc-ipq5018.c                     |  2 +-
>  drivers/clk/qcom/ipq-cmn-pll.c                     | 72 ++++++++++++++++++----
>  include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h   | 16 +++++
>  8 files changed, 129 insertions(+), 19 deletions(-)
> ---
> base-commit: 8a2d53ce3c5f82683ad3df9a9a55822816fe64e7
> change-id: 20250501-ipq5018-cmn-pll-8e517de873f8
> prerequisite-change-id: 20250411-qcom_ipq5424_cmnpll-960a8f597033:v2
> prerequisite-patch-id: dc3949e10baf58f8c28d24bb3ffd347a78a1a2ee
> prerequisite-patch-id: da645619780de3186a3cccf25beedd4fefab36df
> prerequisite-patch-id: 4b5d81954f1f43d450a775bcabc1a18429933aaa
> prerequisite-patch-id: 541f835fb279f83e6eb2405c531bd7da9aacf4bd
> 
> Best regards,
> --
> George Moussalem <george.moussalem@outlook.com>
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
 Base: using specified base-commit 8a2d53ce3c5f82683ad3df9a9a55822816fe64e7
 Deps: looking for dependencies matching 4 patch-ids
 Deps: Applying prerequisite patch: [PATCH v2 1/4] dt-bindings: clock: qcom: Add CMN PLL support for IPQ5424 SoC
 Deps: Applying prerequisite patch: [PATCH v2 2/4] clk: qcom: cmnpll: Add IPQ5424 SoC support
 Deps: Applying prerequisite patch: [PATCH v2 3/4] arm64: dts: ipq5424: Add CMN PLL node
 Deps: Applying prerequisite patch: [PATCH v2 4/4] arm64: dts: qcom: Update IPQ5424 xo_board to use fixed factor clock

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com:

arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: clock-controller@9b000 (qcom,ipq9574-cmn-pll): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq9574-cmn-pll.yaml#
arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: clock-controller@9b000 (qcom,ipq5424-cmn-pll): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq9574-cmn-pll.yaml#
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: clock-controller@9b000 (qcom,ipq9574-cmn-pll): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq9574-cmn-pll.yaml#
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: clock-controller@9b000 (qcom,ipq9574-cmn-pll): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq9574-cmn-pll.yaml#
arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dtb: clock-controller@9b000 (qcom,ipq5018-cmn-pll): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq9574-cmn-pll.yaml#
arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dtb: clock-controller@9b000 (qcom,ipq5018-cmn-pll): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq9574-cmn-pll.yaml#
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: clock-controller@9b000 (qcom,ipq9574-cmn-pll): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq9574-cmn-pll.yaml#
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: clock-controller@9b000 (qcom,ipq9574-cmn-pll): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq9574-cmn-pll.yaml#






