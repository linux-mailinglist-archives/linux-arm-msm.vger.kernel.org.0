Return-Path: <linux-arm-msm+bounces-50973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC77A5C63C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 16:23:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 522D21891BF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 15:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7875E25EF8F;
	Tue, 11 Mar 2025 15:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/c2Ak8E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B93825EF86;
	Tue, 11 Mar 2025 15:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741706370; cv=none; b=YanUGlWqZzERx8IHW2cXxaShIExu2onyyR3/px7Ib7wXWuO98WxNw48vayzyqbmth+EmDld883rvXaB6FbjnAerNyVMKOIPRoENXzTneZYtBQXH0pCgFoO7ixp8mAoZHZqcwktPFAvZ53cVVOphgQlXYktgDsLsCjxhWER8ygvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741706370; c=relaxed/simple;
	bh=8TQJ58G3JmOK405NdUYMy5SH2CRLiCFBDczFSnWpytM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=l66+LZIG5s9m2VhMAp0LVIWEWGcpd2liMWuSj8uzF1gO9EWm6Ic3bmbfRRLremH1nNA/FXsdx1Hhgs+rrfdLfJSUHe9K1jsTtwi2g3c7V8F20+VtM1vVEHQRMcDXUtKiYrn9ooiNg0C5lE8kPn1EZdAprrwHsPEZmV3kxmB9Z8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/c2Ak8E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF2BC4CEE9;
	Tue, 11 Mar 2025 15:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741706370;
	bh=8TQJ58G3JmOK405NdUYMy5SH2CRLiCFBDczFSnWpytM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=j/c2Ak8EtBSDSGij0vVZrC4Y8/mWA4ETT6QCdwtgi6hPDQuTLpJfnqai6Nd9/7WKh
	 DdTKMvB+tmSVp4p5bhhaSjIZh2KYy9QcZ7qTNe4SUE9ryH6eSQ5ru/q6P99KgtsgVf
	 kmQ/DjEpa1iNobzmuBhBllWgZvQQT9rhcyKJeMmUiT06qRa0e+S3AqWmuKcngaJZ91
	 g2yhqI+iMlloZClOy3rikx788P3LuPPhpfOL3gHL72hRrEjRr+aHELgGTGJfW/HVX7
	 fXWxAIcYxUi6Cdf6cb5URjdLBVwQ02HOWlq1MnMEiXI7rKEJ4Yd2XUpIIAfYu2FCOy
	 o04ZAzV9c4PpQ==
Date: Tue, 11 Mar 2025 10:19:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org
To: Gabriel Gonzales <semfault@disroot.org>
In-Reply-To: <20250311003353.8250-1-semfault@disroot.org>
References: <20250308013019.10321-1-semfault@disroot.org>
 <20250311003353.8250-1-semfault@disroot.org>
Message-Id: <174170613912.3566385.18130770029981386543.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] Add Xiaomi Redmi Note 8 support


On Tue, 11 Mar 2025 08:33:46 +0800, Gabriel Gonzales wrote:
> This patchset introduces support for the Redmi Note 8 (codenamed ginkgo).
> 
> Changes in v2:
> - Add missing cover letter
> - Fix up commit message for schema
> Changes in v3:
> - Use qcom ids instead of hardcoded msm-id (and other changes suggested by Konrad)
> - Switch up model properties and qcom properties position
> 
> Gabriel Gonzales (2):
>   dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8
>   arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo.dts    | 295 ++++++++++++++++++
>  3 files changed, 297 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
> 
> --
> 2.48.1
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


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250311003353.8250-1-semfault@disroot.org:

arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: /: qcom,msm-id:0: [394] is too short
	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000: #address-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4ac0000: #size-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000: #address-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#
arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dtb: geniqup@4cc0000: #size-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml#






