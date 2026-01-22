Return-Path: <linux-arm-msm+bounces-90111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIqcIL+VcWngJgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 04:13:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0D261361
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 04:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4CBD24A35C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 03:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5843A8FEE;
	Thu, 22 Jan 2026 03:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPDlQwl0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D258B3A7F40;
	Thu, 22 Jan 2026 03:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769051407; cv=none; b=CV8LpMPXeE6r0MgGHpuO4FHLHuF0CNRbKOZ412guNRscA9Z6HcnofSoX46OOMt3y8v2VzlkoSQLbjv5qRDgVDkoDwk/CEY6CCmRngPX6rkNiHR+atT0t6z6HxDAqd8jHGBWRDwcWybYLa0farB930I/JaQIzrmj36QemcZis3zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769051407; c=relaxed/simple;
	bh=DurarvbDu40hARizalJNXRkoH/0czexOv+LI0O6+nsQ=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Z4Iuo47EBoQZ1Y4qswSGhbIokkILFIKffQBoqRuV5iSvDNn3df776+P5LwUI0i21y0XmDHrEItlVpQU39CKEbpOOnQqIyoThM+Y3taMepPJFZJNUnbBVJn9tZA9Mb6aDOlvkDfpV8+yUf9rTuiwKCVSQUzIJnD2aZrP86zkBPb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPDlQwl0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1D6C4CEF1;
	Thu, 22 Jan 2026 03:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769051404;
	bh=DurarvbDu40hARizalJNXRkoH/0czexOv+LI0O6+nsQ=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=DPDlQwl0exwRQZJHuGYhkANZRUCOoGJVluYgvOnL9G1lUSCMGMdUXgCAyQolSVdG4
	 ddLT7nQdNmcpw20pyshTBMpXY7xOQkl2ARwgMT8ntzqhHUZ0EON/gCF0yaNqaiqHjl
	 3iqABwz5oBS4WwBmWUr4yBMwnq0TsYO95L57un974sGLKTcKKRAS12HrcoyV9/igct
	 lTXCjquVhlUAN7f1TzVLANze5GSrlN5cP+F7cOMfnctHiblltSjrw3VXQQGW+30Hhk
	 vkMP2HuMeKOdVxoyK2k6mvbDe/8i9liNSebgCUJS9Pi3lkZq/84hq030E36qB5d3rV
	 Y8tUq4+vt0/Mw==
From: Rob Herring <robh@kernel.org>
Date: Wed, 21 Jan 2026 21:10:03 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>, 
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, 
 Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Maulik Shah <maulik.shah@oss.qualcomm.com>, 
 Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260122-upstream_v3_glymur_introduction-v5-0-8ba76c354e9a@oss.qualcomm.com>
References: <20260122-upstream_v3_glymur_introduction-v5-0-8ba76c354e9a@oss.qualcomm.com>
Message-Id: <176905129277.732760.288132061068112927.robh@kernel.org>
Subject: Re: [PATCH v5 0/4] arm64: dts: qcom: Introduce Glymur SoC dtsi and
 Glymur CRD dts
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90111-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,devicetree.org:url,3e04000:email,1b40000:email,0.0.0.0:email,1.12.142.0:email]
X-Rspamd-Queue-Id: 4F0D261361
X-Rspamd-Action: no action


On Thu, 22 Jan 2026 00:05:10 +0530, Pankaj Patil wrote:
> Introduce dt-bindings and initial device tree support for Glymur,
> Qualcomm's next-generation compute SoC and it's associated
> Compute Reference Device (CRD) platform.
> 
> https://www.qualcomm.com/products/mobile/snapdragon/laptops-and-tablets/snapdragon-x2-elite
> https://www.qualcomm.com/news/releases/2025/09/new-snapdragon-x2-elite-extreme-and-snapdragon-x2-elite-are-the-
> 
> The base support enables booting to shell with rootfs on NVMe,
> demonstrating functionality for PCIe and NVMe subsystems.
> DCVS is also enabled, allowing dynamic frequency scaling for the CPUs.
> TSENS (Thermal Sensors) enabled for monitoring SoC temperature and
> thermal management. The platform is capable of booting kernel at EL2
> with kvm-unit tests performed on it for sanity.
> 
> Added dtsi files for the PMIC's enabled PMH0101, PMK8850, PMCX0102,
> SMB2370, PMH0104, PMH0110 along with temp-alarm and GPIO nodeS.
> 
> For CPU compatible naming, there is one discussion which is not specific
> to Glymur, Kaanapali and Glymur use the same Oryon cores.
> https://lore.kernel.org/all/20251119-oryon-binding-v1-1-f79a101b0391@oss.qualcomm.com/
> We've kept the "qcom,oryon" compatible
> 
> Features enabled in this patchset:
> 1. NVMe storage support
> 2. PCIe controller and PCIe PHY
> 3. RPMH Regulators
> 4. Clocks and reset controllers - GCC, TCSRCC, DISPCC, RPMHCC
> 5. Interrupt controller
> 6. TLMM (Top-Level Mode Multiplexer)
> 7. QUP Block
> 8. Reserved memory regions
> 9. PMIC support with regulators
> 10. CPU Power Domains
> 11. TSENS (Thermal Sensors)
> 12. DCVS: CPU DCVS with scmi perf protocol
> 
> Dependencies:
> 
> dt-bindings:
> 1. https://lore.kernel.org/all/20260121-glymur-pmic-mfd-v1-1-2aab4f21e79c@oss.qualcomm.com/
> 2. https://lore.kernel.org/all/20251215-knp-pmic-leds-v3-2-5e583f68b0e5@oss.qualcomm.com/
> 3. https://lore.kernel.org/all/20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com/
> 4. https://lore.kernel.org/all/20260111155234.5829-1-pankaj.patil@oss.qualcomm.com/
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
> Changes in v5:
> - Added opp entries for pcie nodes
> - Dropped qup-memory interconnect from uart nodes
> - Update trip1 type to critical for pmic thermal zones
> - Alignment and newline fixes according to comments
> - Link to v4: https://lore.kernel.org/r/20260112-upstream_v3_glymur_introduction-v4-0-8a0366210e02@oss.qualcomm.com
> 
> Changes in v4:
> - Enabled PCIe SMMU for all 4 PCIe instances
> - Updated dispcc required opps level to "rpmhpd_opp_low_svs"
> - Updated watchdog compatible
> - Renamed gic-its to msi-controller
> - Updated GCC clocks property to 43 from 44
> - Moved cpu-idle-states to domain-idle-states
> - Fixed alignment and zero padding issues according to review comments
> - Dropped glymur-pmics.dtsi
> - Moved pmic thermal zones from board dts to soc dtsi
> - Link to v3: https://lore.kernel.org/r/20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com
> 
> Changes in v3:
> - Enabled system-cache-controller
> - Squashed all initial features to boot to shell with nvme as storage
> - Updated tsens nodes according to comments
> - Merged tcsr and tcsrcc node
> - Addressed review comments
> - Link to v1: https://lore.kernel.org/all/20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com
> 
> Changes in v2:
> - Series was sent erroneously
> - Link to v1: https://lore.kernel.org/r/20250925-v3_glymur_introduction-v1-0-5413a85117c6@oss.qualcomm.com
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> 
> ---
> Pankaj Patil (4):
>       dt-bindings: arm: qcom: Document Glymur SoC and board
>       arm64: defconfig: Enable Glymur configs for boot to shell
>       arm64: dts: qcom: Introduce Glymur base dtsi
>       arm64: dts: qcom: glymur: Enable Glymur CRD board support
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml |    5 +
>  arch/arm64/boot/dts/qcom/Makefile               |    1 +
>  arch/arm64/boot/dts/qcom/glymur-crd.dts         |  601 +++
>  arch/arm64/boot/dts/qcom/glymur.dtsi            | 6122 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmcx0102.dtsi          |  107 +
>  arch/arm64/boot/dts/qcom/pmh0101.dtsi           |   45 +
>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi    |   83 +
>  arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi    |   83 +
>  arch/arm64/boot/dts/qcom/pmk8850.dtsi           |   70 +
>  arch/arm64/boot/dts/qcom/smb2370.dtsi           |   45 +
>  arch/arm64/configs/defconfig                    |    5 +
>  11 files changed, 7167 insertions(+)
> ---
> base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
> change-id: 20251007-upstream_v3_glymur_introduction-5a105b54493d
> prerequisite-message-id: <20260121-glymur-pmic-mfd-v1-1-2aab4f21e79c@oss.qualcomm.com>
> prerequisite-patch-id: bd5a4703a5a7fc530418337680cf1e2ea1518f35
> prerequisite-message-id: <20251215-knp-pmic-leds-v3-0-5e583f68b0e5@oss.qualcomm.com>
> prerequisite-patch-id: 6bbaff642cfd1f1386ff0ccd746739b68cdbeb45
> prerequisite-patch-id: e30603778b23b7f7586b1c01a362e45af7bd0aa3
> prerequisite-message-id: <20260121110828.2267061-1-pankaj.patil@oss.qualcomm.com>
> prerequisite-patch-id: 14469fd166b31b251b98bf25e783ab6f57ddd13a
> 
> Best regards,
> --
> Pankaj Patil <pankaj.patil@oss.qualcomm.com>
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
 Deps: looking for dependencies matching 4 patch-ids
 Deps: Applying prerequisite patch: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Document PMICs present on Glymur
 Deps: Applying prerequisite patch: [PATCH v3 1/2] dt-bindings: leds: leds-qcom-lpg: Add support for PMH0101 PWM
 Deps: Applying prerequisite patch: [PATCH v3 2/2] dt-bindings: leds: qcom,spmi-flash-led: Add PMH0101 compatible
 Deps: Applying prerequisite patch: [PATCH v2] dt-bindings: dma: qcom,gpi: Update max interrupt lines to 16
 Base: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260122-upstream_v3_glymur_introduction-v5-0-8ba76c354e9a@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/glymur-crd.dtb: pci@1bf0000 (qcom,glymur-pcie): compatible:0: 'qcom,pcie-x1e80100' was expected
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml
arch/arm64/boot/dts/qcom/glymur-crd.dtb: pci@1bf0000 (qcom,glymur-pcie): compatible: ['qcom,glymur-pcie', 'qcom,pcie-x1e80100'] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml
arch/arm64/boot/dts/qcom/glymur-crd.dtb: /soc@0/pci@1bf0000: failed to match any schema with compatible: ['qcom,glymur-pcie', 'qcom,pcie-x1e80100']
arch/arm64/boot/dts/qcom/glymur-crd.dtb: pci@1b40000 (qcom,glymur-pcie): compatible:0: 'qcom,pcie-x1e80100' was expected
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml
arch/arm64/boot/dts/qcom/glymur-crd.dtb: pci@1b40000 (qcom,glymur-pcie): compatible: ['qcom,glymur-pcie', 'qcom,pcie-x1e80100'] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml
arch/arm64/boot/dts/qcom/glymur-crd.dtb: /soc@0/pci@1b40000: failed to match any schema with compatible: ['qcom,glymur-pcie', 'qcom,pcie-x1e80100']
arch/arm64/boot/dts/qcom/glymur-crd.dtb: pci@1c00000 (qcom,glymur-pcie): compatible:0: 'qcom,pcie-x1e80100' was expected
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml
arch/arm64/boot/dts/qcom/glymur-crd.dtb: pci@1c00000 (qcom,glymur-pcie): compatible: ['qcom,glymur-pcie', 'qcom,pcie-x1e80100'] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml
arch/arm64/boot/dts/qcom/glymur-crd.dtb: /soc@0/pci@1c00000: failed to match any schema with compatible: ['qcom,glymur-pcie', 'qcom,pcie-x1e80100']
arch/arm64/boot/dts/qcom/glymur-crd.dtb: pci@1b80000 (qcom,glymur-pcie): compatible:0: 'qcom,pcie-x1e80100' was expected
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml
arch/arm64/boot/dts/qcom/glymur-crd.dtb: pci@1b80000 (qcom,glymur-pcie): compatible: ['qcom,glymur-pcie', 'qcom,pcie-x1e80100'] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml
arch/arm64/boot/dts/qcom/glymur-crd.dtb: /soc@0/pci@1b80000: failed to match any schema with compatible: ['qcom,glymur-pcie', 'qcom,pcie-x1e80100']
arch/arm64/boot/dts/qcom/glymur-crd.dtb: mailbox@3e04000 (qcom,glymur-ipcc): compatible:0: 'qcom,glymur-ipcc' is not one of ['qcom,milos-ipcc', 'qcom,qcs8300-ipcc', 'qcom,qdu1000-ipcc', 'qcom,sa8255p-ipcc', 'qcom,sa8775p-ipcc', 'qcom,sar2130p-ipcc', 'qcom,sc7280-ipcc', 'qcom,sc8280xp-ipcc', 'qcom,sdx75-ipcc', 'qcom,sm6350-ipcc', 'qcom,sm6375-ipcc', 'qcom,sm8250-ipcc', 'qcom,sm8350-ipcc', 'qcom,sm8450-ipcc', 'qcom,sm8550-ipcc', 'qcom,sm8650-ipcc', 'qcom,sm8750-ipcc', 'qcom,x1e80100-ipcc']
	from schema $id: http://devicetree.org/schemas/mailbox/qcom-ipcc.yaml
arch/arm64/boot/dts/qcom/glymur-crd.dtb: /soc@0/mailbox@3e04000: failed to match any schema with compatible: ['qcom,glymur-ipcc', 'qcom,ipcc']
arch/arm64/boot/dts/qcom/glymur-crd.dtb: watchdog@17600000 (qcom,apss-wdt-glymur): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,apss-wdt-glymur', 'qcom,kpss-wdt'] is too long
	['qcom,apss-wdt-glymur', 'qcom,kpss-wdt'] is too short
	'qcom,apss-wdt-glymur' is not one of ['qcom,kpss-wdt-ipq4019', 'qcom,apss-wdt-ipq5018', 'qcom,apss-wdt-ipq5332', 'qcom,apss-wdt-ipq5424', 'qcom,apss-wdt-ipq9574', 'qcom,apss-wdt-kaanapali', 'qcom,apss-wdt-msm8226', 'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,apss-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-qcs615', 'qcom,apss-wdt-qcs8300', 'qcom,apss-wdt-sa8255p', 'qcom,apss-wdt-sa8775p', 'qcom,apss-wdt-sc7180', 'qcom,apss-wdt-sc7280', 'qcom,apss-wdt-sc8180x', 'qcom,apss-wdt-sc8280xp', 'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55', 'qcom,apss-wdt-sdx65', 'qcom,apss-wdt-sm6115', 'qcom,apss-wdt-sm6350', 'qcom,apss-wdt-sm8150', 'qcom,apss-wdt-sm8250']
	'qcom,kpss-wdt' was expected
	'qcom,scss-timer' was expected
	'qcom,apss-wdt-glymur' is not one of ['qcom,kpss-wdt-apq8064', 'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
	'qcom,msm-timer' was expected
	'qcom,kpss-timer' was expected
	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml
arch/arm64/boot/dts/qcom/glymur-crd.dtb: /soc@0/watchdog@17600000: failed to match any schema with compatible: ['qcom,apss-wdt-glymur', 'qcom,kpss-wdt']






