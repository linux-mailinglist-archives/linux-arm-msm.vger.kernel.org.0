Return-Path: <linux-arm-msm+bounces-16986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 217B489E5D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 00:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BF431F22A3A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 22:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53764158DB7;
	Tue,  9 Apr 2024 22:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qPC+7SyD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E35D158D9D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 22:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712703553; cv=none; b=tc8sJ5FAGoL7ieOsCee/sUJPXL9csxD2Y0knbk1HOOht6XtbFF5WZHS8xSV+vEwk/l+FsoAg9qDn7dDw8Yy2ov2wCzmAEc7yTMbw89uj91rgw775b8y7txRM4Y44QpWqggzE1ZWTjRvPZUWlHyd3XSHQLNrPwzT5sx1Qui+Yt1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712703553; c=relaxed/simple;
	bh=e0zIWUsBbSEOJRt2epgfxhO/Cl9I2MeTGBbdCQ/7NQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aPxSNDwsVmMvqOs383sdJdDgApWmFdeEYs5a+4/aDX4lB25UD63tHRVq6cfz2dyvJpqW/DfqGWph4+tJ9XlRsBwaMMg3CnlHUBYSFaEThvljrl1I98b9Mnm4iiR68jSEetel9RzKv/66XVz6ZPAaSdIRhYUagoGE7Y1x2yW5C4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qPC+7SyD; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-614b02f8ed6so62895307b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 15:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712703550; x=1713308350; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sC+pw9fmCQav50NJARlh9eDkZXXoEqn+0VXDw4DrBkg=;
        b=qPC+7SyDcybdMQSzyoCd6rpH41zlLBWv85ukgTqETto8CzvAdh5YAmKT4AD2PBlPRP
         1Phu3p/gXS/8dWhH11jcontD2r2NwpkI3PdEx8a3cCo+H389wjPP1RBJombbsnmhgrqt
         YHP0C2Neh+0OLJ7ILPLKkdw6LwOHi8w5WZ83RpEPB+XfTa24x2m46bVfRK/uUSvwb0sb
         fKSdqJuZUXqgoChhOMdx438lQDcUbNj/gPMdRid6k2U3q8I2x61dph8bJn03jNkxoyBf
         lXIMIW6sSEp5wk3BMvQUMzXsM/Vx7HYESCoF56c6wzewEcUYyzJ8GPse/pbfTbBC69Mk
         ggMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712703550; x=1713308350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sC+pw9fmCQav50NJARlh9eDkZXXoEqn+0VXDw4DrBkg=;
        b=ZCC5M+hhS0C7A+yiLIMNw8NYg8EdixkKhntHMPMDneZBaETFNOlMQVZSwpN8M8SpLm
         kiDiVteF0p2pPXtMKDQcTmNx3YOYHpEc3KrwQO+JN8Jjx0fTd0RuwHpXm+CS4ukXL7zq
         a3GW0PfSQ0dqVJogwVk+owLy+RaKbjN+hed0lwzRojY0znZhgWImXlPf2n+V3C0L2OpJ
         H/9kk9vjUqLXDiSwVBIYIdQxvt2mGlOY5iVK7UmGqlO+PkeOWzxomv/mAN3AHpwO+T0i
         9X+zlYwsyaFwead9tbmn80DgraRilE+upwcbjJER0ZeE1zb0FNkcZwGChaotX6dGnzyu
         xhzg==
X-Forwarded-Encrypted: i=1; AJvYcCVjbe3CUOSvDU+70nPsOQYfABzOeFLcNam3XMsO6NvLLHo6QtvF9Tw4SRIEBYRAfCJeZm7imGTlazGz0eQrSTGESxMWrWRJrUYZyrO/6w==
X-Gm-Message-State: AOJu0YwWP1PlHX44Lr6nRRsxNW6ogkgJSZUWuG7f6skKqU4aapGEa6mH
	bkR90/lAOz5Z9p5RoRxgN3t6akq3S5Er4DakBvExQpCkh68VhGuzcHNFUOUGCxoKQSGnR7TV7II
	4BlVOCjsKtTEUlB9Gt8XN5uk/b3K1M21sawJg3g==
X-Google-Smtp-Source: AGHT+IGWHmRjiSPWPTmBBPPhWmbaU5b9zrgiWqYnoWcapI2UgzJrqqSc+dHdTyVPpf9/cmgZoUMLuHl32du5IUj09q4=
X-Received: by 2002:a25:9c41:0:b0:dda:c380:689e with SMTP id
 x1-20020a259c41000000b00ddac380689emr3116559ybo.4.1712703549658; Tue, 09 Apr
 2024 15:59:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409-qcom-ucsi-fixes-bis-v2-0-6d3a09faec90@linaro.org>
 <20240409-qcom-ucsi-fixes-bis-v2-3-6d3a09faec90@linaro.org> <ZhWWYQMluJCvYFKF@cae.in-ulm.de>
In-Reply-To: <ZhWWYQMluJCvYFKF@cae.in-ulm.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 10 Apr 2024 01:58:58 +0300
Message-ID: <CAA8EJprTbtTSkZ18dejEgvhJOEQKQiwpE+6JkbHiO4H-yeKuhg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] usb: typec: ucsi_glink: drop special handling for CCI_BUSY
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Apr 2024 at 22:26, Christian A. Ehrhardt <lk@c--e.de> wrote:
>
>
> Hi Dmitry,
>
> On Tue, Apr 09, 2024 at 06:29:18PM +0300, Dmitry Baryshkov wrote:
> > Newer Qualcomm platforms (sm8450+) successfully handle busy state and
> > send the Command Completion after sending the Busy state. Older devices
> > have firmware bug and can not continue after sending the CCI_BUSY state,
> > but the command that leads to CCI_BUSY is already forbidden by the
> > NO_PARTNER_PDOS quirk.
> >
> > Follow other UCSI glue drivers and drop special handling for CCI_BUSY
> > event. Let the UCSI core properly handle this state.
> >
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/usb/typec/ucsi/ucsi_glink.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> > index 9ffea20020e7..fe9b951f5228 100644
> > --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> > +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> > @@ -176,7 +176,8 @@ static int pmic_glink_ucsi_sync_write(struct ucsi *__ucsi, unsigned int offset,
> >       left = wait_for_completion_timeout(&ucsi->sync_ack, 5 * HZ);
> >       if (!left) {
> >               dev_err(ucsi->dev, "timeout waiting for UCSI sync write response\n");
> > -             ret = -ETIMEDOUT;
> > +             /* return 0 here and let core UCSI code handle the CCI_BUSY */
> > +             ret = 0;
> >       } else if (ucsi->sync_val) {
> >               dev_err(ucsi->dev, "sync write returned: %d\n", ucsi->sync_val);
> >       }
> > @@ -243,11 +244,8 @@ static void pmic_glink_ucsi_notify(struct work_struct *work)
> >               ucsi_connector_change(ucsi->ucsi, con_num);
> >       }
> >
> > -     if (ucsi->sync_pending && cci & UCSI_CCI_BUSY) {
> > -             ucsi->sync_val = -EBUSY;
> > -             complete(&ucsi->sync_ack);
> > -     } else if (ucsi->sync_pending &&
> > -                (cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))) {
> > +     if (ucsi->sync_pending &&
> > +         (cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))) {
> >               complete(&ucsi->sync_ack);
> >       }
> >  }
>
> This handling of the command completion turned out to be racy in
> the ACPI case: If a normal command was sent one should wait for
> UCSI_CCI_COMMAND_COMPLETE only. In case of an UCSI_ACK_CC_CI
> command the completion is indicated by UCSI_CCI_ACK_COMPLETE.
>
> While not directly related, a port of this
>     https://lore.kernel.org/all/20240121204123.275441-3-lk@c--e.de/
> would nicely fit into this series.

Ack, I'll take a look.

However... I can not stop but notice that CCG and STM32 glue drivers
use the same old approach as we do. Which probably means that they
might have the same issue. Could you please consider pulling up that
code into the UCSI driver? Maybe the low-level code really should just
read/write the messages, leaving all completions and CCI parsing to
the core layer?

>
> I don't have the hardware to do this myself.

-- 
With best wishes
Dmitry

