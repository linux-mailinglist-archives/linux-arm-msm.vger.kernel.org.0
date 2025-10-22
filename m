Return-Path: <linux-arm-msm+bounces-78414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EC2BFE58B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 23:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A9AB19C1298
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 21:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F356B2F6183;
	Wed, 22 Oct 2025 21:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdgMSo42"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C189527B4F5;
	Wed, 22 Oct 2025 21:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761169848; cv=none; b=szHduX+1ASrAWzwmxpk7x+jVlk+Co1XzNfccozjhOQBE2gKrPrtmhD8nCYT3fDBLldbK8K/Q5BHFglaS9JiasqPr6RajU/wC3zkwSBMEDp/yZfrxbMK6/yJ7xNYuFGRgJbZGPTE/Y6wpmOCgcqk9rvGu6tPi0a7dPCQTwAVdNOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761169848; c=relaxed/simple;
	bh=J2pWP0kH9u0ZD31QCkfWGKeL5JYKoFXVmf8L2sa+A8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlJfGD9zwU9NKrMRE1D6dQc8CsdEK/7ZZkcx3sAC80GuDacT1BEwHgf6LN6amY+xFw6d+r1GQdFYADNU3R3LCDKe1DY98BLobRPP47o/EokMGgIwi+VHd74GCjhAEtkLNBOKIFuXFXNyNiE4nZXbsJK8Zmcd9FVz1hsp5HzH6Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdgMSo42; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5EEC4CEE7;
	Wed, 22 Oct 2025 21:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761169848;
	bh=J2pWP0kH9u0ZD31QCkfWGKeL5JYKoFXVmf8L2sa+A8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KdgMSo42clhmZfBQ83+dahHoMnKfJyimp16wWTydCrtjjv9D9/0tfs44O8U704jaZ
	 la4+kb9ur+fQ1PyvFSDTlezWAn+VLIJvuKmrOtKscQgrOFI/NMDsX/eci1YuEa35jN
	 hEBUUiqlK7WYobaDVj+UHJTooRc5Kkw5VrdyVzUjO41kCnYPTvoeCjrVskw3CStl9f
	 pYZHfb+6HOTlTOz2S+P6DG7tn8TVVl3EzikCN6nvblhoYLJ0SSCaUlN8q1dE23f8js
	 bEbx/1Ccm6OQv/au2/PgnphvswvX09enVf/cT7JNveSF4gRJAFNOpXCLC42XXCOKtw
	 nd0p/AbxQhEdg==
Date: Wed, 22 Oct 2025 16:53:10 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 0/9] Add support for Clock controllers for Kaanapali
Message-ID: <hy3dcra2izm3elcrmvmsyfeht6e4bhzqzy35ooqywve2c2htfg@24hpt2nn6um5>
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>

On Wed, Sep 24, 2025 at 03:58:52PM -0700, Jingyi Wang wrote:
> Add support for Global clock controller(GCC), TCSR and the RPMH clock
> controller for the Qualcomm Kaanapali SoC. And update the PLL support.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
> Taniya Das (9):
>       dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Kaanapali
>       dt-bindings: clock: qcom: Document the Kaanapali TCSR Clock Controller
>       dt-bindings: clock: qcom: Add Kaanapali Global clock controller
>       clk: qcom: rpmh: Add support for Kaanapali rpmh clocks
>       clk: qcom: Update TCSR clock driver for Kaanapali
>       clk: qcom: Add support for Global clock controller on Kaanapali
>       clk: qcom: clk-alpha-pll: Update the PLL support for cal_l
>       clk: qcom: clk-alpha-pll: Add support for controlling Pongo EKO_T PLL
>       clk: qcom: clk-alpha-pll: Add support for controlling Rivian PLL

The series adds rpmh, tcsr and global clock controllers, and then it
adds support for cal_l and two new PLL types.

I assumed that meant that the order of the patches was wrong, but I
can't find anything in this series that depend on these 3 last patches.

They seems to just add dead code?

Regards,
Bjorn

> 
>  .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
>  .../bindings/clock/qcom,sm8550-tcsr.yaml           |    1 +
>  .../devicetree/bindings/clock/qcom,sm8750-gcc.yaml |    8 +-
>  drivers/clk/qcom/Kconfig                           |    9 +
>  drivers/clk/qcom/Makefile                          |    1 +
>  drivers/clk/qcom/clk-alpha-pll.c                   |   20 +-
>  drivers/clk/qcom/clk-alpha-pll.h                   |    7 +
>  drivers/clk/qcom/clk-rpmh.c                        |   39 +
>  drivers/clk/qcom/gcc-kaanapali.c                   | 3541 ++++++++++++++++++++
>  drivers/clk/qcom/tcsrcc-sm8750.c                   |   34 +-
>  include/dt-bindings/clock/qcom,kaanapali-gcc.h     |  241 ++
>  11 files changed, 3897 insertions(+), 5 deletions(-)
> ---
> base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
> change-id: 20250917-knp-clk-c60d94492863
> 
> Best regards,
> -- 
> Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 

