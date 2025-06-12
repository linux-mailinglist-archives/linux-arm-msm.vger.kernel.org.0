Return-Path: <linux-arm-msm+bounces-61143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D688FAD7C16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 22:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76F761780C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 20:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE702DCBF5;
	Thu, 12 Jun 2025 20:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGMJg5EY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102242DCBEE;
	Thu, 12 Jun 2025 20:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749759147; cv=none; b=o9AFxr+Vk0s1VEKm4ljAdDxGCewWBC1vFYtB0bpIFmg4Uxsm+RjLMrfJuwXFU6/gJY8d3TdUfduJnelmBy5T0HhfOE+Xm2uIuBqDxVzqw28XFRqqCaQpWh6wTzgfX+Wo7vKphxQgatN8s5yeIlqEclmIrEnkTotFtdXYDdPE0+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749759147; c=relaxed/simple;
	bh=wgIiP3lzP1J6FeDZgx6tVjoIOQd7/phBDaHkj2xpEW8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=X/wYYJfsyy3Zz5fEys45P8JSRigJ9wwZ0rz+QlUyoAkMmCN+FQIzIf0NIUMCDVgKv/KJKAA1REojDFz6TbKvAS3Rtkfwq7UbSae6TThdbHIIriooEjYMsKwJFMBJwUX3HqDV2mdMS30aPGwuJOIDtvdRf13G+Y0Vn6JN8NbtrnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGMJg5EY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CF2C4CEEA;
	Thu, 12 Jun 2025 20:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749759146;
	bh=wgIiP3lzP1J6FeDZgx6tVjoIOQd7/phBDaHkj2xpEW8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=fGMJg5EYcmGE9D1lwG8Cw9r6UWrDWf+SKgl8b2d5NVVUU+RSKB8cWA3DUsKiSkIFz
	 Jc/194FHggL05ILmk+5plKrxP0NsREHDWAO7nRWx+ECVLuu7AVMOOkxaiRg8yt+or9
	 BCFvWbRGvb3umv5UsqajnCKCUJaoofkXJV49uond6vQmFSuXi4+OOHmYzBkDkddz9s
	 m8IAAazxjU+LtiCwLSRCdQl3EW1LcWlJ9CJNdUb0pi6cUAFiOrrAVqioaBdcoHqTyb
	 TcuYLn0K3HhKb9ywbUlZG3KZiUArV423KLaOe7iyeM1rEL8n3Aqxa/P4fyRIBlM07d
	 uY+qqFkkgMpJw==
Date: Thu, 12 Jun 2025 15:12:25 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
 konradybcio@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, linux-mmc-owner@vger.kernel.org, 
 linux-kernel@vger.kernel.org
To: Sayali Lokhande <quic_sayalil@quicinc.com>
In-Reply-To: <20250612092146.5170-1-quic_sayalil@quicinc.com>
References: <20250612092146.5170-1-quic_sayalil@quicinc.com>
Message-Id: <174975871736.2916063.6474058079149686986.robh@kernel.org>
Subject: Re: [PATCH 0/1] Add eMMC support for qcs8300


On Thu, 12 Jun 2025 14:51:45 +0530, Sayali Lokhande wrote:
> Add eMMC support for qcs8300 board.
> 
> Sayali Lokhande (1):
>   arm64: dts: msm: Add eMMC support for qcs8300
> 
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 33 ++++++++
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 97 +++++++++++++++++++++++
>  2 files changed, 130 insertions(+)
> 
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250612 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250612092146.5170-1-quic_sayalil@quicinc.com:

arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: soc@0 (simple-bus): mmc@87C4000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: mmc@87C4000 (qcom,sdhci-msm-v5): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sdhci-msm-v5'] is too short
	'qcom,sdhci-msm-v5' is not one of ['qcom,sdhci-msm-v4']
	'qcom,sdhci-msm-v5' is not one of ['qcom,apq8084-sdhci', 'qcom,ipq4019-sdhci', 'qcom,ipq8074-sdhci', 'qcom,msm8226-sdhci', 'qcom,msm8953-sdhci', 'qcom,msm8974-sdhci', 'qcom,msm8976-sdhci', 'qcom,msm8916-sdhci', 'qcom,msm8992-sdhci', 'qcom,msm8994-sdhci', 'qcom,msm8996-sdhci', 'qcom,msm8998-sdhci']
	'qcom,sdhci-msm-v5' is not one of ['qcom,ipq5018-sdhci', 'qcom,ipq5332-sdhci', 'qcom,ipq5424-sdhci', 'qcom,ipq6018-sdhci', 'qcom,ipq9574-sdhci', 'qcom,qcm2290-sdhci', 'qcom,qcs404-sdhci', 'qcom,qcs615-sdhci', 'qcom,qdu1000-sdhci', 'qcom,sar2130p-sdhci', 'qcom,sc7180-sdhci', 'qcom,sc7280-sdhci', 'qcom,sc8280xp-sdhci', 'qcom,sdm630-sdhci', 'qcom,sdm670-sdhci', 'qcom,sdm845-sdhci', 'qcom,sdx55-sdhci', 'qcom,sdx65-sdhci', 'qcom,sdx75-sdhci', 'qcom,sm6115-sdhci', 'qcom,sm6125-sdhci', 'qcom,sm6350-sdhci', 'qcom,sm6375-sdhci', 'qcom,sm7150-sdhci', 'qcom,sm8150-sdhci', 'qcom,sm8250-sdhci', 'qcom,sm8350-sdhci', 'qcom,sm8450-sdhci', 'qcom,sm8550-sdhci', 'qcom,sm8650-sdhci', 'qcom,x1e80100-sdhci']
	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: mmc@87C4000 (qcom,sdhci-msm-v5): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#






