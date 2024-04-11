Return-Path: <linux-arm-msm+bounces-17224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2123E8A1367
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 13:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1BA21F21E54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 11:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FF514F11B;
	Thu, 11 Apr 2024 11:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I611Bvce"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18DA14EC58
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712835802; cv=none; b=D+aH4Thrs402mpR+jQMya9wmgM7hriiOkfH6RkPiPVxcfa4SDsa21FXq/Y/EX1na5+9J8lY/vm77OHjkN8pwb1MdSV3y71jQy6Mtamla6c7RVEOgQ9vm9A2+KA0Mz/2gRIjgUZiozViSxhZgkfMZ+xVkI5yxMy0TihFa9KmRGl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712835802; c=relaxed/simple;
	bh=vGXERIWr/pO3tbfzG6cqs4nLK8n2JzZzhRz/KFrqECM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVay9PHWphaAwOkhOegUCAhqOqhYd2C3k2pTo7LC06RSO54ugLaBBgtMhtm0UzkBU6kdXcKV4Af3+NGEWj7D1jDPifZ+s6WZ9ah4zFRVQ0SeoykGnFgP2qWKt3FPqU1/3nxzB8TjPxDUfb6/KAK4q2aMrjZSuOZycthzocuMegM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I611Bvce; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-516dbc36918so6554714e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 04:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712835798; x=1713440598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3JNF0m65GaovNtbabRD8x6iyV5wlnJr6JeL+rCfjFI=;
        b=I611BvceYkk/G8uFeocZmG9lukY+Gafk4UL9/CP6y9Nl+GZyPKqnfPvllekDLAAFPw
         4QaVb+myID+iIBdZnuP/kVZqav8BZ0AHImnPhD6z6GcM3xJQq4bRhkeJo2O7xGNzCoZS
         vrZ8CkxnSe1es7Tpd2pCUsS5mfOaUWzxxrkYfKlRdJFVNxe+1BPaCdsdHfaRicT5+CBM
         zFMAhePaO0x7gHfZAGBb33Bif7bqu+iOGSDXffZi09wnzuPEItxibxc16m2gNBN5tsr/
         Tn7qsk41aAyKtiruyRKtpCFetmDra+I8gy55/+vEX2DE6UNH8ssyhFfftuNLCTH6pT7N
         ep0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712835798; x=1713440598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3JNF0m65GaovNtbabRD8x6iyV5wlnJr6JeL+rCfjFI=;
        b=gltEMKtBNvtvmzjTDOXmyCiJalq3kdM6hkVc3kDgG4/OsNBY/ZKU4Z0lO1eZYticIY
         GxjqHkhgqT8ZoFHzE+5E9C2r2ksvFxn9CzPD2n6heWfMGDXFCtFiPdeqol4P0aCs1dT/
         8HwMcwrZeUc1U6FdSHgTY7ShhManbv8S8FJF/da32BERz2cS9wux/pKWDD5e6x9SV/Pm
         UQ2VnUHoUhgodqSDFhc4Om6Ak5mV96JQmEF7EkLbDf1a6SmORntPwlcM/jLpZq9pA9Kw
         TdWeOPePLRUU1nahdWZUjZ5DNNOrM22TmtsDmYCFZZNHx5lw9cv0/fNgbWgrAfXL/Mdl
         3CGw==
X-Forwarded-Encrypted: i=1; AJvYcCV0w5z8xexMz0e2Ajw811psfHNMJNcHqk5/8GWnBjWp+gpf947LuYO3NimVrPhQHy9JfS7YYv16hrAE1gPhw5XgcBRtwUTOxOyINzv8nQ==
X-Gm-Message-State: AOJu0Ywj7iL31d8KMkGRoGcJnv4WI++i159jYQwX7bT/nNchl7pC3heY
	diHHyW5NIM1BJEZapkzHbCKyWS88Y78mjnPOTIXct17Jc5VfdY5LGRbeAuKUQW0=
X-Google-Smtp-Source: AGHT+IHu0jxLDJtYyS9t7l7JLn9IbQHAl8OYILqfJ0/xU0up7iyTEJgAbd/gj41pkUqJkZdJHmyB2g==
X-Received: by 2002:a05:6512:3b26:b0:517:64ec:1251 with SMTP id f38-20020a0565123b2600b0051764ec1251mr4373816lfv.15.1712835797814;
        Thu, 11 Apr 2024 04:43:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id m13-20020a05651202ed00b00516d05c9cbesm189186lfq.82.2024.04.11.04.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 04:43:17 -0700 (PDT)
Date: Thu, 11 Apr 2024 14:43:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/3] usb: typec: ucsi_glink: drop special handling for
 CCI_BUSY
Message-ID: <mbf725rqsqrg6hktkmj2r4z34i4jdgcmemqkclzfmvmfitsxky@hfef5euxv5b5>
References: <20240409-qcom-ucsi-fixes-bis-v2-0-6d3a09faec90@linaro.org>
 <20240409-qcom-ucsi-fixes-bis-v2-3-6d3a09faec90@linaro.org>
 <ZhWWYQMluJCvYFKF@cae.in-ulm.de>
 <CAA8EJprTbtTSkZ18dejEgvhJOEQKQiwpE+6JkbHiO4H-yeKuhg@mail.gmail.com>
 <ZhZCsyeXa093OZnR@cae.in-ulm.de>
 <s2w7qfrbm3lq46hp4r4grmljg7cs24d6lmpiqr2mllxszte6wc@w7rh47o3z6rc>
 <ZheAahcOoGemxGgw@cae.in-ulm.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZheAahcOoGemxGgw@cae.in-ulm.de>

On Thu, Apr 11, 2024 at 08:17:14AM +0200, Christian A. Ehrhardt wrote:
> 
> Hi Dmitry,
> 
> On Thu, Apr 11, 2024 at 12:09:31AM +0300, Dmitry Baryshkov wrote:
> > On Wed, Apr 10, 2024 at 09:41:39AM +0200, Christian A. Ehrhardt wrote:
> > > 
> > > Hi Dmitry,
> > > 
> > > On Wed, Apr 10, 2024 at 01:58:58AM +0300, Dmitry Baryshkov wrote:
> > > > On Tue, 9 Apr 2024 at 22:26, Christian A. Ehrhardt <lk@c--e.de> wrote:
> > > > >
> > > > >
> > > > > Hi Dmitry,
> > > > >
> > > > > On Tue, Apr 09, 2024 at 06:29:18PM +0300, Dmitry Baryshkov wrote:
> > > > > > Newer Qualcomm platforms (sm8450+) successfully handle busy state and
> > > > > > send the Command Completion after sending the Busy state. Older devices
> > > > > > have firmware bug and can not continue after sending the CCI_BUSY state,
> > > > > > but the command that leads to CCI_BUSY is already forbidden by the
> > > > > > NO_PARTNER_PDOS quirk.
> > > > > >
> > > > > > Follow other UCSI glue drivers and drop special handling for CCI_BUSY
> > > > > > event. Let the UCSI core properly handle this state.
> > > > > >
> > > > > > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > > >  drivers/usb/typec/ucsi/ucsi_glink.c | 10 ++++------
> > > > > >  1 file changed, 4 insertions(+), 6 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> > > > > > index 9ffea20020e7..fe9b951f5228 100644
> > > > > > --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> > > > > > +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> > > > > > @@ -176,7 +176,8 @@ static int pmic_glink_ucsi_sync_write(struct ucsi *__ucsi, unsigned int offset,
> > > > > >       left = wait_for_completion_timeout(&ucsi->sync_ack, 5 * HZ);
> > > > > >       if (!left) {
> > > > > >               dev_err(ucsi->dev, "timeout waiting for UCSI sync write response\n");
> > > > > > -             ret = -ETIMEDOUT;
> > > > > > +             /* return 0 here and let core UCSI code handle the CCI_BUSY */
> > > > > > +             ret = 0;
> > > > > >       } else if (ucsi->sync_val) {
> > > > > >               dev_err(ucsi->dev, "sync write returned: %d\n", ucsi->sync_val);
> > > > > >       }
> > > > > > @@ -243,11 +244,8 @@ static void pmic_glink_ucsi_notify(struct work_struct *work)
> > > > > >               ucsi_connector_change(ucsi->ucsi, con_num);
> > > > > >       }
> > > > > >
> > > > > > -     if (ucsi->sync_pending && cci & UCSI_CCI_BUSY) {
> > > > > > -             ucsi->sync_val = -EBUSY;
> > > > > > -             complete(&ucsi->sync_ack);
> > > > > > -     } else if (ucsi->sync_pending &&
> > > > > > -                (cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))) {
> > > > > > +     if (ucsi->sync_pending &&
> > > > > > +         (cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))) {
> > > > > >               complete(&ucsi->sync_ack);
> > > > > >       }
> > > > > >  }
> > > > >
> > > > > This handling of the command completion turned out to be racy in
> > > > > the ACPI case: If a normal command was sent one should wait for
> > > > > UCSI_CCI_COMMAND_COMPLETE only. In case of an UCSI_ACK_CC_CI
> > > > > command the completion is indicated by UCSI_CCI_ACK_COMPLETE.
> > > > >
> > > > > While not directly related, a port of this
> > > > >     https://lore.kernel.org/all/20240121204123.275441-3-lk@c--e.de/
> > > > > would nicely fit into this series.
> > > > 
> > > > Ack, I'll take a look.
> > > 
> > > Thanks.
> > > 
> > > > However... I can not stop but notice that CCG and STM32 glue drivers
> > > > use the same old approach as we do. Which probably means that they
> > > > might have the same issue.
> > > 
> > > I did ping the ccg people wrt. this but they have a different
> > > workaround that saves them at least most of the time, so I let
> > > this drop.
> > > 
> > > > Could you please consider pulling up that
> > > > code into the UCSI driver? Maybe the low-level code really should just
> > > > read/write the messages, leaving all completions and CCI parsing to
> > > > the core layer?
> > > 
> > > I did consider that but one of the ideas behind the new API for
> > > UCSI backends was that backends can send commands (e.g. as part of
> > > a quirk) even in the middle of a ->sync_write() call. Currently,
> > > I don't really see how to combine this with completion handling
> > > in the UCSI core.
> > > 
> > > > > I don't have the hardware to do this myself.
> > > 
> > > I did propose other changes to the API with little respone here:
> > >     https://lore.kernel.org/all/20240218222039.822040-1-lk@c--e.de/
> > > That could possibly be extended to achieve this. But again, that
> > > would require testers for all the backends.
> > 
> > Well, I think that the patchset is too intrusive and (from the
> > pmic-glink perspective) is too low-level.
> 
> Point taken.
> 
> > I'd start by pulling the sync_write() into the core layer, leaving just
> > async_write in the glue layer. The async_write() then can be renamed to
> > something like send_cmd(). Once required we can add the data pointer to
> > this callback.
> 
> Fine with me.
> 
> However, this basically looks to me what we had before the transition
> from the old to the new API wrt. command completion. So it basically
> used to be that way and it was changed bei Heikki for a reason.
> See below.
> 
> > I liked the idea of getting the CCI from the notification (in case of
> > pmic-glink it works this way on all platforms except sc8180x).
> 
> Yeah. ACPI has a quirk to do just this for some platforms that won't
> work properly otherwise. Additionally, strange things can happen if
> CCI changes between command completion and the re-read in the UCSI
> core. E.g. a command that ran into a timeout could be completed by
> then or a busy flag seen in the event handler could be gone.
> 
> What's also nagging at me is the not so obvious fact that the
> notification handling can but doesn't have to happen under the PPM
> lock. So whatever we do there may still happend in the middle of a
> ->sync_write(). But maybe we should think about this later.
> 
> > So what about having a really simple interface:
> > 
> > sruct ucsi_operations {
> > 	/*
> > 	 * send the command without waiting for the result
> > 	 * can be extended with u8 *data, size_t data_len once
> > 	 * necessary.
> > 	 * maybe use u8 control[8] instead of u64 control.
> > 	 */
> > 	int send_command(struct ucsi *, u64 control);
> > 
> > 	int read_data(struct ucsi *, void *buf, size_t len);
> > 	int read_version(struct ucsi *, u16 *version);
> > 	/* to be used only for reset handling */
> > 	int read_cci(struct ucsi *, u32 cci);
> > 
> > 	// other ops like update_altmode, as is
> > };
> 
> In the Dell quirk for ACPI the ->sync_write operation (at one point)
> did the following (simplified):
> 
> - Send the command to the PPM and wait for the result
> - If the command was an ACK for a connector change send another
>   ack and wait for the result.
> - Report the result of the original command to the UCSI core.

This kind of processing can go to the driver's ISR handler.

> 
> I.e. the quirk post-processes the result of the original command,
> possibly sending other commands in the process.
> 
> The command completion was pushed into the backends when the new
> API was introduced to allow this type of thing and keep it contained
> in the backends and not in the UCSI core. See
>    https://lore.kernel.org/all/20190926100727.71117-10-heikki.krogerus@linux.intel.com/
> or the commit message of bdc62f2bae8fb0e8e99574de5232f0a3c54a27df
> in mainline.
> 
> > /* to be called by the glue driver once it gets the notification from
> >  * PPM */
> > void ucsi_notify(struct ucsi *ucsi, u32 cci);
> > 
> > This way we can pull all the common ACK/connection_changed/completion
> > code into the core, while keeping glue layers flexible enough.
> 
> I'm not saying that we shouldn't do this. But I'm pointing out that
> doing it differently seems to have been a deliberate decision...

Yes, I saw bits of that in the git history. The problem is that
current design ends up with the boilerplate code in all glue drivers.

Let's see if we can get any comment from Heikki.

> 
> 
> Best regards,
> Christian

-- 
With best wishes
Dmitry

