Return-Path: <linux-arm-msm+bounces-3948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1027A80A326
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 13:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 233B1B20B3E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF021C2A5;
	Fri,  8 Dec 2023 12:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffDGJ8N8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0F019BB9;
	Fri,  8 Dec 2023 12:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2831C433C7;
	Fri,  8 Dec 2023 12:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702038355;
	bh=ygGySrOIfj9KWjHoblEUZbIDQb8/oTSsgT6aYFYI/ZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffDGJ8N8eetL/uO/9MgtVme8lplagu9mpJKHQeKMhdhx6hsCqWGb2cVHBpIkRazwT
	 c8lrS9lG4PYOJw/drwFI4EeaJDjgFAirlVh8p8Grh/vs6/MLmEa2PpzOg6cJ4NVlWK
	 JzIUp2oUPy1LHUp1/ejYVk941Dea3wPWAsP12it2lLHpSTXdidKpk42xMhBujSLGey
	 lmCz7Hj3rKa2PiqpWNOTBfrUHFcvmhLPkoHFo5URrmWKoF6i/HQc3vZdus9lPu49na
	 w8hDOVLhsgiROKdzA4xyC8iSJ9lUHZYxyrb77w0koLNBpmCxjDZwQfqexFPJ49EhQM
	 V/nrDIUAmm7rA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rBZwL-0007dp-0F;
	Fri, 08 Dec 2023 13:26:45 +0100
Date: Fri, 8 Dec 2023 13:26:45 +0100
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
Message-ID: <ZXMLhau7pZPv2ftk@hovoldconsulting.com>
References: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
 <ZXLWiVJYWdlwOBou@hovoldconsulting.com>
 <CAA8EJpp-BsabZB3FXnFsWZBNbF7keCrOKPPg3Qb7MzE3puMFeg@mail.gmail.com>
 <ZXL5jvDHr-MuxMoz@hovoldconsulting.com>
 <CAA8EJpoG-qg24wV953Xd9KQ957gpJVHc20Te2cYQWfs9imC63w@mail.gmail.com>
 <ZXMCgVWNCfwmY8oS@hovoldconsulting.com>
 <CAA8EJpqqekmGrHt11czTTfdM1DVtY5g3j3k-0aM8u1PDQUDHRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqqekmGrHt11czTTfdM1DVtY5g3j3k-0aM8u1PDQUDHRw@mail.gmail.com>

On Fri, Dec 08, 2023 at 02:16:27PM +0200, Dmitry Baryshkov wrote:
> On Fri, 8 Dec 2023 at 13:47, Johan Hovold <johan@kernel.org> wrote:
> > On Fri, Dec 08, 2023 at 01:10:59PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, 8 Dec 2023 at 13:09, Johan Hovold <johan@kernel.org> wrote:

> > > > The first error is sometimes GET_CONNECTOR_STATUS failed (-95) instead:
> > >
> > > Ack, thank you. This is pending on my side together with the UCSI
> > > glink / altmode rework. I hope to have patches for that closer to the
> > > NY.
> >
> > What does that mean? That we shall revert these patches until that work
> > is finished? I don't want to have these errors littering the logs,
> > scaring users and possibly slowing down boot (those are five second
> > timeouts).
> 
> Just send a patch disabling ucsi for sc8280xp.

Ok, will do.

Looks like that is indeed the only platform besides sc8180x which had
not yet been tested.

> > Also, if this was known issue, why wasn't it mentioned the cover letter
> > or commit messages?
> 
> Surely it was not the known issue, otherwise I would not have sent the series.

Ah, sorry, I misunderstood you then.

Johan

