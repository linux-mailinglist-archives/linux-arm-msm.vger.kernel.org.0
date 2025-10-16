Return-Path: <linux-arm-msm+bounces-77575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C1972BE3462
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 14:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B46D74EC70A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 12:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D088132D43B;
	Thu, 16 Oct 2025 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LaJ4N0Ns"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A476732D434;
	Thu, 16 Oct 2025 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760616714; cv=none; b=Y7Y3HcAGQYRiELy6hFXTO7N07Vc1/QWXcIgxL/m/NPxxKRZL6YIo0EeFjMPS4TiXoXKln/4M7prtD45CamPXLTRS+rICZ9Ot7CAdt5HzbBF3LjxiQHf0WEdyfwV64D2KYW1IovQHfTm8udqOi9afi9qd1N0UuABE3yQP6bQQ3nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760616714; c=relaxed/simple;
	bh=ZXNk4YglJtvzFZyiYMePoPZbDD+4ywlWfdCuaIVrXLk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=EZsuYtfKUdSsPo/h0q7g3FauZXO/+zXubA4U4UPCdJqHWpziDm3pBjdEFdY+6DrMzLy2EeHLZSpWJGe0n/jgdSWUuN2wxujQx/bgjUggrZEBqqdSZEaQHIaXxN1TrVa1e9MfC36619cutMp0pek4OTXnhgHAXppMxfYFeyIzWi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LaJ4N0Ns; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFCBC116B1;
	Thu, 16 Oct 2025 12:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760616714;
	bh=ZXNk4YglJtvzFZyiYMePoPZbDD+4ywlWfdCuaIVrXLk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=LaJ4N0Ns+egy+9FtsEzZBQVa+jaCC3CW9cay5EwU3Q9gFJaSP3FgujE1tsvtQJvtg
	 zoG+gCqlQQ8s7AVoJrXQbAxm+U0yks7kEL7nMQWW/t/UQmmcMjxAl5WcPucMgHMr+n
	 icOX9a8K1RW58ERywvJqoHQduvcBwnJ42ZDsrs/BT123ybTYMOBjGP/+i9m1mvPera
	 9TTcKRi4zYQtKaHFcqGjRzm07EJUubGBso+yUtqMABabGUQ2+Tib+0TyZX/McZex9F
	 si3SUELRFEc90RgNCenBcKA21uwfpaEymkSFQfrYcC/LCqh2LB2poxZO/Gc02d0bWh
	 FITTHFpi9xf+A==
Date: Thu, 16 Oct 2025 07:11:52 -0500
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
 Wesley Cheng <quic_wcheng@quicinc.com>, nfraprado@collabora.com, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Nishanth Menon <nm@ti.com>, 
 Melody Olvera <melody.olvera@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
To: Krishna Kurapati PSSNV <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <fac1a1a1-43a9-4bec-a6be-812e7d97e807@oss.qualcomm.com>
References: <20251015105231.2819727-1-krishna.kurapati@oss.qualcomm.com>
 <20251015105231.2819727-2-krishna.kurapati@oss.qualcomm.com>
 <80c71cfd-e12a-4707-ad03-e03b0ac48838@oss.qualcomm.com>
 <fac1a1a1-43a9-4bec-a6be-812e7d97e807@oss.qualcomm.com>
Message-Id: <176061621332.2563222.17561073478578680773.robh@kernel.org>
Subject: Re: [PATCH v7 1/4] arm64: dts: qcom: sm8750: Add USB support to
 SM8750 SoCs


On Thu, 16 Oct 2025 13:21:19 +0530, Krishna Kurapati PSSNV wrote:
> 
> 
> On 10/16/2025 12:59 PM, Konrad Dybcio wrote:
> > On 10/15/25 12:52 PM, Krishna Kurapati wrote:
> >> From: Wesley Cheng <quic_wcheng@quicinc.com>
> >>
> >> Add the base USB devicetree definitions for SM8750 platforms.  The overall
> >> chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
> >> (rev. v8) and M31 eUSB2 PHY.  The major difference for SM8750 is the
> >> transition to using the M31 eUSB2 PHY compared to previous SoCs.
> >>
> >> Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
> >> PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.
> >>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> >> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> >> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> >> ---
> >
> > [...]
> >
> >> +		usb_1: usb@a6f8800 {
> >> +			compatible = "qcom,sm8750-dwc3", "qcom,dwc3";
> >> +			reg = <0x0 0x0a6f8800 0x0 0x400>;
> >
> > Please resend this using the flattened model
> >
> 
> Hi Konrad,
> 
>   I didn't want to disturb an ACKed series and hence I just tested and
> resent the patches as it. I will flatten it out once this is merged.
> Hope that would be fine.
> 
> Regards,
> Krishna,
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
 Base: tags/v6.18-rc1 (exact match)
 Base: tags/v6.18-rc1 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for fac1a1a1-43a9-4bec-a6be-812e7d97e807@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clock-names: ['cfg_noc', 'core', 'iface', 'sleep', 'mock_utmi'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clocks: [[36, 11], [36, 156], [36, 3], [36, 161], [36, 158]] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clock-names: ['cfg_noc', 'core', 'iface', 'sleep', 'mock_utmi'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clocks: [[36, 11], [36, 156], [36, 3], [36, 161], [36, 158]] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#






