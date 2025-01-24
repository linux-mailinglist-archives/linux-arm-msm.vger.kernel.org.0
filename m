Return-Path: <linux-arm-msm+bounces-46086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 260A7A1B51A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 13:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEA4516CFE8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 12:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFFC1D5CD1;
	Fri, 24 Jan 2025 12:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSK5pfFw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9911B3948;
	Fri, 24 Jan 2025 12:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737720142; cv=none; b=dT+kBHfEqlxubEppKd2XWTCzFm6OmG/e+WbRbHh5AhfCSByRfZa61bbWQHHPGeN+EJ6TcR4WWyhLZq0HEFzoezPvZ1vz2LRydpjDZK+lErEiLpdDhqJ0WCkTHqID8NflNw0MVB7EeGWJwiszcdmDDFiNB9o2gjtAFigJQwDR0+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737720142; c=relaxed/simple;
	bh=h6BXSBoPm7fBlHcMsXbBeVttjxh/aVMkSNZlekA7Pao=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=k5htRm9dzcWYFuyo/fbMPuYVkYMs0gP0rbfkwGejFMd6BBconuXRpJCw7hXufZIsYzleJpaWHhMIofO6i2Xz/qtl+LfI3Mijn5T2H4XTKbGC7AgfwZuUiZHjdfE7nlZIBRT0xsMH/p+pNtGZQ8evCFIzgKzoqeuRVzf49KYDMtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSK5pfFw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737720140; x=1769256140;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=h6BXSBoPm7fBlHcMsXbBeVttjxh/aVMkSNZlekA7Pao=;
  b=CSK5pfFwV6fQlWNPOaOiDHX543h+ZC3xOnxNnPb6PhZ9yvnN8Xw9sGg2
   m27/h1IOM495nNaLXmTjbOd0FOvmGspN4akFKuDqdRpKAaenF6zpCoJxG
   6NHwB5JRuZqQmTH2Q7VkKsef2snQ5R66UITfmJSkpoIw/tiuu0uC9IEIc
   eRkhfriWem6MCkeSLjekD+uetETwZuhNq8fH8RMPhudccuC2pd57WR8BI
   f582kbtN1h7zNtqoLBlWqFXOipvCPfTxSEesM9lfMzB3Uznn7YWb2xqx9
   8IzteIQ3BInek7drxvwfCLZd7Y5Fx3xRiiGohgFf/juIUZ7KszxOsQeBH
   g==;
X-CSE-ConnectionGUID: Ogzys9noSGOHrNnTCcT2bw==
X-CSE-MsgGUID: PLTsuucUQ+quURcPtKlNpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38131694"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="38131694"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 04:02:19 -0800
X-CSE-ConnectionGUID: Wc3OD+0MSfqSnR6orwscoQ==
X-CSE-MsgGUID: PCHhRy0dTHamPr7ezEYAnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131049793"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.158])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 04:02:14 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 24 Jan 2025 14:02:10 +0200 (EET)
To: Pengyu Luo <mitltlatltl@gmail.com>
cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, 
    Hans de Goede <hdegoede@redhat.com>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
    devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v6 2/3] platform: arm64: add Huawei Matebook E Go EC
 driver
In-Reply-To: <20250123152559.52449-3-mitltlatltl@gmail.com>
Message-ID: <89a619a4-d25d-b875-661d-0372c18a7f2a@linux.intel.com>
References: <20250123152559.52449-1-mitltlatltl@gmail.com> <20250123152559.52449-3-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-445400755-1737720130=:931"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-445400755-1737720130=:931
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 23 Jan 2025, Pengyu Luo wrote:

> There are three variants of which Huawei released the first two
> simultaneously.
>=20
> Huawei Matebook E Go LTE(sc8180x), codename seems to be gaokun2.
> Huawei Matebook E Go(sc8280xp@3.0GHz), codename must be gaokun3. (see [1]=
)
> Huawei Matebook E Go 2023(sc8280xp@2.69GHz), codename should be also gaok=
un3.
>=20
> Adding support for the latter two variants for now, this driver should
> also work for the sc8180x variant according to acpi table files, but I
> don't have the device to test yet.
>=20
> Different from other Qualcomm Snapdragon sc8280xp based machines, the
> Huawei Matebook E Go uses an embedded controller while others use
> a system called PMIC GLink. This embedded controller can be used to
> perform a set of various functions, including, but not limited to:
>=20
> - Battery and charger monitoring;
> - Charge control and smart charge;
> - Fn_lock settings;
> - Tablet lid status;
> - Temperature sensors;
> - USB Type-C notifications (ports orientation,  DP alt mode HPD);
> - USB Type-C PD (according to observation, up to 48w).
>=20
> Add a driver for the EC which creates devices for UCSI and power supply
> devices.
>=20
> This driver is inspired by the following drivers:
>         drivers/platform/arm64/acer-aspire1-ec.c
>         drivers/platform/arm64/lenovo-yoga-c630.c
>         drivers/platform/x86/huawei-wmi.c
>=20
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D219645
>=20
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> ---
>  MAINTAINERS                                   |   7 +
>  drivers/platform/arm64/Kconfig                |  21 +
>  drivers/platform/arm64/Makefile               |   1 +
>  drivers/platform/arm64/huawei-gaokun-ec.c     | 825 ++++++++++++++++++
>  .../linux/platform_data/huawei-gaokun-ec.h    |  79 ++
>  5 files changed, 933 insertions(+)
>  create mode 100644 drivers/platform/arm64/huawei-gaokun-ec.c
>  create mode 100644 include/linux/platform_data/huawei-gaokun-ec.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6ff0565d8..0505553b3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10697,6 +10697,13 @@ S:=09Maintained
>  F:=09Documentation/networking/device_drivers/ethernet/huawei/hinic.rst
>  F:=09drivers/net/ethernet/huawei/hinic/
> =20
> +HUAWEI MATEBOOK E GO EMBEDDED CONTROLLER DRIVER
> +M:=09Pengyu Luo <mitltlatltl@gmail.com>
> +S:=09Maintained
> +F:=09Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml
> +F:=09drivers/platform/arm64/huawei-gaokun-ec.c
> +F:=09include/linux/platform_data/huawei-gaokun-ec.h
> +
>  HUGETLB SUBSYSTEM
>  M:=09Muchun Song <muchun.song@linux.dev>
>  L:=09linux-mm@kvack.org
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kcon=
fig
> index f88395ea3..6ceee3c16 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -33,6 +33,27 @@ config EC_ACER_ASPIRE1
>  =09  laptop where this information is not properly exposed via the
>  =09  standard ACPI devices.
> =20
> +config EC_HUAWEI_GAOKUN
> +=09tristate "Huawei Matebook E Go Embedded Controller driver"
> +=09depends on ARCH_QCOM || COMPILE_TEST
> +=09depends on I2C
> +=09depends on INPUT
> +=09select AUXILIARY_BUS
> +
> +=09help
> +=09  Say Y here to enable the EC driver for the Huawei Matebook E Go
> +=09  which is a sc8280xp-based 2-in-1 tablet. The driver handles battery
> +=09  (information, charge control) and USB Type-C DP HPD events as well
> +=09  as some misc functions like the lid sensor and temperature sensors,
> +=09  etc.
> +
> +=09  This driver provides battery and AC status support for the mentione=
d
> +=09  laptop where this information is not properly exposed via the
> +=09  standard ACPI devices.
> +
> +=09  Say M or Y here to include this support.
> +
> +
>  config EC_LENOVO_YOGA_C630
>  =09tristate "Lenovo Yoga C630 Embedded Controller driver"
>  =09depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Mak=
efile
> index b2ae9114f..46a99eba3 100644
> --- a/drivers/platform/arm64/Makefile
> +++ b/drivers/platform/arm64/Makefile
> @@ -6,4 +6,5 @@
>  #
> =20
>  obj-$(CONFIG_EC_ACER_ASPIRE1)=09+=3D acer-aspire1-ec.o
> +obj-$(CONFIG_EC_HUAWEI_GAOKUN)=09+=3D huawei-gaokun-ec.o
>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) +=3D lenovo-yoga-c630.o
> diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c b/drivers/platform=
/arm64/huawei-gaokun-ec.c
> new file mode 100644
> index 000000000..484d3a7f9
> --- /dev/null
> +++ b/drivers/platform/arm64/huawei-gaokun-ec.c
> @@ -0,0 +1,825 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * huawei-gaokun-ec - An EC driver for HUAWEI Matebook E Go
> + *
> + * Copyright (C) 2024-2025 Pengyu Luo <mitltlatltl@gmail.com>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/notifier.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_data/huawei-gaokun-ec.h>
> +
> +#define EC_EVENT=09=090x06
> +
> +/* Also can be found in ACPI specification 12.3 */
> +#define EC_READ=09=09=090x80
> +#define EC_WRITE=09=090x81
> +#define EC_BURST=09=090x82
> +#define EC_QUERY=09=090x84
> +
> +#define EC_FN_LOCK_ON=09=090x5A
> +#define EC_FN_LOCK_OFF=09=090x55
> +#define EC_FN_LOCK_READ=09=090x6B
> +#define EC_FN_LOCK_WRITE=090x6C
> +
> +#define EC_EVENT_LID=09=090x81
> +
> +#define EC_LID_STATE=09=090x80
> +#define EC_LID_OPEN=09=09BIT(1)
> +
> +#define EC_TEMP_REG=09=090x61
> +
> +#define EC_STANDBY_REG=09=090xB2
> +#define EC_STANDBY_ENTER=090xDB
> +#define EC_STANDBY_EXIT=09=090xEB
> +
> +enum gaokun_ec_smart_charge_cmd {
> +=09SMART_CHARGE_DATA_WRITE =3D 0xE3,
> +=09SMART_CHARGE_DATA_READ,
> +=09SMART_CHARGE_ENABLE_WRITE,
> +=09SMART_CHARGE_ENABLE_READ,
> +};
> +
> +enum gaokun_ec_ucsi_cmd {
> +=09UCSI_REG_WRITE =3D 0xD2,
> +=09UCSI_REG_READ,
> +=09UCSI_DATA_WRITE,
> +=09UCSI_DATA_READ,
> +};
> +
> +#define UCSI_REG_SIZE=09=097
> +
> +/*
> + * For tx, command sequences are arranged as
> + * {master_cmd, slave_cmd, data_len, data_seq}
> + */
> +#define REQ_HDR_SIZE=09=093
> +#define INPUT_SIZE_OFFSET=092
> +#define REQ_LEN(req) (REQ_HDR_SIZE + (req)[INPUT_SIZE_OFFSET])
> +
> +/*
> + * For rx, data sequences are arranged as
> + * {status, data_len(unreliable), data_seq}
> + */
> +#define RESP_HDR_SIZE=09=092
> +
> +#define MKREQ(REG0, REG1, SIZE, ...)=09=09=09\
> +{=09=09=09=09=09=09=09\
> +=09REG0, REG1, SIZE,=09=09=09=09\
> +=09/* ## will remove comma when SIZE is 0 */=09\
> +=09## __VA_ARGS__,=09=09=09=09=09\
> +=09/* make sure len(pkt[3:]) >=3D SIZE */=09=09\
> +=09[3 + (SIZE)] =3D 0,=09=09=09=09\
> +}
> +
> +#define MKRESP(SIZE)=09=09=09=09\
> +{=09=09=09=09=09=09\
> +=09[RESP_HDR_SIZE + (SIZE) - 1] =3D 0,=09\
> +}
> +
> +/* Possible size 1, 4, 20, 24. Most of the time, the size is 1. */
> +static inline void refill_req(u8 *dest, const u8 *src, size_t size)
> +{
> +=09memcpy(dest + REQ_HDR_SIZE, src, size);
> +}
> +
> +static inline void refill_req_byte(u8 *dest, const u8 *src)
> +{
> +=09dest[REQ_HDR_SIZE] =3D *src;
> +}
> +
> +/* Possible size 1, 2, 4, 7, 20. Most of the time, the size is 1. */
> +static inline void extr_resp(u8 *dest, const u8 *src, size_t size)
> +{
> +=09memcpy(dest, src + RESP_HDR_SIZE, size);
> +}
> +
> +static inline void extr_resp_byte(u8 *dest, const u8 *src)
> +{
> +=09*dest =3D src[RESP_HDR_SIZE];
> +}
> +
> +static inline void *extr_resp_shallow(const u8 *src)
> +{
> +=09return (void *)(src + RESP_HDR_SIZE);
> +}
> +
> +struct gaokun_ec {
> +=09struct i2c_client *client;
> +=09struct mutex lock; /* EC transaction lock */
> +=09struct blocking_notifier_head notifier_list;
> +=09struct device *hwmon_dev;
> +=09struct input_dev *idev;
> +=09bool suspended;
> +};
> +
> +static int gaokun_ec_request(struct gaokun_ec *ec, const u8 *req,
> +=09=09=09     size_t resp_len, u8 *resp)
> +{
> +=09struct i2c_client *client =3D ec->client;
> +=09struct i2c_msg msgs[] =3D {
> +=09=09{
> +=09=09=09.addr =3D client->addr,
> +=09=09=09.flags =3D client->flags,
> +=09=09=09.len =3D REQ_LEN(req),
> +=09=09=09.buf =3D (void *)req,
> +=09=09}, {
> +=09=09=09.addr =3D client->addr,
> +=09=09=09.flags =3D client->flags | I2C_M_RD,
> +=09=09=09.len =3D resp_len,
> +=09=09=09.buf =3D resp,
> +=09=09},
> +=09};
> +=09int ret;
> +
> +=09guard(mutex)(&ec->lock);
> +=09ret =3D i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> +=09if (ret !=3D ARRAY_SIZE(msgs)) {
> +=09=09dev_err(&client->dev, "I2C transfer error %d\n", ret);
> +=09=09goto out_after_break;
> +=09}
> +
> +=09ret =3D *resp;
> +=09if (ret)
> +=09=09dev_err(&client->dev, "EC transaction error %d\n", ret);
> +
> +out_after_break:
> +=09usleep_range(2000, 2500); /* have a break, ACPI did this */
> +
> +=09return ret;
> +}
> +
> +/* ---------------------------------------------------------------------=
----- */
> +/* Common API */
> +
> +/**
> + * gaokun_ec_read - Read from EC
> + * @ec: The gaokun_ec structure
> + * @req: The sequence to request
> + * @resp_len: The size to read
> + * @resp: The buffer to store response sequence
> + *
> + * This function is used to read data after writing a magic sequence to =
EC.
> + * All EC operations depend on this function.
> + *
> + * Huawei uses magic sequences everywhere to complete various functions,=
 all
> + * these sequences are passed to ECCD(a ACPI method which is quiet simil=
ar
> + * to gaokun_ec_request), there is no good abstraction to generalize the=
se
> + * sequences, so just wrap it for now. Almost all magic sequences are ke=
pt
> + * in this file.
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int gaokun_ec_read(struct gaokun_ec *ec, const u8 *req,
> +=09=09   size_t resp_len, u8 *resp)
> +{
> +=09return gaokun_ec_request(ec, req, resp_len, resp);
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_read);
> +
> +/**
> + * gaokun_ec_write - Write to EC
> + * @ec: The gaokun_ec structure
> + * @req: The sequence to request
> + *
> + * This function has no big difference from gaokun_ec_read. When caller =
care
> + * only write status and no actual data are returned, then use it.
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int gaokun_ec_write(struct gaokun_ec *ec, const u8 *req)
> +{
> +=09u8 ec_resp[] =3D MKRESP(0);
> +
> +=09return gaokun_ec_request(ec, req, sizeof(ec_resp), ec_resp);
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_write);
> +
> +int gaokun_ec_read_byte(struct gaokun_ec *ec, const u8 *req, u8 *byte)
> +{
> +=09int ret;
> +=09u8 ec_resp[] =3D MKRESP(sizeof(*byte));
> +
> +=09ret =3D gaokun_ec_read(ec, req, sizeof(ec_resp), ec_resp);
> +=09extr_resp_byte(byte, ec_resp);
> +
> +=09return ret;
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_read_byte);
> +
> +/**
> + * gaokun_ec_register_notify - Register a notifier callback for EC event=
s.
> + * @ec: The gaokun_ec structure
> + * @nb: Notifier block pointer to register
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int gaokun_ec_register_notify(struct gaokun_ec *ec, struct notifier_bloc=
k *nb)
> +{
> +=09return blocking_notifier_chain_register(&ec->notifier_list, nb);
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_register_notify);
> +
> +/**
> + * gaokun_ec_unregister_notify - Unregister notifier callback for EC eve=
nts.
> + * @ec: The gaokun_ec structure
> + * @nb: Notifier block pointer to unregister
> + *
> + * Unregister a notifier callback that was previously registered with
> + * gaokun_ec_register_notify().
> + */
> +void gaokun_ec_unregister_notify(struct gaokun_ec *ec, struct notifier_b=
lock *nb)
> +{
> +=09blocking_notifier_chain_unregister(&ec->notifier_list, nb);
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_unregister_notify);
> +
> +/* ---------------------------------------------------------------------=
----- */
> +/* API for PSY */
> +
> +/**
> + * gaokun_ec_psy_multi_read - Read contiguous registers
> + * @ec: The gaokun_ec structure
> + * @reg: The start register
> + * @resp_len: The number of registers to be read
> + * @resp: The buffer to store response sequence
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int gaokun_ec_psy_multi_read(struct gaokun_ec *ec, u8 reg,
> +=09=09=09     size_t resp_len, u8 *resp)
> +{
> +=09u8 ec_req[] =3D MKREQ(0x02, EC_READ, 1, 0);
> +=09u8 ec_resp[] =3D MKRESP(1);
> +=09int i, ret;
> +
> +=09for (i =3D 0; i < resp_len; ++i, reg++) {
> +=09=09refill_req_byte(ec_req, &reg);
> +=09=09ret =3D gaokun_ec_read(ec, ec_req, sizeof(ec_resp), ec_resp);
> +=09=09if (ret)
> +=09=09=09return ret;
> +=09=09extr_resp_byte(&resp[i], ec_resp);
> +=09}
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_psy_multi_read);
> +
> +/* Smart charge */
> +
> +/**
> + * gaokun_ec_psy_get_smart_charge - Get smart charge data from EC
> + * @ec: The gaokun_ec structure
> + * @resp: The buffer to store response sequence (mode, delay, start, end=
)
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int gaokun_ec_psy_get_smart_charge(struct gaokun_ec *ec,
> +=09=09=09=09   u8 resp[GAOKUN_SMART_CHARGE_DATA_SIZE])
> +{
> +=09/* GBCM */
> +=09u8 ec_req[] =3D MKREQ(0x02, SMART_CHARGE_DATA_READ, 0);
> +=09u8 ec_resp[] =3D MKRESP(GAOKUN_SMART_CHARGE_DATA_SIZE);
> +=09int ret;
> +
> +=09ret =3D gaokun_ec_read(ec, ec_req, sizeof(ec_resp), ec_resp);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09extr_resp(resp, ec_resp, GAOKUN_SMART_CHARGE_DATA_SIZE);
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_psy_get_smart_charge);
> +
> +static inline bool validate_battery_threshold_range(u8 start, u8 end)
> +{
> +=09return end !=3D 0 && start <=3D end && end <=3D 100;
> +}
> +
> +/**
> + * gaokun_ec_psy_set_smart_charge - Set smart charge data
> + * @ec: The gaokun_ec structure
> + * @req: The sequence to request (mode, delay, start, end)
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int gaokun_ec_psy_set_smart_charge(struct gaokun_ec *ec,
> +=09=09=09=09   const u8 req[GAOKUN_SMART_CHARGE_DATA_SIZE])
> +{
> +=09/* SBCM */
> +=09u8 ec_req[] =3D MKREQ(0x02, SMART_CHARGE_DATA_WRITE,
> +=09=09=09    GAOKUN_SMART_CHARGE_DATA_SIZE);
> +
> +=09if (!validate_battery_threshold_range(req[2], req[3]))
> +=09=09return -EINVAL;
> +
> +=09refill_req(ec_req, req, GAOKUN_SMART_CHARGE_DATA_SIZE);
> +
> +=09return gaokun_ec_write(ec, ec_req);
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_psy_set_smart_charge);
> +
> +/* Smart charge enable */
> +
> +/**
> + * gaokun_ec_psy_get_smart_charge_enable - Get smart charge state
> + * @ec: The gaokun_ec structure
> + * @on: The state
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int gaokun_ec_psy_get_smart_charge_enable(struct gaokun_ec *ec, bool *on=
)
> +{
> +=09/* GBAC */
> +=09u8 ec_req[] =3D MKREQ(0x02, SMART_CHARGE_ENABLE_READ, 0);
> +=09u8 state;
> +=09int ret;
> +
> +=09ret =3D gaokun_ec_read_byte(ec, ec_req, &state);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09*on =3D !!state;
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_psy_get_smart_charge_enable);
> +
> +/**
> + * gaokun_ec_psy_set_smart_charge_enable - Set smart charge state
> + * @ec: The gaokun_ec structure
> + * @on: The state
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int gaokun_ec_psy_set_smart_charge_enable(struct gaokun_ec *ec, bool on)
> +{
> +=09/* SBAC */
> +=09u8 ec_req[] =3D MKREQ(0x02, SMART_CHARGE_ENABLE_WRITE, 1, on);
> +
> +=09return gaokun_ec_write(ec, ec_req);
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_psy_set_smart_charge_enable);
> +
> +/* ---------------------------------------------------------------------=
----- */
> +/* API for UCSI */
> +
> +/**
> + * gaokun_ec_ucsi_read - Read UCSI data from EC
> + * @ec: The gaokun_ec structure
> + * @resp: The buffer to store response sequence
> + *
> + * Read CCI and MSGI (used by UCSI subdriver).
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int gaokun_ec_ucsi_read(struct gaokun_ec *ec,
> +=09=09=09u8 resp[GAOKUN_UCSI_READ_SIZE])
> +{
> +=09u8 ec_req[] =3D MKREQ(0x03, UCSI_DATA_READ, 0);
> +=09u8 ec_resp[] =3D MKRESP(GAOKUN_UCSI_READ_SIZE);
> +=09int ret;
> +
> +=09ret =3D gaokun_ec_read(ec, ec_req, sizeof(ec_resp), ec_resp);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09extr_resp(resp, ec_resp, GAOKUN_UCSI_READ_SIZE);
> +=09return 0;
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_ucsi_read);
> +
> +/**
> + * gaokun_ec_ucsi_write - Write UCSI data to EC
> + * @ec: The gaokun_ec structure
> + * @req: The sequence to request
> + *
> + * Write CTRL and MSGO (used by UCSI subdriver).
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int gaokun_ec_ucsi_write(struct gaokun_ec *ec,
> +=09=09=09 const u8 req[GAOKUN_UCSI_WRITE_SIZE])
> +{
> +=09u8 ec_req[] =3D MKREQ(0x03, UCSI_DATA_WRITE, GAOKUN_UCSI_WRITE_SIZE);
> +
> +=09refill_req(ec_req, req, GAOKUN_UCSI_WRITE_SIZE);
> +
> +=09return gaokun_ec_write(ec, ec_req);
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_ucsi_write);
> +
> +/**
> + * gaokun_ec_ucsi_get_reg - Get UCSI register from EC
> + * @ec: The gaokun_ec structure
> + * @ureg: The gaokun ucsi register
> + *
> + * Get UCSI register data (used by UCSI subdriver).
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int gaokun_ec_ucsi_get_reg(struct gaokun_ec *ec, struct gaokun_ucsi_reg =
*ureg)
> +{
> +=09u8 ec_req[] =3D MKREQ(0x03, UCSI_REG_READ, 0);
> +=09u8 ec_resp[] =3D MKRESP(UCSI_REG_SIZE);
> +=09int ret;
> +
> +=09ret =3D gaokun_ec_read(ec, ec_req, sizeof(ec_resp), ec_resp);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09extr_resp((u8 *)ureg, ec_resp, UCSI_REG_SIZE);
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_ucsi_get_reg);
> +
> +/**
> + * gaokun_ec_ucsi_pan_ack - Ack pin assignment notifications from EC
> + * @ec: The gaokun_ec structure
> + * @port_id: The port id receiving and handling the notifications
> + *
> + * Ack pin assignment notifications (used by UCSI subdriver).
> + *
> + * Return: 0 on success or negative error code.
> + */
> +int gaokun_ec_ucsi_pan_ack(struct gaokun_ec *ec, int port_id)
> +{
> +=09u8 ec_req[] =3D MKREQ(0x03, UCSI_REG_WRITE, 1);
> +=09u8 data =3D 1 << port_id;
> +
> +=09if (port_id =3D=3D GAOKUN_UCSI_NO_PORT_UPDATE)
> +=09=09data =3D 0;
> +
> +=09refill_req_byte(ec_req, &data);
> +
> +=09return gaokun_ec_write(ec, ec_req);
> +}
> +EXPORT_SYMBOL_GPL(gaokun_ec_ucsi_pan_ack);
> +
> +/* ---------------------------------------------------------------------=
----- */
> +/* EC Sysfs */
> +
> +/* Fn lock */
> +static int gaokun_ec_get_fn_lock(struct gaokun_ec *ec, bool *on)
> +{
> +=09/* GFRS */
> +=09u8 ec_req[] =3D MKREQ(0x02, EC_FN_LOCK_READ, 0);
> +=09int ret;
> +=09u8 state;
> +
> +=09ret =3D gaokun_ec_read_byte(ec, ec_req, &state);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09if (state =3D=3D EC_FN_LOCK_ON)
> +=09=09*on =3D true;
> +=09else if (state =3D=3D EC_FN_LOCK_OFF)
> +=09=09*on =3D false;
> +=09else
> +=09=09return -EIO;
> +
> +=09return 0;
> +}
> +
> +static int gaokun_ec_set_fn_lock(struct gaokun_ec *ec, bool on)
> +{
> +=09/* SFRS */
> +=09u8 ec_req[] =3D MKREQ(0x02, EC_FN_LOCK_WRITE, 1,
> +=09=09=09    on ? EC_FN_LOCK_ON : EC_FN_LOCK_OFF);
> +
> +=09return gaokun_ec_write(ec, ec_req);
> +}
> +
> +static ssize_t fn_lock_show(struct device *dev,
> +=09=09=09    struct device_attribute *attr,
> +=09=09=09    char *buf)
> +{
> +=09struct gaokun_ec *ec =3D dev_get_drvdata(dev);
> +=09bool on;
> +=09int ret;
> +
> +=09ret =3D gaokun_ec_get_fn_lock(ec, &on);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return sysfs_emit(buf, "%d\n", on);
> +}
> +
> +static ssize_t fn_lock_store(struct device *dev,
> +=09=09=09     struct device_attribute *attr,
> +=09=09=09     const char *buf, size_t size)
> +{
> +=09struct gaokun_ec *ec =3D dev_get_drvdata(dev);
> +=09bool on;
> +=09int ret;
> +
> +=09if (kstrtobool(buf, &on))
> +=09=09return -EINVAL;
> +
> +=09ret =3D gaokun_ec_set_fn_lock(ec, on);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return size;
> +}
> +
> +static DEVICE_ATTR_RW(fn_lock);
> +
> +static struct attribute *gaokun_ec_attrs[] =3D {
> +=09&dev_attr_fn_lock.attr,
> +=09NULL,
> +};
> +ATTRIBUTE_GROUPS(gaokun_ec);
> +
> +/* ---------------------------------------------------------------------=
----- */
> +/* Thermal Zone HwMon */
> +
> +/* Range from 0 to 0x2C, partially valid */
> +static const u8 temp_reg[] =3D {
> +=090x05, 0x07, 0x08, 0x0E, 0x0F, 0x12, 0x15, 0x1E,
> +=090x1F, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
> +=090x27, 0x28, 0x29, 0x2A
> +};
> +
> +static int gaokun_ec_get_temp(struct gaokun_ec *ec, u8 idx, long *temp)
> +{
> +=09/* GTMP */
> +=09u8 ec_req[] =3D MKREQ(0x02, EC_TEMP_REG, 1, temp_reg[idx]);
> +=09u8 ec_resp[] =3D MKRESP(sizeof(__le16));
> +=09__le16 *tmp;
> +=09int ret;
> +
> +=09ret =3D gaokun_ec_read(ec, ec_req, sizeof(ec_resp), ec_resp);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09tmp =3D (__le16 *)extr_resp_shallow(ec_resp);
> +=09*temp =3D le16_to_cpu(*tmp) * 100; /* convert to HwMon's unit */
> +
> +=09return 0;
> +}
> +
> +static umode_t
> +gaokun_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_types typ=
e,
> +=09=09=09   u32 attr, int channel)
> +{
> +=09return type =3D=3D hwmon_temp ? 0444 : 0;
> +}
> +
> +static int
> +gaokun_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +=09=09     u32 attr, int channel, long *val)
> +{
> +=09struct gaokun_ec *ec =3D dev_get_drvdata(dev);
> +
> +=09if (type =3D=3D hwmon_temp)
> +=09=09return gaokun_ec_get_temp(ec, channel, val);
> +
> +=09return -EINVAL;
> +}
> +
> +static const struct hwmon_ops gaokun_ec_hwmon_ops =3D {
> +=09.is_visible =3D gaokun_ec_hwmon_is_visible,
> +=09.read =3D gaokun_ec_hwmon_read,
> +};
> +
> +static u32 gaokun_ec_temp_config[] =3D {
> +=09[0 ... ARRAY_SIZE(temp_reg) - 1] =3D HWMON_T_INPUT,
> +=090
> +};
> +
> +static const struct hwmon_channel_info gaokun_ec_temp =3D {
> +=09.type =3D hwmon_temp,
> +=09.config =3D gaokun_ec_temp_config,
> +};
> +
> +static const struct hwmon_channel_info * const gaokun_ec_hwmon_info[] =
=3D {
> +=09&gaokun_ec_temp,
> +=09NULL
> +};
> +
> +static const struct hwmon_chip_info gaokun_ec_hwmon_chip_info =3D {
> +=09.ops =3D &gaokun_ec_hwmon_ops,
> +=09.info =3D gaokun_ec_hwmon_info,
> +};
> +
> +/* ---------------------------------------------------------------------=
----- */
> +/* Modern Standby */
> +
> +static int gaokun_ec_suspend(struct device *dev)
> +{
> +=09struct gaokun_ec *ec =3D dev_get_drvdata(dev);
> +=09u8 ec_req[] =3D MKREQ(0x02, EC_STANDBY_REG, 1, EC_STANDBY_ENTER);
> +=09int ret;
> +
> +=09if (ec->suspended)
> +=09=09return 0;
> +
> +=09ret =3D gaokun_ec_write(ec, ec_req);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ec->suspended =3D true;
> +
> +=09return 0;
> +}
> +
> +static int gaokun_ec_resume(struct device *dev)
> +{
> +=09struct gaokun_ec *ec =3D dev_get_drvdata(dev);
> +=09u8 ec_req[] =3D MKREQ(0x02, EC_STANDBY_REG, 1, EC_STANDBY_EXIT);
> +=09int ret;
> +=09int i;
> +
> +=09if (!ec->suspended)
> +=09=09return 0;
> +
> +=09for (i =3D 0; i < 3; ++i) {
> +=09=09ret =3D gaokun_ec_write(ec, ec_req);
> +=09=09if (ret =3D=3D 0)
> +=09=09=09break;
> +
> +=09=09msleep(100); /* EC need time to resume */
> +=09};
> +
> +=09ec->suspended =3D false;
> +
> +=09return 0;
> +}
> +
> +static void gaokun_aux_release(struct device *dev)
> +{
> +=09struct auxiliary_device *adev =3D to_auxiliary_dev(dev);
> +
> +=09kfree(adev);
> +}
> +
> +static void gaokun_aux_remove(void *data)
> +{
> +=09struct auxiliary_device *adev =3D data;
> +
> +=09auxiliary_device_delete(adev);
> +=09auxiliary_device_uninit(adev);
> +}
> +
> +static int gaokun_aux_init(struct device *parent, const char *name,
> +=09=09=09   struct gaokun_ec *ec)
> +{
> +=09struct auxiliary_device *adev;
> +=09int ret;
> +
> +=09adev =3D kzalloc(sizeof(*adev), GFP_KERNEL);
> +=09if (!adev)
> +=09=09return -ENOMEM;
> +
> +=09adev->name =3D name;
> +=09adev->id =3D 0;
> +=09adev->dev.parent =3D parent;
> +=09adev->dev.release =3D gaokun_aux_release;
> +=09adev->dev.platform_data =3D ec;
> +=09/* Allow aux devices to access parent's DT nodes directly */
> +=09device_set_of_node_from_dev(&adev->dev, parent);
> +
> +=09ret =3D auxiliary_device_init(adev);
> +=09if (ret) {
> +=09=09kfree(adev);
> +=09=09return ret;
> +=09}
> +
> +=09ret =3D auxiliary_device_add(adev);
> +=09if (ret) {
> +=09=09auxiliary_device_uninit(adev);
> +=09=09return ret;
> +=09}
> +
> +=09return devm_add_action_or_reset(parent, gaokun_aux_remove, adev);
> +}
> +
> +/* ---------------------------------------------------------------------=
----- */
> +/* EC */
> +
> +static irqreturn_t gaokun_ec_irq_handler(int irq, void *data)
> +{
> +=09struct gaokun_ec *ec =3D data;
> +=09u8 ec_req[] =3D MKREQ(EC_EVENT, EC_QUERY, 0);
> +=09u8 status, id;
> +=09int ret;
> +
> +=09ret =3D gaokun_ec_read_byte(ec, ec_req, &id);
> +=09if (ret)
> +=09=09return IRQ_HANDLED;
> +
> +=09switch (id) {
> +=09case 0x0: /* No event */
> +=09=09break;
> +
> +=09case EC_EVENT_LID:
> +=09=09gaokun_ec_psy_read_byte(ec, EC_LID_STATE, &status);
> +=09=09status &=3D EC_LID_OPEN;
> +=09=09input_report_switch(ec->idev, SW_LID, !status);
> +=09=09input_sync(ec->idev);
> +=09=09break;
> +
> +=09default:
> +=09=09blocking_notifier_call_chain(&ec->notifier_list, id, ec);
> +=09}
> +
> +=09return IRQ_HANDLED;
> +}
> +
> +static int gaokun_ec_probe(struct i2c_client *client)
> +{
> +=09struct device *dev =3D &client->dev;
> +=09struct gaokun_ec *ec;
> +=09int ret;
> +
> +=09ec =3D devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> +=09if (!ec)
> +=09=09return -ENOMEM;
> +
> +=09ret =3D devm_mutex_init(dev, &ec->lock);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ec->client =3D client;
> +=09i2c_set_clientdata(client, ec);
> +=09BLOCKING_INIT_NOTIFIER_HEAD(&ec->notifier_list);
> +
> +=09/* Lid switch */
> +=09ec->idev =3D devm_input_allocate_device(dev);
> +=09if (!ec->idev)
> +=09=09return -ENOMEM;
> +
> +=09ec->idev->name =3D "LID";
> +=09ec->idev->phys =3D "gaokun-ec/input0";
> +=09input_set_capability(ec->idev, EV_SW, SW_LID);
> +
> +=09ret =3D input_register_device(ec->idev);
> +=09if (ret)
> +=09=09return dev_err_probe(dev, ret, "Failed to register input device\n"=
);
> +
> +=09ret =3D gaokun_aux_init(dev, GAOKUN_DEV_PSY, ec);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ret =3D gaokun_aux_init(dev, GAOKUN_DEV_UCSI, ec);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> +=09=09=09=09=09gaokun_ec_irq_handler, IRQF_ONESHOT,
> +=09=09=09=09=09dev_name(dev), ec);
> +=09if (ret)
> +=09=09return dev_err_probe(dev, ret, "Failed to request IRQ\n");
> +
> +=09ec->hwmon_dev =3D devm_hwmon_device_register_with_info(dev, "gaokun_e=
c_hwmon",
> +=09=09=09=09=09=09=09     ec, &gaokun_ec_hwmon_chip_info, NULL);
> +=09if (IS_ERR(ec->hwmon_dev))
> +=09=09return dev_err_probe(dev, PTR_ERR(ec->hwmon_dev),
> +=09=09=09=09     "Failed to register hwmon device\n");
> +
> +=09return 0;
> +}
> +
> +static const struct i2c_device_id gaokun_ec_id[] =3D {
> +=09{ "gaokun-ec", },
> +=09{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, gaokun_ec_id);
> +
> +static const struct of_device_id gaokun_ec_of_match[] =3D {
> +=09{ .compatible =3D "huawei,gaokun3-ec", },
> +=09{ }
> +};
> +MODULE_DEVICE_TABLE(of, gaokun_ec_of_match);
> +
> +static const struct dev_pm_ops gaokun_ec_pm_ops =3D {
> +=09NOIRQ_SYSTEM_SLEEP_PM_OPS(gaokun_ec_suspend, gaokun_ec_resume)
> +};
> +
> +static struct i2c_driver gaokun_ec_driver =3D {
> +=09.driver =3D {
> +=09=09.name =3D "gaokun-ec",
> +=09=09.of_match_table =3D gaokun_ec_of_match,
> +=09=09.pm =3D &gaokun_ec_pm_ops,
> +=09=09.dev_groups =3D gaokun_ec_groups,
> +=09},
> +=09.probe =3D gaokun_ec_probe,
> +=09.id_table =3D gaokun_ec_id,
> +};
> +module_i2c_driver(gaokun_ec_driver);
> +
> +MODULE_DESCRIPTION("HUAWEI Matebook E Go EC driver");
> +MODULE_AUTHOR("Pengyu Luo <mitltlatltl@gmail.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/platform_data/huawei-gaokun-ec.h b/include/lin=
ux/platform_data/huawei-gaokun-ec.h
> new file mode 100644
> index 000000000..faa15d315
> --- /dev/null
> +++ b/include/linux/platform_data/huawei-gaokun-ec.h
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Huawei Matebook E Go Embedded Controller
> + *
> + * Copyright (C) 2024-2025 Pengyu Luo <mitltlatltl@gmail.com>
> + */
> +
> +#ifndef __HUAWEI_GAOKUN_EC_H__
> +#define __HUAWEI_GAOKUN_EC_H__
> +
> +#define GAOKUN_UCSI_CCI_SIZE=094
> +#define GAOKUN_UCSI_MSGI_SIZE=0916
> +#define GAOKUN_UCSI_READ_SIZE=09(GAOKUN_UCSI_CCI_SIZE + GAOKUN_UCSI_MSGI=
_SIZE)
> +#define GAOKUN_UCSI_WRITE_SIZE=0924 /* 8B CTRL, 16B MSGO */
> +
> +#define GAOKUN_UCSI_NO_PORT_UPDATE=09(-1)
> +
> +#define GAOKUN_SMART_CHARGE_DATA_SIZE=094 /* mode, delay, start, end */
> +
> +/* ---------------------------------------------------------------------=
----- */
> +
> +struct gaokun_ec;
> +struct gaokun_ucsi_reg;
> +struct notifier_block;
> +
> +#define GAOKUN_MOD_NAME=09=09=09"huawei_gaokun_ec"
> +#define GAOKUN_DEV_PSY=09=09=09"psy"
> +#define GAOKUN_DEV_UCSI=09=09=09"ucsi"
> +
> +/* ---------------------------------------------------------------------=
----- */
> +/* Common API */
> +
> +int gaokun_ec_register_notify(struct gaokun_ec *ec,
> +=09=09=09      struct notifier_block *nb);
> +void gaokun_ec_unregister_notify(struct gaokun_ec *ec,
> +=09=09=09=09 struct notifier_block *nb);
> +
> +int gaokun_ec_read(struct gaokun_ec *ec, const u8 *req,
> +=09=09   size_t resp_len, u8 *resp);
> +int gaokun_ec_write(struct gaokun_ec *ec, const u8 *req);
> +int gaokun_ec_read_byte(struct gaokun_ec *ec, const u8 *req, u8 *byte);
> +
> +/* ---------------------------------------------------------------------=
----- */
> +/* API for PSY */
> +
> +int gaokun_ec_psy_multi_read(struct gaokun_ec *ec, u8 reg,
> +=09=09=09     size_t resp_len, u8 *resp);
> +
> +static inline int gaokun_ec_psy_read_byte(struct gaokun_ec *ec,
> +=09=09=09=09=09  u8 reg, u8 *byte)
> +{
> +=09return gaokun_ec_psy_multi_read(ec, reg, sizeof(*byte), byte);
> +}
> +
> +static inline int gaokun_ec_psy_read_word(struct gaokun_ec *ec,
> +=09=09=09=09=09  u8 reg, u16 *word)
> +{
> +=09return gaokun_ec_psy_multi_read(ec, reg, sizeof(*word), (u8 *)word);
> +}
> +
> +int gaokun_ec_psy_get_smart_charge(struct gaokun_ec *ec,
> +=09=09=09=09   u8 resp[GAOKUN_SMART_CHARGE_DATA_SIZE]);
> +int gaokun_ec_psy_set_smart_charge(struct gaokun_ec *ec,
> +=09=09=09=09   const u8 req[GAOKUN_SMART_CHARGE_DATA_SIZE]);
> +
> +int gaokun_ec_psy_get_smart_charge_enable(struct gaokun_ec *ec, bool *on=
);
> +int gaokun_ec_psy_set_smart_charge_enable(struct gaokun_ec *ec, bool on)=
;
> +
> +/* ---------------------------------------------------------------------=
----- */
> +/* API for UCSI */
> +
> +int gaokun_ec_ucsi_read(struct gaokun_ec *ec, u8 resp[GAOKUN_UCSI_READ_S=
IZE]);
> +int gaokun_ec_ucsi_write(struct gaokun_ec *ec,
> +=09=09=09 const u8 req[GAOKUN_UCSI_WRITE_SIZE]);
> +
> +int gaokun_ec_ucsi_get_reg(struct gaokun_ec *ec, struct gaokun_ucsi_reg =
*ureg);
> +int gaokun_ec_ucsi_pan_ack(struct gaokun_ec *ec, int port_id);
> +
> +#endif /* __HUAWEI_GAOKUN_EC_H__ */
>=20
--8323328-445400755-1737720130=:931--

