Return-Path: <linux-arm-msm+bounces-106712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPjQF5we/mkRnAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 19:34:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFBA4FA04C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 19:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5873301A41D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 17:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94F03FB045;
	Fri,  8 May 2026 17:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i47AIltY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9DA3F20F3;
	Fri,  8 May 2026 17:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778261657; cv=none; b=V8SRbp7mJRaNPziaG6mZGWb8pdmN4AKv8rWilRZI7IpibNw7Y8/prOJE6/kBe0H4u2dh6zx+Ce4qEKeniXP/JptHbHuFP6NmoQs4OUEwONZHtV2MIwAs5g8dMArelg82vCWi6DgBKV/E8qWSMmVedKM4omvY54pcB9y+4CsKpI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778261657; c=relaxed/simple;
	bh=kum1kXn7D+yiHjfmv0I98ohIZ1nHdpT+yba/2v4E9fQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=P0ZvwLEsL/dM8GQ+iPZlmQzoqBqkQLEpcsLazG0TEzMKv4CRtE5+B6WTTr/sjoORv1KkPgwTQQ6URmf2N3cRuShlNHNmAgRNR1ocjs3tt4RjJ4wBshqyoKtC6rSNLLBYwuS617w1jBPEmvoH/I+qnV0d6IMd5hCv1A2pUZZnO0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i47AIltY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778261656; x=1809797656;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kum1kXn7D+yiHjfmv0I98ohIZ1nHdpT+yba/2v4E9fQ=;
  b=i47AIltYVGzvITR/En9NbM79XLlt/keRB/pHOcP3eXxhuaaC3fr9Tora
   BnAhF6w98fqcYoC6XpZvchAo/U/JfdxFPKYICtlwPED8pQev0fezT/Zpn
   8vSMAPGICxRHo0ZT0NhgVlHJedOlFQMerFMbzPQu2aGP3qXa5ztCcS0KR
   SKZRAzau5mLLZpErvyyerz9Qon5OmnI7Gy3vHgCZoz3aKWoRXnBpH28y+
   yFhrwO3Qpd3QHnlQLNUf211f9Nbqum/8Ok/6l5L9OcTHNl1ptsvPRcfs0
   cdF/btGQJAA8Bvxntey6YMRWDVBfz6XvUubsXeII2fQYFbMTMdcVqSYvG
   A==;
X-CSE-ConnectionGUID: tWVzMvl+TYa0XEFsmMHDmw==
X-CSE-MsgGUID: JGY8/1noTE+/IsebZvlR+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="90617481"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="90617481"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 10:34:15 -0700
X-CSE-ConnectionGUID: /qSlW7whTz+MHJuVFILkNg==
X-CSE-MsgGUID: eAv3OtrzQvO+rYtk/oWYFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="241785364"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 10:33:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 8 May 2026 20:33:45 +0300 (EEST)
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
In-Reply-To: <20260427-add-driver-for-ec-v8-2-702f74e495f7@oss.qualcomm.com>
Message-ID: <91523c61-bd03-2d96-823e-78ecd9e3798f@linux.intel.com>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com> <20260427-add-driver-for-ec-v8-2-702f74e495f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: BEFBA4FA04C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linaro.org,infradead.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-106712-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,linux.intel.com:mid]
X-Rspamd-Action: no action

On Mon, 27 Apr 2026, Anvesh Jain P wrote:

> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
> reference boards. It handles fan control, temperature sensors, access
> to EC state changes and supports reporting suspend entry/exit to the
> EC.

Thanks, this seems mostly ready now. A few minor things still noted below.

> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  MAINTAINERS                            |   8 +
>  drivers/platform/arm64/Kconfig         |  13 +
>  drivers/platform/arm64/Makefile        |   1 +
>  drivers/platform/arm64/qcom-hamoa-ec.c | 452 +++++++++++++++++++++++++++++++++
>  4 files changed, 474 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 62b89d0013d2..0bf0d6d55550 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21980,6 +21980,14 @@ F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>  F:	drivers/misc/fastrpc.c
>  F:	include/uapi/misc/fastrpc.h
>  
> +QUALCOMM HAMOA EMBEDDED CONTROLLER DRIVER
> +M:	Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> +M:	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> +L:	linux-arm-msm@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> +F:	drivers/platform/arm64/qcom-hamoa-ec.c
> +
>  QUALCOMM HEXAGON ARCHITECTURE
>  M:	Brian Cain <brian.cain@oss.qualcomm.com>
>  L:	linux-hexagon@vger.kernel.org
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index 10f905d7d6bf..e32e01b2a9bd 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -90,4 +90,17 @@ config EC_LENOVO_THINKPAD_T14S
>  
>  	  Say M or Y here to include this support.
>  
> +config EC_QCOM_HAMOA
> +	tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur reference devices"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on I2C
> +	depends on THERMAL || THERMAL=n
> +	help
> +	  Say M or Y here to enable the Embedded Controller driver for Qualcomm
> +	  Snapdragon-based Hamoa/Glymur reference devices. The driver handles fan
> +	  control, temperature sensors, access to EC state changes and supports
> +	  reporting suspend entry/exit to the EC.
> +
> +	  This driver currently supports Hamoa/Purwa/Glymur reference devices.
> +
>  endif # ARM64_PLATFORM_DEVICES
> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
> index 60c131cff6a1..7681be4a46e9 100644
> --- a/drivers/platform/arm64/Makefile
> +++ b/drivers/platform/arm64/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
>  obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
>  obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
> +obj-$(CONFIG_EC_QCOM_HAMOA) += qcom-hamoa-ec.o
> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
> new file mode 100644
> index 000000000000..253f927c9aca
> --- /dev/null
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> @@ -0,0 +1,452 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pm.h>
> +#include <linux/slab.h>
> +#include <linux/thermal.h>
> +
> +#define EC_SCI_EVT_READ_CMD	0x05
> +#define EC_FW_VERSION_CMD	0x0e
> +#define EC_MODERN_STANDBY_CMD	0x23
> +#define EC_FAN_DBG_CONTROL_CMD	0x30
> +#define EC_SCI_EVT_CONTROL_CMD	0x35
> +#define EC_THERMAL_CAP_CMD	0x42
> +
> +#define EC_FW_VERSION_RESP_LEN	4
> +#define EC_THERMAL_CAP_RESP_LEN	3
> +#define EC_FAN_DEBUG_CMD_LEN	6
> +#define EC_FAN_SPEED_DATA_SIZE	4
> +
> +#define EC_MODERN_STANDBY_ENTER	0x01
> +#define EC_MODERN_STANDBY_EXIT	0x00
> +
> +#define EC_FAN_DEBUG_MODE_OFF   0
> +#define EC_FAN_DEBUG_MODE_ON    BIT(0)
> +#define EC_FAN_ON               BIT(1)
> +#define EC_FAN_DEBUG_TYPE_PWM   BIT(2)
> +#define EC_MAX_FAN_CNT		2
> +#define EC_FAN_NAME_SIZE	20
> +#define EC_FAN_MAX_PWM		255
> +
> +enum qcom_ec_sci_events {
> +	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
> +	EC_FAN2_STATUS_CHANGE_EVT,
> +	EC_FAN1_SPEED_CHANGE_EVT,
> +	EC_FAN2_SPEED_CHANGE_EVT,
> +	EC_NEW_LUT_SET_EVT,
> +	EC_FAN_PROFILE_SWITCH_EVT,
> +	EC_THERMISTOR_1_THRESHOLD_CROSS_EVT,
> +	EC_THERMISTOR_2_THRESHOLD_CROSS_EVT,
> +	EC_THERMISTOR_3_THRESHOLD_CROSS_EVT,
> +	/* Reserved: 0x39 - 0x3c/0x3f */
> +	EC_RECOVERED_FROM_RESET_EVT = 0x3d,
> +};
> +
> +struct qcom_ec_version {
> +	u8 main_version;
> +	u8 sub_version;
> +	u8 test_version;
> +};
> +
> +struct qcom_ec_thermal_cap {
> +#define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
> +#define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
> +#define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
> +	u8 fan_cnt;
> +	u8 fan_type;
> +	u8 thermistor_mask;
> +};
> +
> +struct qcom_ec_cooling_dev {
> +	struct thermal_cooling_device *cdev;
> +	struct device *parent_dev;
> +	u8 fan_id;
> +	u8 state;
> +};
> +
> +struct qcom_ec {
> +	struct qcom_ec_cooling_dev *ec_cdev;
> +	struct qcom_ec_thermal_cap thermal_cap;
> +	struct qcom_ec_version version;
> +	struct i2c_client *client;
> +};
> +
> +static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
> +
> +	if (ret < 0)

Call and its error handling belong together so please remove the empty line.

> +		return ret;
> +	else if (ret == 0 || ret == 0xff)
> +		return -EOPNOTSUPP;
> +
> +	if (resp[0] >= resp_len)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +/*
> + * EC Device Firmware Version:
> + *
> + * Read Response:
> + * ----------------------------------------------------------------------
> + * | Offset	| Name		| Description				|
> + * ----------------------------------------------------------------------
> + * | 0x00	| Byte count	| Number of bytes in response		|
> + * |		|		| (excluding byte count)		|
> + * ----------------------------------------------------------------------
> + * | 0x01	| Test-version	| Test-version of EC firmware		|
> + * ----------------------------------------------------------------------
> + * | 0x02	| Sub-version	| Sub-version of EC firmware		|
> + * ----------------------------------------------------------------------
> + * | 0x03	| Main-version	| Main-version of EC firmware		|
> + * ----------------------------------------------------------------------
> + *
> + */
> +static int qcom_ec_read_fw_version(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct qcom_ec *ec = i2c_get_clientdata(client);
> +	struct qcom_ec_version *version = &ec->version;
> +	u8 resp[EC_FW_VERSION_RESP_LEN];
> +	int ret;
> +
> +	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, resp);
> +	if (ret < 0)
> +		return ret;
> +
> +	version->main_version = resp[3];
> +	version->sub_version = resp[2];
> +	version->test_version = resp[1];
> +
> +	dev_dbg(dev, "EC Version %d.%d.%d\n",
> +		version->main_version, version->sub_version, version->test_version);
> +
> +	return 0;
> +}
> +
> +/*
> + * EC Device Thermal Capabilities:
> + *
> + * Read Response:
> + * ------------------------------------------------------------------------------
> + * | Offset		| Name		| Description				|
> + * ------------------------------------------------------------------------------
> + * | 0x00		| Byte count	| Number of bytes in response		|
> + * |			|		| (excluding byte count)		|
> + * ------------------------------------------------------------------------------
> + * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
> + * | 0x03		| Capabilities	| Bit 2-4: Type of fan			|
> + * |			|		| Bit 5-6: Reserved			|
> + * |			|		| Bit 7: Data Valid/Invalid		|
> + * |			|		|	 (Valid - 1, Invalid - 0)	|
> + * |			|		| Bit 8-15: Thermistor 0 - 7 presence	|
> + * |			|		|	    (1 present, 0 absent)	|
> + * ------------------------------------------------------------------------------
> + *
> + */
> +static int qcom_ec_thermal_capabilities(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct qcom_ec *ec = i2c_get_clientdata(client);
> +	struct qcom_ec_thermal_cap *cap = &ec->thermal_cap;
> +	u8 resp[EC_THERMAL_CAP_RESP_LEN];
> +	int ret;
> +
> +	ret = qcom_ec_read(ec, EC_THERMAL_CAP_CMD, EC_THERMAL_CAP_RESP_LEN, resp);
> +	if (ret < 0)
> +		return ret;
> +
> +	cap->fan_cnt = min(EC_MAX_FAN_CNT, EC_THERMAL_FAN_CNT(resp[1]));
> +	cap->fan_type = EC_THERMAL_FAN_TYPE(resp[1]);
> +	cap->thermistor_mask = EC_THERMAL_THERMISTOR_MASK(resp[2]);
> +
> +	dev_dbg(dev, "Fan count: %d Fan Type: %d Thermistor Mask: %x\n",
> +		cap->fan_cnt, cap->fan_type, cap->thermistor_mask);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t qcom_ec_irq(int irq, void *data)
> +{
> +	struct qcom_ec *ec = data;
> +	struct device *dev = &ec->client->dev;
> +	int val;
> +
> +	val = i2c_smbus_read_byte_data(ec->client, EC_SCI_EVT_READ_CMD);
> +	if (val < 0) {
> +		dev_err_ratelimited(dev, "Failed to read EC SCI Event: %d\n", val);
> +		return IRQ_HANDLED;
> +	}
> +
> +	switch (val) {
> +	case EC_FAN1_STATUS_CHANGE_EVT:
> +		dev_dbg_ratelimited(dev, "Fan1 status changed\n");
> +		break;
> +	case EC_FAN2_STATUS_CHANGE_EVT:
> +		dev_dbg_ratelimited(dev, "Fan2 status changed\n");
> +		break;
> +	case EC_FAN1_SPEED_CHANGE_EVT:
> +		dev_dbg_ratelimited(dev, "Fan1 speed crossed low/high trip point\n");
> +		break;
> +	case EC_FAN2_SPEED_CHANGE_EVT:
> +		dev_dbg_ratelimited(dev, "Fan2 speed crossed low/high trip point\n");
> +		break;
> +	case EC_NEW_LUT_SET_EVT:
> +		dev_dbg_ratelimited(dev, "New LUT set\n");
> +		break;
> +	case EC_FAN_PROFILE_SWITCH_EVT:
> +		dev_dbg_ratelimited(dev, "FAN Profile switched\n");
> +		break;
> +	case EC_THERMISTOR_1_THRESHOLD_CROSS_EVT:
> +		dev_dbg_ratelimited(dev, "Thermistor 1 threshold crossed\n");
> +		break;
> +	case EC_THERMISTOR_2_THRESHOLD_CROSS_EVT:
> +		dev_dbg_ratelimited(dev, "Thermistor 2 threshold crossed\n");
> +		break;
> +	case EC_THERMISTOR_3_THRESHOLD_CROSS_EVT:
> +		dev_dbg_ratelimited(dev, "Thermistor 3 threshold crossed\n");
> +		break;
> +	case EC_RECOVERED_FROM_RESET_EVT:
> +		dev_dbg_ratelimited(dev, "EC recovered from reset\n");
> +		break;
> +	default:
> +		dev_notice_ratelimited(dev, "Unknown EC event: %d\n", val);
> +		break;
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int qcom_ec_sci_evt_control(struct device *dev, bool enable)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	return i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, !!enable);

This converts bool -> u8 using C's implicit conversion rules (plus on top 
of that does unnecessary !!). Please write the conversion explicitly, you 
can use ?: syntax for brevity.

> +}
> +
> +static int qcom_ec_fan_get_max_state(struct thermal_cooling_device *cdev, unsigned long *state)
> +{
> +	*state = EC_FAN_MAX_PWM;
> +
> +	return 0;
> +}
> +
> +static int qcom_ec_fan_get_cur_state(struct thermal_cooling_device *cdev, unsigned long *state)
> +{
> +	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
> +
> +	*state = ec_cdev->state;
> +
> +	return 0;
> +}
> +
> +/*
> + * Fan Debug control command:
> + *
> + * Command Payload:
> + * --------------------------------------------------------------------------------------
> + * | Offset		| Name		| Description					|
> + * --------------------------------------------------------------------------------------
> + * | 0x00		| Command	| Fan control command				|
> + * --------------------------------------------------------------------------------------
> + * | 0x01		| Fan ID	| 0x1 : Fan 1					|
> + * |			|		| 0x2 : Fan 2					|
> + * --------------------------------------------------------------------------------------
> + * | 0x02		| Byte count = 4| Size of data to set fan speed			|
> + * --------------------------------------------------------------------------------------
> + * | 0x03		| Mode		| Bit 0: Debug Mode On/Off (0 - OFF, 1 - ON )	|
> + * |			|		| Bit 1: Fan On/Off (0 - Off, 1 - ON)		|
> + * |			|		| Bit 2: Debug Type (0 - RPM, 1 - PWM)		|
> + * --------------------------------------------------------------------------------------
> + * | 0x04 (LSB)	| Speed in RPM	| RPM value, if mode selected is RPM		|
> + * | 0x05		|		|						|
> + * --------------------------------------------------------------------------------------
> + * | 0x06		| Speed in PWM	| PWM value, if mode selected is PWM (0 - 255)	|
> + * ______________________________________________________________________________________
> + *
> + */
> +static int qcom_ec_fan_debug_mode_off(struct qcom_ec_cooling_dev *ec_cdev)
> +{
> +	struct device *dev = ec_cdev->parent_dev;
> +	struct i2c_client *client = to_i2c_client(dev);
> +	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
> +			  EC_FAN_DEBUG_MODE_OFF, 0, 0, 0 };
> +	int ret;
> +
> +	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
> +					     sizeof(request), request);
> +	if (ret) {
> +		dev_err(dev, "Failed to turn off fan%d debug mode: %d\n",
> +			ec_cdev->fan_id, ret);
> +	}
> +
> +	return ret;
> +}
> +
> +static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
> +{
> +	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
> +	struct device *dev = ec_cdev->parent_dev;
> +	struct i2c_client *client = to_i2c_client(dev);
> +	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
> +			  EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
> +			  0, 0, state };
> +	int ret;
> +
> +	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
> +					     sizeof(request), request);
> +	if (ret) {
> +		dev_err(dev, "Failed to set fan pwm: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ec_cdev->state = state;
> +
> +	return 0;
> +}
> +
> +static const struct thermal_cooling_device_ops qcom_ec_thermal_ops = {
> +	.get_max_state = qcom_ec_fan_get_max_state,
> +	.get_cur_state = qcom_ec_fan_get_cur_state,
> +	.set_cur_state = qcom_ec_fan_set_cur_state,
> +};
> +
> +static int qcom_ec_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
> +					 EC_MODERN_STANDBY_EXIT);
> +}
> +
> +static int qcom_ec_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
> +					 EC_MODERN_STANDBY_ENTER);
> +}
> +
> +static int qcom_ec_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct qcom_ec *ec;
> +	unsigned int i;
> +	int ret;
> +
> +	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> +	if (!ec)
> +		return -ENOMEM;
> +
> +	ec->client = client;
> +
> +	ret = devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_irq,
> +					IRQF_ONESHOT, "qcom_ec", ec);
> +	if (ret < 0)
> +		return ret;
> +
> +	i2c_set_clientdata(client, ec);
> +
> +	ret = qcom_ec_read_fw_version(dev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to read EC firmware version\n");
> +
> +	ret = qcom_ec_sci_evt_control(dev, true);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to enable SCI events\n");
> +
> +	ret = qcom_ec_thermal_capabilities(dev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
> +
> +	if (ec->thermal_cap.fan_cnt == 0) {
> +		dev_warn(dev, FW_BUG "Failed to get fan count, firmware update required\n");
> +		return 0;
> +	}
> +
> +	ec->ec_cdev = devm_kcalloc(dev, ec->thermal_cap.fan_cnt, sizeof(*ec->ec_cdev), GFP_KERNEL);
> +	if (!ec->ec_cdev)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ec->thermal_cap.fan_cnt; i++) {
> +		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
> +		char name[EC_FAN_NAME_SIZE];
> +
> +		scnprintf(name, sizeof(name), "qcom_ec_fan_%u", i);
> +		ec_cdev->fan_id = i + 1;
> +		ec_cdev->parent_dev = dev;
> +
> +		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, NULL, name, ec_cdev,
> +									&qcom_ec_thermal_ops);
> +		if (IS_ERR(ec_cdev->cdev)) {
> +			return dev_err_probe(dev, PTR_ERR(ec_cdev->cdev),
> +					     "Failed to register fan%d cooling device\n", i);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void qcom_ec_remove(struct i2c_client *client)
> +{
> +	struct qcom_ec *ec = i2c_get_clientdata(client);
> +	struct device *dev = &client->dev;
> +	int ret;
> +
> +	ret = qcom_ec_sci_evt_control(dev, false);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
> +
> +	for (int i = 0; i < ec->thermal_cap.fan_cnt; i++) {
> +		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
> +
> +		qcom_ec_fan_debug_mode_off(ec_cdev);
> +	}
> +}
> +
> +static const struct of_device_id qcom_ec_of_match[] = {
> +	{ .compatible = "qcom,hamoa-crd-ec" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, qcom_ec_of_match);
> +
> +static const struct i2c_device_id qcom_ec_i2c_id_table[] = {
> +	{ "qcom-hamoa-ec", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, qcom_ec_i2c_id_table);
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(qcom_ec_pm_ops,
> +		qcom_ec_suspend,
> +		qcom_ec_resume);
> +
> +static struct i2c_driver qcom_ec_i2c_driver = {
> +	.driver = {
> +		.name = "qcom-hamoa-ec",
> +		.of_match_table = qcom_ec_of_match,
> +		.pm = &qcom_ec_pm_ops

Please always add comma to any non-terminating entry.

> +	},
> +	.probe = qcom_ec_probe,
> +	.remove = qcom_ec_remove,
> +	.id_table = qcom_ec_i2c_id_table,
> +};
> +module_i2c_driver(qcom_ec_i2c_driver);
> +
> +MODULE_DESCRIPTION("QCOM Hamoa Embedded Controller");
> +MODULE_LICENSE("GPL");
> 
> 

-- 
 i.


