Return-Path: <linux-arm-msm+bounces-4557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B7E811B58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 18:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2ED8281C9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 17:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1256D56B97;
	Wed, 13 Dec 2023 17:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6zv71lL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E788C8534B;
	Wed, 13 Dec 2023 17:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2ACBC433C7;
	Wed, 13 Dec 2023 17:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702489110;
	bh=27cCuNNlr0k/6GtYxt0e4EOa/N1Nghrs6dzqZcWq72Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U6zv71lLi/wR9iYiX5qrn+a4OU/BACTvRrvTGl6CAk6PH1XHmtQSOe2fglpaGlX83
	 zLeyRY8RbYzULmB8XEg02yBHKY65u0R/1FLfOoXD72gdAI0K4BuiqML6PB6Iu91gW6
	 JiOl+RiDCX/li3CIHSJYhwh6YmwiaThWKR6sQF/0aQMZlti+8jndieu6h7cm3KrRZG
	 8E6rrfSYblkT6lAkPwO/YWQ467EPqYyTgyJ4f7nf/nrqhJwJ4aCut3Q/Fx4rA7jb3t
	 zI4uW5IL4ioqqmtY4GDyxDmHyFu13smWcCKPn9hE8i4Yaiseqlhk84VDo50D3gShSd
	 QuYMlzOYqutjg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rDTBk-0007iv-1i;
	Wed, 13 Dec 2023 18:38:28 +0100
Date: Wed, 13 Dec 2023 18:38:28 +0100
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] ARM/arm64: dts: qcom: fix USB wakeup interrupt
 types
Message-ID: <ZXnsFIl9i6Ix-woH@hovoldconsulting.com>
References: <20231120164331.8116-1-johan+linaro@kernel.org>
 <ZXc7KcjF82EgiXWd@hovoldconsulting.com>
 <06354190-b572-46e4-8036-0fae7f15dd15@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06354190-b572-46e4-8036-0fae7f15dd15@quicinc.com>

On Tue, Dec 12, 2023 at 03:00:07PM +0530, Krishna Kurapati PSSNV wrote:
> On 12/11/2023 10:09 PM, Johan Hovold wrote:
> > On Mon, Nov 20, 2023 at 05:43:20PM +0100, Johan Hovold wrote:

> > Konrad reported off-list that the sc8180x patch in this series breaks
> > probe of the dwc3 driver.
> > 
> > Turns out a number of these SoCs were using GIC interrupts for the
> > DP/DM_HS_PHY interrupts despite the fact that the driver tries to
> > reconfigure these as IRQ_TYPE_EDGE_FALLING (which the GIC does not
> > support) to detect disconnect events during suspend.
> > 
> > This is obviously broken and the proper fix is to replace the GIC
> > interrupts with the corresponding PDC interrupts. I believe Konrad is
> > digging out the magic numbers at this moment.
> > 
> > The following patches will need a follow-up fix:
> > 
> >>    ARM: dts: qcom: sdx55: fix USB wakeup interrupt types
> > 
> >>    arm64: dts: qcom: sc8180x: fix USB wakeup interrupt types
> >>    arm64: dts: qcom: sdm670: fix USB wakeup interrupt types
> >>    arm64: dts: qcom: sdm845: fix USB wakeup interrupt types
> >>    arm64: dts: qcom: sm6375: fix USB wakeup interrupt types
> >>    arm64: dts: qcom: sm8150: fix USB wakeup interrupt types

>   If it helps, I tried to dig up the PDC numbers for corresponding 
> GIC_SPI vectors:

Thanks, Krisha, that helps a lot.

I've sent two series (for arm and arm64) based on yours and Konrad's
input:

	https://lore.kernel.org/lkml/20231213173131.29436-1-johan+linaro@kernel.org/
	https://lore.kernel.org/lkml/20231213173403.29544-1-johan+linaro@kernel.org/

> SM8150:
> 
> eud_p0_dpse_int_mx	apps_pdc_irq_out[9]	SYS_apcsQgicSPI[489]
> eud_p0_dmse_int_mx    apps_pdc_irq_out[8]	SYS_apcsQgicSPI[488]
> qmp_usb3_lfps_rxterm_irq apps_pdc_irq_out[6]	SYS_apcsQgicSPI[486]
> usb31_power_event_irq	SYS_apcsQgicSPI[130]
> usb31_hs_phy_irq	SYS_apcsQgicSPI[131]
> 
> interrupts-extended = <&pdc 9 IRQ_TYPE_EDGE_RISING>,
> 			<&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> 			<&pdc 6 IRQ_TYPE_LEVEL_HIGH>,
> 			<&pdc 8 IRQ_TYPE_EDGE_RISING>;
> 
> interrupt-names = "dp_hs_phy_irq", "pwr_event_irq",
> 		"ss_phy_irq", "dm_hs_phy_irq";

Do you have the corresponding numbers also for the second controller on
SM8150? I inferred them from SDM845, but it would good to verify that.

And can someone dig out the corresponding SS PHY interrupt for sc8180x?

Johan

