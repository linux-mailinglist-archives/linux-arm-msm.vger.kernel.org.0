Return-Path: <linux-arm-msm+bounces-45314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5043DA1421A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 20:14:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB2963A39FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 19:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF7822F825;
	Thu, 16 Jan 2025 19:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vg7Mqd9t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799A41547E2;
	Thu, 16 Jan 2025 19:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737054870; cv=none; b=fZTUwzidhK3nTvhijPYSDTJjlNPtkNo1RWlxyworu3Ae5lWpvqAMgmvv2iEa4j4t9GkJ2WloL0Hef0QfXEUVd8XIk2FA5xZ/IXWfeSCd4miTwbZ6OSetK5ZQKIZK70MrbPPmidl9BhGgAr7cfq9rI5eDmqcyGwEqtqc0/4yHn0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737054870; c=relaxed/simple;
	bh=xwPswPXuFrrH6fUN5y409XZ+OSlvqMpurhYTzo9UjvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JD5p4hEJwX3E2GjP7ukZKWDFeHT3AexnulNDVnlhAjoQ1VwTY4CT6iAND3KwBzonGh/pz8ys6Or7cXPHcurll+I8+An5Ggu7efAz3wi5V7Kof+mIGOgh1ziWJBgJi0U6Uo5NbCMGGBUbRWKXlTerjx0VQGgMB3QkIKBQR4CCSgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vg7Mqd9t; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-29fb5257e05so493569fac.0;
        Thu, 16 Jan 2025 11:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737054866; x=1737659666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoNAFjODreyikOWQY2tnDz1Gyw+pCnylmsgVDlp9QUE=;
        b=Vg7Mqd9t5n+QlW7sHdzm8iMSLEcRKOLx9J2aHCIaZYiGThcT0t6hpEsmZp7Mo/upfd
         7lCDyhujQzGFB2CRPXiBX6va1lJkaQvo1OdmCamBR9Z40rWB+4nC6BeqwQv/qjtYRKow
         Q8KjdryRfl/qyTjWQ8e6AoTqyis61PylZFVp3RitqUMxk9Pa2swGzZ6U/1D4ZNbAT7Rv
         gXvKApEFGGhAXFbEonEagCEou07Skas5eiOon+rYn41pRaqQCUN+WthloAH925p84NTV
         Ii7Vsahs0TDrZj3Xhnsfghg77bnrlT0m+uB706xjkghOwq4Ta/uid0ODrzY5y19Yv0BU
         0iOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737054866; x=1737659666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GoNAFjODreyikOWQY2tnDz1Gyw+pCnylmsgVDlp9QUE=;
        b=ek2iPjgenR6wez41h5Mxp1T/6dNbV+ZQD435VjSsBdtbNKRBw89zG1v708SnRXVsDP
         OQXrOdWD58cF2mZDPlYE53ukOZazNUBIHCYePTWAQQj06vL0C5fwqLIWKqHdsNM6CcYx
         2qjdZbcHGYAjVXsSbgN7hBpnfqwoPQHtOV3eZKS2s9I+wML3VJz9fDCqJiob8+OszqvR
         lj8KjKzQRqEaSmTEklI0Zx5LOOa7dyUfttglbZTPADp6DjBqo4zJRhY4b+7QzBgThiTT
         ZeKqznrhgdL+UZ8bF/t2WldZ9lu9xAFCqxt0YD9oRMku8iWs+wnEYg/B6lLLwKZbYmrj
         5OBA==
X-Forwarded-Encrypted: i=1; AJvYcCU263mObiSS0HWJFpgdToSEy7FyoZozAcbzIxYud75qejPYuRGjPQ9ac+25ly+WFvwXvq1w/F+r5vG+mqBQ@vger.kernel.org, AJvYcCVctMOrBTpeEtQUkHQYMiFLM4Xk3W1HAzS6GnP4rX4tQa2rIqqtcB+Wpb7D/+X6eO5lsTM5AGN844o6gjwTUQ==@vger.kernel.org, AJvYcCXK2aq4s0o2syTJX0ahBpcshZxcxfXEflT+uaXQYh55ByT5Q2SY7UfpQAhFaVBzxt0hXO5mvKoEsAA4+SVcGcSKqXkqCw==@vger.kernel.org, AJvYcCXmqhgqa/vo4VQ11xVRmfKv60/1zRYWGgtLT0GWgJjoWGTLcOfNM+v5LZhuG4ikWinAOE3FARxLkBD2@vger.kernel.org, AJvYcCXzNmUJpa096GtUColLTRZAe9DvVFo+XzxpcJGpKKcgRd+Z5JZTy9rVnhATQlQqbpA5DCVXcUo1cRDWCfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIZ99PamUtDUyX4px8UoBUNWbZx9ZdU53OQsKYkp4Yr+D+ScYR
	SXqKf9KSc5rJNdx6gKZvVdGaTWjxQuAcYOmuwd5fOUZowT5J/zjgkKYHJ5h+BYBYsoHTJFQ7aDa
	GQ4c1ZEEm/hMGdTve7bivOMqDM2o=
X-Gm-Gg: ASbGncv6Wc//z8xxtFvdOcaLbL1cNqqN+7FQQy/lWYdbZhC20Po9+aOkl0/vtfuCrik
	SKSwozuRjyXgf/Z0vYOBvhAKC3WN1ufIBj3m6r3x9cr+GbAhww6FSkkGhc4fSJuJhOSu1l+cC
X-Google-Smtp-Source: AGHT+IGb6GIe8Qeejf9w9CAjTybYRNWX8FYwBXZsB0o54e9QoBwku+92hDiNOYjxWLb3ceovH/uzBrL4nGnZ3uGt0kw=
X-Received: by 2002:a05:6871:53c5:b0:29e:6f32:6d91 with SMTP id
 586e51a60fabf-2aa06952f22mr20965697fac.33.1737054866242; Thu, 16 Jan 2025
 11:14:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <65dc7d7f-cee5-4eff-9ab7-153b12be4f26@linaro.org> <20250116181532.134250-1-mitltlatltl@gmail.com>
In-Reply-To: <20250116181532.134250-1-mitltlatltl@gmail.com>
From: Maya Matuszczyk <maccraft123mc@gmail.com>
Date: Thu, 16 Jan 2025 20:13:50 +0100
X-Gm-Features: AbW1kvZxdnVqswQXU8GuzLUhDs2QsS5G7hlHjgeiSUFe2uen04YMlzft8BF4yeU
Message-ID: <CAO_MupJYmP8eQQmd_WGJAgoQZ18kWKwB+BSh5-x+qi7jS=nKXw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] platform: arm64: add Huawei Matebook E Go EC driver
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: bryan.odonoghue@linaro.org, andersson@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, hdegoede@redhat.com, 
	ilpo.jarvinen@linux.intel.com, jdelvare@suse.com, konradybcio@kernel.org, 
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, linux@roeck-us.net, 
	platform-driver-x86@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

czw., 16 sty 2025 o 19:17 Pengyu Luo <mitltlatltl@gmail.com> napisa=C5=82(a=
):
>
> On Fri, Jan 17, 2025 at 1:31=E2=80=AFAM Bryan O'Donoghue <bryan.odonoghue=
@linaro.org> wrote:
> > On 16/01/2025 11:15, Pengyu Luo wrote:
> > > There are three variants of which Huawei released the first two
> > > simultaneously.
> > >
> > > Huawei Matebook E Go LTE(sc8180x), codename seems to be gaokun2.
> > > Huawei Matebook E Go(sc8280xp@3.0GHz), codename must be gaokun3. (see=
 [1])
> > > Huawei Matebook E Go 2023(sc8280xp@2.69GHz), codename should be also =
gaokun3.
> > >
> > > Adding support for the latter two variants for now, this driver shoul=
d
> > > also work for the sc8180x variant according to acpi table files, but =
I
> > > don't have the device to test yet.
> > >
> > > Different from other Qualcomm Snapdragon sc8280xp based machines, the
> > > Huawei Matebook E Go uses an embedded controller while others use
> > > a system called PMIC GLink. This embedded controller can be used to
> > > perform a set of various functions, including, but not limited to:
> > >
> > > - Battery and charger monitoring;
> > > - Charge control and smart charge;
> > > - Fn_lock settings;
> > > - Tablet lid status;
> > > - Temperature sensors;
> > > - USB Type-C notifications (ports orientation,  DP alt mode HPD);
> > > - USB Type-C PD (according to observation, up to 48w).
> > >
> > > Add a driver for the EC which creates devices for UCSI and power supp=
ly
> > > devices.
> > >
> > > This driver is inspired by the following drivers:
> > >          drivers/platform/arm64/acer-aspire1-ec.c
> > >          drivers/platform/arm64/lenovo-yoga-c630.c
> > >          drivers/platform/x86/huawei-wmi.c
> > >
> > > [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D219645
> > >
> > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > ---
> > >   MAINTAINERS                                   |   7 +
> > >   drivers/platform/arm64/Kconfig                |  21 +
> > >   drivers/platform/arm64/Makefile               |   1 +
> > >   drivers/platform/arm64/huawei-gaokun-ec.c     | 787 +++++++++++++++=
+++
> > >   .../linux/platform_data/huawei-gaokun-ec.h    |  80 ++
> > >   5 files changed, 896 insertions(+)
> > >   create mode 100644 drivers/platform/arm64/huawei-gaokun-ec.c
> > >   create mode 100644 include/linux/platform_data/huawei-gaokun-ec.h
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 33b9cd11a..27ff24e7d 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -10692,6 +10692,13 @@ S:   Maintained
> > >   F:  Documentation/networking/device_drivers/ethernet/huawei/hinic.r=
st
> > >   F:  drivers/net/ethernet/huawei/hinic/
> > >
> > > +HUAWEI MATEBOOK E GO EMBEDDED CONTROLLER DRIVER
> > > +M:   Pengyu Luo <mitltlatltl@gmail.com>
> > > +S:   Maintained
> > > +F:   Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yam=
l
> > > +F:   drivers/platform/arm64/huawei-gaokun-ec.c
> > > +F:   include/linux/platform_data/huawei-gaokun-ec.h
> > > +
> > >   HUGETLB SUBSYSTEM
> > >   M:  Muchun Song <muchun.song@linux.dev>
> > >   L:  linux-mm@kvack.org
> > > diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/=
Kconfig
> > > index f88395ea3..6ceee3c16 100644
> > > --- a/drivers/platform/arm64/Kconfig
> > > +++ b/drivers/platform/arm64/Kconfig
> > > @@ -33,6 +33,27 @@ config EC_ACER_ASPIRE1
> > >         laptop where this information is not properly exposed via the
> > >         standard ACPI devices.
> > >
> > > +config EC_HUAWEI_GAOKUN
> > > +     tristate "Huawei Matebook E Go Embedded Controller driver"
> > > +     depends on ARCH_QCOM || COMPILE_TEST
> > > +     depends on I2C
> > > +     depends on INPUT
> > > +     select AUXILIARY_BUS
> > > +
> > > +     help
> > > +       Say Y here to enable the EC driver for the Huawei Matebook E =
Go
> > > +       which is a sc8280xp-based 2-in-1 tablet. The driver handles b=
attery
> > > +       (information, charge control) and USB Type-C DP HPD events as=
 well
> > > +       as some misc functions like the lid sensor and temperature se=
nsors,
> > > +       etc.
> > > +
> > > +       This driver provides battery and AC status support for the me=
ntioned
> > > +       laptop where this information is not properly exposed via the
> > > +       standard ACPI devices.
> > > +
> > > +       Say M or Y here to include this support.
> > > +
> > > +
> > >   config EC_LENOVO_YOGA_C630
> > >       tristate "Lenovo Yoga C630 Embedded Controller driver"
> > >       depends on ARCH_QCOM || COMPILE_TEST
> > > diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64=
/Makefile
> > > index b2ae9114f..46a99eba3 100644
> > > --- a/drivers/platform/arm64/Makefile
> > > +++ b/drivers/platform/arm64/Makefile
> > > @@ -6,4 +6,5 @@
> > >   #
> > >
> > >   obj-$(CONFIG_EC_ACER_ASPIRE1)       +=3D acer-aspire1-ec.o
> > > +obj-$(CONFIG_EC_HUAWEI_GAOKUN)       +=3D huawei-gaokun-ec.o
> > >   obj-$(CONFIG_EC_LENOVO_YOGA_C630) +=3D lenovo-yoga-c630.o
> > > diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c b/drivers/plat=
form/arm64/huawei-gaokun-ec.c
> > > new file mode 100644
> > > index 000000000..5b09b7d7c
> > > --- /dev/null
> > > +++ b/drivers/platform/arm64/huawei-gaokun-ec.c
> > > @@ -0,0 +1,787 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * huawei-gaokun-ec - An EC driver for HUAWEI Matebook E Go
> > > + *
> > > + * Copyright (C) 2024-2025 Pengyu Luo <mitltlatltl@gmail.com>
> > > + */
> > > +
> > > +#include <linux/auxiliary_bus.h>
> > > +#include <linux/cleanup.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/device.h>
> > > +#include <linux/hwmon.h>
> > > +#include <linux/hwmon-sysfs.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/input.h>
> > > +#include <linux/notifier.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/platform_data/huawei-gaokun-ec.h>
> > > +
> > > +#define EC_EVENT             0x06
> > > +
> > > +/* Also can be found in ACPI specification 12.3 */
> > > +#define EC_READ                      0x80
> > > +#define EC_WRITE             0x81
> > > +#define EC_BURST             0x82
> > > +#define EC_QUERY             0x84
> > > +
> > > +#define EC_FN_LOCK_ON                0x5A
> > > +#define EC_FN_LOCK_OFF               0x55
> > > +
> > > +#define EC_EVENT_LID         0x81
> > > +
> > > +#define EC_LID_STATE         0x80
> > > +#define EC_LID_OPEN          BIT(1)
> > > +
> > > +#define UCSI_REG_SIZE                7
> > > +
> > > +/*
> > > + * For tx, command sequences are arranged as
> > > + * {master_cmd, slave_cmd, data_len, data_seq}
> > > + */
> > > +#define REQ_HDR_SIZE         3
> > > +#define INPUT_SIZE_OFFSET    2
> > > +#define REQ_LEN(req) (REQ_HDR_SIZE + req[INPUT_SIZE_OFFSET])
> > > +
> > > +/*
> > > + * For rx, data sequences are arranged as
> > > + * {status, data_len(unreliable), data_seq}
> > > + */
> > > +#define RESP_HDR_SIZE                2
> > > +
> > > +#define MKREQ(REG0, REG1, SIZE, ...)                 \
> > > +{                                                    \
> > > +     REG0, REG1, SIZE,                               \
> > > +     /* ## will remove comma when SIZE is 0 */       \
> > > +     ## __VA_ARGS__,                                 \
> > > +     /* make sure len(pkt[3:]) >=3D SIZE */            \
> > > +     [3 + SIZE] =3D 0,                                 \
> > > +}
> > > +
> > > +#define MKRESP(SIZE)                         \
> > > +{                                            \
> > > +     [RESP_HDR_SIZE + SIZE - 1] =3D 0,         \
> > > +}
> > > +
> > > +/* Possible size 1, 4, 20, 24. Most of the time, the size is 1. */
> > > +static inline void refill_req(u8 *dest, const u8 *src, size_t size)
> > > +{
> > > +     memcpy(dest + REQ_HDR_SIZE, src, size);
> > > +}
> > > +
> > > +static inline void refill_req_byte(u8 *dest, const u8 *src)
> > > +{
> > > +     dest[REQ_HDR_SIZE] =3D *src;
> > > +}
> > > +
> > > +/* Possible size 1, 2, 4, 7, 20. Most of the time, the size is 1. */
> > > +static inline void extr_resp(u8 *dest, const u8 *src, size_t size)
> > > +{
> > > +     memcpy(dest, src + RESP_HDR_SIZE, size);
> > > +}
> > > +
> > > +static inline void extr_resp_byte(u8 *dest, const u8 *src)
> > > +{
> > > +     *dest =3D src[RESP_HDR_SIZE];
> > > +}
> > > +
> > > +static inline void *extr_resp_shallow(const u8 *src)
> > > +{
> > > +     return src + RESP_HDR_SIZE;
> > > +}
> > > +
> > > +struct gaokun_ec {
> > > +     struct i2c_client *client;
> > > +     struct mutex lock; /* EC transaction lock */
> > > +     struct blocking_notifier_head notifier_list;
> > > +     struct device *hwmon_dev;
> > > +     struct input_dev *idev;
> > > +     bool suspended;
> > > +};
> > > +
> > > +static int gaokun_ec_request(struct gaokun_ec *ec, const u8 *req,
> > > +                          size_t resp_len, u8 *resp)
> > > +{
> > > +     struct i2c_client *client =3D ec->client;
> > > +     struct i2c_msg msgs[2] =3D {
> > > +             {
> > > +                     .addr =3D client->addr,
> > > +                     .flags =3D client->flags,
> > > +                     .len =3D REQ_LEN(req),
> > > +                     .buf =3D req,
> > > +             }, {
> > > +                     .addr =3D client->addr,
> > > +                     .flags =3D client->flags | I2C_M_RD,
> > > +                     .len =3D resp_len,
> > > +                     .buf =3D resp,
> > > +             },
> > > +     };
> > > +
> > > +     guard(mutex)(&ec->lock);
> > > +     i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> >
> > You should trap the result code of i2c_transfer() and push it up the
> > call stack.
> >
>
> This EC uses SMBus Protocol, I guess. Qualcomm I2C driver doesn't support
> this though. The response structure define by SMBus I mentioned them abov=
e
> (Please also check ACPI specification 13.2.5)

You can use i2c_smbus_write_byte_data and others with plain i2c controllers=
,
They all are mentioned and described in Documentation/driver-api/i2c.rst
I've used those APIs(with i2c controller in x1e80100) in my EC driver,
and they worked fine

>
> +/*
> + * For rx, data sequences are arranged as
> + * {status, data_len(unreliable), data_seq}
> + */
>
> So the first byte is status code.
>
> > > +     usleep_range(2000, 2500); /* have a break, ACPI did this */
> > > +
> > > +     return *resp ? -EIO : 0;
> >
> > If the value @ *resp is non-zero return -EIO ?
> >
> > Why ?
> >
>
> Mentioned above.
>
> > > +}
> > > +
> > > +/* -----------------------------------------------------------------=
--------- */
> > > +/* Common API */
> > > +
> > > +/**
> > > + * gaokun_ec_read - Read from EC
> > > + * @ec: The gaokun_ec structure
> > > + * @req: The sequence to request
> > > + * @resp_len: The size to read
> > > + * @resp: The buffer to store response sequence
> > > + *
> > > + * This function is used to read data after writing a magic sequence=
 to EC.
> > > + * All EC operations depend on this function.
> > > + *
> > > + * Huawei uses magic sequences everywhere to complete various functi=
ons, all
> > > + * these sequences are passed to ECCD(a ACPI method which is quiet s=
imilar
> > > + * to gaokun_ec_request), there is no good abstraction to generalize=
 these
> > > + * sequences, so just wrap it for now. Almost all magic sequences ar=
e kept
> > > + * in this file.
> > > + *
> > > + * Return: 0 on success or negative error code.
> > > + */
> > > +int gaokun_ec_read(struct gaokun_ec *ec, const u8 *req,
> > > +                size_t resp_len, u8 *resp)
> > > +{
> > > +     return gaokun_ec_request(ec, req, resp_len, resp);
> > > +}
> > > +EXPORT_SYMBOL_GPL(gaokun_ec_read);
> > > +
> > > +/**
> > > + * gaokun_ec_write - Write to EC
> > > + * @ec: The gaokun_ec structure
> > > + * @req: The sequence to request
> > > + *
> > > + * This function has no big difference from gaokun_ec_read. When cal=
ler care
> > > + * only write status and no actual data are returned, then use it.
> > > + *
> > > + * Return: 0 on success or negative error code.
> > > + */
> > > +int gaokun_ec_write(struct gaokun_ec *ec, const u8 *req)
> > > +{
> > > +     u8 ec_resp[] =3D MKRESP(0);
> > > +
> > > +     return gaokun_ec_request(ec, req, sizeof(ec_resp), ec_resp);
> > > +}
> > > +EXPORT_SYMBOL_GPL(gaokun_ec_write);
> > > +
> > > +int gaokun_ec_read_byte(struct gaokun_ec *ec, const u8 *req, u8 *byt=
e)
> > > +{
> > > +     int ret;
> > > +     u8 ec_resp[] =3D MKRESP(sizeof(*byte));
> > > +
> > > +     ret =3D gaokun_ec_read(ec, req, sizeof(ec_resp), ec_resp);
> > > +     extr_resp_byte(byte, ec_resp);
> > > +
> > > +     return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(gaokun_ec_read_byte);
> > > +
> > > +/**
> > > + * gaokun_ec_register_notify - Register a notifier callback for EC e=
vents.
> > > + * @ec: The gaokun_ec structure
> > > + * @nb: Notifier block pointer to register
> > > + *
> > > + * Return: 0 on success or negative error code.
> > > + */
> > > +int gaokun_ec_register_notify(struct gaokun_ec *ec, struct notifier_=
block *nb)
> > > +{
> > > +     return blocking_notifier_chain_register(&ec->notifier_list, nb)=
;
> > > +}
> > > +EXPORT_SYMBOL_GPL(gaokun_ec_register_notify);
> > > +
> > > +/**
> > > + * gaokun_ec_unregister_notify - Unregister notifier callback for EC=
 events.
> > > + * @ec: The gaokun_ec structure
> > > + * @nb: Notifier block pointer to unregister
> > > + *
> > > + * Unregister a notifier callback that was previously registered wit=
h
> > > + * gaokun_ec_register_notify().
> > > + */
> > > +void gaokun_ec_unregister_notify(struct gaokun_ec *ec, struct notifi=
er_block *nb)
> > > +{
> > > +     blocking_notifier_chain_unregister(&ec->notifier_list, nb);
> > > +}
> > > +EXPORT_SYMBOL_GPL(gaokun_ec_unregister_notify);
> > > +
> > > +/* -----------------------------------------------------------------=
--------- */
> > > +/* API for PSY */
> > > +
> > > +/**
> > > + * gaokun_ec_psy_multi_read - Read contiguous registers
> > > + * @ec: The gaokun_ec structure
> > > + * @reg: The start register
> > > + * @resp_len: The number of registers to be read
> > > + * @resp: The buffer to store response sequence
> > > + *
> > > + * Return: 0 on success or negative error code.
> > > + */
> > > +int gaokun_ec_psy_multi_read(struct gaokun_ec *ec, u8 reg,
> > > +                          size_t resp_len, u8 *resp)
> > > +{
> > > +     u8 ec_req[] =3D MKREQ(0x02, EC_READ, 1, 0);
> > > +     u8 ec_resp[] =3D MKRESP(1);
> > > +     int i, ret;
> > > +
> > > +     for (i =3D 0; i < resp_len; ++i, reg++) {
> > > +             refill_req_byte(ec_req, &reg);
> > > +             ret =3D gaokun_ec_read(ec, ec_req, sizeof(ec_resp), ec_=
resp);
> > > +             if (ret)
> > > +                     return ret;
> > > +             extr_resp_byte(&resp[i], ec_resp);
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(gaokun_ec_psy_multi_read);
> > > +
> > > +/* Smart charge */
> > > +
> > > +/**
> > > + * gaokun_ec_psy_get_smart_charge - Get smart charge data from EC
> > > + * @ec: The gaokun_ec structure
> > > + * @resp: The buffer to store response sequence (mode, delay, start,=
 end)
> > > + *
> > > + * Return: 0 on success or negative error code.
> > > + */
> > > +int gaokun_ec_psy_get_smart_charge(struct gaokun_ec *ec,
> > > +                                u8 resp[GAOKUN_SMART_CHARGE_DATA_SIZ=
E])
> > > +{
> > > +     /* GBCM */
> > > +     u8 ec_req[] =3D MKREQ(0x02, 0xE4, 0);
> > > +     u8 ec_resp[] =3D MKRESP(GAOKUN_SMART_CHARGE_DATA_SIZE);
> > > +     int ret;
> > > +
> > > +     ret =3D gaokun_ec_read(ec, ec_req, sizeof(ec_resp), ec_resp);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     extr_resp(resp, ec_resp, GAOKUN_SMART_CHARGE_DATA_SIZE);
> > > +
> > > +     return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(gaokun_ec_psy_get_smart_charge);
> > > +
> > > +static inline bool are_thresholds_valid(u8 start, u8 end)
> > > +{
> > > +     return end !=3D 0 && start <=3D end && end <=3D 100;
> >
> > Why 100 ? Still feels like an arbitrary number.
> >
> > Could you add a comment to explain where 100 comes from ?
> >
>
> You may don't get it. It is just a battery percentage, greater than 100 i=
s
> invalid.
>
> start: The battery percentage at which charging starts (0-100).
> stop: The battery percentage at which charging stops (1-100).
>
>  When the laptop is connected to a power adapter, it starts
>  charging if the battery level is below the 'start' value. It
>  continues charging until the battery reaches the 'stop' level.
>  If the battery is already above the 'stop' level, charging is
>  paused.
>
>  When the power adapter is always connected, charging will
>  begin if the battery level falls below 'start', and charging
>  will stop once the battery reaches 'stop'.
>
> > > +}
> > > +
> > > +/**
> > > + * gaokun_ec_psy_set_smart_charge - Set smart charge data
> > > + * @ec: The gaokun_ec structure
> > > + * @req: The sequence to request (mode, delay, start, end)
> > > + *
> > > + * Return: 0 on success or negative error code.
> > > + */
> > > +int gaokun_ec_psy_set_smart_charge(struct gaokun_ec *ec,
> > > +                                const u8 req[GAOKUN_SMART_CHARGE_DAT=
A_SIZE])
> > > +{
> > > +     /* SBCM */
> > > +     u8 ec_req[] =3D MKREQ(0x02, 0xE3, GAOKUN_SMART_CHARGE_DATA_SIZE=
);
> > > +
> > > +     if (!are_thresholds_valid(req[2], req[3]))
> > > +             return -EINVAL;
> > > +
> > > +     refill_req(ec_req, req, GAOKUN_SMART_CHARGE_DATA_SIZE);
> > > +
> > > +     return gaokun_ec_write(ec, ec_req);
> > > +}
> > > +EXPORT_SYMBOL_GPL(gaokun_ec_psy_set_smart_charge);
> > > +
> > > +/* Smart charge enable */
> > > +
> > > +/**
> > > + * gaokun_ec_psy_get_smart_charge_enable - Get smart charge state
> > > + * @ec: The gaokun_ec structure
> > > + * @on: The state
> > > + *
> > > + * Return: 0 on success or negative error code.
> > > + */
> > > +int gaokun_ec_psy_get_smart_charge_enable(struct gaokun_ec *ec, bool=
 *on)
> > > +{
> > > +     /* GBAC */
> > > +     u8 ec_req[] =3D MKREQ(0x02, 0xE6, 0);
> >
> > 0xE6 =3D=3D SMART_CHARGE_ENABLE right ?
> >
> > In which case instead of passing magic numbers inline, it would be nice
> > to declare an enum or set of defines that enumerates the command set an=
d
> > then pass those values to MKREQ instead of the hex.
> >
> > Does the first parameter indicate write ? 0x02. 0x03 seems to indicate
> > read too ?
> >
>
> Sadly, I am not sure. only 0x06 is used when getting event id, so I named
> it. Read or write use both 0x02, 0x03.
>
> > If so again please name the hex values as defines/enums and then pass
> > the descriptive names.
> >
>
> Function names indicate the usage of registers, these registers are used
> once only, never reused. If you insist, I will add defines for them.
>
>
> > Looking much more readable now though.
> >
> > ---
> > bod
>
>
> Best wishes,
> Pengyu
>

