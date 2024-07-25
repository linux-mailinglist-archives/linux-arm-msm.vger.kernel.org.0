Return-Path: <linux-arm-msm+bounces-27059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE9F93CAC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 00:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9282A1C20880
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 22:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA69149DE3;
	Thu, 25 Jul 2024 22:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xh57g3c3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D12F149C7D;
	Thu, 25 Jul 2024 22:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721946024; cv=none; b=Bb5HySV9zV+9lwY6F5qXEswWp9wWw1k7+ztl6fJ2/s3WcOOWBmXLv2iKg+OgDnJpwCxS5wV2bbIlgHLyyDBs3oRynLJa9T4XcdnQsrR8CRcZFZtnrLn/FRBG3l2ELP5pUeqBVopS1rCtferI2Wtdw5Sny3p6GBpf9E16YCV6xDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721946024; c=relaxed/simple;
	bh=DMb4FAyDs5+2vWRzerNzmNF2GnGICO5RXfOT5dbQ/z0=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=rDfJPcGpdMQ+gUlEim7WFYwu+XqTvQ+diIbPHkGxqy0L1qIOmop+D44xKzjsvJ8/3b+T/lQ9c3qV8Ah60O2CT9SqtHTVXLzMDCWonc/M9m5fHV4zhUqmPssaKFHblMEqQFcGBnZJn99RM5jwMSLnOvuLj409VlGBgQZ7ZPdpIrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xh57g3c3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18843C4AF07;
	Thu, 25 Jul 2024 22:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721946024;
	bh=DMb4FAyDs5+2vWRzerNzmNF2GnGICO5RXfOT5dbQ/z0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Xh57g3c3aeg2Sipj2aMzm83+p0vruu3FBgcNh1N8ejIj0zxDLQsoCESDz7vCkHs5N
	 +usMyicqQWeCSjGQJSIJkvOarNWaKGB8zn8fHHlKcG9bh3yukklWChXlEPNl15ItvQ
	 AVfbL52dklWLE0F4v6cizpVXD2SmN8AutrnxYSBfWTj3Mt0D+NYYJSrfxy0H3V4F3p
	 1zL4D1AIVNTtbA+XJ4LNt/m4H9oHvdQnEDlotRrINrm6VxzU52ZBpuNK6KxdXI5Njc
	 pdfTVIHQS0bf5s1KSxWLH9vL152O4iMqyNVPNUcJZOTSpCipqNV3agBFOnOrAmWShC
	 1DU1XZtOaGsMw==
Date: Thu, 25 Jul 2024 17:20:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dang Huynh <danct12@riseup.net>
Cc: Bjorn Andersson <andersson@kernel.org>, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
References: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
Message-Id: <172194566780.4001454.14693259932918887320.robh@kernel.org>
Subject: Re: [PATCH v2 00/11] F(x)tec Pro1X feature expansion


On Thu, 25 Jul 2024 08:42:09 +0700, Dang Huynh wrote:
> This patch series expand F(x)tec Pro1X (QX1050) device tree to support
> various components of the device.
> 
> Most notably:
> + SD Card slot
> + Touchscreen
> + MDSS, DRM display panel
> + WLAN (ATH10K)
> + Hall sensor and camera button
> 
> This patch series has been tested on Buildroot Linux with TQFTPSERV and
> RMTFS present in userspace.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
> Changes in v2:
> - Squash copyright year commit to the hall sensor commit
> - Reorder pinctrl-n and pinctrl-names in several commits
> - Use interrupts-extended for touchscreen
> - Add further information to the caps lock LED node
> - Move status property from &wifi to the end of the node
> - Link to v1: https://lore.kernel.org/r/20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net
> 
> ---
> Dang Huynh (11):
>       arm64: dts: qcom: sm6115-pro1x: Add Hall Switch and Camera Button
>       arm64: dts: qcom: sm6115-pro1x: Add PCA9534 IO Expander
>       arm64: dts: qcom: sm6115-pro1x: Add Goodix Touchscreen
>       arm64: dts: qcom: sm6115-pro1x: Add Caps Lock LED
>       arm64: dts: qcom: sm6115-pro1x: Enable SD card slot
>       arm64: dts: qcom: sm6115-pro1x: Enable MDSS and GPU
>       arm64: dts: qcom: sm6115-pro1x: Hook up USB3 SS
>       arm64: dts: qcom: sm6115-pro1x: Add PMI632 Type-C property
>       arm64: dts: qcom: sm6115-pro1x: Enable RGB LED
>       arm64: dts: qcom: sm6115-pro1x: Enable remoteprocs
>       arm64: dts: qcom: sm6115-pro1x: Enable ATH10K WLAN
> 
>  arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 319 +++++++++++++++++++++++-
>  1 file changed, 310 insertions(+), 9 deletions(-)
> ---
> base-commit: 41c196e567fb1ea97f68a2ffb7faab451cd90854
> change-id: 20240722-qx1050-feature-expansion-7f6a2682f2ea
> 
> Best regards,
> --
> Dang Huynh <danct12@riseup.net>
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


New warnings running 'make CHECK_DTBS=y qcom/sm6115-fxtec-pro1x.dtb' for 20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net:

arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: pinctrl@500000: Unevaluated properties are not allowed ('hall-sensor-n', 'key-camera-n', 'mdss-dsi-n', 'panel-en-n', 'ts-int-n', 'ts-rst-n' were unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm6115-tlmm.yaml#
arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: panel@0: 'elvdd-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/panel/boe,bf060y8m-aj0.yaml#
arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: panel@0: 'elvss-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/panel/boe,bf060y8m-aj0.yaml#
arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: panel@0: 'vcc-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/panel/boe,bf060y8m-aj0.yaml#
arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: panel@0: 'vci-supply' is a required property
	from schema $id: http://devicetree.org/schemas/display/panel/boe,bf060y8m-aj0.yaml#






