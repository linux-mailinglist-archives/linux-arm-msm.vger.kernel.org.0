Return-Path: <linux-arm-msm+bounces-12869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9418A86B109
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 14:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DA86282D13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 13:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FD836132;
	Wed, 28 Feb 2024 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeYcSk6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B635673519
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 13:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709128693; cv=none; b=lneL2hzewVMp5BWL8YyjkdrZnXgHWIZq9jsV1sYCQKASWJ6ux3BA8nXt7GreeNuAMaLtyQae2t7zhRjd8+TBB6sYuTkihM4tF4B538WYAkFmoXGaUjicq0UPRwOAwtN6ROfXhl/wTqyqrfi/dTN/ZZifxZRvw/656HUMyGAWFCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709128693; c=relaxed/simple;
	bh=LenFuzh0OO1nNqjUDuv1zWSf96rGb22flxuDbUX6arY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BqzRVnMSi8CKPWLJSy0ajFBnT2Vr774S8rM8xbyZu0H9NKsq6E7lyNAF8PNTGTgU2pmPePUhuSY1eX+tbjLghQTMwlHOzvE+WzbLqR1vtKvqZxMfwbB5b1q6K7TWs5EN4SQwm7EGSnx6orrszP7Np+yVSPttXmw0eBI2r9jmu2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EeYcSk6d; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5645960cd56so6670395a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 05:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709128690; x=1709733490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyQfhxhelFPgISoeESSslnSqqfXJlqEoJYFAB17cg8w=;
        b=EeYcSk6dax+Y83JDxxIDSfyh7WwW4agjMtKjFwVIizZO6h1igeeG4V1IHKY82UV8aR
         l1j98Mkp60yvOPrsIRgNSQV7qQcaHnbCGKRZpQZoSLxsMLoGYbWK5P7dCqdXscXE8t99
         M4CvXRnaQekcnlrUZE+CQUNQ+33R0TbcUMY8mF0UrXFI3b/cZS0ANNoQGXqSLXce9urK
         kRP5/CBqOeE+V6hfuDkn2ezpZUHUc95w1+9fBZ7/Nd76Ngl3yB2SdrNEjH3Df38In1LS
         H0uqGaCOlt3eP5WtU771+cLEOwaaE9EHFbSEL6diUQg2E+9vBR/4aa1xL7jltLu/WwZ6
         LNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709128690; x=1709733490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyQfhxhelFPgISoeESSslnSqqfXJlqEoJYFAB17cg8w=;
        b=ojNadf9juyX+S6Q06sLlrk1L6b+Z0vC9qsxGc1BiqZe/7C1pqxdq3zp5BRIkyLNnRE
         xz5lcVSwkkSCHMLWrt6fce/7FJjYWcgwXWuRdPeCjmSxfPNNLj82xPzxEsl4ud3/8OTc
         7Ki56AYtGdu2buxVgZ86iT+S7+Ne0RJfDhUj8soKiymDRkm6HaZMsfI6Qj6qiqycQBP+
         wZcRhM5F2hdfv73W9imdK1y/xyT+hcaUXzRormwRPpKpqTR2cwawgmtmlQV2ZnFBUOFu
         n6nUV0cMhwyImcQDJeoYyTSXRJ1r44YaIHD3MFpaMukQ4YNLOkwJW1KKDDp6rEpuwkvj
         SJQA==
X-Gm-Message-State: AOJu0Yyopw2w4dijcCLA3TyjVpe4ZHrrFbmpyYHlo2ORnXnh1fPNNqmP
	ezKcEW4UBAShpsUmCQwvHOhylRCyhvijVpiJWF00sdTvfPARX9V0AMw/mK0NFaOXQXg9UqwU8uV
	cHGc+ezCsZyPkdkLhNvYhQ+GNCKw=
X-Google-Smtp-Source: AGHT+IFtGuST/eVmJz2/E4g5Z2AQysiqaVNx/81QP6EbmX3zb0sE+5NxzIuRU0BHbuzfvM1u3rhWnWn4WT+2DHVLLlc=
X-Received: by 2002:a17:906:f899:b0:a3e:e0b7:90d0 with SMTP id
 lg25-20020a170906f89900b00a3ee0b790d0mr8667102ejb.41.1709128689782; Wed, 28
 Feb 2024 05:58:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEg6Gx6JqG1-OQyq=jBwKYy+J5TRCq68RXj8OLMo0+1W+uAh-A@mail.gmail.com>
 <04859c35-c09c-4c08-a136-6d5c0b37fd29@quicinc.com>
In-Reply-To: <04859c35-c09c-4c08-a136-6d5c0b37fd29@quicinc.com>
From: Robert Arndt <robertarndt201@gmail.com>
Date: Wed, 28 Feb 2024 05:57:58 -0800
Message-ID: <CAEg6Gx6kmAYES9UG1HeTzF2t6Ri3E6voo2S0vCkPUQ3Hx2CMxg@mail.gmail.com>
Subject: Re: UVC Configuration Issue on RB5
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

  I added the "f1" subdirectory, and noticed an ss header missing, and
I finally was able to bind, then run the ideasonboard's uvc-gadget
app, then see a video device on my 18.04 laptop host.  The device
appeared for a second but the host said the device wouldn't accept the
address it was providing.  But still the best progress I've had in
weeks.  Thank you so much Krishna, it was getting frustrating.

I'm not sure what you meant by "deferred for a600000.usb"...does that
mean the UDC driver went into the "pending" list of drivers?

Big Thanks,
Robert


On Tue, Feb 27, 2024 at 8:42=E2=80=AFPM Krishna Kurapati PSSNV
<quic_kriskura@quicinc.com> wrote:
>
>
> On 2/28/2024 8:17 AM, Robert Arndt wrote:
> > Hi Folks, I was wondering if anyone has gotten UVC working on the RB5?
> > I'm having trouble with the UDC probe and not sure if it's a problem
> > with kernel configuration, configFS script (haven't made into a service
> > yet), or some UDC problem.
> >
> > I'm getting a ENODEV error 19 when I try to bind my UVC configuration t=
o
> > the UDC according to dmesg, and stdin output says "Device or resource
> > busy".  I put printk statements into driver/usb/udc/core.c's
> > usb_gadget_probe_driver() which is producing the error line:
> >  >>
> >          mutex_lock(&udc_lock);
> >          if (driver->udc_name) {
> >                  list_for_each_entry(udc, &udc_list, list) {
> >                          ret =3D strcmp(driver->udc_name,
> > dev_name(&udc->dev));
> >
> >                          printk("****DEBUG: Driver->udc_name: %s\n",
> > driver->udc_name);
> >                          printk("****DEBUG: udc->dev name: %s\n",
> > &udc->dev);
> >
> >                          if (!ret)
> >                                  break;
> >                  }
> >                  if (ret)
> >                          ret =3D -ENODEV;
> >                  else if (udc->driver)
> >                          ret =3D -EBUSY;
> >                  else
> >                          goto found;
> > <<
> >
> > ...and while udc_name came up with the string a600000.usb, &udc->dev wa=
s
> > an empty string.  So it seems like the device is not in the master UDC
> > list?  I don't know why...maybe my ConfigFS script is wrong?
> >
> > I've attached my kernel config, ConfigFS script, and dmesg output as a
> > single file.  Would appreciate if someone could tell me if I'm looking
> > in the right direction or completely off.
> >
>
> Hi Robert,
>
>   Can you check if dwc3 driver probe was successful or if it was
> deferred for the a600000.usb controller. And seems like you are printing
> &udc->dev instead of dev_name(&udc->dev).
>
>   Also the symlink being created must be the following:
>   ln -s functions/uvc.usb0 configs/c.1/f1
>
>   You are directly linking it to c.1 in your script like the following
> which is wrong:
>   ln -s functions/uvc.usb0 configs/c.1
>
>   Can you check if fixing the symlink is helping with successful
> enumeration.
>
> Regards,
> Krishna,

