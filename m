Return-Path: <linux-arm-msm+bounces-1708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF557F611A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 15:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07A28B212DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 14:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B244A2F878;
	Thu, 23 Nov 2023 14:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmJclWsN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2AE25574;
	Thu, 23 Nov 2023 14:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB586C433C8;
	Thu, 23 Nov 2023 14:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700748624;
	bh=/bWFQ4N/SZVD3lkJ8hFU61wZaZzFy0Eh+DF7PZpyN60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jmJclWsNN8+MbXNXEpB/y3Ja7MjWIPlJnhva92TOcXsIjY5RXgFUIFpSu0rk5/wxx
	 zSVWMn9rOuDzq5VNDFoP+AMh4wPYnAUD1AYyqKyL8UeRhPECBB3Iy0UfB8xUEY0BGq
	 hXf4U1selniFGco61iHTJM+Q784IIjXFQ4RjHmKXqQc6TV52mi/7N3zH9+AQDRg7YZ
	 M+4wfkiGwoEeSZdIxcgQsJw50nelrsEqIQJqL68f7rbnJSoTH5iEoq2n1msiZFOCd7
	 3Ug3diljOuFHP0Bz4nwqhA725R6t29m2pc1KKv57dfloIDzyneT8j1JttmAyu3NWNL
	 CVjRoQ4+yhs8Q==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r6APi-000555-0P;
	Thu, 23 Nov 2023 15:10:42 +0100
Date: Thu, 23 Nov 2023 15:10:42 +0100
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, quic_wcheng@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Subject: Re: [PATCH 1/6] dt-bindings: usb: dwc3: Clean up hs_phy_irq in
 bindings
Message-ID: <ZV9dYpTYRXn63tXe@hovoldconsulting.com>
References: <20231122191335.3058-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122191335.3058-1-quic_kriskura@quicinc.com>

On Thu, Nov 23, 2023 at 12:43:35AM +0530, Krishna Kurapati wrote:
> The high speed related interrupts present on QC targets are as follows:
> 
> dp/dm Irq's
> These IRQ's directly reflect changes on the DP/DM pads of the SoC. These
> are used as wakeup interrupts only on SoCs with non-QUSBb2 targets with
> exception of SDM670/SDM845/SM6350.
> 
> qusb2_phy irq
> SoCs with QUSB2 PHY do not have separate DP/DM IRQs and expose only a
> single IRQ whose behavior can be modified by the QUSB2PHY_INTR_CTRL
> register. The required DPSE/DMSE configuration is done in
> QUSB2PHY_INTR_CTRL register of phy address space.
> 
> hs_phy_irq
> This is completely different from the above two and is present on all
> targets with exception of a few IPQ ones. The interrupt is not enabled by
> default and its functionality is mutually exclusive of qusb2_phy on QUSB
> targets and DP/DM on femto phy targets.
> 
> The DTs of several QUSB2 PHY based SoCs incorrectly define "hs_phy_irq"
> when they should have been "qusb2_phy_irq". On Femto phy targets, the
> "hs_phy_irq" mentioned is either the actual "hs_phy_irq" or "pwr_event",
> neither of which would never be triggered directly are non-functional
> currently. The implementation tries to clean up this issue by addressing
> the discrepencies involved and fixing the hs_phy_irq's in respective DT's.

Thanks for sorting this out.

It seems like we have a few combinations of these interrupts and we
should probably try to define the order for these once and for all and
update the current devicetrees to match (even if it means adding new
interrupts in the middle).

Instead of adding separate compatibles for the controllers without SS
support, I suggest keeping that interrupt last as an optional one.

But IIUC we essentially have something like:

qusb2-:

	- const: qusb2_phy
	- const: pwr_event
	- const: ss_phy_irq	(optional)

qusb2:

	- const: hs_phy_irq
	- const: qusb2_phy
	- const: pwr_event
	- const: ss_phy_irq	(optional)

qusb2+:

	- const: hs_phy_irq
	- const: qusb2_phy
	- const: dp_hs_phy_irq
	- const: dm_hs_phy_irq
	- const: pwr_event
	- const: ss_phy_irq	(optional)

femto-:
	- const: dp_hs_phy_irq
	- const: dm_hs_phy_irq
	- const: pwr_event
	- const: ss_phy_irq	(optional)

femto:
	- const: hs_phy_irq
	- const: dp_hs_phy_irq
	- const: dm_hs_phy_irq
	- const: pwr_event
	- const: ss_phy_irq	(optional)

Does this look like it would cover all of our currents SoCs?

Do all of them have the pwr_event interrupt?

Note that DP comes before DM above as that seems like the natural order
of these (plus before minus).

Now if the HS interrupt is truly unusable, I guess we can consider
dropping it throughout and the above becomes just three permutations
instead, which can even be expressed along the lines of:

	- anyOf:
	  - items:
	    - const: qusb2_phy
	  - items:
	    - const: dp_hs_phy_irq
	    - const: dm_hs_phy_irq
	- const: pwr_event
	- const: ss_phy_irq	(optional)

Johan

