Return-Path: <linux-arm-msm+bounces-42853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BBB9F866B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61D0D161905
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 20:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAA41A3A80;
	Thu, 19 Dec 2024 20:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KbfgnlfM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CED8111A8;
	Thu, 19 Dec 2024 20:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734641948; cv=none; b=AFAGQCpXtps3gFd4k4OdxHibKoirD+pqm+oE502bE+GSXq38Buoj0sESHXwoDk/MkWBLi0wuGmQP0VYHbTLUwfFt10k7f3ZY+w9kD+hOhA4fANul7EI43zFQNms4kKUGqHXZnDPkK1eAFpmhxH4/uROQ6ldy4pf1tMwPuElMeeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734641948; c=relaxed/simple;
	bh=YjrRdHYKGhnsITy8zjSRFVmkcRgglVZLshnUOYFEx5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NjHKv0C9JknIzrqSWpnleemVJwNQJB83H5fttrPwsoAGCZTqybpweQpG/TNi8RUfRxlKYd0WD+ump35WsgCLrmCTjunG/l9DoPcAUsKC2sSELzlEAbCiHqaY8mGPWaf47If0oqkvX2tWwa0ClPmCHsmrxznF/+/IjBys0d13L4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KbfgnlfM; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2a3939a758dso414683fac.1;
        Thu, 19 Dec 2024 12:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734641945; x=1735246745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0Nl740SdQFb/mWMyJAWlhHl8LibqLONteLoXkNY5GM=;
        b=KbfgnlfM4/VmScoPStDete10S1xU7Dc5laWykcT4ZrOSC1KIDCd/N0bNW3+fhOD4Tz
         pW7fd429gQ0dX/ExXiwjCBdpj3ziL08q2t0lcLziZ3s5Um7ERijYMdNKgqMv4MuvLXy8
         mH32ALGCfgAFC/VsuvYom91710D+dHUAchN9xeyWH1NbxTPhAVQlM2H5aT1glWc+Xms9
         zeLaL28i0+geUdq7UxwIu/+/GidcPvkXMka0upAS3DZd4nuMXOQGeoxbEKB5/Nean/Wg
         Mu11ZppoSiYnE/7qL4lR2RwOus3aC8YAeG07Etvxd+1U2x2hyMzPSfnzNIT9SJuXhchp
         6rKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734641945; x=1735246745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0Nl740SdQFb/mWMyJAWlhHl8LibqLONteLoXkNY5GM=;
        b=fb28Ci3BUgf9s2wKOX/ygaxt+XSKQdA5S46c6OUI3ny0C08KJVznA0mC/zDcVZu9FV
         yuGfBKTztljffhgdEAGH/vie2wWpm6pukadClDBXlB3qXe5EYAAdDLEVnCQEKIm1tbMI
         C4hrvqsPv4SUOH/I65kTOGNTbPC8IqWXWwGwpEgdirhduMTjrAIoljtV/1bkXoRdN7lt
         +TABJKqVrUS8YTQEEN5PbGktgDkPHaSGsrvHXofxdnmU99AZRsb1YbQJ7dcUPgnygdxF
         +WVTrNp/nHCykoLL38aPjFz5wqrVEfoXdCotIhKTh31Ux5AuZOGu570rgpIS6zICphfs
         bqTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZEVG7km3WlJA/hZrbtrtMKB8ux8AEbUjFC/P0hpK2UollE59eAA7h+DOj57/EgLS/tZ0Mn9hhIYMnKAoI@vger.kernel.org, AJvYcCWzr9UAJZbAtRUFJuY/ldfptxh4kzxdy8j4ZXyp2G+loFtWN2Jf7FCqoVaBKWmjsnv5oOCeC0sTee3Tge3fixE=@vger.kernel.org, AJvYcCXbzEHh/ZAKaDifMrvDHyyg931j5EvbIrSJFcydvYOwhImOK9J0Nc7MNYz4okfWq4LnWTlbGgBLlBY+KXU6@vger.kernel.org, AJvYcCXndDC3y+Ewra9AK79vu01jQcY+dCxJZVPZ6ndhuEgdrfSIqF/dMfntPyrVSzeNJbeeShRm6Or+qVNE+BEpFfRd9pnmBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxphzD2qHWUUiZKpN9/e2a2LuiksufUHlajKZ5Fe+QIzwVHS0Hc
	QJWHHwrk7CV6QVUs4Kg0CRjgl37PcJz4OF8pZQMnpR6gYo1f51U0GMfG2lq9Aeuf3B9dS1Etoh6
	E/QVOwLyT+OxhXqnPMX8tzarX5pE=
X-Gm-Gg: ASbGnct8jHLPRhiRr45Jl4B5S2831EQd0iW5DoPv7lgtrab11M7goNuag5B7Z8G46so
	BAN82bCCJSg8o3wxNUJ9h9ks8MdqXJ6k/ybf8I220jcZwbyKEUD80kJdQ8AKFmXUpRqOARxna
X-Google-Smtp-Source: AGHT+IEdI1sWWiMU6wk9mllBIksD8l/nflFc189L8ied//My3XEJy3sGY1wxVSphbpfOtMMZmryL9Im7zTonKElJvjM=
X-Received: by 2002:a05:6870:e07:b0:296:aef8:fe9a with SMTP id
 586e51a60fabf-2a7fafffae5mr246361fac.7.1734641945474; Thu, 19 Dec 2024
 12:59:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
 <20241219200821.8328-2-maccraft123mc@gmail.com> <a2310cf8-5e00-4233-8c56-f04d3f692b13@linaro.org>
In-Reply-To: <a2310cf8-5e00-4233-8c56-f04d3f692b13@linaro.org>
From: Maya Matuszczyk <maccraft123mc@gmail.com>
Date: Thu, 19 Dec 2024 21:58:29 +0100
Message-ID: <CAO_MupK8GYwNep9k-C28=Ly8wgn1T6LLiYnFcbKg0spRNXbkYw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] platform: arm64: Add driver for EC found in most
 X1E laptops
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

czw., 19 gru 2024 o 21:43 Bryan O'Donoghue
<bryan.odonoghue@linaro.org> napisa=C5=82(a):
>
> On 19/12/2024 20:08, Maya Matuszczyk wrote:
> > Currently it features only reporting that the AP is going to suspend,
> > which results in keyboard backlight turning off and the power LED
> > slowly blinking on the Lenovo Yoga Slim 7x.
> >
> > Honor Magicbook Art 14 and Lenovo Yoga Slim 7x are known to have
> > firmware with extensions which would need appropriate handling.
> > For reverse engineering the firmware on them I have written a Rust
> > utility:
> >
> > https://github.com/Maccraft123/it8987-qcom-tool.git
> >
> > Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> > ---
> >   MAINTAINERS                              |   6 +
> >   drivers/platform/arm64/Kconfig           |   8 ++
> >   drivers/platform/arm64/Makefile          |   1 +
> >   drivers/platform/arm64/qcom-x1e-it8987.c | 158 ++++++++++++++++++++++=
+
> >   4 files changed, 173 insertions(+)
> >   create mode 100644 drivers/platform/arm64/qcom-x1e-it8987.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b878ddc99f94..08d170e2e1e3 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12890,6 +12890,12 @@ S:   Maintained
> >   W:  http://legousb.sourceforge.net/
> >   F:  drivers/usb/misc/legousbtower.c
> >
> > +QCOM IT8987 EC DRIVER
> > +M:   Maya Matuszczyk <maccraft123mc@gmail.com>
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yam=
l
> > +F:   drivers/platform/arm64/qcom-x1e-it8987.c
> > +
> >   LETSKETCH HID TABLET DRIVER
> >   M:  Hans de Goede <hdegoede@redhat.com>
> >   L:  linux-input@vger.kernel.org
> > diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kc=
onfig
> > index f88395ea3376..ebb7b4f70ca0 100644
> > --- a/drivers/platform/arm64/Kconfig
> > +++ b/drivers/platform/arm64/Kconfig
> > @@ -49,4 +49,12 @@ config EC_LENOVO_YOGA_C630
> >
> >         Say M or Y here to include this support.
> >
> > +config EC_QCOM_X1E_IT8987
> > +     tristate "Embedded Controller driver for most X1E80100 laptops"
> > +     depends on ARCH_QCOM || COMPILE_TEST
> > +     depends on I2C
> > +     help
> > +       This driver currently supports reporting device suspend to the =
EC so it
> > +       can take appropriate actions.
> > +
> >   endif # ARM64_PLATFORM_DEVICES
> > diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/M=
akefile
> > index b2ae9114fdd8..b9aa195bc1e6 100644
> > --- a/drivers/platform/arm64/Makefile
> > +++ b/drivers/platform/arm64/Makefile
> > @@ -7,3 +7,4 @@
> >
> >   obj-$(CONFIG_EC_ACER_ASPIRE1)       +=3D acer-aspire1-ec.o
> >   obj-$(CONFIG_EC_LENOVO_YOGA_C630) +=3D lenovo-yoga-c630.o
> > +obj-$(CONFIG_EC_QCOM_X1E_IT8987) +=3D qcom-x1e-it8987.o
> > diff --git a/drivers/platform/arm64/qcom-x1e-it8987.c b/drivers/platfor=
m/arm64/qcom-x1e-it8987.c
> > new file mode 100644
> > index 000000000000..d27067d6326a
> > --- /dev/null
> > +++ b/drivers/platform/arm64/qcom-x1e-it8987.c
> > @@ -0,0 +1,158 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
> > + */
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/input.h>
> > +#include <linux/input/sparse-keymap.h>
>
> Your includes should be alphabetised.
>
> > +
> > +#define EC_IRQ_REASON_REG 0x05
> > +#define EC_SUSPEND_RESUME_REG 0x23
> > +#define EC_IRQ_ENABLE_REG 0x35
> > +
> > +#define EC_NOTIFY_SUSPEND_ENTER 0x01
> > +#define EC_NOTIFY_SUSPEND_EXIT 0x00
> > +#define EC_NOTIFY_SCREEN_OFF 0x03
> > +#define EC_NOTIFY_SCREEN_ON 0x04
> > +
> > +#define EC_IRQ_MICMUTE_BUTTON 0x04
> > +#define EC_IRQ_FAN1_STATUS_CHANGE 0x30
> > +#define EC_IRQ_FAN2_STATUS_CHANGE 0x31
> > +#define EC_IRQ_FAN1_SPEED_CHANGE 0x32
> > +#define EC_IRQ_FAN2_SPEED_CHANGE 0x33
> > +#define EC_IRQ_COMPLETED_LUT_UPDATE 0x34
> > +#define EC_IRQ_COMPLETED_FAN_PROFILE_SWITCH 0x35
> > +#define EC_IRQ_THERMISTOR_1_TEMP_THRESHOLD_CROSS 0x36
> > +#define EC_IRQ_THERMISTOR_2_TEMP_THRESHOLD_CROSS 0x37
> > +#define EC_IRQ_THERMISTOR_3_TEMP_THRESHOLD_CROSS 0x38
> > +#define EC_IRQ_THERMISTOR_4_TEMP_THRESHOLD_CROSS 0x39
> > +#define EC_IRQ_THERMISTOR_5_TEMP_THRESHOLD_CROSS 0x3a
> > +#define EC_IRQ_THERMISTOR_6_TEMP_THRESHOLD_CROSS 0x3b
> > +#define EC_IRQ_THERMISTOR_7_TEMP_THRESHOLD_CROSS 0x3c
> > +#define EC_IRQ_RECOVERED_FROM_RESET 0x3d
> > +
> > +struct qcom_x1e_it8987_ec {
> > +     struct i2c_client *client;
> > +     struct input_dev *idev;
> > +     struct mutex lock;
> > +};
> > +
> > +static irqreturn_t qcom_x1e_it8987_ec_irq(int irq, void *data)
> > +{
> > +     struct qcom_x1e_it8987_ec *ec =3D data;
> > +     struct device *dev =3D &ec->client->dev;
> > +     int val;
> > +
> > +     guard(mutex)(&ec->lock);
>
> What's the thing that can execute at the same time as this procedure -
> there doesn't appear to be any concurrent candidate in this patch.
The user could suspend the laptop and the EC could fire an IRQ at the same
time... I'll need to add mutex locking to suspend/resume functions


> > +
> > +     val =3D i2c_smbus_read_byte_data(ec->client, EC_IRQ_REASON_REG);
> > +     if (val < 0) {
> > +             dev_err(dev, "Failed to get EC IRQ reason: %d\n", val);
> > +             return IRQ_HANDLED;
> > +     }
> > +
> > +     dev_info(dev, "Unhandled EC IRQ reason: %d\n", val);
>
> Should an unhandled IRQ be an info or an err ?
I don't know, it's "unimplemented but doesn't really matter"

>
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static int qcom_x1e_it8987_ec_probe(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     struct qcom_x1e_it8987_ec *ec;
> > +     int ret;
> > +
> > +     ec =3D devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> > +     if (!ec)
> > +             return -ENOMEM;
> > +
> > +     mutex_init(&ec->lock);
> > +     ec->client =3D client;
> > +
> > +     ret =3D devm_request_threaded_irq(dev, client->irq,
> > +                                     NULL, qcom_x1e_it8987_ec_irq,
> > +                                     IRQF_ONESHOT, "qcom_x1e_it8987_ec=
", ec);
> > +     if (ret < 0)
> > +             return dev_err_probe(dev, ret, "Unable to request irq\n")=
;
> > +
> > +     ret =3D i2c_smbus_write_byte_data(client, EC_IRQ_ENABLE_REG, 0x01=
);
> > +     if (ret < 0)
> > +             return dev_err_probe(dev, ret, "Failed to enable interrup=
ts\n");
> > +
> > +     return 0;
> > +}
> > +
> > +static void qcom_x1e_it8987_ec_remove(struct i2c_client *client)
> > +{
> > +     struct device *dev =3D &client->dev;
> > +     int ret;
> > +
> > +     ret =3D i2c_smbus_write_byte_data(client, EC_IRQ_ENABLE_REG, 0x00=
);
> > +     if (ret < 0)
> > +             dev_err(dev, "Failed to disable interrupts: %d\n", ret);
> > +}
> > +
> > +static int qcom_x1e_it8987_ec_suspend(struct device *dev)
> > +{
> > +     struct i2c_client *client =3D to_i2c_client(dev);
> > +     int ret;
> > +
> > +     ret =3D i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG, =
EC_NOTIFY_SCREEN_OFF);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG, =
EC_NOTIFY_SUSPEND_ENTER);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return 0;
> > +}
> > +
> > +static int qcom_x1e_it8987_ec_resume(struct device *dev)
> > +{
> > +     struct i2c_client *client =3D to_i2c_client(dev);
> > +     int ret;
> > +
> > +     ret =3D i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG, =
EC_NOTIFY_SUSPEND_EXIT);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG, =
EC_NOTIFY_SCREEN_ON);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id qcom_x1e_it8987_ec_of_match[] =3D {
> > +     { .compatible =3D "lenovo,yoga-slim7x-ec" },
> > +     { .compatible =3D "qcom,x1e-it9897-ec" },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(of, qcom_x1e_it8987_ec_of_match);
> > +
> > +static const struct i2c_device_id qcom_x1e_it8987_ec_i2c_id_table[] =
=3D {
> > +     { "qcom-x1e-it8987-ec", },
> > +     {}
> > +};
> > +MODULE_DEVICE_TABLE(i2c, qcom_x1e_it8987_ec_i2c_id_table);
> > +
> > +static DEFINE_SIMPLE_DEV_PM_OPS(qcom_x1e_it8987_ec_pm_ops,
> > +             qcom_x1e_it8987_ec_suspend,
> > +             qcom_x1e_it8987_ec_resume);
> > +
> > +static struct i2c_driver qcom_x1e_it8987_ec_i2c_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "yoga-slim7x-ec",
> > +             .of_match_table =3D qcom_x1e_it8987_ec_of_match,
> > +             .pm =3D &qcom_x1e_it8987_ec_pm_ops
> > +     },
> > +     .probe =3D qcom_x1e_it8987_ec_probe,
> > +     .remove =3D qcom_x1e_it8987_ec_remove,
> > +     .id_table =3D qcom_x1e_it8987_ec_i2c_id_table,
> > +};
> > +module_i2c_driver(qcom_x1e_it8987_ec_i2c_driver);
> > +
> > +MODULE_DESCRIPTION("Lenovo Yoga Slim 7x Embedded Controller");
> > +MODULE_LICENSE("GPL");
>
> Otherwise looks pretty good to me, nice hacking :)
>
> ---
> bod
>

