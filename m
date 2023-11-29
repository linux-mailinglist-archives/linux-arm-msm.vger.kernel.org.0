Return-Path: <linux-arm-msm+bounces-2402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2207FD3CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 11:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC4DD2832D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 10:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257AD19BB0;
	Wed, 29 Nov 2023 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BF8Tahui"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10B618E1C;
	Wed, 29 Nov 2023 10:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F56BC433C7;
	Wed, 29 Nov 2023 10:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701252935;
	bh=JIW2OirXTApjwyolVUz9Ub+E7Cetzf3+IQG2YeVowG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BF8TahuiCgez+z6/m6oDfl+BxEdno1sKTnxohooFcvBXyeyDeLg/goIEc9V+HBG2r
	 QM6tXI7aQA3dg/LiySiDRzj+W/sScenxnQqbIO7+HoYijyFU88dRqZmWo3MWe5cmpR
	 kCcGMZtdkNnRdP+YxSApgerzNILho1HpeB8z+XClyfI+wBQR69xLOk4Uxf+ehnCMTg
	 qBmJY1bf5zgIqoZnq0zIyAPLVcm4zRxF2S//k/y+2vUY0UjpH19uqbSogMoIopMAkD
	 /SambyhuefwQb4fzgg+c4o7o0UalmZM+VF+wNLaOh2axpMZ2kUocphpAGWXEYf0uQV
	 gOkhQ/mg8COiQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r8Hbw-0002yj-20;
	Wed, 29 Nov 2023 11:16:04 +0100
Date: Wed, 29 Nov 2023 11:16:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
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
Message-ID: <ZWcPZPX-eT-xHAOv@hovoldconsulting.com>
References: <20231122191335.3058-1-quic_kriskura@quicinc.com>
 <ZV9dYpTYRXn63tXe@hovoldconsulting.com>
 <1192d91f-11bf-44af-953a-14e08e2b6ca8@quicinc.com>
 <ZWCpGdJRexnk98IN@hovoldconsulting.com>
 <004ddc69-1566-4de4-b260-0fca96a9395f@quicinc.com>
 <ZWW_FOAKp95Cf9vN@hovoldconsulting.com>
 <18965bb9-7afa-4892-8b71-981ba29d2cd4@quicinc.com>
 <ZWXHrvUDnF2dMk6r@hovoldconsulting.com>
 <6d7527bf-8c1a-49b5-a0cf-99a92098c971@quicinc.com>
 <c8a28c72-5c0a-4a67-a4c9-e46a5716cda4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8a28c72-5c0a-4a67-a4c9-e46a5716cda4@linaro.org>

On Wed, Nov 29, 2023 at 10:28:25AM +0100, Krzysztof Kozlowski wrote:
> On 28/11/2023 12:32, Krishna Kurapati PSSNV wrote:
> > 
> >>
> >> So back to my initial proposal, with a slight modification moving
> >> pwr_event first (e.g. as it is not a wakeup interrupt):
> >>
> >> qusb2-:
> >>
> >> 	- const: pwr_event
> >> 	- const: qusb2_phy
> >> 	- const: ss_phy_irq	(optional)
> >>
> >> qusb2:
> >>
> >> 	- const: pwr_event
> >> 	- const: hs_phy_irq
> >> 	- const: qusb2_phy
> >> 	- const: ss_phy_irq	(optional)
> >>
> >> femto-:
> >> 	- const: pwr_event
> >> 	- const: dp_hs_phy_irq
> >> 	- const: dm_hs_phy_irq
> >> 	- const: ss_phy_irq	(optional)
> >>
> >> femto:
> >> 	- const: pwr_event
> >> 	- const: hs_phy_irq
> >> 	- const: dp_hs_phy_irq
> >> 	- const: dm_hs_phy_irq
> >> 	- const: ss_phy_irq	(optional)
> 
> I did not follow entire thread and I do not know whether you change the
> order in existing bindings, but just in case: the entries in existing
> bindings cannot change the order. That's a strict ABI requirement
> recently also discussed with Bjorn, because we want to have stable DTB
> for laptop platforms. If my comment is not relevant, then please ignore.

Your comment is relevant, but I'm not sure I agree.

The Qualcomm bindings are a complete mess of DT snippets copied from
vendor trees and which have not been sanitised properly before being
merged upstream (partly due to there not being any public documentation
available).

This amounts to an unmaintainable mess which is reflected in the
binding schemas which similarly needs to encode every random order which
the SoC happened to use when being upstreamed. That makes the binding
documentation unreadable too, and the next time a new SoC is upstreamed
there is no clear hints of what the binding should look like, and we end
up with yet another permutation.

As part of this exercise, we've also determined that some of the
devicetrees that are already upstream are incorrect as well as
incomplete.

I really see no alternative to ripping of the plaster and cleaning this
up once and for all even if it "breaks" some imaginary OS which (unlike
Linux) relies on the current random order of these interrupts.

[ If there were any real OSes actually relying on the order, then that
would be a different thing of course. ]

Johan

