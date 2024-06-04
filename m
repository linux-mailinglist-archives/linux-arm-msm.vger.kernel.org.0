Return-Path: <linux-arm-msm+bounces-21624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB718FB734
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 17:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 709AFB264D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 15:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D2313A3F7;
	Tue,  4 Jun 2024 15:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttRD8nax"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FEB8BFA;
	Tue,  4 Jun 2024 15:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717514926; cv=none; b=Bs8uz0c36S71Tm1Imb5sfrk3wZsvfhgR7mL2EsCfk8hbceg5FyE+m0xUAA00RXwdKEECZGtz71maOK+JgIFNwm2kUoD6Y8a0VHwVFEqM5ZguEZGxPc/L49ekMT64AIjMqmNxhh84ODiOM0uBjj4Kqx385ShkqQQUFqOuJ3ry/tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717514926; c=relaxed/simple;
	bh=oFkn0LPoB9tVCls/ircGN3t6OtW4u8TewXsEM7hT28U=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=dNL8TMCysFXRWGlVQwT1ZSuHSDh75aF8+Sr/HRdB5OCUauocLyGwByL9A1VLxsdorthBq9CKZUvIT69b5Jsc/8bg09VUX1+kxxW0305ZfOu/6349X2dRJWaxO37eh5vjBFbhQ8yAHr0PIZNDBy0vMBVg7ONwVCJbExCEehrvpoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttRD8nax; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E7AC2BBFC;
	Tue,  4 Jun 2024 15:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717514926;
	bh=oFkn0LPoB9tVCls/ircGN3t6OtW4u8TewXsEM7hT28U=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ttRD8naxy8arbWujT8hUYCBfUCAPhHbVst0qDeTLF3ADFg+xTjuPxSwwYN1x8WHl9
	 uMrs/2Xs/nhTO8k6YDdzz9sv8/SuglB0ygUyaDC98jJ3qFdWT95L9jGR/RzheuX/pW
	 dbo8beYPTDiakacl79czfSWkHduHjlLe78pOjEbj9XIi3rUhDbtjkmp3CsYoGaDpI8
	 Xd3sHCfJ8ZxvEjUj6niqwHw8iqOkmed/5AyZbWw73dX7qgDveEo9PP2AHZ+eEGvAwx
	 aUjQpDSNNUtRd+kMOb9yH8/FPxhtAMK/wDno9OJNeAaMAuYP72/A+A1CC8MftUw22f
	 zt/2HIUKj977g==
Date: Tue, 04 Jun 2024 10:28:43 -0500
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
Cc: conor+dt@kernel.org, linux-kernel@vger.kernel.org, petr.vorel@gmail.com, 
 robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, konrad.dybcio@linaro.org, 
 krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20240530135922.23326-1-alexander.reimelt@posteo.de>
References: <20240403104415.30636-1-alexander.reimelt@posteo.de>
 <20240530135922.23326-1-alexander.reimelt@posteo.de>
Message-Id: <171751454446.785089.9573709633302965312.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] arm64: Add basic support for LG H815


On Thu, 30 May 2024 13:57:40 +0000, Alexander Reimelt wrote:
> Hello
> 
> Thanks for your time reviewing my first revision.
> Changes:
> - status is now the last property
> - corrected the node order
> - droped bootargs
> - corrected subject prefix
> - removed unused regulators
> 
> Sorry for the delay, I lost access to my device for a while.
> 
> Best regards
> Alex
> 
> Alexander Reimelt (2):
>   dt-bindings: arm: qcom: Add LG G4 (h815)
>   arm64: dts: qcom: msm8992-lg-h815: Initial support for LG G4 (H815)
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts  | 234 ++++++++++++++++++
>  3 files changed, 236 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts
> 
> --
> 2.45.1
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


New warnings running 'make CHECK_DTBS=y qcom/msm8992-lg-h815.dtb' for 20240530135922.23326-1-alexander.reimelt@posteo.de:

arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: usb@f92f8800: 'interrupt-names' is a required property
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: usb@f92f8800: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#






