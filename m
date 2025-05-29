Return-Path: <linux-arm-msm+bounces-59820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D2FAC7D97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 14:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7D153B6178
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 12:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3282153CE;
	Thu, 29 May 2025 12:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Emin7nZm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06212AE6F;
	Thu, 29 May 2025 12:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748521013; cv=none; b=A36oercaefDLbiUcp6s8gk9NeINb9onvEF+uGomKfBCJdy8+xPSm28rGUZhRjO7PuiTUvQRqqPL5d+9JFYkuU+HYf+sa/aCCm9JNyGgZLp/pMAJZZATu1GxMw5k35xcAzRkCYgud8peoIP9tOghw95Tcov9XAEUQWTy+VXLyj/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748521013; c=relaxed/simple;
	bh=3vBQXvVhwm+l42vUA7VErf/HtjbvkBPtjkIUBpaX6aE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=OHXCdq6QeWUlGWvpAZYh5o5A2Yaaze0047TRTicyWv8GfJhhSavO43b9bB60iASUTos8QGBnV7g4yIqt3yO7dPRvg8D2DBHL6yffUAm38IjQgLXVquz1dp962LeZB1FvGkAslaSyhhGgAmd+rvWOe1lDyxQRxvJfpo9snxOad/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Emin7nZm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0182C4CEE7;
	Thu, 29 May 2025 12:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748521013;
	bh=3vBQXvVhwm+l42vUA7VErf/HtjbvkBPtjkIUBpaX6aE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Emin7nZmG1MBDyfGk5b0zVeX60SaUJ8si00zytLt3P/W9vpaZXN+a+MxJQ+eDIYpM
	 Fbqnw6PFolCPGnxq2OWzCoTS5VTZYDL0CDo9pBBCftQ4AJIwqYATHtL0WZQPQUgKSp
	 aosK5cJXZjbhvoV0SIzgbttjzR0MksnMgpAh7qpSkB9rYiJ48GbI6J33PM/vSB+vjY
	 XxmXXlg5Zefo01qtT19kk5B1gDNLV74/edrI2/J6hOWzkXDlc2xkiNGLajaUol2m9q
	 lgUgmhNPnKGBvphEAwu0EKYxgGNHLvW6G6cIU8fNyFaWs2olHYDk8cYHkV+Rr3+qEl
	 qSLHLEjV+4X/w==
Date: Thu, 29 May 2025 07:16:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: Yingchao Deng <quic_yingdeng@quicinc.com>
In-Reply-To: <20250529085650.3594253-1-quic_yingdeng@quicinc.com>
References: <20250529085650.3594253-1-quic_yingdeng@quicinc.com>
Message-Id: <174852097693.2714455.3894207129970011283.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: Add coresight node for SM8650


On Thu, 29 May 2025 16:56:41 +0800, Yingchao Deng wrote:
> Add coresight components on the path from stm to etr.
> 
> Signed-off-by: Yingchao Deng <quic_yingdeng@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 250 +++++++++++++++++++++++++++
>  1 file changed, 250 insertions(+)
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
 Base: attempting to guess base-commit...
 Base: failed to guess base

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250529085650.3594253-1-quic_yingdeng@quicinc.com:

arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: replicator@10046000 (arm,coresight-dynamic-replicator): out-ports:port@0: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: replicator@10046000 (arm,coresight-dynamic-replicator): Unevaluated properties are not allowed ('out-ports' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: tmc@10048000 (arm,coresight-tmc): iommus: [[75, 1248, 0], [75, 1216, 0]] is too long
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: tmc@10048000 (arm,coresight-tmc): Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: replicator@10046000 (arm,coresight-dynamic-replicator): out-ports:port@0: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: replicator@10046000 (arm,coresight-dynamic-replicator): Unevaluated properties are not allowed ('out-ports' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: tmc@10048000 (arm,coresight-tmc): iommus: [[75, 1248, 0], [75, 1216, 0]] is too long
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: tmc@10048000 (arm,coresight-tmc): Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: replicator@10b06000 (arm,coresight-dynamic-replicator): out-ports:port@0: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: replicator@10b06000 (arm,coresight-dynamic-replicator): Unevaluated properties are not allowed ('out-ports' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: replicator@10b06000 (arm,coresight-dynamic-replicator): out-ports:port@0: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: replicator@10b06000 (arm,coresight-dynamic-replicator): Unevaluated properties are not allowed ('out-ports' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: replicator@10046000 (arm,coresight-dynamic-replicator): out-ports:port@0: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: replicator@10046000 (arm,coresight-dynamic-replicator): Unevaluated properties are not allowed ('out-ports' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: tmc@10048000 (arm,coresight-tmc): iommus: [[75, 1248, 0], [75, 1216, 0]] is too long
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: tmc@10048000 (arm,coresight-tmc): Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: replicator@10b06000 (arm,coresight-dynamic-replicator): out-ports:port@0: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#
arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: replicator@10b06000 (arm,coresight-dynamic-replicator): Unevaluated properties are not allowed ('out-ports' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-replicator.yaml#






