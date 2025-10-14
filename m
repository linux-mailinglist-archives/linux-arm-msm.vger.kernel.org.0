Return-Path: <linux-arm-msm+bounces-77205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E9CBD9BCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 15:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3286189DD69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 13:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F41313E0A;
	Tue, 14 Oct 2025 13:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afvaauLz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD48C304BC5;
	Tue, 14 Oct 2025 13:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760448569; cv=none; b=ehqdcIyujdY29Y5wvS2pQ6+KEATq2lCKTIaO24HRO3u6o0NrveuCtQQXlw+TLlq4ape/11loiqYiKpkIorQXmEUCZA6VfBw52eH1Fqqm2ZB46XAKpTG37KU/uwtjz5w5nGJ1lPk/PlFx1G4rDfc0jBiFN9h/fyi2m088qh0E8/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760448569; c=relaxed/simple;
	bh=hc3kwbf2STN0A33JCbqR/U4/0iI1b6WP+A59VPIvBZ4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=eRVUThRlR1cXiv5THk6NLFHOJ/4ROoMBtKqDQbfc+l28/Aa98/ElhKiiyiNjcY+MrP/k05t4Za5bKl048oJQtHKCD34fSngDabkHCse5CKKXnzdSEMN1aIxhx5KrN2b5c9uFLK4qQ7usJSjnG7DnJwvuUujUPLDGyhqUigvD6tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afvaauLz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044EBC4CEE7;
	Tue, 14 Oct 2025 13:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760448569;
	bh=hc3kwbf2STN0A33JCbqR/U4/0iI1b6WP+A59VPIvBZ4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=afvaauLzb7GRoYdi/QZ6GKLJIyMRSO6uQlcnktr5uu4zLAmBTI2O+jQkOuo33imLI
	 MOeJjMGJZ6q5XPP3WGzbxeyIvo/Q7Jg8wDWQzqs+VuYBnbPdmwu27L9cdYfWrPUUuZ
	 I4Xa45E9kCamLdx84n/rqkZczriDSmRb62VX8S2oqxjlxO/EpNZGZ7mi+gV9yQfghr
	 JhLTD83s6SJxF42e7n8D3xfcsR94WSSTiII/Ov0gETPotLftlQ9PlnUxSKNBZWsQce
	 GCLdIQxIBcnosYtzo2HUbkrTKUiwaKCzmCn0twHE6DGC0QxmbrD/hfJht47gk86+Ws
	 pW589eqpsh/sw==
Date: Tue, 14 Oct 2025 08:29:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20251014022121.1850871-1-krishna.kurapati@oss.qualcomm.com>
References: <20251014022121.1850871-1-krishna.kurapati@oss.qualcomm.com>
Message-Id: <176044840201.3094490.10920986485506662870.robh@kernel.org>
Subject: Re: [PATCH 0/2] Modify USB controller nodes for USB on X1E80100


On Tue, 14 Oct 2025 07:51:19 +0530, Krishna Kurapati wrote:
> This series aims to flatten usb dt nodes and use latest bindings.
> While at it, fix a compile time warning on the HS only controller node.
> 
> Tests done:
> 1. On CRD, verified host mode operation of the 3 exposed Type-C ports
> and enumeration of the Goodix fingerprint sensor on the multiport
> usb controller.
> 
> 2. Modified the dr_mode to otg for the first 3 controllers and
> verified role switching and device mode operation on the 3 exposed
> Type-C ports.
> 
> HS only controller was not tested on any platform.
> 
> Krishna Kurapati (2):
>   arm64: dts: qcom: x1e80100: Flatten usb controller nodes
>   arm64: dts: qcom: x1e80100: Fix compile warnings for USB HS controller
> 
>  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi   |  24 +-
>  .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    |  12 +-
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi          |  18 +-
>  arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi   |  18 +-
>  .../boot/dts/qcom/x1-hp-omnibook-x14.dtsi     |  18 +-
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  |  18 +-
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  18 +-
>  .../dts/qcom/x1e80100-asus-vivobook-s15.dts   |  18 +-
>  .../dts/qcom/x1e80100-dell-xps13-9345.dts     |  12 +-
>  .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  18 +-
>  .../dts/qcom/x1e80100-microsoft-romulus.dtsi  |  12 +-
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts     |  18 +-
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi        | 322 ++++++++----------
>  .../dts/qcom/x1p42100-lenovo-thinkbook-16.dts |  24 +-
>  14 files changed, 214 insertions(+), 336 deletions(-)
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
 Base: tags/next-20251013 (exact match)
 Base: tags/next-20251013 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251014022121.1850871-1-krishna.kurapati@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,s
 m8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,
 sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3
 ', 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qco
 m,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qco
 m,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3',
  'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc
 3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,s
 m8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,s
 m8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3',
  'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom
 ,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,
 sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'q
 com,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 
 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qc
 om,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3'
 , 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc
 3', 'qcom,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qcom,sm8550-dwc3',
  'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qc
 om,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: usb@a200000 (qcom,x1e80100-dwc3): interrupt-names: ['dwc_usb3', 'pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: usb@a400000 (qcom,x1e80100-dwc3-mp): compatible:0: 'qcom,x1e80100-dwc3-mp' is not one of ['qcom,ipq4019-dwc3', 'qcom,ipq5018-dwc3', 'qcom,ipq5332-dwc3', 'qcom,ipq5424-dwc3', 'qcom,ipq6018-dwc3', 'qcom,ipq8064-dwc3', 'qcom,ipq8074-dwc3', 'qcom,ipq9574-dwc3', 'qcom,milos-dwc3', 'qcom,msm8953-dwc3', 'qcom,msm8994-dwc3', 'qcom,msm8996-dwc3', 'qcom,msm8998-dwc3', 'qcom,qcm2290-dwc3', 'qcom,qcs404-dwc3', 'qcom,qcs615-dwc3', 'qcom,qcs8300-dwc3', 'qcom,qdu1000-dwc3', 'qcom,sa8775p-dwc3', 'qcom,sar2130p-dwc3', 'qcom,sc7180-dwc3', 'qcom,sc7280-dwc3', 'qcom,sc8180x-dwc3', 'qcom,sc8180x-dwc3-mp', 'qcom,sc8280xp-dwc3', 'qcom,sc8280xp-dwc3-mp', 'qcom,sdm660-dwc3', 'qcom,sdm670-dwc3', 'qcom,sdm845-dwc3', 'qcom,sdx55-dwc3', 'qcom,sdx65-dwc3', 'qcom,sdx75-dwc3', 'qcom,sm4250-dwc3', 'qcom,sm6115-dwc3', 'qcom,sm6125-dwc3', 'qcom,sm6350-dwc3', 'qcom,sm6375-dwc3', 'qcom,sm8150-dwc3', 'qcom,sm8250-dwc3', 'qcom,sm8350-dwc3', 'qcom,sm8450-dwc3', 'qc
 om,sm8550-dwc3', 'qcom,sm8650-dwc3', 'qcom,x1e80100-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#






