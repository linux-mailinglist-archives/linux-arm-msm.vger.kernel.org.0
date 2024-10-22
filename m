Return-Path: <linux-arm-msm+bounces-35349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C5A9A9AC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 09:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A8E6B24032
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 07:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77D014901B;
	Tue, 22 Oct 2024 07:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QYZJiZ8U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40E412FB2E;
	Tue, 22 Oct 2024 07:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729581524; cv=none; b=l51FLMRtN3jVr9LsN+0SELtrRD2CPtKGh5SPhKdlgEAyX0wFOpoz7kgwZLZs2fFN1QC1XQ85lhC8/nbF+mw2fA9D5RCby16a34v6EcXLj/lhcVNoSOcsBY8NLIxR7GDc7EwsGf5lom418BVrhSt8aRBYmjsFdWLTA31BnTb60YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729581524; c=relaxed/simple;
	bh=/5ixtaMbalvDpJJwfD0BzexaBvsrWL+N26FdmAvrBUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kKdIR48Xgd6E5Wz886xMRldJqbP0xR6k4/lKLeGMeXcahLFgaPyHkZkcqrqWMI6mqgPSlodo/tzAQevY3wyVqCDoXsLQDVVf9xcp7rHQKR/CHqXmbV0Lf5u3tL93O1fc0UWTx+313WDiegeiHMF2+Lx5m/3VwqDsMQYMwY/Lksc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QYZJiZ8U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49M00OCU014935;
	Tue, 22 Oct 2024 07:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xqGOi+LaRxpqzDOGdLlElAJCeTtbp1S+F7o+lAODmps=; b=QYZJiZ8UrVzMrszZ
	2BHXsZGk52a9Na6dcRWVMLxYNb/j6x0Ff7z/1P4iPz0mQ5veUMYyuvNmcZ2rbTTZ
	USEQVi2m9w85Q2le4ESYazw2AZKXYqhuZiG3yoOx6JHZvHq1knpDmz/VnmTIp5RC
	lFfxn4XUnqG72Z57A8GvVTZodoE16lEvnf6AZ7V22NBBbSurMXkOfPZ/KeeD1alj
	GmVVGxqi/W5k6jj09RcvcTo3H2rmgxcM0IfMu3QGdnpcLBgg7duNbfCFyjfAYftc
	U1Yny/CNh4DUNQq0yjwoEIAi1z9nT3tawUnYwJYLlcvVXxHSc69ywP+XcoZGMEZw
	bshJxA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dkbt3mj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 07:18:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M7IVr5001778
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 07:18:31 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 00:18:27 -0700
Message-ID: <afab811c-4de5-8a63-554d-b24704e1bdcb@quicinc.com>
Date: Tue, 22 Oct 2024 12:48:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V4 3/5] firmware: arm_scmi: vendors: Add QCOM SCMI Generic
 Extensions
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_rgottimu@quicinc.com>,
        <quic_kshivnan@quicinc.com>, <conor+dt@kernel.org>,
        <arm-scmi@vger.kernel.org>, Amir Vajid <avajid@quicinc.com>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-4-quic_sibis@quicinc.com>
 <3vj55wm7j6fz32q2pynzqikl4yysno5zdlpt6zz6xylcv237ak@bwejn7zn5o3o>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <3vj55wm7j6fz32q2pynzqikl4yysno5zdlpt6zz6xylcv237ak@bwejn7zn5o3o>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OF6RgkDKHYKAw1oStKWf2nMtZN6c4L0O
X-Proofpoint-GUID: OF6RgkDKHYKAw1oStKWf2nMtZN6c4L0O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410220046



On 10/7/24 23:43, Dmitry Baryshkov wrote:
> On Mon, Oct 07, 2024 at 11:40:21AM GMT, Sibi Sankar wrote:
>> The QCOM SCMI Generic Extensions Protocol provides a generic way of
>> exposing a number of Qualcomm SoC specific features (like memory bus
>> scaling) through a mixture of pre-determined algorithm strings and
>> param_id pairs hosted on the SCMI controller.
>>
>> Co-developed-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> Co-developed-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
>> Signed-off-by: Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>
>> Co-developed-by: Amir Vajid <avajid@quicinc.com>
>> Signed-off-by: Amir Vajid <avajid@quicinc.com>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks again for spending time to review the series!

>> ---
>>
>> v3:
>> * Pick up Rb tag and fixup/re-order elements of the vendor ops [Christian]
>> * Follow naming convention and folder structure used by IMX
>> * Add missing enum in the vendor protocol and fix documentation [Konrad]
>>
>>   drivers/firmware/arm_scmi/Kconfig             |   1 +
>>   drivers/firmware/arm_scmi/Makefile            |   1 +
>>   .../firmware/arm_scmi/vendors/qcom/Kconfig    |  15 ++
>>   .../firmware/arm_scmi/vendors/qcom/Makefile   |   2 +
>>   .../arm_scmi/vendors/qcom/qcom-generic-ext.c  | 184 ++++++++++++++++++
>>   include/linux/scmi_qcom_protocol.h            |  39 ++++
>>   6 files changed, 242 insertions(+)
>>   create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/Kconfig
>>   create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/Makefile
>>   create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c
>>   create mode 100644 include/linux/scmi_qcom_protocol.h
>>
>> diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
>> index dabd874641d0..73128442d97b 100644
>> --- a/drivers/firmware/arm_scmi/Kconfig
>> +++ b/drivers/firmware/arm_scmi/Kconfig
>> @@ -71,6 +71,7 @@ config ARM_SCMI_DEBUG_COUNTERS
>>   
>>   source "drivers/firmware/arm_scmi/transports/Kconfig"
>>   source "drivers/firmware/arm_scmi/vendors/imx/Kconfig"
>> +source "drivers/firmware/arm_scmi/vendors/qcom/Kconfig"
>>   
>>   endif #ARM_SCMI_PROTOCOL
>>   
>> diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm_scmi/Makefile
>> index 9ac81adff567..58cf4d656cbb 100644
>> --- a/drivers/firmware/arm_scmi/Makefile
>> +++ b/drivers/firmware/arm_scmi/Makefile
>> @@ -12,6 +12,7 @@ scmi-module-objs := $(scmi-driver-y) $(scmi-protocols-y) $(scmi-transport-y)
>>   
>>   obj-$(CONFIG_ARM_SCMI_PROTOCOL) += transports/
>>   obj-$(CONFIG_ARM_SCMI_PROTOCOL) += vendors/imx/
>> +obj-$(CONFIG_ARM_SCMI_PROTOCOL) += vendors/qcom/
>>   
>>   obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-core.o
>>   obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-module.o
>> diff --git a/drivers/firmware/arm_scmi/vendors/qcom/Kconfig b/drivers/firmware/arm_scmi/vendors/qcom/Kconfig
>> new file mode 100644
>> index 000000000000..5dd9e8a6b75f
>> --- /dev/null
>> +++ b/drivers/firmware/arm_scmi/vendors/qcom/Kconfig
>> @@ -0,0 +1,15 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +menu "ARM SCMI QCOM Vendor Protocols"
>> +
>> +config QCOM_SCMI_GENERIC_EXT
>> +	tristate "Qualcomm Technologies, Inc. Qcom SCMI vendor Protocol"
>> +	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
>> +	help
>> +	  The QCOM SCMI vendor protocol provides a generic way of exposing
>> +	  a number of Qualcomm SoC specific features (like memory bus scaling)
>> +	  through a mixture of pre-determined algorithm strings and param_id
>> +	  pairs hosted on the SCMI controller.
>> +
>> +	  This driver defines/documents the message ID's used for this
>> +	  communication and also exposes the operations used by the clients.
>> +endmenu
>> diff --git a/drivers/firmware/arm_scmi/vendors/qcom/Makefile b/drivers/firmware/arm_scmi/vendors/qcom/Makefile
>> new file mode 100644
>> index 000000000000..6b98fabbebb8
>> --- /dev/null
>> +++ b/drivers/firmware/arm_scmi/vendors/qcom/Makefile
>> @@ -0,0 +1,2 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +obj-$(CONFIG_QCOM_SCMI_GENERIC_EXT) += qcom-generic-ext.o
>> diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c b/drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c
>> new file mode 100644
>> index 000000000000..f7cd949161df
>> --- /dev/null
>> +++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom-generic-ext.c
>> @@ -0,0 +1,184 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/scmi_qcom_protocol.h>
>> +
>> +#include "../../common.h"
>> +
>> +/**
>> + * enum qcom_generic_ext_protocol_cmd - vendor specific commands supported by SCMI Qualcomm
>> + *                                      generic vendor protocol.
>> + *
>> + * This protocol is intended as a generic way of exposing a number of Qualcomm SoC
>> + * specific features through a mixture of pre-determined algorithm string and param_id
>> + * pairs hosted on the SCMI controller.
>> + *
>> + * The QCOM SCMI Vendor Protocol has the protocol id as 0x80 and vendor id set to
>> + * Qualcomm and the implementation version set to 0x20000. The PROTOCOL_VERSION command
>> + * returns version 1.0.
>> + *
>> + * @QCOM_SCMI_SET_PARAM: message_id: 0x10 is used to set the parameter of a specific algo_str
>> + *                       hosted on QCOM SCMI Vendor Protocol. The tx len depends on the
>> + *                       algo_str used.
>> + * @QCOM_SCMI_GET_PARAM: message_id: 0x11 is used to get parameter information of a specific
>> + *                       algo_str hosted on QCOM SCMI Vendor Protocol. The tx and rx len
>> + *                       depends on the algo_str used.
>> + * @QCOM_SCMI_START_ACTIVITY: message_id: 0x12 is used to start the activity performed by
>> + *                            the algo_str.
>> + * @QCOM_SCMI_STOP_ACTIVITY: message_id: 0x13 is used to stop a pre-existing activity
>> + *                           performed by the algo_str.
> 
> Drop message_id's from the definitions. They duplicate enum values.

ack

> 
>> + */
>> +enum qcom_generic_ext_protocol_cmd {
>> +	QCOM_SCMI_SET_PARAM = 0x10,
>> +	QCOM_SCMI_GET_PARAM = 0x11,
>> +	QCOM_SCMI_START_ACTIVITY = 0x12,
>> +	QCOM_SCMI_STOP_ACTIVITY = 0x13,
>> +};
>> +
>> +/**
>> + * struct qcom_scmi_msg - represents the various parameters to be populated
>> + *                        for using the QCOM SCMI Vendor Protocol
>> + *
>> + * @ext_id: reserved, must be zero
>> + * @algo_low: lower 32 bits of the algo_str
>> + * @algo_high: upper 32 bits of the algo_str
>> + * @param_id: serves as token message id to the specific algo_str
>> + * @buf: serves as the payload to the specified param_id and algo_str pair
>> + */
>> +struct qcom_scmi_msg {
>> +	__le32 ext_id;
>> +	__le32 algo_low;
>> +	__le32 algo_high;
>> +	__le32 param_id;
>> +	__le32 buf[];
>> +};
>> +
>> +static int qcom_scmi_set_param(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
>> +			       u64 algo_str, u32 param_id)
>> +{
>> +	struct scmi_xfer *t;
>> +	struct qcom_scmi_msg *msg;
>> +	int ret;
>> +
>> +	ret = ph->xops->xfer_get_init(ph, QCOM_SCMI_SET_PARAM, buf_len + sizeof(*msg), 0, &t);
>> +	if (ret)
>> +		return ret;
>> +
>> +	msg = t->tx.buf;
>> +	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
>> +	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
>> +	msg->param_id = cpu_to_le32(param_id);
>> +
>> +	memcpy(msg->buf, buf, t->tx.len - sizeof(*msg));
>> +
>> +	ret = ph->xops->do_xfer(ph, t);
>> +	ph->xops->xfer_put(ph, t);
>> +
>> +	return ret;
>> +}
>> +
>> +static int qcom_scmi_get_param(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
>> +			       u64 algo_str, u32 param_id, size_t rx_size)
>> +{
>> +	struct scmi_xfer *t;
>> +	struct qcom_scmi_msg *msg;
>> +	int ret;
>> +
>> +	ret = ph->xops->xfer_get_init(ph, QCOM_SCMI_GET_PARAM, buf_len + sizeof(*msg), rx_size, &t);
>> +	if (ret)
>> +		return ret;
>> +
>> +	msg = t->tx.buf;
>> +	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
>> +	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
>> +	msg->param_id = cpu_to_le32(param_id);
>> +	memcpy(msg->buf, buf, t->tx.len - sizeof(*msg));
> 
> Isn't it buf_len?

> 
>> +
>> +	ret = ph->xops->do_xfer(ph, t);
>> +	memcpy(buf, t->rx.buf, t->rx.len);
>> +	ph->xops->xfer_put(ph, t);
>> +
>> +	return ret;
>> +}
>> +
>> +static int qcom_scmi_start_activity(const struct scmi_protocol_handle *ph, void *buf,
>> +				    size_t buf_len, u64 algo_str, u32 param_id)
>> +{
>> +	struct scmi_xfer *t;
>> +	struct qcom_scmi_msg *msg;
>> +	int ret;
>> +
>> +	ret = ph->xops->xfer_get_init(ph, QCOM_SCMI_START_ACTIVITY, buf_len + sizeof(*msg), 0, &t);
>> +	if (ret)
>> +		return ret;
>> +
>> +	msg = t->tx.buf;
>> +	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
>> +	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
>> +	msg->param_id = cpu_to_le32(param_id);
>> +
>> +	memcpy(msg->buf, buf, t->tx.len - sizeof(*msg));
> 
> Isn't it buf_len?
> 
>> +
>> +	ret = ph->xops->do_xfer(ph, t);
>> +	ph->xops->xfer_put(ph, t);
>> +
>> +	return ret;
>> +}
>> +
>> +static int qcom_scmi_stop_activity(const struct scmi_protocol_handle *ph, void *buf,
>> +				   size_t buf_len, u64 algo_str, u32 param_id)
>> +{
>> +	struct scmi_xfer *t;
>> +	struct qcom_scmi_msg *msg;
>> +	int ret;
>> +
>> +	ret = ph->xops->xfer_get_init(ph, QCOM_SCMI_STOP_ACTIVITY, buf_len + sizeof(*msg), 0, &t);
>> +	if (ret)
>> +		return ret;
>> +
>> +	msg = t->tx.buf;
>> +	msg->algo_low = cpu_to_le32(lower_32_bits(algo_str));
>> +	msg->algo_high = cpu_to_le32(upper_32_bits(algo_str));
>> +	msg->param_id = cpu_to_le32(param_id);
>> +
>> +	memcpy(msg->buf, buf, t->tx.len - sizeof(*msg));
> 
> Isn't it buf_len?

ack

> 
>> +
>> +	ret = ph->xops->do_xfer(ph, t);
>> +	ph->xops->xfer_put(ph, t);
> 
> Could you please extract a common helper that handles xfer for you?
> Seeing the same code 4 times is 3 times too much in my opinion.

Yup, you have been asking for this multiple times already.
Will get it addressed in the next re-spin.

> 
>> +
>> +	return ret;
>> +}
>> +
>> +static struct qcom_generic_ext_ops qcom_proto_ops = {
>> +	.set_param = qcom_scmi_set_param,
>> +	.get_param = qcom_scmi_get_param,
>> +	.start_activity = qcom_scmi_start_activity,
>> +	.stop_activity = qcom_scmi_stop_activity,
>> +};
>> +
>> +static int qcom_generic_ext_protocol_init(const struct scmi_protocol_handle *ph)
>> +{
>> +	u32 version;
>> +
>> +	ph->xops->version_get(ph, &version);
>> +
>> +	dev_info(ph->dev, "QCOM Generic Vendor Version %d.%d\n",
>> +		 PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
> 
> dev_dbg, please.

Few protocols had them marked as info. Sure, I'll convert it to dbg
instead.

> 
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct scmi_protocol qcom_generic_ext = {
>> +	.id = SCMI_PROTOCOL_QCOM_GENERIC,
>> +	.owner = THIS_MODULE,
>> +	.instance_init = &qcom_generic_ext_protocol_init,
>> +	.ops = &qcom_proto_ops,
>> +	.vendor_id = "Qualcomm",
>> +	.impl_ver = 0x20000,
>> +};
>> +module_scmi_protocol(qcom_generic_ext);
>> +
>> +MODULE_DESCRIPTION("QCOM SCMI Generic Vendor protocol");
>> +MODULE_LICENSE("GPL");
>> diff --git a/include/linux/scmi_qcom_protocol.h b/include/linux/scmi_qcom_protocol.h
>> new file mode 100644
>> index 000000000000..8f82c42e566d
>> --- /dev/null
>> +++ b/include/linux/scmi_qcom_protocol.h
>> @@ -0,0 +1,39 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * SCMI Message Protocol driver QCOM extension header
>> + *
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef _LINUX_SCMI_QCOM_PROTOCOL_H
>> +#define _LINUX_SCMI_QCOM_PROTOCOL_H
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/device.h>
> 
> It doesn't look like you need those two headers.

Thanks for catching this.

-Sibi

> 
>> +#include <linux/types.h>
>> +
>> +#define SCMI_PROTOCOL_QCOM_GENERIC    0x80
>> +
>> +struct scmi_protocol_handle;
>> +
>> +/**
>> + * struct qcom_generic_ext_ops - represents the various operations provided
>> + *				 by QCOM Generic Vendor Protocol
>> + *
>> + * @set_param: set parameter specified by param_id and algo_str pair.
>> + * @get_param: retrieve parameter specified by param_id and algo_str pair.
>> + * @start_activity: initiate a specific activity defined by algo_str.
>> + * @stop_activity: halt previously initiated activity defined by algo_str.
>> + */
>> +struct qcom_generic_ext_ops {
>> +	int (*set_param)(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
>> +			 u64 algo_str, u32 param_id);
>> +	int (*get_param)(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
>> +			 u64 algo_str, u32 param_id, size_t rx_size);
>> +	int (*start_activity)(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
>> +			      u64 algo_str, u32 param_id);
>> +	int (*stop_activity)(const struct scmi_protocol_handle *ph, void *buf, size_t buf_len,
>> +			     u64 algo_str, u32 param_id);
>> +};
>> +
>> +#endif /* _LINUX_SCMI_QCOM_PROTOCOL_H */
>> -- 
>> 2.34.1
>>
> 

