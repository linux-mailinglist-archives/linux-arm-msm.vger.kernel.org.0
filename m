Return-Path: <linux-arm-msm+bounces-64842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD388B043DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 17:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9904B3AE7E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 15:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E088261393;
	Mon, 14 Jul 2025 15:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7CMOuTh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5352E2609F7;
	Mon, 14 Jul 2025 15:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506670; cv=none; b=oYrhcx3H9w++wTspmWnKlqbWZvkZjIO6rSoWqQLgDrr/6X/uO2yLfZiE5weuvYtdaFLL8lGnCquhIn6/ot9ECtLQdj4etwrLqB9fVSQsnOE9gsKl+10/N32CAXAqYnGP/miWp2rNevuk/vm4NYEBWOU6LP+YxFEqwzrSDkTxu1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506670; c=relaxed/simple;
	bh=RfwvMSetNJOFXr1jVCNOOo9N5HKuQdwwWQKz0J5wPfI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=NcpW2aH9IH/4/GRTwiBJXsYAgAfqNDara4VAZKUILHMoV+RobaJ/xYGUjSGycszXEjf0qTfOW1kG9AokmfqvIfvxJIF9yHxFrfsYTiwo1mkMmrMZQN9HVV4gnX1g4jgguYo2i9pnPQG3Ok6QMD/xMSyQdeBdRWZ264Cn0inuRmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y7CMOuTh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03D3C4CEED;
	Mon, 14 Jul 2025 15:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752506669;
	bh=RfwvMSetNJOFXr1jVCNOOo9N5HKuQdwwWQKz0J5wPfI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Y7CMOuThVR2ptVkximFSxjB/D9B9vHZJKb1ocKc7DPaRwO5smevJiLY23IPAOb+LG
	 UuE5sEz0EwUZ4M9ue1bIF6ItYD6S+d1a9VyHVVMJQUw8ggY8i9YgjGO1xNwJ25MIUS
	 GR+SJE1jtMfwpC9hzlfyGX61A4vsXcF1pA8Aeo9nJm8QXdMI5VtC29A69PZHZPHQPk
	 00zdJpriT9jlzVTf2lcL/zfdBz2ihdjzUrI9O2Gq7iotZUqNBjCrI9HZN44vM1ph+K
	 MeZ1plEPIEoeENas9FCApZJxzPEx5DS/Av9cXfV0Sf5Gtzvs8P3h7GglanZ7iah8LJ
	 zVTwJ1y152xqg==
Date: Mon, 14 Jul 2025 10:24:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Shashank Maurya <quic_ssmaurya@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org
To: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
In-Reply-To: <20250711-enable-iq9-dp-v1-1-6d381e105473@oss.qualcomm.com>
References: <20250711-enable-iq9-dp-v1-1-6d381e105473@oss.qualcomm.com>
Message-Id: <175250103953.2052653.17147431403694083767.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: qcs9075-iq-9075-evk: Enable Display
 Port


On Fri, 11 Jul 2025 21:13:47 +0530, Prahlad Valluru wrote:
> From: Shashank Maurya <quic_ssmaurya@quicinc.com>
> 
> Enable DPTX0 and DPTX1 along with their corresponding PHYs for
> qcs9075-iq-9075-evk platform.
> 
> Signed-off-by: Shashank Maurya <quic_ssmaurya@quicinc.com>
> Signed-off-by: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts | 52 ++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
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
 Base: base-commit 7f3a635117b377cb90b67757cb46de12ce8aa24e not known, ignoring
 Base: attempting to guess base-commit...
 Base: failed to guess base
 Deps: looking for dependencies matching 3 patch-ids
 Deps: Applying prerequisite patch: [PATCH v10 1/3] dt-bindings: arm: qcom: Add bindings for QCS9075 SOC based board
 Deps: Applying prerequisite patch: [PATCH v10 2/3] arm64: dts: qcom: Add qcs9075 IoT SOC devicetree
 Deps: Applying prerequisite patch: [PATCH v10 3/3] arm64: dts: qcom: Add support for qcs9075 IQ-9075-EVK

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250711-enable-iq9-dp-v1-1-6d381e105473@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): clock-names:0: 'nrt_bus' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dtb: display-controller@ae01000 (qcom,sa8775p-dpu): Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#






