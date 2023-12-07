Return-Path: <linux-arm-msm+bounces-3749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7148D808D6D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 17:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B3F31F21271
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 16:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EBF1E4BF;
	Thu,  7 Dec 2023 16:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCcs02/9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5453D46BB6;
	Thu,  7 Dec 2023 16:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3D2C433CA;
	Thu,  7 Dec 2023 16:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701966790;
	bh=8rENzAp0p8TNocu2nRhngKa8SFr6isL6RTBVJp6KrZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HCcs02/9Ogdjyp9dN1TdkXfGx1t09VNdtVuisKSk/2MgsrOLpeYKzVj3D+aV97LHX
	 A3fg2Kt+4eRUxoJpfAikLZEZe1B9RFgR1oUsFhgRfKKCz9uAdpCDei+73Kdk7dQfLl
	 c7Uu5wk6hld0DUq53ArASqtQFqJPm3Jc/pAsFh/c5lU8LnEM8tMlEnF8wAb1ty8VQe
	 a/plY608cmUIQ46TGaWwosU31iy0MCsDS1VUJinwiMRN+r5iA5+KZoOHc13xUJD+SP
	 nTjwd2/rH8VbbD4PhCbPYJ+eotlhbrWoMTmMgeEBeRFgSVebMNt1zZXdltX3b4frg9
	 TtMxCobQJmozQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rBHK4-00019F-0o;
	Thu, 07 Dec 2023 17:34:00 +0100
Date: Thu, 7 Dec 2023 17:34:00 +0100
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
Subject: Re: [PATCH v2 2/6] usb: dwc3: qcom: Rename hs_phy_irq to
 qusb2_phy_irq
Message-ID: <ZXHz-HYgVLbgFp2k@hovoldconsulting.com>
References: <20231204100950.28712-1-quic_kriskura@quicinc.com>
 <20231204100950.28712-3-quic_kriskura@quicinc.com>
 <ZXHkpwji_AzXMjfm@hovoldconsulting.com>
 <9d52fa8c-41d1-46a7-be89-5c1c11ca09b4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d52fa8c-41d1-46a7-be89-5c1c11ca09b4@quicinc.com>

On Thu, Dec 07, 2023 at 09:17:32PM +0530, Krishna Kurapati PSSNV wrote:
> On 12/7/2023 8:58 PM, Johan Hovold wrote:

> > Here too you should say something about why this won't break any systems
> > booting using an older devicetree. Specifically, the QUSB2 PHY interrupt
> > has never been armed on any system running mainline as those bits never
> > made it upstream.
> > 
> > So an alternative to this could also be to just drop the QUSB2 PHY
> > interrupt handling from this driver for now. >

> So, are you suggesting that we drop the whole patch ?

No, I meant that an alternative could be to drop the current hs_phy_irq
handling from the driver.

> I assume if the older kernels are using old DT, they would be using an 
> old driver version too right ?

No, and this is part of the devicetree ABI as we discussed the other
week.

You should generally be able to continue booting with an older devicetree
on a newer kernel (even if newer functionality may not be enabled then).

> Is there a case where DT is not updated but driver is ? Because if we
> drop this patch from series, targets with updated DT's would break.

Actually they would not due to the fact that the QUSB2 PHY interrupt is
currently never armed in the PHY (and the interrupts are looked up by
name and are considered optional by the driver).

But simply dropping this patch is not an option here. I'm fine with this
patch as it is, but the reason we can merge it is that those interrupts
are currently not actually used. Otherwise, this would break older
devicetrees.

But this also means, we could consider dropping the current hs_phy_irq
handling altogether.

Hmm. Looking at the qusb2_phy_runtime_suspend() again now I see that the
interrupt is actually armed on runtime suspend, it's just that it is
configured incorrectly and would wakeup immediately if someone ever
exercised this path.

Specifically, the bits that would set those PHY_MODE_USB_HOST_HS modes
(that should never have been merged) never made it upstream so this code
is just dead code currently. I said before I'll look into ripping this
out, but yeah, I'm swamped with work as usual (and it has been sitting
there dead for years so there's no rush).

So to summarise, the QUSB2 wakeup handling is incomplete and broken, so
we won't actually make things worse by renaming the interrupts. If this
was working, we would need to continue supporting the old names, though.

Johan

