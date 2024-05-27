Return-Path: <linux-arm-msm+bounces-20494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D78EE8CF789
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 05:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66F93B20BD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 03:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4487A257B;
	Mon, 27 May 2024 03:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVck409L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D4F1FBA;
	Mon, 27 May 2024 03:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716778852; cv=none; b=nUgAoUXZMkpUr+74pbfDPK25EdqPDAJ0Ew/GxVzvNY2mGyf7i0zxuuNa2XorbF6d8hyNPU0VJ89vSwqa43kPP+N1tTKGF+z6eV7qe+IZz9BPUcAUadRSftnkt+ddSaX63PAwxY6iq7jTS+c1s6JMItqs/fajXjMmE8Is3S2Xj28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716778852; c=relaxed/simple;
	bh=0MxR4FKO17RV/iFzfF651pseOtecx8hrO2jqcHkHxEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hnsmCk4lgF7x+seI4/G8OuDz/k0RwiBO77fIFFx1ghVii/vcEMejIfrywqzajdqQ4/Yw3HpbBCgQMANKfBBUBqYf07Sz/Ryuk0yFqbycdSH1U/g175szCU4sJTlycP+U4++9owEAjxiypXQfX5zU8fsre5qExq9Z7Y/IN4iaMxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVck409L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C34C2BD10;
	Mon, 27 May 2024 03:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716778851;
	bh=0MxR4FKO17RV/iFzfF651pseOtecx8hrO2jqcHkHxEo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cVck409LCWB+3SaMOySbwz5qImSMDu/8dVU27cCLfxKgznYpI2NddECeD64UJ5NKq
	 aS7hPL+3l54Qg/5yOUlI3TqIv17VAsiVNXhvNqRSvh80kWikaGDhi77vbutXtc/2uR
	 aa+Yxs82CCETFLadAwLTOm9gUTsepRmpEE68U+MxCC4wUaAF1nGgflIcLLEKQ2dOh7
	 4I4/riZB60eTCd9llFTpgesUUgn+rSnOfJEXPkaxGJ2rcY+nzUyyZy0IcZVMRNDuAK
	 ++3Lr6rXXzWdbmqq9K41njrr8+tllQDm6xhXTqKYdckODmFz/nLta5V9MGyw6819xp
	 mCbFnHd58Q7TA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8180x: Correct PCIe slave ports
Date: Sun, 26 May 2024 22:00:20 -0500
Message-ID: <171677884192.490947.2059335663520500183.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240525-sc8180x-pcie-interconnect-port-fix-v1-1-f86affa02392@quicinc.com>
References: <20240525-sc8180x-pcie-interconnect-port-fix-v1-1-f86affa02392@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 25 May 2024 10:56:20 -0700, Bjorn Andersson wrote:
> The interconnects property was clearly copy-pasted between the 4 PCIe
> controllers, giving all four the cpu-pcie path destination of SLAVE_0.
> 
> The four ports are all associated with CN0, but update the property for
> correctness sake.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc8180x: Correct PCIe slave ports
      commit: dc402e084a9e0cc714ffd6008dce3c63281b8142

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

