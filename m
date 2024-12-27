Return-Path: <linux-arm-msm+bounces-43506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E659FD58A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 16:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 198AF1889C9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 15:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE461F754E;
	Fri, 27 Dec 2024 15:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWDZ8i3C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3C31B6CFB;
	Fri, 27 Dec 2024 15:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735312732; cv=none; b=MAr+hffb2zcveG93ZA8upTI3qU2DYy2ONsWFwNaZ2YYT0Pdo68BP/33AIAOJTvJMrPIa/QIbuDUH3AnKq703eDvxuDungtwa5XExVRwJq8UN40d+2PDC5qy0gTt4lLdxa46ST75TVYxrHKoQia6ZtqWl2xfWkK5R4z8i52CO2Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735312732; c=relaxed/simple;
	bh=F6s7hJRFnqwtVpl84yOmcA6diAh5+fNZK0zM5H7eyqs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Gw2V6/jW9MRWZ5cN8dH4B8oJwxC4YiqecqSrJD4tdWkrrSGobgm/QAs1AABRweid6it0rUVRixshR/9LB747pBrN/ovFhyCSnbXeT2Xdymqgsm2y6/Cj77M1/nofe+IwL3P5yF94bsvoy/Vo01l3Ixsdcf5Xm0IqMjPl0gRgvoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWDZ8i3C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF17C4CED0;
	Fri, 27 Dec 2024 15:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735312731;
	bh=F6s7hJRFnqwtVpl84yOmcA6diAh5+fNZK0zM5H7eyqs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=BWDZ8i3CdANnV79TD8EM84ZfwN0Zwea5YPdowKbjMxJrMt8oiows+rIzPaTUbc/ji
	 7NaK1dfG6JqBXsInpl2+sg6gCmONa4jakyaxG8ImXLKcEem1hkGGQdbuWzE4fDIp7W
	 ddTYzTvZ0I8c3W9ZelEAVz84VaoA9pN4vX1beYbukijsCaTwYPmv8vkhT1QGQ2jmgK
	 dxLjdA/i0MOyiHhTTw0cDAAmJT4MzLcU3QJnganUy4KGq+rzRxVyPjZoyWVH6yqXUG
	 6rgvpr+GpD4u3zgbxlud7WQtqeSgMU+JKLJK8I1wCD6WLKmMrT/1ZoYeVhlakPIea1
	 DIoK12JxfphjQ==
Date: Fri, 27 Dec 2024 09:18:49 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org, 
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Eric Dumazet <edumazet@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
To: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
Message-Id: <173531253248.3886388.7160234857723146083.robh@kernel.org>
Subject: Re: [PATCH 0/3] Support tuning the RX sampling swap of the MAC.


On Wed, 25 Dec 2024 18:04:44 +0800, Yijie Yang wrote:
> The Ethernet MAC requires precise sampling times at Rx, but signals on the
> Rx side after transmission on the board may vary due to different hardware
> layouts. The RGMII_CONFIG2_RX_PROG_SWAP can be used to switch the sampling
> occasion between the rising edge and falling edge of the clock to meet the
> sampling requirements. Consequently, the configuration of this bit in the
> Ethernet MAC can vary between boards, even if they are of the same version.
> It should be adjustable rather than simply determined by the version. For
> example, the MAC version is less than 3, but it needs to enable this bit.
> Therefore, this patch set introduces a new flag for each board to control
> whether to open it.
> The dependency patch set detailed below has introduced and enabled an
> Ethernet node that supports 1G speed on qcs615. The current patch set now
> allows tuning of the MAC's RX swap, thereby supporting 10M and 100M speeds.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
> This patch series depends on below patch series:
> https://lore.kernel.org/all/20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com/
> 
> ---
> Yijie Yang (3):
>       dt-bindings: net: stmmac: Tune rx sampling occasion
>       net: stmmac: qcom-ethqos: Enable RX programmable swap on qcs615
>       arm64: dts: qcom: qcs615-ride: Enable RX programmable swap on qcs615-ride
> 
>  .../devicetree/bindings/net/qcom,ethqos.yaml       |  6 ++++
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  1 +
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 36 ++++++++++++----------
>  3 files changed, 27 insertions(+), 16 deletions(-)
> ---
> base-commit: 532900dbb7c1be5c9e6aab322d9af3a583888f25
> change-id: 20241217-support_10m100m-16239916fa12
> prerequisite-message-id: <20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com>
> prerequisite-patch-id: ab55582f3bfce00f051fddd75bb66b2ef5e0677d
> prerequisite-patch-id: 514acd303f0ef816ff6e61e59ecbaaff7f1b06ec
> 
> Best regards,
> --
> Yijie Yang <quic_yijiyang@quicinc.com>
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


New warnings running 'make CHECK_DTBS=y qcom/qcs615-ride.dtb' for 20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com:

arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ethernet@20000: compatible: ['qcom,qcs615-ethqos'] does not contain items matching the given schema
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ethernet@20000: snps,tso: False schema does not allow True
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ethernet@20000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,qcs615-ethqos'] is too short
	'qcom,qcs615-ethqos' is not one of ['qcom,qcs8300-ethqos']
	'qcom,qcs615-ethqos' is not one of ['qcom,qcs404-ethqos', 'qcom,sa8775p-ethqos', 'qcom,sc8280xp-ethqos', 'qcom,sm8150-ethqos']
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: ethernet@20000: Unevaluated properties are not allowed ('compatible', 'max-speed', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'resets', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#






