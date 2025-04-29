Return-Path: <linux-arm-msm+bounces-56130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B703EAA0CA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 15:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B79BD1A83768
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 13:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E0E130A54;
	Tue, 29 Apr 2025 13:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYK9VV3g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7502AE99;
	Tue, 29 Apr 2025 13:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745931756; cv=none; b=PQO50Ou2tRFHb8xlgyBMWjmyb5ivel96mTgvUDkfxlnYTGBH1d/jWKLgi8nIcv/r6N8l8V7VEaxKyvHGIzUBXWgWG59GeLZROUcGOaQZmTxXYH7pmd2mJ64BtrT7PtIk3ECLuJETt7t4kBZ1dueI8vDNhI7GSURhR5IcwAuHGNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745931756; c=relaxed/simple;
	bh=cVz4BLzmyccotxv38TkDl5vqVFZjC2oj8EFmw1P14eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaSwp6EQ5uhsphXHwnBRVEhZD2NyAGCzEb1t9XAYzpnmpfozoD+dl24hdJtpEVwQIYA1+ICxk/w+E3tZSt/hTn+4oN0pE1q96lVFQ7L3qLU/thd1C1Lnc04p7VYlPTiwvzLFvMJyX2W+XlZkzjwYbhOoPXA0NXf0WoYwhsILklU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYK9VV3g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E22FC4CEEB;
	Tue, 29 Apr 2025 13:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745931755;
	bh=cVz4BLzmyccotxv38TkDl5vqVFZjC2oj8EFmw1P14eQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bYK9VV3geFSWspM0z/K/ww0O0r/R/s8JNHhaWwuUf2Q3XG2yZ9kmGrc7WLar0WCI0
	 YijhSWIni/UDV/Ok7OR+0ZyUjQFyZQ9A0713vTSSeDcIGWIRdmVcCN4Eft5plkoRqX
	 JBhkc0yjFiJIlvMb5rjuzjH0UVq0nIkZZiGCFluBrvJIVjvLB6329xJob5RiSYbU8H
	 vhJWUsg2pY2KqrjlOWPgRIcu9zBaBTIHAKcnbJ2aFEwwsJLVuyowKU97AczuwQvcCa
	 7KionaFXgUPiE/9Pi6aRc+1lB5Xr++qY6/tP60Zy+fbrkSReejg1rhyCXNAWJC01Rm
	 DS2NPKeGky5lg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u9kbd-000000006Eq-47WT;
	Tue, 29 Apr 2025 15:02:38 +0200
Date: Tue, 29 Apr 2025 15:02:37 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>, Marc Zyngier <maz@kernel.org>,
	Xilin Wu <wuxilin123@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] arm64: dts: qcom: x1*: Fix vreg_l2j_1p2 voltage
Message-ID: <aBDN7V6eFoIn6r0J@hovoldconsulting.com>
References: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>

On Wed, Apr 23, 2025 at 09:30:06AM +0200, Stephan Gerhold wrote:
> Several of the Qualcomm X1* device trees upstream specify the wrong voltage
> for the L2J regulator. In the ACPI DSDT table, PPP_RESOURCE_ID_LDO2_J is
> configured with 1256000 uV instead of the 1200000 uV. Change all affected
> device trees to use the same for consistency and correctness.
> 
> In the other device trees upstream, the voltage is already correct:
>  - x1e78100-lenovo-thinkpad-t14s.dtsi
>  - x1e80100-dell-xps13-9345.dts
>  - x1e80100-microsoft-romulus.dtsi
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
> Stephan Gerhold (6):
>       arm64: dts: qcom: x1-crd: Fix vreg_l2j_1p2 voltage
>       arm64: dts: qcom: x1e001de-devkit: Fix vreg_l2j_1p2 voltage
>       arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix vreg_l2j_1p2 voltage
>       arm64: dts: qcom: x1e80100-hp-omnibook-x14: Fix vreg_l2j_1p2 voltage
>       arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Fix vreg_l2j_1p2 voltage
>       arm64: dts: qcom: x1e80100-qcp: Fix vreg_l2j_1p2 voltage

I only checked the CRD (and T14s) DSDT, but this looks correct:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

