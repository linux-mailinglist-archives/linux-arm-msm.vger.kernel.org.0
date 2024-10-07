Return-Path: <linux-arm-msm+bounces-33435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9249935CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 20:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27C4F1F25163
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 18:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F921DDC0D;
	Mon,  7 Oct 2024 18:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k9qGV273"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E545D1DDC16
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 18:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728324828; cv=none; b=Vc1A4QGcMrsjMHFzS5BeA02PKxTwg4kmvAPt0JObLBaOgWdMLHZGE55bGoU+0N3ySbj7I1I6ZZor10nCmwN4ylgpHteQxaYGflcvua2wE1nbG7VeYwrBRzDj7BIgnpN4JrJvrVfrBkmyvFkhZ9gDHpeI3bHFWb3HqBJGW8F6FCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728324828; c=relaxed/simple;
	bh=J/nyTgKflK4raUrDZf+X4S1ynQVn4K+srV+rfsHXMvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAn7w9+6iiG7gZ7n93G8fY2VuATNtNZ8yoRoKvhqCVWGzzbMcAu4fXp3kPDiG1oxZYGgQfbTZIajWceJX6iwED1RY+C60xqjQhFx5h4olrUsjD3r2IxIKB41tw1vmIAMcMwuS8HX2m/pnd4OAr5vgMKdy1VG2KO6MisDAxHBxI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k9qGV273; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fada911953so54376541fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 11:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728324824; x=1728929624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dWs/TQeQC1aW6jUxqPeU72e5mPSnP2I+Ma5FEsYLe7U=;
        b=k9qGV273AyWq7t8R0DYADHzfRxR1j5R8d08H7uInXF0SnSfFJN3x521FNZhwXYQMQt
         K3JcmJF1B/ukzrT6OmEZQbVYyQ+/a+g+krv2fk78J6fwQcz/+cc0Cc+Ga4OSlgAs+JnX
         stacBS41azuaIdh2llMKQq/EYoNZPl/+nebMgLCCcUxvgYH0hgXikq6kfDTzUryVUZwD
         WNXDs61l+ABeAnCfKB+Oivf25m0nFDBTlcOiKyMa2SwRhS6NTOcr1PspCv557b5lD9RX
         sl8x//ZcIQOauW4gTVdQ6/Ywy+Sbzf+gAVjx8OmPbEFdo1b0JGkn5lYe5wbLakOMirT2
         ZYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728324824; x=1728929624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWs/TQeQC1aW6jUxqPeU72e5mPSnP2I+Ma5FEsYLe7U=;
        b=E7AgToUMF0hf+TH8iXIDAE7bWuOW3rBTG5sFkCxyiwImT9NXRDk9otiZY0kJNQbHxw
         sHBFT6pkVf+jFSSqZ9T0+tyJGy5KUbs5Ld964sFBOrBbBhIGldDZRPtCYemmurKJq/LT
         59jYukBqCiJp+LVwAbz8O/C1HRI/JA8zrNBmlLZWUmeiTdZgJ9MAto5srd3Q+0Q9MgX3
         AkUS+McygpSWbX3AhIZ+Fj1xTxk0OV8QI9AeB01yURVVEnEGK+Ej9cI2eCZTy9fwUlhc
         nQHzbc5HEtKMg+CAwGVw512UfBFPeenDVq3m19woYjaOBotXih3YbBQWD1gJSv+iqDGg
         BsIg==
X-Forwarded-Encrypted: i=1; AJvYcCUu766PAU9LJrzWfzBJtpjRgeiWwKx8RcmIZeU+iWZ8+MAMF7q5uJA35LcGU3F9WqbuBm6FUP6h6ZuVEbwu@vger.kernel.org
X-Gm-Message-State: AOJu0YydxmPqXjnZ56xnkxpxb0RxfPcH7HARsk3qpSY7ASJtCPx+q2ga
	JUaVVk3ZXpkg221HaGPLN4h5rlHTxvx8vlPtM+C+/FlrWqXxTLGJSL5l3Xd8Qfw=
X-Google-Smtp-Source: AGHT+IHWwkBF0ANmesECcb6qoQD4LYdB7aqOHaOOzj8+NnSzPePY1ubSt/D+0ye45Q005g94rAeFXA==
X-Received: by 2002:a05:651c:199f:b0:2fa:c685:404a with SMTP id 38308e7fff4ca-2fb0de776c7mr1717501fa.4.1728324823886;
        Mon, 07 Oct 2024 11:13:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9ac450bsm9175271fa.49.2024.10.07.11.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 11:13:42 -0700 (PDT)
Date: Mon, 7 Oct 2024 21:13:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, 
	conor+dt@kernel.org, arm-scmi@vger.kernel.org, Amir Vajid <avajid@quicinc.com>
Subject: Re: [PATCH V4 3/5] firmware: arm_scmi: vendors: Add QCOM SCMI
 Generic Extensions
Message-ID: <3vj55wm7j6fz32q2pynzqikl4yysno5zdlpt6zz6xylcv237ak@bwejn7zn5o3o>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-4-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007061023.1978380-4-quic_sibis@quicinc.com>

On Mon, Oct 07, 2024 at 11:40:21AM GMT, Sibi Sankar wrote:
> The QCOM SCMI Generic Extensions Protocol provides a generic way of
> exposing a number of Qualcomm SoC specific features (like memory bus
> scaling) through a mixture of pre-determined algorithm strings and
> param_id pairs hosted on the SCMI controller.
> 
> Co-developed-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
> Co-developed-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Signed-off-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
> Co-developed-by: Amir Vajid <avajid@quicinc.com>
> Signed-off-by: Amir Vajid <avajid@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> 
> v3:
> * Pick up Rb tag and fixup/re-order elements of the vendor ops [Christian]
> * Follow naming convention and folder structure used by IMX
> * Add missing enum in the vendor protocol and fix documentation [Konrad]
> 
>  drivers/firmware/arm_scmi/Kconfig             |   1 +
>  drivers/firmware/arm_scmi/Makefile            |   1 +
>  .../firmware/arm_scmi/vendors/qcom/Kconfig    |  15 ++
>  .../firmware/arm_scmi/vendors/qcom/Makefile   |   2 +
>  .../arm_scmi/vendors/qcom/qcom-generic-ext.c  | 184 ++++++++++++++++++
>  include/linux/scmi_qcom_protocol.h            |  39 ++++
>  6 files changed, 242 insertions(+)
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
> index 000000000000..f7cd949161df
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c
> @@ -0,0 +1,184 @@
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

Drop message_id's from the definitions. They duplicate enum values.

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
> +static int qcom_scmi_set_param(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
> +			       u64 algo_str, u32 param_id)
> +{
> +	struct scmi_xfer *t;
> +	struct qcom_scmi_msg *msg;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, QCOM_SCMI_SET_PARAM, buf_len + sizeof(*msg), 0, &t);
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
> +static int qcom_scmi_get_param(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
> +			       u64 algo_str, u32 param_id, size_t rx_size)
> +{
> +	struct scmi_xfer *t;
> +	struct qcom_scmi_msg *msg;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, QCOM_SCMI_GET_PARAM, buf_len + sizeof(*msg), rx_size, &t);
> +	if (ret)
> +		return ret;
> +
> +	msg = t->tx.buf;
> +	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
> +	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
> +	msg->param_id = cpu_to_le32(param_id);
> +	memcpy(msg->buf, buf, t->tx.len - sizeof(*msg));

Isn't it buf_len?

> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	memcpy(buf, t->rx.buf, t->rx.len);
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
> +static int qcom_scmi_start_activity(const struct scmi_protocol_handle *ph, void *buf,
> +				    size_t buf_len, u64 algo_str, u32 param_id)
> +{
> +	struct scmi_xfer *t;
> +	struct qcom_scmi_msg *msg;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, QCOM_SCMI_START_ACTIVITY, buf_len + sizeof(*msg), 0, &t);
> +	if (ret)
> +		return ret;
> +
> +	msg = t->tx.buf;
> +	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
> +	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
> +	msg->param_id = cpu_to_le32(param_id);
> +
> +	memcpy(msg->buf, buf, t->tx.len - sizeof(*msg));

Isn't it buf_len?

> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
> +static int qcom_scmi_stop_activity(const struct scmi_protocol_handle *ph, void *buf,
> +				   size_t buf_len, u64 algo_str, u32 param_id)
> +{
> +	struct scmi_xfer *t;
> +	struct qcom_scmi_msg *msg;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, QCOM_SCMI_STOP_ACTIVITY, buf_len + sizeof(*msg), 0, &t);
> +	if (ret)
> +		return ret;
> +
> +	msg = t->tx.buf;
> +	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
> +	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
> +	msg->param_id = cpu_to_le32(param_id);
> +
> +	memcpy(msg->buf, buf, t->tx.len - sizeof(*msg));

Isn't it buf_len?

> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	ph->xops->xfer_put(ph, t);

Could you please extract a common helper that handles xfer for you?
Seeing the same code 4 times is 3 times too much in my opinion.

> +
> +	return ret;
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
> +
> +	dev_info(ph->dev, "QCOM Generic Vendor Version %d.%d\n",
> +		 PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));

dev_dbg, please.

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
> +MODULE_DESCRIPTION("QCOM SCMI Generic Vendor protocol");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/scmi_qcom_protocol.h b/include/linux/scmi_qcom_protocol.h
> new file mode 100644
> index 000000000000..8f82c42e566d
> --- /dev/null
> +++ b/include/linux/scmi_qcom_protocol.h
> @@ -0,0 +1,39 @@
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
> +#include <linux/bitfield.h>
> +#include <linux/device.h>

It doesn't look like you need those two headers.

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
> 2.34.1
> 

-- 
With best wishes
Dmitry

