Return-Path: <linux-arm-msm+bounces-52495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8337A70E84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 02:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4ECE3B2734
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 01:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DDF1DA53;
	Wed, 26 Mar 2025 01:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TmUjF9g9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DCC101EE;
	Wed, 26 Mar 2025 01:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742952968; cv=none; b=Cy5WE6tVhTzexG137wIDT7uC4gjTwqbtigK2ECycT2ibbRj6xUCtOsL1dk/nAXTXusKbUzpstqNThr2uJ/Ij86XQ38GBy1Hi/qRvRYHGFDLWCuPucLzQrOrapt6MSrnQX40CYYSD82YtONPxQ8vakKTWVn1BdwOxLcenEDs7nqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742952968; c=relaxed/simple;
	bh=Ueklswh6cpWHmwhiDuYH0Da5EH5TzycaDC3/z6Zynyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=myr3lxL2BQY0KiZt6sW/lEQCnDKWDisNG0gR0lrK4lHQMSgbch1ayHnx3bqfatK0Qr7eg/hO24xiHbd8SZmm9rHgilixIB9ofh4DmKDK7lRIyEiztpeMF4bojneuIr55/HvzECelGXRsDrBaNX8F+2iflV6amQaBFRgJwnVMy3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TmUjF9g9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PGaWHL000689;
	Wed, 26 Mar 2025 01:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r9nmQL23ivlYWkMuuhEsInlxXMxWdB7wqCjnPxosCPU=; b=TmUjF9g9x0VMtZqP
	SU0E5x9BibXvqYEmgl1kYqnBW/3YZKY0scO1QGTpEnUabA/FGa6a0m92ZeXk+NWK
	aoJS1KcrPUGjw5T7FsO9rbjoVU83fojRWzWeND0cGFlzeY2QMBoi2zPNaTyXwqfv
	EJwmUREuljKm0D7soboU9atRfeq1zfMFGWyL1X2ISL8ii9mjow/QHPXcDaNGGEsy
	5IpB8hjZ6EYCY3HkTubt4OY065fykUrBSz1yIH6Ppfy6Eu+brwegwrpg8FvINfi1
	n4FtdpiIjyXlo8npkSrtnFGagyDggLnq+LpBDJFjgIFXeXvW/LtG2VcWh0OQ5whg
	ATTPeQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hmhk9kej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 01:35:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52Q1Zkwm006500
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 01:35:46 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Mar
 2025 18:35:41 -0700
Message-ID: <292cb9e4-36ed-48ff-b9b9-30eb384dc6f0@quicinc.com>
Date: Wed, 26 Mar 2025 09:35:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] coresight: ctcu: Enable byte-cntr for TMC ETR
 devices
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250310090407.2069489-1-quic_jiegan@quicinc.com>
 <20250310090407.2069489-4-quic_jiegan@quicinc.com>
 <7a65353d-aa18-4c63-abb9-46344de35fc4@arm.com>
 <2eb8a3fd-0366-4873-8536-644ce3684251@quicinc.com>
 <4de623e7-0404-46aa-ad39-65615b8ac79d@arm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <4de623e7-0404-46aa-ad39-65615b8ac79d@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=C4PpyRP+ c=1 sm=1 tr=0 ts=67e359f3 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=jMf_ItUGNqpdMulWp6gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ocSOlM_abnyBTKsVbfr-RfbS4oLQDr18
X-Proofpoint-ORIG-GUID: ocSOlM_abnyBTKsVbfr-RfbS4oLQDr18
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260008



On 3/15/2025 1:33 AM, Suzuki K Poulose wrote:
> On 14/03/2025 01:59, Jie Gan wrote:
>>
>>
>> On 3/14/2025 12:24 AM, Suzuki K Poulose wrote:
>>> On 10/03/2025 09:04, Jie Gan wrote:
>>>> The byte-cntr function provided by the CTCU device is used to 
>>>> transfer data
>>>> from the ETR buffer to the userspace. An interrupt is triggered if 
>>>> the data
>>>
>>> Why do we need a new device to transfer the data to userspace ?
>>
>> Hi Suzuki Mike,
>>
>> The purpose of the byte-cntr is for live debugging, allowing trace 
>> data to be read while the ETR is running and preventing the required 
>> trace data from being overwritten before output.
>>
>> I realized that I forgot to introduce the function of the BYTECNTRCTL 
>> register.
>>
>> There is a big concern that reading the etr_buf while the ETR is 
>> running is unsafe because the etr_buf is not synced, am right?
> 
> Unsafe to read the buffer, written to by the ETR.

Hi Suzuki,

I have confirmed the behavior of BYTECNTRVAL register internally.

The portion of trace data is safe to read from the etr_buf when the 
interrupt is triggered.
For example, if the threshold for the BYTECNTRVAL register is 0x10000.
This portion of trace data(0x10000) is confirmed to be already in the 
buffer and ready to read when the interrupt is triggered.

I also did following verification about 30 times:

1. Configure the buffer size of the etr as large as possible to avoid 
overwrite for the experiment, e.g, I configured 0x1000000.

2. Read the trace data via byte-cntr with current solution from etr_buf 
and save it in a file: file_byte_cntr.bin.

3. Stop the trace(stop source and etr devices), read the trace data of 
the whole etr_buf, and save it in a file: file_etr.bin

-rw-r--r--    1 root     root      13749968 Apr 28 17:45 file_byte_cntr.bin
-rw-r--r--    1 root     root      13765328 Apr 28 17:46 file_etr.bin

The size of file_byte_cntr.bin should be less than file_etr.bin and the 
data in file_byte_cntr.bin should exactly match a part of the data in 
file_etr.bin continuously from a random point in the file_etr.bin to the 
end of the file.

The byte-cntr read starts at a random point of the tracing, so some of 
the data from the beginning is useless when we parse the data.

> 
>>
>> As I mentioned, we need program a value to the BYTECNTRCTL register. 
>> The hardware will count the bytes of the trace data that are routed to 
>> RAM(etr_buf).
>>
>> The interrupt will be trigger once the counted bytes exceed the 
>> programmed value. Based on this concept, we can confirm this part of 
>> trace data is already in the etr_buf and is safe to read. So, it's 
>> safe for the read function only read this part of trace data in one 
>> shot(unlike tmc_read, the whole synced etr_buf).
> 
> Since the ETR is used in CIRCULAR buffer mode, what is the guarantee
> that it is not overwritten while you are reading ?

We cannot 100% guarantee there is no overwrite happened while reading 
the buffer. But by using a large buffer_size and ensuring the threshold 
for the byte-cntr is less than the buffer_size, we can mitigate this 
issue(this behavior aims to enture that no overwrite occurs for the 
portion of data before the the read function completes.)

The byte-cntr should read the trace data from the etr_buf as soon as 
possible when the interrupt is triggered(via IRQ count and a workqueue).

> 
>>
>> That's how we expect the byte-cntr to work when reading the trace data 
>> from the etr_buf while the etr is running.
> 
> We understood the functionality of byte-counter, but we think :
> 
> 1. What you are doing is not safe. ETR can overwrite while you may be 
> reading.

I agree with you. We need to ensure that the solution is safe for 
reading the buffer.

> 2. Adding another "character" file to expose the "same" data.

Discarded the new "char" file. I integrated the read function of 
byte-cntr with current ETR's file_operation.

The new behavior likes:
1. when BYTECNTRCTL register is configured, the read behavior for 
tmc_read functions as byte-cntr behavior.

2. when BYTECNTRCTL register is disabled, the read behavior for tmc_read 
functions as its original behavior.

I will send this solution with V2 if it is acceptable.

> 
> What we would like to see :
> 
> 1. Solve the problem of ETR writing into the etr_buf, while you are
> copying it. This could be via:
> 
> a. Stop the ETR while you are copying the buffer
>   OR
> b. Split the "buffer" available for ETR to two or more parts, limiting
>     the ETR to only allowing writing to one part. On interrupt, disable
>     the interrupt, and modify the ETR to use the next part. Now you can
>     safely expose the "finished" part to the user.
> 
> 2. Don't add another file. Use the existing one.

Sure, please refer to my earlier comment in this message.

Thanks,
Jie

> 
>>
>> This also explains why we need a separate dev node to manage the read 
>> function for byte-cntr.
> 
> No, you don't.
> 
> 
> Suzuki
> 
> 
>>
>> Thanks,
>> Jie
>>
>>
>>>
>>>> size exceeds the threshold set in the BYTECNTRVAL register. The 
>>>> interrupt
>>>> handler counts the number of triggered interruptions and the read 
>>>> function
>>>> will read the data from the ETR buffer if the IRQ count is greater 
>>>> than 0.
>>>> Each successful read process will decrement the IRQ count by 1.
>>>
>>> Having an interrupt is good, but see below.
>>>
>>>>
>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>> ---
>>>>   drivers/hwtracing/coresight/Makefile          |   2 +-
>>>>   .../coresight/coresight-ctcu-byte-cntr.c      | 339 ++++++++++++++ 
>>>> ++++
>>>>   .../hwtracing/coresight/coresight-ctcu-core.c |  96 ++++-
>>>>   drivers/hwtracing/coresight/coresight-ctcu.h  |  59 ++-
>>>>   .../hwtracing/coresight/coresight-tmc-etr.c   |   5 +-
>>>>   drivers/hwtracing/coresight/coresight-tmc.h   |   2 +
>>>>   6 files changed, 493 insertions(+), 10 deletions(-)
>>>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu- 
>>>> byte- cntr.c
>>>>
>>>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/ 
>>>> hwtracing/ coresight/Makefile
>>>> index 8e62c3150aeb..c90a06768a18 100644
>>>> --- a/drivers/hwtracing/coresight/Makefile
>>>> +++ b/drivers/hwtracing/coresight/Makefile
>>>> @@ -52,4 +52,4 @@ coresight-cti-y := coresight-cti-core.o coresight- 
>>>> cti-platform.o \
>>>>   obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>>>>   obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>>>>   obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
>>>> -coresight-ctcu-y := coresight-ctcu-core.o
>>>> +coresight-ctcu-y := coresight-ctcu-core.o coresight-ctcu-byte-cntr.o
>>>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c 
>>>> b/ drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>>>> new file mode 100644
>>>> index 000000000000..0d16385663f5
>>>> --- /dev/null
>>>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>>>> @@ -0,0 +1,339 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights 
>>>> reserved.
>>>> + */
>>>> +
>>>> +#include <linux/coresight.h>
>>>> +#include <linux/device.h>
>>>> +#include <linux/dma-mapping.h>
>>>> +#include <linux/fs.h>
>>>> +#include <linux/interrupt.h>
>>>> +#include <linux/of_irq.h>
>>>> +#include <linux/property.h>
>>>> +#include <linux/uaccess.h>
>>>> +
>>>> +#include "coresight-ctcu.h"
>>>> +#include "coresight-priv.h"
>>>> +#include "coresight-tmc.h"
>>>> +
>>>> +#define BYTE_CNTR_CLASS_STR "byte-cntr-class"
>>>> +
>>>> +static struct class *byte_cntr_class;
>>>> +static dev_t byte_cntr_base;
>>>> +
>>>> +static irqreturn_t byte_cntr_handler(int irq, void *data)
>>>> +{
>>>> +    struct ctcu_byte_cntr *byte_cntr_data = (struct ctcu_byte_cntr 
>>>> *)data;
>>>> +
>>>> +    atomic_inc(&byte_cntr_data->irq_cnt);
>>>> +    wake_up(&byte_cntr_data->wq);
>>>> +
>>>> +    return IRQ_HANDLED;
>>>> +}
>>>> +
>>>> +/* Read the data from ETR's DDR buffer. */
>>>> +static void __ctcu_byte_cntr_read_etr_bytes(struct ctcu_byte_cntr 
>>>> *byte_cntr_data,
>>>> +                        size_t *len, char **bufp)
>>>> +{
>>>> +    struct tmc_drvdata *tmcdrvdata = 
>>>> dev_get_drvdata(byte_cntr_data- >sink->dev.parent);
>>>> +    size_t actual, bytes = byte_cntr_data->thresh_val;
>>>> +    struct etr_buf *etr_buf = tmcdrvdata->sysfs_buf;
>>>> +    long r_offset;
>>>> +
>>>> +    guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
>>>> +    r_offset = byte_cntr_data->r_offset;
>>>> +    if (*len >= bytes)
>>>> +        *len = bytes;
>>>> +    else if ((r_offset % bytes) + *len > bytes)
>>>> +        *len = bytes - (r_offset % bytes);
>>>> +
>>>> +    actual = tmc_etr_buf_get_data(etr_buf, r_offset, *len, bufp);
>>>> +    *len = actual;
>>>> +    if (actual == bytes || (actual + r_offset) % bytes == 0)
>>>> +        atomic_dec(&byte_cntr_data->irq_cnt);
>>>> +}
>>>> +
>>>
>>> How can you safely read the ETR data while it is running ? You should
>>> stop the ETR and then provide the data. You could potentially do things
>>> like split the ETR buffer into two halves and switch the half used by
>>> the ETR on interrupt and expose this to user.
>>>
>>>
>>>> +/* Flush the remaining data in the ETR buffer after the byte cntr 
>>>> has stopped. */
>>>> +static ssize_t ctcu_flush_etr_buffer(struct ctcu_byte_cntr 
>>>> *byte_cntr_data, size_t len,
>>>> +                     char **bufpp)
>>>> +{
>>>> +    struct tmc_drvdata *tmcdrvdata = 
>>>> dev_get_drvdata(byte_cntr_data- >sink->dev.parent);
>>>> +    struct etr_buf *etr_buf = tmcdrvdata->sysfs_buf;
>>>> +    ssize_t read_len = 0, remaining_len;
>>>> +    long r_offset, w_offset;
>>>> +
>>>> +    guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
>>>> +    r_offset = byte_cntr_data->r_offset;
>>>> +    w_offset = byte_cntr_data->w_offset;
>>>> +    if (w_offset < r_offset)
>>>> +        remaining_len = tmcdrvdata->size + w_offset - r_offset;
>>>> +    else
>>>> +        remaining_len = w_offset - r_offset;
>>>> +
>>>> +    if (remaining_len > len)
>>>> +        remaining_len = len;
>>>> +
>>>> +    if (remaining_len > 0)
>>>> +        read_len = tmc_etr_buf_get_data(etr_buf, r_offset, 
>>>> remaining_len, bufpp);
>>>> +
>>>> +    return read_len;
>>>> +}
>>>> +
>>>> +static ssize_t ctcu_byte_cntr_copy_data(char __user *data, size_t 
>>>> len, char *bufp,
>>>> +                    struct ctcu_byte_cntr *byte_cntr_data,
>>>> +                    struct tmc_drvdata *tmcdrvdata)
>>>> +{
>>>> +    guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
>>>> +    if (copy_to_user(data, bufp, len))
>>>> +        return -EFAULT;
>>>> +
>>>> +    byte_cntr_data->total_size += len;
>>>> +    if (byte_cntr_data->r_offset + len >= tmcdrvdata->size)
>>>> +        byte_cntr_data->r_offset = 0;
>>>> +    else
>>>> +        byte_cntr_data->r_offset += len;
>>>> +
>>>> +    return len;
>>>> +}
>>>> +
>>>> +/* The read function for /dev/byte-cntr%d */
>>>
>>> WHY ? WHY can't the data be exported by the existing /dev/tmc_etr* ?
>>>
>>>> +static ssize_t ctcu_byte_cntr_read_etr_bytes(struct file *fp, char 
>>>> __user *data,
>>>> +                         size_t len, loff_t *ppos)
>>>> +{
>>>> +    struct ctcu_byte_cntr *byte_cntr_data = fp->private_data;
>>>> +    struct tmc_drvdata *tmcdrvdata = 
>>>> dev_get_drvdata(byte_cntr_data- >sink->dev.parent);
>>>> +    char *bufp = NULL;
>>>> +    ssize_t read_len;
>>>> +
>>>> +    if (!data)
>>>> +        return -EINVAL;
>>>> +
>>>> +    /*
>>>> +     * Flush the remaining data in the ETR buffer based on the write
>>>> +     * offset of the ETR buffer when the byte cntr function has 
>>>> stopped.
>>>> +     */
>>>> +    if (!byte_cntr_data->read_active || !byte_cntr_data->enable) {
>>>> +        read_len = ctcu_flush_etr_buffer(byte_cntr_data, len, &bufp);
>>>> +        if (read_len > 0)
>>>> +            return ctcu_byte_cntr_copy_data(data, read_len, bufp,
>>>> +                            byte_cntr_data, tmcdrvdata);
>>>> +
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    if (!atomic_read(&byte_cntr_data->irq_cnt)) {
>>>> +        if (wait_event_interruptible(byte_cntr_data->wq,
>>>> +                         atomic_read(&byte_cntr_data->irq_cnt) > 0 ||
>>>> +                         !byte_cntr_data->enable))
>>>> +            return -ERESTARTSYS;
>>>> +    }
>>>> +
>>>> +    __ctcu_byte_cntr_read_etr_bytes(byte_cntr_data, &len, &bufp);
>>>> +
>>>> +    return ctcu_byte_cntr_copy_data(data, len, bufp, 
>>>> byte_cntr_data, tmcdrvdata);
>>>> +}
>>>
>>> Could we not plug this into TMC-ETR read ?
>>>
>>> NAK for a special file approach. As Mike mentioned you need to make 
>>> sure we are doing this safely.
>>>
>>> Suzuki
>>>
>>>
>>>
>>>> +
>>>> +/* Start the byte-cntr function when the path is enabled. */
>>>> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct 
>>>> coresight_path *path)
>>>> +{
>>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>>> +    struct coresight_device *sink = coresight_get_sink(path);
>>>> +    struct ctcu_byte_cntr *byte_cntr_data;
>>>> +    int port_num;
>>>> +
>>>> +    if (!sink)
>>>> +        return;
>>>> +
>>>> +    port_num = ctcu_get_active_port(sink, csdev);
>>>> +    if (port_num < 0)
>>>> +        return;
>>>> +
>>>> +    byte_cntr_data = &drvdata->byte_cntr_data[port_num];
>>>> +    /* Don't start byte-cntr function when threshold is not set. */
>>>> +    if (!byte_cntr_data->thresh_val)
>>>> +        return;
>>>> +
>>>> +    guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
>>>> +    atomic_set(&byte_cntr_data->irq_cnt, 0);
>>>> +    byte_cntr_data->sink = sink;
>>>> +    byte_cntr_data->enable = true;
>>>> +}
>>>> +
>>>> +/* Stop the byte-cntr function when the path is disabled. */
>>>> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct 
>>>> coresight_path *path)
>>>> +{
>>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>>>> +    struct coresight_device *sink = coresight_get_sink(path);
>>>> +    struct ctcu_byte_cntr *byte_cntr_data;
>>>> +    struct tmc_drvdata *tmcdrvdata;
>>>> +    int port_num;
>>>> +
>>>> +    if (!sink)
>>>> +        return;
>>>> +
>>>> +    port_num = ctcu_get_active_port(sink, csdev);
>>>> +    if (port_num < 0)
>>>> +        return;
>>>> +
>>>> +    byte_cntr_data = &drvdata->byte_cntr_data[port_num];
>>>> +    tmcdrvdata = dev_get_drvdata(byte_cntr_data->sink->dev.parent);
>>>> +
>>>> +    guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
>>>> +    /* Store the w_offset of the ETR buffer when stopping. */
>>>> +    byte_cntr_data->w_offset = tmc_get_rwp_offset(tmcdrvdata);
>>>> +    atomic_set(&byte_cntr_data->irq_cnt, 0);
>>>> +    byte_cntr_data->read_active = false;
>>>> +    byte_cntr_data->enable = false;
>>>> +    /*
>>>> +     * Wakeup once to force the read function to read the remaining
>>>> +     * data of the ETR buffer.
>>>> +     */
>>>> +    wake_up(&byte_cntr_data->wq);
>>>> +}
>>>> +
>>>> +static int ctcu_byte_cntr_release(struct inode *in, struct file *fp)
>>>> +{
>>>> +    struct ctcu_byte_cntr *byte_cntr_data = fp->private_data;
>>>> +    struct device *dev = &byte_cntr_data->sink->dev;
>>>> +
>>>> +    guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
>>>> +    atomic_set(&byte_cntr_data->irq_cnt, 0);
>>>> +    byte_cntr_data->read_active = false;
>>>> +    disable_irq_wake(byte_cntr_data->byte_cntr_irq);
>>>> +    dev_dbg(dev, "send data total size: %llu bytes, r_offset: %ld 
>>>> w_offset: %ld\n",
>>>> +        byte_cntr_data->total_size, byte_cntr_data->r_offset,
>>>> +        byte_cntr_data->w_offset);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int ctcu_byte_cntr_open(struct inode *in, struct file *fp)
>>>> +{
>>>> +    struct ctcu_byte_cntr *byte_cntr_data = container_of(in->i_cdev,
>>>> +                                 struct ctcu_byte_cntr, c_dev);
>>>> +    struct tmc_drvdata *tmcdrvdata;
>>>> +
>>>> +    if (byte_cntr_data->read_active)
>>>> +        return -EBUSY;
>>>> +
>>>> +    if (!byte_cntr_data->thresh_val || !byte_cntr_data->sink ||
>>>> +        (coresight_get_mode(byte_cntr_data->sink) !=  CS_MODE_SYSFS))
>>>> +        return -EINVAL;
>>>> +
>>>> +    guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
>>>> +    enable_irq_wake(byte_cntr_data->byte_cntr_irq);
>>>> +    fp->private_data = byte_cntr_data;
>>>> +    nonseekable_open(in, fp);
>>>> +    tmcdrvdata = dev_get_drvdata(byte_cntr_data->sink->dev.parent);
>>>> +    /*
>>>> +     * The original r_offset is the w_offset of the ETR buffer at the
>>>> +     * start of the byte-cntr.
>>>> +     */
>>>> +    byte_cntr_data->r_offset = tmc_get_rwp_offset(tmcdrvdata);
>>>> +    byte_cntr_data->total_size = 0;
>>>> +    byte_cntr_data->read_active = true;
>>>> +    byte_cntr_data->enable = true;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static const struct file_operations byte_cntr_fops = {
>>>> +    .owner        = THIS_MODULE,
>>>> +    .open        = ctcu_byte_cntr_open,
>>>> +    .read        = ctcu_byte_cntr_read_etr_bytes,
>>>> +    .release    = ctcu_byte_cntr_release,
>>>> +};
>>>> +
>>>> +static int ctcu_byte_cntr_register_chardev(struct ctcu_byte_cntr 
>>>> *byte_cntr_data,
>>>> +                       int port_num)
>>>> +{
>>>> +    struct device *device;
>>>> +    dev_t devt;
>>>> +    int ret;
>>>> +
>>>> +    cdev_init(&byte_cntr_data->c_dev, &byte_cntr_fops);
>>>> +    devt = MKDEV(MAJOR(byte_cntr_base), MINOR(byte_cntr_base) + 
>>>> port_num);
>>>> +    ret = cdev_add(&byte_cntr_data->c_dev, devt, 1);
>>>> +    if (ret < 0)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    device = device_create(byte_cntr_class, NULL, devt, 
>>>> byte_cntr_data,
>>>> +                   byte_cntr_data->name);
>>>> +
>>>> +    if (IS_ERR(device))
>>>> +        return -ENOMEM;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static void ctcu_byte_cntr_unregister_chardev(struct ctcu_drvdata 
>>>> *drvdata)
>>>> +{
>>>> +    struct ctcu_byte_cntr *byte_cntr_data;
>>>> +    int i;
>>>> +
>>>> +    for (i = 0; i < ETR_MAX_NUM; i++) {
>>>> +        byte_cntr_data = &drvdata->byte_cntr_data[i];
>>>> +        device_destroy(byte_cntr_class, byte_cntr_data->c_dev.dev);
>>>> +    }
>>>> +}
>>>> +
>>>> +int ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata 
>>>> *drvdata, int etr_num)
>>>> +{
>>>> +    struct ctcu_byte_cntr *byte_cntr_data;
>>>> +    struct device_node *nd = dev->of_node;
>>>> +    int byte_cntr_irq, ret, i;
>>>> +
>>>> +    ret = alloc_chrdev_region(&byte_cntr_base, 0, ETR_MAX_NUM, 
>>>> BYTE_CNTR_CLASS_STR);
>>>> +    if (ret < 0)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    byte_cntr_class = class_create(BYTE_CNTR_CLASS_STR);
>>>> +    if (IS_ERR(byte_cntr_class)) {
>>>> +        unregister_chrdev_region(byte_cntr_base, ETR_MAX_NUM);
>>>> +        return -ENOMEM;
>>>> +    }
>>>> +
>>>> +    for (i = 0; i < etr_num; i++) {
>>>> +        byte_cntr_data = &drvdata->byte_cntr_data[i];
>>>> +        byte_cntr_irq = of_irq_get_byname(nd, byte_cntr_data- 
>>>> >irq_name);
>>>> +        if (byte_cntr_irq < 0) {
>>>> +            ret = byte_cntr_irq;
>>>> +            goto err_exit;
>>>> +        }
>>>> +
>>>> +        ret = devm_request_irq(dev, byte_cntr_irq, byte_cntr_handler,
>>>> +                       IRQF_TRIGGER_RISING | IRQF_SHARED,
>>>> +                       dev_name(dev), byte_cntr_data);
>>>> +        if (ret) {
>>>> +            dev_err(dev, "Failed to register IRQ for %s\n",
>>>> +                byte_cntr_data->name);
>>>> +            goto err_exit;
>>>> +        }
>>>> +
>>>> +        ret = ctcu_byte_cntr_register_chardev(byte_cntr_data, i);
>>>> +        if (ret) {
>>>> +            dev_err(dev, "Failed to register chardev for %s\n",
>>>> +                byte_cntr_data->name);
>>>> +            goto err_exit;
>>>> +        }
>>>> +
>>>> +        byte_cntr_data->byte_cntr_irq = byte_cntr_irq;
>>>> +        atomic_set(&byte_cntr_data->irq_cnt, 0);
>>>> +        init_waitqueue_head(&byte_cntr_data->wq);
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +
>>>> +err_exit:
>>>> +    ctcu_byte_cntr_unregister_chardev(drvdata);
>>>> +    class_destroy(byte_cntr_class);
>>>> +    unregister_chrdev_region(byte_cntr_base, ETR_MAX_NUM);
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +void ctcu_byte_cntr_remove(struct ctcu_drvdata *drvdata)
>>>> +{
>>>> +    ctcu_byte_cntr_unregister_chardev(drvdata);
>>>> +    class_destroy(byte_cntr_class);
>>>> +    unregister_chrdev_region(byte_cntr_base, ETR_MAX_NUM);
>>>> +}
>>>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/ 
>>>> drivers/hwtracing/coresight/coresight-ctcu-core.c
>>>> index da35d8b4d579..5782655a5f39 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
>>>> @@ -46,16 +46,24 @@ DEFINE_CORESIGHT_DEVLIST(ctcu_devs, "ctcu");
>>>>   #define CTCU_ATID_REG_BIT(traceid)    (traceid % 32)
>>>>   #define CTCU_ATID_REG_SIZE        0x10
>>>>   #define CTCU_ETR0_ATID0            0xf8
>>>> +#define CTCU_ETR0_IRQCTRL        0x6c
>>>>   #define CTCU_ETR1_ATID0            0x108
>>>> +#define CTCU_ETR1_IRQCTRL        0x70
>>>>   static const struct ctcu_etr_config sa8775p_etr_cfgs[] = {
>>>>       {
>>>> -        .atid_offset    = CTCU_ETR0_ATID0,
>>>> -        .port_num    = 0,
>>>> +        .atid_offset        = CTCU_ETR0_ATID0,
>>>> +        .irq_ctrl_offset    = CTCU_ETR0_IRQCTRL,
>>>> +        .irq_name        = "etr0",
>>>> +        .byte_cntr_name        = "byte-cntr0",
>>>> +        .port_num        = 0,
>>>>       },
>>>>       {
>>>> -        .atid_offset    = CTCU_ETR1_ATID0,
>>>> -        .port_num    = 1,
>>>> +        .atid_offset        = CTCU_ETR1_ATID0,
>>>> +        .irq_ctrl_offset    = CTCU_ETR1_IRQCTRL,
>>>> +        .irq_name        = "etr1",
>>>> +        .byte_cntr_name        = "byte-cntr1",
>>>> +        .port_num        = 1,
>>>>       },
>>>>   };
>>>> @@ -64,6 +72,69 @@ static const struct ctcu_config sa8775p_cfgs = {
>>>>       .num_etr_config    = ARRAY_SIZE(sa8775p_etr_cfgs),
>>>>   };
>>>> +static ssize_t byte_cntr_val_show(struct device *dev, struct 
>>>> device_attribute *attr,
>>>> +                  char *buf)
>>>> +{
>>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>>> +    int i, len = 0;
>>>> +
>>>> +    for (i = 0; i < ETR_MAX_NUM; i++) {
>>>> +        if (drvdata->byte_cntr_data[i].irq_ctrl_offset)
>>>> +            len += scnprintf(buf + len, PAGE_SIZE - len, "%u ",
>>>> +                     drvdata->byte_cntr_data[i].thresh_val);
>>>> +    }
>>>> +
>>>> +    len += scnprintf(buf + len, PAGE_SIZE - len, "\n");
>>>> +
>>>> +    return len;
>>>> +}
>>>> +
>>>> +static ssize_t byte_cntr_val_store(struct device *dev, struct 
>>>> device_attribute *attr,
>>>> +                   const char *buf, size_t size)
>>>> +{
>>>> +    struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
>>>> +    u32 thresh_vals[ETR_MAX_NUM] = { 0 };
>>>> +    u32 irq_ctrl_offset;
>>>> +    int num, i;
>>>> +
>>>> +    num = sscanf(buf, "%i %i", &thresh_vals[0], &thresh_vals[1]);
>>>> +    if (num <= 0 || num > ETR_MAX_NUM)
>>>> +        return -EINVAL;
>>>> +
>>>> +    /* Threshold 0 disables the interruption. */
>>>> +    guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
>>>> +    for (i = 0; i < num; i++) {
>>>> +        /* A small threshold will result in a large number of 
>>>> interruptions */
>>>> +        if (thresh_vals[i] && thresh_vals[i] < 4096)
>>>> +            return -EINVAL;
>>>> +
>>>> +        if (drvdata->byte_cntr_data[i].irq_ctrl_offset) {
>>>> +            drvdata->byte_cntr_data[i].thresh_val = thresh_vals[i];
>>>> +            irq_ctrl_offset = drvdata- 
>>>> >byte_cntr_data[i].irq_ctrl_offset;
>>>> +            CS_UNLOCK(drvdata->base);
>>>> +            writel_relaxed(thresh_vals[i], drvdata->base + 
>>>> irq_ctrl_offset);
>>>> +            CS_LOCK(drvdata->base);
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return size;
>>>> +}
>>>> +static DEVICE_ATTR_RW(byte_cntr_val);
>>>> +
>>>> +static struct attribute *ctcu_attrs[] = {
>>>> +    &dev_attr_byte_cntr_val.attr,
>>>> +    NULL,
>>>> +};
>>>> +
>>>> +static struct attribute_group ctcu_attr_grp = {
>>>> +    .attrs = ctcu_attrs,
>>>> +};
>>>> +
>>>> +static const struct attribute_group *ctcu_attr_grps[] = {
>>>> +    &ctcu_attr_grp,
>>>> +    NULL,
>>>> +};
>>>> +
>>>>   static void ctcu_program_atid_register(struct ctcu_drvdata 
>>>> *drvdata, u32 reg_offset,
>>>>                          u8 bit, bool enable)
>>>>   {
>>>> @@ -122,7 +193,7 @@ static int __ctcu_set_etr_traceid(struct 
>>>> coresight_device *csdev, u8 traceid, in
>>>>    * Searching the sink device from helper's view in case there are 
>>>> multiple helper devices
>>>>    * connected to the sink device.
>>>>    */
>>>> -static int ctcu_get_active_port(struct coresight_device *sink, 
>>>> struct coresight_device *helper)
>>>> +int ctcu_get_active_port(struct coresight_device *sink, struct 
>>>> coresight_device *helper)
>>>>   {
>>>>       struct coresight_platform_data *pdata = helper->pdata;
>>>>       int i;
>>>> @@ -160,6 +231,8 @@ static int ctcu_enable(struct coresight_device 
>>>> *csdev, enum cs_mode mode, void *
>>>>   {
>>>>       struct coresight_path *path = (struct coresight_path *)data;
>>>> +    ctcu_byte_cntr_start(csdev, path);
>>>> +
>>>>       return ctcu_set_etr_traceid(csdev, path, true);
>>>>   }
>>>> @@ -167,6 +240,8 @@ static int ctcu_disable(struct coresight_device 
>>>> *csdev, void *data)
>>>>   {
>>>>       struct coresight_path *path = (struct coresight_path *)data;
>>>> +    ctcu_byte_cntr_stop(csdev, path);
>>>> +
>>>>       return ctcu_set_etr_traceid(csdev, path, false);
>>>>   }
>>>> @@ -188,7 +263,7 @@ static int ctcu_probe(struct platform_device *pdev)
>>>>       const struct ctcu_config *cfgs;
>>>>       struct ctcu_drvdata *drvdata;
>>>>       void __iomem *base;
>>>> -    int i;
>>>> +    int ret, i;
>>>>       desc.name = coresight_alloc_device_name(&ctcu_devs, dev);
>>>>       if (!desc.name)
>>>> @@ -217,7 +292,14 @@ static int ctcu_probe(struct platform_device 
>>>> *pdev)
>>>>               for (i = 0; i < cfgs->num_etr_config; i++) {
>>>>                   etr_cfg = &cfgs->etr_cfgs[i];
>>>>                   drvdata->atid_offset[i] = etr_cfg->atid_offset;
>>>> +                drvdata->byte_cntr_data[i].irq_name = etr_cfg- 
>>>> >irq_name;
>>>> +                drvdata->byte_cntr_data[i].name = etr_cfg- 
>>>> >byte_cntr_name;
>>>> +                drvdata->byte_cntr_data[i].irq_ctrl_offset =
>>>> +                    etr_cfg->irq_ctrl_offset;
>>>>               }
>>>> +            ret = ctcu_byte_cntr_init(dev, drvdata, cfgs- 
>>>> >num_etr_config);
>>>> +            if (ret < 0)
>>>> +                dev_warn(dev, "Byte cntr init failed\n");
>>>>           }
>>>>       }
>>>> @@ -229,6 +311,7 @@ static int ctcu_probe(struct platform_device *pdev)
>>>>       desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU;
>>>>       desc.pdata = pdata;
>>>>       desc.dev = dev;
>>>> +    desc.groups = ctcu_attr_grps;
>>>>       desc.ops = &ctcu_ops;
>>>>       desc.access = CSDEV_ACCESS_IOMEM(base);
>>>> @@ -247,6 +330,7 @@ static void ctcu_remove(struct platform_device 
>>>> *pdev)
>>>>   {
>>>>       struct ctcu_drvdata *drvdata = platform_get_drvdata(pdev);
>>>> +    ctcu_byte_cntr_remove(drvdata);
>>>>       coresight_unregister(drvdata->csdev);
>>>>   }
>>>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/ 
>>>> hwtracing/coresight/coresight-ctcu.h
>>>> index e9594c38dd91..e38535c91090 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-ctcu.h
>>>> +++ b/drivers/hwtracing/coresight/coresight-ctcu.h
>>>> @@ -5,6 +5,8 @@
>>>>   #ifndef _CORESIGHT_CTCU_H
>>>>   #define _CORESIGHT_CTCU_H
>>>> +#include <linux/cdev.h>
>>>> +
>>>>   #include "coresight-trace-id.h"
>>>>   /* Maximum number of supported ETR devices for a single CTCU. */
>>>> @@ -13,10 +15,16 @@
>>>>   /**
>>>>    * struct ctcu_etr_config
>>>>    * @atid_offset:    offset to the ATID0 Register.
>>>> - * @port_num:        in-port number of CTCU device that connected 
>>>> to ETR.
>>>> + * @irq_ctrl_offset:    offset to the BYTECNTRVAL register.
>>>> + * @irq_name:        IRQ name in dt node.
>>>> + * @byte_cntr_name:    name of the byte cntr device node.
>>>> + * @port_num:        in-port number of the CTCU device that 
>>>> connected to ETR.
>>>>    */
>>>>   struct ctcu_etr_config {
>>>>       const u32 atid_offset;
>>>> +    const u32 irq_ctrl_offset;
>>>> +    const char *irq_name;
>>>> +    const char *byte_cntr_name;
>>>>       const u32 port_num;
>>>>   };
>>>> @@ -25,15 +33,64 @@ struct ctcu_config {
>>>>       int num_etr_config;
>>>>   };
>>>> +/**
>>>> + * struct ctcu_byte_cntr
>>>> + * @c_dev:        cdev for byte_cntr.
>>>> + * @sink        csdev of sink device.
>>>> + * @enable:        indicates that byte_cntr function is enabled or 
>>>> not.
>>>> + * @read_active:    indicates that byte-cntr node is opened or not.
>>>> + * @thresh_val:        threshold to trigger a interruption.
>>>> + * @total_size        total size of transferred data.
>>>> + * @byte_cntr_irq:    IRQ number.
>>>> + * @irq_cnt:        IRQ count.
>>>> + * @wq:            workqueue of reading ETR data.
>>>> + * @read_work:        work of reading ETR data.
>>>> + * @spin_lock:        spinlock of byte cntr data.
>>>> + * @r_offset:        offset of the pointer where reading begins.
>>>> + * @w_offset:        offset of the write pointer in the ETR buffer 
>>>> when
>>>> + *            the byte cntr is stopped.
>>>> + * @irq_ctrl_offset:    offset to the BYTECNTRVAL Register.
>>>> + * @name:        the name of byte cntr device node.
>>>> + * @irq_name:        IRQ name in DT.
>>>> + */
>>>> +struct ctcu_byte_cntr {
>>>> +    struct cdev        c_dev;
>>>> +    struct coresight_device    *sink;
>>>> +    bool            enable;
>>>> +    bool            read_active;
>>>> +    u32            thresh_val;
>>>> +    u64            total_size;
>>>> +    int            byte_cntr_irq;
>>>> +    atomic_t        irq_cnt;
>>>> +    wait_queue_head_t    wq;
>>>> +    struct work_struct    read_work;
>>>> +    raw_spinlock_t        spin_lock;
>>>> +    long            r_offset;
>>>> +    long            w_offset;
>>>> +    u32            irq_ctrl_offset;
>>>> +    const char        *name;
>>>> +    const char        *irq_name;
>>>> +};
>>>> +
>>>>   struct ctcu_drvdata {
>>>>       void __iomem        *base;
>>>>       struct clk        *apb_clk;
>>>>       struct device        *dev;
>>>>       struct coresight_device    *csdev;
>>>> +    struct ctcu_byte_cntr   byte_cntr_data[ETR_MAX_NUM];
>>>>       raw_spinlock_t        spin_lock;
>>>>       u32            atid_offset[ETR_MAX_NUM];
>>>>       /* refcnt for each traceid of each sink */
>>>>       u8            traceid_refcnt[ETR_MAX_NUM] 
>>>> [CORESIGHT_TRACE_ID_RES_TOP];
>>>>   };
>>>> +/* Generic functions */
>>>> +int ctcu_get_active_port(struct coresight_device *sink, struct 
>>>> coresight_device *helper);
>>>> +
>>>> +/* Byte-cntr functions */
>>>> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct 
>>>> coresight_path *path);
>>>> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct 
>>>> coresight_path *path);
>>>> +int ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata 
>>>> *drvdata, int port_num);
>>>> +void ctcu_byte_cntr_remove(struct ctcu_drvdata *drvdata);
>>>> +
>>>>   #endif
>>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/ 
>>>> drivers/hwtracing/coresight/coresight-tmc-etr.c
>>>> index ec636ab1fd75..5dc94e890927 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>>>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>>>> @@ -1040,14 +1040,15 @@ static void tmc_free_etr_buf(struct etr_buf 
>>>> *etr_buf)
>>>>    * Returns: The size of the linear data available @pos, with *bufpp
>>>>    * updated to point to the buffer.
>>>>    */
>>>> -static ssize_t tmc_etr_buf_get_data(struct etr_buf *etr_buf,
>>>> -                    u64 offset, size_t len, char **bufpp)
>>>> +ssize_t tmc_etr_buf_get_data(struct etr_buf *etr_buf,
>>>> +                 u64 offset, size_t len, char **bufpp)
>>>>   {
>>>>       /* Adjust the length to limit this transaction to end of 
>>>> buffer */
>>>>       len = (len < (etr_buf->size - offset)) ? len : etr_buf->size - 
>>>> offset;
>>>>       return etr_buf->ops->get_data(etr_buf, (u64)offset, len, bufpp);
>>>>   }
>>>> +EXPORT_SYMBOL_GPL(tmc_etr_buf_get_data);
>>>>   static inline s64
>>>>   tmc_etr_buf_insert_barrier_packet(struct etr_buf *etr_buf, u64 
>>>> offset)
>>>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/ 
>>>> hwtracing/coresight/coresight-tmc.h
>>>> index baedb4dcfc3f..2fc77fd4ea25 100644
>>>> --- a/drivers/hwtracing/coresight/coresight-tmc.h
>>>> +++ b/drivers/hwtracing/coresight/coresight-tmc.h
>>>> @@ -443,5 +443,7 @@ struct etr_buf *tmc_etr_get_buffer(struct 
>>>> coresight_device *csdev,
>>>>                      enum cs_mode mode, void *data);
>>>>   extern const struct attribute_group coresight_etr_group;
>>>>   long tmc_get_rwp_offset(struct tmc_drvdata *drvdata);
>>>> +ssize_t tmc_etr_buf_get_data(struct etr_buf *etr_buf, u64 offset, 
>>>> size_t len,
>>>> +                 char **bufpp);
>>>>   #endif
>>>
>>
> 


