Return-Path: <linux-arm-msm+bounces-3732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BBB808B16
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 15:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56E4A1C20A91
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 14:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FBC4436B;
	Thu,  7 Dec 2023 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HAeke04R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2DE41C88;
	Thu,  7 Dec 2023 14:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF562C433CA;
	Thu,  7 Dec 2023 14:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701960783;
	bh=mz3CTM06zZ00I601O+2CjhckI+2+PyBKpVHj/pfINUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HAeke04RAgpKG+7kiqstjVxdiaIWQU5vESnHB1sCh1BgtiQ+Z/fmSoQpiZuu+ainR
	 dYt39Akt3+8z7R3b0BKdIgOPoEtV4DLxo6ayMOZj8U9Y8rss2L/1vnWIpiCdVGrTOV
	 R3UW4xchXyfGJaiyxmXNHsHRJP4ODZa139j/Xvn4b2K2JloKyYNT22R+n0GyAgCgNX
	 OkU59sdQLdy/ZsrLDk/yUaHIG84rn2w2bxW7xCNRDxXS7lXoYs/eLFZv84RWdHhiUW
	 z49J9hyOlzh8a1DgvFBwaZqYdpXwkc7jq/C5oOdSLZd1M2aGWfkk26dywWt4YPlzDV
	 +mexkgy9oQSlA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rBFlB-0000hI-0F;
	Thu, 07 Dec 2023 15:53:53 +0100
Date: Thu, 7 Dec 2023 15:53:53 +0100
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, quic_ppratap@quicinc.com,
	quic_jackp@quicinc.com
Subject: Re: [PATCH v2 0/6] Refine USB interrupt vectors on Qualcomm platforms
Message-ID: <ZXHcgZLGCScLVg1O@hovoldconsulting.com>
References: <20231204100950.28712-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204100950.28712-1-quic_kriskura@quicinc.com>

On Mon, Dec 04, 2023 at 03:39:44PM +0530, Krishna Kurapati wrote:
> Qualcomm targets define the following interrupts for usb wakeup:
> {dp/dm}_hs_phy_irq, hs_phy_irq, pwr_event, ss_phy_irq.
> 
> But QUSB2 Phy based targets have another interrupt which gets triggered
> in response to J/K states on dp/dm pads. Its functionality is replaced
> by dp/dm interrupts on Femto/m31/eusb2 phy based targets for wakeup
> purposes. Exceptions are some targets like SDM845/SDM670/SM6350 where
> dp/dm irq's are used although they are qusb2 phy targets.
> 
> Currently in QUSB2 Phy based DT's, te qusb2_phy interrupt is named and
> used as "hs_phy_irq" when in fact it is a different interrupt (used by
> HW validation folks for debug purposes and not used on any downstream
> target qusb/non-qusb).
> 
> On some non-QUSB2 targets (like sm8450/sm8550), the pwr_event IRQ was
> named as hs_phy_irq and actual pwr_event_irq was skipped.
> 
> This series tries to address the discrepancies in the interrupt numbering
> adding the missing interrupts and correcting the existing ones.
> 
> This series has been compared with downstream counter part and hw specifics
> to ensure the numbering is right. Since there is not functionality change
> the code has been only compile tested.

This is a good summary.

> Changes in v2:
> Removed additional compatibles added for different targets in v1.
> Specified permuations of interrupts possible for QC targets and regrouped
> interrupts for most of the DT's.
> 
> Rebased on top of wakeup interrupts fixes by Johan Hovold:
> https://patchwork.kernel.org/project/linux-arm-msm/cover/20231120164331.8116-1-johan+linaro@kernel.org/
> 
> Link to v1: (providing patchwork link since threading was broken in v1)
> https://patchwork.kernel.org/project/linux-arm-msm/cover/20231122191259.3021-1-quic_kriskura@quicinc.com/
> 
> Krishna Kurapati (6):
>   dt-bindings: usb: dwc3: Clean up hs_phy_irq in bindings
>   usb: dwc3: qcom: Rename hs_phy_irq to qusb2_phy_irq
>   arm64: dts: qcom: Fix hs_phy_irq for QUSB2 targets
>   arm64: dts: qcom: Fix hs_phy_irq for non-QUSB2 targets
>   arm64: dts: qcom: Fix hs_phy_irq for SDM670/SDM845/SM6350
>   arm64: dts: qcom: Add missing interrupts for qcs404/ipq5332

You're still mixing USB binding/driver and DT updates, which is what we
want for most subsystems, but not for USB.

For the next version, please split it in two series as these will go in
through two different maintainer trees.

You can link to the driver/binding series from the devicetree series and
mention to Bjorn that it should not be merged before the bindings are
in.

And please use lore for any links instead of patchwork.

Johan

