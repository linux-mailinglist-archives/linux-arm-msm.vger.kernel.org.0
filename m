Return-Path: <linux-arm-msm+bounces-61500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA99ADBC31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 23:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F73A175266
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 21:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9030B2264C8;
	Mon, 16 Jun 2025 21:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBf8MVLy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61299225A40;
	Mon, 16 Jun 2025 21:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750110416; cv=none; b=tlyXgpI2LZY9SjQ9TFO4JaaV1qCdtKTfyIg8RjlCwZbTN/z3HUen/xbAjqvmCrFABwTjle+6qYHGV/dOQFFak8nCMvixm9jTM2nhaft0owg7yKwMt7F+dWAhXlS4hnshC9YK6qWFRcFGQYAKWF88DN/A2Q8XTAPBgH0WUltFhmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750110416; c=relaxed/simple;
	bh=5kPxfvLqld3l1k1H6EAa6k5v+yf344gXu6cyr9HDJsI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=m2+BDag33BvE0QaB3Grj5zxmj9Uz7ljlfq9dSKP2MRVxMfTXRQ4+wTH6/6/fPsAUniHl/WphaHmWz5uSwudElCL+2ErbyCsajJ0OijSrnqHbjgXYt32Y/Acj64VVy6Yl9wFwS/cK9rbSYDl2QFf0kEpIhDiQOxSl8sR5ikboqCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBf8MVLy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA9CC4CEEE;
	Mon, 16 Jun 2025 21:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750110416;
	bh=5kPxfvLqld3l1k1H6EAa6k5v+yf344gXu6cyr9HDJsI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WBf8MVLyqET12cvtIsDylYv9H26B9rOsT4scxZU6CUEJ4iQNrDLUqnCNutvWccBTF
	 Qm3xVz+IeHNuqHlghJ1kf5cj5VHHTTHOJAnMojfeXwWaClEmnVUJ15kU+c+qYtRcK9
	 jmQnjfnXie7Dm5PY70+r43REqg7QTSbYy3HeBZqG7RR5XBG8E8i8NQhMXAOq5Ww4VZ
	 stjWOKKcLEWemzQSNqKh6pb87T2mCNSXFQm8XTjB51DSgC13ZCH1YnaU9ZRbeu0w8T
	 pbq5NBZ98clVw2BYwY3+5BCs48BGcuqDGh8SH230Vhb5YX1vbwP4G1kK5x8EwwgLnT
	 uT9A2mlh5S77A==
Date: Mon, 16 Jun 2025 16:46:55 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>
To: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
In-Reply-To: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
References: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
Message-Id: <175011005921.2433864.12793942428671005325.robh@kernel.org>
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: msm8976-longcheer-l9360: Add
 initial device tree


On Sun, 15 Jun 2025 22:35:02 +0200, André Apitzsch wrote:
> This dts adds support for BQ Aquaris X5 Plus (Longcheer L9360) released
> in 2016.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - NFC
> - SDHCI
> - Status LED
> - Touchscreen
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
> Changes in v2:
> - Add Fixes and R-b tag
> - Move sdc2 GPIO definitions into msm8976.dtsi (new patch)
> - Remove comments from rmi4 nodes
> - Don't touch tz-app memory region. Currently, the bigger size seems
>   not necessary.
> - Link to v1: https://lore.kernel.org/r/20250613-bqx5plus-v1-0-2bc2d43707a6@apitzsch.eu
> 
> ---
> André Apitzsch (4):
>       arm64: dts: qcom: msm8976: Make blsp_dma controlled-remotely
>       dt-bindings: arm: qcom: Add MSM8976 BQ Aquaris X5 Plus
>       arm64: dts: qcom: msm8976: Add sdc2 GPIOs
>       arm64: dts: qcom: msm8976-longcheer-l9360: Add initial device tree
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   5 +
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/msm8976-longcheer-l9360.dts      | 490 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8976.dtsi              |  38 ++
>  4 files changed, 534 insertions(+)
> ---
> base-commit: 0bb71d301869446810a0b13d3da290bd455d7c78
> change-id: 20250612-bqx5plus-d72e11f5877c
> 
> Best regards,
> --
> André Apitzsch <git@apitzsch.eu>
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


This patch series was applied (using b4) to base:
 Base: using specified base-commit 0bb71d301869446810a0b13d3da290bd455d7c78

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu:

arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dtb: display-controller@1a01000 (qcom,msm8976-mdp5): clock-names: 'oneOf' conditional failed, one must be fixed:
	['iface', 'bus', 'core', 'vsync', 'tbu', 'tbu_rt'] is too long
	'iommu' was expected
	'lut' was expected
	'vsync' was expected
	'tbu' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,mdp5.yaml#
arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dtb: gpu@1c00000 (qcom,adreno-510.0): clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#






