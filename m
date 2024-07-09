Return-Path: <linux-arm-msm+bounces-25726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B3792C2E0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 19:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CE82B23DB7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 17:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22A91494C8;
	Tue,  9 Jul 2024 17:53:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9316B1B86FD;
	Tue,  9 Jul 2024 17:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720547588; cv=none; b=TQ2PimL+ePga5bd4hLTDAA4sjP7XsSQneXq5wa0f3caPhCyGEpXNwG/oO8MXo3wCbMIIE9vWPsnXEVfGfrELaRGfct0d7zAdVk73DiRPhB2rOuEMqN9LDAAE903Iz4PCxS7noxawjZtWJ3jRWUFSl9+cci9nBDAkSnNottmp+eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720547588; c=relaxed/simple;
	bh=IC/ZFD3Lu3RiqZXMRBwkx/gbLAIdMK/ICwgLASYnQZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArE1BkWUXSXgGE13IaahvVL5GRio53BIgQGfnS3rHd2TsCfAGo00r9+8ANPfMrEP0eA0/hNqeSCYkAEuqJNihloAUZ52pV5WeUZPxfzQULAcNaBlyRycZSoMeehvQzLy8gZ+z81kz/3aZqvqCgBb0Ngyt5pt3WmK+IWhLqqptqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA50012FC;
	Tue,  9 Jul 2024 10:53:29 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 988003F762;
	Tue,  9 Jul 2024 10:53:01 -0700 (PDT)
Date: Tue, 9 Jul 2024 18:52:58 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com,
	quic_kshivnan@quicinc.com, conor+dt@kernel.org,
	Amir Vajid <avajid@quicinc.com>
Subject: Re: [RFC V3 2/4] firmware: arm_scmi: vendors: Add ARM SCMI QCOM
 vendor protocol v1.0
Message-ID: <Zo14-rQ1Jaxh5Idi@pluto>
References: <20240702191440.2161623-1-quic_sibis@quicinc.com>
 <20240702191440.2161623-3-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702191440.2161623-3-quic_sibis@quicinc.com>

On Wed, Jul 03, 2024 at 12:44:38AM +0530, Sibi Sankar wrote:
> The ARM SCMI QCOM vendor protocol provides a generic way of exposing a
> number of Qualcomm SoC specific features (like memory bus scaling) through
> a mixture of pre-determined algorithm strings and param_id pairs hosted on
> the SCMI controller.
> 

Hi Sibi,

> Co-developed-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Co-developed-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Signed-off-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Co-developed-by: Amir Vajid <avajid@quicinc.com>
> Signed-off-by: Amir Vajid <avajid@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  drivers/firmware/arm_scmi/vendors/Kconfig     |  12 ++
>  drivers/firmware/arm_scmi/vendors/Makefile    |   2 +-
>  .../arm_scmi/vendors/qcom_scmi_vendor.c       | 184 ++++++++++++++++++
>  include/linux/qcom_scmi_vendor.h              |  39 ++++
>  4 files changed, 236 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/firmware/arm_scmi/vendors/qcom_scmi_vendor.c
>  create mode 100644 include/linux/qcom_scmi_vendor.h
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/Kconfig b/drivers/firmware/arm_scmi/vendors/Kconfig
> index 7c1ca7a12603..6bff4550fa25 100644
> --- a/drivers/firmware/arm_scmi/vendors/Kconfig
> +++ b/drivers/firmware/arm_scmi/vendors/Kconfig
> @@ -1,4 +1,16 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  menu "ARM SCMI Vendor Protocols"
>  
> +config ARM_SCMI_PROTOCOL_VENDOR_QCOM
> +	tristate "Qualcomm Technologies, Inc. Qcom SCMI vendor Protocol"
> +	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
> +	help
> +	  The SCMI QCOM vendor protocol provides a generic way of exposing a
> +	  number of Qualcomm SoC specific features (like memory bus scaling)
> +	  through a mixture of pre-determined algorithm strings and param_id
> +	  pairs hosted on the SCMI controller.
> +
> +	  This driver defines/documents the message ID's used for this
> +	  communication and also exposes the ops used by the clients.

operations

> +
>  endmenu
> diff --git a/drivers/firmware/arm_scmi/vendors/Makefile b/drivers/firmware/arm_scmi/vendors/Makefile
> index c6c214158dd8..c1d6a355f579 100644
> --- a/drivers/firmware/arm_scmi/vendors/Makefile
> +++ b/drivers/firmware/arm_scmi/vendors/Makefile
> @@ -1,2 +1,2 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -# obj-$(CONFIG_ARM_SCMI_PROTOCOL_<your_vendor_proto>) += <your_vendor_proto>.o
> +obj-$(CONFIG_ARM_SCMI_PROTOCOL_VENDOR_QCOM) += qcom_scmi_vendor.o
> diff --git a/drivers/firmware/arm_scmi/vendors/qcom_scmi_vendor.c b/drivers/firmware/arm_scmi/vendors/qcom_scmi_vendor.c
> new file mode 100644
> index 000000000000..e02163381d4b
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/vendors/qcom_scmi_vendor.c
> @@ -0,0 +1,184 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/qcom_scmi_vendor.h>
> +
> +#include "../common.h"
> +
> +/**
> + * qcom_scmi_vendor_protocol_cmd - vendor specific commands supported by Qualcomm SCMI
> + *                                 vendor protocol.
> + *
> + * This protocol is intended as a generic way of exposing a number of Qualcomm SoC
> + * specific features through a mixture of pre-determined algorithm string and param_id
> + * pairs hosted on the SCMI controller.
> + *
> + * The QCOM SCMI Vendor Protocol has the protocol id as 0x80 and vendor id set to
> + * Qualcomm and the implementation version set to 0x20000. The PROTOCOL_VERSION command
> + * returns version 1.0.
> + *
> + * @QCOM_SCMI_SET_PARAM: message_id: 0x10 is used to set the parameter of a specific algo_str
> + *                       hosted on QCOM SCMI Vendor Protocol. The tx len depends on the
> + *                       algo_str used.
> + * @QCOM_SCMI_GET_PARAM: message_id: 0x11 is used to get parameter information of a specific
> + *                       algo_str hosted on QCOM SCMI Vendor Protocol. The tx and rx len
> + *                       depends on the algo_str used.
> + * @QCOM_SCMI_START_ACTIVITY: message_id: 0x12 is used to start the activity performed by
> + *                            the algo_str.
> + * @QCOM_SCMI_STOP_ACTIVITY: message_id: 0x13 is used to stop a pre-existing activity
> + *                           performed by the algo_str.
> + */
> +enum qcom_scmi_vendor_protocol_cmd {
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
> +static int qcom_scmi_set_param(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
> +			       u32 param_id, size_t size)
> +{

size is also length of the provided buffer *buf right ? 

In that case, like I also mention below, please call it buf_len, or
something like that, and have it following *buf in the param list...

> +	struct scmi_xfer *t;
> +	struct qcom_scmi_msg *msg;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, QCOM_SCMI_SET_PARAM, size + sizeof(*msg), 0, &t);
> +	if (ret)
> +		return ret;
> +
> +	msg = t->tx.buf;
> +	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
> +	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
> +	msg->param_id = cpu_to_le32(param_id);
> +
> +	memcpy(msg->buf, buf, t->tx.len - sizeof(*msg));
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
> +static int qcom_scmi_get_param(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
> +			       u32 param_id, size_t tx_size, size_t rx_size)
> +{

Similarly...and looking at my past ramblings...this rx_size is the expected RX
size AND also the size of the provided *buf too, right ?

> +	struct scmi_xfer *t;
> +	struct qcom_scmi_msg *msg;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, QCOM_SCMI_GET_PARAM, tx_size + sizeof(*msg), rx_size, &t);
> +	if (ret)
> +		return ret;
> +
> +	msg = t->tx.buf;
> +	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
> +	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
> +	msg->param_id = cpu_to_le32(param_id);
> +	memcpy(msg->buf, buf, t->tx.len - sizeof(*msg));
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	memcpy(buf, t->rx.buf, t->rx.len);

...so that this memcpy is safe since rx.len is equal to rx_size by construction
(if I read correctly my past review/mublings...)

...in that case maybe, for better clarity you could re-name the rx_size
param as buf_len and have it following *buf in the param list...


...sorry for not having spotted this naming/order niptick earlier ...

> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
> +static int qcom_scmi_start_activity(const struct scmi_protocol_handle *ph,
> +				    void *buf, u64 algo_str, u32 param_id, size_t size)
> +{

Same .. rename and reorder.

> +	struct scmi_xfer *t;
> +	struct qcom_scmi_msg *msg;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, QCOM_SCMI_START_ACTIVITY, size + sizeof(*msg), 0, &t);
> +	if (ret)
> +		return ret;
> +
> +	msg = t->tx.buf;
> +	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
> +	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
> +	msg->param_id = cpu_to_le32(param_id);
> +
> +	memcpy(msg->buf, buf, t->tx.len - sizeof(*msg));
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
> +static int qcom_scmi_stop_activity(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
> +				   u32 param_id, size_t size)
> +{

Same .. rename and reorder.

> +	struct scmi_xfer *t;
> +	struct qcom_scmi_msg *msg;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, QCOM_SCMI_STOP_ACTIVITY, size + sizeof(*msg), 0, &t);
> +	if (ret)
> +		return ret;
> +
> +	msg = t->tx.buf;
> +	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
> +	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
> +	msg->param_id = cpu_to_le32(param_id);
> +
> +	memcpy(msg->buf, buf, t->tx.len - sizeof(*msg));
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
> +static struct qcom_scmi_vendor_ops qcom_proto_ops = {
> +	.set_param = qcom_scmi_set_param,
> +	.get_param = qcom_scmi_get_param,
> +	.start_activity = qcom_scmi_start_activity,
> +	.stop_activity = qcom_scmi_stop_activity,
> +};
> +
> +static int qcom_scmi_vendor_protocol_init(const struct scmi_protocol_handle *ph)
> +{
> +	u32 version;
> +
> +	ph->xops->version_get(ph, &version);
> +
> +	dev_dbg(ph->dev, "SCMI QCOM Vendor Version %d.%d\n",
> +		PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
> +
> +	return 0;
> +}
> +
> +static const struct scmi_protocol qcom_scmi_vendor = {
> +	.id = QCOM_SCMI_VENDOR_PROTOCOL,
> +	.owner = THIS_MODULE,
> +	.instance_init = &qcom_scmi_vendor_protocol_init,
> +	.ops = &qcom_proto_ops,
> +	.vendor_id = "Qualcomm",
> +	.impl_ver = 0x20000,
> +};
> +module_scmi_protocol(qcom_scmi_vendor);
> +
> +MODULE_DESCRIPTION("QTI SCMI vendor protocol");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/qcom_scmi_vendor.h b/include/linux/qcom_scmi_vendor.h
> new file mode 100644
> index 000000000000..60f85fedee80
> --- /dev/null
> +++ b/include/linux/qcom_scmi_vendor.h
> @@ -0,0 +1,39 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * QTI SCMI vendor protocol's header
> + *
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _QCOM_SCMI_VENDOR_H
> +#define _QCOM_SCMI_VENDOR_H
> +
> +#include <linux/bitfield.h>
> +#include <linux/device.h>
> +#include <linux/types.h>
> +
> +#define QCOM_SCMI_VENDOR_PROTOCOL    0x80
> +
> +struct scmi_protocol_handle;
> +
> +/**
> + * struct qcom_scmi_vendor_ops - represents the various operations provided
> + *				 by QCOM SCMI Vendor Protocol
> + *
> + * @set_param: set parameter specified by param_id and algo_str pair.
> + * @get_param: retrieve parameter specified by param_id and algo_str pair.
> + * @start_activity: initiate a specific activity defined by algo_str.
> + * @stop_activity: halt previously initiated activity defined by algo_str.
> + */
> +struct qcom_scmi_vendor_ops {
> +	int (*set_param)(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
> +			 u32 param_id, size_t size);
> +	int (*get_param)(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
> +			 u32 param_id, size_t tx_size, size_t rx_size);
> +	int (*start_activity)(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
> +			      u32 param_id, size_t size);
> +	int (*stop_activity)(const struct scmi_protocol_handle *ph, void *buf, u64 algo_str,
> +			     u32 param_id, size_t size);
> +};
> +
> +#endif /* _QCOM_SCMI_VENDOR_H */

...beside the above nitpicks...

LGTM,
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

