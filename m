Return-Path: <linux-arm-msm+bounces-45316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D0BA14259
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 20:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21D0D1884A3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 19:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1AD122DF9C;
	Thu, 16 Jan 2025 19:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBj38pFO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B1B159596;
	Thu, 16 Jan 2025 19:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737056006; cv=none; b=eVdwKQd6S42p7EwdjGfexXex8wPV8oL/YX6lUCg8QHwb43veZIHmZwU41vwQG6VfAGkZZI6eicWMMI12QW//a9ZmcLRNDeEPP/L7eWrxD5Acv2wKK5vz/J17INdOCSprjYB74/Q4+Qi5p4QaP9wyqirJljvBW2wASYUW1eH8Lv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737056006; c=relaxed/simple;
	bh=m45CKpaJgpKvQFVYp340pLpXn4VNrfbfmTRQBMMoSdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TdO0nH7XGdECWo17QtWb4OH53nddsZHyiaa4x1CfjXG3DaRlB++Wt5gRhCtCaFM4Jp4QWdcjYUWfc83MuQf0PvbgRmUKaRmxspRmnkYfrQYbeEqVwxwT74vuPozPAwnP8owfceyPE7d/aSA3Q6TMIJDsC3B+Ywp7a9XVzJE3NaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBj38pFO; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21619108a6bso21840445ad.3;
        Thu, 16 Jan 2025 11:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737056004; x=1737660804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNPLBi6K+v7ytQPvGvAG3+PA+KZ3prpR7OSQoH/1oF0=;
        b=PBj38pFOIF/bU8/KbdMqQFkTwWBMNZRXEXMYKEJKH8wLCVpvEFjBT4hqSXZ4xSsuYr
         P5nuweM5GEycUXR/bkV+e7BEj6tdCB1vdwKTKnkg3P9il4fZxfpXn0YY7JvISBADwmp+
         l//Nnaix+dVG/XZd2AAdtcsRDLNBb9MA0szGeswpYSWh1t8QNj3pqB9PIknBsT2bsYkx
         BMoUv8NG86/hsxEgm54lTqLyCHZNnDIE2PCsM5NbXCO0E36qMV5NBSpKxczfuoJNXZn6
         nE2uNi+G2uLNxXimp9pv4cDpkqK6yFCHmDqm/r8BGdnOL9817V/eUzKwxcSe+AxsyAJ9
         PzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737056004; x=1737660804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNPLBi6K+v7ytQPvGvAG3+PA+KZ3prpR7OSQoH/1oF0=;
        b=t4YHspYjxOA6eAKRB96kVDik96p1LOOaNTcm6sdpltPLFiFW8MSlDrpBVgCqm2ZlF4
         orMSh77HtrKK7jPVj4dut85nlr8gOsTWI0h8cbH9JhyuU1kEsaZkRZdo0HKwE9WkNB+u
         1BccNSH9+WjlgT43fozi7kFixo32Ot7hkazhDDOFcmmAlVQzjX71MNHM0NkburGViDxf
         5KpGhNGgNInoUmHhpUQQQuqJZ3XtlZ5+Y9LBcd6b9+Vb+b1TpesMBybhGVDoHd67uJqM
         Iu1zReG0/k9RY9Vn2dn0o6ehnj/Jwpo1ajmf0mWpj7Wga1XIbXcRGWvWcNzGPDzH0LiH
         iLSg==
X-Forwarded-Encrypted: i=1; AJvYcCU1sK8q3MGkJNUG0cHA9b1tmweplxPWkLEMtue3FiYQlBZNic+r6SBf/nsjojU3xIXjQq8OQOzCLlBObI54W9I29A7yfw==@vger.kernel.org, AJvYcCV9Hq6Rm5FqewYjRDPr9mfk2+COBT8wlS1QPV0vX6A8/cPPVq0AlyUMFhHc9mwr8P4AaI26MZ1paTfk@vger.kernel.org, AJvYcCVnEjFUunr5ifTNk1CI+coQNA9X2gp5BxffqmYn7i6tG2S0FzlbPK9OW6DKEW/XcvdAVAjEBhpGmGiaQOOaoQ==@vger.kernel.org, AJvYcCWbbpwG1ZjSD74GbdbciNz+ETeoWUBRgrwE1acQfKIWUW1agAX5OH8d7y64OyOBU7CuQW3n4u7sDOKRavg=@vger.kernel.org, AJvYcCWlFmSI8ERKhkgnpcr8aSZbkiDgCksOAj+qgX7E3hfsaZdzisO1nYQST96hLq0vTXdDZrfUn15bUgGzekvy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0KGkslf/aa1lgscWHuiY/DIqw8a2Hm/Ht9ARZtQ3ubJw+ni6g
	2fktxjvQP8MrRpWZQi0N/3LM2dIMdZZETxrNm+rR8KWIMunflvW2
X-Gm-Gg: ASbGnct5ajQ5OOVbUxSZRHaskN7jIHJHxheqYp4sIn0WssbOkJioEHEt4v6MFWJfiIl
	KjS6bofN3m2sOo7IzExpx2Y79UZPeb78JLFOX9cA3sUcfFjSfOL9GqDfCnd5ZP0wp8idEZYZ9Cv
	nQqzvFTphGaV1yFV0ylB+hFbkqSeeAuLjOsuvd1SX9h8q0G8dVXOh8PLUikFxbz3sWh9aY9KWBt
	E87zYTwE4ftrKMYZK1EuThZx3iF7/C296w2NafF2cr2fMMQqRhUrsw=
X-Google-Smtp-Source: AGHT+IE2kGRBa9iZ0GSkvCXYhO8BZjOhDFRRnacGTat9xU2xIm2PCvFp0nEcgrxE8V/2B8mmXXDlZQ==
X-Received: by 2002:a05:6a20:7483:b0:1e1:aa24:2e56 with SMTP id adf61e73a8af0-1e88d2f6999mr62158953637.30.1737056003725;
        Thu, 16 Jan 2025 11:33:23 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dababc174sm366600b3a.178.2025.01.16.11.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 11:33:23 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: maccraft123mc@gmail.com
Cc: andersson@kernel.org,
	bryan.odonoghue@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jdelvare@suse.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	mitltlatltl@gmail.com,
	platform-driver-x86@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v4 2/3] platform: arm64: add Huawei Matebook E Go EC driver
Date: Fri, 17 Jan 2025 03:31:50 +0800
Message-ID: <20250116193150.143541-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CAO_MupJYmP8eQQmd_WGJAgoQZ18kWKwB+BSh5-x+qi7jS=nKXw@mail.gmail.com>
References: <CAO_MupJYmP8eQQmd_WGJAgoQZ18kWKwB+BSh5-x+qi7jS=nKXw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Jan 17, 2025 at 3:14 AM Maya Matuszczyk <maccraft123mc@gmail.com> wrote:
> czw., 16 sty 2025 o 19:17 Pengyu Luo <mitltlatltl@gmail.com> napisał(a):
> >
> > On Fri, Jan 17, 2025 at 1:31 AM Bryan O'Donoghue <bryan.odonoghue@linaro.org> wrote:
> > > On 16/01/2025 11:15, Pengyu Luo wrote:
> > > > There are three variants of which Huawei released the first two
> > > > simultaneously.
> > > >
> > > > Huawei Matebook E Go LTE(sc8180x), codename seems to be gaokun2.
> > > > Huawei Matebook E Go(sc8280xp@3.0GHz), codename must be gaokun3. (see [1])
> > > > Huawei Matebook E Go 2023(sc8280xp@2.69GHz), codename should be also gaokun3.
> > > >
> > > > Adding support for the latter two variants for now, this driver should
> > > > also work for the sc8180x variant according to acpi table files, but I
> > > > don't have the device to test yet.
> > > >
> > > > Different from other Qualcomm Snapdragon sc8280xp based machines, the
> > > > Huawei Matebook E Go uses an embedded controller while others use
> > > > a system called PMIC GLink. This embedded controller can be used to
> > > > perform a set of various functions, including, but not limited to:
> > > >
> > > > - Battery and charger monitoring;
> > > > - Charge control and smart charge;
> > > > - Fn_lock settings;
> > > > - Tablet lid status;
> > > > - Temperature sensors;
> > > > - USB Type-C notifications (ports orientation,  DP alt mode HPD);
> > > > - USB Type-C PD (according to observation, up to 48w).
> > > >
> > > > Add a driver for the EC which creates devices for UCSI and power supply
> > > > devices.
> > > >
> > > > This driver is inspired by the following drivers:
> > > >          drivers/platform/arm64/acer-aspire1-ec.c
> > > >          drivers/platform/arm64/lenovo-yoga-c630.c
> > > >          drivers/platform/x86/huawei-wmi.c
> > > >
> > > > [1] https://bugzilla.kernel.org/show_bug.cgi?id=219645
> > > >
> > > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > > ---
> > > >   MAINTAINERS                                   |   7 +
> > > >   drivers/platform/arm64/Kconfig                |  21 +
> > > >   drivers/platform/arm64/Makefile               |   1 +
> > > >   drivers/platform/arm64/huawei-gaokun-ec.c     | 787 ++++++++++++++++++
> > > >   .../linux/platform_data/huawei-gaokun-ec.h    |  80 ++
> > > >   5 files changed, 896 insertions(+)
> > > >   create mode 100644 drivers/platform/arm64/huawei-gaokun-ec.c
> > > >   create mode 100644 include/linux/platform_data/huawei-gaokun-ec.h
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 33b9cd11a..27ff24e7d 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -10692,6 +10692,13 @@ S:   Maintained
> > > >   F:  Documentation/networking/device_drivers/ethernet/huawei/hinic.rst
> > > >   F:  drivers/net/ethernet/huawei/hinic/
> > > >
> > > > +HUAWEI MATEBOOK E GO EMBEDDED CONTROLLER DRIVER
> > > > +M:   Pengyu Luo <mitltlatltl@gmail.com>
> > > > +S:   Maintained
> > > > +F:   Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml
> > > > +F:   drivers/platform/arm64/huawei-gaokun-ec.c
> > > > +F:   include/linux/platform_data/huawei-gaokun-ec.h
> > > > +
> > > >   HUGETLB SUBSYSTEM
> > > >   M:  Muchun Song <muchun.song@linux.dev>
> > > >   L:  linux-mm@kvack.org
> > > > diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> > > > index f88395ea3..6ceee3c16 100644
> > > > --- a/drivers/platform/arm64/Kconfig
> > > > +++ b/drivers/platform/arm64/Kconfig
> > > > @@ -33,6 +33,27 @@ config EC_ACER_ASPIRE1
> > > >         laptop where this information is not properly exposed via the
> > > >         standard ACPI devices.
> > > >
> > > > +config EC_HUAWEI_GAOKUN
> > > > +     tristate "Huawei Matebook E Go Embedded Controller driver"
> > > > +     depends on ARCH_QCOM || COMPILE_TEST
> > > > +     depends on I2C
> > > > +     depends on INPUT
> > > > +     select AUXILIARY_BUS
> > > > +
> > > > +     help
> > > > +       Say Y here to enable the EC driver for the Huawei Matebook E Go
> > > > +       which is a sc8280xp-based 2-in-1 tablet. The driver handles battery
> > > > +       (information, charge control) and USB Type-C DP HPD events as well
> > > > +       as some misc functions like the lid sensor and temperature sensors,
> > > > +       etc.
> > > > +
> > > > +       This driver provides battery and AC status support for the mentioned
> > > > +       laptop where this information is not properly exposed via the
> > > > +       standard ACPI devices.
> > > > +
> > > > +       Say M or Y here to include this support.
> > > > +
> > > > +
> > > >   config EC_LENOVO_YOGA_C630
> > > >       tristate "Lenovo Yoga C630 Embedded Controller driver"
> > > >       depends on ARCH_QCOM || COMPILE_TEST
> > > > diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
> > > > index b2ae9114f..46a99eba3 100644
> > > > --- a/drivers/platform/arm64/Makefile
> > > > +++ b/drivers/platform/arm64/Makefile
> > > > @@ -6,4 +6,5 @@
> > > >   #
> > > >
> > > >   obj-$(CONFIG_EC_ACER_ASPIRE1)       += acer-aspire1-ec.o
> > > > +obj-$(CONFIG_EC_HUAWEI_GAOKUN)       += huawei-gaokun-ec.o
> > > >   obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
> > > > diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c b/drivers/platform/arm64/huawei-gaokun-ec.c
> > > > new file mode 100644
> > > > index 000000000..5b09b7d7c
> > > > --- /dev/null
> > > > +++ b/drivers/platform/arm64/huawei-gaokun-ec.c
> > > > @@ -0,0 +1,787 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * huawei-gaokun-ec - An EC driver for HUAWEI Matebook E Go
> > > > + *
> > > > + * Copyright (C) 2024-2025 Pengyu Luo <mitltlatltl@gmail.com>
> > > > + */
> > > > +
> > > > +#include <linux/auxiliary_bus.h>
> > > > +#include <linux/cleanup.h>
> > > > +#include <linux/delay.h>
> > > > +#include <linux/device.h>
> > > > +#include <linux/hwmon.h>
> > > > +#include <linux/hwmon-sysfs.h>
> > > > +#include <linux/i2c.h>
> > > > +#include <linux/input.h>
> > > > +#include <linux/notifier.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/mutex.h>
> > > > +#include <linux/platform_data/huawei-gaokun-ec.h>
> > > > +
> > > > +#define EC_EVENT             0x06
> > > > +
> > > > +/* Also can be found in ACPI specification 12.3 */
> > > > +#define EC_READ                      0x80
> > > > +#define EC_WRITE             0x81
> > > > +#define EC_BURST             0x82
> > > > +#define EC_QUERY             0x84
> > > > +
> > > > +#define EC_FN_LOCK_ON                0x5A
> > > > +#define EC_FN_LOCK_OFF               0x55
> > > > +
> > > > +#define EC_EVENT_LID         0x81
> > > > +
> > > > +#define EC_LID_STATE         0x80
> > > > +#define EC_LID_OPEN          BIT(1)
> > > > +
> > > > +#define UCSI_REG_SIZE                7
> > > > +
> > > > +/*
> > > > + * For tx, command sequences are arranged as
> > > > + * {master_cmd, slave_cmd, data_len, data_seq}
> > > > + */
> > > > +#define REQ_HDR_SIZE         3
> > > > +#define INPUT_SIZE_OFFSET    2
> > > > +#define REQ_LEN(req) (REQ_HDR_SIZE + req[INPUT_SIZE_OFFSET])
> > > > +
> > > > +/*
> > > > + * For rx, data sequences are arranged as
> > > > + * {status, data_len(unreliable), data_seq}
> > > > + */
> > > > +#define RESP_HDR_SIZE                2
> > > > +
> > > > +#define MKREQ(REG0, REG1, SIZE, ...)                 \
> > > > +{                                                    \
> > > > +     REG0, REG1, SIZE,                               \
> > > > +     /* ## will remove comma when SIZE is 0 */       \
> > > > +     ## __VA_ARGS__,                                 \
> > > > +     /* make sure len(pkt[3:]) >= SIZE */            \
> > > > +     [3 + SIZE] = 0,                                 \
> > > > +}
> > > > +
> > > > +#define MKRESP(SIZE)                         \
> > > > +{                                            \
> > > > +     [RESP_HDR_SIZE + SIZE - 1] = 0,         \
> > > > +}
> > > > +
> > > > +/* Possible size 1, 4, 20, 24. Most of the time, the size is 1. */
> > > > +static inline void refill_req(u8 *dest, const u8 *src, size_t size)
> > > > +{
> > > > +     memcpy(dest + REQ_HDR_SIZE, src, size);
> > > > +}
> > > > +
> > > > +static inline void refill_req_byte(u8 *dest, const u8 *src)
> > > > +{
> > > > +     dest[REQ_HDR_SIZE] = *src;
> > > > +}
> > > > +
> > > > +/* Possible size 1, 2, 4, 7, 20. Most of the time, the size is 1. */
> > > > +static inline void extr_resp(u8 *dest, const u8 *src, size_t size)
> > > > +{
> > > > +     memcpy(dest, src + RESP_HDR_SIZE, size);
> > > > +}
> > > > +
> > > > +static inline void extr_resp_byte(u8 *dest, const u8 *src)
> > > > +{
> > > > +     *dest = src[RESP_HDR_SIZE];
> > > > +}
> > > > +
> > > > +static inline void *extr_resp_shallow(const u8 *src)
> > > > +{
> > > > +     return src + RESP_HDR_SIZE;
> > > > +}
> > > > +
> > > > +struct gaokun_ec {
> > > > +     struct i2c_client *client;
> > > > +     struct mutex lock; /* EC transaction lock */
> > > > +     struct blocking_notifier_head notifier_list;
> > > > +     struct device *hwmon_dev;
> > > > +     struct input_dev *idev;
> > > > +     bool suspended;
> > > > +};
> > > > +
> > > > +static int gaokun_ec_request(struct gaokun_ec *ec, const u8 *req,
> > > > +                          size_t resp_len, u8 *resp)
> > > > +{
> > > > +     struct i2c_client *client = ec->client;
> > > > +     struct i2c_msg msgs[2] = {
> > > > +             {
> > > > +                     .addr = client->addr,
> > > > +                     .flags = client->flags,
> > > > +                     .len = REQ_LEN(req),
> > > > +                     .buf = req,
> > > > +             }, {
> > > > +                     .addr = client->addr,
> > > > +                     .flags = client->flags | I2C_M_RD,
> > > > +                     .len = resp_len,
> > > > +                     .buf = resp,
> > > > +             },
> > > > +     };
> > > > +
> > > > +     guard(mutex)(&ec->lock);
> > > > +     i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> > >
> > > You should trap the result code of i2c_transfer() and push it up the
> > > call stack.
> > >
> >
> > This EC uses SMBus Protocol, I guess. Qualcomm I2C driver doesn't support
> > this though. The response structure define by SMBus I mentioned them above
> > (Please also check ACPI specification 13.2.5)
>
> You can use i2c_smbus_write_byte_data and others with plain i2c controllers,
> They all are mentioned and described in Documentation/driver-api/i2c.rst
> I've used those APIs(with i2c controller in x1e80100) in my EC driver,
> and they worked fine
>

I talked about this in detail. See
Link: https://lore.kernel.org/linux-arm-msm/20250103071957.7902-1-mitltlatltl@gmail.com

> >
> > +/*
> > + * For rx, data sequences are arranged as
> > + * {status, data_len(unreliable), data_seq}
> > + */
> >
> > So the first byte is status code.
> >
> > > > +     usleep_range(2000, 2500); /* have a break, ACPI did this */
> > > > +
> > > > +     return *resp ? -EIO : 0;
> > >
> > > If the value @ *resp is non-zero return -EIO ?
> > >
> > > Why ?
> > >
> >
> > Mentioned above.
> >
> > > > +}
> > > > +
> > > > +/* -------------------------------------------------------------------------- */
> > > > +/* Common API */
> > > > +
> > > > +/**
> > > > + * gaokun_ec_read - Read from EC
> > > > + * @ec: The gaokun_ec structure
> > > > + * @req: The sequence to request
> > > > + * @resp_len: The size to read
> > > > + * @resp: The buffer to store response sequence
> > > > + *
> > > > + * This function is used to read data after writing a magic sequence to EC.
> > > > + * All EC operations depend on this function.
> > > > + *
> > > > + * Huawei uses magic sequences everywhere to complete various functions, all
> > > > + * these sequences are passed to ECCD(a ACPI method which is quiet similar
> > > > + * to gaokun_ec_request), there is no good abstraction to generalize these
> > > > + * sequences, so just wrap it for now. Almost all magic sequences are kept
> > > > + * in this file.
> > > > + *
> > > > + * Return: 0 on success or negative error code.
> > > > + */
> > > > +int gaokun_ec_read(struct gaokun_ec *ec, const u8 *req,
> > > > +                size_t resp_len, u8 *resp)
> > > > +{
> > > > +     return gaokun_ec_request(ec, req, resp_len, resp);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(gaokun_ec_read);
> > > > +
> > > > +/**
> > > > + * gaokun_ec_write - Write to EC
> > > > + * @ec: The gaokun_ec structure
> > > > + * @req: The sequence to request
> > > > + *
> > > > + * This function has no big difference from gaokun_ec_read. When caller care
> > > > + * only write status and no actual data are returned, then use it.
> > > > + *
> > > > + * Return: 0 on success or negative error code.
> > > > + */
> > > > +int gaokun_ec_write(struct gaokun_ec *ec, const u8 *req)
> > > > +{
> > > > +     u8 ec_resp[] = MKRESP(0);
> > > > +
> > > > +     return gaokun_ec_request(ec, req, sizeof(ec_resp), ec_resp);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(gaokun_ec_write);
> > > > +
> > > > +int gaokun_ec_read_byte(struct gaokun_ec *ec, const u8 *req, u8 *byte)
> > > > +{
> > > > +     int ret;
> > > > +     u8 ec_resp[] = MKRESP(sizeof(*byte));
> > > > +
> > > > +     ret = gaokun_ec_read(ec, req, sizeof(ec_resp), ec_resp);
> > > > +     extr_resp_byte(byte, ec_resp);
> > > > +
> > > > +     return ret;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(gaokun_ec_read_byte);
> > > > +
> > > > +/**
> > > > + * gaokun_ec_register_notify - Register a notifier callback for EC events.
> > > > + * @ec: The gaokun_ec structure
> > > > + * @nb: Notifier block pointer to register
> > > > + *
> > > > + * Return: 0 on success or negative error code.
> > > > + */
> > > > +int gaokun_ec_register_notify(struct gaokun_ec *ec, struct notifier_block *nb)
> > > > +{
> > > > +     return blocking_notifier_chain_register(&ec->notifier_list, nb);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(gaokun_ec_register_notify);
> > > > +
> > > > +/**
> > > > + * gaokun_ec_unregister_notify - Unregister notifier callback for EC events.
> > > > + * @ec: The gaokun_ec structure
> > > > + * @nb: Notifier block pointer to unregister
> > > > + *
> > > > + * Unregister a notifier callback that was previously registered with
> > > > + * gaokun_ec_register_notify().
> > > > + */
> > > > +void gaokun_ec_unregister_notify(struct gaokun_ec *ec, struct notifier_block *nb)
> > > > +{
> > > > +     blocking_notifier_chain_unregister(&ec->notifier_list, nb);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(gaokun_ec_unregister_notify);
> > > > +
> > > > +/* -------------------------------------------------------------------------- */
> > > > +/* API for PSY */
> > > > +
> > > > +/**
> > > > + * gaokun_ec_psy_multi_read - Read contiguous registers
> > > > + * @ec: The gaokun_ec structure
> > > > + * @reg: The start register
> > > > + * @resp_len: The number of registers to be read
> > > > + * @resp: The buffer to store response sequence
> > > > + *
> > > > + * Return: 0 on success or negative error code.
> > > > + */
> > > > +int gaokun_ec_psy_multi_read(struct gaokun_ec *ec, u8 reg,
> > > > +                          size_t resp_len, u8 *resp)
> > > > +{
> > > > +     u8 ec_req[] = MKREQ(0x02, EC_READ, 1, 0);
> > > > +     u8 ec_resp[] = MKRESP(1);
> > > > +     int i, ret;
> > > > +
> > > > +     for (i = 0; i < resp_len; ++i, reg++) {
> > > > +             refill_req_byte(ec_req, &reg);
> > > > +             ret = gaokun_ec_read(ec, ec_req, sizeof(ec_resp), ec_resp);
> > > > +             if (ret)
> > > > +                     return ret;
> > > > +             extr_resp_byte(&resp[i], ec_resp);
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(gaokun_ec_psy_multi_read);
> > > > +
> > > > +/* Smart charge */
> > > > +
> > > > +/**
> > > > + * gaokun_ec_psy_get_smart_charge - Get smart charge data from EC
> > > > + * @ec: The gaokun_ec structure
> > > > + * @resp: The buffer to store response sequence (mode, delay, start, end)
> > > > + *
> > > > + * Return: 0 on success or negative error code.
> > > > + */
> > > > +int gaokun_ec_psy_get_smart_charge(struct gaokun_ec *ec,
> > > > +                                u8 resp[GAOKUN_SMART_CHARGE_DATA_SIZE])
> > > > +{
> > > > +     /* GBCM */
> > > > +     u8 ec_req[] = MKREQ(0x02, 0xE4, 0);
> > > > +     u8 ec_resp[] = MKRESP(GAOKUN_SMART_CHARGE_DATA_SIZE);
> > > > +     int ret;
> > > > +
> > > > +     ret = gaokun_ec_read(ec, ec_req, sizeof(ec_resp), ec_resp);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > > +     extr_resp(resp, ec_resp, GAOKUN_SMART_CHARGE_DATA_SIZE);
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(gaokun_ec_psy_get_smart_charge);
> > > > +
> > > > +static inline bool are_thresholds_valid(u8 start, u8 end)
> > > > +{
> > > > +     return end != 0 && start <= end && end <= 100;
> > >
> > > Why 100 ? Still feels like an arbitrary number.
> > >
> > > Could you add a comment to explain where 100 comes from ?
> > >
> >
> > You may don't get it. It is just a battery percentage, greater than 100 is
> > invalid.
> >
> > start: The battery percentage at which charging starts (0-100).
> > stop: The battery percentage at which charging stops (1-100).
> >
> >  When the laptop is connected to a power adapter, it starts
> >  charging if the battery level is below the 'start' value. It
> >  continues charging until the battery reaches the 'stop' level.
> >  If the battery is already above the 'stop' level, charging is
> >  paused.
> >
> >  When the power adapter is always connected, charging will
> >  begin if the battery level falls below 'start', and charging
> >  will stop once the battery reaches 'stop'.
> >
> > > > +}
> > > > +
> > > > +/**
> > > > + * gaokun_ec_psy_set_smart_charge - Set smart charge data
> > > > + * @ec: The gaokun_ec structure
> > > > + * @req: The sequence to request (mode, delay, start, end)
> > > > + *
> > > > + * Return: 0 on success or negative error code.
> > > > + */
> > > > +int gaokun_ec_psy_set_smart_charge(struct gaokun_ec *ec,
> > > > +                                const u8 req[GAOKUN_SMART_CHARGE_DATA_SIZE])
> > > > +{
> > > > +     /* SBCM */
> > > > +     u8 ec_req[] = MKREQ(0x02, 0xE3, GAOKUN_SMART_CHARGE_DATA_SIZE);
> > > > +
> > > > +     if (!are_thresholds_valid(req[2], req[3]))
> > > > +             return -EINVAL;
> > > > +
> > > > +     refill_req(ec_req, req, GAOKUN_SMART_CHARGE_DATA_SIZE);
> > > > +
> > > > +     return gaokun_ec_write(ec, ec_req);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(gaokun_ec_psy_set_smart_charge);
> > > > +
> > > > +/* Smart charge enable */
> > > > +
> > > > +/**
> > > > + * gaokun_ec_psy_get_smart_charge_enable - Get smart charge state
> > > > + * @ec: The gaokun_ec structure
> > > > + * @on: The state
> > > > + *
> > > > + * Return: 0 on success or negative error code.
> > > > + */
> > > > +int gaokun_ec_psy_get_smart_charge_enable(struct gaokun_ec *ec, bool *on)
> > > > +{
> > > > +     /* GBAC */
> > > > +     u8 ec_req[] = MKREQ(0x02, 0xE6, 0);
> > >
> > > 0xE6 == SMART_CHARGE_ENABLE right ?
> > >
> > > In which case instead of passing magic numbers inline, it would be nice
> > > to declare an enum or set of defines that enumerates the command set and
> > > then pass those values to MKREQ instead of the hex.
> > >
> > > Does the first parameter indicate write ? 0x02. 0x03 seems to indicate
> > > read too ?
> > >
> >
> > Sadly, I am not sure. only 0x06 is used when getting event id, so I named
> > it. Read or write use both 0x02, 0x03.
> >
> > > If so again please name the hex values as defines/enums and then pass
> > > the descriptive names.
> > >
> >
> > Function names indicate the usage of registers, these registers are used
> > once only, never reused. If you insist, I will add defines for them.
> >
> >
> > > Looking much more readable now though.
> > >
> > > ---
> > > bod
> >
> >
> > Best wishes,
> > Pengyu
> >

Best wishes,
Pengyu

