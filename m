Return-Path: <linux-arm-msm+bounces-3943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5622B80A2EA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 13:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 795AC1C208E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452E01C28A;
	Fri,  8 Dec 2023 12:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J9LIN2hd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4012F1985
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 04:16:39 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-db8892a5f96so2132155276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 04:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702037798; x=1702642598; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lbMkvfvuSaUjn9nmS0/+yIbpDF8ZOV3Mm+1JCLQ4Ra4=;
        b=J9LIN2hdF9kT+Jb5t2nEnhWx70EO9899TOH54OkykJLPCXPbNFh1KDq5kbybvyEuYF
         p1nJaspB29ASGOSowWaQ0Sxumd2WnDXMMZGCnBp+FRHEGYzP3ZbpajKQ0P0Ew1HhKN/q
         XD0PGYMs6RlOV9+f9e2czRwD+6MtnUpYDOKTJnatxkN2YhTz+bMBWMWOafHq7aBtKQ6X
         fnOXxthY+SyIR4gOjqi/RfX4txNx4GT2yZkf0FAHtJsTK0efQnI7BU1TKcpvs0X5ItSJ
         jiByV8HhXo7WmPwqVyhhfX1Rjsvkjg2emd0sGiqgoVhGRwWBXxNT17qLO3RSYda+4cj6
         VCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702037798; x=1702642598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lbMkvfvuSaUjn9nmS0/+yIbpDF8ZOV3Mm+1JCLQ4Ra4=;
        b=Havs+HgLzq73IDxrmE/QRLJGg7P9CDzmdxmsIYDFvpqwGo86mo3fkH7ayTZd4KxHjr
         A9psyjq6+GZhnAzrrdJ0EdWjWut8ihcVfBMufIHRlGpoWpofOgx7FkecOhhpcSkjOa6e
         W0R4MhqEZz2xp5mSLJFYV/ZSsFBCVQWwIky/YdDWWvlR8v9GmnMFhkn9xs+kKNPS1rnR
         oZo8x5BwMVLNBu5V0ajJ2ObPgWLfTs9BIxzGZ6FpKzrgKHuwoB+xi29C+kJ0nchTUlhK
         dMJI75NblMYLrhg2zxqQunvhy9C0Kcs20vjbUthcNbzHZq8iCkxSougOJsZbylj5v4Vu
         SC9w==
X-Gm-Message-State: AOJu0YwwroD5xbrQvDQ4YI2oQqqNR0Q3muHJiuWYcwlhml4th0mfLn9i
	uH+8JP+1g+KFTyWtRYBYMc3CZyGmPBXbzkCR6IAMvQ==
X-Google-Smtp-Source: AGHT+IFkSuKgYjZ1Ot8B8JpiHzczbdIkGfzpW23lqrYveANKbH4KHfieyvcJF1lSuK0a7WBnilZliVdaqqE931/ecEQ=
X-Received: by 2002:a05:6902:7:b0:db7:dacf:6227 with SMTP id
 l7-20020a056902000700b00db7dacf6227mr3623543ybh.121.1702037798381; Fri, 08
 Dec 2023 04:16:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
 <ZXLWiVJYWdlwOBou@hovoldconsulting.com> <CAA8EJpp-BsabZB3FXnFsWZBNbF7keCrOKPPg3Qb7MzE3puMFeg@mail.gmail.com>
 <ZXL5jvDHr-MuxMoz@hovoldconsulting.com> <CAA8EJpoG-qg24wV953Xd9KQ957gpJVHc20Te2cYQWfs9imC63w@mail.gmail.com>
 <ZXMCgVWNCfwmY8oS@hovoldconsulting.com>
In-Reply-To: <ZXMCgVWNCfwmY8oS@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 14:16:27 +0200
Message-ID: <CAA8EJpqqekmGrHt11czTTfdM1DVtY5g3j3k-0aM8u1PDQUDHRw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] usb: typec: ucsi: add workaround for several
 Qualcomm platforms
To: Johan Hovold <johan@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 13:47, Johan Hovold <johan@kernel.org> wrote:
>
> On Fri, Dec 08, 2023 at 01:10:59PM +0200, Dmitry Baryshkov wrote:
> > On Fri, 8 Dec 2023 at 13:09, Johan Hovold <johan@kernel.org> wrote:
> > > On Fri, Dec 08, 2023 at 12:58:29PM +0200, Dmitry Baryshkov wrote:
> > > > On Fri, 8 Dec 2023 at 10:39, Johan Hovold <johan@kernel.org> wrote:
> > > > > On Wed, Oct 25, 2023 at 02:49:28PM +0300, Dmitry Baryshkov wrote:
> > > > > > The UCSI firmware on Qualcomm SC8180X, SC8280XP and SM8350 are buggy.
> > > > > > Submitting UCSI_GET_PDOS command for partners which do not actually
> > > > > > support PD and do not have PDOs causes firmware to crash, preventing
> > > > > > further UCSI activity. Firmware on newer platforms have fixed this
> > > > > > issue. In order to still be able to use UCSI functionality on the
> > > > > > mentioned platforms (e.g. to be able to handle USB role switching),
> > > > > > apply a workaround that completely shortcuts UCSI_GET_PDOS command for
> > > > > > the USB-C partner.
> > > > > >
> > > > > > This has been tested on sm8350 only, but should apply to other
> > > > > > platforms. I did not enable UCSI for sc8180x yet, it has slightly
> > > > > > different implementation, which I'd like to get tested first.
> > > > >
> > > > > Has no one tested this on sc8280xp/x13s before merging?
> > > > >
> > > > > I see a bunch of errors with this series applied to 6.7-rc4:
> > > > >
> > > > > [   11.999960] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
> > > > > [   12.000430] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-110)
> > > > > [   17.120515] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
> > > > > [   17.124204] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-110)
> > > > > [   23.264792] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: timeout waiting for UCSI sync write response
> > > > > [   23.264953] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: GET_CONNECTOR_STATUS failed (-110)
> > > >
> > > > Can you please post previous messages or is the first timeout the
> > > > first error from ucsi?
> > >
> > > These are all the ucsi messages in the log (dmesg | grep ucsi).
> > >
> > > The first error is sometimes GET_CONNECTOR_STATUS failed (-95) instead:
> >
> > Ack, thank you. This is pending on my side together with the UCSI
> > glink / altmode rework. I hope to have patches for that closer to the
> > NY.
>
> What does that mean? That we shall revert these patches until that work
> is finished? I don't want to have these errors littering the logs,
> scaring users and possibly slowing down boot (those are five second
> timeouts).

Just send a patch disabling ucsi for sc8280xp.

>
> Also, if this was known issue, why wasn't it mentioned the cover letter
> or commit messages?

Surely it was not the known issue, otherwise I would not have sent the series.

-- 
With best wishes
Dmitry

