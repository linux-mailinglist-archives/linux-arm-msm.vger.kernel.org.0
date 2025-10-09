Return-Path: <linux-arm-msm+bounces-76749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EADBCB030
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 00:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 589DE1A62113
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 22:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986242853F7;
	Thu,  9 Oct 2025 22:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nd3js3x9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622A028506A;
	Thu,  9 Oct 2025 22:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760047425; cv=none; b=QoXgZ7+7wJYD/CDGjEFAVQsc0mJcOlfpYoICAY8QIWUfqyMwZ4vobihfV7i8POa/X+ZUvizv3KeU+vRDRFn8wMTmR+mxz4c36o4WDxF9QfyOhhEtj6XQn6iUhqgS7OXhRhkvsDL+KD7CnaJjHG/hvPx0BTR+bR+rcZVi1OHzuSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760047425; c=relaxed/simple;
	bh=VdbrDBnRuw407eUM1cGjE4TdP1tU6b5L/a2r2dVm2yo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lqvO9Sae8Xl1WPwFHWQd6Pk5JZoRFLMyr3EsWYqktWl64I8qH5A8AO5mn3NVslTurcKi3I6u2m/CiK2ehw7bv939eQnPd+GmsCy/bWGCg2/Ro6VXC5uzqDUpcTzy2p33FA0zd85aZ+7Nw6/kLo+c3PIedHzwj44i1OfUJLh37o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nd3js3x9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD803C4CEF5;
	Thu,  9 Oct 2025 22:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760047424;
	bh=VdbrDBnRuw407eUM1cGjE4TdP1tU6b5L/a2r2dVm2yo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Nd3js3x9H6Sj6EzdFe4btIdQ6XUEFFxsbvfrci8JDS1tq+0yV1wTBYFJyfXdWEjf/
	 gs6R8isUssy4lu938tGThvQAWSa9R3H055mgfiRzWaJYTAMLHLYQXTd3kmmMi3T5oI
	 YJ+6z9/kdTWUAFRTpLmo1P1J+uuJ8f8EyFr+AcokycQdEyxzB5ydWaEngPC/Ak4uKd
	 cqvRXUL5AFokPvzXcLV6R1pRg52jL7I0W+IfE6yyJaLGUpHpX5VoXl/FATKkdRjPD1
	 ZIUFPh9KVumQGo2aTBv5YK4wF+KkITvPy/IqRimdorRJ63KsVsXElTVUi+glaJ642w
	 fXTSzeKfUopYg==
Date: Thu, 09 Oct 2025 17:03:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 "David S. Miller" <davem@davemloft.net>, 
 Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
In-Reply-To: <20251009-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-v1-0-2a34d8d03c72@oss.qualcomm.com>
References: <20251009-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-v1-0-2a34d8d03c72@oss.qualcomm.com>
Message-Id: <176004726840.3398717.5566698340633844509.robh@kernel.org>
Subject: Re: [PATCH 0/5] Add separate ICE UFS and eMMC device nodes for
 QCS615 platform


On Thu, 09 Oct 2025 11:48:50 +0530, Abhinaba Rakshit wrote:
> This patch series introduces support for representing the Inline Crypto Engine (ICE)
> as separate device nodes for both UFS and eMMC on the QCS615 platform.
> Previously, ICE functionality was implicitly tied to the UFS/eMMC controllers.
> With this update, ICE is modeled as an independent hardware block, allowing its
> clock and frequency configuration to be managed directly by the ICE driver.
> This separation improves modularity, aligns with hardware architecture.
> 
> The change allows the MMC/UFS controller to link to the ICE node for
> crypto operations without embedding ICE-specific properties directly
> in the MMC nodes.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
> Abhinaba Rakshit (5):
>       dt-bindings: mmc: add qcom,ice phandle to mmc
>       dt-bindings: crypto: ice: add freq-table-hz property to ICE schema
>       dt-bindings: crypto: ice: document the qcs615 inline crypto engine
>       arm64: dts: qcom: qcs615: add ufs and emmc inline crypto engine nodes
>       dts: qcom: qcs615-ride: Enable ice ufs and emmc
> 
>  .../bindings/crypto/qcom,inline-crypto-engine.yaml |  7 +++
>  .../devicetree/bindings/mmc/sdhci-msm.yaml         |  4 ++
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  8 ++++
>  arch/arm64/boot/dts/qcom/sm6150.dtsi               | 51 +++++++++++++---------
>  4 files changed, 49 insertions(+), 21 deletions(-)
> ---
> base-commit: 47a8d4b89844f5974f634b4189a39d5ccbacd81c
> change-id: 20251006-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-83ebc37bdddc
> 
> Best regards,
> --
> Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
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
 Base: 47a8d4b89844f5974f634b4189a39d5ccbacd81c (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251009-add-separate-ice-ufs-and-emmc-device-nodes-for-qcs615-platform-v1-0-2a34d8d03c72@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000 (qcom,qcs615-ufshc): clock-names: ['core_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk'] is too short
	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000 (qcom,qcs615-ufshc): clocks: [[46, 126], [46, 10], [46, 125], [46, 134], [44, 0], [46, 133], [46, 132]] is too short
	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000 (qcom,qcs615-ufshc): reg: [[0, 30949376, 0, 12288]] is too short
	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000 (qcom,qcs615-ufshc): reg-names: ['std'] is too short
	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000 (qcom,qcs615-ufshc): reg-names: ['std'] is too short
	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ufshc@1d84000 (qcom,qcs615-ufshc): Unevaluated properties are not allowed ('reg-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#






