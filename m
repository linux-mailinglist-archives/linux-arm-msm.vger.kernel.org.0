Return-Path: <linux-arm-msm+bounces-81036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB71BC47388
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 15:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DFD01884DF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9774B212F98;
	Mon, 10 Nov 2025 14:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="unLtZ9wS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCBE2BB13;
	Mon, 10 Nov 2025 14:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762785270; cv=none; b=i2r47Itin0jMKrZCO83ob2s1C6EuwhRdlD+Y0QmUaFIpBFDULS7I4BXK741SpwPYUePYYYnc1ySedXfvWHWhC8j+Umsgn3hiWMos6PaE8M1bLPgHYhBkapaYAn7HmZgSJjc2JL6IqS84QxwcWGDT/ZIarWyGI0jtlOpdOMQuwEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762785270; c=relaxed/simple;
	bh=aX7K3JAhfHPmsSB4e6UXe2Yw6nVe4RMBF3FIzB64hM0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=uNqvAaKdjKtZUUsahWwYLHkFc1SnO7NFGWUiE0ox+7LNZlHERJnikW841pXrK2OZ4Vv/p5KaH5hFG8lhD4FTpoH/4i+W5dlKYSWMOLItgcFmaJ/nvzmfFXXfKCZizoEdhWvuUP4rzpZjIYFvSgTpkMMXj2YLmptqwbiDdBtG534=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=unLtZ9wS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA73C4CEFB;
	Mon, 10 Nov 2025 14:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762785270;
	bh=aX7K3JAhfHPmsSB4e6UXe2Yw6nVe4RMBF3FIzB64hM0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=unLtZ9wS4gYJjNZAEGqGQy8q8bRZbZBj7fXqm6RFICktbtM2DuFAeX2eu3fNWvu/t
	 bLAG5rf6gPr8uRTzsFXBEt2vgMKgE8kSWcLc7hNuW8BKgGmqISgOwyr0h/xD6DlaAx
	 M5fl77oH3zcC+uQPDVIGP8rulfueC9TN12bTbUXJCmBb6TVq9y1SVURJ1aEWeUHpqO
	 KS6jk30J9aInS2NbsnTOzsz/qx2R0raOm6ho/6mEjByy3UNEBUbrP/htS2F07izqKs
	 c4DbYTsahFoQRpLF6LFagT8Oc8SFZCVp944G28n0RiN1QO5WPE/lsM/FpY+gnfw+vW
	 /gN2fYTKh5MYg==
Date: Mon, 10 Nov 2025 08:34:28 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
In-Reply-To: <20251107-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v1-1-8ba83b58fca7@oss.qualcomm.com>
References: <20251107-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v1-1-8ba83b58fca7@oss.qualcomm.com>
Message-Id: <176278493057.154520.2194294987680641552.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable TPM (ST33) on
 SPI11


On Fri, 07 Nov 2025 20:02:25 +0530, Khalid Faisal Ansari wrote:
> Enable ST33HTPM TPM over SPI11 on the Hamoa IoT EVK by adding the
> required SPI and TPM nodes.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> ---
> Testing:
> - TPM detected via tpm_tis_spi
> - Verified functionality using tpm2-tools (e.g. tpm2_getrandom, tpm2_rsadecrypt)
> 
> Thanks for reviewing.
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
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
 Base: 9c0826a5d9aa4d52206dd89976858457a2a8a7ed (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251107-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v1-1-8ba83b58fca7@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: tpm@0 (st,st33htpm-spi): compatible: ['st,st33htpm-spi'] is too short
	from schema $id: http://devicetree.org/schemas/tpm/tcg,tpm_tis-spi.yaml






