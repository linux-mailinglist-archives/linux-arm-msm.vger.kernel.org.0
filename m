Return-Path: <linux-arm-msm+bounces-50092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 983BDA4D113
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 02:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EC993AC82E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 01:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE4313A258;
	Tue,  4 Mar 2025 01:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u9hNx2GS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F791754B;
	Tue,  4 Mar 2025 01:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741052329; cv=none; b=S4ajM6ys+5K/sNN7WBfw5U4OU5zCDwWayqljTCgBpw/TJcZcmEKpXftfDilHzRttFb0STyKb12kTBH5dEJyrpimB3aM3sAaU4JUl54PgXQuXVBYVIwDo6k0hT8005J+FFVDZFHAntB4CnqfUXtSgeID/enoXMqer+hNJSgIWcMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741052329; c=relaxed/simple;
	bh=qa1YEWsR5375JaE2FTUFsSVKHnOpfuCagoN/50tey0E=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=dY4exgLmxEwNjRQacJ9HPgjeYxFEIph3PZGL9um7UjK4kTKb9UTRHtBpPgeeAUW5P1EFJtoXlRxQGrx48KvuNlFSHhbgmgy5J2M08znH6aK0Yk1K6VG2ZwLIVYy0wjdLV1sREXQyXLcMm+3iqNRla+0ISgRbCfSYWWhmUNzQ8gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u9hNx2GS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33941C4CEE4;
	Tue,  4 Mar 2025 01:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741052328;
	bh=qa1YEWsR5375JaE2FTUFsSVKHnOpfuCagoN/50tey0E=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=u9hNx2GSba0yMEf9O+SaoB/pNT0FGVIoAnieaWJqUNoYdp/88Hcb7OKuys+LFO9WV
	 T/qFZM7FGdBlKKN9Sl3SGZC4vTc/Sr1YHlBYisfJwTC59ju5q6ORTb65eta/qDq6wK
	 LmfDFjnGpQolg899iNUSFtqZUgZpz2/Il5k6e964rskDBV28F5RozNjJUxFSqfpLHr
	 xDmVvGfNAr7+LcbG7o5mN8NSzMIwSpD6w+BP+F1G7roj7MHKe3YaMmK42ZZQ/MjEiz
	 f9jJ82YXgL7CdNpYhBMCiqMFEYEqgEmvJJHEHORZ4OG3ZKevuk5Yhz3081r/xRXFHl
	 10y9Y864FwYtQ==
Date: Mon, 03 Mar 2025 19:38:46 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Taniya Das <quic_tdas@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
Message-Id: <174105227313.195955.8409784191665720030.robh@kernel.org>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sm8550: camcc: Manage MMCX and
 MXC


On Tue, 04 Mar 2025 00:55:19 +0200, Vladimir Zapolskiy wrote:
> It was discovered that on SM8550 platform Camera Clock controller shall
> manage MMCX and MXC power domains, otherwise MMIO access to CCI or CAMSS
> breaks the execution, the problem has been discussed with Jagadeesh at
> https://lore.kernel.org/all/a5540676-9402-45c4-b647-02fdc2b92233@quicinc.com/
> 
> Since 'power-domains' property becomes generalized, Rob asked to remove
> its description, which is done in the first patch of the series, see
> https://lore.kernel.org/all/20240927224833.GA159707-robh@kernel.org/
> 
> Vladimir Zapolskiy (2):
>   dt-bindings: clock: qcom: sm8450-camcc: Allow to specify two power domains
>   arm64: dts: qcom: sm8550: Additionally manage MXC power domain in camcc
> 
>  .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 +---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi                          | 3 ++-
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> --
> 2.43.0
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250303225521.1780611-1-vladimir.zapolskiy@linaro.org:

arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: clock-controller@ad00000: power-domains: [[54, 7]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: clock-controller@ad00000: power-domains: [[54, 7]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@ade0000: power-domains: [[161, 6]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@ade0000: Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@ade0000: power-domains: [[106, 6]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@ade0000: power-domains: [[98, 6]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: clock-controller@ad00000: power-domains: [[54, 7]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000: power-domains: [[143, 6]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000: Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: clock-controller@ad00000: power-domains: [[54, 7]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: clock-controller@ad00000: power-domains: [[54, 7]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@ade0000: power-domains: [[159, 6]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@ade0000: Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: clock-controller@ad00000: power-domains: [[54, 7]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: clock-controller@ad00000: power-domains: [[60, 7]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@ade0000: power-domains: [[98, 6]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@ade0000: power-domains: [[98, 6]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#






