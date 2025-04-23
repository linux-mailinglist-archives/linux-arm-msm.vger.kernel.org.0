Return-Path: <linux-arm-msm+bounces-55140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E616A98B62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 15:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F1CD3B5B5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3121A5BB2;
	Wed, 23 Apr 2025 13:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ia4rNPu6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787071A5B90;
	Wed, 23 Apr 2025 13:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415465; cv=none; b=r0I7CkZBrK403qFB68DIjef73PypCipFmq8FPC/pNkWEPGWyAZpc6HQdDrEWfg2vdzn7CavNPoW6yWcpcL/VTsnGxG3arWJGe4MDSRJpGcpqjDr/+VAiXkYphgqAl6j6yu2NkUO4Ro2aEyAQTXJG093Icu7+/+tN5ZTBWaHnf54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415465; c=relaxed/simple;
	bh=CALcr2D8P7akt7X7jSYozms1ObYqP8vxtiOzx3BpABE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=TlNPF6gvyl4qah3XaJnrq8JtdpHGpvR7u3K+IlPOzBvp/NJ8ZlOxoEc54AOadS7ET2ODRyH9JQkqPk+zgV+11hjxm2f4h7QKcBMpNrqSAGTpCGX8F8t6Ai3RB0atEKjDOfffY8CPdB01ajjek3aZ+mRWcz6w5MTMwEqWvFvBS5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ia4rNPu6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D999C4CEE2;
	Wed, 23 Apr 2025 13:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745415465;
	bh=CALcr2D8P7akt7X7jSYozms1ObYqP8vxtiOzx3BpABE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ia4rNPu6wUMCMc6HXBm8gsGCWOBlvjrbgsMr9dHWACfFmELVzORAKab/RcVyDH6l9
	 2+DqNqkrSAw6nxdEDMteeWORNkjpkQiP1u/X8nxgRurvXjh/bfFMnA5Xr0uRRb82uW
	 vSnODo/yilJWIPlNusYd9c12LWk4tiYspzeUWOWiuO+BYH8Z6yXNQyVyc3Axk/IaWD
	 m3gh8pLlycWFEBGpxsBV328hK272e372fw4XKqkjtOrvpN3QURPtnSRf+LkMwTShiS
	 mhIr10A+gOBXlDSKyzdWaD133Q6CYXSD/9a4iewjS/Eeoyq4XZisVKo9NSO8IrrAZA
	 uHbgvmQOsl2tQ==
Date: Wed, 23 Apr 2025 08:37:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org, 
 Kyle Deng <quic_chunkaid@quicinc.com>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, 
 kernel@quicinc.com, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
Message-Id: <174541475836.315268.1404586813028809700.robh@kernel.org>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: qcs615: enable remoteprocs -
 ADSP and CDSP


On Wed, 23 Apr 2025 17:17:36 +0800, Lijuan Gao wrote:
> Enable the remote processor PAS loader for QCS615 ADSP and CDSP
> processors. This allows different platforms/architectures to control
> (power on, load firmware, power off) those remote processors while
> abstracting the hardware differences. Additionally, and add a PIL region
> in IMEM so that post mortem debug tools can collect ramdumps.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
> Kyle Deng (1):
>       arm64: dts: qcom: qcs615: Add mproc node for SEMP2P
> 
> Lijuan Gao (5):
>       dt-bindings: remoteproc: qcom,sm8150-pas: Document QCS615 remoteproc
>       dt-bindings: soc: qcom: add qcom,qcs615-imem compatible
>       arm64: dts: qcom: qcs615: Add IMEM and PIL info region
>       arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
>       arm64: dts: qcom: qcs615-ride: enable remoteprocs
> 
>  .../bindings/remoteproc/qcom,sm8150-pas.yaml       |  59 ++++---
>  .../devicetree/bindings/sram/qcom,imem.yaml        |   1 +
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  10 ++
>  arch/arm64/boot/dts/qcom/qcs615.dtsi               | 179 +++++++++++++++++++++
>  4 files changed, 225 insertions(+), 24 deletions(-)
> ---
> base-commit: f660850bc246fef15ba78c81f686860324396628
> change-id: 20250416-add_qcs615_remoteproc_support-61ddab556c4e
> 
> Best regards,
> --
> Lijuan Gao <quic_lijuang@quicinc.com>
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
 Base: using specified base-commit f660850bc246fef15ba78c81f686860324396628

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com:

arch/arm64/boot/dts/qcom/qcs615-ride.dtb: qcom,smp2p-adsp (qcom,smp2p): 'qcom,sleepstate-in', 'qcom,smp2p-rdbg2-in', 'qcom,smp2p-rdbg2-out', 'sleepstate-out' do not match any of the regexes: '^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|wlan-ap-to-wpss|wlan-wpss-to-ap$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: qcom,smp2p-adsp (qcom,smp2p): {'compatible': ['qcom,smp2p'], 'qcom,smem': [443, 429], 'interrupts': [[0, 172, 1]], 'mboxes': [[30, 26]], 'qcom,ipc': [[31, 0, 26]], 'qcom,local-pid': 0, 'qcom,remote-pid': 2, 'master-kernel': {'qcom,entry-name': ['master-kernel'], '#qcom,smem-state-cells': 1, 'phandle': 218}, 'slave-kernel': {'qcom,entry-name': ['slave-kernel'], 'interrupt-controller': True, '#interrupt-cells': 2, 'phandle': 216}, 'sleepstate-out': {'qcom,entry-name': ['sleepstate'], '#qcom,smem-state-cells': 1}, 'qcom,sleepstate-in': {'qcom,entry-name': ['sleepstate_see'], 'interrupt-controller': True, '#interrupt-cells': 2}, 'qcom,smp2p-rdbg2-out': {'qcom,entry-name': ['rdbg'], '#qcom,smem-state-cells': 1}, 'qcom,smp2p-rdbg2-in': {'qcom,entry-name': ['rdbg'], 'interrupt-controller': True, '#interrupt-cells': 2}, '$nodename': ['qcom,smp2p-adsp']} is valid under each of {'required': ['qcom,ipc']}, {'required': ['mboxes']}
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: qcom,smp2p-cdsp (qcom,smp2p): 'qcom,smp2p-rdbg5-in', 'qcom,smp2p-rdbg5-out' do not match any of the regexes: '^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|wlan-ap-to-wpss|wlan-wpss-to-ap$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: qcom,smp2p-cdsp (qcom,smp2p): {'compatible': ['qcom,smp2p'], 'qcom,smem': [94, 432], 'interrupts': [[0, 576, 1]], 'mboxes': [[30, 6]], 'qcom,ipc': [[31, 0, 6]], 'qcom,local-pid': 0, 'qcom,remote-pid': 5, 'master-kernel': {'qcom,entry-name': ['master-kernel'], '#qcom,smem-state-cells': 1, 'phandle': 200}, 'slave-kernel': {'qcom,entry-name': ['slave-kernel'], 'interrupt-controller': True, '#interrupt-cells': 2, 'phandle': 198}, 'qcom,smp2p-rdbg5-out': {'qcom,entry-name': ['rdbg'], '#qcom,smem-state-cells': 1}, 'qcom,smp2p-rdbg5-in': {'qcom,entry-name': ['rdbg'], 'interrupt-controller': True, '#interrupt-cells': 2}, '$nodename': ['qcom,smp2p-cdsp']} is valid under each of {'required': ['qcom,ipc']}, {'required': ['mboxes']}
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: remoteproc-cdsp@8300000 (qcom,qcs615-cdsp-pas): interrupt-names:2: 'ready' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8150-pas.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: remoteproc-cdsp@8300000 (qcom,qcs615-cdsp-pas): interrupt-names:3: 'handover' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8150-pas.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: remoteproc-cdsp@8300000 (qcom,qcs615-cdsp-pas): Unevaluated properties are not allowed ('glink-edge', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8150-pas.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: syscon@17c0000c (syscon): compatible: ['syscon'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: remoteproc-adsp@62400000 (qcom,qcs615-adsp-pas): interrupt-names:2: 'ready' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8150-pas.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: remoteproc-adsp@62400000 (qcom,qcs615-adsp-pas): interrupt-names:3: 'handover' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8150-pas.yaml#
arch/arm64/boot/dts/qcom/qcs615-ride.dtb: remoteproc-adsp@62400000 (qcom,qcs615-adsp-pas): Unevaluated properties are not allowed ('glink-edge', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sm8150-pas.yaml#






