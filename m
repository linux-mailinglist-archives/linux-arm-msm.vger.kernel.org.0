Return-Path: <linux-arm-msm+bounces-30749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A6396C17E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 16:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E07E11F2972E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 14:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364AA1DC183;
	Wed,  4 Sep 2024 14:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCd1uN4G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085081DC04A;
	Wed,  4 Sep 2024 14:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725461885; cv=none; b=BfljD7tt/YbY/DLyAvZA4Hi62JusfIsGrW87e1smNwnbW79bYpvRzAArB3ugE67eOneM2gLGeyhbivD5YvvBTS61NXURtsfnaonCYxJjsaBAIonWWqww86M6YC8qm8Mc/lVOOeN/CiaZtVx4bfU10Wc45ic03vvkJr4Y14iHX6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725461885; c=relaxed/simple;
	bh=oGZHZwM6HjGaDxnYT+XVCkxdCNgyq0qFSfTnY4Dp+kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDfq4qjfro8zxrtom5LxX9KJD7Yx7VaMwfTJLu+TTKoWJ7AhXgm32+n1e6tU2ueAs7t+nkfS0e1VBBlph4VEk4+MESQTfbfJ6SdNA/0dHbQp7YpzhD5lY7KpF+7NK8HevRp/p6O/MhG+wFxYYtxv5lnqgbWacRNRHD/Sye96Sm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCd1uN4G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6760CC4CEC2;
	Wed,  4 Sep 2024 14:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725461884;
	bh=oGZHZwM6HjGaDxnYT+XVCkxdCNgyq0qFSfTnY4Dp+kk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SCd1uN4GDdY9vbNIDR+7eKQmL6a1gLuRFCfEJ97YTLF+RuEVhVUi3Y9UWaZ/wSZZr
	 gQTfBqVSuLNlgge847wbYelcVggWYxx6/XUca1o1LIki1jp1knTuaEx7XnbR6Kcnw0
	 bX5M0aaNTRS5M5FK2WgpGhw3FaE89tWVPA5ohBOkrFiT2Pw9Q3Og7Ga6jas8GLvhFa
	 mUx/hKd76CziOQvZDtHASQ5UzximKG8CTelpcfX3PDdSmEJ8nr3PeuBz+iUAQJUycF
	 W9zL3+7HrBFnXn0VVXKUa28CRt9V7M8Zldy7iI4A6qqBmAloqahzS1Q04Zgg0+DBIY
	 P5kcX/8H6YZIw==
Date: Wed, 4 Sep 2024 09:58:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: sboyd@kernel.org, linux-arm-msm@vger.kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mturquette@baylibre.com, andersson@kernel.org, krzk+dt@kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: drop sm8250 lpass gfm driver
Message-ID: <172546188216.2558140.18362854925367403125.robh@kernel.org>
References: <20240902145203.72628-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902145203.72628-1-srinivas.kandagatla@linaro.org>


On Mon, 02 Sep 2024 15:52:03 +0100, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> There is no real use for this driver on this platform for below reasons.
> 
> - codec drivers can directly use dsp clocks using the static mux setting.
> - none of the consumers really switch parents and do not handle low power usecases.
> - all users of this drivers are now removed in next
> 
> Remove this driver and associated device tree bindings to aviod any
> confusion.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/clock/qcom,aoncc-sm8250.yaml     |  61 ----
>  .../bindings/clock/qcom,audiocc-sm8250.yaml   |  61 ----
>  drivers/clk/qcom/Kconfig                      |   7 -
>  drivers/clk/qcom/Makefile                     |   1 -
>  drivers/clk/qcom/lpass-gfm-sm8250.c           | 318 ------------------
>  .../clock/qcom,sm8250-lpass-aoncc.h           |  11 -
>  .../clock/qcom,sm8250-lpass-audiocc.h         |  13 -
>  7 files changed, 472 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
>  delete mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c
>  delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
>  delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


