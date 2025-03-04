Return-Path: <linux-arm-msm+bounces-50096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A04A4D1F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 04:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13E0C3AC412
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 03:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54C41D5AB5;
	Tue,  4 Mar 2025 03:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyfgLJYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE53194080;
	Tue,  4 Mar 2025 03:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741058000; cv=none; b=sFyNAsgc01rx2vhYQSJn41KC9bDJ1ONhs57c0J/BsYzsyvcPQFuKV0M3qRy3BqqMNndn157cm5QA5uG3rXWMRYUaBnvtLwtW366gnO7UTZZK3bmOro83afQdo+0gJFAbMFQjL+obJdlbwus+KBNbKhvebOx05rpy/+xMvEdPZNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741058000; c=relaxed/simple;
	bh=JIj+/tr9TcRP5XhO/iLdeKqe04P1XWqfEvK8p1Y3Nm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbX9JEbR1VAYeGl+4fqkizAuJ5GE4FN6qREr5PDKCQsDHTwLS7DbJsacaPDTLJndS+WxlwgDyHhieb21/dCaQnwMg/DdRYlSAQ6CVA+nBeJ86LtVX4jUtP2J3SqBMvyX7ZOEMWEY8qpv+RgXoM42ZIl1dtv6Wbw+x7UDBqsGVYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyfgLJYb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D16C4CEE8;
	Tue,  4 Mar 2025 03:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741058000;
	bh=JIj+/tr9TcRP5XhO/iLdeKqe04P1XWqfEvK8p1Y3Nm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lyfgLJYbuEuCn3kETuOm0igYrIuR8EE55vkdXqL0wHQSrw5doOIzySdMPam3sIzwr
	 pmVXGFQHDe9dLnAlOE8fnr/SarDaMIwzu4zv6Uwz1CNYsIYnuowUhZKkVzto2yq6A3
	 oTHeo4sXq4zDIibz53K1gEXj9HsAlvrI7sxUM4goe3g/Ch1U/0tUi3RbKbObbabRCu
	 XeDajTZ9dyXjGHxz/TT7TiSB29JmmZ8pBQPGBRNdQYx/zSwSalUBCWy26s3l7RXe9Y
	 dB1roGm1Fh7Hz/VAUO1ZOxhqncLkQfYFcTt65Qq4QvuJKSBGhtWHSnxmAVd0Fnwm4u
	 TSuI4vrvx2Xsg==
Date: Mon, 3 Mar 2025 21:13:16 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Felipe Balbi <balbi@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Saravana Kannan <saravanak@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] usb: dwc3: qcom: Snapshot driver for backwards
 compatibilty
Message-ID: <zr6qdi3gtjaj3gyalpspzej33q356bs5ynchcmtr73765gjel5@c5ijv7czkhqt>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-5-4415e7111e49@oss.qualcomm.com>
 <20250304000527.ybxfdjx5xzypcals@synopsys.com>
 <20250304003913.bsn5sucnofq6d6jo@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304003913.bsn5sucnofq6d6jo@synopsys.com>

On Tue, Mar 04, 2025 at 12:39:12AM +0000, Thinh Nguyen wrote:
> On Tue, Mar 04, 2025, Thinh Nguyen wrote:
> > On Wed, Feb 26, 2025, Bjorn Andersson wrote:
> > > In order to more tightly integrate the Qualcomm glue driver with the
> > > dwc3 core the driver is redesigned to avoid splitting the implementation
> > > using the driver model. But due to the strong coupling to the Devicetree
> > > binding needs to be updated as well.
> > > 
> > > Various ways to provide backwards compatibility with existing Devicetree
> > > blobs has been explored, but migrating the Devicetree information
> > > between the old and the new binding is non-trivial.
> > > 
> > > For the vast majority of boards out there, the kernel and Devicetree are
> > > generated and handled together, which in practice means that backwards
> > > compatibility needs to be managed across about 1 kernel release.
> > > 
> > > For some though, such as the various Snapdragon laptops, the Devicetree
> > > blobs live a life separate of the kernel. In each one of these, with the
> > > continued extension of new features, it's recommended that users would
> > > upgrade their Devicetree somewhat frequently.
> > > 
> > > With this in mind, simply carrying a snapshot/copy of the current driver
> > > is simpler than creating and maintaining the migration code.
> > > 
> > > The driver is kept under the same Kconfig option, to ensure that Linux
> > > distributions doesn't drop USB support on these platforms.
> > > 
> > > The driver, which is going to be refactored to handle the newly
> > > introduced qcom,snps-dwc3 compatible, is updated to temporarily not
> > > match against any compatible.
> > > 
> > > This driver should be removed after 2 LTS releases.
> > > 
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > ---
> > >  drivers/usb/dwc3/Makefile           |   1 +
> > >  drivers/usb/dwc3/dwc3-qcom-legacy.c | 934 ++++++++++++++++++++++++++++++++++++
> > >  drivers/usb/dwc3/dwc3-qcom.c        |   1 -
> > >  3 files changed, 935 insertions(+), 1 deletion(-)
> > > 
> > 
> > This is a bit concerning if there's no matching compatible string. ie.
> > we don't have user for the new driver without downstream dependencies
> > (or some workaround in the driver binding).
> 
> Ignore the comment above, I missed the "temporarily" in your log
> above. However, the comment below still stands.
> 
> > 
> > While I understand the intention, I'm afraid we may have to support and
> > maintain this much longer than the proposed 2 LTS releases (as seen with
> > anything tagged with "legacy" in the upstream kernel).

There are no products shipping today using dwc3-qcom where Devicetree is
considered firmware. The primary audience for a longer transition is
users of the various laptops with Qualcomm-chip in them. But given the
rapid development in a variety of functional areas, these users will be
highly compelled to update their DTBs within 2 years.

The other obvious user group is to make sure us upstream developers
don't loose USB when things get out of sync.


That said, if the model defined here is to be followed in other cases
(or my other vendors) where Devicetree is treated as firmware, your
concerns are valid - and it might be worth taking the cost of managing
the live-migration code.

> > If possible, I'd
> > prefer the complications of maintenance of the migration code be handled
> > downstream.
> > 

I'm sorry, but here it sounds like you're saying that you don't want any
migration code upstream at all? This is not possible, as this will break
USB for developers and users short term. We can of course discuss the 2
LTS though, if you want a shorter life span for this migration.


In my view, setting a flag date when the dwc3-qcom-legacy.c will be
removed will provide upstream users a transition period, at a very low
additional cost (934 lines of already tested code). If someone
downstream after that flag date wants to retain support for qcom,dwc3
they can just revert the removal of dwc3-qcom-legacy.c.

The alternative is that I try to get the migration code suggested in v3
to a state where it can be merged (right now it's 6x larger) and then
keep investing indefinitely in making sure it's not bit-rotting
(although Rob Herring did request a flag date of the migration code in
v3 as well...).

Regards,
Bjorn

