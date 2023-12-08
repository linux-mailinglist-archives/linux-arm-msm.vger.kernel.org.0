Return-Path: <linux-arm-msm+bounces-3937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A685C80A289
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D7C81F20F05
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 11:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC431B29F;
	Fri,  8 Dec 2023 11:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HL6EAGVg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F9A1B279;
	Fri,  8 Dec 2023 11:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D92C433C7;
	Fri,  8 Dec 2023 11:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702036048;
	bh=c+8rgroX2GbrXmRTiQanTq09WC+M7m+1jdhYPCQ312w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HL6EAGVgixZ6TirEcHCeCCknReZy1UaxH236/FRY4IbJRsyt6yUppXKPDnagcxOXO
	 1LMQ3AyF8oyVO4u69YuX5FKkkY0YsU4ksh9Mkku9kT+3t0goXAd/YquMEYJlRIB88B
	 b4e/spaSR+mZEX2C81pGis2kwjvPdOypaucNXJcQPAVzN6eWgkQ5PWvE9Luq3LjrCj
	 ltBE11ZiO5a30HDsLxnpsCr5eZxPi8JMGlZQJLZcMAN7uO/UlZ1z/YsdtFEO7tBzx5
	 /SIt0VHVEnD771P64sR37hEu22uv9krw7ajeoyagZQKYR9byA66jpzTGLs998C7RM5
	 b3oe3PbFi4nkg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rBZL7-0006Fm-2o;
	Fri, 08 Dec 2023 12:48:17 +0100
Date: Fri, 8 Dec 2023 12:48:17 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/2] usb: typec: ucsi: add workaround for several
 Qualcomm platforms
Message-ID: <ZXMCgVWNCfwmY8oS@hovoldconsulting.com>
References: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
 <ZXLWiVJYWdlwOBou@hovoldconsulting.com>
 <CAA8EJpp-BsabZB3FXnFsWZBNbF7keCrOKPPg3Qb7MzE3puMFeg@mail.gmail.com>
 <ZXL5jvDHr-MuxMoz@hovoldconsulting.com>
 <CAA8EJpoG-qg24wV953Xd9KQ957gpJVHc20Te2cYQWfs9imC63w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpoG-qg24wV953Xd9KQ957gpJVHc20Te2cYQWfs9imC63w@mail.gmail.com>

On Fri, Dec 08, 2023 at 01:10:59PM +0200, Dmitry Baryshkov wrote:
> On Fri, 8 Dec 2023 at 13:09, Johan Hovold <johan@kernel.org> wrote:
> > On Fri, Dec 08, 2023 at 12:58:29PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, 8 Dec 2023 at 10:39, Johan Hovold <johan@kernel.org> wrote:
> > > > On Wed, Oct 25, 2023 at 02:49:28PM +0300, Dmitry Baryshkov wrote:
> > > > > The UCSI firmware on Qualcomm SC8180X, SC8280XP and SM8350 are buggy.
> > > > > Submitting UCSI_GET_PDOS command for partners which do not actually
> > > > > support PD and do not have PDOs causes firmware to crash, preventing
> > > > > further UCSI activity. Firmware on newer platforms have fixed this
> > > > > issue. In order to still be able to use UCSI functionality on the
> > > > > mentioned platforms (e.g. to be able to handle USB role switching),
> > > > > apply a workaround that completely shortcuts UCSI_GET_PDOS command for
> > > > > the USB-C partner.
> > > > >
> > > > > This has been tested on sm8350 only, but should apply to other
> > > > > platforms. I did not enable UCSI for sc8180x yet, it has slightly
> > > > > different implementation, which I'd like to get tested first.
> > > >
> > > > Has no one tested this on sc8280xp/x13s before merging?
> > > >
> > > > I see a bunch of errors with this series applied to 6.7-rc4:
> > > >
> > > > [   11.999960] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
> > > > [   12.000430] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-110)
> > > > [   17.120515] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
> > > > [   17.124204] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-110)
> > > > [   23.264792] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
> > > > [   23.264953] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-110)
> > >
> > > Can you please post previous messages or is the first timeout the
> > > first error from ucsi?
> >
> > These are all the ucsi messages in the log (dmesg | grep ucsi).
> >
> > The first error is sometimes GET_CONNECTOR_STATUS failed (-95) instead:
> 
> Ack, thank you. This is pending on my side together with the UCSI
> glink / altmode rework. I hope to have patches for that closer to the
> NY.

What does that mean? That we shall revert these patches until that work
is finished? I don't want to have these errors littering the logs,
scaring users and possibly slowing down boot (those are five second
timeouts).

Also, if this was known issue, why wasn't it mentioned the cover letter
or commit messages?

Johan

