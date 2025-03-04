Return-Path: <linux-arm-msm+bounces-50176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA77A4DE97
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 14:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A6C37A323A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 13:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F56A1FF1DA;
	Tue,  4 Mar 2025 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1hz5R9Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DBA442C;
	Tue,  4 Mar 2025 13:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741093359; cv=none; b=ZpJ4r8pH2KrIHBvpgP+uvYw50Sh5jiEUaog8Wt1Vt4PyDybhE6fFGFJeup/tpYvcM3wxe6GrX6l40x+Q+jNxtVoht1wHVs5mfHrdtcP3hHbJ2kCvPGiLt6nlHAZYCv8UZfnRCDUyTQHUcG1QFA3O2xuZxUFfgM/Qw6vzfUVC3HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741093359; c=relaxed/simple;
	bh=eE95+Tp6lrhCL7Wgvg8bxpKKxUsq4uLUnMAe+fyZ1Vg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=sbF0/NI+/rnzi5dUs3DGCglO3nWMA8iwr2iBtsWzrCDwYX8f1Mj2tYTS5YEdE2NvKjTPUDev1E/Bwnii5HXFuhl8xhtgYDQM42GD7bFfZxIEC5Ul7pkhP3fOODBjza9BiMmZAjaYQf/InLe/EB/v0IUSytk/GDN02BatKEgjToU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1hz5R9Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89144C4CEE5;
	Tue,  4 Mar 2025 13:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741093358;
	bh=eE95+Tp6lrhCL7Wgvg8bxpKKxUsq4uLUnMAe+fyZ1Vg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=B1hz5R9Z1lIRlwCXeC9DVfP6YESVcTw57KCH3dGZ0AlzlF1uAzyCFV42EM0duNMEF
	 hSQulJW8ST//yjNX6KVjLXZOkHcZtOkrmGiljpmhsfuVyJ2YivKYp7sUibZh21SeQg
	 4e9V1bIV4vRBWOp8jUAGzDeS4kRWOxidug9odiCA5mQ1N/WRuLzs9Qe4lygK+IMzTL
	 FD8ddnhjJpC1l/Mu8AKWvVloihm9DRitZ7++RtxY+TZu1fBFxhX1zUh4/q5srGKAVu
	 vSrv2+thQrsr4/V6ON4NVAiyGDvs06qHErejc+TaN075nhJ+sY4SpKfWDK50r/B/Du
	 reQF1KP97OGHw==
Date: Tue, 04 Mar 2025 07:02:36 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Gabriel Gonzales <semfault@disroot.org>
In-Reply-To: <20250304043742.9252-1-semfault@disroot.org>
References: <20250304043742.9252-1-semfault@disroot.org>
Message-Id: <174109297242.2409472.3701477490914835311.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8


On Tue, 04 Mar 2025 12:37:39 +0800, Gabriel Gonzales wrote:
> Document the Xiaomi Redmi Note 8, which is based off the SM6125 SoC
> 
> Signed-off-by: Gabriel Gonzales <semfault@disroot.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250304043742.9252-1-semfault@disroot.org:

arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000: #address-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000: #size-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000: #address-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000: #size-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#






