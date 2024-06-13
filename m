Return-Path: <linux-arm-msm+bounces-22558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 411AF9066AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 10:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3FFE282790
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 08:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0FD13DBBD;
	Thu, 13 Jun 2024 08:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DGyjKQdt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7B813D893
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 08:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718267211; cv=none; b=MoDdUZtfqu+aImDyv9GVoBwAySNn4VM3Uj3IH5Am/XnWerEyos1Igy2ANPZR7rKu4V8YFthJF7xrp2NWc/sO6usn134sGQ0yd1o2dR35fXMndtkMhxIFAxt8ugD1kYpgna2K+BHKjLcdDmX93wJXLWxSrDc2PPop4X1lQkWjt8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718267211; c=relaxed/simple;
	bh=+/Cd54M7taimSwzXrHgDVYRSG+71hfapAIJPbLSt9Hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZxaThjhzjyKJo4RwuQ7aJuL1tSzZeG+q4crEp2uyEMb/IXXS6CkRqGLJuky5lj7AVNftyZvwGdGBHG6pjsMuvS3olAzEgSn06UNz2MGSdRionLpQIMaUduJZQd3XgA3xU2gykDtuk8fS6n2IkP8ZwyJ10XhQnS3OfQrKLfIrIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DGyjKQdt; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6316253dc2aso2068827b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 01:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718267208; x=1718872008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2Im9dGKZIt0RrtNSRiS+mo63+EnUh986UQ1mB7bgEE=;
        b=DGyjKQdtRPt725gon6zKX0CDMb/4SvXXbz+a8ucF6xToOi9oHXx0jfJB0kLzln8ZHy
         foujg175BB+uqQqzck0FOaofgxOmwiFmLBpsBsHilK9lAjLAqxGA/wlOIfbc68OAmzry
         XzntPyUrT66JoS8Sgm6mn0BJsFE9OiqBxqgDwam76TR0IYX5biAJbXBf/F3EudhUJ3jV
         jwZk9eiJFBPjMxd7eBpS4abwutKnug+p8yyDXDIyBVWaeigeej/uv97fjGx+xgCEkt/O
         UODESD3/L4nVVUFpu1J1AQCIq+ZGa/VBIlHUVhr3xD742PvMvp1w1BNCmWuODGAhchgU
         lC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718267208; x=1718872008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2Im9dGKZIt0RrtNSRiS+mo63+EnUh986UQ1mB7bgEE=;
        b=pKUxQa+u6asBVz3bQVMzJJjVs0tsi1hkLNcy3LOUqFu52PSRPphUxrRlSQp03BnRYy
         dde7ADj/e9XOye4E+pO0hxSxHusQYsGi6i+CawOt2eAaUrycp2KzS5Idy0GgwOKppqcl
         JR9YPVNsdUzKKcPCcIxlmXUFit/SvwYMOnWgFRRHA3obAI4VfTQ3ohcfFVIUJVrXc7fH
         vKQI8NFD3pw4V/TalS+MLN0kvPxL6Qb9WzLMc8FDg+b1s+SvCWiGxpgeoUa+oQmmvgNS
         4OGbj5rTJ0pegP/XSRxDoS3MOfKMSFhjYXV+ZtKcBDxmKT+umR9LeLpv4E/KTMePxcjz
         ovcA==
X-Forwarded-Encrypted: i=1; AJvYcCWe7KEl3jWHlJmi7DaNY1f6zpvEPBPh4EmN543Pgw7MdjYLcHfskVUvdkZfwin40mHNhkPJHib/YcTbtuEguLLb3YHCPQB1jnx1IiXwMg==
X-Gm-Message-State: AOJu0Yw1XG4p1mWpLPa9g1iIYDAPycLmM/SlEdiH/UOe37zwBZjx1URS
	HQDTFAVLnf4oeJR3U02wCBX2Vxx4BFQIk4Pu5npv0H5jQpgtn8M1zXTA4DKMOHoiNsuEB2d96/z
	C7bpggCFV5hHq8fMESs1MU1APiGea7XmTR1iR7Q==
X-Google-Smtp-Source: AGHT+IHynYXydLpvtfOmPpRsO5mf9ev0xqivYqbFIR+VnCUnBShW3FDhzEU1UZGYrqeqwOfV4ZIl0+6KVHd1YV43qv8=
X-Received: by 2002:a0d:e6cf:0:b0:62c:e62d:561d with SMTP id
 00721157ae682-62fbb7f5e6fmr40080067b3.1.1718267208393; Thu, 13 Jun 2024
 01:26:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612-yoga-ec-driver-v6-0-8e76ba060439@linaro.org>
 <20240612-yoga-ec-driver-v6-3-8e76ba060439@linaro.org> <c8c81617-4391-2c4c-1009-4a8a667a14dc@linux.intel.com>
In-Reply-To: <c8c81617-4391-2c4c-1009-4a8a667a14dc@linux.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 11:26:37 +0300
Message-ID: <CAA8EJpqONpegTa-svxhF-2YW8eabCBoiQo5aKEzBC-SxPxSEEQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] usb: typec: ucsi: add Lenovo Yoga C630 glue driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Nikita Travkin <nikita@trvn.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Jun 2024 at 10:30, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 12 Jun 2024, Dmitry Baryshkov wrote:
>
> > The Lenovo Yoga C630 WOS laptop provides implements UCSI interface in
> > the onboard EC. Add glue driver to interface the platform's UCSI
> > implementation.
> >
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> > +static int yoga_c630_ucsi_read(struct ucsi *ucsi, unsigned int offset,
> > +                            void *val, size_t val_len)
> > +{
> > +     struct yoga_c630_ucsi *uec =3D ucsi_get_drvdata(ucsi);
> > +     u8 buf[YOGA_C630_UCSI_READ_SIZE];
> > +     int ret;
> > +
> > +     ret =3D yoga_c630_ec_ucsi_read(uec->ec, buf);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (offset =3D=3D UCSI_VERSION) {
> > +             memcpy(val, &uec->version, min(val_len, sizeof(uec->versi=
on)));
> > +             return 0;
> > +     }
> > +
> > +     if (offset =3D=3D UCSI_CCI)
> > +             memcpy(val, buf, min(val_len, YOGA_C630_UCSI_CCI_SIZE));
> > +     else if (offset =3D=3D UCSI_MESSAGE_IN)
> > +             memcpy(val, buf + YOGA_C630_UCSI_CCI_SIZE,
> > +                    min(val_len, YOGA_C630_UCSI_DATA_SIZE));
> > +     else
> > +             return -EINVAL;
> > +
> > +     return 0;
>
> Hmm, the inconsistency when to do return 0 is a bit odd. Also, using
> switch (offset) would probably be better here anyway to replace all the
> ifs.

I'll see if I can improve this bit.

>
> > +}
> > +
> > +static int yoga_c630_ucsi_async_write(struct ucsi *ucsi, unsigned int =
offset,
> > +                                   const void *val, size_t val_len)
> > +{
> > +     struct yoga_c630_ucsi *uec =3D ucsi_get_drvdata(ucsi);
> > +
> > +     if (offset !=3D UCSI_CONTROL ||
> > +         val_len !=3D YOGA_C630_UCSI_WRITE_SIZE)
> > +             return -EINVAL;
> > +
> > +     return yoga_c630_ec_ucsi_write(uec->ec, val);
> > +}
> > +
> > +static int yoga_c630_ucsi_sync_write(struct ucsi *ucsi, unsigned int o=
ffset,
> > +                                  const void *val, size_t val_len)
> > +{
> > +     struct yoga_c630_ucsi *uec =3D ucsi_get_drvdata(ucsi);
> > +     bool ack =3D UCSI_COMMAND(*(u64 *)val) =3D=3D UCSI_ACK_CC_CI;
> > +     int ret;
> > +
> > +     if (ack)
> > +             set_bit(UCSI_C630_ACK_PENDING, &uec->flags);
> > +     else
> > +             set_bit(UCSI_C630_COMMAND_PENDING, &uec->flags);
> > +
> > +     reinit_completion(&uec->complete);
> > +
> > +     ret =3D yoga_c630_ucsi_async_write(ucsi, offset, val, val_len);
> > +     if (ret)
> > +             goto out_clear_bit;
> > +
> > +     if (!wait_for_completion_timeout(&uec->complete, 5 * HZ))
> > +             ret =3D -ETIMEDOUT;
> > +
> > +out_clear_bit:
> > +     if (ack)
> > +             clear_bit(UCSI_C630_ACK_PENDING, &uec->flags);
> > +     else
> > +             clear_bit(UCSI_C630_COMMAND_PENDING, &uec->flags);
> > +
> > +     return ret;
> > +}
> > +
> > +const struct ucsi_operations yoga_c630_ucsi_ops =3D {
> > +     .read =3D yoga_c630_ucsi_read,
> > +     .sync_write =3D yoga_c630_ucsi_sync_write,
> > +     .async_write =3D yoga_c630_ucsi_async_write,
> > +};
> > +
> > +static void yoga_c630_ucsi_notify_ucsi(struct yoga_c630_ucsi *uec, u32=
 cci)
> > +{
> > +     if (UCSI_CCI_CONNECTOR(cci))
> > +             ucsi_connector_change(uec->ucsi, UCSI_CCI_CONNECTOR(cci))=
;
> > +
> > +     if (cci & UCSI_CCI_ACK_COMPLETE &&
> > +         test_bit(UCSI_C630_ACK_PENDING, &uec->flags))
> > +             complete(&uec->complete);
> > +
> > +     if (cci & UCSI_CCI_COMMAND_COMPLETE &&
> > +         test_bit(UCSI_C630_COMMAND_PENDING, &uec->flags))
> > +             complete(&uec->complete);
>
> Is this racy? Can another command start after an ACK in between these two
> ifs and complete() is called prematurely for the new command? (Or will
> different value in cci protect against that?)

No, there is no race. The UCSI is locked for the duration of the command.

>
> > +}
> > +
> > +static int yoga_c630_ucsi_notify(struct notifier_block *nb,
> > +                              unsigned long action, void *data)
> > +{
> > +     struct yoga_c630_ucsi *uec =3D container_of(nb, struct yoga_c630_=
ucsi, nb);
> > +     u32 cci;
> > +     int ret;
> > +
> > +     switch (action) {
> > +     case LENOVO_EC_EVENT_USB:
> > +     case LENOVO_EC_EVENT_HPD:
> > +             ucsi_connector_change(uec->ucsi, 1);
> > +             return NOTIFY_OK;
> > +
> > +     case LENOVO_EC_EVENT_UCSI:
> > +             ret =3D uec->ucsi->ops->read(uec->ucsi, UCSI_CCI, &cci, s=
izeof(cci));
> > +             if (ret)
> > +                     return NOTIFY_DONE;
> > +
> > +             yoga_c630_ucsi_notify_ucsi(uec, cci);
> > +
> > +             return NOTIFY_OK;
> > +
> > +     default:
> > +             return NOTIFY_DONE;
> > +     }
> > +}
> > +
> > +static int yoga_c630_ucsi_probe(struct auxiliary_device *adev,
> > +                             const struct auxiliary_device_id *id)
> > +{
> > +     struct yoga_c630_ec *ec =3D adev->dev.platform_data;
> > +     struct yoga_c630_ucsi *uec;
> > +     int ret;
> > +
> > +     uec =3D devm_kzalloc(&adev->dev, sizeof(*uec), GFP_KERNEL);
> > +     if (!uec)
> > +             return -ENOMEM;
> > +
> > +     uec->ec =3D ec;
> > +     init_completion(&uec->complete);
> > +     uec->nb.notifier_call =3D yoga_c630_ucsi_notify;
> > +
> > +     uec->ucsi =3D ucsi_create(&adev->dev, &yoga_c630_ucsi_ops);
> > +     if (IS_ERR(uec->ucsi))
> > +             return PTR_ERR(uec->ucsi);
> > +
> > +     ucsi_set_drvdata(uec->ucsi, uec);
> > +
> > +     uec->version =3D yoga_c630_ec_ucsi_get_version(uec->ec);
> > +
> > +     auxiliary_set_drvdata(adev, uec);
> > +
> > +     ret =3D yoga_c630_ec_register_notify(ec, &uec->nb);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return ucsi_register(uec->ucsi);
> > +}
> > +
> > +static void yoga_c630_ucsi_remove(struct auxiliary_device *adev)
> > +{
> > +     struct yoga_c630_ucsi *uec =3D auxiliary_get_drvdata(adev);
> > +
> > +     yoga_c630_ec_unregister_notify(uec->ec, &uec->nb);
> > +     ucsi_unregister(uec->ucsi);
>
> Usually, the remove should tear down in reverse order than the probe side=
.
> Is the divergence from that here intentional?

Yes, it's intentional, so that the driver doesn't get a notification
while UCSI is being torn down. Consider it to be paired with
ucsi_create().

--=20
With best wishes
Dmitry

