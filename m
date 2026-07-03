Return-Path: <linux-arm-msm+bounces-116215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dhLDBuFwR2onYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:20:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1CC6FFFDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:20:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=j61KGnJY;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116215-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116215-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E99A3105791
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50ED3374178;
	Fri,  3 Jul 2026 08:03:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BC5372B3D;
	Fri,  3 Jul 2026 08:03:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783065794; cv=none; b=uCd49UnVDo7EUfDmpXWO2Sux8x7yzJgtWswGmum35lYa22q+124NAyG5sVIzFkHLz0Yk67JcHZbf19E2podYZp3KazXUeuxTmA1qDAPO3jijd30tk5tSAbllKyt98ynPnsafpbQrfK0g17PybOUM10mIwPrOWlKo3KvVeoPXkUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783065794; c=relaxed/simple;
	bh=REbCYgzl3r1f86mbfFlyIgF4PYAw24I7tPjiMU8+gCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbajNS7wCrMn3PtVIUx2oZF5k4IPMmgvISLAqF0lkGdhSadSwAIMWJjZ016hgeBsjj7azJ56WdeF8D3nGUJhRwHvh5/Wzs5RF4KfhNjp4efqbXRSeVPpm5v5S5HxmDmI7rsFVS/ZuhW9py5XtuZuels4kyyMjVIRFa99NBgoR+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j61KGnJY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4A01F000E9;
	Fri,  3 Jul 2026 08:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783065792;
	bh=QyDIKNGVyCv/6GXhHI7UOd5RxhyDn27UfpNmASSE4vM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j61KGnJYZfNPglkNdPNMx37nFuSkQkdpDKfIrO58RkXUe6tUYR5VYnVCKlM4oWqGD
	 /ZeUzdSQHrymYn1onS+Le+bv33RQh4Z0tfbtk+TvP4A3tTvsbWkVo2OFBHToVCOdCY
	 LXbts/01YmL+5A6IAGDuqSrfRV5d8T2Qedhujm/6MNyNaqo1j6xlNoO+/SUrdP9c7b
	 zdJReVF74LK2Arhskk3i1nhCcLLsDev68fqqIkv65aoTIrgFqhNbBHczcDEHO262+5
	 FHZi6j0sVqztdizb2Im75TYt1+EWWIC0StZ44JgGW/7bnLInwEPcXXiAKp3tv4OPBk
	 MlfNhTOi9giEw==
Date: Fri, 3 Jul 2026 10:03:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, Amit Kucheria <amit.kucheria@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-hardening@vger.kernel.org, 
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>, Casey Connolly <casey.connolly@linaro.org>
Subject: Re: [PATCH v4 03/10] soc: qcom: Add QMI TMD support for remote
 thermal mitigation
Message-ID: <20260703-overjoyed-laughing-panda-ee7ecb@quoll>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-3-3882189c1f83@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703-qmi-tmd-v4-3-3882189c1f83@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:casey.connolly@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116215-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,linaro.org:email,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E1CC6FFFDE

On Fri, Jul 03, 2026 at 10:33:06AM +0530, Gaurav Kohli wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Add support for Qualcomm Messaging Interface (QMI) based Thermal Mitigation
> Device (TMD) cooling devices provided by remote subsystems.
> 
> On Qualcomm platforms where remote processors expose mitigation controls
> through the TMD QMI service, client drivers need support to discover the
> service, register cooling devices for available mitigation endpoints,
> and forward cooling state updates to remote subsystems.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Co-developed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  MAINTAINERS                      |   6 +
>  drivers/soc/qcom/Kconfig         |  10 +
>  drivers/soc/qcom/Makefile        |   1 +
>  drivers/soc/qcom/qmi_tmd.c       | 581 +++++++++++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/qmi.h     |   1 +
>  include/linux/soc/qcom/qmi_tmd.h |  23 ++
>  6 files changed, 622 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ffd85fd1dd80..251b1f583913 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22287,6 +22287,12 @@ F:	Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
>  F:	Documentation/networking/device_drivers/ethernet/qualcomm/ppe/ppe.rst
>  F:	drivers/net/ethernet/qualcomm/ppe/
>  
> +QUALCOMM QMI (REMOTEPROC THERMAL MITIGATION) TMD
> +M:	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> +L:	linux-arm-msm@vger.kernel.org
> +L:	linux-pm@vger.kernel.org
> +F:	drivers/soc/qcom/qmi_tmd.c
> +
>  QUALCOMM QSEECOM DRIVER
>  M:	Maximilian Luz <luzmaximilian@gmail.com>
>  L:	linux-arm-msm@vger.kernel.org
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 2caadbbcf830..44c2b533b494 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -128,6 +128,16 @@ config QCOM_QMI_HELPERS
>  	tristate
>  	depends on NET
>  
> +config QCOM_QMI_TMD
> +	bool "Qualcomm remote subsystem TMD" if COMPILE_TEST
> +	depends on ARCH_QCOM
> +	select QCOM_QMI_HELPERS
> +	help
> +	  This enables Qualcomm Messaging Interface (QMI) based Thermal Mitigation
> +	  Device (TMD) support for Qualcomm remote subsystems. It manages
> +	  TMD messaging and handles QMI communication with remote processors
> +	  to exchange mitigation state and apply thermal mitigation requests.
> +
>  config QCOM_RAMP_CTRL
>  	tristate "Qualcomm Ramp Controller driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index b7f1d2a57367..4544e61c74e7 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
>  obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
>  obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
>  CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
> +obj-$(CONFIG_QCOM_QMI_TMD) += qmi_tmd.o
>  obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
>  qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
>  obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
> diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
> new file mode 100644
> index 000000000000..d82500415f8e
> --- /dev/null
> +++ b/drivers/soc/qcom/qmi_tmd.c
> @@ -0,0 +1,581 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025, Linaro Limited
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * QMI Thermal Mitigation Device (TMD).
> + * Provides cooling device support for remote subsystems
> + * running the TMD service via QMI.
> + */
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/net.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +#include <linux/soc/qcom/qmi.h>
> +#include <linux/soc/qcom/qmi_tmd.h>
> +#include <linux/thermal.h>
> +
> +#define QMI_TMD_SERVICE_VERS_V01 0x01
> +
> +#define QMI_TMD_SET_LEVEL_REQ 0x0021
> +#define QMI_TMD_GET_DEV_LIST_REQ 0x0020
> +
> +#define QMI_TMD_DEV_ID_LEN_MAX 32
> +#define QMI_TMD_DEV_LIST_MAX 32
> +#define QMI_TMD_RESP_TIMEOUT	msecs_to_jiffies(100)
> +#define TMD_GET_LEVEL_REQ_MAX_LEN 36
> +#define TMD_SET_LEVEL_REQ_MAX_LEN 40
> +
> +#define TMD_GET_DEV_LIST_REQ_MAX_LEN 0
> +#define TMD_GET_DEV_LIST_RESP_MAX_LEN 1099
> +
> +struct tmd_dev_id {
> +	char mitigation_dev_id[QMI_TMD_DEV_ID_LEN_MAX + 1];
> +};
> +
> +static const struct qmi_elem_info tmd_dev_id_ei[] = {
> +	{
> +		.data_type = QMI_STRING,
> +		.elem_len = QMI_TMD_DEV_ID_LEN_MAX + 1,
> +		.elem_size = sizeof(char),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0,
> +		.offset = offsetof(struct tmd_dev_id,
> +				   mitigation_dev_id),
> +	},
> +	{
> +		.data_type = QMI_EOTI,
> +		.array_type = NO_ARRAY,
> +		.tlv_type = QMI_COMMON_TLV_TYPE,
> +	},
> +};
> +
> +struct tmd_dev_list {
> +	struct tmd_dev_id mitigation_dev_id;
> +	u8 max_mitigation_level;
> +};
> +
> +static const struct qmi_elem_info tmd_dev_list_ei[] = {
> +	{
> +		.data_type = QMI_STRUCT,
> +		.elem_len = 1,
> +		.elem_size = sizeof(struct tmd_dev_id),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0,
> +		.offset = offsetof(struct tmd_dev_list,
> +				   mitigation_dev_id),
> +		.ei_array = tmd_dev_id_ei,
> +	},
> +	{
> +		.data_type = QMI_UNSIGNED_1_BYTE,
> +		.elem_len = 1,
> +		.elem_size = sizeof(uint8_t),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0,
> +		.offset = offsetof(struct tmd_dev_list,
> +				   max_mitigation_level),
> +	},
> +	{
> +		.data_type = QMI_EOTI,
> +		.array_type = NO_ARRAY,
> +		.tlv_type = QMI_COMMON_TLV_TYPE,
> +	},
> +};
> +
> +struct tmd_get_dev_list_req {
> +	char placeholder;
> +};
> +
> +static const struct qmi_elem_info tmd_get_dev_list_req_ei[] = {
> +	{
> +		.data_type = QMI_EOTI,
> +		.array_type = NO_ARRAY,
> +		.tlv_type = QMI_COMMON_TLV_TYPE,
> +	},
> +};
> +
> +struct tmd_get_dev_list_resp {
> +	struct qmi_response_type_v01 resp;
> +	u8 mitigation_device_list_valid;
> +	u32 mitigation_device_list_len;
> +	struct tmd_dev_list
> +		mitigation_device_list[QMI_TMD_DEV_LIST_MAX];
> +};
> +
> +static const struct qmi_elem_info tmd_get_dev_list_resp_ei[] = {
> +	{
> +		.data_type = QMI_STRUCT,
> +		.elem_len = 1,
> +		.elem_size = sizeof(struct qmi_response_type_v01),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x02,
> +		.offset = offsetof(struct tmd_get_dev_list_resp,
> +				   resp),
> +		.ei_array = qmi_response_type_v01_ei,
> +	},
> +	{
> +		.data_type = QMI_OPT_FLAG,
> +		.elem_len = 1,
> +		.elem_size = sizeof(uint8_t),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x10,
> +		.offset = offsetof(struct tmd_get_dev_list_resp,
> +				   mitigation_device_list_valid),
> +	},
> +	{
> +		.data_type = QMI_DATA_LEN,
> +		.elem_len = 1,
> +		.elem_size = sizeof(uint8_t),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x10,
> +		.offset = offsetof(struct tmd_get_dev_list_resp,
> +				   mitigation_device_list_len),
> +	},
> +	{
> +		.data_type = QMI_STRUCT,
> +		.elem_len = QMI_TMD_DEV_LIST_MAX,
> +		.elem_size = sizeof(struct tmd_dev_list),
> +		.array_type = VAR_LEN_ARRAY,
> +		.tlv_type = 0x10,
> +		.offset = offsetof(struct tmd_get_dev_list_resp,
> +				   mitigation_device_list),
> +		.ei_array = tmd_dev_list_ei,
> +	},
> +	{
> +		.data_type = QMI_EOTI,
> +		.array_type = NO_ARRAY,
> +		.tlv_type = QMI_COMMON_TLV_TYPE,
> +	},
> +};
> +
> +struct tmd_set_level_req {
> +	struct tmd_dev_id mitigation_dev_id;
> +	u8 mitigation_level;
> +};
> +
> +static const struct qmi_elem_info tmd_set_level_req_ei[] = {
> +	{
> +		.data_type = QMI_STRUCT,
> +		.elem_len = 1,
> +		.elem_size = sizeof(struct tmd_dev_id),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x01,
> +		.offset = offsetof(struct tmd_set_level_req,
> +				   mitigation_dev_id),
> +		.ei_array = tmd_dev_id_ei,
> +	},
> +	{
> +		.data_type = QMI_UNSIGNED_1_BYTE,
> +		.elem_len = 1,
> +		.elem_size = sizeof(uint8_t),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x02,
> +		.offset = offsetof(struct tmd_set_level_req,
> +				   mitigation_level),
> +	},
> +	{
> +		.data_type = QMI_EOTI,
> +		.array_type = NO_ARRAY,
> +		.tlv_type = QMI_COMMON_TLV_TYPE,
> +	},
> +};
> +
> +struct tmd_set_level_resp {
> +	struct qmi_response_type_v01 resp;
> +};
> +
> +static const struct qmi_elem_info tmd_set_level_resp_ei[] = {
> +	{
> +		.data_type = QMI_STRUCT,
> +		.elem_len = 1,
> +		.elem_size = sizeof(struct qmi_response_type_v01),
> +		.array_type = NO_ARRAY,
> +		.tlv_type = 0x02,
> +		.offset = offsetof(struct tmd_set_level_resp, resp),
> +		.ei_array = qmi_response_type_v01_ei,
> +	},
> +	{
> +		.data_type = QMI_EOTI,
> +		.array_type = NO_ARRAY,
> +		.tlv_type = QMI_COMMON_TLV_TYPE,
> +	},
> +};
> +
> +/**
> + * struct qmi_tmd - A TMD cooling device
> + * @name:	The name of this tmd shared by the remote subsystem
> + * @cdev:	Thermal cooling device handle
> + * @cur_state:	The current mitigation state
> + * @max_state:	The maximum state
> + * @qmi_tmd_cli:	Parent QMI TMD client
> + */
> +struct qmi_tmd {
> +	const char *name;
> +	struct thermal_cooling_device *cdev;
> +	unsigned int cur_state;
> +	unsigned int max_state;
> +	struct qmi_tmd_client *qmi_tmd_cli;
> +};
> +
> +/**
> + * struct qmi_tmd_client - QMI TMD client state
> + * @dev:		Device associated with this instance
> + * @handle:		QMI connection handle
> + * @mutex:		Serializes QMI request/response sequences (qmi_txn_init,
> + *			qmi_send_request) during DSP subsystem restart and
> + *			protects @connection_active flag
> + * @connection_active:	Whether or not we're connected to the QMI TMD service
> + * @svc_arrive_work:	Work item for initialising when the TMD service starts
> + * @num_tmds:		Number of tmds described in the device tree
> + * @tmds:		An array of tmd structures
> + */
> +struct qmi_tmd_client {
> +	struct device *dev;
> +	struct qmi_handle handle;
> +	/* protects QMI transactions and connection_active */
> +	struct mutex mutex;
> +	bool connection_active;
> +	struct work_struct svc_arrive_work;
> +	int num_tmds;
> +	struct qmi_tmd tmds[] __counted_by(num_tmds);
> +};
> +
> +/* Notify the remote subsystem of the requested cooling state */
> +static int qmi_tmd_send_state_request(struct qmi_tmd *tmd, int state)
> +{
> +	struct tmd_set_level_resp resp = { 0 };
> +	struct tmd_set_level_req req = { 0 };
> +	struct qmi_tmd_client *qmi_tmd_cli = tmd->qmi_tmd_cli;
> +	struct qmi_txn txn;
> +	int ret = 0;
> +
> +	guard(mutex)(&qmi_tmd_cli->mutex);
> +
> +	if (!qmi_tmd_cli->connection_active)
> +		return 0;
> +
> +	strscpy(req.mitigation_dev_id.mitigation_dev_id, tmd->name,
> +		QMI_TMD_DEV_ID_LEN_MAX + 1);
> +	req.mitigation_level = state;
> +
> +	ret = qmi_txn_init(&qmi_tmd_cli->handle, &txn,
> +			   tmd_set_level_resp_ei, &resp);
> +	if (ret < 0) {
> +		dev_err(qmi_tmd_cli->dev, "qmi set state %d txn init failed for %s ret %d\n",
> +			state, tmd->name, ret);
> +		return ret;
> +	}
> +
> +	ret = qmi_send_request(&qmi_tmd_cli->handle, NULL, &txn,
> +			       QMI_TMD_SET_LEVEL_REQ,
> +			       TMD_SET_LEVEL_REQ_MAX_LEN,
> +			       tmd_set_level_req_ei, &req);
> +	if (ret < 0) {
> +		dev_err(qmi_tmd_cli->dev, "qmi set state %d txn send failed for %s ret %d\n",
> +			state, tmd->name, ret);
> +		qmi_txn_cancel(&txn);
> +		return ret;
> +	}
> +
> +	ret = qmi_txn_wait(&txn, QMI_TMD_RESP_TIMEOUT);
> +	if (ret < 0) {
> +		dev_err(qmi_tmd_cli->dev, "qmi set state %d txn wait failed for %s ret %d\n",
> +			state, tmd->name, ret);
> +		return ret;
> +	}
> +
> +	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
> +		dev_err(qmi_tmd_cli->dev,
> +			"qmi set state %d failed for %s result %#x error %#x\n",
> +			state, tmd->name,
> +			resp.resp.result, resp.resp.error);
> +		return -EREMOTEIO;
> +	}
> +
> +	dev_dbg(qmi_tmd_cli->dev, "Requested state %d/%d for %s\n", state,
> +		tmd->max_state, tmd->name);
> +
> +	return 0;
> +}
> +
> +static int qmi_tmd_get_max_state(struct thermal_cooling_device *cdev,
> +				 unsigned long *state)
> +{
> +	struct qmi_tmd *tmd = cdev->devdata;
> +
> +	*state = tmd->max_state;
> +
> +	return 0;
> +}
> +
> +static int qmi_tmd_get_cur_state(struct thermal_cooling_device *cdev,
> +				 unsigned long *state)
> +{
> +	struct qmi_tmd *tmd = cdev->devdata;
> +
> +	/* cur_state is protected by thermal core's cdev->lock */
> +	*state = tmd->cur_state;
> +
> +	return 0;
> +}
> +
> +static int qmi_tmd_set_cur_state(struct thermal_cooling_device *cdev,
> +				 unsigned long state)
> +{
> +	struct qmi_tmd *tmd = cdev->devdata;
> +	int ret;
> +
> +	if (state > tmd->max_state)
> +		return -EINVAL;
> +
> +	/* cur_state is protected by thermal core's cdev->lock */
> +	if (tmd->cur_state == state)
> +		return 0;
> +
> +	ret = qmi_tmd_send_state_request(tmd, state);
> +	if (!ret)
> +		tmd->cur_state = state;
> +
> +	return ret;
> +}
> +
> +static const struct thermal_cooling_device_ops qmi_tmd_cooling_ops = {
> +	.get_max_state = qmi_tmd_get_max_state,
> +	.get_cur_state = qmi_tmd_get_cur_state,
> +	.set_cur_state = qmi_tmd_set_cur_state,
> +};
> +
> +static int qmi_tmd_register(struct qmi_tmd_client *qmi_tmd_cli,
> +			    const char *label, u8 max_state)
> +{
> +	struct device *dev = qmi_tmd_cli->dev;
> +	struct qmi_tmd *tmd;
> +	int index;
> +
> +	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
> +		tmd = &qmi_tmd_cli->tmds[index];
> +
> +		if (!strncasecmp(tmd->name, label,
> +				 QMI_TMD_DEV_ID_LEN_MAX + 1))
> +			goto found;
> +	}
> +
> +	dev_dbg(qmi_tmd_cli->dev,
> +		"TMD '%s' available in firmware but not specified in DT\n",
> +		label);
> +	return 0;
> +
> +found:
> +	tmd->max_state = max_state;
> +
> +	/*
> +	 * If the cooling device already exists then the QMI service went away and
> +	 * came back. So just make sure the current cooling device state is
> +	 * reflected on the remote side and then return.
> +	 */
> +	if (tmd->cdev)
> +		return qmi_tmd_send_state_request(tmd, tmd->cur_state);
> +
> +	tmd->cdev = thermal_of_cooling_device_register(dev->of_node, index,
> +						       label, tmd, &qmi_tmd_cooling_ops);
> +	if (IS_ERR(tmd->cdev))
> +		return PTR_ERR(tmd->cdev);
> +
> +	return 0;
> +}
> +
> +static void qmi_tmd_unregister(struct qmi_tmd_client *qmi_tmd_cli)
> +{
> +	struct qmi_tmd *tmd;
> +	int index;
> +
> +	for (index = 0; index < qmi_tmd_cli->num_tmds; index++) {
> +		tmd = &qmi_tmd_cli->tmds[index];
> +
> +		if (!tmd->cdev)
> +			continue;
> +
> +		thermal_cooling_device_unregister(tmd->cdev);
> +		tmd->cdev = NULL;
> +	}
> +}
> +
> +static void qmi_tmd_svc_arrive(struct work_struct *work)
> +{
> +	struct qmi_tmd_client *qmi_tmd_cli =
> +		container_of(work, struct qmi_tmd_client, svc_arrive_work);
> +
> +	struct tmd_get_dev_list_req req = { 0 };
> +	struct tmd_get_dev_list_resp *resp __free(kfree) = NULL;
> +	int ret, i;
> +	struct qmi_txn txn;
> +
> +	resp = kzalloc_obj(*resp, GFP_KERNEL);
> +	if (!resp) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	scoped_guard(mutex, &qmi_tmd_cli->mutex) {
> +		ret = qmi_txn_init(&qmi_tmd_cli->handle, &txn,
> +				   tmd_get_dev_list_resp_ei, resp);
> +		if (ret < 0)
> +			goto out;
> +
> +		ret = qmi_send_request(&qmi_tmd_cli->handle, NULL, &txn,
> +				       QMI_TMD_GET_DEV_LIST_REQ,
> +				TMD_GET_DEV_LIST_REQ_MAX_LEN,
> +				tmd_get_dev_list_req_ei, &req);
> +		if (ret < 0) {
> +			qmi_txn_cancel(&txn);
> +			goto out;
> +		}
> +
> +		ret = qmi_txn_wait(&txn, QMI_TMD_RESP_TIMEOUT);
> +		if (ret < 0)
> +			goto out;
> +
> +		if (resp->resp.result != QMI_RESULT_SUCCESS_V01) {
> +			ret = -EPROTO;
> +			goto out;
> +		}
> +
> +		qmi_tmd_cli->connection_active = true;
> +	}
> +
> +	for (i = 0; i < resp->mitigation_device_list_len; i++) {
> +		struct tmd_dev_list *device =
> +			&resp->mitigation_device_list[i];
> +
> +		ret = qmi_tmd_register(qmi_tmd_cli,
> +				       device->mitigation_dev_id.mitigation_dev_id,
> +				       device->max_mitigation_level);
> +		if (ret)
> +			break;
> +	}
> +
> +out:
> +	if (ret)
> +		dev_err(qmi_tmd_cli->dev, "Failed to initialize TMD service: %d\n", ret);
> +}
> +
> +static void qmi_tmd_del_server(struct qmi_handle *qmi, struct qmi_service *service)
> +{
> +	struct qmi_tmd_client *qmi_tmd_cli =
> +		container_of(qmi, struct qmi_tmd_client, handle);
> +
> +	scoped_guard(mutex, &qmi_tmd_cli->mutex) {
> +		qmi_tmd_cli->connection_active = false;
> +	}
> +}
> +
> +static int qmi_tmd_new_server(struct qmi_handle *qmi, struct qmi_service *service)
> +{
> +	struct sockaddr_qrtr sq = { AF_QIPCRTR, service->node, service->port };
> +	struct qmi_tmd_client *qmi_tmd_cli;
> +	int ret;
> +
> +	qmi_tmd_cli = container_of(qmi, struct qmi_tmd_client, handle);
> +
> +	scoped_guard(mutex, &qmi_tmd_cli->mutex) {
> +		ret = kernel_connect(qmi->sock, (struct sockaddr_unsized *)&sq,
> +				     sizeof(sq), 0);
> +	}
> +
> +	if (ret < 0) {
> +		dev_err(qmi_tmd_cli->dev, "QMI connect failed for node %u port %u: %d\n",
> +			service->node, service->port, ret);
> +		return ret;
> +	}
> +
> +	queue_work(system_highpri_wq, &qmi_tmd_cli->svc_arrive_work);
> +
> +	return 0;
> +}
> +
> +static const struct qmi_ops qmi_tmd_ops = {
> +	.new_server = qmi_tmd_new_server,
> +	.del_server = qmi_tmd_del_server,
> +};
> +
> +/**
> + * qmi_tmd_init() - Initialize QMI TMD instance
> + * @dev: Device pointer
> + * @instance_id: QMI service instance ID for the remote subsystem
> + * @tmd_names: Array of TMD names
> + * @num_tmds: Number of TMD names
> + *
> + * Return: Pointer to qmi_tmd_client on success, ERR_PTR on failure
> + */
> +struct qmi_tmd_client *qmi_tmd_init(struct device *dev,
> +				    unsigned int instance_id,
> +				    const char * const *tmd_names,
> +				    int num_tmds)
> +{
> +	struct qmi_tmd_client *qmi_tmd_cli;
> +	int ret, i;
> +
> +	if (!dev || !tmd_names || num_tmds <= 0)
> +		return ERR_PTR(-EINVAL);
> +
> +	qmi_tmd_cli = devm_kzalloc(dev, struct_size(qmi_tmd_cli, tmds, num_tmds), GFP_KERNEL);

Either this is dedicated to probe path or can be called from any context
(probe or not probe). If the first, above is correct, but then:
1. kerneldoc is incomplete or function should be renamed to have _probe suffix,
2. why aren't you using dev_err_probe()?

If the latter, then above code is not correct because you do not have
cleanup in qmi_tmd_exit() part, which leads to unspecific/unorganized
way of cleaning devm resources during cleanup calls. Plus actual cleanup
does not happen when consumer/user calls exit() but when remove() is
called, leading to possible huge memory usage (not leak technically but
same effect).

> +	if (!qmi_tmd_cli)
> +		return ERR_PTR(-ENOMEM);
> +
> +	qmi_tmd_cli->dev = dev;
> +	qmi_tmd_cli->num_tmds = num_tmds;
> +	mutex_init(&qmi_tmd_cli->mutex);
> +	INIT_WORK(&qmi_tmd_cli->svc_arrive_work, qmi_tmd_svc_arrive);
> +
> +	for (i = 0; i < num_tmds; i++) {
> +		qmi_tmd_cli->tmds[i].name = tmd_names[i];
> +		qmi_tmd_cli->tmds[i].qmi_tmd_cli = qmi_tmd_cli;
> +	}
> +
> +	ret = qmi_handle_init(&qmi_tmd_cli->handle,
> +			      TMD_GET_DEV_LIST_RESP_MAX_LEN,
> +			      &qmi_tmd_ops, NULL);
> +	if (ret < 0) {
> +		dev_err(dev, "QMI handle init failed: %d\n", ret);
> +		return ERR_PTR(ret);
> +	}
> +
> +	ret = qmi_add_lookup(&qmi_tmd_cli->handle, QMI_SERVICE_ID_TMD,
> +			     QMI_TMD_SERVICE_VERS_V01, instance_id);
> +	if (ret < 0) {
> +		dev_err(dev, "QMI add lookup failed: %d\n", ret);
> +		goto err_release_handle;
> +	}
> +
> +	return qmi_tmd_cli;
> +
> +err_release_handle:
> +	qmi_handle_release(&qmi_tmd_cli->handle);
> +
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(qmi_tmd_init);
> +
> +/**
> + * qmi_tmd_exit() - Deinitialize QMI TMD instance
> + * @qmi_tmd_cli: QMI TMD client to deinitialize
> + */
> +void qmi_tmd_exit(struct qmi_tmd_client *qmi_tmd_cli)
> +{
> +	if (!qmi_tmd_cli)
> +		return;
> +
> +	cancel_work_sync(&qmi_tmd_cli->svc_arrive_work);

And what if work is re-queued now?

> +	qmi_handle_release(&qmi_tmd_cli->handle);
> +	qmi_tmd_unregister(qmi_tmd_cli);
> +
> +	scoped_guard(mutex, &qmi_tmd_cli->mutex)
> +		qmi_tmd_cli->connection_active = false;
> +}
> +EXPORT_SYMBOL_GPL(qmi_tmd_exit);

Best regards,
Krzysztof


