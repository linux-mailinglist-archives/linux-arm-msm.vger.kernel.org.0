Return-Path: <linux-arm-msm+bounces-71759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D379B41855
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 123F51BA0AEB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 08:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854472EACE9;
	Wed,  3 Sep 2025 08:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="JgO79AiA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF53C2DF716;
	Wed,  3 Sep 2025 08:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756887906; cv=none; b=VZIdDmkabH3w1V5X2R0k2xX5wqRD37mvXoJzFXb72APadD1c3FX0Mi9n7iObAVfkXkeXrfWLWo63q+GCIhriMaMoh37zzV/LYq4nY3cEHnyvLIX1OE6sa9xqlvgUTzI9rerRiQwAuHUAon83Vm191/Ltwf5K6rCA9NIXxulxJs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756887906; c=relaxed/simple;
	bh=aIKvsyaaE9IcH3GTXT7d6qopOlRrWy67Dm7j+/pv2qA=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=HcFx/cFvS0DtTkG4o+TrK2ZfNiH9vDUQBhQhI8zVMmIJ1D9k1ypkNEPNnmxR4fjpaGxNFzA9CW9M6m8GATLiKyg51EVBULJq5HQxkFCLe2DotlfOxaGhnOZmh6W1PB0+WkDlXSeryyUpKhiwfKXhWeofziqS/pubihDzdkpVMvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=JgO79AiA; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1756887896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j7BHoohsON/uHAsQoNKnfX6vsph4pvo5v6eXoOgK4Xc=;
	b=JgO79AiAN14ntr3cqlfxjcoIkm18Z2ZBhnHHEB34/+bYAj+zKxsa0+b4e0e8jX6xsC2IQI
	Tfm7cnCRV9Tx4inYr0yhhbhkfXyS5auIvPCNyFgh5uFRfbBZ9z91H/MQj4BWO7yOfn+Rfe
	HOyVAC5hSo3Y3aqjEETL6uD/OrpYlENP2KEBfLWIIfRNNyAFmk7LrNILhN+LT0OC7BExe9
	0B/L9JwpZieirO+SmBq6SLTX941Y/Yu2XAwJw8WAsLwKHPOnYn380W/tmVh0Slc+QCvWcE
	tIUp0oORqbh618V7Qt5QtoOHJIlwaTvGQpkg39v7gNQgMLepk5SGrh052hKwsA==
Date: Wed, 03 Sep 2025 10:24:55 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
 quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
 quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
 kernel@oss.qualcomm.com
Subject: Re: [PATCH V5 0/4] Add level shifter support for qualcomm SOC's
In-Reply-To: <20250903080404.3260135-1-quic_sartgarg@quicinc.com>
References: <20250903080404.3260135-1-quic_sartgarg@quicinc.com>
Message-ID: <3453985c13aa51d068c0174e51e378fb@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Sarthak and Krzysztof,

On 2025-09-03 10:04, Sarthak Garg wrote:
> Add level shifter support for qualcomm SOC's.
> 
> - Changed from v4
>     - As suggested by Krzysztof Kozlowski Renamed the property from
>     `max-sd-hs-frequency` to `max-sd-hs-hz` for clarity.

I just spotted this series, so I'm sorry for jumping in late.  To me,
"max-sd-hs-frequency" was actually a better choice, because it goes
together with the already existing "max-frequency" property.

Yes, "max-sd-hs-hz" is obviously more clear, but to me, consistency
is more important.  Just my $.02.

>     - As suggested by Krzysztof Kozlowski remove min/max constraints
>     and add default: 50000000 in dt-bindings.
>     - As suggested by Konrad Dybcio moved max-sd-hs-hz property in the
>     SoC dtsi.
>     - Retained sdhci-caps-mask in sm8550.dtsi for now and will revisit
>     its removal for future targets after thorough validation and 
> testing
>     from the beginning.
> 
> - Changed from v3
>     - As suggested by Krzysztof Kozlowski moved the property from the
>     SoC-level DTS to the board-level DTS.
>     - Revised the commit messages to clearly explain its 
> board-specific.
> 
> - Changed from v2
>     - As suggested by Konrad Dybcio and Ulf Hansson redesigned logic
>       to introduce a new DT property max-sd-hs-frequency and override
>       the hs_max_dtr accordingly in sd.c file.
> 
> - Changed from v1
>     - As suggested by Krzysztof Kozlowski redesigned logic to use
>     compatible property for adding this level shifter support.
>     - Addressed Adrian Hunter comments on V1 with resepect to
>       checkpatch.
>     - Cleared the bits first and then set bits in
>       sdhci_msm_execute_tuning as suggested by Adrian Hunter.
>     - Upated the if condition logic in msm_set_clock_rate_for_bus_mode
>       as suggested by Adrian Hunter.
> 
> Sarthak Garg (4):
>   mmc: sdhci-msm: Enable tuning for SDR50 mode for SD card
>   dt-bindings: mmc: controller: Add max-sd-hs-frequency property
>   mmc: core: Introduce a new flag max-sd-hs-hz
>   arm64: dts: qcom: sm8550: Add max-sd-hs-hz property
> 
>  .../bindings/mmc/mmc-controller-common.yaml       |  8 ++++++++
>  arch/arm64/boot/dts/qcom/sm8550.dtsi              |  1 +
>  drivers/mmc/core/host.c                           |  2 ++
>  drivers/mmc/core/sd.c                             |  2 +-
>  drivers/mmc/host/sdhci-msm.c                      | 15 +++++++++++++++
>  include/linux/mmc/host.h                          |  1 +
>  6 files changed, 28 insertions(+), 1 deletion(-)

