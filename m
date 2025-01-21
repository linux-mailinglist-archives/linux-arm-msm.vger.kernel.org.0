Return-Path: <linux-arm-msm+bounces-45656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 418D0A179B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 10:00:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72127166C57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 09:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098AB1B4220;
	Tue, 21 Jan 2025 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hlbgFgPw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE88A14D711;
	Tue, 21 Jan 2025 09:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737450052; cv=none; b=qbkCo+UIYgC+OJNu1784/V+uEz0/f4UvjSW3wnM/aa1AJDGJzTLX/C66b6cjVFSN0Vhqd0kaedu+MNHwo7Xbq/IFv7UbtGN7HvPjtU1FyzUqnJsdCfgeXMK7h9qnO/k2RidDCfPDrxc6HTPAKk8aef+63Fsj/0ZvoHQs6H3XwKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737450052; c=relaxed/simple;
	bh=vFNoBZ+nI5T4qVwrUslpx8ALifj8Vv/ubexULfrSCjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NuTPrpoedqv5d8/xZEEmHrsAGCoRqWhhVeKpXJAH19ydcTJvRcfzqOnxazMymHL4s2bpfdPpaQic5TArtw1F0n+CeaqrkfIDIn+ZhCYFxd30uZ1yXmLFOV+ShPIO2jg7q8LNTwy24mUIHeVCo7IkFiEFOtvpE5akwGCNRu47bAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hlbgFgPw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2ECC4CEDF;
	Tue, 21 Jan 2025 09:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737450052;
	bh=vFNoBZ+nI5T4qVwrUslpx8ALifj8Vv/ubexULfrSCjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hlbgFgPwb8HYu2JbNrOg38Y0v91/KxpL5P5hBNQe0BjeZs+s3abzX6Kxtah4qD/e1
	 ROy6PcpdCvI1cjjcRRAXeOHAZIDdtcSs3ucyHYoRrx9SX+d/2qtkoyoc057c7R+kjv
	 vdXQABuPkmnGDnn25izHoWOwLrgBL7a0zGSbhONwhwxtSr8TVPpVJUivaExs9tmr76
	 cBGHDKAzQL3khAvvRNNsdst4mz1KA0lL/RX5wGzer6ITHjlIIkgr9Uj3gSMq8kGedR
	 gEgSmskZUR+Si96fbkMpTaJbRqGFIB2TL6N7ZYvuoZiH28C7uAwyhmSYK6WplP85cD
	 8Kff8JAyx0PYA==
Date: Tue, 21 Jan 2025 10:00:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/2] coresight: Add remote etm support
Message-ID: <20250121-honored-turkey-from-sirius-ad2caf@krzk-bin>
References: <20250121063900.3211-1-quic_jinlmao@quicinc.com>
 <20250121063900.3211-3-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250121063900.3211-3-quic_jinlmao@quicinc.com>

On Tue, Jan 21, 2025 at 02:39:00PM +0800, Mao Jinlong wrote:
> The system on chip (SoC) consists of main APSS(Applications
> processor subsytem) and additional processors like modem, lpass.
> Coresight remote etm(Embedded Trace Macrocell) driver is for
> enabling and disabling the etm trace of remote processors. It
> uses QMI interface to communicate with remote processors' software
> and uses coresight framework to configure the connection from
> remote etm source to TMC sinks.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  drivers/hwtracing/coresight/Kconfig           |  13 +
>  drivers/hwtracing/coresight/Makefile          |   1 +
>  drivers/hwtracing/coresight/coresight-qmi.h   |  89 +++++
>  .../coresight/coresight-remote-etm.c          | 316 ++++++++++++++++++
>  4 files changed, 419 insertions(+)
>  create mode 100644 drivers/hwtracing/coresight/coresight-qmi.h
>  create mode 100644 drivers/hwtracing/coresight/coresight-remote-etm.c
> 
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index 06f0a7594169..871dd83649ea 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -247,4 +247,17 @@ config CORESIGHT_DUMMY
>  
>  	  To compile this driver as a module, choose M here: the module will be
>  	  called coresight-dummy.
> +
> +config CORESIGHT_REMOTE_ETM
> +	tristate "Remote processor ETM trace support"
> +	depends on QCOM_QMI_HELPERS
> +	help
> +	  Enables support for ETM trace collection on remote processor using
> +	  CoreSight framework. Enabling this will allow turning on ETM
> +	  tracing on remote processor via sysfs by configuring the required
> +	  CoreSight components.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called coresight-remote-etm.
> +
>  endif
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 4ba478211b31..e0781d729eb3 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
>  		   coresight-cti-sysfs.o
>  obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>  obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
> +obj-$(CONFIG_CORESIGHT_REMOTE_ETM) += coresight-remote-etm.o
> diff --git a/drivers/hwtracing/coresight/coresight-qmi.h b/drivers/hwtracing/coresight/coresight-qmi.h
> new file mode 100644
> index 000000000000..c9b49500d11c
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-qmi.h
> @@ -0,0 +1,89 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _CORESIGHT_QMI_H
> +#define _CORESIGHT_QMI_H
> +
> +#include <linux/soc/qcom/qmi.h>
> +
> +#define CORESIGHT_QMI_SVC_ID			(0x33)
> +#define CORESIGHT_QMI_VERSION			(1)
> +
> +#define CORESIGHT_QMI_GET_ETM_REQ_V01		(0x002B)
> +#define CORESIGHT_QMI_GET_ETM_RESP_V01		(0x002B)
> +#define CORESIGHT_QMI_SET_ETM_REQ_V01		(0x002C)
> +#define CORESIGHT_QMI_SET_ETM_RESP_V01		(0x002C)
> +
> +#define CORESIGHT_QMI_GET_ETM_REQ_MAX_LEN	(0)
> +#define CORESIGHT_QMI_GET_ETM_RESP_MAX_LEN	(14)
> +#define CORESIGHT_QMI_SET_ETM_REQ_MAX_LEN	(7)
> +#define CORESIGHT_QMI_SET_ETM_RESP_MAX_LEN	(7)
> +
> +#define TIMEOUT_MS				(10000)
> +
> +enum coresight_etm_state_enum_type_v01 {
> +	/* To force a 32 bit signed enum. Do not change or use */
> +	CORESIGHT_ETM_STATE_ENUM_TYPE_MIN_ENUM_VAL_V01 = INT_MIN,
> +	CORESIGHT_ETM_STATE_DISABLED_V01 = 0,
> +	CORESIGHT_ETM_STATE_ENABLED_V01 = 1,
> +	CORESIGHT_ETM_STATE_ENUM_TYPE_MAX_ENUM_VAL_01 = INT_MAX,
> +};
> +
> +struct coresight_set_etm_req_msg_v01 {
> +	/* Mandatory */
> +	/* ETM output state */
> +	enum coresight_etm_state_enum_type_v01 state;
> +};
> +
> +struct coresight_set_etm_resp_msg_v01 {
> +	/* Mandatory */
> +	struct qmi_response_type_v01 resp;
> +};
> +
> +static struct qmi_elem_info coresight_set_etm_req_msg_v01_ei[] = {

Why, unlike every other instance, this cannot be const?

Anyway, you cannot have DATA in the header. This makes little sense.
There is no such patterns so I don't understand from where did you get
this.

...

> +	{
> +		.data_type = QMI_UNSIGNED_4_BYTE,
> +		.elem_len  = 1,
> +		.elem_size = sizeof(enum coresight_etm_state_enum_type_v01),
> +		.array_type  = NO_ARRAY,
> +		.tlv_type  = 0x01,
> +		.offset    = offsetof(struct coresight_set_etm_req_msg_v01,
> +				      state),
> +		.ei_array  = NULL,
> +	},

> +static int remote_etm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct coresight_platform_data *pdata;
> +	struct remote_etm_drvdata *drvdata;
> +	struct coresight_desc desc = {0 };
> +	int ret;
> +
> +	desc.name = coresight_alloc_device_name(&remote_etm_devs, dev);
> +	if (!desc.name)
> +		return -ENOMEM;
> +	pdata = coresight_get_platform_data(dev);
> +	if (IS_ERR(pdata))
> +		return PTR_ERR(pdata);
> +	pdev->dev.platform_data = pdata;
> +
> +	pm_runtime_enable(dev);
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->dev = &pdev->dev;

Use the cached value, if you cache it.

 = dev

> +	platform_set_drvdata(pdev, drvdata);
> +
> +	drvdata->qmi_id = (u32)(unsigned long)of_device_get_match_data(&pdev->dev);

Ditto, everywhere...

> +
> +	mutex_init(&drvdata->mutex);
> +
> +	ret = qmi_handle_init(&drvdata->handle,
> +			CORESIGHT_QMI_SET_ETM_REQ_MAX_LEN,
> +			&server_ops, NULL);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "Remote ETM client init failed.\n");

Syntax is always: return dev_err_probe. I am pretty sure you got this
feedback before.

Best regards,
Krzysztof


