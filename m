Return-Path: <linux-arm-msm+bounces-70769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0F7B34DD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 23:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EED33AF460
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 21:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F890284B4E;
	Mon, 25 Aug 2025 21:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qQGskA9Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400C827B335;
	Mon, 25 Aug 2025 21:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756156974; cv=none; b=ctiJrdxX4PN+uGIPM9ONFKWUuHFx6+ZX4yx4P+5GUgxnslW+G4FaEWIzlHrPFPMah3w/EeIIP29iFWipzgs5Cei+bU4CFd+yLFurkqyc4hRl8rM3Z3D8dLRLlmGpQ/GrGyepwrcpjOzOZqgkjWkeg7A3Lt5Yl+Yy1RoOBuKzvLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756156974; c=relaxed/simple;
	bh=+5nmEM33ey/GL8vLyxT9bwaxgy0hBiZbCrpZ8fNWBtE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Q2nTwkT40urL6Bz4OQM+SoJ2EYmDekihDBMwWWz0Qi3gG7ynWVEMsFfXUZMTIm4wuoCHfsKud2Nnm/MsSFRKVEUOUj+hvK+zhSQMk1EaoHjZfVotVdWcIZan0ds/+6wdf8/pxEXLZqSPeTSiwpz0Ri/Yqp38E8MCuOLwhMqsWD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qQGskA9Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC79C4CEED;
	Mon, 25 Aug 2025 21:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756156973;
	bh=+5nmEM33ey/GL8vLyxT9bwaxgy0hBiZbCrpZ8fNWBtE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qQGskA9QIwV8+i91aJTzyJoLJEaf6Aq/BuY4UWdDxSTrZpHYKOwCFBdRrXEm6eDxj
	 9tIgs5qj5UutpuftJ/YCF6QTpDZuJvfMDutsvZwoC4/3gfWWn+wox0ZeyhgO95BVvF
	 w7Idjboo5Bc4+D05zenMk8InhCm+nj+Kz+EDeXdwZCluE5sOflPNnwqUA0y9P/xzx7
	 JLRJle2BRBItZhikdReCZYSJG6IpGBprNXDfQmAiMVwA6tzy8hwhZ0klsDZiqXOpXM
	 gThzamU6gJXlPVUvXpO6CA3/IoJcTGD1+3ImmHsEhEK0IjVHv3jYK8E+5gdlpwaSx1
	 f2aBoGZgkwT1A==
Date: Mon, 25 Aug 2025 16:22:52 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Georgi Djakov <djakov@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Odelu Kukatla <quic_okukatla@quicinc.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
 cros-qcom-dts-watchers@chromium.org
To: Brian Norris <briannorris@chromium.org>
In-Reply-To: <20250823123718.RFC.1.Idebf1d8bd8ff507462fef9dc1ff47e84c01e9b60@changeid>
References: <20250823123718.RFC.1.Idebf1d8bd8ff507462fef9dc1ff47e84c01e9b60@changeid>
Message-Id: <175615562406.578060.1964877608426663266.robh@kernel.org>
Subject: Re: [RFC PATCH] arm64: dts: qcom: sc7280: Drop aggre{1,2}_noc QOS
 clocks on Herobrine


On Sat, 23 Aug 2025 12:37:18 -0700, Brian Norris wrote:
> Ever since these two commits
> 
>   fbd908bb8bc0 ("interconnect: qcom: sc7280: enable QoS configuration")
>   2b5004956aff ("arm64: dts: qcom: sc7280: Add clocks for QOS configuration")
> 
> Herobrine systems fail to boot due to crashes like the following:
> 
> [    0.243171] Kernel panic - not syncing: Asynchronous SError Interrupt
> [    0.243173] CPU: 7 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0 #1 c5464041cff584ced692726af2c4400fa2bde1db
> [    0.243178] Hardware name: Qualcomm Technologies, Inc. sc7280 CRD platform (rev5+) (DT)
> [    0.243180] Call trace:
> [    0.243182]  dump_backtrace+0x104/0x128
> [    0.243194]  show_stack+0x24/0x38
> [    0.243202]  __dump_stack+0x28/0x38
> [    0.243208]  dump_stack_lvl+0x28/0xb8
> [    0.243211]  dump_stack+0x18/0x30
> [    0.243215]  panic+0x134/0x340
> [    0.243219]  nmi_panic+0x48/0x98
> [    0.243227]  arm64_serror_panic+0x6c/0x80
> [    0.243245]  arm64_is_fatal_ras_serror+0xd8/0xe0
> [    0.243261]  do_serror+0x5c/0xa8
> [    0.243265]  el1h_64_error_handler+0x34/0x48
> [    0.243272]  el1h_64_error+0x7c/0x80
> [    0.243285]  regmap_mmio_read+0x5c/0xc0
> [    0.243289]  _regmap_bus_reg_read+0x78/0xf8
> [    0.243296]  regmap_update_bits_base+0xec/0x3a8
> [    0.243300]  qcom_icc_rpmh_probe+0x2d4/0x490
> [    0.243308]  platform_probe+0xb4/0xe0
> [...]
> 
> Specifically, they fail in qcom_icc_set_qos() when trying to write the
> QoS settings for qhm_qup1. Several of the previous nodes (qhm_qspi,
> qhm_qup0, ...) seem to configure without crashing.
> 
> I don't really know what's unique about Herobrine systems vs other
> sc7280 systems that presumably work fine. I'd guess there's some
> conflict with something configured by the boot firmware.
> 
> I'm submitting as an RFC just to get thoughts from people who hopefully
> know better than me what might be going wrong here.
> 
> Fixes: fbd908bb8bc0 ("interconnect: qcom: sc7280: enable QoS configuration")
> Fixes: 2b5004956aff ("arm64: dts: qcom: sc7280: Add clocks for QOS configuration")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> 
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
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
 Base: tags/v6.17-rc1-15-g42feeddbbce6 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250823123718.RFC.1.Idebf1d8bd8ff507462fef9dc1ff47e84c01e9b60@changeid:

arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: interconnect@16e0000 (qcom,sc7280-aggre1-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: interconnect@1700000 (qcom,sc7280-aggre2-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: interconnect@16e0000 (qcom,sc7280-aggre1-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: interconnect@1700000 (qcom,sc7280-aggre2-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: interconnect@16e0000 (qcom,sc7280-aggre1-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: interconnect@1700000 (qcom,sc7280-aggre2-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: interconnect@16e0000 (qcom,sc7280-aggre1-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: interconnect@1700000 (qcom,sc7280-aggre2-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: interconnect@16e0000 (qcom,sc7280-aggre1-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: interconnect@1700000 (qcom,sc7280-aggre2-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: interconnect@16e0000 (qcom,sc7280-aggre1-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: interconnect@1700000 (qcom,sc7280-aggre2-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: interconnect@16e0000 (qcom,sc7280-aggre1-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: interconnect@1700000 (qcom,sc7280-aggre2-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: interconnect@16e0000 (qcom,sc7280-aggre1-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: interconnect@1700000 (qcom,sc7280-aggre2-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: interconnect@16e0000 (qcom,sc7280-aggre1-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: interconnect@1700000 (qcom,sc7280-aggre2-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: interconnect@16e0000 (qcom,sc7280-aggre1-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: interconnect@1700000 (qcom,sc7280-aggre2-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: interconnect@16e0000 (qcom,sc7280-aggre1-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: interconnect@1700000 (qcom,sc7280-aggre2-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: interconnect@16e0000 (qcom,sc7280-aggre1-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: interconnect@1700000 (qcom,sc7280-aggre2-noc): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/interconnect/qcom,sc7280-rpmh.yaml#






