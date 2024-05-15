Return-Path: <linux-arm-msm+bounces-19891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5872B8C6924
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 17:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5C4A284210
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 15:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0323F155A39;
	Wed, 15 May 2024 15:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dJl3MCaF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DB2155A2F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 15:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715785313; cv=none; b=MseogySmuteKwrheKLW/uYIjvkmHrJen/N6EWpHzHLP03nsyuZNMVWKsjl6/vwd+UWj5qxlWXPPa97eiVhRSO0atQmO36LcJPHkPyYvOBO3sUykGUB4kCEAlgGaxT/i7aQqPvGN2mjyRIPqgo77/Eze6DsOX7q/XRDyoLfJgBSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715785313; c=relaxed/simple;
	bh=ScHBNCjfwH0hgsz8GZny0v3ytqV7J3w0ocDS7d+1VoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7gY7rQv2Se9Q1JnRMJxUZlmLMUi9aMd+pCMuPhqgOT3oYO94VSgB9qMqDb5pi4E7v7Jms/BoOnpotbNtXVDH+AUOYRtBfvCeax4ntAgQ6sesyRTclRn9n+qrkkPrgcqmwIDdrbQjJBbe+LBs5E8luIOU9W4r3rONy8/G5sKFkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dJl3MCaF; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e6f2534e41so15407351fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2024 08:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715785310; x=1716390110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1UyqZmUfboktWppmzlMbge493UhsV2Qc8tBPPHmQa0s=;
        b=dJl3MCaFt/4v3FygCxRHjHN9zOqmdNhNlo1EPkCzVGKI9Yi25D5IHgLeZJaq++ZH01
         gtVEnJXXNjYebR9EnogSbPVbiLUPUWfjN68+O2q5z4SK98/SK23PyD85QL4ceiNAcFqV
         VeTYjL5JwY3TP2mGtPFCubqeqsRkAznyJKFNesuaTZSrZU86ONCdi4fyVMsPZnko0VsF
         4pFACOc8Of/WQHIw5WpRUsww+qo678orS68qP4NaJtJiqIAxrYjw/RYz4zpJRgLW9P0l
         qsR3r7S+FrtprUzB14vU+93bcgn/LmIyB9wAB/EENKdlZUZp59hTsRsY68fCNbWRtdVY
         LbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715785310; x=1716390110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UyqZmUfboktWppmzlMbge493UhsV2Qc8tBPPHmQa0s=;
        b=P4fUu7HgXltunRRIxMQRS3EoFj4tFGDAFXsUxWR7AJxOWPJCCgUlyni8tkGThpmlSV
         p1xiEG6OncSsAkO6hAJIOSB34/aP7uQaMyTE3H59skx8C0DlbpawRncfgQoirPHc5VMB
         yUQz2SvkfihVHN3vDY1fIca4DUWNabKOLEhTmnXF9sMVKb5q5TOiL1ET8MHEuyy+e61u
         H4e9JaAuQmg6KtjPzF2JI2/S8nz3hE3r+JszVPNBG+jf+R2RoYznol5twjHg7zhKrqRn
         tqNqvTqI9bskQohVF+Pf0TNo3+oQzhgeLjs0XxwQux9hxci05s2Y3HWCcTRLEwFMK5Ei
         SCoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPw/6A3vkNiQk0J09u0L9EeLDMvpD0+yrrhlOHVNup2Cp8eN/HXJuF9srluHz778zJWRaLJhUGrJ1T6ZQLkcB+DXDE83UedDuqNZqFnQ==
X-Gm-Message-State: AOJu0YyHIM93rJIq16IoimMj2pdfxhpIlk3CKBcZZaGmAEt7/Z6W7+E+
	GN5vLdClEqw22ThSaA9FA4gc/VUskBsqHR/6RNdiuI5jTyiwfBnv0OxeOoLjV2g=
X-Google-Smtp-Source: AGHT+IHbwp2iYCqmHM0R9xejEb13mh3r9CmNNOPKVYnou4CH7qz3D3yCaBHkx24yNkzM8v3qHfsyGg==
X-Received: by 2002:a2e:f1a:0:b0:2e6:a7c3:775a with SMTP id 38308e7fff4ca-2e6a7c37977mr49132481fa.52.1715785310131;
        Wed, 15 May 2024 08:01:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e4d1622740sm21039371fa.119.2024.05.15.08.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 08:01:49 -0700 (PDT)
Date: Wed, 15 May 2024 18:01:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 7/8] usb: typec: ucsi: glink: merge pmic_glink_altmode
 driver
Message-ID: <f2bqgtoll3j6pseg6hzvwtyqiwfwcaepuhcnq4nrshux2bnluh@rte67mi7zcey>
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-7-890db00877ac@linaro.org>
 <ZiZC/l9nOmzWx+j6@kuha.fi.intel.com>
 <46fktwtp3xers6tcpov3qo4zswptvajewsdltm45zbz2kmmpzp@cthu6ylttup3>
 <ZiZ8El4779l0W1Ig@kuha.fi.intel.com>
 <CAA8EJppMKFSbe-EZLELy+dnd4BZeg24crotH95hpCwcvoEbw5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppMKFSbe-EZLELy+dnd4BZeg24crotH95hpCwcvoEbw5Q@mail.gmail.com>

Hi Heikki,


On Sat, May 04, 2024 at 09:49:42AM +0300, Dmitry Baryshkov wrote:
> On Mon, 22 Apr 2024 at 18:02, Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > Hi Dmitry,
> >
> > On Mon, Apr 22, 2024 at 03:45:22PM +0300, Dmitry Baryshkov wrote:
> > > On Mon, Apr 22, 2024 at 01:59:10PM +0300, Heikki Krogerus wrote:
> > > > Hi Dmitry,
> > > >
> > > > On Tue, Apr 16, 2024 at 05:20:56AM +0300, Dmitry Baryshkov wrote:
> > > > > Move handling of USB Altmode to the ucsi_glink driver. This way the
> > > > > altmode is properly registered in the Type-C framework, the altmode
> > > > > handlers can use generic typec calls, the UCSI driver can use
> > > > > orientation information from altmode messages and vice versa, the
> > > > > altmode handlers can use GPIO-based orientation inormation from UCSI
> > > > > GLINK driver.
> > > > >

[skipped]

> > > Note, the existing UCSI displayport AltMode driver depends on the UCSI
> > > actually handling the altomode. It needs a partner, etc.
> > >

[skipped the patch]

> > > > > +static void pmic_glink_ucsi_set_state(struct ucsi_connector *con,
> > > > > +                               struct pmic_glink_ucsi_port *port)
> > > > > +{
> > > > > + struct typec_displayport_data dp_data = {};
> > > > > + struct typec_altmode *altmode = NULL;
> > > > > + unsigned long flags;
> > > > > + void *data = NULL;
> > > > > + int mode;
> > > > > +
> > > > > + spin_lock_irqsave(&port->lock, flags);
> > > > > +
> > > > > + if (port->svid == USB_SID_PD) {
> > > > > +         mode = TYPEC_STATE_USB;
> > > > > + } else if (port->svid == USB_TYPEC_DP_SID && port->mode == DPAM_HPD_OUT) {
> > > > > +         mode = TYPEC_STATE_SAFE;
> > > > > + } else if (port->svid == USB_TYPEC_DP_SID) {
> > > > > +         altmode = find_altmode(con, port->svid);
> > > > > +         if (!altmode) {
> > > > > +                 dev_err(con->ucsi->dev, "altmode woth SVID 0x%04x not found\n",
> > > > > +                         port->svid);
> > > > > +                 spin_unlock_irqrestore(&port->lock, flags);
> > > > > +                 return;
> > > > > +         }
> > > > > +
> > > > > +         mode = TYPEC_MODAL_STATE(port->mode - DPAM_HPD_A);
> > > > > +
> > > > > +         dp_data.status = DP_STATUS_ENABLED;
> > > > > +         dp_data.status |= DP_STATUS_CON_DFP_D;
> > > > > +         if (port->hpd_state)
> > > > > +                 dp_data.status |= DP_STATUS_HPD_STATE;
> > > > > +         if (port->hpd_irq)
> > > > > +                 dp_data.status |= DP_STATUS_IRQ_HPD;
> > > > > +         dp_data.conf = DP_CONF_SET_PIN_ASSIGN(port->mode - DPAM_HPD_A);
> > > > > +
> > > > > +         data = &dp_data;
> > > > > + } else {
> > > > > +         dev_err(con->ucsi->dev, "Unsupported SVID 0x%04x\n", port->svid);
> > > > > +         spin_unlock_irqrestore(&port->lock, flags);
> > > > > +         return;
> > > > > + }
> > > > > +
> > > > > + spin_unlock_irqrestore(&port->lock, flags);
> > > > > +
> > > > > + if (altmode)
> > > > > +         typec_altmode_set_port(altmode, mode, data);
> > > >
> > > > So if the port altmode is using the ucsi_displayport_ops, you can
> > > > simply register the partner altmode here instead. That should
> > > > guarantee that it'll bind to the DP altmode driver which will take
> > > > care of typec_altmode_enter() etc.
> > >
> > > In our case the altmode is unfortunately completely hidden inside the
> > > firmware. It is not exported via the native UCSI interface. Even if I
> > > plug the DP dongle, there is no partner / altmode being reported by the
> > > PPM. All DP events are reported via additional GLINK messages.
> >
> > I understand that there is no alt mode being reported, but I assumed
> > that there is a notification about connections.
> >
> > If that's not the case, then you need to use this code path to
> > register the partner device as well I think. The partner really has to
> > be registered somehow.
> >
> > > The goal is to use the core Type-C altmode handling, while keeping UCSI
> > > out of the altmode business.
> > >
> > > This allows the core to handle switches / muxes / retimers, report the
> > > altmode to the userspace via sysfs, keep the link between the DP part of
> > > the stack and the typec port, but at the same time we don't get errors
> > > from UCSI because of the PPM reporting unsupported commands, etc.
> >
> > I understand, and just to be clear, I don't have a problem with
> > bypassing UCSI. But that does not mean you can skip the alt mode
> > registration.
> >
> > The primary purpose of drivers/usb/typec/ucsi/displayport.c is to
> > emulate the partner DP alt mode device a little so that the actual DP
> > alt mode driver drivers/usb/typec/altmodes/displayport.c is happy. The
> > altmode driver will then make sure that all the muxes, switches and
> > what have you, are configured as they should, and more importantly,
> > make sure the DP alt mode is exposed to the user space exactly the
> > same way as it's exposed on all the other systems.
> >
> > There are a couple of UCSI commands that are being used there yes, but
> > by modifying it so that those UCSI commands are executed conditionally
> > - by checking the ALT_MODE_DETAILS feature - you should be able to use
> > it also in this case.
> 
> I have played with the DP AltMode driver. I got it somewhat working,
> but I think I'm facing a control issue.
> Basically, the altmode driver wants to control pin assignment on its
> own. It works with the software TCPM, as we control it.
> It works with the normal UCSI, because it still can configure pin
> config. However with PMIC GLINK implementation there is no way to
> control pin assignment from the Linux side. The firmware does that for
> us.
> What would be the recommended way to handle it? Is it okay to override
> status_update to return just the selected pin config? Or is there any
> other (better) way to handle such an issue?

Any suggestions or further comments? Is it better to extend the
DisplayPort Altmode driver with the 'forced' transitions? Or it would be
fine to just register a partner device, emulate the userspace events,
but completely ignore the existing displayport driver?

> 
> >
> > You really need to register the partner alt mode(s) one way or the
> > other in any case, and the partner device itself you absolutely must
> > register. The user space interface needs to be consistent.
> 
> For reference, the partner is being reported and registered by the
> UCSI firmware. It's only the altmode itself where I'm facing the
> issue.

-- 
With best wishes
Dmitry

