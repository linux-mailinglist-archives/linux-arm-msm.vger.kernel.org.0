Return-Path: <linux-arm-msm+bounces-42979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E17D9F91FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 13:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E34B51891DA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 12:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819C01C5CB1;
	Fri, 20 Dec 2024 12:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pfxu9DnA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D0D1C549D;
	Fri, 20 Dec 2024 12:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734696887; cv=none; b=pufnVhUpCQf/n42CrtHUIW0uF6V8P0qdtmZYu4DJZS2KE2RYYRWrGFZeb5G8Swm6jMXAwhveHWFhQAlRWqsC1egXotOJm0QeSRAXnjv3SBT29GzUlnEiaK9cot2KWsEpPW92lUL2XMllnMZ1qiLqA41qWrk7PdqhAYksLetavxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734696887; c=relaxed/simple;
	bh=ra3JT/P8h/5mIIsBdiwHxom+ZTaR7z9oRk8w1GNJU9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GNtjYOUSjp80a6jhJ3LwYeg0Zt0Bzg4RVJ8a8oHmDezYiN3GN3bLTRVXkz6b5r+1eRW636n9BPZTE3XFCGmwzh3EfurciUSqr+0axmwA434/Rv8/kJhv+G9l5Z8tc4v9cEvnoWRCH5APBSM3HiQumf5qfyY0yBKH/NtrNAiaEyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pfxu9DnA; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-29fc424237bso872602fac.0;
        Fri, 20 Dec 2024 04:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734696885; x=1735301685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNZKKrXLoPSNH0Do9TyCcq12/yFWDEf5opO/Uiw9Op4=;
        b=Pfxu9DnAJpYo4YUqLR1pSNx1INFAN4f7JUo2bSRDWpck48QPPfcIeAIAt+U5wREACb
         j8ZBaB96jjpaoaePhHQMHIZoTmd6Uoi0fCAdLDeDSuNy8Uab2ENckV7Y5bOw6hxhgU7t
         ag3gjTEOa4nL/A70oK+LodlR25yYRIoxc6G8ox31P1xsJpff6wH4LO18Ff2mZCqvSPPt
         LY/eOtgbrHZk/yUhUcuiIK9nhWYIi0foeLV0dO19iiuP0ODOPyLrSTwkQsvv6kgoB1QA
         Ps4mTsDOY0vW3usoqr9d4oqasg7rodrlAl1s8tDnkM+If8Qxvvl8WAW32LvaWlmciltX
         ax6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734696885; x=1735301685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNZKKrXLoPSNH0Do9TyCcq12/yFWDEf5opO/Uiw9Op4=;
        b=WMgVPI0NmwSReL0YXwE4a6qfgowwUv2qt+JQ1yhCzdcHRw4aiy90IC+LEeBq09OWDo
         T/fv9xG21pPFom0l4k1HrmKhmk3aYjmovTc0LstspbLGbkP9ce9mLWq43wcA9pz2E8Tw
         +vwucFPuS1rJj/QVxuY00ECMAIY9WadmHlfv9fetqdosvB3Grj4HK26jZfEADBfGvDpG
         RgriKDQ3kpv1ZGg7CaVeWgwfkh6jxsbqgwWUbEMC/PXaDKCbwO2c2in6ugFgM/hCmL9A
         +ukyIn0GmcZfxV1JXfaWN+4Bkn3eW6EfTJxhmLkx2wnyns4yz3Vfu15jCr/HlGHoBAuf
         Hmdg==
X-Forwarded-Encrypted: i=1; AJvYcCUlw9nH3KhzETJZ2omQsQIjaw0eeLPsv/oHgYbTfb/jk/qg9UiYT5m5VmoqU+FMO/yW7RNrWVtbncLLiSbA@vger.kernel.org, AJvYcCV4QvK0/jr0jLdo/L5P10rPhwIl6HKtTGxRYl8hgMzTrv5UmECjyvwnBFp3s6P9PbENJhQaR9qUBhbXF5luB38=@vger.kernel.org, AJvYcCVrPkpJVkzQKSWSw5M8eIC87Ilzsf8HY9+H4bYZieKrsFDJCIrzxA7f25OGWFA7hM7IAXvvHuMD2Rnn3Rhi@vger.kernel.org, AJvYcCXKE3/G4jOc775XRd7t78ZsmXq7ssnqvjNIdFYgjT573LhrEelIJ9ZBznSXfU0alKvzBACITW8QzcqME/CJqlF92I5rmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuUTHp+1vGlLrzUBlQDEVYZli5O4KqUplaNeaBCkJhLZvbZc67
	AlNv/FhnywTPxyxugE/buDhX8eMcS3kk3l5njl34Ji0bfEiv/GAronIBNLWuqS/FR0TBy8Pxjap
	W3s2gOSQLpOCQdmRpM3GUlL6nsvE=
X-Gm-Gg: ASbGnctGWTZy1Swsn0WTK6nLTn8K0+ZwNgMNtFhCQFW/CwMtpUqwX7nqlJX9p0UHcEe
	L8JMjHkCev5lyZS5IGlG7svScW3PJ58LPFf9k2am1T5/BZ8/YIj5yrYQ8bhkFsWyOMlIzg4sz
X-Google-Smtp-Source: AGHT+IFaUZ0/y0aoRRB3fUZmfV+/Z25KahwjqZKgiMrsJacKmCUGiNbhGhD3GOs0ACgdvSOtaXKYp4nYoM3i8ludqyk=
X-Received: by 2002:a05:6870:de14:b0:29e:872f:c37f with SMTP id
 586e51a60fabf-2a7fb431b3emr1193198fac.43.1734696884597; Fri, 20 Dec 2024
 04:14:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
 <20241219200821.8328-2-maccraft123mc@gmail.com> <a2310cf8-5e00-4233-8c56-f04d3f692b13@linaro.org>
 <CAO_MupK8GYwNep9k-C28=Ly8wgn1T6LLiYnFcbKg0spRNXbkYw@mail.gmail.com> <9d0324de-e42a-43b8-bdcc-0d0885434b25@quicinc.com>
In-Reply-To: <9d0324de-e42a-43b8-bdcc-0d0885434b25@quicinc.com>
From: Maya Matuszczyk <maccraft123mc@gmail.com>
Date: Fri, 20 Dec 2024 13:14:08 +0100
Message-ID: <CAO_MupJhztt51qWU-GXkHnteMf9gAO0u0RUqgJn9_MZCKi6NyA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] platform: arm64: Add driver for EC found in most
 X1E laptops
To: "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pt., 20 gru 2024 o 12:50 Aiqun(Maria) Yu <quic_aiquny@quicinc.com> napisa=
=C5=82(a):
>
> On 12/20/2024 4:58 AM, Maya Matuszczyk wrote:
> > czw., 19 gru 2024 o 21:43 Bryan O'Donoghue
> > <bryan.odonoghue@linaro.org> napisa=C5=82(a):
> >>
> >> On 19/12/2024 20:08, Maya Matuszczyk wrote:
> >>> Currently it features only reporting that the AP is going to suspend,
> >>> which results in keyboard backlight turning off and the power LED
> >>> slowly blinking on the Lenovo Yoga Slim 7x.
> >>>
> >>> Honor Magicbook Art 14 and Lenovo Yoga Slim 7x are known to have
> >>> firmware with extensions which would need appropriate handling.
> >>> For reverse engineering the firmware on them I have written a Rust
> >>> utility:
> >>>
> >>> https://github.com/Maccraft123/it8987-qcom-tool.git
> >>>
> >>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> >>> ---
> >>>   MAINTAINERS                              |   6 +
> >>>   drivers/platform/arm64/Kconfig           |   8 ++
> >>>   drivers/platform/arm64/Makefile          |   1 +
> >>>   drivers/platform/arm64/qcom-x1e-it8987.c | 158 ++++++++++++++++++++=
+++
> >>>   4 files changed, 173 insertions(+)
> >>>   create mode 100644 drivers/platform/arm64/qcom-x1e-it8987.c
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index b878ddc99f94..08d170e2e1e3 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -12890,6 +12890,12 @@ S:   Maintained
> >>>   W:  http://legousb.sourceforge.net/
> >>>   F:  drivers/usb/misc/legousbtower.c
> >>>
> >>> +QCOM IT8987 EC DRIVER
> >>> +M:   Maya Matuszczyk <maccraft123mc@gmail.com>
> >>> +S:   Maintained
> >>> +F:   Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.y=
aml
>
> Actually, the IT8987 is from ITE Tech. As far as I know, there are other
> platforms besides x1e that use this. So if this driver can be also
> applied for all ITE it8987, it might be better to say 'ITE IT8987'
> instead of 'QCOM IT8987'. This also applies to the file name and function=
.
It is from ITE, however the firmware running on it is from Qualcomm and wou=
ld
not be compatible with devices that also have EC on IT8987 MCU with differe=
nt
firmware. I'm open for suggestions about the driver name which would
reflect this.

> >>> +F:   drivers/platform/arm64/qcom-x1e-it8987.c
> >>> +
> >>>   LETSKETCH HID TABLET DRIVER
> >>>   M:  Hans de Goede <hdegoede@redhat.com>
> >>>   L:  linux-input@vger.kernel.org
> >>> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/=
Kconfig
> >>> index f88395ea3376..ebb7b4f70ca0 100644
> >>> --- a/drivers/platform/arm64/Kconfig
> >>> +++ b/drivers/platform/arm64/Kconfig
> >>> @@ -49,4 +49,12 @@ config EC_LENOVO_YOGA_C630
> >>>
> >>>         Say M or Y here to include this support.
> >>>
> >>> +config EC_QCOM_X1E_IT8987
> >>> +     tristate "Embedded Controller driver for most X1E80100 laptops"
> >>> +     depends on ARCH_QCOM || COMPILE_TEST
> >>> +     depends on I2C
> >>> +     help
> >>> +       This driver currently supports reporting device suspend to th=
e EC so it
> >>> +       can take appropriate actions.
> >>> +
> >>>   endif # ARM64_PLATFORM_DEVICES
> >>> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64=
/Makefile
> >>> index b2ae9114fdd8..b9aa195bc1e6 100644
> >>> --- a/drivers/platform/arm64/Makefile
> >>> +++ b/drivers/platform/arm64/Makefile
> >>> @@ -7,3 +7,4 @@
> >>>
> >>>   obj-$(CONFIG_EC_ACER_ASPIRE1)       +=3D acer-aspire1-ec.o
> >>>   obj-$(CONFIG_EC_LENOVO_YOGA_C630) +=3D lenovo-yoga-c630.o
> >>> +obj-$(CONFIG_EC_QCOM_X1E_IT8987) +=3D qcom-x1e-it8987.o
> >>> diff --git a/drivers/platform/arm64/qcom-x1e-it8987.c b/drivers/platf=
orm/arm64/qcom-x1e-it8987.c
> >>> new file mode 100644
> >>> index 000000000000..d27067d6326a
> >>> --- /dev/null
> >>> +++ b/drivers/platform/arm64/qcom-x1e-it8987.c
> >>> @@ -0,0 +1,158 @@
> >>> +// SPDX-License-Identifier: GPL-2.0-only
> >>> +/*
> >>> + * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
> >>> + */
> >>> +#include <linux/i2c.h>
> >>> +#include <linux/module.h>
> >>> +#include <linux/input.h>
> >>> +#include <linux/input/sparse-keymap.h>
> >>
> >> Your includes should be alphabetised.
> >>
> >>> +
> >>> +#define EC_IRQ_REASON_REG 0x05
> >>> +#define EC_SUSPEND_RESUME_REG 0x23
> >>> +#define EC_IRQ_ENABLE_REG 0x35
> >>> +
> >>> +#define EC_NOTIFY_SUSPEND_ENTER 0x01
> >>> +#define EC_NOTIFY_SUSPEND_EXIT 0x00
> >>> +#define EC_NOTIFY_SCREEN_OFF 0x03
> >>> +#define EC_NOTIFY_SCREEN_ON 0x04
> >>> +
> >>> +#define EC_IRQ_MICMUTE_BUTTON 0x04
> >>> +#define EC_IRQ_FAN1_STATUS_CHANGE 0x30
> >>> +#define EC_IRQ_FAN2_STATUS_CHANGE 0x31
> >>> +#define EC_IRQ_FAN1_SPEED_CHANGE 0x32
> >>> +#define EC_IRQ_FAN2_SPEED_CHANGE 0x33
> >>> +#define EC_IRQ_COMPLETED_LUT_UPDATE 0x34
> >>> +#define EC_IRQ_COMPLETED_FAN_PROFILE_SWITCH 0x35
> >>> +#define EC_IRQ_THERMISTOR_1_TEMP_THRESHOLD_CROSS 0x36
> >>> +#define EC_IRQ_THERMISTOR_2_TEMP_THRESHOLD_CROSS 0x37
> >>> +#define EC_IRQ_THERMISTOR_3_TEMP_THRESHOLD_CROSS 0x38
> >>> +#define EC_IRQ_THERMISTOR_4_TEMP_THRESHOLD_CROSS 0x39
> >>> +#define EC_IRQ_THERMISTOR_5_TEMP_THRESHOLD_CROSS 0x3a
> >>> +#define EC_IRQ_THERMISTOR_6_TEMP_THRESHOLD_CROSS 0x3b
> >>> +#define EC_IRQ_THERMISTOR_7_TEMP_THRESHOLD_CROSS 0x3c
> >>> +#define EC_IRQ_RECOVERED_FROM_RESET 0x3d
>
> Could you provide more details or any document references for the IRQ
> reasons defined above? It seems incomplete to me.
I forgot to remove the micmute button one. All the rest appear to be shared
between different devices.

https://github.com/aarch64-laptops/build/tree/master/misc has dumps of ACPI=
 data
and you can look for "EAPQ" method which is triggered on EC interrupts

> By the way, I noticed this is a V2, but I couldn't find V1. Perhaps
> including a cover letter next time would be helpful.
https://lore.kernel.org/lkml/20240927185345.3680-1-maccraft123mc@gmail.com/=
T/#me8af469bc1b7ffd25c25418f7206ed816d8d8c0b

> >>> +
> >>> +struct qcom_x1e_it8987_ec {
> >>> +     struct i2c_client *client;
> >>> +     struct input_dev *idev;
> >>> +     struct mutex lock;
> >>> +};
> >>> +
> >>> +static irqreturn_t qcom_x1e_it8987_ec_irq(int irq, void *data)
> >>> +{
> >>> +     struct qcom_x1e_it8987_ec *ec =3D data;
> >>> +     struct device *dev =3D &ec->client->dev;
> >>> +     int val;
> >>> +
> >>> +     guard(mutex)(&ec->lock);
> >>
> >> What's the thing that can execute at the same time as this procedure -
> >> there doesn't appear to be any concurrent candidate in this patch.
> > The user could suspend the laptop and the EC could fire an IRQ at the s=
ame
> > time... I'll need to add mutex locking to suspend/resume functions
> >
>
> Using a mutex lock inside an IRQ handler is not advisable. Additionally,
> since this IRQ appears to be only for logging purposes, is it really
> necessary for it to be triggered during suspend and resume?
Okay I'll remove the mutex.

> >
> >>> +
> >>> +     val =3D i2c_smbus_read_byte_data(ec->client, EC_IRQ_REASON_REG)=
;
> >>> +     if (val < 0) {
> >>> +             dev_err(dev, "Failed to get EC IRQ reason: %d\n", val);
> >>> +             return IRQ_HANDLED;
> >>> +     }
> >>> +
> >>> +     dev_info(dev, "Unhandled EC IRQ reason: %d\n", val);
> >>
> >> Should an unhandled IRQ be an info or an err ?
> > I don't know, it's "unimplemented but doesn't really matter"
> >
> >>
> >>> +
> >>> +     return IRQ_HANDLED;
> >>> +}
> >>> +
> >>> +static int qcom_x1e_it8987_ec_probe(struct i2c_client *client)
> >>> +{
> >>> +     struct device *dev =3D &client->dev;
> >>> +     struct qcom_x1e_it8987_ec *ec;
> >>> +     int ret;
> >>> +
> >>> +     ec =3D devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> >>> +     if (!ec)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     mutex_init(&ec->lock);
> >>> +     ec->client =3D client;
> >>> +
> >>> +     ret =3D devm_request_threaded_irq(dev, client->irq,
> >>> +                                     NULL, qcom_x1e_it8987_ec_irq,
> >>> +                                     IRQF_ONESHOT, "qcom_x1e_it8987_=
ec", ec);
> >>> +     if (ret < 0)
> >>> +             return dev_err_probe(dev, ret, "Unable to request irq\n=
");
> >>> +
> >>> +     ret =3D i2c_smbus_write_byte_data(client, EC_IRQ_ENABLE_REG, 0x=
01);
> >>> +     if (ret < 0)
> >>> +             return dev_err_probe(dev, ret, "Failed to enable interr=
upts\n");
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static void qcom_x1e_it8987_ec_remove(struct i2c_client *client)
> >>> +{
> >>> +     struct device *dev =3D &client->dev;
> >>> +     int ret;
> >>> +
> >>> +     ret =3D i2c_smbus_write_byte_data(client, EC_IRQ_ENABLE_REG, 0x=
00);
> >>> +     if (ret < 0)
> >>> +             dev_err(dev, "Failed to disable interrupts: %d\n", ret)=
;
> >>> +}
> >>> +
> >>> +static int qcom_x1e_it8987_ec_suspend(struct device *dev)
> >>> +{
> >>> +     struct i2c_client *client =3D to_i2c_client(dev);
> >>> +     int ret;
> >>> +
> >>> +     ret =3D i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG=
, EC_NOTIFY_SCREEN_OFF);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     ret =3D i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG=
, EC_NOTIFY_SUSPEND_ENTER);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int qcom_x1e_it8987_ec_resume(struct device *dev)
> >>> +{
> >>> +     struct i2c_client *client =3D to_i2c_client(dev);
> >>> +     int ret;
> >>> +
> >>> +     ret =3D i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG=
, EC_NOTIFY_SUSPEND_EXIT);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     ret =3D i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG=
, EC_NOTIFY_SCREEN_ON);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static const struct of_device_id qcom_x1e_it8987_ec_of_match[] =3D {
> >>> +     { .compatible =3D "lenovo,yoga-slim7x-ec" },
> >>> +     { .compatible =3D "qcom,x1e-it9897-ec" },
> >>> +     {}
> >>> +};
> >>> +MODULE_DEVICE_TABLE(of, qcom_x1e_it8987_ec_of_match);
> >>> +
> >>> +static const struct i2c_device_id qcom_x1e_it8987_ec_i2c_id_table[] =
=3D {
> >>> +     { "qcom-x1e-it8987-ec", },
> >>> +     {}
> >>> +};
> >>> +MODULE_DEVICE_TABLE(i2c, qcom_x1e_it8987_ec_i2c_id_table);
> >>> +
> >>> +static DEFINE_SIMPLE_DEV_PM_OPS(qcom_x1e_it8987_ec_pm_ops,
> >>> +             qcom_x1e_it8987_ec_suspend,
> >>> +             qcom_x1e_it8987_ec_resume);
> >>> +
> >>> +static struct i2c_driver qcom_x1e_it8987_ec_i2c_driver =3D {
> >>> +     .driver =3D {
> >>> +             .name =3D "yoga-slim7x-ec",
> >>> +             .of_match_table =3D qcom_x1e_it8987_ec_of_match,
> >>> +             .pm =3D &qcom_x1e_it8987_ec_pm_ops
> >>> +     },
> >>> +     .probe =3D qcom_x1e_it8987_ec_probe,
> >>> +     .remove =3D qcom_x1e_it8987_ec_remove,
> >>> +     .id_table =3D qcom_x1e_it8987_ec_i2c_id_table,
> >>> +};
> >>> +module_i2c_driver(qcom_x1e_it8987_ec_i2c_driver);
> >>> +
> >>> +MODULE_DESCRIPTION("Lenovo Yoga Slim 7x Embedded Controller");
> >>> +MODULE_LICENSE("GPL");
> >>
> >> Otherwise looks pretty good to me, nice hacking :)
> >>
> >> ---
> >> bod
> >>
>
>
> --
> Thx and BRs,
> Aiqun(Maria) Yu

