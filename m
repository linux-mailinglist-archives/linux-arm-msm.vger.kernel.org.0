Return-Path: <linux-arm-msm+bounces-50296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE9BA4F232
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 01:13:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 045F23AA295
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 00:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4984A06;
	Wed,  5 Mar 2025 00:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DbG0y/Pq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABFE2E3369;
	Wed,  5 Mar 2025 00:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741133592; cv=none; b=mgeo0spttS7KKWuYkcpnB6XnsS/aGtmeJj2R1f58gvaq0G2WhaPwhlisRpHR4GklT/FSV8taReHHuixOSN+LdaMRhXhHoPKXVxH6ppvqoBbWBq8hza+Sh+SsuLnKfQREDPO9rft3LdRRbAKh/Pc78P8uRxwXtnBqHh2OqJVvUkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741133592; c=relaxed/simple;
	bh=M5ZGCq9x4T9pnfcD7Q3LzrYNMFsx+N/hfhH0v6apSlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g8CrNYdXDxB93bTfHoPA94rYyizrbAqxL39GAVskY55wwMh6w30mmgHxWMEaej03xnolJVc4ENVyg9eXTmjU/iJoooO5NqNVipIon+nAW+pweQgR7P4rGJp5dnVEFtKrl1yRVDLtGxz5jv6NkCpTwFMNTJCn18aIw+ursUv41S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DbG0y/Pq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524N9qME021430;
	Wed, 5 Mar 2025 00:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mc+Ia7/W70AAtSo8aSWtIjuM9oCTuqjDBuDYePtxnNw=; b=DbG0y/PqUuzFcNVq
	6ONf+HxZBYsMHMTqGZaIyA3IKugzNA0JMCJat1LP+J9nJsGuXvdJUqSW4KKbAx/y
	BkG+lkzfmJ30UwPisPOizdDcFDoqbrwHEagpDGmQaUNid5s1GhMSErqTBchA7Ozx
	pGIaDc9vAC4pAqPwbIbe+GiTuM8CHKDbhzjDq6HKE3oVWe3YAp8l/cyD1xGBKb3t
	KsHQ1XfdfHVAvw+7rYvzESEG8c3/yTd4/GoHkgZk4QfxZV45h5uCTHkiMEsy+tYF
	+nyfTfD2VMtOu+VOt0DLo2jyiXq+tM4NQ741EyIxLA1wdVPq2TEXD3Gq7utRN9Mn
	6ZZiZQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t3k1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 00:12:53 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5250Cr0i019452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Mar 2025 00:12:53 GMT
Received: from [10.4.85.45] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Mar 2025
 16:12:49 -0800
Message-ID: <be5deb64-1140-43f2-a1d5-a99226cac6a3@quicinc.com>
Date: Wed, 5 Mar 2025 11:12:47 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] tee: add Qualcomm TEE driver
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Sumit Garg <sumit.garg@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
References: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com>
 <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-6-297eacd0d34f@quicinc.com>
 <20250304144231.GA1074395@rayden>
Content-Language: en-US
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
In-Reply-To: <20250304144231.GA1074395@rayden>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KS2UFhgeykuBTKJxbxAHvgPUTQAAjfnQ
X-Authority-Analysis: v=2.4 cv=P5XAhjAu c=1 sm=1 tr=0 ts=67c79706 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=kZCQ0wgEANzMnI0KwtAA:9 a=stYLA5vkjNutqgIF:21
 a=QEXdDO2ut3YA:10 a=RVmHIydaz68A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KS2UFhgeykuBTKJxbxAHvgPUTQAAjfnQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_09,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050000

On 3/5/2025 1:42 AM, Jens Wiklander wrote:
> On Sun, Feb 02, 2025 at 06:43:34PM -0800, Amirreza Zarrabi wrote:
>> Introduce qcomtee_object, which represents an object in both QTEE and
>> the kernel. QTEE clients can invoke an instance of qcomtee_object to
>> access QTEE services. If this invocation produces a new object in QTEE,
>> an instance of qcomtee_object will be returned.
>>
>> Similarly, QTEE can request services from the kernel by issuing a callback
>> request, which invokes an instance of qcomtee_object in the kernel.
>> Any subsystem that exposes a service to QTEE should allocate and initialize
>> an instance of qcomtee_object with a dispatcher callback that is called
>> when the object is invoked.
>>
>> Implement initial support for exporting qcomtee_object to userspace
>> and QTEE, enabling the invocation of objects hosted in QTEE and userspace
>> through the TEE subsystem.
>>
>> Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
>> ---
>>  drivers/tee/Kconfig                    |   1 +
>>  drivers/tee/Makefile                   |   1 +
>>  drivers/tee/qcomtee/Kconfig            |  10 +
>>  drivers/tee/qcomtee/Makefile           |   9 +
>>  drivers/tee/qcomtee/async.c            | 160 +++++++
>>  drivers/tee/qcomtee/call.c             | 741 ++++++++++++++++++++++++++++++
>>  drivers/tee/qcomtee/core.c             | 803 +++++++++++++++++++++++++++++++++
>>  drivers/tee/qcomtee/qcom_scm.c         |  36 ++
>>  drivers/tee/qcomtee/qcomtee_msg.h      | 234 ++++++++++
>>  drivers/tee/qcomtee/qcomtee_private.h  | 223 +++++++++
>>  drivers/tee/qcomtee/release.c          |  59 +++
>>  drivers/tee/qcomtee/shm.c              | 102 +++++
>>  drivers/tee/qcomtee/user_obj.c         | 712 +++++++++++++++++++++++++++++
>>  include/linux/firmware/qcom/qcom_tee.h | 286 ++++++++++++
>>  include/uapi/linux/tee.h               |   1 +
>>  15 files changed, 3378 insertions(+)
>>
>> diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
>> index 61b507c18780..3a995d7f0d74 100644
>> --- a/drivers/tee/Kconfig
>> +++ b/drivers/tee/Kconfig
>> @@ -16,5 +16,6 @@ if TEE
>>  source "drivers/tee/optee/Kconfig"
>>  source "drivers/tee/amdtee/Kconfig"
>>  source "drivers/tee/tstee/Kconfig"
>> +source "drivers/tee/qcomtee/Kconfig"
>>  
>>  endif
>> diff --git a/drivers/tee/Makefile b/drivers/tee/Makefile
>> index 5488cba30bd2..74e987f8f7ea 100644
>> --- a/drivers/tee/Makefile
>> +++ b/drivers/tee/Makefile
>> @@ -6,3 +6,4 @@ tee-objs += tee_shm_pool.o
>>  obj-$(CONFIG_OPTEE) += optee/
>>  obj-$(CONFIG_AMDTEE) += amdtee/
>>  obj-$(CONFIG_ARM_TSTEE) += tstee/
>> +obj-$(CONFIG_QCOMTEE) += qcomtee/
>> diff --git a/drivers/tee/qcomtee/Kconfig b/drivers/tee/qcomtee/Kconfig
>> new file mode 100644
>> index 000000000000..d180a6d07d33
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/Kconfig
>> @@ -0,0 +1,10 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +# Qualcomm Trusted Execution Environment Configuration
>> +config QCOMTEE
>> +	tristate "Qualcomm TEE Support"
>> +	select QCOM_SCM
>> +	help
>> +	  This option enables the Qualcomm Trusted Execution Environment (QTEE)
>> +	  driver. It provides an API to access services offered by QTEE and any
>> +	  loaded Trusted Applications (TAs), as well as exporting kernel
>> +	  services to QTEE.
>> diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
>> new file mode 100644
>> index 000000000000..1b14b943e5f5
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/Makefile
>> @@ -0,0 +1,9 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +obj-$(CONFIG_QCOMTEE) += qcomtee.o
>> +qcomtee-objs += async.o
>> +qcomtee-objs += call.o
>> +qcomtee-objs += core.o
>> +qcomtee-objs += qcom_scm.o
>> +qcomtee-objs += release.o
>> +qcomtee-objs += shm.o
>> +qcomtee-objs += user_obj.o
>> diff --git a/drivers/tee/qcomtee/async.c b/drivers/tee/qcomtee/async.c
>> new file mode 100644
>> index 000000000000..4c880c3441a2
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/async.c
>> @@ -0,0 +1,160 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include "qcomtee_private.h"
>> +#include "qcomtee_msg.h"
>> +
>> +#define QCOMTEE_ASYNC_VERSION_1_0 0x00010000U /* Maj: 0x0001, Min: 0x0000. */
>> +#define QCOMTEE_ASYNC_VERSION_1_1 0x00010001U /* Maj: 0x0001, Min: 0x0001. */
>> +#define QCOMTEE_ASYNC_VERSION_1_2 0x00010002U /* Maj: 0x0001, Min: 0x0002. */
>> +#define QCOMTEE_ASYNC_VERSION QCOMTEE_ASYNC_VERSION_1_2 /* Current Version. */
>> +
>> +#define QCOMTEE_ASYNC_VERSION_MAJOR(n) upper_16_bits(n)
>> +#define QCOMTEE_ASYNC_VERSION_MINOR(n) lower_16_bits(n)
>> +
>> +/**
>> + * struct qcomtee_async_msg_hdr - Asynchronous message header format.
>> + * @version: current async protocol version of the remote endpoint.
>> + * @op: async operation.
>> + *
>> + * @version specifies the endpoint's (QTEE or driver) supported async protocol.
>> + * For example, if QTEE sets @version to %QCOMTEE_ASYNC_VERSION_1_1, QTEE
>> + * handles operations supported in %QCOMTEE_ASYNC_VERSION_1_1 or
>> + * %QCOMTEE_ASYNC_VERSION_1_0. @op determines the message format.
>> + */
>> +struct qcomtee_async_msg_hdr {
>> +	u32 version;
>> +	u32 op;
>> +};
>> +
>> +/* Size of an empty async message. */
>> +#define QCOMTEE_ASYNC_MSG_ZERO sizeof(struct qcomtee_async_msg_hdr)
>> +
>> +/**
>> + * struct qcomtee_async_release_msg - Release asynchronous message.
>> + * @hdr: message header as &struct qcomtee_async_msg_hdr.
>> + * @counts: number of objects in @object_ids.
>> + * @object_ids: array of object IDs that should be released.
>> + *
>> + * Available in Maj = 0x0001, Min >= 0x0000.
>> + */
>> +struct qcomtee_async_release_msg {
>> +	struct qcomtee_async_msg_hdr hdr;
>> +	u32 counts;
>> +	u32 object_ids[] __counted_by(counts);
>> +};
>> +
>> +/**
>> + * qcomtee_get_async_buffer() - Get the start of the asynchronous message.
>> + * @oic: context used for the current invocation.
>> + * @async_buffer: return buffer to extract from or fill in async messages.
>> + *
>> + * If @oic is used for direct object invocation, the whole outbound buffer
>> + * is available for the async message. If @oic is used for a callback request,
>> + * the tail of the outbound buffer (after the callback request message) is
>> + * available for the async message.
>> + *
>> + * The start of the async buffer is aligned, see qcomtee_msg_offset_align().
>> + */
>> +static void qcomtee_get_async_buffer(struct qcomtee_object_invoke_ctx *oic,
>> +				     struct qcomtee_buffer *async_buffer)
>> +{
>> +	struct qcomtee_msg_callback *msg;
>> +	unsigned int offset;
>> +	int i;
>> +
>> +	if (!(oic->flags & QCOMTEE_OIC_FLAG_BUSY)) {
>> +		/* The outbound buffer is empty. Using the whole buffer. */
>> +		offset = 0;
>> +	} else {
>> +		msg = (struct qcomtee_msg_callback *)oic->out_msg.addr;
>> +
>> +		/* Start offset in a message for buffer arguments. */
>> +		offset = qcomtee_msg_buffer_args(struct qcomtee_msg_callback,
>> +						 qcomtee_msg_args(msg));
>> +
>> +		/* Add size of IB arguments. */
>> +		qcomtee_msg_for_each_input_buffer(i, msg)
>> +			offset += qcomtee_msg_offset_align(msg->args[i].b.size);
>> +
>> +		/* Add size of OB arguments. */
>> +		qcomtee_msg_for_each_output_buffer(i, msg)
>> +			offset += qcomtee_msg_offset_align(msg->args[i].b.size);
>> +	}
>> +
>> +	async_buffer->addr = oic->out_msg.addr + offset;
>> +	async_buffer->size = oic->out_msg.size - offset;
>> +}
>> +
>> +/**
>> + * async_release() - Process QTEE async release requests.
>> + * @oic: context used for the current invocation.
>> + * @msg: async message for object release.
>> + * @size: size of the async buffer available.
>> + *
>> + * Return: Size of the outbound buffer used when processing @msg.
>> + */
>> +static size_t async_release(struct qcomtee_object_invoke_ctx *oic,
>> +			    struct qcomtee_async_msg_hdr *async_msg,
>> +			    size_t size)
>> +{
>> +	struct qcomtee_async_release_msg *msg;
>> +	struct qcomtee_object *object;
>> +	int i;
>> +
>> +	msg = (struct qcomtee_async_release_msg *)async_msg;
>> +
>> +	for (i = 0; i < msg->counts; i++) {
>> +		object = qcomtee_idx_erase(msg->object_ids[i]);
>> +		qcomtee_object_put(object);
>> +	}
>> +
>> +	return struct_size(msg, object_ids, msg->counts);
>> +}
>> +
>> +/**
>> + * qcomtee_fetch_async_reqs() - Fetch and process asynchronous messages.
>> + * @oic: context used for the current invocation.
>> + *
>> + * Calls handlers to process the requested operations in the async message.
>> + * Currently, only supports async release requests.
>> + */
>> +void qcomtee_fetch_async_reqs(struct qcomtee_object_invoke_ctx *oic)
>> +{
>> +	struct qcomtee_async_msg_hdr *async_msg;
>> +	struct qcomtee_buffer async_buffer;
>> +	size_t consumed, used = 0;
>> +
>> +	qcomtee_get_async_buffer(oic, &async_buffer);
>> +
>> +	while (async_buffer.size - used > QCOMTEE_ASYNC_MSG_ZERO) {
>> +		async_msg = (struct qcomtee_async_msg_hdr *)(async_buffer.addr +
>> +							     used);
>> +
>> +		if (QCOMTEE_ASYNC_VERSION_MAJOR(async_msg->version) !=
>> +		    QCOMTEE_ASYNC_VERSION_MAJOR(QCOMTEE_ASYNC_VERSION))
>> +			goto out;
>> +
>> +		switch (async_msg->op) {
>> +		case QCOMTEE_MSG_OBJECT_OP_RELEASE:
>> +			consumed = async_release(oic, async_msg,
>> +						 async_buffer.size - used);
>> +			break;
>> +		default:
>> +			goto out;
>> +		}
>> +
>> +		/* Supported operation but unable to parse the message. */
>> +		if (!consumed)
>> +			goto out;
>> +
>> +		/* Next async message. */
>> +		used += qcomtee_msg_offset_align(consumed);
>> +	}
>> +
>> +out:
>> +	/* Reset the async buffer so async requests do not loop to QTEE. */
>> +	memzero_explicit(async_buffer.addr, async_buffer.size);
>> +}
>> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
>> new file mode 100644
>> index 000000000000..ca2feefcc446
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/call.c
>> @@ -0,0 +1,741 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/tee.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "qcomtee_private.h"
>> +#include "qcomtee_msg.h" // For QCOMTEE_MSG_ERROR_UNAVAIL.
>> +
>> +/**
>> + * enum qcomtee_object_host - Object host where it is managed.
>> + * @QCOMTEE_OBJECT_HOST_USER: objects in userspace.
>> + * @QCOMTEE_OBJECT_HOST_TEE: objects in QTEE.
>> + *
>> + * We refer to objects hosted in userspace as 'Local Objects' and objects
>> + * hosted in QTEE as 'Remote Objects'.
>> + */
>> +enum qcomtee_object_host {
>> +	QCOMTEE_OBJECT_HOST_USER, /* Object that is managed in userspace. */
>> +	QCOMTEE_OBJECT_HOST_TEE, /* Object that is managed in QTEE. */
>> +};
>> +
>> +/* Read object host information. */
>> +static enum qcomtee_object_host qcomtee_object_host(struct tee_param *param)
>> +{
>> +	if (param->u.objref.flags & QCOMTEE_OBJREF_FLAG_USER)
>> +		return QCOMTEE_OBJECT_HOST_USER;
>> +	return QCOMTEE_OBJECT_HOST_TEE;
>> +}
>> +
>> +static int find_qtee_object(struct qcomtee_object **object, unsigned long id,
>> +			    struct qcomtee_context_data *ctxdata)
>> +{
>> +	int err = 0;
>> +
>> +	guard(rcu)();
> 
> I'm sorry, I can't review this since I don't know what it means.
> 

The instances of qcomtee_objects are rcu protected, primarily to prevent clients
from releasing and getting them concurrently. It's preferable to invoke an
object with qcomtee_object_invoke without using any lock. This simplifies the
get/put duo.

Here, guard(rcu)() holds the rcu readlock for the entire function, guaranteeing
that idr_find works correctly in relation to the object's lifespan. Refer to the
docs for idr_find:
  "This function can be called under rcu_read_lock(), provided that the leaf
   pointers' lifetimes are correctly managed."

>> +	/* Object release is RCU protected. */
>> +	*object = idr_find(&ctxdata->qtee_objects_idr, id);
>> +	if (!qcomtee_object_get(*object))
>> +		err = -EINVAL;
>> +
>> +	return err;
>> +}
>> +
>> +static void del_qtee_object(unsigned long id,
>> +			    struct qcomtee_context_data *ctxdata)
>> +{
>> +	struct qcomtee_object *object;
>> +
>> +	scoped_guard(spinlock, &ctxdata->qtee_lock)
>> +		object = idr_remove(&ctxdata->qtee_objects_idr, id);
>> +
>> +	qcomtee_object_put(object);
>> +}
>> +
>> +/**
>> + * qcomtee_context_add_qtee_object() - Add a QTEE object to the context.
>> + * @param: TEE parameter representing @object.
>> + * @object: QTEE object.
>> + * @ctx: context to add the object.
>> + *
>> + * It assumes @object is %QCOMTEE_OBJECT_TYPE_TEE and the caller has already
>> + * issued qcomtee_object_get() for @object.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_context_add_qtee_object(struct tee_param *param,
>> +				    struct qcomtee_object *object,
>> +				    struct tee_context *ctx)
>> +{
>> +	int ret;
>> +	struct qcomtee_context_data *ctxdata = ctx->data;
>> +
>> +	guard(spinlock)(&ctxdata->qtee_lock);
>> +	ret = idr_alloc(&ctxdata->qtee_objects_idr, object, 0, 0, GFP_KERNEL);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	param->u.objref.id = ret;
>> +	/* QTEE Object: !QCOMTEE_OBJREF_FLAG_USER. */
>> +	param->u.objref.flags = 0;
>> +
>> +	return 0;
>> +}
>> +
>> +/* Retrieve the QTEE object added with qcomtee_context_add_qtee_object(). */
>> +int qcomtee_context_find_qtee_object(struct qcomtee_object **object,
>> +				     struct tee_param *param,
>> +				     struct tee_context *ctx)
>> +{
>> +	struct qcomtee_context_data *ctxdata = ctx->data;
>> +
>> +	/* 'qtee_objects_idr' stores QTEE objects only. */
>> +	if (qcomtee_object_host(param) != QCOMTEE_OBJECT_HOST_TEE)
>> +		return -EINVAL;
>> +
>> +	return find_qtee_object(object, param->u.objref.id, ctxdata);
>> +}
>> +
>> +/**
>> + * qcomtee_context_del_qtee_object() - Delete a QTEE object from the context.
>> + * @param: TEE parameter representing @object.
>> + * @ctx: context for deleting the object.
>> + *
>> + * The @param has been initialized by qcomtee_context_add_qtee_object().
>> + */
>> +void qcomtee_context_del_qtee_object(struct tee_param *param,
>> +				     struct tee_context *ctx)
>> +{
>> +	struct qcomtee_context_data *ctxdata = ctx->data;
>> +
>> +	/* 'qtee_objects_idr' stores QTEE objects only. */
>> +	if (qcomtee_object_host(param) == QCOMTEE_OBJECT_HOST_TEE)
>> +		del_qtee_object(param->u.objref.id, ctxdata);
>> +}
>> +
>> +/**
>> + * qcomtee_objref_to_arg() - Convert OBJREF parameter to QTEE argument.
>> + * @arg: QTEE argument.
>> + * @param: TEE parameter.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * It assumes @param is an OBJREF.
>> + * It does not set @arg.type; the caller should initialize it to a correct
>> + * &enum qcomtee_arg_type value. It gets the object's refcount in @arg;
>> + * the caller should manage to put it afterward.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_objref_to_arg(struct qcomtee_arg *arg, struct tee_param *param,
>> +			  struct tee_context *ctx)
>> +{
>> +	struct qcomtee_object *object;
>> +	int err;
>> +
>> +	if (arg->type != QCOMTEE_ARG_TYPE_IO &&
>> +	    arg->type != QCOMTEE_ARG_TYPE_OO)
>> +		return -EINVAL;
>> +
>> +	/* It is a NULL object?! */
>> +	if (param->u.objref.id == TEE_OBJREF_NULL) {
>> +		arg->o = NULL_QCOMTEE_OBJECT;
>> +
>> +		return 0;
>> +	}
>> +
>> +	switch (qcomtee_object_host(param)) {
>> +	case QCOMTEE_OBJECT_HOST_USER:
>> +		err = qcomtee_user_param_to_object(&object, param, ctx);
>> +		if (err)
>> +			break;
>> +
>> +		/*
>> +		 * QTEE may release an object using an async message.
>> +		 * The async message may release this object even before the
>> +		 * invocation returns. Keep a copy for the driver to be safe.
>> +		 */
>> +		qcomtee_object_get(object);
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_HOST_TEE:
>> +		err = qcomtee_context_find_qtee_object(&object, param, ctx);
>> +
>> +		break;
>> +	}
>> +
>> +	arg->o = err ? NULL_QCOMTEE_OBJECT : object;
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * qcomtee_objref_from_arg() - Convert QTEE argument to OBJREF param.
>> + * @param: TEE parameter.
>> + * @arg: QTEE argument.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * It assumes @arg is of %QCOMTEE_ARG_TYPE_IO or %QCOMTEE_ARG_TYPE_OO.
>> + * It does not set @param.attr; the caller should initialize it to a
>> + * correct type.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
>> +			    struct tee_context *ctx)
>> +{
>> +	struct qcomtee_object *object;
>> +	int err;
>> +
>> +	/* param should be of OBJREF. */
>> +	if (param->attr != TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT &&
>> +	    param->attr != TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT &&
>> +	    param->attr != TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT)
>> +		return -EINVAL;
>> +
>> +	object = arg->o;
>> +
>> +	switch (typeof_qcomtee_object(object)) {
>> +	case QCOMTEE_OBJECT_TYPE_NULL:
>> +		param->u.objref.id = TEE_OBJREF_NULL;
>> +		err = 0;
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_CB:
>> +		err = qcomtee_user_param_from_object(param, object, ctx);
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_TEE:
>> +		err = qcomtee_context_add_qtee_object(param, object, ctx);
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_ROOT:
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * qcomtee_params_to_args() - Convert TEE parameters to QTEE arguments.
>> + * @u: QTEE arguments.
>> + * @params: TEE parameters.
>> + * @num_params: number of elements in the parameter array.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * It assumes @u has at least @num_params + 1 entries and has been initialized
>> + * with %QCOMTEE_ARG_TYPE_INV as &struct qcomtee_arg.type.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +static int qcomtee_params_to_args(struct qcomtee_arg *u,
>> +				  struct tee_param *params, int num_params,
>> +				  struct tee_context *ctx)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < num_params; i++) {
>> +		switch (params[i].attr) {
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +			u[i].flags = QCOMTEE_ARG_FLAGS_UADDR;
>> +			u[i].b.uaddr = params[i].u.ubuf.uaddr;
>> +			u[i].b.size = params[i].u.ubuf.size;
>> +
>> +			if (params[i].attr ==
>> +			    TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT)
>> +				u[i].type = QCOMTEE_ARG_TYPE_IB;
>> +			else /* TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT */
>> +				u[i].type = QCOMTEE_ARG_TYPE_OB;
>> +
>> +			break;
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
>> +			u[i].type = QCOMTEE_ARG_TYPE_IO;
>> +			if (qcomtee_objref_to_arg(&u[i], &params[i], ctx))
>> +				goto out_failed;
>> +
>> +			break;
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
>> +			u[i].type = QCOMTEE_ARG_TYPE_OO;
>> +			u[i].o = NULL_QCOMTEE_OBJECT;
>> +			break;
>> +		default:
>> +			goto out_failed;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +out_failed:
>> +	/* Undo qcomtee_objref_to_arg(). */
>> +	for (i--; i >= 0; i--) {
>> +		if (u[i].type != QCOMTEE_ARG_TYPE_IO)
>> +			continue;
>> +
>> +		qcomtee_user_object_set_notify(u[i].o, false);
>> +		if (typeof_qcomtee_object(u[i].o) == QCOMTEE_OBJECT_TYPE_CB)
>> +			qcomtee_object_put(u[i].o);
>> +
>> +		qcomtee_object_put(u[i].o);
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +/**
>> + * qcomtee_params_from_args() - Convert QTEE arguments to TEE parameters.
>> + * @params: TEE parameters.
>> + * @u: QTEE arguments.
>> + * @num_params: number of elements in the parameter array.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * @u should have already been initialized by qcomtee_params_to_args().
>> + * This also represents the end of a QTEE invocation that started with
>> + * qcomtee_params_to_args() by releasing %QCOMTEE_ARG_TYPE_IO objects.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +static int qcomtee_params_from_args(struct tee_param *params,
>> +				    struct qcomtee_arg *u, int num_params,
>> +				    struct tee_context *ctx)
>> +{
>> +	int i, np;
>> +
>> +	qcomtee_arg_for_each(np, u) {
>> +		if (u[np].type == QCOMTEE_ARG_TYPE_OB) {
>> +			/* TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT */
>> +			params[np].u.value.b = u[np].b.size;
>> +
>> +		} else if (u[np].type == QCOMTEE_ARG_TYPE_IO) {
>> +			/* IEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT */
>> +			qcomtee_object_put(u[np].o);
>> +
>> +		} else if (u[np].type == QCOMTEE_ARG_TYPE_OO) {
>> +			/* TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT */
>> +			if (qcomtee_objref_from_arg(&params[np], &u[np], ctx))
>> +				goto out_failed;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +out_failed:
>> +	/* Undo qcomtee_objref_from_arg(). */
>> +	for (i = 0; i < np; i++) {
>> +		if (params[i].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT)
>> +			qcomtee_context_del_qtee_object(&params[i], ctx);
>> +	}
>> +
>> +	/* Release any IO and OO objects not processed. */
>> +	for (; u[i].type; i++) {
>> +		if (u[i].type == QCOMTEE_ARG_TYPE_OO ||
>> +		    u[i].type == QCOMTEE_ARG_TYPE_IO)
>> +			qcomtee_object_put(u[i].o);
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +/* TEE Device Ops. */
>> +
>> +static int qcomtee_params_check(struct tee_param *params, int num_params)
>> +{
>> +	int io = 0, oo = 0, ib = 0, ob = 0;
>> +	int i;
>> +
>> +	/* QTEE accepts 64 arguments. */
>> +	if (num_params > QCOMTEE_ARGS_MAX)
>> +		return -EINVAL;
>> +
>> +	/* Supported parameter types. */
>> +	for (i = 0; i < num_params; i++) {
>> +		switch (params[i].attr) {
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
>> +			ib++;
>> +			break;
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>> +			ob++;
>> +			break;
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
>> +			io++;
>> +			break;
>> +		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
>> +			oo++;
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	/*  QTEE accepts 16 arguments of each supported types. */
>> +	if (io > QCOMTEE_ARGS_PER_TYPE || oo > QCOMTEE_ARGS_PER_TYPE ||
>> +	    ib > QCOMTEE_ARGS_PER_TYPE || ob > QCOMTEE_ARGS_PER_TYPE)
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>> +/* Check if an operation on ROOT_QCOMTEE_OBJECT from userspace is permitted. */
>> +static int qcomtee_root_object_check(u32 op, struct tee_param *params,
>> +				     int num_params)
>> +{
>> +	/* Some privileged operations recognized by QTEE. */
>> +	if (op == 4 || op == 8 || op == 9)
> 
> Magic number, please use defines.
> 

Sure, will do.

>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * OP 5 is to register with QTEE by passing a credential object as
>> +	 * input OBJREF. TEE_OBJREF_NULL as a credential object represents
>> +	 * a privileged client for QTEE and is used by the kernel only.
>> +	 */
>> +	if (op == 5 && num_params == 2) {
> 
> More magic numbers.
> 

Ack.

>> +		if (params[0].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT &&
>> +		    params[1].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT) {
>> +			if (params[0].u.objref.id == TEE_OBJREF_NULL)
>> +				return -EINVAL;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * qcomtee_object_invoke() - Invoke a QTEE object.
>> + * @ctx: TEE context.
>> + * @arg: ioctl arguments.
>> + * @params: parameters for the object.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +static int qcomtee_object_invoke(struct tee_context *ctx,
>> +				 struct tee_ioctl_object_invoke_arg *arg,
>> +				 struct tee_param *params)
>> +{
>> +	struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
>> +	struct qcomtee_context_data *ctxdata = ctx->data;
>> +	struct qcomtee_arg *u __free(kfree) = NULL;
>> +	struct qcomtee_object *object;
>> +	int i, ret, result;
>> +
>> +	if (qcomtee_params_check(params, arg->num_params))
>> +		return -EINVAL;
>> +
>> +	/* First, handle reserved operations: */
>> +	if (arg->op == QCOMTEE_OBJREF_OP_RELEASE) {
>> +		del_qtee_object(arg->object, ctxdata);
>> +
>> +		return 0;
>> +	} else if (arg->op > QCOMTEE_OBJREF_OP_MIN) {
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Otherwise, invoke a QTEE object: */
>> +
>> +	oic = kzalloc(sizeof(*oic), GFP_KERNEL);
>> +	if (!oic)
>> +		return -ENOMEM;
>> +
>> +	/* +1 for ending QCOMTEE_ARG_TYPE_INV. */
>> +	u = kcalloc(arg->num_params + 1, sizeof(*u), GFP_KERNEL);
>> +	if (!u)
>> +		return -ENOMEM;
>> +
>> +	/* Get an object to invoke. */
>> +	if (arg->object == TEE_OBJREF_NULL) {
>> +		/* Use ROOT if TEE_OBJREF_NULL is invoked. */
>> +		if (qcomtee_root_object_check(arg->op, params, arg->num_params))
>> +			return -EINVAL;
>> +
>> +		object = ROOT_QCOMTEE_OBJECT;
>> +	} else if (find_qtee_object(&object, arg->object, ctxdata)) {
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = qcomtee_params_to_args(u, params, arg->num_params, ctx);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = qcomtee_object_do_invoke(oic, object, arg->op, u, &result);
>> +	if (ret) {
>> +		qcomtee_arg_for_each_input_object(i, u) {
>> +			qcomtee_user_object_set_notify(u[i].o, false);
>> +			qcomtee_object_put(u[i].o);
>> +		}
>> +
>> +		goto out;
>> +	}
>> +
>> +	if (!result) {
>> +		/* Assume service is UNAVAIL if unable to process the result. */
>> +		if (qcomtee_params_from_args(params, u, arg->num_params, ctx))
>> +			result = QCOMTEE_MSG_ERROR_UNAVAIL;
>> +	} else {
>> +		/*
>> +		 * qcomtee_params_to_args() gets a copy of IO for the driver to
>> +		 * make sure they do not get released while in the middle of
>> +		 * invocation. On success (!result), qcomtee_params_from_args()
>> +		 * puts them.
>> +		 */
>> +		qcomtee_arg_for_each_input_object(i, u)
>> +			qcomtee_object_put(u[i].o);
>> +	}
>> +
>> +	arg->ret = result;
>> +out:
>> +	qcomtee_object_put(object);
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * qcomtee_supp_recv() - Wait for a request for the supplicant.
>> + * @ctx: TEE context.
>> + * @op: requested operation on the object.
>> + * @num_params: number of elements in the parameter array.
>> + * @params: parameters for @op.
>> + *
>> + * The first parameter is a meta %TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT.
>> + * On input, it provides a user buffer. This buffer is used for parameters of
>> + * type %TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT in qcomtee_cb_params_from_args().
>> + * On output, the object ID and request ID are stored in the meta parameter.
>> + *
>> + * @num_params is updated to the number of parameters that actually exist
>> + * in @params on return.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +static int qcomtee_supp_recv(struct tee_context *ctx, u32 *op, u32 *num_params,
>> +			     struct tee_param *params)
>> +{
>> +	struct qcomtee_user_object_request_data data;
>> +	void __user *uaddr;
>> +	size_t ubuf_size;
>> +	int i, ret;
>> +
>> +	if (!*num_params)
>> +		return -EINVAL;
>> +
>> +	/* We expect the first parameter to be an INOUT + meta parameter. */
>> +	if (params->attr !=
>> +	    (TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT | TEE_IOCTL_PARAM_ATTR_META))
>> +		return -EINVAL;
>> +
>> +	/* Other parameters are none. */
>> +	for (i = 1; i < *num_params; i++)
>> +		if (params[i].attr)
>> +			return -EINVAL;
>> +
>> +	if (!IS_ALIGNED(params->u.value.a, 8))
>> +		return -EINVAL;
>> +
>> +	/* User buffer and size from meta parameter. */
>> +	uaddr = u64_to_user_ptr(params->u.value.a);
>> +	ubuf_size = params->u.value.b;
>> +	/* Process TEE parameters. +/-1 to ignore the meta parameter. */
>> +	ret = qcomtee_user_object_select(ctx, params + 1, *num_params - 1,
>> +					 uaddr, ubuf_size, &data);
>> +	if (ret)
>> +		return ret;
>> +
>> +	params->u.value.a = data.object_id;
>> +	params->u.value.b = data.id;
>> +	params->u.value.c = 0;
>> +	*op = data.op;
>> +	*num_params = data.np + 1;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * qcomtee_supp_send() - Submit a response for a request.
>> + * @ctx: TEE context.
>> + * @errno: return value for the request.
>> + * @num_params: number of elements in the parameter array.
>> + * @params: returned parameters.
>> + *
>> + * The first parameter is a meta %TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT.
>> + * It specifies the request ID this response belongs to.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +static int qcomtee_supp_send(struct tee_context *ctx, u32 errno, u32 num_params,
>> +			     struct tee_param *params)
>> +{
>> +	if (!num_params)
>> +		return -EINVAL;
>> +
>> +	/* We expect the first parameter to be an OUTPUT + meta parameter. */
>> +	if (params->attr != (TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT |
>> +			     TEE_IOCTL_PARAM_ATTR_META))
>> +		return -EINVAL;
>> +
>> +	/* Process TEE parameters. +/-1 to ignore the meta parameter. */
>> +	return qcomtee_user_object_submit(ctx, params + 1, num_params - 1,
>> +					  params->u.value.a, errno);
>> +}
>> +
>> +static int qcomtee_open(struct tee_context *ctx)
>> +{
>> +	struct qcomtee_context_data *ctxdata __free(kfree) = NULL;
>> +
>> +	ctxdata = kzalloc(sizeof(*ctxdata), GFP_KERNEL);
>> +	if (!ctxdata)
>> +		return -ENOMEM;
>> +
>> +	idr_init(&ctxdata->qtee_objects_idr);
>> +	spin_lock_init(&ctxdata->qtee_lock);
>> +	idr_init(&ctxdata->reqs_idr);
>> +	INIT_LIST_HEAD(&ctxdata->reqs_list);
>> +	mutex_init(&ctxdata->reqs_lock);
>> +	init_completion(&ctxdata->req_c);
>> +
>> +	ctx->data = no_free_ptr(ctxdata);
>> +
>> +	return 0;
>> +}
>> +
>> +/* This is called when the user closes the context. */
> 
> That is, when the device is closed for clarity.
> 

I'll fix the comment.


>> +static void qcomtee_close_context(struct tee_context *ctx)
>> +{
>> +	struct qcomtee_context_data *ctxdata = ctx->data;
>> +	struct qcomtee_object *object;
>> +	int id;
>> +
>> +	/* Process QUEUED or PROCESSING requests. */
>> +	qcomtee_requests_destroy(ctxdata);
>> +	/* Release QTEE objects. */
>> +	idr_for_each_entry(&ctxdata->qtee_objects_idr, object, id)
>> +		qcomtee_object_put(object);
>> +}
>> +
>> +/* This is called when the final reference to the context goes away. */
>> +static void qcomtee_release(struct tee_context *ctx)
>> +{
>> +	struct qcomtee_context_data *ctxdata = ctx->data;
>> +
>> +	idr_destroy(&ctxdata->qtee_objects_idr);
>> +	idr_destroy(&ctxdata->reqs_idr);
>> +	kfree(ctxdata);
>> +}
>> +
>> +static void qcomtee_get_version(struct tee_device *teedev,
>> +				struct tee_ioctl_version_data *vers)
>> +{
>> +	struct tee_ioctl_version_data v = {
>> +		.impl_id = TEE_IMPL_ID_QTEE,
>> +		.gen_caps = TEE_GEN_CAP_OBJREF,
>> +	};
>> +
>> +	*vers = v;
>> +}
>> +
>> +static const struct tee_driver_ops qcomtee_ops = {
>> +	.get_version = qcomtee_get_version,
>> +	.open = qcomtee_open,
>> +	.close_context = qcomtee_close_context,
>> +	.release = qcomtee_release,
>> +	.object_invoke_func = qcomtee_object_invoke,
>> +	.supp_recv = qcomtee_supp_recv,
>> +	.supp_send = qcomtee_supp_send,
>> +};
>> +
>> +static const struct tee_desc qcomtee_desc = {
>> +	.name = "qcomtee",
>> +	.ops = &qcomtee_ops,
>> +	.owner = THIS_MODULE,
>> +};
>> +
>> +static int qcomtee_probe(struct platform_device *pdev)
>> +{
>> +	struct qcomtee *qcomtee __free(kfree) = NULL;
>> +	struct tee_device *teedev;
>> +	int err;
>> +
>> +	qcomtee = kzalloc(sizeof(*qcomtee), GFP_KERNEL);
>> +	if (!qcomtee)
>> +		return -ENOMEM;
>> +
>> +	err = qcomtee_release_init();
>> +	if (err)
>> +		return err;
>> +
>> +	err = qcomtee_msg_buffers_init();
>> +	if (err)
>> +		goto err_release_destroy;
>> +
>> +	teedev = tee_device_alloc(&qcomtee_desc, NULL, NULL, NULL);
>> +	if (IS_ERR(teedev)) {
>> +		err = PTR_ERR(teedev);
>> +
>> +		goto err_msg_buffers_destroy;
>> +	}
>> +
>> +	qcomtee->teedev = teedev;
>> +
>> +	err = tee_device_register(qcomtee->teedev);
>> +	if (err)
>> +		goto err_unreg_teedev;
>> +
>> +	platform_set_drvdata(pdev, no_free_ptr(qcomtee));
>> +	return 0;
>> +
>> +err_unreg_teedev:
>> +	tee_device_unregister(qcomtee->teedev);
>> +err_msg_buffers_destroy:
>> +	qcomtee_msg_buffers_destroy();
>> +err_release_destroy:
>> +	qcomtee_release_destroy();
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * qcomtee_remove() - Device Removal Routine.
>> + * @pdev: platform device information struct.
>> + *
>> + * It is called by the platform subsystem to alert the driver that it should
>> + * release the device.
>> + */
>> +static void qcomtee_remove(struct platform_device *pdev)
>> +{
>> +	struct qcomtee *qcomtee = platform_get_drvdata(pdev);
>> +
>> +	tee_device_unregister(qcomtee->teedev);
>> +
>> +	/*
>> +	 * QTEE does not provide an API to inform it about a callback object
>> +	 * going away. However, when releasing QTEE objects, any callback object
>> +	 * sent to QTEE previously would be released by QTEE as part of the
>> +	 * object release.
>> +	 *
>> +	 * Wait for RELEASE operations to be processed for QTEE objects.
>> +	 */
>> +	qcomtee_release_destroy();
>> +
>> +	qcomtee_msg_buffers_destroy();
>> +	kfree(qcomtee);
>> +}
>> +
>> +static const struct platform_device_id qcomtee_ids[] = { { "qcomtee", 0 }, {} };
>> +MODULE_DEVICE_TABLE(platform, qcomtee_ids);
>> +
>> +static struct platform_driver qcomtee_platform_driver = {
>> +	.probe = qcomtee_probe,
>> +	.remove = qcomtee_remove,
>> +	.driver = {
>> +		.name = "qcomtee",
>> +	},
>> +	.id_table = qcomtee_ids,
>> +};
>> +
>> +module_platform_driver(qcomtee_platform_driver);
>> +
>> +MODULE_AUTHOR("Qualcomm");
>> +MODULE_DESCRIPTION("QTEE driver");
>> +MODULE_VERSION("1.0");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
>> new file mode 100644
>> index 000000000000..9dbfcf62678e
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/core.c
>> @@ -0,0 +1,803 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/init.h>
>> +#include <linux/module.h>
>> +#include <linux/xarray.h>
>> +
>> +#include "qcomtee_msg.h"
>> +#include "qcomtee_private.h"
>> +
>> +/* This is the QTEE root object. */
>> +struct qcomtee_object qcomtee_object_root = {
>> +	.name = "root",
>> +	.object_type = QCOMTEE_OBJECT_TYPE_ROOT,
>> +	.info.qtee_id = QCOMTEE_MSG_OBJECT_ROOT,
>> +};
>> +EXPORT_SYMBOL_GPL(qcomtee_object_root);
>> +
>> +/* Next argument of type @type after index @i. */
>> +int qcomtee_next_arg_type(struct qcomtee_arg *u, int i,
>> +			  enum qcomtee_arg_type type)
>> +{
>> +	while (u[i].type != QCOMTEE_ARG_TYPE_INV && u[i].type != type)
>> +		i++;
>> +	return i;
>> +}
>> +
>> +/*
>> + * QTEE expects IDs with the QCOMTEE_MSG_OBJECT_NS_BIT set for objects
>> + * of the QCOMTEE_OBJECT_TYPE_CB type.
>> + */
>> +#define QCOMTEE_OBJECT_ID_START (QCOMTEE_MSG_OBJECT_NS_BIT + 1)
>> +#define QCOMTEE_OBJECT_ID_END (UINT_MAX)
>> +
>> +#define QCOMTEE_OBJECT_SET(p, type, ...) \
>> +	__QCOMTEE_OBJECT_SET(p, type, ##__VA_ARGS__, 0UL)
>> +#define __QCOMTEE_OBJECT_SET(p, type, optr, ...)           \
>> +	do {                                               \
>> +		(p)->object_type = (type);                 \
>> +		(p)->info.qtee_id = (unsigned long)(optr); \
>> +	} while (0)
>> +
>> +static struct qcomtee_object *qcomtee_object_alloc(void)
>> +{
>> +	struct qcomtee_object *object;
>> +
>> +	object = kzalloc(sizeof(*object), GFP_KERNEL);
>> +	if (object) {
>> +		QCOMTEE_OBJECT_SET(object, QCOMTEE_OBJECT_TYPE_NULL);
>> +		kref_init(&object->refcount);
>> +	}
>> +
>> +	return object;
>> +}
>> +
>> +void qcomtee_object_free(struct qcomtee_object *object)
>> +{
>> +	kfree(object->name);
>> +	kfree(object);
>> +}
>> +
>> +static void qcomtee_object_release(struct kref *refcount)
>> +{
>> +	struct qcomtee_object *object;
>> +	const char *name;
>> +
>> +	object = container_of(refcount, struct qcomtee_object, refcount);
>> +
>> +	synchronize_rcu();
> 
> I thought you would save RCU stuff for a later optimization.
> 

True. But there were two different scenarios:

1) Use of srcu to protect the request (instance of qcomtee_ureq), to make sure
   it remains valid for the supplicant thread as long as it accesses the request,
   even if the invoking thread that owns the request dies.
2) Use rcu to protect the object (instance of qcomtee_object).

We agreed on removing srcu (i.e., case (1)) and directly using the mutex to
synchronize the invoke thread and supplicant thread, as it was just too much work
without justification.

>> +
>> +	switch (typeof_qcomtee_object(object)) {
>> +	case QCOMTEE_OBJECT_TYPE_TEE:
>> +		qcomtee_release_tee_object(object);
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_CB:
>> +		name = object->name;
>> +
>> +		if (object->ops->release)
>> +			object->ops->release(object);
>> +
>> +		kfree_const(name);
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_ROOT:
>> +	case QCOMTEE_OBJECT_TYPE_NULL:
>> +	default:
>> +		break;
>> +	}
>> +}
>> +
>> +/**
>> + * qcomtee_object_get() - Increase the object's reference count.
>> + * @object: object to increase the reference count.
>> + */
>> +int qcomtee_object_get(struct qcomtee_object *object)
>> +{
>> +	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
>> +		return kref_get_unless_zero(&object->refcount);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(qcomtee_object_get);
>> +
>> +/**
>> + * qcomtee_object_put() - Decrease the object's reference count.
>> + * @object: object to decrease the reference count.
>> + */
>> +void qcomtee_object_put(struct qcomtee_object *object)
>> +{
>> +	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
>> +		kref_put(&object->refcount, qcomtee_object_release);
>> +}
>> +EXPORT_SYMBOL_GPL(qcomtee_object_put);
>> +
>> +/*
>> + * ''Local Object Table''.
>> + * Objects from the kernel exported to QTEE are assigned an ID and stored
>> + * in xa_qcom_local_objects (also known as the kernel object table).
>> + * QTEE uses this ID to reference the objects using qcomtee_local_object_get().
>> + */
>> +static DEFINE_XARRAY_ALLOC(xa_qcom_local_objects);
>> +
>> +static int qcomtee_idx_alloc(u32 *idx, struct qcomtee_object *object)
>> +{
>> +	static u32 xa_last_id = QCOMTEE_OBJECT_ID_START;
>> +
>> +	/* Every ID allocated here has QCOMTEE_MSG_OBJECT_NS_BIT set. */
>> +	return xa_alloc_cyclic(&xa_qcom_local_objects, idx, object,
>> +			       XA_LIMIT(QCOMTEE_OBJECT_ID_START,
>> +					QCOMTEE_OBJECT_ID_END),
>> +			       &xa_last_id, GFP_KERNEL);
>> +}
>> +
>> +struct qcomtee_object *qcomtee_idx_erase(u32 idx)
>> +{
>> +	if (idx < QCOMTEE_OBJECT_ID_START || idx > QCOMTEE_OBJECT_ID_END)
>> +		return NULL_QCOMTEE_OBJECT;
>> +
>> +	return xa_erase(&xa_qcom_local_objects, idx);
>> +}
>> +
>> +/**
>> + * qcomtee_object_id_get() - Get an ID for an object to send to QTEE.
>> + * @object: object to assign an ID.
>> + * @object_id: object ID.
>> + *
>> + * This is called on the path to QTEE to construct the message; see
>> + * qcomtee_prepare_msg() and qcomtee_update_msg().
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +static int qcomtee_object_id_get(struct qcomtee_object *object,
>> +				 unsigned int *object_id)
>> +{
>> +	u32 idx;
>> +
>> +	switch (typeof_qcomtee_object(object)) {
>> +	case QCOMTEE_OBJECT_TYPE_CB:
>> +		if (qcomtee_idx_alloc(&idx, object) < 0)
>> +			return -ENOSPC;
>> +
>> +		*object_id = idx;
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_ROOT:
>> +	case QCOMTEE_OBJECT_TYPE_TEE:
>> +		*object_id = object->info.qtee_id;
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_NULL:
>> +		*object_id = QCOMTEE_MSG_OBJECT_NULL;
>> +
>> +		break;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/* Release object ID assigned in qcomtee_object_id_get. */
>> +static void qcomtee_object_id_put(unsigned int object_id)
>> +{
>> +	qcomtee_idx_erase(object_id);
>> +}
>> +
>> +/**
>> + * qcomtee_local_object_get() - Get the object referenced by the ID.
>> + * @object_id: object ID.
>> + *
>> + * It is called on the path from QTEE.
>> + * It is called on behalf of QTEE to obtain an instance of an object
>> + * for a given ID. It increases the object's reference count on success.
>> + *
>> + * Return: On error, returns %NULL_QCOMTEE_OBJECT.
>> + *         On success, returns the object.
>> + */
>> +static struct qcomtee_object *qcomtee_local_object_get(unsigned int object_id)
>> +{
>> +	struct qcomtee_object *object;
>> +
>> +	/*
>> +	 * This is not protected by an RCU read lock because we are
>> +	 * confident that QTEE does not issue a RELEASE request and
>> +	 * qcomtee_local_object_get() concurrently.
>> +	 */
>> +	object = xa_load(&xa_qcom_local_objects, object_id);
>> +
>> +	qcomtee_object_get(object);
>> +
>> +	return object;
>> +}
>> +
>> +/**
>> + * qcomtee_object_user_init() - Initialize an object for the user.
>> + * @object: object to initialize.
>> + * @ot: type of object as &enum qcomtee_object_type.
>> + * @ops: instance of callbacks.
>> + * @fmt: name assigned to the object.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_object_user_init(struct qcomtee_object *object,
>> +			     enum qcomtee_object_type ot,
>> +			     struct qcomtee_object_operations *ops,
>> +			     const char *fmt, ...)
>> +{
>> +	va_list ap;
>> +	int ret;
>> +
>> +	kref_init(&object->refcount);
>> +	QCOMTEE_OBJECT_SET(object, QCOMTEE_OBJECT_TYPE_NULL);
>> +
>> +	va_start(ap, fmt);
>> +	switch (ot) {
>> +	case QCOMTEE_OBJECT_TYPE_NULL:
>> +		ret = 0;
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_CB:
>> +		object->ops = ops;
>> +		if (!object->ops->dispatch)
>> +			return -EINVAL;
>> +
>> +		/* If failed, "no-name". */
>> +		object->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
>> +		QCOMTEE_OBJECT_SET(object, QCOMTEE_OBJECT_TYPE_CB);
>> +
>> +		ret = 0;
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_ROOT:
>> +	case QCOMTEE_OBJECT_TYPE_TEE:
>> +	default:
>> +		ret = -EINVAL;
>> +	}
>> +	va_end(ap);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(qcomtee_object_user_init);
>> +
>> +/**
>> + * qcomtee_object_type() - Returns the type of object represented by an ID.
>> + * @object_id: object ID for the object.
>> + *
>> + * This is similar to typeof_qcomtee_object(), but instead of receiving an
>> + * object as an argument, it receives an object ID. It is used internally
>> + * on the return path from QTEE.
>> + *
>> + * Return: Returns the type of object referenced by @object_id.
>> + */
>> +static enum qcomtee_object_type qcomtee_object_type(unsigned int object_id)
>> +{
>> +	if (object_id == QCOMTEE_MSG_OBJECT_NULL)
>> +		return QCOMTEE_OBJECT_TYPE_NULL;
>> +
>> +	if (object_id & QCOMTEE_MSG_OBJECT_NS_BIT)
>> +		return QCOMTEE_OBJECT_TYPE_CB;
>> +
>> +	return QCOMTEE_OBJECT_TYPE_TEE;
>> +}
>> +
>> +/**
>> + * qcomtee_object_qtee_init() - Initialize an object for QTEE.
>> + * @object: object returned.
>> + * @object_id: object ID received from QTEE.
>> + *
>> + * Return: On failure, returns < 0 and sets @object to %NULL_QCOMTEE_OBJECT.
>> + *         On success, returns 0
>> + */
>> +static int qcomtee_object_qtee_init(struct qcomtee_object **object,
>> +				    unsigned int object_id)
>> +{
>> +	struct qcomtee_object *qto;
>> +	int ret = 0;
>> +
>> +	switch (qcomtee_object_type(object_id)) {
>> +	case QCOMTEE_OBJECT_TYPE_NULL:
>> +		*object = NULL_QCOMTEE_OBJECT;
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_CB:
>> +		qto = qcomtee_local_object_get(object_id);
>> +		if (qto != NULL_QCOMTEE_OBJECT)
>> +			*object = qto;
>> +		else
>> +			ret = -EINVAL;
>> +
>> +		break;
>> +	case QCOMTEE_OBJECT_TYPE_TEE:
>> +		qto = qcomtee_object_alloc();
>> +		if (qto) {
>> +			/* If failed, "no-name". */
>> +			qto->name =
>> +				kasprintf(GFP_KERNEL, "qcomtee-%u", object_id);
>> +			QCOMTEE_OBJECT_SET(qto, QCOMTEE_OBJECT_TYPE_TEE,
>> +					   object_id);
>> +
>> +			*object = qto;
>> +		} else {
>> +			ret = -ENOMEM;
>> +		}
>> +
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	if (ret)
>> +		*object = NULL_QCOMTEE_OBJECT;
>> +
>> +	return ret;
>> +}
>> +
>> +/*
>> + * ''Marshaling API''
>> + * qcomtee_prepare_msg  - Prepare the inbound buffer for sending to QTEE
>> + * qcomtee_update_args  - Parse the QTEE response in the inbound buffer
>> + * qcomtee_prepare_args - Parse the QTEE request from the outbound buffer
>> + * qcomtee_update_msg   - Update the outbound buffer with the response for QTEE
>> + */
>> +
>> +static int qcomtee_prepare_msg(struct qcomtee_object_invoke_ctx *oic,
>> +			       struct qcomtee_object *object, u32 op,
>> +			       struct qcomtee_arg *u)
>> +{
>> +	struct qcomtee_msg_object_invoke *msg;
>> +	unsigned int object_id;
>> +	int i, ib, ob, io, oo;
>> +	size_t off;
>> +
>> +	/* Use the input message buffer in 'oic'. */
>> +	msg = (struct qcomtee_msg_object_invoke *)oic->in_msg.addr;
>> +
>> +	/* Start offset in a message for buffer arguments. */
>> +	off = qcomtee_msg_buffer_args(struct qcomtee_msg_object_invoke,
>> +				      qcomtee_args_len(u));
>> +
>> +	/* Get the ID of the object being invoked. */
>> +	if (qcomtee_object_id_get(object, &object_id))
>> +		return -ENOSPC;
>> +
>> +	ib = 0;
>> +	qcomtee_arg_for_each_input_buffer(i, u) {
>> +		void *ptr;
>> +
>> +		/* Overflow already checked in qcomtee_msg_buffers_alloc(). */
>> +		msg->args[ib].b.offset = off;
>> +		msg->args[ib].b.size = u[i].b.size;
>> +
>> +		ptr = qcomtee_msg_offset_to_ptr(msg, off);
>> +		/* Userspace client or kernel client!? */
>> +		if (!(u[i].flags & QCOMTEE_ARG_FLAGS_UADDR))
>> +			memcpy(ptr, u[i].b.addr, u[i].b.size);
>> +		else if (copy_from_user(ptr, u[i].b.uaddr, u[i].b.size))
>> +			return -EINVAL;
>> +
>> +		off += qcomtee_msg_offset_align(u[i].b.size);
>> +		ib++;
>> +	}
>> +
>> +	ob = ib;
>> +	qcomtee_arg_for_each_output_buffer(i, u) {
>> +		/* Overflow already checked in qcomtee_msg_buffers_alloc(). */
>> +		msg->args[ob].b.offset = off;
>> +		msg->args[ob].b.size = u[i].b.size;
>> +
>> +		off += qcomtee_msg_offset_align(u[i].b.size);
>> +		ob++;
>> +	}
>> +
>> +	io = ob;
>> +	qcomtee_arg_for_each_input_object(i, u) {
>> +		if (qcomtee_object_id_get(u[i].o, &msg->args[io].o)) {
>> +			/* Put whatever we got. */
>> +			qcomtee_object_id_put(object_id);
>> +			for (io--; io >= ob; io--)
>> +				qcomtee_object_id_put(msg->args[io].o);
>> +
>> +			return -ENOSPC;
>> +		}
>> +
>> +		io++;
>> +	}
>> +
>> +	oo = io;
>> +	qcomtee_arg_for_each_output_object(i, u)
>> +		oo++;
>> +
>> +	/* Set object, operation, and argument counts. */
>> +	qcomtee_msg_init(msg, object_id, op, ib, ob, io, oo);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * qcomtee_update_args() - Parse the QTEE response in the inbound buffer.
>> + * @u: array of arguments for the invocation.
>> + * @oic: context to use for the invocation.
>> + *
>> + * @u must be the same as the one used in qcomtee_prepare_msg() when
>> + * initializing the inbound buffer.
>> + *
>> + * On failure, it continues processing the QTEE message. The caller should
>> + * do the necessary cleanup, including calling qcomtee_object_put()
>> + * on the output objects.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +static int qcomtee_update_args(struct qcomtee_arg *u,
>> +			       struct qcomtee_object_invoke_ctx *oic)
>> +{
>> +	struct qcomtee_msg_object_invoke *msg;
>> +	int i, ib, ob, io, oo;
>> +	int ret = 0;
>> +
>> +	/* Use the input message buffer in 'oic'. */
>> +	msg = (struct qcomtee_msg_object_invoke *)oic->in_msg.addr;
>> +
>> +	ib = 0;
>> +	qcomtee_arg_for_each_input_buffer(i, u)
>> +		ib++;
>> +
>> +	ob = ib;
>> +	qcomtee_arg_for_each_output_buffer(i, u) {
>> +		void *ptr;
>> +
>> +		/* QTEE can override the size to a smaller value. */
>> +		u[i].b.size = msg->args[ob].b.size;
>> +
>> +		ptr = qcomtee_msg_offset_to_ptr(msg, msg->args[ob].b.offset);
>> +		/* Userspace client or kernel client!? */
>> +		if (!(u[i].flags & QCOMTEE_ARG_FLAGS_UADDR))
>> +			memcpy(u[i].b.addr, ptr, u[i].b.size);
>> +		else if (copy_to_user(u[i].b.uaddr, ptr, u[i].b.size))
>> +			ret = -EINVAL;
>> +
>> +		ob++;
>> +	}
>> +
>> +	io = ob;
>> +	qcomtee_arg_for_each_input_object(i, u)
>> +		io++;
>> +
>> +	oo = io;
>> +	qcomtee_arg_for_each_output_object(i, u) {
>> +		if (qcomtee_object_qtee_init(&u[i].o, msg->args[oo].o))
>> +			ret = -EINVAL;
>> +
>> +		oo++;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * qcomtee_prepare_args() - Parse the QTEE request from the outbound buffer.
>> + * @oic: context to use for the invocation.
>> + *
>> + * It initializes &qcomtee_object_invoke_ctx->u based on the QTEE request in
>> + * the outbound buffer. It sets %QCOMTEE_ARG_TYPE_INV at the end of the array.
>> + *
>> + * On failure, it continues processing the QTEE message. The caller should
>> + * do the necessary cleanup, including calling qcomtee_object_put()
>> + * on the input objects.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +static int qcomtee_prepare_args(struct qcomtee_object_invoke_ctx *oic)
>> +{
>> +	struct qcomtee_msg_callback *msg;
>> +	union qcomtee_msg_arg *arg;
>> +	int i, ret = 0;
>> +
>> +	/* Use the output message buffer in 'oic'. */
>> +	msg = (struct qcomtee_msg_callback *)oic->out_msg.addr;
>> +
>> +	qcomtee_msg_for_each_input_buffer(i, msg) {
>> +		arg = &msg->args[i];
>> +		oic->u[i].b.addr =
>> +			qcomtee_msg_offset_to_ptr(msg, arg->b.offset);
>> +		oic->u[i].b.size = arg->b.size;
>> +		oic->u[i].type = QCOMTEE_ARG_TYPE_IB;
>> +	}
>> +
>> +	qcomtee_msg_for_each_output_buffer(i, msg) {
>> +		arg = &msg->args[i];
>> +		oic->u[i].b.addr =
>> +			qcomtee_msg_offset_to_ptr(msg, arg->b.offset);
>> +		oic->u[i].b.size = arg->b.size;
>> +		oic->u[i].type = QCOMTEE_ARG_TYPE_OB;
>> +	}
>> +
>> +	qcomtee_msg_for_each_input_object(i, msg) {
>> +		if (qcomtee_object_qtee_init(&oic->u[i].o, msg->args[i].o))
>> +			ret = -EINVAL;
>> +
>> +		oic->u[i].type = QCOMTEE_ARG_TYPE_IO;
>> +	}
>> +
>> +	qcomtee_msg_for_each_output_object(i, msg)
>> +		oic->u[i].type = QCOMTEE_ARG_TYPE_OO;
>> +
>> +	/* End of Arguments. */
>> +	oic->u[i].type = QCOMTEE_ARG_TYPE_INV;
>> +
>> +	return ret;
>> +}
>> +
>> +static int qcomtee_update_msg(struct qcomtee_object_invoke_ctx *oic)
>> +{
>> +	struct qcomtee_msg_callback *msg;
>> +	int i, ib, ob, io, oo;
>> +
>> +	/* Use the output message buffer in 'oic'. */
>> +	msg = (struct qcomtee_msg_callback *)oic->out_msg.addr;
>> +
>> +	ib = 0;
>> +	qcomtee_arg_for_each_input_buffer(i, oic->u)
>> +		ib++;
>> +
>> +	ob = ib;
>> +	qcomtee_arg_for_each_output_buffer(i, oic->u) {
>> +		/* Only reduce size; never increase it. */
>> +		if (msg->args[ob].b.size < oic->u[i].b.size)
>> +			return -EINVAL;
>> +
>> +		msg->args[ob].b.size = oic->u[i].b.size;
>> +		ob++;
>> +	}
>> +
>> +	io = ob;
>> +	qcomtee_arg_for_each_input_object(i, oic->u)
>> +		io++;
>> +
>> +	oo = io;
>> +	qcomtee_arg_for_each_output_object(i, oic->u) {
>> +		if (qcomtee_object_id_get(oic->u[i].o, &msg->args[oo].o)) {
>> +			/* Put whatever we got. */
>> +			for (oo--; oo >= io; oo--)
>> +				qcomtee_object_id_put(msg->args[oo].o);
>> +
>> +			return -ENOSPC;
>> +		}
>> +
>> +		oo++;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/* Invoke a callback object. */
>> +static void qcomtee_cb_object_invoke(struct qcomtee_object_invoke_ctx *oic,
>> +				     struct qcomtee_msg_callback *msg)
>> +{
>> +	int i, errno;
>> +	u32 op;
>> +
>> +	/* Get the object being invoked. */
>> +	unsigned int object_id = msg->cxt;
>> +	struct qcomtee_object *object;
>> +
>> +	/* QTEE cannot invoke a NULL object or objects it hosts. */
>> +	if (qcomtee_object_type(object_id) == QCOMTEE_OBJECT_TYPE_NULL ||
>> +	    qcomtee_object_type(object_id) == QCOMTEE_OBJECT_TYPE_TEE) {
>> +		errno = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	object = qcomtee_local_object_get(object_id);
>> +	if (object == NULL_QCOMTEE_OBJECT) {
>> +		errno = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	oic->object = object;
>> +
>> +	/* Filter bits used by transport. */
>> +	op = msg->op & QCOMTEE_MSG_OBJECT_OP_MASK;
>> +
>> +	switch (op) {
>> +	case QCOMTEE_MSG_OBJECT_OP_RELEASE:
>> +		qcomtee_object_id_put(object_id);
>> +		qcomtee_object_put(object);
>> +		errno = 0;
>> +
>> +		break;
>> +	case QCOMTEE_MSG_OBJECT_OP_RETAIN:
>> +		qcomtee_object_get(object);
>> +		errno = 0;
>> +
>> +		break;
>> +	default:
>> +		errno = qcomtee_prepare_args(oic);
>> +		if (errno) {
>> +			/* Release any object that arrived as input. */
>> +			qcomtee_arg_for_each_input_buffer(i, oic->u)
>> +				qcomtee_object_put(oic->u[i].o);
>> +
>> +			break;
>> +		}
>> +
>> +		errno = object->ops->dispatch(oic, object, op, oic->u);
>> +		if (!errno) {
>> +			/* On success, notify at the appropriate time. */
>> +			oic->flags |= QCOMTEE_OIC_FLAG_NOTIFY;
>> +		}
>> +	}
>> +
>> +out:
>> +
>> +	oic->errno = errno;
>> +}
>> +
>> +/**
>> + * qcomtee_qtee_objects_put() - Put the callback objects in the argument array.
>> + * @u: array of arguments.
>> + *
>> + * When qcomtee_object_do_invoke_internal() is successfully invoked,
>> + * QTEE takes ownership of the callback objects. If the invocation fails,
>> + * qcomtee_object_do_invoke_internal() calls qcomtee_qtee_objects_put()
>> + * to mimic the release of callback objects by QTEE.
>> + */
>> +static void qcomtee_qtee_objects_put(struct qcomtee_arg *u)
>> +{
>> +	int i;
>> +
>> +	qcomtee_arg_for_each_input_object(i, u)
>> +		if (typeof_qcomtee_object(u[i].o) == QCOMTEE_OBJECT_TYPE_CB)
>> +			qcomtee_object_put(u[i].o);
>> +}
>> +
>> +/**
>> + * qcomtee_object_do_invoke_internal() - Submit an invocation for an object.
>> + * @oic: context to use for the current invocation.
>> + * @object: object being invoked.
>> + * @op: requested operation on the object.
>> + * @u: array of arguments for the current invocation.
>> + * @result: result returned from QTEE.
>> + *
>> + * The caller is responsible for keeping track of the refcount for each
>> + * object, including @object. On return, the caller loses ownership of all
>> + * input objects of type %QCOMTEE_OBJECT_TYPE_CB.
>> + *
>> + * Return: On success, returns 0. On error, returns -EAGAIN if invocation
>> + * failed and the user may retry the invocation, -ENODEV on fatal failure.
>> + */
>> +int qcomtee_object_do_invoke_internal(struct qcomtee_object_invoke_ctx *oic,
>> +				      struct qcomtee_object *object, u32 op,
>> +				      struct qcomtee_arg *u, int *result)
>> +{
>> +	struct qcomtee_msg_callback *cb_msg;
>> +	struct qcomtee_object *qto;
>> +	int i, ret, errno;
>> +	u64 res_type;
>> +
>> +	/* Allocate inbound and outbound buffers. */
>> +	if (qcomtee_msg_buffers_alloc(oic, u)) {
>> +		qcomtee_qtee_objects_put(u);
>> +
>> +		return -EAGAIN;
>> +	}
>> +
>> +	if (qcomtee_prepare_msg(oic, object, op, u)) {
>> +		qcomtee_qtee_objects_put(u);
>> +
>> +		ret = -EAGAIN;
>> +		goto out;
>> +	}
>> +
>> +	/* Use input message buffer in 'oic'. */
>> +	cb_msg = (struct qcomtee_msg_callback *)oic->out_msg.addr;
> 
> No need to cast a void pointer.
> 

Ack.

>> +
>> +	while (1) {
>> +		if (oic->flags & QCOMTEE_OIC_FLAG_BUSY) {
>> +			errno = oic->errno;
>> +			if (!errno)
>> +				errno = qcomtee_update_msg(oic);
>> +			qcomtee_msg_set_result(cb_msg, errno);
>> +		}
>> +
>> +		/* Invoke the remote object. */
>> +		ret = qcomtee_object_invoke_ctx_invoke(oic, result, &res_type);
>> +
>> +		if (oic->flags & QCOMTEE_OIC_FLAG_BUSY) {
>> +			qto = oic->object;
>> +			if (qto) {
>> +				if (oic->flags & QCOMTEE_OIC_FLAG_NOTIFY) {
>> +					/* Don't care about the exact errno. */
>> +					if (qto->ops->notify)
>> +						qto->ops->notify(oic, qto,
>> +								 errno || ret);
>> +				}
>> +
>> +				/* Get is in qcomtee_cb_object_invoke(). */
>> +				qcomtee_object_put(qto);
>> +			}
>> +
>> +			oic->object = NULL_QCOMTEE_OBJECT;
>> +			oic->flags &= ~(QCOMTEE_OIC_FLAG_BUSY |
>> +					QCOMTEE_OIC_FLAG_NOTIFY);
>> +		}
>> +
>> +		if (ret) {
>> +			if (!(oic->flags & QCOMTEE_OIC_FLAG_SHARED)) {
>> +				qcomtee_qtee_objects_put(u);
>> +
>> +				ret = -EAGAIN;
>> +			} else {
>> +				/*
>> +				 * On error, there is no clean way to exit.
>> +				 * For some reason, we cannot communicate with
>> +				 * QTEE, so we cannot notify QTEE about the
>> +				 * failure and do further cleanup.
>> +				 */
>> +				ret = -ENODEV;
>> +			}
>> +
>> +			goto out;
>> +
>> +		} else {
>> +			/*
>> +			 * QTEE obtained ownership of QCOMTEE_OBJECT_TYPE_CB
>> +			 * input objects in 'u'. On further failure, QTEE is
>> +			 * responsible for releasing them.
>> +			 */
>> +			oic->flags |= QCOMTEE_OIC_FLAG_SHARED;
>> +		}
>> +
>> +		/* Is it a callback request? */
>> +		if (res_type != QCOMTEE_RESULT_INBOUND_REQ_NEEDED) {
>> +			if (!*result) {
>> +				ret = qcomtee_update_args(u, oic);
>> +				if (ret) {
>> +					/* Put output objects. Retry. */
>> +					qcomtee_arg_for_each_output_object(i, u)
>> +						qcomtee_object_put(u[i].o);
>> +
>> +					ret = -EAGAIN;
>> +				}
>> +			}
>> +
>> +			break;
>> +
>> +		} else {
>> +			oic->flags |= QCOMTEE_OIC_FLAG_BUSY;
>> +
>> +			qcomtee_fetch_async_reqs(oic);
>> +			qcomtee_cb_object_invoke(oic, cb_msg);
>> +		}
>> +	}
>> +
>> +	qcomtee_fetch_async_reqs(oic);
>> +out:
>> +	qcomtee_msg_buffers_free(oic);
>> +
>> +	return ret;
>> +}
>> +
>> +int qcomtee_object_do_invoke(struct qcomtee_object_invoke_ctx *oic,
>> +			     struct qcomtee_object *object, u32 op,
>> +			     struct qcomtee_arg *u, int *result)
>> +{
>> +	/* User can not set bits used by transport. */
>> +	if (op & ~QCOMTEE_MSG_OBJECT_OP_MASK)
>> +		return -EINVAL;
>> +
>> +	/* User can only invoke QTEE hosted objects. */
>> +	if (typeof_qcomtee_object(object) != QCOMTEE_OBJECT_TYPE_TEE &&
>> +	    typeof_qcomtee_object(object) != QCOMTEE_OBJECT_TYPE_ROOT)
>> +		return -EINVAL;
>> +
>> +	/* User cannot directly issue these operations to QTEE. */
>> +	if (op == QCOMTEE_MSG_OBJECT_OP_RELEASE ||
>> +	    op == QCOMTEE_MSG_OBJECT_OP_RETAIN)
>> +		return -EINVAL;
>> +
>> +	return qcomtee_object_do_invoke_internal(oic, object, op, u, result);
>> +}
>> +EXPORT_SYMBOL_GPL(qcomtee_object_do_invoke);
>> diff --git a/drivers/tee/qcomtee/qcom_scm.c b/drivers/tee/qcomtee/qcom_scm.c
>> new file mode 100644
>> index 000000000000..c49cb675e702
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/qcom_scm.c
>> @@ -0,0 +1,36 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/firmware/qcom/qcom_scm.h>
>> +
>> +#include "qcomtee_private.h"
>> +
>> +int qcomtee_object_invoke_ctx_invoke(struct qcomtee_object_invoke_ctx *oic,
>> +				     int *result, u64 *res_type)
>> +{
>> +	int ret;
>> +	u64 res;
>> +
>> +	if (!(oic->flags & QCOMTEE_OIC_FLAG_BUSY)) {
>> +		/* Direct QTEE object invocation. */
>> +		ret = qcom_scm_qtee_invoke_smc(oic->in_msg_paddr,
>> +					       oic->in_msg.size,
>> +					       oic->out_msg_paddr,
>> +					       oic->out_msg.size,
>> +					       &res, res_type);
>> +	} else {
>> +		/* Submit callback response. */
>> +		ret = qcom_scm_qtee_callback_response(oic->out_msg_paddr,
>> +						      oic->out_msg.size,
>> +						      &res, res_type);
>> +	}
>> +
>> +	if (ret)
>> +		pr_err("QTEE returned with %d.\n", ret);
>> +	else
>> +		*result = (int)res;
>> +
>> +	return ret;
>> +}
>> diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
>> new file mode 100644
>> index 000000000000..e1d479fc551c
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/qcomtee_msg.h
>> @@ -0,0 +1,234 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef QCOMTEE_MSG_H
>> +#define QCOMTEE_MSG_H
>> +
>> +#include <linux/firmware/qcom/qcom_tee.h>
>> +
>> +/**
>> + * DOC: ''Qualcomm TEE'' (QTEE) Transport Message
>> + *
>> + * There are two buffers shared with QTEE: inbound and outbound buffers.
>> + * The inbound buffer is used for direct object invocation, and the outbound
>> + * buffer is used to make a request from QTEE to the kernel; i.e., a callback
>> + * request.
>> + *
>> + * The unused tail of the outbound buffer is also used for sending and
>> + * receiving asynchronous messages. An asynchronous message is independent of
>> + * the current object invocation (i.e., contents of the inbound buffer) or
>> + * callback request (i.e., the head of the outbound buffer); see
>> + * qcomtee_get_async_buffer(). It is used by endpoints (QTEE or kernel) as an
>> + * optimization to reduce the number of context switches between the secure and
>> + * non-secure worlds.
>> + *
>> + * For instance, QTEE never sends an explicit callback request to release an
>> + * object in the kernel. Instead, it sends asynchronous release messages in the
>> + * outbound buffer when QTEE returns from the previous direct object invocation,
>> + * or appends asynchronous release messages after the current callback request.
>> + *
>> + * QTEE supports two types of arguments in a message: buffer and object
>> + * arguments. Depending on the direction of data flow, they could be input
>> + * buffer (IO) to QTEE, output buffer (OB) from QTEE, input object (IO) to QTEE,
>> + * or output object (OO) from QTEE. Object arguments hold object IDs. Buffer
>> + * arguments hold (offset, size) pairs into the inbound or outbound buffers.
>> + *
>> + * QTEE holds an object table for objects it hosts and exposes to the kernel.
>> + * An object ID is an index to the object table in QTEE.
>> + *
>> + * For the direct object invocation message format in the inbound buffer, see
>> + * &struct qcomtee_msg_object_invoke. For the callback request message format
>> + * in the outbound buffer, see &struct qcomtee_msg_callback. For the message
>> + * format for asynchronous messages in the outbound buffer, see
>> + * &struct qcomtee_async_msg_hdr.
>> + */
>> +
>> +/**
>> + * define QCOMTEE_MSG_OBJECT_NS_BIT - Non-secure bit
>> + *
>> + * Object ID is a globally unique 32-bit number. IDs referencing objects
>> + * in the kernel should have %QCOMTEE_MSG_OBJECT_NS_BIT set.
>> + */
>> +#define QCOMTEE_MSG_OBJECT_NS_BIT BIT(31)
>> +
>> +/* Static object IDs recognized by QTEE. */
>> +#define QCOMTEE_MSG_OBJECT_NULL (0U)
>> +#define QCOMTEE_MSG_OBJECT_ROOT (1U)
>> +
>> +/* Definitions from QTEE as part of the transport protocol. */
>> +
>> +/* qcomtee_msg_arg is an argument as recognized by QTEE. */
>> +union qcomtee_msg_arg {
>> +	struct {
>> +		u32 offset;
>> +		u32 size;
>> +	} b;
>> +	u32 o;
>> +};
>> +
>> +/* BI and BO payloads in QTEE messages should be at 64-bit boundaries. */
>> +#define qcomtee_msg_offset_align(o) ALIGN((o), sizeof(u64))
>> +
>> +/* Operations for objects are 32-bit. Transport uses the upper 16 bits. */
>> +#define QCOMTEE_MSG_OBJECT_OP_MASK GENMASK(15, 0)
>> +
>> +/* Reserved Operation IDs sent to QTEE: */
>> +/* QCOMTEE_MSG_OBJECT_OP_RELEASE - Reduces the refcount and releases the object.
>> + * QCOMTEE_MSG_OBJECT_OP_RETAIN  - Increases the refcount.
>> + *
>> + * These operation IDs are valid for all objects. They are not available
>> + * outside of this driver. Developers should use qcomtee_object_get()
>> + * and qcomtee_object_put() to achieve the same.
>> + */
>> +
>> +#define QCOMTEE_MSG_OBJECT_OP_RELEASE (QCOMTEE_MSG_OBJECT_OP_MASK - 0)
>> +#define QCOMTEE_MSG_OBJECT_OP_RETAIN  (QCOMTEE_MSG_OBJECT_OP_MASK - 1)
>> +
>> +/* Response types as returned from qcomtee_object_invoke_ctx_invoke(). */
>> +
>> +/* The message contains a callback request. */
>> +#define QCOMTEE_RESULT_INBOUND_REQ_NEEDED 3
>> +
>> +/**
>> + * struct qcomtee_msg_object_invoke - Direct object invocation message.
>> + * @ctx: object ID hosted in QTEE.
>> + * @op: operation for the object.
>> + * @counts: number of different types of arguments in @args.
>> + * @args: array of arguments.
>> + *
>> + * @counts consists of 4 * 4-bit fields. Bits 0 - 3 represent the number of
>> + * input buffers, bits 4 - 7 represent the number of output buffers,
>> + * bits 8 - 11 represent the number of input objects, and bits 12 - 15
>> + * represent the number of output objects. The remaining bits should be zero.
>> + *
>> + * The maximum number of arguments of each type is defined by
>> + * %QCOMTEE_ARGS_PER_TYPE.
>> + */
>> +struct qcomtee_msg_object_invoke {
>> +	u32 cxt;
>> +	u32 op;
>> +	u32 counts;
>> +	union qcomtee_msg_arg args[];
>> +};
>> +
>> +/**
>> + * struct qcomtee_msg_callback - Callback request message.
>> + * @result: result of operation @op on the object referenced by @cxt.
>> + * @cxt: object ID hosted in the kernel.
>> + * @op: operation for the object.
>> + * @counts: number of different types of arguments in @args.
>> + * @args: array of arguments.
>> + *
>> + * For details of @counts, see &qcomtee_msg_object_invoke.counts.
>> + */
>> +struct qcomtee_msg_callback {
>> +	u32 result;
>> +	u32 cxt;
>> +	u32 op;
>> +	u32 counts;
>> +	union qcomtee_msg_arg args[];
>> +};
>> +
>> +/* Offset in the message for the beginning of the buffer argument's contents. */
>> +#define qcomtee_msg_buffer_args(t, n) \
>> +	qcomtee_msg_offset_align(struct_size_t(t, args, n))
>> +/* Pointer to the beginning of a buffer argument's content at an offset. */
>> +#define qcomtee_msg_offset_to_ptr(m, off) ((void *)&((char *)(m))[(off)])
>> +
>> +/* Some helpers to manage msg.counts. */
>> +
>> +#define QCOMTEE_MSG_NUM_IB(x) ((x) & 0xfU)
>> +#define QCOMTEE_MSG_NUM_OB(x) (((x) >> 4) & 0xfU)
>> +#define QCOMTEE_MSG_NUM_IO(x) (((x) >> 8) & 0xfU)
>> +#define QCOMTEE_MSG_NUM_OO(x) (((x) >> 12) & 0xfU)
>> +
>> +#define QCOMTEE_MSG_IDX_IB(x) (0U)
>> +#define QCOMTEE_MSG_IDX_OB(x) (QCOMTEE_MSG_IDX_IB(x) + QCOMTEE_MSG_NUM_IB(x))
>> +#define QCOMTEE_MSG_IDX_IO(x) (QCOMTEE_MSG_IDX_OB(x) + QCOMTEE_MSG_NUM_OB(x))
>> +#define QCOMTEE_MSG_IDX_OO(x) (QCOMTEE_MSG_IDX_IO(x) + QCOMTEE_MSG_NUM_IO(x))
>> +
>> +#define qcomtee_msg_for_each(i, c, type)    \
>> +	for (i = QCOMTEE_MSG_IDX_##type(c); \
>> +	     i < (QCOMTEE_MSG_IDX_##type(c) + QCOMTEE_MSG_NUM_##type(c)); i++)
>> +
>> +#define qcomtee_msg_for_each_input_buffer(i, m) \
>> +	qcomtee_msg_for_each(i, (m)->counts, IB)
>> +#define qcomtee_msg_for_each_output_buffer(i, m) \
>> +	qcomtee_msg_for_each(i, (m)->counts, OB)
>> +#define qcomtee_msg_for_each_input_object(i, m) \
>> +	qcomtee_msg_for_each(i, (m)->counts, IO)
>> +#define qcomtee_msg_for_each_output_object(i, m) \
>> +	qcomtee_msg_for_each(i, (m)->counts, OO)
>> +
>> +/* Sum of arguments in a message. */
>> +#define qcomtee_msg_args(m) \
>> +	(QCOMTEE_MSG_IDX_OO((m)->counts) + QCOMTEE_MSG_NUM_OO((m)->counts))
>> +
>> +static inline void qcomtee_msg_init(struct qcomtee_msg_object_invoke *msg,
>> +				    u32 cxt, u32 op, int in_buffer,
>> +				    int out_buffer, int in_object,
>> +				    int out_object)
>> +{
>> +	msg->counts |= (in_buffer & 0xfU);
>> +	msg->counts |= ((out_buffer - in_buffer) & 0xfU) << 4;
>> +	msg->counts |= ((in_object - out_buffer) & 0xfU) << 8;
>> +	msg->counts |= ((out_object - in_object) & 0xfU) << 12;
>> +	msg->cxt = cxt;
>> +	msg->op = op;
>> +}
>> +
>> +/* Generic error codes. */
>> +#define QCOMTEE_MSG_OK			0    /* non-specific success code. */
>> +#define QCOMTEE_MSG_ERROR		1    /* non-specific error. */
>> +#define QCOMTEE_MSG_ERROR_INVALID	2    /* unsupported/unrecognized request. */
>> +#define QCOMTEE_MSG_ERROR_SIZE_IN	3    /* supplied buffer/string too large. */
>> +#define QCOMTEE_MSG_ERROR_SIZE_OUT	4    /* supplied output buffer too small. */
>> +#define QCOMTEE_MSG_ERROR_USERBASE	10   /* start of user-defined error range. */
>> +
>> +/* Transport layer error codes. */
>> +#define QCOMTEE_MSG_ERROR_DEFUNCT	-90  /* object no longer exists. */
>> +#define QCOMTEE_MSG_ERROR_ABORT		-91  /* calling thread must exit. */
>> +#define QCOMTEE_MSG_ERROR_BADOBJ	-92  /* invalid object context. */
>> +#define QCOMTEE_MSG_ERROR_NOSLOTS	-93  /* caller's object table full. */
>> +#define QCOMTEE_MSG_ERROR_MAXARGS	-94  /* too many args. */
>> +#define QCOMTEE_MSG_ERROR_MAXDATA	-95  /* buffers too large. */
>> +#define QCOMTEE_MSG_ERROR_UNAVAIL	-96  /* the request could not be processed. */
>> +#define QCOMTEE_MSG_ERROR_KMEM		-97  /* kernel out of memory. */
>> +#define QCOMTEE_MSG_ERROR_REMOTE	-98  /* local method sent to remote object. */
>> +#define QCOMTEE_MSG_ERROR_BUSY		-99  /* Object is busy. */
>> +#define QCOMTEE_MSG_ERROR_TIMEOUT	-103 /* Call Back Object invocation timed out. */
>> +
>> +static inline void qcomtee_msg_set_result(struct qcomtee_msg_callback *cb_msg,
>> +					  int err)
>> +{
>> +	if (!err) {
>> +		cb_msg->result = QCOMTEE_MSG_OK;
>> +	} else if (err < 0) {
>> +		/* If err < 0, then it is a transport error. */
>> +		switch (err) {
>> +		case -ENOMEM:
>> +			cb_msg->result = QCOMTEE_MSG_ERROR_KMEM;
>> +			break;
>> +		case -ENODEV:
>> +			cb_msg->result = QCOMTEE_MSG_ERROR_DEFUNCT;
>> +			break;
>> +		case -ENOSPC:
>> +		case -EBUSY:
>> +			cb_msg->result = QCOMTEE_MSG_ERROR_BUSY;
>> +			break;
>> +		case -EBADF:
>> +		case -EINVAL:
>> +			cb_msg->result = QCOMTEE_MSG_ERROR_UNAVAIL;
>> +			break;
>> +		default:
>> +			cb_msg->result = QCOMTEE_MSG_ERROR;
>> +		}
>> +	} else {
>> +		/* If err > 0, then it is user defined error, pass it as is. */
>> +		cb_msg->result = err;
>> +	}
>> +}
>> +
>> +#endif /* QCOMTEE_MSG_H */
>> diff --git a/drivers/tee/qcomtee/qcomtee_private.h b/drivers/tee/qcomtee/qcomtee_private.h
>> new file mode 100644
>> index 000000000000..706c200788a2
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/qcomtee_private.h
>> @@ -0,0 +1,223 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef QCOMTEE_PRIVATE_H
>> +#define QCOMTEE_PRIVATE_H
>> +
>> +#include <linux/firmware/qcom/qcom_tee.h>
>> +#include <linux/kobject.h>
>> +#include <linux/tee_core.h>
>> +
>> +/* Flags relating to object reference. */
>> +#define QCOMTEE_OBJREF_FLAG_USER 1
>> +
>> +/* Reserved OBJREF operations. */
>> +/* These operations are not sent to QTEE and are handled in the driver. */
>> +#define QCOMTEE_OBJREF_OP_MIN USHRT_MAX
>> +#define QCOMTEE_OBJREF_OP_RELEASE (QCOMTEE_OBJREF_OP_MIN + 1)
>> +
>> +/**
>> + * struct qcomtee - Main service struct.
>> + * @teedev: client device.
>> + */
>> +struct qcomtee {
>> +	struct tee_device *teedev;
>> +};
>> +
>> +struct qcomtee_object *qcomtee_idx_erase(u32 idx);
>> +void qcomtee_object_free(struct qcomtee_object *object);
>> +
>> +void qcomtee_fetch_async_reqs(struct qcomtee_object_invoke_ctx *oic);
>> +
>> +int qcomtee_release_init(void);
>> +void qcomtee_release_destroy(void);
>> +void qcomtee_release_tee_object(struct qcomtee_object *object);
>> +
>> +int qcomtee_msg_buffers_alloc(struct qcomtee_object_invoke_ctx *oic,
>> +			      struct qcomtee_arg *u);
>> +void qcomtee_msg_buffers_free(struct qcomtee_object_invoke_ctx *oic);
>> +int qcomtee_msg_buffers_init(void);
>> +void qcomtee_msg_buffers_destroy(void);
>> +
>> +int qcomtee_object_invoke_ctx_invoke(struct qcomtee_object_invoke_ctx *oic,
>> +				     int *result, u64 *res_type);
>> +
>> +/**
>> + * qcomtee_object_do_invoke_internal() - Submit an invocation for an object.
>> + * @oic: context to use for the current invocation.
>> + * @object: object being invoked.
>> + * @op: requested operation on the object.
>> + * @u: array of arguments for the current invocation.
>> + * @result: result returned from QTEE.
>> + *
>> + * The caller is responsible for keeping track of the refcount for each
>> + * object, including @object. On return, the caller loses ownership of all
>> + * input objects of type %QCOMTEE_OBJECT_TYPE_CB.
>> + *
>> + * Return: On success, returns 0. On error, returns -EAGAIN if invocation
>> + * failed and the user may retry the invocation, -ENODEV on fatal failure.
>> + */
>> +int qcomtee_object_do_invoke_internal(struct qcomtee_object_invoke_ctx *oic,
>> +				      struct qcomtee_object *object, u32 op,
>> +				      struct qcomtee_arg *u, int *result);
>> +
>> +/**
>> + * struct qcomtee_context_data - Clients' or supplicants' context.
>> + * @qtee_objects_idr: QTEE objects in this context.
>> + * @qtee_lock: spinlock for @qtee_pbjects_idr.
>> + * @reqs_idr: requests currently being processed in this context.
>> + * @reqs_list: FIFO for requests.
>> + * @reqs_lock: mutex for @reqs_idr, @reqs_list and request states.
>> + * @req_c: completion used when the supplicant is waiting for requests.
>> + * @released: state of this context.
>> + */
>> +struct qcomtee_context_data {
>> +	struct idr qtee_objects_idr;
>> +	/* Synchronize access to @qtee_objects_idr. */
>> +	spinlock_t qtee_lock;
>> +
>> +	struct idr reqs_idr;
>> +	struct list_head reqs_list;
>> +	/* Synchronize access to @reqs_idr, @reqs_list and updating requests states. */
>> +	struct mutex reqs_lock;
>> +
>> +	struct completion req_c;
>> +
>> +	int released;
>> +};
>> +
>> +/**
>> + * qcomtee_context_add_qtee_object() - Add a QTEE object to the context.
>> + * @param: TEE parameter representing @object.
>> + * @object: QTEE object.
>> + * @ctx: context to add the object.
>> + *
>> + * It assumes @object is %QCOMTEE_OBJECT_TYPE_TEE and the caller has already
>> + * issued qcomtee_object_get() for @object.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_context_add_qtee_object(struct tee_param *param,
>> +				    struct qcomtee_object *object,
>> +				    struct tee_context *ctx);
>> +
>> +/* Retrieve the QTEE object added with qcomtee_context_add_qtee_object(). */
>> +int qcomtee_context_find_qtee_object(struct qcomtee_object **object,
>> +				     struct tee_param *param,
>> +				     struct tee_context *ctx);
>> +
>> +/**
>> + * qcomtee_context_del_qtee_object() - Delete a QTEE object from the context.
>> + * @param: TEE parameter representing @object.
>> + * @ctx: context for deleting the object.
>> + *
>> + * The @param has been initialized by qcomtee_context_add_qtee_object().
>> + */
>> +void qcomtee_context_del_qtee_object(struct tee_param *param,
>> +				     struct tee_context *ctx);
>> +
>> +/**
>> + * qcomtee_objref_to_arg() - Convert OBJREF parameter to QTEE argument.
>> + * @arg: QTEE argument.
>> + * @param: TEE parameter.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * It assumes @param is an OBJREF.
>> + * It does not set @arg.type; the caller should initialize it to a correct
>> + * &enum qcomtee_arg_type value. It gets the object's refcount in @arg;
>> + * the caller should manage to put it afterward.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_objref_to_arg(struct qcomtee_arg *arg, struct tee_param *param,
>> +			  struct tee_context *ctx);
>> +
>> +/**
>> + * qcomtee_objref_from_arg() - Convert QTEE argument to OBJREF param.
>> + * @param: TEE parameter.
>> + * @arg: QTEE argument.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * It assumes @arg is of %QCOMTEE_ARG_TYPE_IO or %QCOMTEE_ARG_TYPE_OO.
>> + * It does not set @param.attr; the caller should initialize it to a
>> + * correct type.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
>> +			    struct tee_context *ctx);
>> +
>> +/* OBJECTS: */
>> +
>> +/* (1) User Object API. */
>> +
>> +/* Is it a user object? */
>> +int is_qcomtee_user_object(struct qcomtee_object *object);
>> +
>> +/* Set the user object's 'notify on release' flag. */
>> +void qcomtee_user_object_set_notify(struct qcomtee_object *object, bool notify);
>> +
>> +/* This is called when there are no more users for the ctxdata. */
>> +void qcomtee_requests_destroy(struct qcomtee_context_data *ctxdata);
>> +
>> +/**
>> + * qcomtee_user_param_to_object() - OBJREF parameter to &struct qcomtee_object.
>> + * @object: object returned.
>> + * @param: TEE parameter.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * @param is an OBJREF with %QCOMTEE_OBJREF_FLAG_USER flags.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_user_param_to_object(struct qcomtee_object **object,
>> +				 struct tee_param *param,
>> +				 struct tee_context *ctx);
>> +
>> +/* Reverse what qcomtee_user_param_to_object() does. */
>> +int qcomtee_user_param_from_object(struct tee_param *param,
>> +				   struct qcomtee_object *object,
>> +				   struct tee_context *ctx);
>> +
>> +struct qcomtee_user_object_request_data {
>> +	int id; /* ID assigned to the request. */
>> +	u64 object_id; /* Object ID being invoked by QTEE. */
>> +	u32 op; /* Requested operation on object. */
>> +	int np; /* Number of parameters in the request.*/
>> +};
>> +
>> +/**
>> + * qcomtee_user_object_select() - Select a request for a user object.
>> + * @ctx: context to look for a user object.
>> + * @params: parameters for @op.
>> + * @num_params: number of elements in the parameter array.
>> + * @uaddr: user buffer for output UBUF parameters.
>> + * @size: size of user buffer @uaddr.
>> + * @data: information for the selected request.
>> + *
>> + * @params is filled along with @data for the selected request.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_user_object_select(struct tee_context *ctx,
>> +			       struct tee_param *params, int num_params,
>> +			       void __user *uaddr, size_t size,
>> +			       struct qcomtee_user_object_request_data *data);
>> +
>> +/**
>> + * qcomtee_user_object_submit() - Submit a response for a user object.
>> + * @ctx: context to look for a user object.
>> + * @params: returned parameters.
>> + * @num_params: number of elements in the parameter array.
>> + * @req_id: request ID for the response.
>> + * @errno: result of user object invocation.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_user_object_submit(struct tee_context *ctx,
>> +			       struct tee_param *params, int num_params,
>> +			       int req_id, int errno);
>> +
>> +#endif /* QCOMTEE_PRIVATE_H */
>> diff --git a/drivers/tee/qcomtee/release.c b/drivers/tee/qcomtee/release.c
>> new file mode 100644
>> index 000000000000..5742d3739d4a
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/release.c
>> @@ -0,0 +1,59 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include "qcomtee_private.h"
>> +#include "qcomtee_msg.h"
>> +
>> +static struct workqueue_struct *qcomtee_release_wq;
> 
> I would have expected this to be part of struct qcomtee
> 

Unfortunately, I cannot add it to the struct qcomtee.
The function that releases the QTEE objects is qcomtee_object_put. It may
be called at any point, and we may not have access to the struct qcomtee.

>> +
>> +static void qcomtee_destroy_user_object(struct work_struct *work)
>> +{
>> +	static struct qcomtee_object_invoke_ctx oic;
>> +	struct qcomtee_object *object;
>> +	int ret, result;
>> +
>> +	/* RELEASE does not require any argument. */
>> +	static struct qcomtee_arg args[] = { { .type = QCOMTEE_ARG_TYPE_INV } };
>> +
>> +	object = container_of(work, struct qcomtee_object, work);
>> +
>> +	ret = qcomtee_object_do_invoke_internal(&oic, object,
>> +						QCOMTEE_MSG_OBJECT_OP_RELEASE,
>> +						args, &result);
>> +
>> +	/* Is it safe to retry the release? */
>> +	if (ret == -EAGAIN) {
>> +		queue_work(qcomtee_release_wq, &object->work);
>> +	} else {
>> +		if (ret || result)
>> +			pr_err("%s: %s release failed, ret = %d (%x).\n",
>> +			       __func__, qcomtee_object_name(object), ret,
>> +			       result);
>> +
>> +		qcomtee_object_free(object);
>> +	}
>> +}
>> +
>> +/* qcomtee_release_tee_object puts object in release work queue. */
>> +void qcomtee_release_tee_object(struct qcomtee_object *object)
>> +{
>> +	INIT_WORK(&object->work, qcomtee_destroy_user_object);
>> +	queue_work(qcomtee_release_wq, &object->work);
>> +}
>> +
>> +int qcomtee_release_init(void)
>> +{
>> +	qcomtee_release_wq = alloc_ordered_workqueue("qcomtee_release_wq", 0);
>> +	if (!qcomtee_release_wq)
>> +		return -ENOMEM;
>> +
>> +	return 0;
>> +}
>> +
>> +void qcomtee_release_destroy(void)
>> +{
>> +	/* It drains the wq. */
>> +	destroy_workqueue(qcomtee_release_wq);
>> +}
>> diff --git a/drivers/tee/qcomtee/shm.c b/drivers/tee/qcomtee/shm.c
>> new file mode 100644
>> index 000000000000..a3eace120628
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/shm.c
>> @@ -0,0 +1,102 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/firmware/qcom/qcom_tzmem.h>
>> +#include <linux/mm.h>
>> +
>> +#include "qcomtee_msg.h"
>> +#include "qcomtee_private.h"
>> +
>> +/**
>> + * define MAX_BUFFER_SIZE - Maximum size of inbound and outbound buffers.
>> + *
>> + * QTEE transport does not impose any restriction on these buffers.
>> + * However, if the size of the buffers is larger than %MAX_BUFFER_SIZE,
>> + * the user should probably use some other form of shared memory with QTEE.
>> + */
>> +#define MAX_BUFFER_SIZE SZ_4M
>> +
>> +/* Pool to allocate inbound and outbound buffers. */
>> +static struct qcom_tzmem_pool *tzmem_msg_pool;
> 
> I would have expected this to be part of struct qcomtee
> 

True.

I kept the shm.c file really short, with just enough code to make the tests pass.
In V3 of this patch set, I'll enable the memory object support (waiting for the
tests to get ready), and this file will be rewritten completely. We will then
become reliant on standard TEE SS tee_shm_alloc_kernel_buf calls.

The pool for TEE SS would be in struct qcomtee then :).


>> +
>> +int qcomtee_msg_buffers_alloc(struct qcomtee_object_invoke_ctx *oic,
>> +			      struct qcomtee_arg *u)
>> +{
>> +	size_t size;
>> +	int i;
>> +
>> +	/* Start offset in a message for buffer arguments. */
>> +	size = qcomtee_msg_buffer_args(struct qcomtee_msg_object_invoke,
>> +				       qcomtee_args_len(u));
>> +	if (size > MAX_BUFFER_SIZE)
>> +		return -EINVAL;
>> +
>> +	/* Add size of IB arguments. */
>> +	qcomtee_arg_for_each_input_buffer(i, u) {
>> +		size = size_add(size, qcomtee_msg_offset_align(u[i].b.size));
>> +		if (size > MAX_BUFFER_SIZE)
>> +			return -EINVAL;
>> +	}
>> +
>> +	/* Add size of OB arguments. */
>> +	qcomtee_arg_for_each_output_buffer(i, u) {
>> +		size = size_add(size, qcomtee_msg_offset_align(u[i].b.size));
>> +		if (size > MAX_BUFFER_SIZE)
>> +			return -EINVAL;
>> +	}
>> +
>> +	/* QTEE requires inbound buffer size to be page aligned. */
>> +	size = PAGE_ALIGN(size);
>> +
>> +	oic->in_msg.size = size;
>> +	oic->in_msg.addr = qcom_tzmem_alloc(tzmem_msg_pool, size, GFP_KERNEL);
>> +	if (!oic->in_msg.addr)
>> +		return -EINVAL;
>> +
>> +	oic->out_msg.size = MAX_BUFFER_SIZE;
>> +	oic->out_msg.addr =
>> +		qcom_tzmem_alloc(tzmem_msg_pool, MAX_BUFFER_SIZE, GFP_KERNEL);
>> +	if (!oic->out_msg.addr) {
>> +		qcom_tzmem_free(oic->in_msg.addr);
>> +
>> +		return -EINVAL;
>> +	}
>> +
>> +	oic->in_msg_paddr = qcom_tzmem_to_phys(oic->in_msg.addr);
>> +	oic->out_msg_paddr = qcom_tzmem_to_phys(oic->out_msg.addr);
>> +
>> +	/* QTEE assume unused buffers are zeroed. */
>> +	memzero_explicit(oic->in_msg.addr, oic->in_msg.size);
>> +	memzero_explicit(oic->out_msg.addr, oic->out_msg.size);
>> +
>> +	return 0;
>> +}
>> +
>> +void qcomtee_msg_buffers_free(struct qcomtee_object_invoke_ctx *oic)
>> +{
>> +	qcom_tzmem_free(oic->in_msg.addr);
>> +	qcom_tzmem_free(oic->out_msg.addr);
>> +}
>> +
>> +int qcomtee_msg_buffers_init(void)
>> +{
>> +	struct qcom_tzmem_pool_config config = {
>> +		.policy = QCOM_TZMEM_POLICY_STATIC,
>> +		.initial_size = SZ_16M
>> +	};
>> +
>> +	tzmem_msg_pool = qcom_tzmem_pool_new(&config);
>> +	if (IS_ERR(tzmem_msg_pool))
>> +		return PTR_ERR(tzmem_msg_pool);
>> +
>> +	return 0;
>> +}
>> +
>> +void qcomtee_msg_buffers_destroy(void)
>> +{
>> +	qcom_tzmem_pool_free(tzmem_msg_pool);
>> +}
>> diff --git a/drivers/tee/qcomtee/user_obj.c b/drivers/tee/qcomtee/user_obj.c
>> new file mode 100644
>> index 000000000000..e3ba683dd4e3
>> --- /dev/null
>> +++ b/drivers/tee/qcomtee/user_obj.c
>> @@ -0,0 +1,712 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include "qcomtee_private.h"
>> +
>> +/**
>> + * DOC: User Objects aka Supplicants
>> + *
>> + * Any userspace process with access to the TEE device file can behave as a
>> + * supplicant by creating a user object. Any TEE parameter of type OBJREF with
>> + * %QCOMTEE_OBJREF_FLAG_USER flag set is considered a user object.
>> + *
>> + * A supplicant uses qcomtee_user_object_select() (i.e. TEE_IOC_SUPPL_RECV) to
>> + * receive a QTEE user object request and qcomtee_user_object_submit()
>> + * (i.e. TEE_IOC_SUPPL_SEND) to submit a response. QTEE expects to receive the
>> + * response, including OB and OO in a specific order in the message; parameters
>> + * submitted with qcomtee_user_object_submit() should maintain this order.
>> + */
>> +
>> +/**
>> + * struct qcomtee_user_object - User object.
>> + * @object: &struct qcomtee_object representing this user object.
>> + * @ctx: context for which the user object is defined.
>> + * @object_id: object ID in @ctx.
>> + * @nor: notify on release.
>> + *
>> + * Any object managed in userspace is represented by this struct.
>> + * If @nor is set, a notification message is sent back to userspace
>> + * upon release.
>> + */
>> +struct qcomtee_user_object {
>> +	struct qcomtee_object object;
>> +	struct tee_context *ctx;
>> +	u64 object_id;
>> +	bool nor;
>> +};
>> +
>> +#define to_qcomtee_user_object(o) \
>> +	container_of((o), struct qcomtee_user_object, object)
>> +
>> +static struct qcomtee_object_operations qcomtee_user_object_ops;
>> +
>> +/* Is it a user object? */
>> +int is_qcomtee_user_object(struct qcomtee_object *object)
>> +{
>> +	return object != NULL_QCOMTEE_OBJECT &&
>> +	       typeof_qcomtee_object(object) == QCOMTEE_OBJECT_TYPE_CB &&
>> +	       object->ops == &qcomtee_user_object_ops;
>> +}
>> +
>> +/* Set the user object's 'notify on release' flag. */
>> +void qcomtee_user_object_set_notify(struct qcomtee_object *object, bool notify)
>> +{
>> +	if (is_qcomtee_user_object(object))
>> +		to_qcomtee_user_object(object)->nor = notify;
>> +}
>> +
>> +/* Supplicant Requests: */
>> +
>> +/**
>> + * enum qcomtee_req_state - Current state of request.
>> + * @QCOMTEE_REQ_QUEUED: Request is waiting for supplicant.
>> + * @QCOMTEE_REQ_PROCESSING: Request has been picked by the supplicant.
>> + * @QCOMTEE_REQ_PROCESSED: Response has been submitted for the request.
>> + */
>> +enum qcomtee_req_state {
>> +	QCOMTEE_REQ_QUEUED = 1,
>> +	QCOMTEE_REQ_PROCESSING,
>> +	QCOMTEE_REQ_PROCESSED,
>> +};
>> +
>> +/* User requests sent to supplicants. */
>> +struct qcomtee_ureq {
>> +	enum qcomtee_req_state state;
>> +
>> +	/* User Request: */
>> +	int req_id;
>> +	u64 object_id;
>> +	u32 op;
>> +	struct qcomtee_arg *args;
>> +	int errno;
>> +
>> +	struct list_head node;
>> +	struct completion c; /* Completion for whoever wait. */
>> +};
>> +
>> +/*
>> + * Placeholder for a PROCESSING request in qcomtee_context.reqs_idr.
>> + *
>> + * If the thread that calls qcomtee_object_invoke() dies and the supplicant
>> + * is processing the request, we replace the entry in qcomtee_context.reqs_idr
>> + * with empty_ureq. This ensures that (1) the req_id remains busy and is not
>> + * reused, and (2) the supplicant fails to submit the response and performs
>> + * the necessary rollback.
>> + */
>> +static struct qcomtee_ureq empty_ureq = { .state = QCOMTEE_REQ_PROCESSING };
>> +
>> +/* Enqueue a user request for a context and assign a request ID. */
>> +static int ureq_enqueue(struct qcomtee_context_data *ctxdata,
>> +			struct qcomtee_ureq *ureq)
>> +{
>> +	int ret;
>> +
>> +	guard(mutex)(&ctxdata->reqs_lock);
>> +	/* Supplicant is dying. */
>> +	if (ctxdata->released)
>> +		return -ENODEV;
>> +
>> +	/* Allocate an ID and queue the request. */
>> +	ret = idr_alloc(&ctxdata->reqs_idr, ureq, 0, 0, GFP_KERNEL);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ureq->req_id = ret;
>> +	ureq->state = QCOMTEE_REQ_QUEUED;
>> +	list_add_tail(&ureq->node, &ctxdata->reqs_list);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * ureq_dequeue() - Dequeue a user request from a context.
>> + * @ctxdata: context data for a context to dequeue the request.
>> + * @req_id: ID of the request to be dequeued.
>> + *
>> + * It dequeues a user request and releases its request ID.
>> + *
>> + * Context: The caller should hold &qcomtee_context_data->reqs_lock.
>> + * Return: Returns the user request associated with this ID; otherwise, NULL.
>> + */
>> +static struct qcomtee_ureq *ureq_dequeue(struct qcomtee_context_data *ctxdata,
>> +					 int req_id)
>> +{
>> +	struct qcomtee_ureq *ureq;
>> +
>> +	ureq = idr_remove(&ctxdata->reqs_idr, req_id);
>> +	if (ureq == &empty_ureq || !ureq)
>> +		return NULL;
>> +
>> +	list_del(&ureq->node);
>> +
>> +	return ureq;
>> +}
>> +
>> +/**
>> + * ureq_replace() - Replace a user request.
>> + * @ctxdata: context data for a context to replace the request.
>> + * @ureq: request to be replaced.
>> + * @ureq_new: request to replace it with.
>> + *
>> + * Context: The caller should hold &qcomtee_context_data->reqs_lock.
>> + */
>> +static void ureq_replace(struct qcomtee_context_data *ctxdata,
>> +			 struct qcomtee_ureq *ureq,
>> +			 struct qcomtee_ureq *ureq_new)
>> +{
>> +	idr_replace(&ctxdata->reqs_idr, ureq_new, ureq->req_id);
>> +	/* ureq does not have a valid ID anymore; remove it from the queue. */
>> +	list_del(&ureq->node);
>> +}
>> +
>> +/**
>> + * ureq_select() - Select the next request in a context.
>> + * @ctxdata: context data for a context to pop a request.
>> + * @ubuf_size: size of the available buffer for UBUF parameters.
>> + * @num_params: number of entries for the TEE parameter array.
>> + *
>> + * It checks if @num_params is large enough to fit the next request arguments.
>> + * It checks if @ubuf_size is large enough to fit IB buffer arguments.
>> + *
>> + * Context: The caller should hold &qcomtee_context_data->reqs_lock.
>> + * Return: On success, returns a request;
>> + *         on failure, returns NULL and ERR_PTR.
>> + */
>> +static struct qcomtee_ureq *ureq_select(struct qcomtee_context_data *ctxdata,
>> +					size_t ubuf_size, int num_params)
>> +{
>> +	struct qcomtee_ureq *req, *ureq = NULL;
>> +	struct qcomtee_arg *u;
>> +	int i;
>> +
>> +	/* Find the a queued request. */
>> +	list_for_each_entry(req, &ctxdata->reqs_list, node) {
>> +		if (req->state == QCOMTEE_REQ_QUEUED) {
>> +			ureq = req;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (!ureq)
>> +		return NULL;
>> +
>> +	u = ureq->args;
>> +	/* (1) Is there enough TEE parameters? */
>> +	if (num_params < qcomtee_args_len(u))
>> +		return ERR_PTR(-EINVAL);
>> +	/* (2) Is there enough space to pass input buffers? */
>> +	qcomtee_arg_for_each_input_buffer(i, u) {
>> +		ubuf_size = size_sub(ubuf_size, u[i].b.size);
>> +		if (ubuf_size == SIZE_MAX)
>> +			return ERR_PTR(-EINVAL);
>> +
>> +		ubuf_size = round_down(ubuf_size, 8);
>> +	}
>> +
>> +	return ureq;
>> +}
>> +
>> +/* This is called when there are no more users for the ctxdata. */
>> +void qcomtee_requests_destroy(struct qcomtee_context_data *ctxdata)
>> +{
>> +	struct qcomtee_ureq *req, *ureq;
>> +
>> +	guard(mutex)(&ctxdata->reqs_lock);
>> +	/* So ureq_enqueue() refuses new requests from QTEE. */
>> +	ctxdata->released = 1;
>> +
>> +	list_for_each_entry_safe(ureq, req, &ctxdata->reqs_list, node) {
>> +		ureq_dequeue(ctxdata, ureq->req_id);
>> +
>> +		/*
>> +		 * Terminate requests.
>> +		 * Depending on who enqueues the ureq, there may be someone
>> +		 * waiting for the response or not:
>> +		 */
>> +		if (ureq->op != QCOMTEE_OBJREF_OP_RELEASE) {
>> +			/* (1) enqueued by qcomtee_user_object_dispatch(). */
>> +			ureq->state = QCOMTEE_REQ_PROCESSED;
>> +			ureq->errno = -ENODEV;
>> +
>> +			complete(&ureq->c);
>> +		} else {
>> +			/* (2) enqueued by qcomtee_user_object_release(). */
>> +			kfree(ureq);
>> +		}
>> +	}
>> +}
>> +
>> +/* User Object API. */
>> +
>> +/* User object dispatcher. */
>> +static int qcomtee_user_object_dispatch(struct qcomtee_object_invoke_ctx *oic,
>> +					struct qcomtee_object *object, u32 op,
>> +					struct qcomtee_arg *args)
>> +{
>> +	struct qcomtee_user_object *uo = to_qcomtee_user_object(object);
>> +	struct qcomtee_context_data *ctxdata = uo->ctx->data;
>> +	struct qcomtee_ureq *ureq __free(kfree) = NULL;
>> +	int errno;
>> +
>> +	ureq = kzalloc(sizeof(*ureq), GFP_KERNEL);
>> +	if (!ureq)
>> +		return -ENOMEM;
>> +
>> +	init_completion(&ureq->c);
>> +	ureq->object_id = uo->object_id;
>> +	ureq->op = op;
>> +	ureq->args = args;
>> +
>> +	/* Queue the request. */
>> +	if (ureq_enqueue(ctxdata, ureq))
>> +		return -ENODEV;
>> +
>> +	/* Wakeup supplicant to process it. */
>> +	complete(&ctxdata->req_c);
>> +
>> +	/*
>> +	 * Wait for the supplicant to process the request.
>> +	 *
>> +	 * The supplicant is expected to process the request in a timely manner.
>> +	 * We wait as KILLABLE in case the supplicant and invoke thread are
>> +	 * both running from the same user process; otherwise, the process
>> +	 * will be stuck on a fatal signal.
>> +	 */
>> +	if (!wait_for_completion_state(&ureq->c,
>> +				       TASK_KILLABLE | TASK_FREEZABLE)) {
>> +		errno = ureq->errno;
>> +		/* On success, notify() frees the request. */
>> +		if (!errno)
>> +			oic->data = no_free_ptr(ureq);
>> +	} else {
>> +		enum qcomtee_req_state prev_state;
>> +
>> +		errno = -ENODEV;
>> +
>> +		scoped_guard(mutex, &ctxdata->reqs_lock) {
>> +			prev_state = ureq->state;
>> +
>> +			/* Replace with empty_ureq to keep req_id reserved. */
>> +			if (prev_state == QCOMTEE_REQ_PROCESSING)
>> +				ureq_replace(ctxdata, ureq, &empty_ureq);
>> +
>> +			/* Remove as supplicant has never seen this request. */
>> +			else if (prev_state == QCOMTEE_REQ_QUEUED)
>> +				ureq_dequeue(ctxdata, ureq->req_id);
>> +		}
>> +
>> +		/* Supplicant did some work, we should not discard it. */
>> +		if (prev_state == QCOMTEE_REQ_PROCESSED) {
>> +			errno = ureq->errno;
>> +			/* On success, notify() frees the request. */
>> +			if (!errno)
>> +				oic->data = no_free_ptr(ureq);
>> +		}
>> +	}
>> +
>> +	return errno;
>> +}
>> +
>> +/* This is called after submitting the dispatcher response. */
>> +static void qcomtee_user_object_notify(struct qcomtee_object_invoke_ctx *oic,
>> +				       struct qcomtee_object *unused_object,
>> +				       int err)
>> +{
>> +	struct qcomtee_ureq *ureq = oic->data;
>> +	struct qcomtee_arg *u = ureq->args;
>> +	int i;
>> +
>> +	qcomtee_arg_for_each_output_object(i, u) {
>> +		/*
>> +		 * If err, there was a transport issue, and QTEE did not
>> +		 * receive the response for the dispatcher. Release the callback
>> +		 * object created for QTEE, in addition to the copies of
>> +		 * objects kept for the drivers.
>> +		 */
>> +		if (err &&
>> +		    (typeof_qcomtee_object(u[i].o) == QCOMTEE_OBJECT_TYPE_CB))
>> +			qcomtee_object_put(u[i].o);
>> +		qcomtee_object_put(u[i].o);
>> +	}
>> +
>> +	kfree(ureq);
>> +}
>> +
>> +static void qcomtee_user_object_release(struct qcomtee_object *object)
>> +{
>> +	struct qcomtee_user_object *uo = to_qcomtee_user_object(object);
>> +	struct qcomtee_context_data *ctxdata = uo->ctx->data;
>> +	struct tee_device *teedev = uo->ctx->teedev;
>> +	struct qcomtee_ureq *ureq;
>> +
>> +	/* RELEASE does not require any argument. */
>> +	static struct qcomtee_arg args[] = { { .type = QCOMTEE_ARG_TYPE_INV } };
>> +
>> +	if (!uo->nor)
>> +		goto out_no_notify;
>> +
>> +	ureq = kzalloc(sizeof(*ureq), GFP_KERNEL);
>> +	if (!ureq)
>> +		goto out_no_notify;
>> +
>> +	/* QUEUE a release request: */
>> +	ureq->object_id = uo->object_id;
>> +	ureq->op = QCOMTEE_OBJREF_OP_RELEASE;
>> +	ureq->args = args;
>> +	if (ureq_enqueue(ctxdata, ureq)) {
>> +		kfree(ureq);
>> +		/* Ignore the notification if it cannot be queued. */
>> +		goto out_no_notify;
>> +	}
>> +
>> +	complete(&ctxdata->req_c);
>> +
>> +out_no_notify:
>> +	teedev_ctx_put(uo->ctx);
>> +	kfree(uo);
>> +	tee_device_put(teedev);
>> +}
>> +
>> +static struct qcomtee_object_operations qcomtee_user_object_ops = {
>> +	.release = qcomtee_user_object_release,
>> +	.notify = qcomtee_user_object_notify,
>> +	.dispatch = qcomtee_user_object_dispatch,
>> +};
>> +
>> +/**
>> + * qcomtee_user_param_to_object() - OBJREF parameter to &struct qcomtee_object.
>> + * @object: object returned.
>> + * @param: TEE parameter.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * @param is an OBJREF with %QCOMTEE_OBJREF_FLAG_USER flags.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_user_param_to_object(struct qcomtee_object **object,
>> +				 struct tee_param *param,
>> +				 struct tee_context *ctx)
>> +{
>> +	struct qcomtee_user_object *user_object __free(kfree) = NULL;
>> +	struct tee_device *teedev = ctx->teedev;
>> +	int err;
>> +
>> +	user_object = kzalloc(sizeof(*user_object), GFP_KERNEL);
>> +	if (!user_object)
>> +		return -ENOMEM;
>> +
>> +	if (!tee_device_get(teedev))
>> +		return -EINVAL;
>> +
>> +	user_object->ctx = ctx;
>> +	user_object->object_id = param->u.objref.id;
>> +	/* By default, always notify userspace upon release. */
>> +	user_object->nor = true;
>> +	err = qcomtee_object_user_init(&user_object->object,
>> +				       QCOMTEE_OBJECT_TYPE_CB,
>> +				       &qcomtee_user_object_ops, "uo-%lu",
>> +				       param->u.objref.id);
>> +	if (err) {
>> +		tee_device_put(teedev);
>> +
>> +		return err;
>> +	}
>> +
>> +	teedev_ctx_get(ctx);
>> +
>> +	*object = &no_free_ptr(user_object)->object;
>> +
>> +	return 0;
>> +}
>> +
>> +/* Reverse what qcomtee_user_param_to_object() does. */
>> +int qcomtee_user_param_from_object(struct tee_param *param,
>> +				   struct qcomtee_object *object,
>> +				   struct tee_context *ctx)
>> +{
>> +	struct qcomtee_user_object *uo;
>> +
>> +	if (!is_qcomtee_user_object(object))
>> +		return -EINVAL;
>> +
>> +	uo = to_qcomtee_user_object(object);
>> +	/* Ensure the object is in the same context as the caller. */
>> +	if (uo->ctx != ctx)
>> +		return -EINVAL;
>> +
>> +	param->u.objref.id = uo->object_id;
>> +	param->u.objref.flags = QCOMTEE_OBJREF_FLAG_USER;
>> +
>> +	/* User objects are valid in userspace; do not keep a copy. */
>> +	qcomtee_object_put(object);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * qcomtee_cb_params_from_args() - Convert QTEE arguments to TEE parameters.
>> + * @params: TEE parameters.
>> + * @u: QTEE arguments.
>> + * @num_params: number of elements in the parameter array.
>> + * @ubuf_addr: user buffer for arguments of type %QCOMTEE_ARG_TYPE_IB.
>> + * @ubuf_size: size of the user buffer.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * It expects @params to have enough entries for @u. Entries in @params are of
>> + * %TEE_IOCTL_PARAM_ATTR_TYPE_NONE.
>> + *
>> + * Return: On success, returns the number of input parameters;
>> + *         on failure, returns < 0.
>> + */
>> +static int qcomtee_cb_params_from_args(struct tee_param *params,
>> +				       struct qcomtee_arg *u, int num_params,
>> +				       void __user *ubuf_addr, size_t ubuf_size,
>> +				       struct tee_context *ctx)
>> +{
>> +	int i, np;
>> +	void __user *uaddr;
>> +
>> +	qcomtee_arg_for_each(i, u) {
>> +		switch (u[i].type) {
>> +		case QCOMTEE_ARG_TYPE_IB:
>> +			params[i].attr = TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT;
>> +
>> +			/* Underflow already checked in ureq_select(). */
>> +			ubuf_size = round_down(ubuf_size - u[i].b.size, 8);
>> +			uaddr = (void *__user)(ubuf_addr + ubuf_size);
>> +
>> +			params[i].u.ubuf.uaddr = uaddr;
>> +			params[i].u.ubuf.size = u[i].b.size;
>> +			if (copy_to_user(params[i].u.ubuf.uaddr, u[i].b.addr,
>> +					 u[i].b.size))
>> +				goto out_failed;
>> +
>> +			break;
>> +		case QCOMTEE_ARG_TYPE_OB:
>> +			params[i].attr = TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT;
>> +			/* Let the user knows the maximum size we expect. */
>> +			params[i].u.ubuf.size = u[i].b.size;
>> +
>> +			break;
>> +		case QCOMTEE_ARG_TYPE_IO:
>> +			params[i].attr = TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT;
>> +			if (qcomtee_objref_from_arg(&params[i], &u[i], ctx))
>> +				goto out_failed;
>> +
>> +			break;
>> +		case QCOMTEE_ARG_TYPE_OO:
>> +			params[i].attr =
>> +				TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT;
>> +
>> +			break;
>> +		default: /* Never get here! */
>> +			goto out_failed;
>> +		}
>> +	}
>> +
>> +	return i;
>> +
>> +out_failed:
>> +	/* Undo qcomtee_objref_from_arg(). */
>> +	for (np = i; np >= 0; np--) {
>> +		if (params[np].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT)
>> +			qcomtee_context_del_qtee_object(&params[np], ctx);
>> +	}
>> +
>> +	/* Release any IO objects not processed. */
>> +	for (; u[i].type; i++) {
>> +		if (u[i].type == QCOMTEE_ARG_TYPE_IO)
>> +			qcomtee_object_put(u[i].o);
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +/**
>> + * qcomtee_cb_params_to_args() - Convert TEE parameters to QTEE arguments.
>> + * @u: QTEE arguments.
>> + * @params: TEE parameters.
>> + * @num_params: number of elements in the parameter array.
>> + * @ctx: context in which the conversion should happen.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +static int qcomtee_cb_params_to_args(struct qcomtee_arg *u,
>> +				     struct tee_param *params, int num_params,
>> +				     struct tee_context *ctx)
>> +{
>> +	int i;
>> +
>> +	qcomtee_arg_for_each(i, u) {
>> +		switch (u[i].type) {
>> +		case QCOMTEE_ARG_TYPE_IB:
>> +			if (params[i].attr !=
>> +			    TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT)
>> +				goto out_failed;
>> +
>> +			break;
>> +		case QCOMTEE_ARG_TYPE_OB:
>> +			if (params[i].attr !=
>> +			    TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT)
>> +				goto out_failed;
>> +
>> +			/* Client can not send more data than requested. */
>> +			if (params[i].u.ubuf.size > u[i].b.size)
>> +				goto out_failed;
>> +
>> +			if (copy_from_user(u[i].b.addr, params[i].u.ubuf.uaddr,
>> +					   params[i].u.ubuf.size))
>> +				goto out_failed;
>> +
>> +			u[i].b.size = params[i].u.ubuf.size;
>> +
>> +			break;
>> +		case QCOMTEE_ARG_TYPE_IO:
>> +			if (params[i].attr !=
>> +			    TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT)
>> +				goto out_failed;
>> +
>> +			break;
>> +		case QCOMTEE_ARG_TYPE_OO:
>> +			if (params[i].attr !=
>> +			    TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT)
>> +				goto out_failed;
>> +
>> +			if (qcomtee_objref_to_arg(&u[i], &params[i], ctx))
>> +				goto out_failed;
>> +
>> +			break;
>> +		default: /* Never get here! */
>> +			goto out_failed;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +out_failed:
>> +	/* Undo qcomtee_objref_to_arg(). */
>> +	for (i--; i >= 0; i--) {
>> +		if (u[i].type != QCOMTEE_ARG_TYPE_OO)
>> +			continue;
>> +
>> +		qcomtee_user_object_set_notify(u[i].o, false);
>> +		if (typeof_qcomtee_object(u[i].o) == QCOMTEE_OBJECT_TYPE_CB)
>> +			qcomtee_object_put(u[i].o);
>> +
>> +		qcomtee_object_put(u[i].o);
> 
> Why do you need to put it twice for QCOMTEE_OBJECT_TYPE_CB?
> 

When an instance of QCOMTEE_OBJECT_TYPE_CB object is created in qcomtee_objref_to_arg,
the initial refcount is 2: one copy for the QTEE and one copy for the driver itself.

The reason for a copy for the driver is that the QTEE can issue asynchronous releases.
So, on return from QTEE after object invocation, the async releases are processed
first before returning to the client. If the refcount were 1, it would destroy the
QCOMTEE_OBJECT_TYPE_CB object before allowing the return path to client execute safely.

I have already put some comments in qcomtee_objref_to_arg.

>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>> +/**
>> + * qcomtee_user_object_select() - Select a request for a user object.
>> + * @ctx: context to look for a user object.
>> + * @params: parameters for @op.
>> + * @num_params: number of elements in the parameter array.
>> + * @uaddr: user buffer for output UBUF parameters.
>> + * @size: size of user buffer @uaddr.
>> + * @data: information for the selected request.
>> + *
>> + * @params is filled along with @data for the selected request.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_user_object_select(struct tee_context *ctx,
>> +			       struct tee_param *params, int num_params,
>> +			       void __user *uaddr, size_t size,
>> +			       struct qcomtee_user_object_request_data *data)
>> +{
>> +	struct qcomtee_context_data *ctxdata = ctx->data;
>> +	struct qcomtee_ureq *ureq;
>> +	int ret;
>> +
>> +	while (1) {
>> +		scoped_guard(mutex, &ctxdata->reqs_lock) {
>> +			ureq = ureq_select(ctxdata, size, num_params);
>> +			if (!ureq)
>> +				goto wait_for_request;
>> +
>> +			if (IS_ERR(ureq))
>> +				return PTR_ERR(ureq);
>> +
>> +			/* Processing the request 'QUEUED -> PROCESSING'. */
>> +			ureq->state = QCOMTEE_REQ_PROCESSING;
>> +
>> +			/* ''Prepare user request:'' */
>> +			data->id = ureq->req_id;
>> +			data->object_id = ureq->object_id;
>> +			data->op = ureq->op;
>> +			ret = qcomtee_cb_params_from_args(params, ureq->args,
>> +							  num_params, uaddr,
>> +							  size, ctx);
>> +			if (ret >= 0)
>> +				goto done_request;
>> +
>> +			/* Something is wrong with the request. */
> 
> No special case for data->op == QCOMTEE_OBJREF_OP_RELEASE?
> 

Yes, see bellow after done_request.
qcomtee_cb_params_from_args always passes if data->op == QCOMTEE_OBJREF_OP_RELEASE,
so we always end up in done_request. 

>> +
>> +			ureq_dequeue(ctxdata, data->id);
>> +			/* Send error to QTEE. */
>> +			ureq->state = QCOMTEE_REQ_PROCESSED;
>> +			ureq->errno = ret;
>> +
>> +			complete(&ureq->c);
>> +		}
>> +
>> +		continue;
>> +wait_for_request:
>> +		/* Wait for a new QUEUED request. */
>> +		if (wait_for_completion_interruptible(&ctxdata->req_c))
>> +			return -ERESTARTSYS;
>> +	}
>> +
>> +done_request:
>> +	/* No one is waiting for the response. */
>> +	if (data->op == QCOMTEE_OBJREF_OP_RELEASE) {
>> +		scoped_guard(mutex, &ctxdata->reqs_lock)
>> +			ureq_dequeue(ctxdata, data->id);
>> +		kfree(ureq);
>> +	}
>> +
>> +	data->np = ret;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * qcomtee_user_object_submit() - Submit a response for a user object.
>> + * @ctx: context to look for a user object.
>> + * @params: returned parameters.
>> + * @num_params: number of elements in the parameter array.
>> + * @req_id: request ID for the response.
>> + * @errno: result of user object invocation.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_user_object_submit(struct tee_context *ctx,
>> +			       struct tee_param *params, int num_params,
>> +			       int req_id, int errno)
>> +{
>> +	struct qcomtee_context_data *ctxdata = ctx->data;
>> +	struct qcomtee_ureq *ureq;
>> +
>> +	guard(mutex)(&ctxdata->reqs_lock);
>> +
>> +	ureq = ureq_dequeue(ctxdata, req_id);
>> +	if (!ureq)
>> +		return -EINVAL;
>> +
>> +	ureq->state = QCOMTEE_REQ_PROCESSED;
>> +	ureq->errno = errno ?: qcomtee_cb_params_to_args(ureq->args, params,
>> +							 num_params, ctx);
>> +
>> +	errno = (!errno && ureq->errno) ? ureq->errno : 0;
> 
> Please exand the two ternary operations above into regular if statements.
> 

Ack.

>> +	/* Send result to QTEE. */
>> +	complete(&ureq->c);
>> +
>> +	return errno;
>> +}
>> diff --git a/include/linux/firmware/qcom/qcom_tee.h b/include/linux/firmware/qcom/qcom_tee.h
>> new file mode 100644
>> index 000000000000..7b2014b40422
>> --- /dev/null
>> +++ b/include/linux/firmware/qcom/qcom_tee.h
>> @@ -0,0 +1,286 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/* Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#ifndef __QCOM_TEE_H
>> +#define __QCOM_TEE_H
>> +
>> +#include <linux/kref.h>
>> +#include <linux/completion.h>
>> +#include <linux/workqueue.h>
>> +
>> +struct qcomtee_object;
>> +
>> +/**
>> + * DOC: Overview
>> + *
>> + * qcomtee_object provides object refcounting, ID allocation for objects hosted
>> + * in the kernel, and necessary message marshaling for Qualcomm TEE (QTEE).
>> + *
>> + * To invoke an object in QTEE, the user calls qcomtee_object_do_invoke()
>> + * while passing an instance of &struct qcomtee_object and the requested
>> + * operation + arguments.
>> + *
>> + * After boot, QTEE provides a static object %ROOT_QCOMTEE_OBJECT (type of
>> + * %QCOMTEE_OBJECT_TYPE_ROOT). The root object is invoked to pass the user's
>> + * credentials and obtain other instances of &struct qcomtee_object (type of
>> + * %QCOMTEE_OBJECT_TYPE_TEE) that represent services and TAs in QTEE;
>> + * see &enum qcomtee_object_type.
>> + *
>> + * The objects received from QTEE are refcounted. So the owner of these objects
>> + * can issue qcomtee_object_get() to increase the refcount and pass objects
>> + * to other clients, or issue qcomtee_object_put() to decrease the refcount
>> + * and release the resources in QTEE.
>> + *
>> + * The kernel can host services accessible to QTEE. A driver should embed
>> + * an instance of &struct qcomtee_object in the struct it wants to export to
>> + * QTEE (this is called a callback object). It issues qcomtee_object_user_init()
>> + * to set the dispatch() operation for the callback object and set its type
>> + * to %QCOMTEE_OBJECT_TYPE_CB.
>> + *
>> + * core.c holds an object table for callback objects. An object ID is assigned
>> + * to each callback object, which is an index to the object table. QTEE uses
>> + * these IDs to reference or invoke callback objects.
>> + *
>> + * If QTEE invokes a callback object in the kernel, the dispatch() operation is
>> + * called in the context of the thread that originally called
>> + * qcomtee_object_do_invoke().
>> + */
>> +
>> +/**
>> + * enum qcomtee_object_type - Object types.
>> + * @QCOMTEE_OBJECT_TYPE_TEE: object hosted on QTEE.
>> + * @QCOMTEE_OBJECT_TYPE_CB: object hosted on kernel.
>> + * @QCOMTEE_OBJECT_TYPE_ROOT: 'primordial' object.
>> + * @QCOMTEE_OBJECT_TYPE_NULL: NULL object.
>> + *
>> + * The primordial object is used for bootstrapping the IPC connection between
>> + * the kernel and QTEE. It is invoked by the kernel when it wants to get a
>> + * 'client env'.
>> + */
>> +enum qcomtee_object_type {
>> +	QCOMTEE_OBJECT_TYPE_TEE,
>> +	QCOMTEE_OBJECT_TYPE_CB,
>> +	QCOMTEE_OBJECT_TYPE_ROOT,
>> +	QCOMTEE_OBJECT_TYPE_NULL,
>> +};
>> +
>> +/**
>> + * enum qcomtee_arg_type - Type of QTEE argument.
>> + * @QCOMTEE_ARG_TYPE_INV: invalid type.
>> + * @QCOMTEE_ARG_TYPE_OB: output buffer (OB).
>> + * @QCOMTEE_ARG_TYPE_OO: output object (OO).
>> + * @QCOMTEE_ARG_TYPE_IB: input buffer (IB).
>> + * @QCOMTEE_ARG_TYPE_IO: input object (IO).
>> + *
>> + * Use the invalid type to specify the end of the argument array.
>> + */
>> +enum qcomtee_arg_type {
>> +	QCOMTEE_ARG_TYPE_INV = 0,
>> +	QCOMTEE_ARG_TYPE_OB,
>> +	QCOMTEE_ARG_TYPE_OO,
>> +	QCOMTEE_ARG_TYPE_IB,
>> +	QCOMTEE_ARG_TYPE_IO,
>> +	QCOMTEE_ARG_TYPE_NR,
>> +};
>> +
>> +/**
>> + * define QCOMTEE_ARGS_PER_TYPE - Maximum arguments of a specific type.
>> + *
>> + * The QTEE transport protocol limits the maximum number of arguments of
>> + * a specific type (i.e., IB, OB, IO, and OO).
>> + */
>> +#define QCOMTEE_ARGS_PER_TYPE 16
>> +
>> +/* Maximum arguments that can fit in a QTEE message, ignoring the type. */
>> +#define QCOMTEE_ARGS_MAX (QCOMTEE_ARGS_PER_TYPE * (QCOMTEE_ARG_TYPE_NR - 1))
>> +
>> +struct qcomtee_buffer {
>> +	union {
>> +		void *addr;
>> +		void __user *uaddr;
>> +	};
>> +	size_t size;
>> +};
>> +
>> +/**
>> + * struct qcomtee_arg - Argument for QTEE object invocation.
>> + * @type: type of argument as &enum qcomtee_arg_type.
>> + * @flags: extra flags.
>> + * @b: address and size if the type of argument is a buffer.
>> + * @o: object instance if the type of argument is an object.
>> + *
>> + * &qcomtee_arg.flags only accepts %QCOMTEE_ARG_FLAGS_UADDR for now, which
>> + * states that &qcomtee_arg.b contains a userspace address in uaddr.
>> + */
>> +struct qcomtee_arg {
>> +	enum qcomtee_arg_type type;
>> +/* 'b.uaddr' holds a __user address. */
>> +#define QCOMTEE_ARG_FLAGS_UADDR 1
> 
> BIT(0)?
> 

Ack.

>> +	unsigned int flags;
>> +	union {
>> +		struct qcomtee_buffer b;
>> +		struct qcomtee_object *o;
>> +	};
>> +};
>> +
>> +static inline int qcomtee_args_len(struct qcomtee_arg *args)
>> +{
>> +	int i = 0;
>> +
>> +	while (args[i].type != QCOMTEE_ARG_TYPE_INV)
>> +		i++;
>> +	return i;
>> +}
>> +
>> +/* Context is busy (callback is in progress). */
>> +#define QCOMTEE_OIC_FLAG_BUSY BIT(1)
>> +/* Context needs to notify the current object. */
>> +#define QCOMTEE_OIC_FLAG_NOTIFY BIT(2)
>> +/* Context has shared state with QTEE. */
>> +#define QCOMTEE_OIC_FLAG_SHARED BIT(3)
>> +
>> +struct qcomtee_object_invoke_ctx {
>> +	unsigned long flags;
>> +	int errno;
>> +
>> +	/* Current object invoked in this callback context. */
>> +	struct qcomtee_object *object;
>> +
>> +	/* Dispatcher argument array (+1 for ending QCOMTEE_ARG_TYPE_INV). */
>> +	struct qcomtee_arg u[QCOMTEE_ARGS_MAX + 1];
>> +
>> +	/* Inbound and Outbound buffers shared with QTEE. */
>> +	struct qcomtee_buffer in_msg; /* Inbound Buffer.  */
>> +	phys_addr_t in_msg_paddr; /* Physical addr of inbound buffer. */
>> +	struct qcomtee_buffer out_msg; /* Outbound Buffer. */
>> +	phys_addr_t out_msg_paddr; /* Physical addr of outbound buffer. */
>> +
>> +	/* Extra data attached to this context. */
>> +	void *data;
>> +};
>> +
>> +/**
>> + * qcomtee_object_do_invoke() - Submit an invocation for an object.
>> + * @oic: context to use for the current invocation.
>> + * @object: object being invoked.
>> + * @op: requested operation on the object.
>> + * @u: array of arguments for the current invocation.
>> + * @result: result returned from QTEE.
>> + *
>> + * The caller is responsible for keeping track of the refcount for each object,
>> + * including @object. On return, the caller loses ownership of all input
>> + * objects of type %QCOMTEE_OBJECT_TYPE_CB.
>> + *
>> + * @object can be of %QCOMTEE_OBJECT_TYPE_ROOT or %QCOMTEE_OBJECT_TYPE_TEE.
>> + *
>> + * Return: On success, returns 0. On error, returns -EAGAIN if invocation
>> + * failed and the user may retry the invocation, -ENODEV on fatal failure.
>> + */
>> +int qcomtee_object_do_invoke(struct qcomtee_object_invoke_ctx *oic,
>> +			     struct qcomtee_object *object, u32 op,
>> +			     struct qcomtee_arg *u, int *result);
>> +
>> +/**
>> + * struct qcomtee_object_operations - Callback object operations.
>> + * @release: release the object if QTEE is not using it.
>> + * @dispatch: dispatch the operation requested by QTEE.
>> + * @notify: report the status of any pending response submitted by @dispatch.
>> + */
>> +struct qcomtee_object_operations {
>> +	void (*release)(struct qcomtee_object *object);
>> +	int (*dispatch)(struct qcomtee_object_invoke_ctx *oic,
>> +			struct qcomtee_object *object, u32 op,
>> +			struct qcomtee_arg *args);
>> +	void (*notify)(struct qcomtee_object_invoke_ctx *oic,
>> +		       struct qcomtee_object *object, int err);
>> +};
>> +
>> +/**
>> + * struct qcomtee_object - QTEE or kernel object.
>> + * @name: object name.
>> + * @refcount: reference counter.
>> + * @object_type: object type as &enum qcomtee_object_type.
>> + * @info: extra information for the object.
>> + * @ops: callback operations for objects of type %QCOMTEE_OBJECT_TYPE_CB.
>> + * @work: work for async operations on the object.
>> + *
>> + * @work is used for releasing objects of %QCOMTEE_OBJECT_TYPE_TEE type.
>> + */
>> +struct qcomtee_object {
>> +	const char *name;
>> +	struct kref refcount;
>> +
>> +	enum qcomtee_object_type object_type;
>> +	union object_info {
>> +		unsigned long qtee_id;
>> +	} info;
>> +
>> +	struct qcomtee_object_operations *ops;
>> +	struct work_struct work;
>> +};
>> +
>> +/* Static instances of qcomtee_object objects. */
>> +#define NULL_QCOMTEE_OBJECT ((struct qcomtee_object *)(0))
>> +extern struct qcomtee_object qcomtee_object_root;
>> +#define ROOT_QCOMTEE_OBJECT (&qcomtee_object_root)
>> +
>> +static inline enum qcomtee_object_type
>> +typeof_qcomtee_object(struct qcomtee_object *object)
>> +{
>> +	if (object == NULL_QCOMTEE_OBJECT)
>> +		return QCOMTEE_OBJECT_TYPE_NULL;
>> +	return object->object_type;
>> +}
>> +
>> +static inline const char *qcomtee_object_name(struct qcomtee_object *object)
>> +{
>> +	if (object == NULL_QCOMTEE_OBJECT)
>> +		return "null";
>> +
>> +	if (!object->name)
>> +		return "no-name";
>> +	return object->name;
>> +}
>> +
>> +/**
>> + * qcomtee_object_user_init() - Initialize an object for the user.
>> + * @object: object to initialize.
>> + * @ot: type of object as &enum qcomtee_object_type.
>> + * @ops: instance of callbacks.
>> + * @fmt: name assigned to the object.
>> + *
>> + * Return: On success, returns 0; on failure, returns < 0.
>> + */
>> +int qcomtee_object_user_init(struct qcomtee_object *object,
>> +			     enum qcomtee_object_type ot,
>> +			     struct qcomtee_object_operations *ops,
>> +			     const char *fmt, ...);
>> +
>> +/* Object release is RCU protected. */
>> +int qcomtee_object_get(struct qcomtee_object *object);
>> +void qcomtee_object_put(struct qcomtee_object *object);
>> +
>> +#define qcomtee_arg_for_each(i, args) \
>> +	for (i = 0; args[i].type != QCOMTEE_ARG_TYPE_INV; i++)
> 
> Is seems a bit backward to search for a NIL element when you already
> know the length of the array.
> 

Sometimes num_params from TEE SS is availble at the same time when calling
qcomtee_arg_for_each, but in general args does not store number of elements
in the array.

>> +
>> +/* Next argument of type @type after index @i. */
>> +int qcomtee_next_arg_type(struct qcomtee_arg *u, int i,
>> +			  enum qcomtee_arg_type type);
>> +
>> +/* Iterate over argument of given type. */
>> +#define qcomtee_arg_for_each_type(i, args, at)              \
>> +	for (i = 0, i = qcomtee_next_arg_type(args, i, at); \
>> +	     args[i].type != QCOMTEE_ARG_TYPE_INV;          \
>> +	     i++, i = qcomtee_next_arg_type(args, i, at))
>> +
>> +#define qcomtee_arg_for_each_input_buffer(i, args) \
>> +	qcomtee_arg_for_each_type(i, args, QCOMTEE_ARG_TYPE_IB)
>> +#define qcomtee_arg_for_each_output_buffer(i, args) \
>> +	qcomtee_arg_for_each_type(i, args, QCOMTEE_ARG_TYPE_OB)
>> +#define qcomtee_arg_for_each_input_object(i, args) \
>> +	qcomtee_arg_for_each_type(i, args, QCOMTEE_ARG_TYPE_IO)
>> +#define qcomtee_arg_for_each_output_object(i, args) \
>> +	qcomtee_arg_for_each_type(i, args, QCOMTEE_ARG_TYPE_OO)
>> +
>> +#endif /* __QCOM_TEE_H */
>> diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
>> index 0aef647d4a34..c5584ade4915 100644
>> --- a/include/uapi/linux/tee.h
>> +++ b/include/uapi/linux/tee.h
>> @@ -59,6 +59,7 @@
>>  #define TEE_IMPL_ID_OPTEE	1
>>  #define TEE_IMPL_ID_AMDTEE	2
>>  #define TEE_IMPL_ID_TSTEE	3
>> +#define TEE_IMPL_ID_QTEE	4
>>  
>>  /*
>>   * OP-TEE specific capabilities
>>
>> -- 
>> 2.34.1
>>

Thank you so much Jens for the comments.

Best Regards,
Amir



