Return-Path: <linux-arm-msm+bounces-106913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGozOs/GAWoRjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:08:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D226550D5A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 684063016011
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5D33D88F2;
	Mon, 11 May 2026 12:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2uOaTXx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CD63A16AB;
	Mon, 11 May 2026 12:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778501247; cv=none; b=i7YLXBiZMS97NLHEYJxnFa6mkfI5rOyjbZHQMMXngZfqyhsnPE+9liqhovNGw7xojfYADNzYedP/+eB5Gv0IHQ2HSqIwC2EMPzolCT8yM4sPPV4o9/Hnf2/8nx6YIF6JiH9gMP8bVhCDlzcLjIiTvOUqrpcH2xNrzSbtwh0KAek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778501247; c=relaxed/simple;
	bh=stUzrTp3Dnf1YJidnJVR9Ieeb4GmBbjZP3SZI4NbHxE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jclHstbAX23jt7XgUTvCJ88+BfdBenWQqZVIxG9w6J7pGlmRkelFRdSkDtthG5rGfVyKYyA3WQS9GxfMck8Ky+yiSn7g8IDhuEE4GxknZHdQwYvfIeDqoDiC/9NKMq3m0jCA3924aFv5+OSfzeErxFhBs6pjUPDmdTPbeEDytHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2uOaTXx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778501245; x=1810037245;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=stUzrTp3Dnf1YJidnJVR9Ieeb4GmBbjZP3SZI4NbHxE=;
  b=n2uOaTXxw/qCT+vteZE2ODB+X6+dWftn+YZCYND6AhmzWaT4+I8pt73x
   IsmCve1CUbNEQnTvLGSzp6munIkIEXPKbwjwbuE3afkC5mfx+LdwxqIOs
   V6+i3rHz8elQafvHxVTvoDktZrwB8zcg/6z2icspZxkapzrNtWulxUPum
   t7cfxl97Y+PQNskV7gK9wVj9Dz/XBbQ52TVf9377uW0Yyme3XuUOk9ecC
   9d9SnhbcOmk+ADHnxG7kb+ul+rmFGci7q0pACO/QNSEXjUOrN4sF/3cDU
   zu/4sAKxzheYNsTx1PiLnuA3Bt0XCwAgdoxEiiZyh+ENV/zBDnJHaXS5m
   w==;
X-CSE-ConnectionGUID: R7ohE6PhTj+5DQY3SFWiuw==
X-CSE-MsgGUID: hfuwpQpzQqCQObbJ1W9KEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79332417"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="79332417"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 05:07:22 -0700
X-CSE-ConnectionGUID: DnFbDS1uTuSnm0uO5MgtYQ==
X-CSE-MsgGUID: hXsVCkOiR7OTi5ApTf0KCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="242403585"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.28])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 05:07:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 11 May 2026 15:07:13 +0300 (EEST)
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, 
    Randy Dunlap <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org, 
    devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, 
    Maya Matuszczyk <maccraft123mc@gmail.com>, 
    Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
    Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
    Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/6] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
In-Reply-To: <17397c91-53e2-4786-b7c8-88c302821e22@oss.qualcomm.com>
Message-ID: <88ce2f85-5d8f-9845-cdb8-77051989e57f@linux.intel.com>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com> <20260427-add-driver-for-ec-v8-2-702f74e495f7@oss.qualcomm.com> <91523c61-bd03-2d96-823e-78ecd9e3798f@linux.intel.com> <17397c91-53e2-4786-b7c8-88c302821e22@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1475231800-1778501233=:981"
X-Rspamd-Queue-Id: D226550D5A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,infradead.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106913-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+,1:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Action: no action

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1475231800-1778501233=:981
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 11 May 2026, Anvesh Jain P wrote:

>=20
>=20
> On 5/8/2026 11:03 PM, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 27 Apr 2026, Anvesh Jain P wrote:
> >=20
> >> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >>
> >> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
> >> reference boards. It handles fan control, temperature sensors, access
> >> to EC state changes and supports reporting suspend entry/exit to the
> >> EC.
> >=20
> > Thanks, this seems mostly ready now. A few minor things still noted bel=
ow.
> >
>=20
> Hi Ilpo,
>=20
> Thanks for the review! Addressed all points below.
> >> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> >> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> >> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> Tested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> >> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> >> ---
> >>  MAINTAINERS                            |   8 +
> >>  drivers/platform/arm64/Kconfig         |  13 +
> >>  drivers/platform/arm64/Makefile        |   1 +
> >>  drivers/platform/arm64/qcom-hamoa-ec.c | 452 ++++++++++++++++++++++++=
+++++++++
> >>  4 files changed, 474 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 62b89d0013d2..0bf0d6d55550 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -21980,6 +21980,14 @@ F:=09Documentation/devicetree/bindings/misc/q=
com,fastrpc.yaml
> >>  F:=09drivers/misc/fastrpc.c
> >>  F:=09include/uapi/misc/fastrpc.h
> >> =20
> >> +QUALCOMM HAMOA EMBEDDED CONTROLLER DRIVER
> >> +M:=09Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> >> +M:=09Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >> +L:=09linux-arm-msm@vger.kernel.org
> >> +S:=09Maintained
> >> +F:=09Documentation/devicetree/bindings/embedded-controller/qcom,hamoa=
-crd-ec.yaml
> >> +F:=09drivers/platform/arm64/qcom-hamoa-ec.c
> >> +
> >>  QUALCOMM HEXAGON ARCHITECTURE
> >>  M:=09Brian Cain <brian.cain@oss.qualcomm.com>
> >>  L:=09linux-hexagon@vger.kernel.org
> >> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/K=
config
> >> index 10f905d7d6bf..e32e01b2a9bd 100644
> >> --- a/drivers/platform/arm64/Kconfig
> >> +++ b/drivers/platform/arm64/Kconfig
> >> @@ -90,4 +90,17 @@ config EC_LENOVO_THINKPAD_T14S
> >> =20
> >>  =09  Say M or Y here to include this support.
> >> =20
> >> +config EC_QCOM_HAMOA
> >> +=09tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur ref=
erence devices"
> >> +=09depends on ARCH_QCOM || COMPILE_TEST
> >> +=09depends on I2C
> >> +=09depends on THERMAL || THERMAL=3Dn
> >> +=09help
> >> +=09  Say M or Y here to enable the Embedded Controller driver for Qua=
lcomm
> >> +=09  Snapdragon-based Hamoa/Glymur reference devices. The driver hand=
les fan
> >> +=09  control, temperature sensors, access to EC state changes and sup=
ports
> >> +=09  reporting suspend entry/exit to the EC.
> >> +
> >> +=09  This driver currently supports Hamoa/Purwa/Glymur reference devi=
ces.
> >> +
> >>  endif # ARM64_PLATFORM_DEVICES
> >> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/=
Makefile
> >> index 60c131cff6a1..7681be4a46e9 100644
> >> --- a/drivers/platform/arm64/Makefile
> >> +++ b/drivers/platform/arm64/Makefile
> >> @@ -9,3 +9,4 @@ obj-$(CONFIG_EC_ACER_ASPIRE1)=09+=3D acer-aspire1-ec.o
> >>  obj-$(CONFIG_EC_HUAWEI_GAOKUN)=09+=3D huawei-gaokun-ec.o
> >>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) +=3D lenovo-yoga-c630.o
> >>  obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) +=3D lenovo-thinkpad-t14s.o
> >> +obj-$(CONFIG_EC_QCOM_HAMOA) +=3D qcom-hamoa-ec.o
> >> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform=
/arm64/qcom-hamoa-ec.c
> >> new file mode 100644
> >> index 000000000000..253f927c9aca
> >> --- /dev/null
> >> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> >> @@ -0,0 +1,452 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +
> >> +#include <linux/bitfield.h>
> >> +#include <linux/bits.h>
> >> +#include <linux/device.h>
> >> +#include <linux/dev_printk.h>
> >> +#include <linux/err.h>
> >> +#include <linux/i2c.h>
> >> +#include <linux/interrupt.h>
> >> +#include <linux/kernel.h>
> >> +#include <linux/module.h>
> >> +#include <linux/pm.h>
> >> +#include <linux/slab.h>
> >> +#include <linux/thermal.h>
> >> +
> >> +#define EC_SCI_EVT_READ_CMD=090x05
> >> +#define EC_FW_VERSION_CMD=090x0e
> >> +#define EC_MODERN_STANDBY_CMD=090x23
> >> +#define EC_FAN_DBG_CONTROL_CMD=090x30
> >> +#define EC_SCI_EVT_CONTROL_CMD=090x35
> >> +#define EC_THERMAL_CAP_CMD=090x42
> >> +
> >> +#define EC_FW_VERSION_RESP_LEN=094
> >> +#define EC_THERMAL_CAP_RESP_LEN=093
> >> +#define EC_FAN_DEBUG_CMD_LEN=096
> >> +#define EC_FAN_SPEED_DATA_SIZE=094
> >> +
> >> +#define EC_MODERN_STANDBY_ENTER=090x01
> >> +#define EC_MODERN_STANDBY_EXIT=090x00
> >> +
> >> +#define EC_FAN_DEBUG_MODE_OFF   0
> >> +#define EC_FAN_DEBUG_MODE_ON    BIT(0)
> >> +#define EC_FAN_ON               BIT(1)
> >> +#define EC_FAN_DEBUG_TYPE_PWM   BIT(2)
> >> +#define EC_MAX_FAN_CNT=09=092
> >> +#define EC_FAN_NAME_SIZE=0920
> >> +#define EC_FAN_MAX_PWM=09=09255
> >> +
> >> +enum qcom_ec_sci_events {
> >> +=09EC_FAN1_STATUS_CHANGE_EVT =3D 0x30,
> >> +=09EC_FAN2_STATUS_CHANGE_EVT,
> >> +=09EC_FAN1_SPEED_CHANGE_EVT,
> >> +=09EC_FAN2_SPEED_CHANGE_EVT,
> >> +=09EC_NEW_LUT_SET_EVT,
> >> +=09EC_FAN_PROFILE_SWITCH_EVT,
> >> +=09EC_THERMISTOR_1_THRESHOLD_CROSS_EVT,
> >> +=09EC_THERMISTOR_2_THRESHOLD_CROSS_EVT,
> >> +=09EC_THERMISTOR_3_THRESHOLD_CROSS_EVT,
> >> +=09/* Reserved: 0x39 - 0x3c/0x3f */
> >> +=09EC_RECOVERED_FROM_RESET_EVT =3D 0x3d,
> >> +};
> >> +
> >> +struct qcom_ec_version {
> >> +=09u8 main_version;
> >> +=09u8 sub_version;
> >> +=09u8 test_version;
> >> +};
> >> +
> >> +struct qcom_ec_thermal_cap {
> >> +#define EC_THERMAL_FAN_CNT(x)=09=09(FIELD_GET(GENMASK(1, 0), (x)))
> >> +#define EC_THERMAL_FAN_TYPE(x)=09=09(FIELD_GET(GENMASK(4, 2), (x)))
> >> +#define EC_THERMAL_THERMISTOR_MASK(x)=09(FIELD_GET(GENMASK(7, 0), (x)=
))
> >> +=09u8 fan_cnt;
> >> +=09u8 fan_type;
> >> +=09u8 thermistor_mask;
> >> +};
> >> +
> >> +struct qcom_ec_cooling_dev {
> >> +=09struct thermal_cooling_device *cdev;
> >> +=09struct device *parent_dev;
> >> +=09u8 fan_id;
> >> +=09u8 state;
> >> +};
> >> +
> >> +struct qcom_ec {
> >> +=09struct qcom_ec_cooling_dev *ec_cdev;
> >> +=09struct qcom_ec_thermal_cap thermal_cap;
> >> +=09struct qcom_ec_version version;
> >> +=09struct i2c_client *client;
> >> +};
> >> +
> >> +static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *=
resp)
> >> +{
> >> +=09int ret;
> >> +
> >> +=09ret =3D i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, r=
esp);
> >> +
> >> +=09if (ret < 0)
> >=20
> > Call and its error handling belong together so please remove the empty =
line.
> >
>=20
> Ack, will remove the blank line in the next revision.
>=20
> >> +=09=09return ret;
> >> +=09else if (ret =3D=3D 0 || ret =3D=3D 0xff)
> >> +=09=09return -EOPNOTSUPP;
> >> +
> >> +=09if (resp[0] >=3D resp_len)
> >> +=09=09return -EINVAL;
> >> +
> >> +=09return 0;
> >> +}
> >> +
> >> +/*
> >> + * EC Device Firmware Version:
> >> + *
> >> + * Read Response:
> >> + * ------------------------------------------------------------------=
----
> >> + * | Offset=09| Name=09=09| Description=09=09=09=09|
> >> + * ------------------------------------------------------------------=
----
> >> + * | 0x00=09| Byte count=09| Number of bytes in response=09=09|
> >> + * |=09=09|=09=09| (excluding byte count)=09=09|
> >> + * ------------------------------------------------------------------=
----
> >> + * | 0x01=09| Test-version=09| Test-version of EC firmware=09=09|
> >> + * ------------------------------------------------------------------=
----
> >> + * | 0x02=09| Sub-version=09| Sub-version of EC firmware=09=09|
> >> + * ------------------------------------------------------------------=
----
> >> + * | 0x03=09| Main-version=09| Main-version of EC firmware=09=09|
> >> + * ------------------------------------------------------------------=
----
> >> + *
> >> + */
> >> +static int qcom_ec_read_fw_version(struct device *dev)
> >> +{
> >> +=09struct i2c_client *client =3D to_i2c_client(dev);
> >> +=09struct qcom_ec *ec =3D i2c_get_clientdata(client);
> >> +=09struct qcom_ec_version *version =3D &ec->version;
> >> +=09u8 resp[EC_FW_VERSION_RESP_LEN];
> >> +=09int ret;
> >> +
> >> +=09ret =3D qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN=
, resp);
> >> +=09if (ret < 0)
> >> +=09=09return ret;
> >> +
> >> +=09version->main_version =3D resp[3];
> >> +=09version->sub_version =3D resp[2];
> >> +=09version->test_version =3D resp[1];
> >> +
> >> +=09dev_dbg(dev, "EC Version %d.%d.%d\n",
> >> +=09=09version->main_version, version->sub_version, version->test_vers=
ion);
> >> +
> >> +=09return 0;
> >> +}
> >> +
> >> +/*
> >> + * EC Device Thermal Capabilities:
> >> + *
> >> + * Read Response:
> >> + * ------------------------------------------------------------------=
------------
> >> + * | Offset=09=09| Name=09=09| Description=09=09=09=09|
> >> + * ------------------------------------------------------------------=
------------
> >> + * | 0x00=09=09| Byte count=09| Number of bytes in response=09=09|
> >> + * |=09=09=09|=09=09| (excluding byte count)=09=09|
> >> + * ------------------------------------------------------------------=
------------
> >> + * | 0x02 (LSB)=09| EC Thermal=09| Bit 0-1: Number of fans=09=09|
> >> + * | 0x03=09=09| Capabilities=09| Bit 2-4: Type of fan=09=09=09|
> >> + * |=09=09=09|=09=09| Bit 5-6: Reserved=09=09=09|
> >> + * |=09=09=09|=09=09| Bit 7: Data Valid/Invalid=09=09|
> >> + * |=09=09=09|=09=09|=09 (Valid - 1, Invalid - 0)=09|
> >> + * |=09=09=09|=09=09| Bit 8-15: Thermistor 0 - 7 presence=09|
> >> + * |=09=09=09|=09=09|=09    (1 present, 0 absent)=09|
> >> + * ------------------------------------------------------------------=
------------
> >> + *
> >> + */
> >> +static int qcom_ec_thermal_capabilities(struct device *dev)
> >> +{
> >> +=09struct i2c_client *client =3D to_i2c_client(dev);
> >> +=09struct qcom_ec *ec =3D i2c_get_clientdata(client);
> >> +=09struct qcom_ec_thermal_cap *cap =3D &ec->thermal_cap;
> >> +=09u8 resp[EC_THERMAL_CAP_RESP_LEN];
> >> +=09int ret;
> >> +
> >> +=09ret =3D qcom_ec_read(ec, EC_THERMAL_CAP_CMD, EC_THERMAL_CAP_RESP_L=
EN, resp);
> >> +=09if (ret < 0)
> >> +=09=09return ret;
> >> +
> >> +=09cap->fan_cnt =3D min(EC_MAX_FAN_CNT, EC_THERMAL_FAN_CNT(resp[1]));
> >> +=09cap->fan_type =3D EC_THERMAL_FAN_TYPE(resp[1]);
> >> +=09cap->thermistor_mask =3D EC_THERMAL_THERMISTOR_MASK(resp[2]);
> >> +
> >> +=09dev_dbg(dev, "Fan count: %d Fan Type: %d Thermistor Mask: %x\n",
> >> +=09=09cap->fan_cnt, cap->fan_type, cap->thermistor_mask);
> >> +
> >> +=09return 0;
> >> +}
> >> +
> >> +static irqreturn_t qcom_ec_irq(int irq, void *data)
> >> +{
> >> +=09struct qcom_ec *ec =3D data;
> >> +=09struct device *dev =3D &ec->client->dev;
> >> +=09int val;
> >> +
> >> +=09val =3D i2c_smbus_read_byte_data(ec->client, EC_SCI_EVT_READ_CMD);
> >> +=09if (val < 0) {
> >> +=09=09dev_err_ratelimited(dev, "Failed to read EC SCI Event: %d\n", v=
al);
> >> +=09=09return IRQ_HANDLED;
> >> +=09}
> >> +
> >> +=09switch (val) {
> >> +=09case EC_FAN1_STATUS_CHANGE_EVT:
> >> +=09=09dev_dbg_ratelimited(dev, "Fan1 status changed\n");
> >> +=09=09break;
> >> +=09case EC_FAN2_STATUS_CHANGE_EVT:
> >> +=09=09dev_dbg_ratelimited(dev, "Fan2 status changed\n");
> >> +=09=09break;
> >> +=09case EC_FAN1_SPEED_CHANGE_EVT:
> >> +=09=09dev_dbg_ratelimited(dev, "Fan1 speed crossed low/high trip poin=
t\n");
> >> +=09=09break;
> >> +=09case EC_FAN2_SPEED_CHANGE_EVT:
> >> +=09=09dev_dbg_ratelimited(dev, "Fan2 speed crossed low/high trip poin=
t\n");
> >> +=09=09break;
> >> +=09case EC_NEW_LUT_SET_EVT:
> >> +=09=09dev_dbg_ratelimited(dev, "New LUT set\n");
> >> +=09=09break;
> >> +=09case EC_FAN_PROFILE_SWITCH_EVT:
> >> +=09=09dev_dbg_ratelimited(dev, "FAN Profile switched\n");
> >> +=09=09break;
> >> +=09case EC_THERMISTOR_1_THRESHOLD_CROSS_EVT:
> >> +=09=09dev_dbg_ratelimited(dev, "Thermistor 1 threshold crossed\n");
> >> +=09=09break;
> >> +=09case EC_THERMISTOR_2_THRESHOLD_CROSS_EVT:
> >> +=09=09dev_dbg_ratelimited(dev, "Thermistor 2 threshold crossed\n");
> >> +=09=09break;
> >> +=09case EC_THERMISTOR_3_THRESHOLD_CROSS_EVT:
> >> +=09=09dev_dbg_ratelimited(dev, "Thermistor 3 threshold crossed\n");
> >> +=09=09break;
> >> +=09case EC_RECOVERED_FROM_RESET_EVT:
> >> +=09=09dev_dbg_ratelimited(dev, "EC recovered from reset\n");
> >> +=09=09break;
> >> +=09default:
> >> +=09=09dev_notice_ratelimited(dev, "Unknown EC event: %d\n", val);
> >> +=09=09break;
> >> +=09}
> >> +
> >> +=09return IRQ_HANDLED;
> >> +}
> >> +
> >> +static int qcom_ec_sci_evt_control(struct device *dev, bool enable)
> >> +{
> >> +=09struct i2c_client *client =3D to_i2c_client(dev);
> >> +
> >> +=09return i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, !=
!enable);
> >=20
> > This converts bool -> u8 using C's implicit conversion rules (plus on t=
op=20
> > of that does unnecessary !!). Please write the conversion explicitly, y=
ou=20
> > can use ?: syntax for brevity.
> >
>=20
> The original v4 code used `enable ? 1 : 0` explicitly, but Konrad Dybcio
> suggested switching to `!!enable` during his review [1]. Happy to revert
> to the explicit form if that's the preferred style =E2=80=94 just want to=
 flag
> the conflict so everyone is aligned.
>
> [1]
> https://lore.kernel.org/all/6eb3a173-c364-431f-93e4-7bbb7a32431e@oss.qual=
comm.com/

I prefer to have the boolean to binary conversion done explicitly=20
(with the platform drivers maintainer hat on).

--=20
 i.

> >> +}
> >> +
> >> +static int qcom_ec_fan_get_max_state(struct thermal_cooling_device *c=
dev, unsigned long *state)
> >> +{
> >> +=09*state =3D EC_FAN_MAX_PWM;
> >> +
> >> +=09return 0;
> >> +}
> >> +
> >> +static int qcom_ec_fan_get_cur_state(struct thermal_cooling_device *c=
dev, unsigned long *state)
> >> +{
> >> +=09struct qcom_ec_cooling_dev *ec_cdev =3D cdev->devdata;
> >> +
> >> +=09*state =3D ec_cdev->state;
> >> +
> >> +=09return 0;
> >> +}
> >> +
> >> +/*
> >> + * Fan Debug control command:
> >> + *
> >> + * Command Payload:
> >> + * ------------------------------------------------------------------=
--------------------
> >> + * | Offset=09=09| Name=09=09| Description=09=09=09=09=09|
> >> + * ------------------------------------------------------------------=
--------------------
> >> + * | 0x00=09=09| Command=09| Fan control command=09=09=09=09|
> >> + * ------------------------------------------------------------------=
--------------------
> >> + * | 0x01=09=09| Fan ID=09| 0x1 : Fan 1=09=09=09=09=09|
> >> + * |=09=09=09|=09=09| 0x2 : Fan 2=09=09=09=09=09|
> >> + * ------------------------------------------------------------------=
--------------------
> >> + * | 0x02=09=09| Byte count =3D 4| Size of data to set fan speed=09=
=09=09|
> >> + * ------------------------------------------------------------------=
--------------------
> >> + * | 0x03=09=09| Mode=09=09| Bit 0: Debug Mode On/Off (0 - OFF, 1 - O=
N )=09|
> >> + * |=09=09=09|=09=09| Bit 1: Fan On/Off (0 - Off, 1 - ON)=09=09|
> >> + * |=09=09=09|=09=09| Bit 2: Debug Type (0 - RPM, 1 - PWM)=09=09|
> >> + * ------------------------------------------------------------------=
--------------------
> >> + * | 0x04 (LSB)=09| Speed in RPM=09| RPM value, if mode selected is R=
PM=09=09|
> >> + * | 0x05=09=09|=09=09|=09=09=09=09=09=09|
> >> + * ------------------------------------------------------------------=
--------------------
> >> + * | 0x06=09=09| Speed in PWM=09| PWM value, if mode selected is PWM =
(0 - 255)=09|
> >> + * __________________________________________________________________=
____________________
> >> + *
> >> + */
> >> +static int qcom_ec_fan_debug_mode_off(struct qcom_ec_cooling_dev *ec_=
cdev)
> >> +{
> >> +=09struct device *dev =3D ec_cdev->parent_dev;
> >> +=09struct i2c_client *client =3D to_i2c_client(dev);
> >> +=09u8 request[6] =3D { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
> >> +=09=09=09  EC_FAN_DEBUG_MODE_OFF, 0, 0, 0 };
> >> +=09int ret;
> >> +
> >> +=09ret =3D i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_=
CMD,
> >> +=09=09=09=09=09     sizeof(request), request);
> >> +=09if (ret) {
> >> +=09=09dev_err(dev, "Failed to turn off fan%d debug mode: %d\n",
> >> +=09=09=09ec_cdev->fan_id, ret);
> >> +=09}
> >> +
> >> +=09return ret;
> >> +}
> >> +
> >> +static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *c=
dev, unsigned long state)
> >> +{
> >> +=09struct qcom_ec_cooling_dev *ec_cdev =3D cdev->devdata;
> >> +=09struct device *dev =3D ec_cdev->parent_dev;
> >> +=09struct i2c_client *client =3D to_i2c_client(dev);
> >> +=09u8 request[6] =3D { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
> >> +=09=09=09  EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
> >> +=09=09=09  0, 0, state };
> >> +=09int ret;
> >> +
> >> +=09ret =3D i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_=
CMD,
> >> +=09=09=09=09=09     sizeof(request), request);
> >> +=09if (ret) {
> >> +=09=09dev_err(dev, "Failed to set fan pwm: %d\n", ret);
> >> +=09=09return ret;
> >> +=09}
> >> +
> >> +=09ec_cdev->state =3D state;
> >> +
> >> +=09return 0;
> >> +}
> >> +
> >> +static const struct thermal_cooling_device_ops qcom_ec_thermal_ops =
=3D {
> >> +=09.get_max_state =3D qcom_ec_fan_get_max_state,
> >> +=09.get_cur_state =3D qcom_ec_fan_get_cur_state,
> >> +=09.set_cur_state =3D qcom_ec_fan_set_cur_state,
> >> +};
> >> +
> >> +static int qcom_ec_resume(struct device *dev)
> >> +{
> >> +=09struct i2c_client *client =3D to_i2c_client(dev);
> >> +
> >> +=09return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
> >> +=09=09=09=09=09 EC_MODERN_STANDBY_EXIT);
> >> +}
> >> +
> >> +static int qcom_ec_suspend(struct device *dev)
> >> +{
> >> +=09struct i2c_client *client =3D to_i2c_client(dev);
> >> +
> >> +=09return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
> >> +=09=09=09=09=09 EC_MODERN_STANDBY_ENTER);
> >> +}
> >> +
> >> +static int qcom_ec_probe(struct i2c_client *client)
> >> +{
> >> +=09struct device *dev =3D &client->dev;
> >> +=09struct qcom_ec *ec;
> >> +=09unsigned int i;
> >> +=09int ret;
> >> +
> >> +=09ec =3D devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> >> +=09if (!ec)
> >> +=09=09return -ENOMEM;
> >> +
> >> +=09ec->client =3D client;
> >> +
> >> +=09ret =3D devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_=
irq,
> >> +=09=09=09=09=09IRQF_ONESHOT, "qcom_ec", ec);
> >> +=09if (ret < 0)
> >> +=09=09return ret;
> >> +
> >> +=09i2c_set_clientdata(client, ec);
> >> +
> >> +=09ret =3D qcom_ec_read_fw_version(dev);
> >> +=09if (ret < 0)
> >> +=09=09return dev_err_probe(dev, ret, "Failed to read EC firmware vers=
ion\n");
> >> +
> >> +=09ret =3D qcom_ec_sci_evt_control(dev, true);
> >> +=09if (ret < 0)
> >> +=09=09return dev_err_probe(dev, ret, "Failed to enable SCI events\n")=
;
> >> +
> >> +=09ret =3D qcom_ec_thermal_capabilities(dev);
> >> +=09if (ret < 0)
> >> +=09=09return dev_err_probe(dev, ret, "Failed to read thermal capabili=
ties\n");
> >> +
> >> +=09if (ec->thermal_cap.fan_cnt =3D=3D 0) {
> >> +=09=09dev_warn(dev, FW_BUG "Failed to get fan count, firmware update =
required\n");
> >> +=09=09return 0;
> >> +=09}
> >> +
> >> +=09ec->ec_cdev =3D devm_kcalloc(dev, ec->thermal_cap.fan_cnt, sizeof(=
*ec->ec_cdev), GFP_KERNEL);
> >> +=09if (!ec->ec_cdev)
> >> +=09=09return -ENOMEM;
> >> +
> >> +=09for (i =3D 0; i < ec->thermal_cap.fan_cnt; i++) {
> >> +=09=09struct qcom_ec_cooling_dev *ec_cdev =3D &ec->ec_cdev[i];
> >> +=09=09char name[EC_FAN_NAME_SIZE];
> >> +
> >> +=09=09scnprintf(name, sizeof(name), "qcom_ec_fan_%u", i);
> >> +=09=09ec_cdev->fan_id =3D i + 1;
> >> +=09=09ec_cdev->parent_dev =3D dev;
> >> +
> >> +=09=09ec_cdev->cdev =3D devm_thermal_of_cooling_device_register(dev, =
NULL, name, ec_cdev,
> >> +=09=09=09=09=09=09=09=09=09&qcom_ec_thermal_ops);
> >> +=09=09if (IS_ERR(ec_cdev->cdev)) {
> >> +=09=09=09return dev_err_probe(dev, PTR_ERR(ec_cdev->cdev),
> >> +=09=09=09=09=09     "Failed to register fan%d cooling device\n", i);
> >> +=09=09}
> >> +=09}
> >> +
> >> +=09return 0;
> >> +}
> >> +
> >> +static void qcom_ec_remove(struct i2c_client *client)
> >> +{
> >> +=09struct qcom_ec *ec =3D i2c_get_clientdata(client);
> >> +=09struct device *dev =3D &client->dev;
> >> +=09int ret;
> >> +
> >> +=09ret =3D qcom_ec_sci_evt_control(dev, false);
> >> +=09if (ret < 0)
> >> +=09=09dev_err(dev, "Failed to disable SCI events: %d\n", ret);
> >> +
> >> +=09for (int i =3D 0; i < ec->thermal_cap.fan_cnt; i++) {
> >> +=09=09struct qcom_ec_cooling_dev *ec_cdev =3D &ec->ec_cdev[i];
> >> +
> >> +=09=09qcom_ec_fan_debug_mode_off(ec_cdev);
> >> +=09}
> >> +}
> >> +
> >> +static const struct of_device_id qcom_ec_of_match[] =3D {
> >> +=09{ .compatible =3D "qcom,hamoa-crd-ec" },
> >> +=09{}
> >> +};
> >> +MODULE_DEVICE_TABLE(of, qcom_ec_of_match);
> >> +
> >> +static const struct i2c_device_id qcom_ec_i2c_id_table[] =3D {
> >> +=09{ "qcom-hamoa-ec", },
> >> +=09{}
> >> +};
> >> +MODULE_DEVICE_TABLE(i2c, qcom_ec_i2c_id_table);
> >> +
> >> +static DEFINE_SIMPLE_DEV_PM_OPS(qcom_ec_pm_ops,
> >> +=09=09qcom_ec_suspend,
> >> +=09=09qcom_ec_resume);
> >> +
> >> +static struct i2c_driver qcom_ec_i2c_driver =3D {
> >> +=09.driver =3D {
> >> +=09=09.name =3D "qcom-hamoa-ec",
> >> +=09=09.of_match_table =3D qcom_ec_of_match,
> >> +=09=09.pm =3D &qcom_ec_pm_ops
> >=20
> > Please always add comma to any non-terminating entry.
> >
>=20
> Ack, will add the trailing comma in the next revision.
>=20
> >> +=09},
> >> +=09.probe =3D qcom_ec_probe,
> >> +=09.remove =3D qcom_ec_remove,
> >> +=09.id_table =3D qcom_ec_i2c_id_table,
> >> +};
> >> +module_i2c_driver(qcom_ec_i2c_driver);
> >> +
> >> +MODULE_DESCRIPTION("QCOM Hamoa Embedded Controller");
> >> +MODULE_LICENSE("GPL");
> >>
> >>
> >=20
>=20
>=20
--8323328-1475231800-1778501233=:981--

