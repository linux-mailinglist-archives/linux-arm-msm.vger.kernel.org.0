Return-Path: <linux-arm-msm+bounces-441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 607467E7AD1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 10:28:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A5142816C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 09:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C13125D1;
	Fri, 10 Nov 2023 09:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DhZlWNO/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9E3847A;
	Fri, 10 Nov 2023 09:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6C1C433C8;
	Fri, 10 Nov 2023 09:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699608510;
	bh=O71kWkjLpRl34q0yTwylpF7QtQRF306pEE+e5Yis+eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DhZlWNO/O/GlcCmSNulebkNqJCBcE5IlpGDHxug+wJ86H+p/patK8+fRBqpzzGjaZ
	 d6SvpHoCvd1jfHn0itYAEK/akm7STqjUawTQ2JZfk9hYQA9/TAjtOhrQvPkDcghomr
	 5kFVtluMH6FzAcpqfx/Y4STvx2lN3e2HW8zTkrkM3qDQ9bdy3wsJYQp/4mPkUiIE1f
	 ZEnVwc6HchoE0JiBE25kzYrFGYEeohmxnnDHR22CC8ILlJX7YmHlR9EQpmT1lwvFq8
	 uWB5YOP+FAoBaAb6TZBf0qBFLhas93tda9svqEyCKdBaiU2Nm75GqOfA56DsPeewdc
	 jk8hn7oMcLkVA==
Received: from johan by theta with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r1NoP-0002tb-1q;
	Fri, 10 Nov 2023 10:28:25 +0100
Date: Fri, 10 Nov 2023 10:28:25 +0100
From: Johan Hovold <johan@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, quic_pkondeti@quicinc.com,
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com,
	ahalaney@redhat.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH v13 05/10] usb: dwc3: qcom: Refactor IRQ handling in QCOM
 Glue driver
Message-ID: <ZU33uWpStIobzyd6@hovoldconsulting.com>
References: <14fc724c-bc99-4b5d-9893-3e5eff8895f7@quicinc.com>
 <ZTY7Lwjd3_8NlfEi@hovoldconsulting.com>
 <cabf24d0-8eea-4eb5-8205-bf7fe6017ec2@quicinc.com>
 <ZTZ-EvvbuA6HpycT@hovoldconsulting.com>
 <fb5e5e1d-520c-4cbc-adde-f30e853421a1@quicinc.com>
 <ZTdqnSHq_Jo8AuPW@hovoldconsulting.com>
 <04615205-e380-4719-aff1-f32c26004b14@quicinc.com>
 <ZUz4RD3MjnLlPn6V@hovoldconsulting.com>
 <2b19b5e2-5eb0-49e0-8c47-8aff3d48f34e@quicinc.com>
 <50931ba5-132f-3982-e33a-691583e3a71f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50931ba5-132f-3982-e33a-691583e3a71f@quicinc.com>

On Thu, Nov 09, 2023 at 12:25:59PM -0800, Wesley Cheng wrote:

> > > > Since the DeviceTree passed to the OS, should describe the hardware to
> > > > the OS, and should represent the hardware from the point-of-view of the
> > > > OS, adding one interrupt (ctrl_irq[0]) might be sufficient as Linux
> > > > would not use the other interrupts.
> > > 
> > > I've only skimmed the virtualisation bits in xHCI spec, but it seems
> > > Linux as VMM would still be involved in assigning these interrupts to
> > > VMs.

> IMO it might be a bit premature to add definitions for how to utilize
> secondary interrupters since design wise, there's nothing really too well
> defined yet.  At least for the XHCI path, we will have a slew of potential
> use cases for secondary interrupters, such as USB audio offloading, or for
> VMMs, etc...  I've only heard mentions about some of them after pushing the
> usb audio offloading series, but I don't have much details on it.

I tend to agree.

> > > This may possibly be something that we can ignore for now, but perhaps
> > > someone more familiar with the hardware, like Thinh, can chime in.

> > > You need to get into the same mindset when it comes to devicetree. Even
> > > if Linux currently does not use an interrupt, like the pwr_event_irq,
> > > you should still add it so that when/if someone implements support for
> > > it, an older platform using the original dt may also take advantage of
> > > it.
> 
> Yeah, I totally agree with this point, but I'm not sure if adding it into
> the "interrupts" array is the way to go.  It would probably have to change
> as support is added.

Yes, that in itself would probably not be sufficient and possibly not
even correct.

> Sorry for jumping in, but just giving my two cents since I'm the one trying
> to do the initial push for the support for secondary interrupters :).

Appreciate your input.

Johan

