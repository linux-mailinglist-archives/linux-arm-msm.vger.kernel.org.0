Return-Path: <linux-arm-msm+bounces-27294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3520F93FDC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 20:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D958D1F22D90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 18:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BB3187326;
	Mon, 29 Jul 2024 18:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Av7deGNI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2689957CB5;
	Mon, 29 Jul 2024 18:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722279175; cv=none; b=eqLfHemIPyrKn8MY8ZLaz7A+OytRhN9f/+zV1ju9rwqIPkWc7mcUZpGTakEOtQogFq/4c341qr7amwlUqOABLjopgKIVyTpV87RtbrMrUjBHcW98O1t6MyHZI8cae9gm6bnmP798h8lE9p6wGp8423/Hx1AJ9znVvFEYp3Zv34c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722279175; c=relaxed/simple;
	bh=FpxqXn3ulTPkxNmNNiEYEsaYlOlwWAESDZSzyLCKPNs=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=OQUhZOpAcfMKqWTJlb10OLUc8TMSJ64HmZWqUGo1IxIMpIVVIgcnx+0MNZcDO3VaY3DnxcwsoLQ0b5SfvQrquTf6IucETzm2CgcxZRj0Mahk40utARItmEe5b8B1WWAL0u4JCaOUYub1H1TpAL1n/2OB79jEFsjIg+xnCKxaf50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Av7deGNI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D453C32786;
	Mon, 29 Jul 2024 18:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722279174;
	bh=FpxqXn3ulTPkxNmNNiEYEsaYlOlwWAESDZSzyLCKPNs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Av7deGNIlp9jxS8JxTm0p+urwg/oI9stprzVT9QGC9PZtRLJ7MsLePx/KVxKh/ZTW
	 7vmccIH0XpreHV/ATSykhQa2eAlWZS0pxl8cA91PsBjboocvSRYn3tF4mVn3Y650g6
	 NLiNtgQwgdj/3u3xi+uvbukOxfWI+ry1KR+c5tErN5PHL2TY/2aPo4jdsmfEWYxe2m
	 8yoPexnPeh5OWn7S6+ymcsoE0y+2s34VHQB2luV2vHA0WqowXHXCO5UDkp2yjwLDUB
	 +CAuiH9ItQ+pSW0VpnSMrfIVLcRMkxYVuGMkcRUUVFOFZ1nqKXnoBSx2HX6In7aKR0
	 C/VHgAG5tLOEg==
Date: Mon, 29 Jul 2024 12:52:52 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Reimelt <alexander.reimelt@posteo.de>
Cc: konrad.dybcio@linaro.org, conor+dt@kernel.org, andersson@kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
 petr.vorel@gmail.com, robh+dt@kernel.org
In-Reply-To: <20240727201413.114317-1-alexander.reimelt@posteo.de>
References: <20240727201413.114317-1-alexander.reimelt@posteo.de>
Message-Id: <172227904849.1346409.17501721516983590086.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] arm64: Add basic support for LG H815


On Sat, 27 Jul 2024 20:04:48 +0000, Alexander Reimelt wrote:
> Hello,
> 
> Changes in v3:
> - use 0x0 consistently
> - pad to 8 digits
> - drop compatible = "framebuffer" because it's unused
> - drop chosen
> 
> Thanks again for your time.
> 
> v2: https://lore.kernel.org/linux-devicetree/20240530135922.23326-1-alexander.reimelt@posteo.de/
> 
> Alexander Reimelt (2):
>   dt-bindings: arm: qcom: Add LG G4 (h815)
>   arm64: dts: qcom: msm8992-lg-h815: Initial support for LG G4 (H815)
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts  | 231 ++++++++++++++++++
>  3 files changed, 233 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts
> 
> --
> 2.45.2
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


New warnings running 'make CHECK_DTBS=y qcom/msm8992-lg-h815.dtb' for 20240727201413.114317-1-alexander.reimelt@posteo.de:

arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: usb@f92f8800: 'interrupt-names' is a required property
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: usb@f92f8800: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#






