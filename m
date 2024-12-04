Return-Path: <linux-arm-msm+bounces-40246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AF59E3AC1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 14:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F6B9280DDC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 13:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E381990C4;
	Wed,  4 Dec 2024 13:01:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1C14A33;
	Wed,  4 Dec 2024 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733317271; cv=none; b=YnTYo/8+ItXRCzO6o19+83s4tuMpLhbnr6puuGxjbKQvpBL1JAoWc0HJUrIPsmCVZf3HggGgsdHj7hJk/4u1ZxJD3fu22csLe2RI9rnBmsrzBzpcQBz6IycYqOS10R2s6GlerEFrsn+UOHlG9ZOidtl2kQMTsMmvThotMQrVgzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733317271; c=relaxed/simple;
	bh=g3tWKF0IiA52A6wIvPAxkU2dG0hlw8+KXjuLtb3lccI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9ay3MKzp2/KfopmemR1agat+3B6uAtudtpOTAMJrhvHWTC5g0Lx4F5A79DS7mmxw9SO5OK5DQuVCxx2Ih544gnrq1haFJaa8RDI7Hb29yf3d/n8Xr4ILUxQzIYmh3eTrUU+/i8e2ZLe2CsVuM1pNtnKilnEBcWVntoCtEWBDCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4C6E1063;
	Wed,  4 Dec 2024 05:01:34 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54AEB3F71E;
	Wed,  4 Dec 2024 05:01:03 -0800 (PST)
Date: Wed, 4 Dec 2024 13:01:00 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com,
	arm-scmi@vger.kernel.org, Amir Vajid <avajid@quicinc.com>
Subject: Re: [PATCH V5 2/2] firmware: arm_scmi: vendors: Add QCOM SCMI
 Generic Extensions
Message-ID: <Z1BSjM5heBoRFCYk@pluto>
References: <20241115011515.1313447-1-quic_sibis@quicinc.com>
 <20241115011515.1313447-3-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115011515.1313447-3-quic_sibis@quicinc.com>

On Fri, Nov 15, 2024 at 06:45:15AM +0530, Sibi Sankar wrote:
> The QCOM SCMI Generic Extensions Protocol provides a generic way of
> exposing a number of Qualcomm SoC specific features (like memory bus
> scaling) through a mixture of pre-determined algorithm strings and
> param_id pairs hosted on the SCMI controller.
>

Hi,
 
> Co-developed-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Co-developed-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Signed-off-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Co-developed-by: Amir Vajid <avajid@quicinc.com>
> Signed-off-by: Amir Vajid <avajid@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

You reworked/refactored quite a lot the internals since V4, you should
have dropped the Reviewed-by tag.

> ---
> 
> v4:
> * Splitting the series into vendor protocol and memlat client.
>   Also the move the memlat client implementation back to RFC
>   due to multiple opens.
> * Use common xfer helper to avoid code duplication [Dmitry]
> * Update enum documentation without duplicate enum info [Dmitry]
> 
>  drivers/firmware/arm_scmi/Kconfig             |   1 +
>  drivers/firmware/arm_scmi/Makefile            |   1 +
>  .../firmware/arm_scmi/vendors/qcom/Kconfig    |  15 ++
>  .../firmware/arm_scmi/vendors/qcom/Makefile   |   2 +
>  .../arm_scmi/vendors/qcom/qcom-generic-ext.c  | 139 ++++++++++++++++++
>  include/linux/scmi_qcom_protocol.h            |  37 +++++
>  6 files changed, 195 insertions(+)
>  create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/Kconfig
>  create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/Makefile
>  create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c
>  create mode 100644 include/linux/scmi_qcom_protocol.h
> 
> diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
> index dabd874641d0..73128442d97b 100644
> --- a/drivers/firmware/arm_scmi/Kconfig
> +++ b/drivers/firmware/arm_scmi/Kconfig
> @@ -71,6 +71,7 @@ config ARM_SCMI_DEBUG_COUNTERS
>  
>  source "drivers/firmware/arm_scmi/transports/Kconfig"
>  source "drivers/firmware/arm_scmi/vendors/imx/Kconfig"
> +source "drivers/firmware/arm_scmi/vendors/qcom/Kconfig"
>  
>  endif #ARM_SCMI_PROTOCOL
>  
> diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm_scmi/Makefile
> index 9ac81adff567..58cf4d656cbb 100644
> --- a/drivers/firmware/arm_scmi/Makefile
> +++ b/drivers/firmware/arm_scmi/Makefile
> @@ -12,6 +12,7 @@ scmi-module-objs := $(scmi-driver-y) $(scmi-protocols-y) $(scmi-transport-y)
>  
>  obj-$(CONFIG_ARM_SCMI_PROTOCOL) += transports/
>  obj-$(CONFIG_ARM_SCMI_PROTOCOL) += vendors/imx/
> +obj-$(CONFIG_ARM_SCMI_PROTOCOL) += vendors/qcom/
>  
>  obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-core.o
>  obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-module.o
> diff --git a/drivers/firmware/arm_scmi/vendors/qcom/Kconfig b/drivers/firmware/arm_scmi/vendors/qcom/Kconfig
> new file mode 100644
> index 000000000000..5dd9e8a6b75f
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/vendors/qcom/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menu "ARM SCMI QCOM Vendor Protocols"
> +
> +config QCOM_SCMI_GENERIC_EXT
> +	tristate "Qualcomm Technologies, Inc. Qcom SCMI vendor Protocol"
> +	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
> +	help
> +	  The QCOM SCMI vendor protocol provides a generic way of exposing
> +	  a number of Qualcomm SoC specific features (like memory bus scaling)
> +	  through a mixture of pre-determined algorithm strings and param_id
> +	  pairs hosted on the SCMI controller.
> +
> +	  This driver defines/documents the message ID's used for this
> +	  communication and also exposes the operations used by the clients.
> +endmenu
> diff --git a/drivers/firmware/arm_scmi/vendors/qcom/Makefile b/drivers/firmware/arm_scmi/vendors/qcom/Makefile
> new file mode 100644
> index 000000000000..6b98fabbebb8
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/vendors/qcom/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_QCOM_SCMI_GENERIC_EXT) += qcom-generic-ext.o
> diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c b/drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c
> new file mode 100644
> index 000000000000..1b209093d275
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/scmi_qcom_protocol.h>
> +
> +#include "../../common.h"
> +
> +/**
> + * enum qcom_generic_ext_protocol_cmd - vendor specific commands supported by SCMI Qualcomm
> + *                                      generic vendor protocol.
> + *
> + * This protocol is intended as a generic way of exposing a number of Qualcomm SoC
> + * specific features through a mixture of pre-determined algorithm string and param_id
> + * pairs hosted on the SCMI controller.
> + *
> + * The QCOM SCMI Vendor Protocol has the protocol id as 0x80 and vendor id set to
> + * Qualcomm and the implementation version set to 0x20000. The PROTOCOL_VERSION command
> + * returns version 1.0.

The chosen protocol ID is already defined in the protocol doc in the
series, and the note about the implementation version seems redundant,
it is indeed specified as needed in scmi_protocol.

> + *
> + * @QCOM_SCMI_SET_PARAM: is used to set the parameter of a specific algo_str hosted on
> + *			 QCOM SCMI Vendor Protocol. The tx len depends on the algo_str used.
> + * @QCOM_SCMI_GET_PARAM: is used to get parameter information of a specific algo_str
> + *			 hosted on QCOM SCMI Vendor Protocol. The tx and rx len depends
> + *			 on the algo_str used.
> + * @QCOM_SCMI_START_ACTIVITY: is used to start the activity performed by the algo_str.
> + * @QCOM_SCMI_STOP_ACTIVITY: is used to stop a pre-existing activity performed by the algo_str.
> + */
> +enum qcom_generic_ext_protocol_cmd {
> +	QCOM_SCMI_SET_PARAM = 0x10,
> +	QCOM_SCMI_GET_PARAM = 0x11,
> +	QCOM_SCMI_START_ACTIVITY = 0x12,
> +	QCOM_SCMI_STOP_ACTIVITY = 0x13,
> +};
> +
> +/**
> + * struct qcom_scmi_msg - represents the various parameters to be populated
> + *                        for using the QCOM SCMI Vendor Protocol
> + *
> + * @ext_id: reserved, must be zero
> + * @algo_low: lower 32 bits of the algo_str
> + * @algo_high: upper 32 bits of the algo_str
> + * @param_id: serves as token message id to the specific algo_str
> + * @buf: serves as the payload to the specified param_id and algo_str pair
> + */
> +struct qcom_scmi_msg {
> +	__le32 ext_id;
> +	__le32 algo_low;
> +	__le32 algo_high;
> +	__le32 param_id;
> +	__le32 buf[];
> +};
> +
> +static int qcom_scmi_common_xfer(const struct scmi_protocol_handle *ph,
> +				 enum qcom_generic_ext_protocol_cmd cmd_id, void *buf,
> +				 size_t buf_len, u64 algo_str, u32 param_id, size_t rx_size)
> +{
> +	struct scmi_xfer *t;
> +	struct qcom_scmi_msg *msg;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, cmd_id, buf_len + sizeof(*msg), rx_size, &t);
> +	if (ret)
> +		return ret;
> +
> +	msg = t->tx.buf;
> +	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
> +	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
> +	msg->param_id = cpu_to_le32(param_id);
> +	memcpy(msg->buf, buf, buf_len);
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (rx_size)

You should check ret == 0 also here before considering to pick up the reply
if a non-zero rx_size was specified.

> +		memcpy(buf, t->rx.buf, t->rx.len);

...you are using the same buf/buf_len to hold the TX request and get back
the reply content if a non-zero rx_size was provided but while you can
be sure that the reply payload rx.len <= rx_size by construction
(via xfer_get_init) you cannot be equally sure that rx_size <= buf_len
...it depends on te caller how this operation is invoked...so you could
end up oveflowing buf depending on the caller-provided params...

...please add some additional check at the start of this function like:

	if (rx_size > buf_len)
		return -EINVAL;

...to catch such bad invcations...

> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
> +static int qcom_scmi_set_param(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
> +			       u64 algo_str, u32 param_id)
> +{
> +	return qcom_scmi_common_xfer(ph, QCOM_SCMI_SET_PARAM, buf, buf_len, algo_str,
> +				     param_id, 0);
> +}
> +
> +static int qcom_scmi_get_param(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
> +			       u64 algo_str, u32 param_id, size_t rx_size)
> +{
> +	return qcom_scmi_common_xfer(ph, QCOM_SCMI_GET_PARAM, buf, buf_len, algo_str,
> +				     param_id, rx_size);
> +}
> +
> +static int qcom_scmi_start_activity(const struct scmi_protocol_handle *ph, void *buf,
> +				    size_t buf_len, u64 algo_str, u32 param_id)
> +{
> +	return qcom_scmi_common_xfer(ph, QCOM_SCMI_START_ACTIVITY, buf, buf_len, algo_str,
> +				     param_id, 0);
> +}
> +
> +static int qcom_scmi_stop_activity(const struct scmi_protocol_handle *ph, void *buf,
> +				   size_t buf_len, u64 algo_str, u32 param_id)
> +{
> +	return qcom_scmi_common_xfer(ph, QCOM_SCMI_STOP_ACTIVITY, buf, buf_len, algo_str,
> +				     param_id, 0);
> +}
> +
> +static struct qcom_generic_ext_ops qcom_proto_ops = {
> +	.set_param = qcom_scmi_set_param,
> +	.get_param = qcom_scmi_get_param,
> +	.start_activity = qcom_scmi_start_activity,
> +	.stop_activity = qcom_scmi_stop_activity,
> +};
> +
> +static int qcom_generic_ext_protocol_init(const struct scmi_protocol_handle *ph)
> +{
> +	u32 version;
> +
> +	ph->xops->version_get(ph, &version);

... please check retval and bailout on error when not even a basic version_get
succedeed...

> +
> +	dev_dbg(ph->dev, "QCOM Generic Vendor Version %d.%d\n",
> +		PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
> +
> +	return 0;
> +}
> +
> +static const struct scmi_protocol qcom_generic_ext = {
> +	.id = SCMI_PROTOCOL_QCOM_GENERIC,
> +	.owner = THIS_MODULE,
> +	.instance_init = &qcom_generic_ext_protocol_init,
> +	.ops = &qcom_proto_ops,
> +	.vendor_id = "Qualcomm",
> +	.impl_ver = 0x20000,
> +};
> +module_scmi_protocol(qcom_generic_ext);
> +

You may have to add a proper MODULE_ALIAS, if the series on autoload
goes through

https://lore.kernel.org/linux-arm-kernel/20241203200038.3961090-1-cristian.marussi@arm.com/

> +MODULE_DESCRIPTION("QCOM SCMI Generic Vendor protocol");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/scmi_qcom_protocol.h b/include/linux/scmi_qcom_protocol.h
> new file mode 100644
> index 000000000000..465b2522ca29
> --- /dev/null
> +++ b/include/linux/scmi_qcom_protocol.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * SCMI Message Protocol driver QCOM extension header
> + *
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _LINUX_SCMI_QCOM_PROTOCOL_H
> +#define _LINUX_SCMI_QCOM_PROTOCOL_H
> +
> +#include <linux/types.h>
> +
> +#define SCMI_PROTOCOL_QCOM_GENERIC    0x80
> +
> +struct scmi_protocol_handle;
> +
> +/**
> + * struct qcom_generic_ext_ops - represents the various operations provided
> + *				 by QCOM Generic Vendor Protocol
> + *
> + * @set_param: set parameter specified by param_id and algo_str pair.
> + * @get_param: retrieve parameter specified by param_id and algo_str pair.
> + * @start_activity: initiate a specific activity defined by algo_str.
> + * @stop_activity: halt previously initiated activity defined by algo_str.
> + */
> +struct qcom_generic_ext_ops {
> +	int (*set_param)(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
> +			 u64 algo_str, u32 param_id);
> +	int (*get_param)(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
> +			 u64 algo_str, u32 param_id, size_t rx_size);
> +	int (*start_activity)(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
> +			      u64 algo_str, u32 param_id);
> +	int (*stop_activity)(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
> +			     u64 algo_str, u32 param_id);
> +};
> +
> +#endif /* _LINUX_SCMI_QCOM_PROTOCOL_H */
> -- 

Thanks,
Cristian

