Return-Path: <linux-arm-msm+bounces-78605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D32C0190F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 15:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFA0B3AAC36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1C830CDA9;
	Thu, 23 Oct 2025 13:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mhi7z7SM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D000309DA0;
	Thu, 23 Oct 2025 13:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761227515; cv=none; b=aNmNyQKf+hkSXaWZi8Gk3BG28fil/Xl4tjr00+IUnzNZERUc86tPiqaw4sgcFlRUdHANGeprUWpZIx9uhLQESAeiOqR0/PlC9Slm+bg/DmQvQ1XgFKLBlLHB5ZdWFiWHuNbs4HW50OAJJIAQqevfXTuHR5XJ+2Di9Y3wuRxY9SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761227515; c=relaxed/simple;
	bh=sMS1bB1kvZStN3PnuknRJAFqV2WBA0nPK4ke8KvoOU0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=h1dQ14QO5GVuIS26swD/JsTlJzaWBcHEmkrZuSPtVS0CQR2pepYBPFkAV+jRbv5l2qogph67q/lQOUTngQr08jlO6lSbCtawoYacpNvDUPTJShHBhYfDTBo06YyXdBiaRtZrPlfxf2j2sCmjuncsDDLbJ32RWx6Tzciwmd+m+dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mhi7z7SM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74577C4CEE7;
	Thu, 23 Oct 2025 13:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761227514;
	bh=sMS1bB1kvZStN3PnuknRJAFqV2WBA0nPK4ke8KvoOU0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=mhi7z7SM+JBeSJ5R3vvG0rWB86SUfXm3UcCm+b49/ivGLORjdXpjZUvGDy8jL3OoR
	 GH4IMiQLzw+JtIBpeToGAGRuAvtCVqJ0IgLtd8nbflBTwfKVDBbzkbU7Po+rfaE0r6
	 2+xQ+IprJbNE7BNd8dBGTZWqwdcpAv1nkmoJ+goDTcCBJaDt929mrcFMjmik3AYzXS
	 u1LlrSm7BHBM1pbSU5umybTaKfywMKSD/naxkKu06kiHTg90vtHgHuD1txn6Ihfewj
	 NOtW1JxLTL+Iz1482C+oL/P+BrQssKk7VtBQHvVXliYysu8c8qL+Gvvv9ZMGKtOnwS
	 CnP7vNDNCN4LA==
Date: Thu, 23 Oct 2025 08:51:52 -0500
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
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20251022084052.218043-1-krishna.kurapati@oss.qualcomm.com>
References: <20251022084052.218043-1-krishna.kurapati@oss.qualcomm.com>
Message-Id: <176122700560.2723198.8931067346416497101.robh@kernel.org>
Subject: Re: [PATCH v8 0/3] Introduce USB DT support for SM8750


On Wed, 22 Oct 2025 14:10:49 +0530, Krishna Kurapati wrote:
> Add support for the PHYs and controllers used for USB on SM8750 SoCs.
> 
> Version-6 of this series has all the binding/driver/dt patches acked.
> But only the phy changes have been merged.
> 
> Version 7 was a rebase to get acked patches merged. But comments came
> in to use flattened bindings.
> 
> The v8 for usb patch has been split and sent out separately [1].
> 
> Cover letter heading has been modified to remove phy context.
> 
> Defconfig patch has been resent by Jingyi on [2].
> 
> [1]: https://lore.kernel.org/all/20251021050954.3462613-1-krishna.kurapati@oss.qualcomm.com/
> [2]: https://lore.kernel.org/all/20251021-knp-usb-v2-4-a2809fffcfab@oss.qualcomm.com/
> 
> ---
> Changes in v8:
> - Using Flattened DT representation.
> - Removed obtained RB tags since the code has changed significantly.
> - Modified Author mail address from quicinc to oss.qualcomm.com
> - Link to v7: https://lore.kernel.org/all/20251015105231.2819727-1-krishna.kurapati@oss.qualcomm.com/
> 
> Changes in v7:
> - Rebased on top of linux next
> - Split usb patch and sent out separately.
> - Link to v6: https://lore.kernel.org/all/20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com/
> 
> Changes in v6:
> - Change readl_relaxed/writel_relaxed calls to just readl/writel in the readback function
> - Updated languange in the defconfig commit to specify SM8750 as a Qualcomm SoC
> - Link to v5: https://lore.kernel.org/r/20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com
> 
> Changes in v5:
> - Removed refclk_src from the QMP PHY driver as that is no longer used.
> - The decision to move the TCSR clkref property from controller --> phy
> node was made in v4, and the refclk_src was a lingering change that was
> meant to be removed.  CXO is the parent clock for TCSR clkref, so CXO
> clk will be voted for as well.
> - Relocate the SM8750 compatible within the qcom,dwc3 bindings.  This is
> to take into account the change in clock list.
> - Link to v4: https://lore.kernel.org/r/20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com
> 
> Changes in v4:
> - Made some fixups to the M31 eUSB2 driver
> - Moved TCSR refclk_en to the QMP PHY DT node
> - Link to v3: https://lore.kernel.org/r/20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com
> 
> Changes in v3:
> - Split platform DTs into separate commits.
> - Fixed up M31 eUSB2 PHY driver with feedback received.
> - Reordered DT properties based on feedback.
> - Rewrote commit message for enabling EUSB driver.
> - Link to v2: https://lore.kernel.org/r/20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com
> 
> Changes in v2:
> - Added new QMP PHY register definitions for v8 based QMP phys.
> - Made changes to clean up some code in the M31 eUSB2 PHY driver based
> on feedback received.
> - Added bulk regulator operations in M31 eUSB2 PHY, to ensure that
> both the vdd and vdda12 regulators are properly voted for.
> - Removed external references to other dt bindings in M31 example for
> the DT bindings change.
> - Split DT patches between SoC and plaform changes, as well as the
> PHY subsystem Kconfig changes when introducing the M31 eUSB2 PHY.
> - Added orientation switch and port definitions in the DT changes.EDITME: describe what is new in this series revision.
> - Link to v1: https://lore.kernel.org/r/20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com
> 
> Wesley Cheng (3):
>   arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs
>   arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP platform
>   arm64: dts: qcom: sm8750: Add USB support for SM8750 QRD platform
> 
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts |  22 ++++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts |  22 ++++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi    | 158 ++++++++++++++++++++++++
>  3 files changed, 202 insertions(+)
> 
> --
> 2.34.1
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
 Base: tags/v6.17-10290-g67e1b0052f6b (exact match)
 Base: tags/v6.17-10290-g67e1b0052f6b (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251022084052.218043-1-krishna.kurapati@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: usb@a600000 (qcom,sm8750-dwc3): compatible:0: 'qcom,sm8750-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3', 'qcom,sm865
 0-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: usb@a600000 (qcom,sm8750-dwc3): compatible:0: 'qcom,sm8750-dwc3' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3', 'qcom,sm865
 0-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml






