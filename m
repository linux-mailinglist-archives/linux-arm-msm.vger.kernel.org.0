Return-Path: <linux-arm-msm+bounces-3922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDA680A1D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAC102819DE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 11:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C4119BDC;
	Fri,  8 Dec 2023 11:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sea3PZ8E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4270119BB6;
	Fri,  8 Dec 2023 11:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B50EBC433C7;
	Fri,  8 Dec 2023 11:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702033756;
	bh=VJcw0Erm07MGQeyseZjE77WzK9HCffY2NycbsU5kTR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sea3PZ8EgMgSq1+fm+vfA7uE17+NPWl3x6CEXySZA1ZpkERzNn2rsWHpVmGf9HNEQ
	 VPir0eVOSTLD+Ls3fL5j/RsvJ2QfxYhfIFK9eXeN5G7WRT5z3EEJk6BfsuwG4QMNAK
	 VRO8uudnnJl30TLs1bYtZ4IQXIx/ISb7akT53w+n47QVUUkoApiAtjn3VPxwN0h8kG
	 eNDgwcVNf/JLYHhiDp75PZyEBzZyo2MFnU9QE/wxTKT09b6+Z+kGOI68ypo6d5CUTE
	 t6GBEjX23zQFNRdlEf/L+ED5WOnrdALqwVI8xh0kH+ZWEt6QjdbedrTJ3OZEXf/Ksb
	 a5iDcsWaHEutQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rBYkA-00069c-0y;
	Fri, 08 Dec 2023 12:10:06 +0100
Date: Fri, 8 Dec 2023 12:10:06 +0100
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
Message-ID: <ZXL5jvDHr-MuxMoz@hovoldconsulting.com>
References: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
 <ZXLWiVJYWdlwOBou@hovoldconsulting.com>
 <CAA8EJpp-BsabZB3FXnFsWZBNbF7keCrOKPPg3Qb7MzE3puMFeg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpp-BsabZB3FXnFsWZBNbF7keCrOKPPg3Qb7MzE3puMFeg@mail.gmail.com>

On Fri, Dec 08, 2023 at 12:58:29PM +0200, Dmitry Baryshkov wrote:
> On Fri, 8 Dec 2023 at 10:39, Johan Hovold <johan@kernel.org> wrote:
> >
> > On Wed, Oct 25, 2023 at 02:49:28PM +0300, Dmitry Baryshkov wrote:
> > > The UCSI firmware on Qualcomm SC8180X, SC8280XP and SM8350 are buggy.
> > > Submitting UCSI_GET_PDOS command for partners which do not actually
> > > support PD and do not have PDOs causes firmware to crash, preventing
> > > further UCSI activity. Firmware on newer platforms have fixed this
> > > issue. In order to still be able to use UCSI functionality on the
> > > mentioned platforms (e.g. to be able to handle USB role switching),
> > > apply a workaround that completely shortcuts UCSI_GET_PDOS command for
> > > the USB-C partner.
> > >
> > > This has been tested on sm8350 only, but should apply to other
> > > platforms. I did not enable UCSI for sc8180x yet, it has slightly
> > > different implementation, which I'd like to get tested first.
> >
> > Has no one tested this on sc8280xp/x13s before merging?
> >
> > I see a bunch of errors with this series applied to 6.7-rc4:
> >
> > [   11.999960] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
> > [   12.000430] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-110)
> > [   17.120515] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
> > [   17.124204] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-110)
> > [   23.264792] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
> > [   23.264953] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-110)
> 
> Can you please post previous messages or is the first timeout the
> first error from ucsi?

These are all the ucsi messages in the log (dmesg | grep ucsi).

The first error is sometimes GET_CONNECTOR_STATUS failed (-95) instead:

[    9.012421] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-95)
[   14.047379] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
[   14.050708] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-110)
[   20.192382] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
[   20.192542] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-110)

I see that one if I boot with only the charger connected, the later -110
timeouts go away if I disconnect my r8152 ethernet adapter.

Johan

