Return-Path: <linux-arm-msm+bounces-3746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4A4808CF0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 17:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26B451C20A41
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 16:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515A946544;
	Thu,  7 Dec 2023 16:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgdsO7OI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEFB40BE5;
	Thu,  7 Dec 2023 16:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9396DC433C8;
	Thu,  7 Dec 2023 16:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701965531;
	bh=oDFKU6He3TF2Z/VxsatMVTx0wO+MupzIPTDKqHifMUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mgdsO7OIKFVnsRpXfPzhSFtBbKHmi+fLTH0WyXQIbUw+SmRKpaiHLmHcaQhxMjxng
	 9IHefwqe3Ryh6cPXGecRg3Hubb0SDQ6+CfcPRYxMyquIqGqdF9+dc1Crptxu320g/y
	 L7bSFC0PRGMrGe20aQYp6+X3X8+KuJlVundGC64PrvmFcG9BBJVX5ojLNHrxjMsjIy
	 65Wu5b7SCS6kM/XlzY2FjFsjnDIskG1bAX2I+AuPz+xSdWTJPJkNtp4u39MMeyWE4T
	 +p1VNFAwPB1qdJdm/n6vp6YYGvXOiIxbvB6s087lgX3gV8dzUcg/nBw/iSDI+oYRN3
	 YDxGY6xtqQcUw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rBGzl-00011w-1k;
	Thu, 07 Dec 2023 17:13:01 +0100
Date: Thu, 7 Dec 2023 17:13:01 +0100
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
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
Subject: Re: [PATCH v2 1/6] dt-bindings: usb: dwc3: Clean up hs_phy_irq in
 bindings
Message-ID: <ZXHvDaeoG1SuZ9xj@hovoldconsulting.com>
References: <20231204100950.28712-1-quic_kriskura@quicinc.com>
 <20231204100950.28712-2-quic_kriskura@quicinc.com>
 <ZXHjXGEbdtbCiOck@hovoldconsulting.com>
 <028097f3-9056-4c07-a868-4eeac9bc8c94@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <028097f3-9056-4c07-a868-4eeac9bc8c94@quicinc.com>

On Thu, Dec 07, 2023 at 09:14:55PM +0530, Krishna Kurapati PSSNV wrote:
 
> >> +        - qusb2_phy:: SoCs with QUSB2 PHY do not have separate DP/DM IRQs and
> >> +                      expose only a single IRQ whose behavior can be modified
> >> +                      by the QUSB2PHY_INTR_CTRL register. The required DPSE/
> >> +                      DMSE configuration is done in QUSB2PHY_INTR_CTRL register
> >> +                      of phy address space.
> >> +        - {dp/dm}_hs_phy_irq:: These IRQ's directly reflect changes on the DP/
> >> +                               DM pads of the SoC. These are used for wakeup
> >> +                               only on SoCs with non-QUSBb2 targets with
> > 
> > QUSB2 typo
> > 
> >> +                               exception of SDM670/SDM845/SM6350.
> >> +        - ss_phy_irq:: When in super speed mode of operation, interrupts are
> > 
> > Capitalise 'Super Speed'
> > 
> >> +                       received when a wakeup event is received on ss_phy_irq.
> > 
> > The description as it stands sounds circular. And this one is only used
> > for remote wakeup right?
> > 
> Yes. It is used for remote wakeup. Mentioning it as wakeup event should 
> be changed ?

It would be good to clarify that this one is the IIUC not used for
connect/disconnect events but just for remote wakeup, that is, unlike
the qusb2_phy and dp/dm_hs_phy interrupts.

The old descriptions just vaguely said "wakeup event" and
connect/disconnect events aren't necessarily wakeup events.

> > Also have you set up the tools so that you can verify your bindings
> > before posing them? I assume the above wouldn't pass (e.g. due to the
> > "(optional)" strings).
> > 
> > There's some more details here:
> > 
> > 	https://docs.kernel.org/devicetree/bindings/writing-schema.html
> > 
> > under "Running checks".
> 
> I did do a dt-binding check and got the following line as well:
> 
>    DTC_CHK Documentation/devicetree/bindings/usb/qcom,dwc3.example.dtb
> /local/mnt/workspace/sriramd/upstream/torvalds/linux/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dtb: 
> usb@a6f8800: interrupt-names:4: 'ss_phy_irq (optional)' was expected
>          From schema:

Good that you got that set up.

Johan

