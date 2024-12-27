Return-Path: <linux-arm-msm+bounces-43507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0BF9FD58E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 16:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CB897A3A11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 15:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8DD01F758E;
	Fri, 27 Dec 2024 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSZJSPXQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5881F7096;
	Fri, 27 Dec 2024 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735312739; cv=none; b=tWCjCzsI9c49lukaAYU1O8/sKCx0E9/2a258p4wX6N6sNuOv0g0+yU9oQsficvzSS//Rriyc9Sx3ir/+zl87dx5+2gKrH7f7ViA1pFT97zUr9Oj0h56Adbbd9lDVOZBtX5QWwoAHic41IVmrs/kJQrdQqI6wr9U5tgY+m80rids=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735312739; c=relaxed/simple;
	bh=gwuhGYsVedKFqdzT87QIJqQH0pn4nOPDNKbrj/M7BVs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=G1rMSfc2VpO6bAjDx3F9w3DknQibbPBvrJbauoYwalPUwMPko4c8xS1o5uYfuf+EXo9Iep+/zQyMFw7KQkE8fqh4zSObLF6mza/3w4kHmcvDOopl7ul2YU9/NzC7P6CmMbpJ4RJCHFOZZ3EEx4HIqBC9sHdtwaRLiesC0su8duY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HSZJSPXQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87E7C4CED0;
	Fri, 27 Dec 2024 15:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735312739;
	bh=gwuhGYsVedKFqdzT87QIJqQH0pn4nOPDNKbrj/M7BVs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=HSZJSPXQa29JFrdBCfZVI+O51G+vlm/jfQLVU1iFSmvAkwdkLodmq4RyqBDhnh6K/
	 /P4zBj8syLPWYq7cwzJSXO4z3ZYIWdxcfvEQE1AMQC8ThwsKPAiyoGyRcK2+NA4Seh
	 d5ZHLIyVEJku78G/c8M/8NACp9GitiS5m19zfWv+h+SEWx7QkoKz3mgDjoaSvXjyIU
	 vSeGJMUYVOToAzV2rArAa1V4zpDlov23PzkCDkrxTJb+49kv0YFDDgs8SD25SE48OU
	 zyOhsCsLlZcRX65FWcM7f7GperACV1PQ73WaEsgTxOkQxczW2skVpnY61vcRGwej6Q
	 K3JwHxniRSoXw==
Date: Fri, 27 Dec 2024 09:18:57 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
To: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <20241226-dts_qcs8300-v2-0-ec8d4fb65cba@quicinc.com>
References: <20241226-dts_qcs8300-v2-0-ec8d4fb65cba@quicinc.com>
Message-Id: <173531253451.3886498.17296022505455922309.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] Enable DPU and Display Port for Qualcomm
 QCS8300-ride platform


On Thu, 26 Dec 2024 18:43:51 +0800, Yongxing Mou wrote:
> This series adds the MDSS, DPU and DPTX0 node on Qualcomm QCS8300 SoC.
> It also enables Display Port on Qualcomm QCS8300-ride platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
> This series depends on following series:
> https://lore.kernel.org/all/20241203-qcs8300_initial_dtsi-v4-2-d7c953484024@quicinc.com/
> https://lore.kernel.org/all/20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com/
> https://lore.kernel.org/all/20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com/
> https://lore.kernel.org/all/20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com/
> https://lore.kernel.org/all/20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com/
> ---
> Changes in v2:Fixed review comments from Konrad, Dmitry and Krzysztof.
> - Reuse eDP PHY and DPU of SA8775 Platform.[Dmitry][Krzysztof]
> - Reuse DisplayPort controller of SM8650.[Dmitry]
> - Correct the regs length, format issues and power-domains.[Konrad]
> - Integrate the dt changes of DPU and DP together.
> - Link to v1: https://lore.kernel.org/all/20241127-dp_dts_qcs8300-v1-0-e3d13dec4233@quicinc.com/
> ~
> 
> ---
> Yongxing Mou (2):
>       arm64: dts: qcom: qcs8300: add display dt nodes for MDSS, DPU, DisplayPort and eDP PHY
>       arm64: dts: qcom: qcs8300-ride: Enable Display Port
> 
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  44 +++++++
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 204 +++++++++++++++++++++++++++++-
>  2 files changed, 247 insertions(+), 1 deletion(-)
> ---
> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> change-id: 20241225-dts_qcs8300-4d4299067306
> prerequisite-message-id: <20241203-qcs8300_initial_dtsi-v4-2-d7c953484024@quicinc.com>
> prerequisite-patch-id: 33f2488a8eb133431f200e17aac743598508dcf3
> prerequisite-patch-id: 7b653ebeaf1ca3f87620ccf7d876e3d1fe496c4a
> prerequisite-patch-id: e1b60af8a64332e5f0ecbd3a4ea2b6e090bd97cf
> prerequisite-patch-id: b823d744d2fb302e2496eaf0cf0c9c66312dcf2a
> prerequisite-message-id: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
> prerequisite-patch-id: 367d9c742fe5087cfa6fb8e7b05ebe9bc78d68f3
> prerequisite-patch-id: ee0513c070ab96e63766d235b38ee53ca9b19181
> prerequisite-patch-id: 970974160bcdc837ccbe5ea3b5dcac582e90bc0d
> prerequisite-patch-id: 5b2bd9cc44a529b0b9e5d73128dca5d2ff9f2f44
> prerequisite-patch-id: 6a0a81242e1d0f051e3102533bf0191615c6e96b
> prerequisite-patch-id: 322540ce6d45c32f813ecef50e5135c6f08d9019
> prerequisite-message-id: <20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com>
> prerequisite-patch-id: 8faad5c6d8ca255935d3e4d317dcbcc32b8261ff
> prerequisite-message-id: <20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com>
> prerequisite-patch-id: 81378ec66ab6e569bd828401c43c4f5af55db32c
> prerequisite-message-id: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
> prerequisite-patch-id: b798711c6a9bd9c4f0b692835865235e78cd2adb
> prerequisite-patch-id: 146c61567c42bf5268d1005f8e9b307ea2af93d9
> prerequisite-patch-id: 3ce5246ad3470d7392df23a52b3c8b8bd1662db6
> prerequisite-patch-id: 2ea89bba3c9c6ba37250ebd947c1d4acedc78a5d
> prerequisite-patch-id: e81de8a09467a49eaeb4af73a0e197e4156ce202
> 
> Best regards,
> --
> Yongxing Mou <quic_yongmou@quicinc.com>
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


New warnings running 'make CHECK_DTBS=y qcom/qcs8300-ride.dtb' for 20241226-dts_qcs8300-v2-0-ec8d4fb65cba@quicinc.com:

arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: efuse@784000: compatible:0: 'qcom,qcs8300-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: efuse@784000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/efuse@784000: failed to match any schema with compatible: ['qcom,qcs8300-qfprom', 'qcom,qfprom']
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: compatible:0: 'qcom,qcs8300-adsp-pas' is not one of ['qcom,sa8775p-adsp-pas', 'qcom,sa8775p-cdsp0-pas', 'qcom,sa8775p-cdsp1-pas', 'qcom,sa8775p-gpdsp0-pas', 'qcom,sa8775p-gpdsp1-pas']
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: compatible: ['qcom,qcs8300-adsp-pas', 'qcom,sa8775p-adsp-pas'] is too long
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@3000000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/remoteproc@3000000: failed to match any schema with compatible: ['qcom,qcs8300-adsp-pas', 'qcom,sa8775p-adsp-pas']
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('phy@aec2a00' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,qcs8300-mdss.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: display-controller@ae01000: clock-names:0: 'nrt_bus' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: display-controller@ae01000: Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: displayport-controller@af54000: reg: [[0, 183844864, 0, 512], [0, 183845376, 0, 512], [0, 183848960, 0, 3072], [0, 183853056, 0, 1024]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: interrupt-controller@b220000: compatible:0: 'qcom,qcs8300-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,qcs8300-pdc', 'qcom,pdc']
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@20c00000: compatible:0: 'qcom,qcs8300-gpdsp-pas' is not one of ['qcom,sa8775p-adsp-pas', 'qcom,sa8775p-cdsp0-pas', 'qcom,sa8775p-cdsp1-pas', 'qcom,sa8775p-gpdsp0-pas', 'qcom,sa8775p-gpdsp1-pas']
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@20c00000: compatible: ['qcom,qcs8300-gpdsp-pas', 'qcom,sa8775p-gpdsp0-pas'] is too long
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@20c00000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/remoteproc@20c00000: failed to match any schema with compatible: ['qcom,qcs8300-gpdsp-pas', 'qcom,sa8775p-gpdsp0-pas']
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@26300000: compatible:0: 'qcom,qcs8300-cdsp-pas' is not one of ['qcom,sa8775p-adsp-pas', 'qcom,sa8775p-cdsp0-pas', 'qcom,sa8775p-cdsp1-pas', 'qcom,sa8775p-gpdsp0-pas', 'qcom,sa8775p-gpdsp1-pas']
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@26300000: compatible: ['qcom,qcs8300-cdsp-pas', 'qcom,sa8775p-cdsp0-pas'] is too long
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: remoteproc@26300000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: /soc@0/remoteproc@26300000: failed to match any schema with compatible: ['qcom,qcs8300-cdsp-pas', 'qcom,sa8775p-cdsp0-pas']






