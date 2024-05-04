Return-Path: <linux-arm-msm+bounces-19202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DBB8BB9A6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2024 08:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 501B9B21948
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2024 06:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4569C4C6D;
	Sat,  4 May 2024 06:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dLzg0Enm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6474B23D0
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 May 2024 06:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714805396; cv=none; b=kr8bNYbq1G3WKJj1ORm5Lvn4eOVEsH3nMRTk2RPdkdsQjm+vL3bjd7iuOcpOmE4rJcOi8zQRDgt1BfqvbtgS9ZttmI4LgC6uwopM28Tvr9yPvG9oKNRtpcCH98nXx3Ns7QetIbQS6U5JzXL0PTh5QIsMEedqWVcWD0xIBhsL6L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714805396; c=relaxed/simple;
	bh=rx9kJq41d+LKrriX6r8ovyOqv24j2QFcPlhuxeiCtJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+8kh3z3cii0PJxP70qgcKJbb0xF6lQb33onU3/PDgDF3lu0Q7V/BR3E8Ckb4tifvLhMXWrlzjMpp6xRzxGN5m+XumPvfJuarLDdUSSSmLlyLpPsaJW6n7WMb6otAYbJtN8i0Gq9o925wGwZRXMVx4uOGW5FlZdmq9+NCkKIfT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dLzg0Enm; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-61b62005f38so3225577b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 May 2024 23:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714805393; x=1715410193; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D3cJMKI74/BsfKZhlMzBdzwD07fKdpiipZf5wrnLnNY=;
        b=dLzg0EnmTHhjKDecaDM4ov2NbI7D+i3KVx5oi94kjVVsu5BByXxAsdcZoMJ6LhDfcu
         qsQYkCvfgRixNR90K147UqfNpCrF8jebNLqx5D/jWDCdZASW0SFPVDwA9oSg7XECxhf8
         IQPsO3obqrwJAQEMvBrqVtZBud9FhIo+bzqPZ7OR4CegL98ejtGMbEWIT/sjnsSYHMBW
         gQFOhQ6VGNosImVpkZTrW97K+LqDDC1Om/mjmlAOj4Jpd1tgLLa1gkqttnM58oFxHoJ5
         ze9bfIkFvoTxdTaZAQQZQmcTLg3ozlKvn789+9hKuUCq7TQqxF0cj98+qR7q8EqLhuG8
         /ZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714805393; x=1715410193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3cJMKI74/BsfKZhlMzBdzwD07fKdpiipZf5wrnLnNY=;
        b=W5jK+zcr1F5LAGUG7NdWxtI/2dUXTJi+SwhIhJIRzupP+hC2Y5g47XZzAJVcCP44vp
         cktUhltGdW06HO+JlgkMfOD0+DR+snAgd7dv6fTfhjpKkfQonBP3u/BMLuI061Df2Xan
         3fn9qJynDhYLvRlBFIQ7SCwRp1jKw7745bsH3rW4jvoPumLgGoK+Whfsa5r5y7rvlEtI
         Y09rPJuiOEzvyobRH4I7L8FUkZnA6IaW4ipg1KK2+5vzj6TTkf1CANx1OciK0cZE55mw
         mRC0N6bQNNYwtxLDrvxyCoFMDAbyttlzf9u8QeQOuQrek0t3CXBlYZzWd6/cl0QCQpch
         6CHg==
X-Forwarded-Encrypted: i=1; AJvYcCUxSsS07QQMmOmAakqRdP6uM8edkU8o4VW4lnJiOxPC5r4sWAHHt4Ej1jc5khzdWnxNPgIx6mc6dMvE1anbs4sQ+FQ4BfGECR24I05dFw==
X-Gm-Message-State: AOJu0YzQtgjg4m+eTrU6V5rJZF5yR8/q3iGvpCKo7BR69A7+3SbtDPk9
	1Ocnn7vT6sXanBjkxwnDMuaM6Q94yAGadlY58JunpOwKDwxUqqxdNcnVirG05XiNbHQ/ZMjc7rK
	sdLBg2Mr3YYCPVab7u+iuBSB9DmpR2+NkkBqe9Q==
X-Google-Smtp-Source: AGHT+IH96ebzgmWajjZwH3a4VG81/DDdvIkP/nzgQ+XXTMcLaurSNGHeJ9w5TE6ZqSu5Le59NiFfQiZNAmZrA88LOqg=
X-Received: by 2002:a05:690c:f06:b0:61b:33f7:225a with SMTP id
 dc6-20020a05690c0f0600b0061b33f7225amr5693836ywb.42.1714805393327; Fri, 03
 May 2024 23:49:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-7-890db00877ac@linaro.org>
 <ZiZC/l9nOmzWx+j6@kuha.fi.intel.com> <46fktwtp3xers6tcpov3qo4zswptvajewsdltm45zbz2kmmpzp@cthu6ylttup3>
 <ZiZ8El4779l0W1Ig@kuha.fi.intel.com>
In-Reply-To: <ZiZ8El4779l0W1Ig@kuha.fi.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 4 May 2024 09:49:42 +0300
Message-ID: <CAA8EJppMKFSbe-EZLELy+dnd4BZeg24crotH95hpCwcvoEbw5Q@mail.gmail.com>
Subject: Re: [PATCH 7/8] usb: typec: ucsi: glink: merge pmic_glink_altmode driver
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Apr 2024 at 18:02, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Dmitry,
>
> On Mon, Apr 22, 2024 at 03:45:22PM +0300, Dmitry Baryshkov wrote:
> > On Mon, Apr 22, 2024 at 01:59:10PM +0300, Heikki Krogerus wrote:
> > > Hi Dmitry,
> > >
> > > On Tue, Apr 16, 2024 at 05:20:56AM +0300, Dmitry Baryshkov wrote:
> > > > Move handling of USB Altmode to the ucsi_glink driver. This way the
> > > > altmode is properly registered in the Type-C framework, the altmode
> > > > handlers can use generic typec calls, the UCSI driver can use
> > > > orientation information from altmode messages and vice versa, the
> > > > altmode handlers can use GPIO-based orientation inormation from UCSI
> > > > GLINK driver.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  drivers/soc/qcom/Makefile             |   1 -
> > > >  drivers/soc/qcom/pmic_glink_altmode.c | 546 ----------------------------------
> > > >  drivers/usb/typec/ucsi/ucsi_glink.c   | 495 ++++++++++++++++++++++++++++--
> > > >  3 files changed, 475 insertions(+), 567 deletions(-)
> > > >
> >
> > [skipped the patch]
> >
> > > > +
> > > > +static void pmic_glink_ucsi_register_altmode(struct ucsi_connector *con)
> > > > +{
> > > > + static const u8 all_assignments = BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D) |
> > > > +                      BIT(DP_PIN_ASSIGN_E);
> > > > + struct typec_altmode_desc desc;
> > > > + struct typec_altmode *alt;
> > > > +
> > > > + mutex_lock(&con->lock);
> > > > +
> > > > + if (con->port_altmode[0])
> > > > +         goto out;
> > > > +
> > > > + memset(&desc, 0, sizeof(desc));
> > > > + desc.svid = USB_TYPEC_DP_SID;
> > > > + desc.mode = USB_TYPEC_DP_MODE;
> > > > +
> > > > + desc.vdo = DP_CAP_CAPABILITY(DP_CAP_DFP_D);
> > > > +
> > > > + /* We can't rely on the firmware with the capabilities. */
> > > > + desc.vdo |= DP_CAP_DP_SIGNALLING(0) | DP_CAP_RECEPTACLE;
> > > > +
> > > > + /* Claiming that we support all pin assignments */
> > > > + desc.vdo |= all_assignments << 8;
> > > > + desc.vdo |= all_assignments << 16;
> > > > +
> > > > + alt = typec_port_register_altmode(con->port, &desc);
> > >
> > >         alt = ucsi_register_displayport(con, 0, 0, &desc);
> >
> > Note, the existing UCSI displayport AltMode driver depends on the UCSI
> > actually handling the altomode. It needs a partner, etc.
> >
> > > You need to export that function, but that should not be a problem:
> > >
> > > diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
> > > index d9d3c91125ca..f2754d7b5876 100644
> > > --- a/drivers/usb/typec/ucsi/displayport.c
> > > +++ b/drivers/usb/typec/ucsi/displayport.c
> > > @@ -315,11 +315,13 @@ struct typec_altmode *ucsi_register_displayport(struct ucsi_connector *con,
> > >         struct ucsi_dp *dp;
> > >
> > >         /* We can't rely on the firmware with the capabilities. */
> > > -       desc->vdo |= DP_CAP_DP_SIGNALLING(0) | DP_CAP_RECEPTACLE;
> > > +       if (!desc->vdo) {
> > > +               desc->vdo = DP_CAP_DP_SIGNALLING(0) | DP_CAP_RECEPTACLE;
> > >
> > > -       /* Claiming that we support all pin assignments */
> > > -       desc->vdo |= all_assignments << 8;
> > > -       desc->vdo |= all_assignments << 16;
> > > +               /* Claiming that we support all pin assignments */
> > > +               desc->vdo |= all_assignments << 8;
> > > +               desc->vdo |= all_assignments << 16;
> > > +       }
> > >
> > >         alt = typec_port_register_altmode(con->port, desc);
> > >         if (IS_ERR(alt))
> > > @@ -342,3 +344,4 @@ struct typec_altmode *ucsi_register_displayport(struct ucsi_connector *con,
> > >
> > >         return alt;
> > >  }
> > > +EXPORT_SYMBOL_GPL(ucsi_register_displayport);
> > >
> > > <snip>
> > >
> > > > +static void pmic_glink_ucsi_set_state(struct ucsi_connector *con,
> > > > +                               struct pmic_glink_ucsi_port *port)
> > > > +{
> > > > + struct typec_displayport_data dp_data = {};
> > > > + struct typec_altmode *altmode = NULL;
> > > > + unsigned long flags;
> > > > + void *data = NULL;
> > > > + int mode;
> > > > +
> > > > + spin_lock_irqsave(&port->lock, flags);
> > > > +
> > > > + if (port->svid == USB_SID_PD) {
> > > > +         mode = TYPEC_STATE_USB;
> > > > + } else if (port->svid == USB_TYPEC_DP_SID && port->mode == DPAM_HPD_OUT) {
> > > > +         mode = TYPEC_STATE_SAFE;
> > > > + } else if (port->svid == USB_TYPEC_DP_SID) {
> > > > +         altmode = find_altmode(con, port->svid);
> > > > +         if (!altmode) {
> > > > +                 dev_err(con->ucsi->dev, "altmode woth SVID 0x%04x not found\n",
> > > > +                         port->svid);
> > > > +                 spin_unlock_irqrestore(&port->lock, flags);
> > > > +                 return;
> > > > +         }
> > > > +
> > > > +         mode = TYPEC_MODAL_STATE(port->mode - DPAM_HPD_A);
> > > > +
> > > > +         dp_data.status = DP_STATUS_ENABLED;
> > > > +         dp_data.status |= DP_STATUS_CON_DFP_D;
> > > > +         if (port->hpd_state)
> > > > +                 dp_data.status |= DP_STATUS_HPD_STATE;
> > > > +         if (port->hpd_irq)
> > > > +                 dp_data.status |= DP_STATUS_IRQ_HPD;
> > > > +         dp_data.conf = DP_CONF_SET_PIN_ASSIGN(port->mode - DPAM_HPD_A);
> > > > +
> > > > +         data = &dp_data;
> > > > + } else {
> > > > +         dev_err(con->ucsi->dev, "Unsupported SVID 0x%04x\n", port->svid);
> > > > +         spin_unlock_irqrestore(&port->lock, flags);
> > > > +         return;
> > > > + }
> > > > +
> > > > + spin_unlock_irqrestore(&port->lock, flags);
> > > > +
> > > > + if (altmode)
> > > > +         typec_altmode_set_port(altmode, mode, data);
> > >
> > > So if the port altmode is using the ucsi_displayport_ops, you can
> > > simply register the partner altmode here instead. That should
> > > guarantee that it'll bind to the DP altmode driver which will take
> > > care of typec_altmode_enter() etc.
> >
> > In our case the altmode is unfortunately completely hidden inside the
> > firmware. It is not exported via the native UCSI interface. Even if I
> > plug the DP dongle, there is no partner / altmode being reported by the
> > PPM. All DP events are reported via additional GLINK messages.
>
> I understand that there is no alt mode being reported, but I assumed
> that there is a notification about connections.
>
> If that's not the case, then you need to use this code path to
> register the partner device as well I think. The partner really has to
> be registered somehow.
>
> > The goal is to use the core Type-C altmode handling, while keeping UCSI
> > out of the altmode business.
> >
> > This allows the core to handle switches / muxes / retimers, report the
> > altmode to the userspace via sysfs, keep the link between the DP part of
> > the stack and the typec port, but at the same time we don't get errors
> > from UCSI because of the PPM reporting unsupported commands, etc.
>
> I understand, and just to be clear, I don't have a problem with
> bypassing UCSI. But that does not mean you can skip the alt mode
> registration.
>
> The primary purpose of drivers/usb/typec/ucsi/displayport.c is to
> emulate the partner DP alt mode device a little so that the actual DP
> alt mode driver drivers/usb/typec/altmodes/displayport.c is happy. The
> altmode driver will then make sure that all the muxes, switches and
> what have you, are configured as they should, and more importantly,
> make sure the DP alt mode is exposed to the user space exactly the
> same way as it's exposed on all the other systems.
>
> There are a couple of UCSI commands that are being used there yes, but
> by modifying it so that those UCSI commands are executed conditionally
> - by checking the ALT_MODE_DETAILS feature - you should be able to use
> it also in this case.

I have played with the DP AltMode driver. I got it somewhat working,
but I think I'm facing a control issue.
Basically, the altmode driver wants to control pin assignment on its
own. It works with the software TCPM, as we control it.
It works with the normal UCSI, because it still can configure pin
config. However with PMIC GLINK implementation there is no way to
control pin assignment from the Linux side. The firmware does that for
us.
What would be the recommended way to handle it? Is it okay to override
status_update to return just the selected pin config? Or is there any
other (better) way to handle such an issue?

>
> You really need to register the partner alt mode(s) one way or the
> other in any case, and the partner device itself you absolutely must
> register. The user space interface needs to be consistent.

For reference, the partner is being reported and registered by the
UCSI firmware. It's only the altmode itself where I'm facing the
issue.

-- 
With best wishes
Dmitry

