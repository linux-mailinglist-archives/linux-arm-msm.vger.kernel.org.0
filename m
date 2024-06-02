Return-Path: <linux-arm-msm+bounces-21397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A0B8D73CB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 06:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAEA1B20FD0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 04:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13330BE47;
	Sun,  2 Jun 2024 04:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLP2XK2z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B8CAD2D;
	Sun,  2 Jun 2024 04:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717302145; cv=none; b=A94gKkL+FEJ6qiSQx3H0Tq44Oafp6kWYiJm/fJntxyznOfORWhijxDSg9IDQOqAJIHTh6yvv4R7GvgHPsQAN1N3t89kh+iJA0gY3HM+05dPtW2m4SjSzcYgm7l7GgfJletYpsTTz+HV5xL0CArnU4kKNHJLkAzOr07+YuTKgJNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717302145; c=relaxed/simple;
	bh=VEzcGnfYuLgpyvwW9Sbdi6HU0+XOzlYljls9InAkb0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drS5jzwEgAbZp1Va84niOM0DJMiyJHFSMI/U8kMLXy2eDg2tLCf2VQH2VbHWLvRjX7E8yEsP3NjRwiDqNkVxkYLK0lFEAzMNjaz36mbtJo6q1iuGEm3zIaLD2aJ01m49cQnOGYtuX1AOvCnTkMG+w+oa4zpdL0FpM/mWrQnNzhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLP2XK2z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D7DC2BBFC;
	Sun,  2 Jun 2024 04:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717302143;
	bh=VEzcGnfYuLgpyvwW9Sbdi6HU0+XOzlYljls9InAkb0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cLP2XK2z6zP7apu84C5Y08umAPl/cH2cM1ohr9g/Duw1mlp1PJLFj71XGj0blcz8+
	 n/cyxrg2v9Xnu0tW+X/BddZxCJEGQ9Ivtj8F/PtJBzbUTCL9ucVwcVLs+LDc0mMyKj
	 Wv6sBJyqdjECtlj26NXOa7lrT7KkteP+2r9TkLdlN1Zq5Hm8hQvGnJjomXM/azBXty
	 ubEs1NUFVeOI5QqcIBdAGqJ8ntJIr8e2569s/w4RpyvIdoEwZSG+u/1/CpyHpP2GsN
	 TKbyLLQqaXjc1Ebgejs9xhhYJftzX/ibapjJOV23RWfJ6GB1YihofW17D8KqxDMuPB
	 zdKcxOpwqf2ww==
Date: Sat, 1 Jun 2024 23:22:18 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, quic_jkona@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 00/13] Add support for SA8775P Multimedia clock
 controllers
Message-ID: <ivssjgpuex3ckva55tndsqsioo7ysopjrhlvtbv2ot7stjkx2p@opluyh34wy5r>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531090249.10293-1-quic_tdas@quicinc.com>

On Fri, May 31, 2024 at 02:32:36PM GMT, Taniya Das wrote:
> Update GCC, GPUCC clock controllers and add support for multimedia
> clock controllers on Qualcomm SA8775P platform.
> 

Most of the patches in this series does not depend on each other and
some of them could have been merged already, if they weren't stacked in
the middle of the series.

Please lump patches together into series only when there is a dependency
between them.

The one exception here is the dts change at the end that has a
dependency on the multiple binding updates. You can choose to either
split this into multiple updates, or send it separately once the clock
changes has been accepted.

Thanks,
Bjorn

> Taniya Das (13):
>   clk: qcom: gcc-sa8775p: Remove support for UFS hw ctl clocks
>   clk: qcom: gcc-sa8775p: Update the GDSC wait_val fields and flags
>   clk: qcom: gcc-sa8775p: Set FORCE_MEM_CORE_ON for
>     gcc_ufs_phy_ice_core_clk
>   clk: qcom: gpucc-sa8775p: Remove the CLK_IS_CRITICAL and ALWAYS_ON
>     flags
>   clk: qcom: gpucc-sa8775p: Park RCG's clk source at XO during disable
>   clk: qcom: gpucc-sa8775p: Update wait_val fields for GPU GDSC's
>   dt-bindings: clock: qcom: Add SA8775P video clock controller
>   clk: qcom: Add support for Video clock controller on SA8775P
>   dt-bindings: clock: qcom: Add SA8775P camera controller
>   clk: qcom: Add support for Camera Clock Controller on SA8775P
>   dt-bindings: clock: qcom: Add SA8775P display controller
>   clk: qcom: Add support for Display Controllers on SA8775P
>   arm64: dts: qcom: Add support for multimedia clock controllers
> 
>  .../bindings/clock/qcom,sa8775p-camcc.yaml    |   76 +
>  .../bindings/clock/qcom,sa8775p-dispcc.yaml   |   88 +
>  .../bindings/clock/qcom,sa8775p-videocc.yaml  |   75 +
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts     |    2 +-
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   59 +
>  drivers/clk/qcom/Kconfig                      |   31 +
>  drivers/clk/qcom/Makefile                     |    3 +
>  drivers/clk/qcom/camcc-sa8775p.c              | 1849 +++++++++++++++++
>  drivers/clk/qcom/dispcc0-sa8775p.c            | 1481 +++++++++++++
>  drivers/clk/qcom/dispcc1-sa8775p.c            | 1481 +++++++++++++
>  drivers/clk/qcom/gcc-sa8775p.c                |  154 +-
>  drivers/clk/qcom/gpucc-sa8775p.c              |   41 +-
>  drivers/clk/qcom/videocc-sa8775p.c            |  576 +++++
>  .../dt-bindings/clock/qcom,sa8775p-camcc.h    |  107 +
>  .../dt-bindings/clock/qcom,sa8775p-dispcc.h   |   87 +
>  .../dt-bindings/clock/qcom,sa8775p-videocc.h  |   47 +
>  16 files changed, 6027 insertions(+), 130 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-dispcc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
>  create mode 100644 drivers/clk/qcom/camcc-sa8775p.c
>  create mode 100644 drivers/clk/qcom/dispcc0-sa8775p.c
>  create mode 100644 drivers/clk/qcom/dispcc1-sa8775p.c
>  create mode 100644 drivers/clk/qcom/videocc-sa8775p.c
>  create mode 100644 include/dt-bindings/clock/qcom,sa8775p-camcc.h
>  create mode 100644 include/dt-bindings/clock/qcom,sa8775p-dispcc.h
>  create mode 100644 include/dt-bindings/clock/qcom,sa8775p-videocc.h
> 
> --
> 2.17.1
> 

