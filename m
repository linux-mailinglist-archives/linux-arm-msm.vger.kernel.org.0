Return-Path: <linux-arm-msm+bounces-66168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A77B0E7F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 03:15:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5092917264F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 01:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D72761FCE;
	Wed, 23 Jul 2025 01:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQT29A2/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4876E1853
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 01:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753233328; cv=none; b=FCb/tbGtX89HpDv2YhoAW+7Pjm+LFmnrAO1THBSO/WdjrrEAyyd33qBRQUNY2w1tia6aCedIOrZM+e+h81Vt4hHLNGXxWDitRGnTS64lh32Wl1ZkisJ6mI876m7hiYuY/HfFt8ua/5Tze7pE0QCIwzsfB0WIa+FQDkEOeQeRyKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753233328; c=relaxed/simple;
	bh=nOxG50bea9f6flTEBuc4HQ2VW8sJ+52UqDfyZwsd+QM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p+8rdM+InWALqVjjL8kXehP9tj1tVHX873BA/FBDmhr+NdBEI/f8J5hipnKEqufGEgWOwD7jI+ULjtW7dI0+G35qyH6FdzNrlwh1ZkCGA/NxKPAwsfjy7HgSHiutuJqZd8jf+xLcMYUxJNCJv4eRyQrh1NOCWGBZ1T27We3PAe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQT29A2/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMOGgZ024408
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 01:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UBLFCWXHRypqU6Zkg1KdE1JKuIQpEJV9U9fRV7VJ27w=; b=fQT29A2/ccG6Dn+0
	qXjOC+qqHrOdZrZEx7lKChTYRJD5rFXKiwTEyK0Z/r7eYH3UUD8wBa/P4/EuXPdj
	H3Mmm7eB8rhcMLvX7+SsxJwx7MEBrIbZ1fbxWXcAcyE/LRemtyyQzo1EnG3+X5VZ
	I0Bywd0coFLROpP4Iy0OxRbPx9cdrKugvPYXBK0oMOAW+MRF9mLHoh72qLbjxFN0
	wZzIGOT+bY/VVqxpigrKoe4EJ4PQXTVZYBM+ZdHLqqr8vGwMAFrOlkhaYUrRayWJ
	4j3MDRsmpWCe+SXRNsWEqK21gizNyEkVRcCF0cVd/LfEpntgiGVM9isROqn1b7D6
	15dKtA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1u9wb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 01:15:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b3ba7659210so4492094a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 18:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753233324; x=1753838124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UBLFCWXHRypqU6Zkg1KdE1JKuIQpEJV9U9fRV7VJ27w=;
        b=ZZJ4uFBUnE2rK3/CqG9PHBvZcv30332ubfJge20ZElY8U4wCdJUvmzxwDalhzFW/6a
         zvHO6h4Yy/aOyonQ2X/iVo3zp17GnaTRM0proDk4Hey8fFebFkBT4z66zhmDgDjkoszv
         xAVh40TWjjqLeR2/54RMtPw/TENkn+AU3EjafT71EPCBvCfkwR5TdPjfjUs94L0SSr0/
         PSjASGTGrv4rIfdmeCwPRPs5bfbQ3pEPI4Ffy+Q4s+ix+xDSyVosuzAkVKBwgS4t3jzn
         YPmd+RWwds/HEAlg25g/rcfm0gMYe0shj2Z9Y+Ss2DhnUeyTA6l7qU5rasvdmCTYK7cQ
         amOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhiHpADBj7tQZp8zZqi9sfsqFOemOn7nBkUPzd0GQsc43STjRtuAzVy2+hmJhY2tobAPNQoWUusexEtTQF@vger.kernel.org
X-Gm-Message-State: AOJu0YzQH85o5ek9VZb4S5WqfTIGPzyrsCaH6zQObs57HOppYjiEjtVa
	7k429jcSbEbUvA2B+fL51YdY56eNqewtp5Xwam7JGdeOvRyjeF/NigkKStz5OmR7E5zL5iU9v9q
	OjW4VAl2oQ9txvaVniVpfWIL7vhhALtEbemlUYgLWTAsu92RqXcSBhpoNT31IGeYA2Eyg
X-Gm-Gg: ASbGncvtxhXfKjk8nFAg8Oq7EDrsFAZs6Dtw8QDrelM0Om6TdZnABdeC1nBj8sXEgJP
	aEDcPAaXhIk37U5ZZ6j2zqZrSAXumNPMph2v+ZcDPCD0hzaryQtx14fcsPc4/R3Xo/NYWjxSsPF
	No6v5B7LqNSI8rHXD3QaydUWM8XhIaobk76wY/J0c6f9cuFTQ6r1w/8jI1F14S10NHPevusDHaS
	fztGg/5ssr0VPiYNrLBUElp1nUQL3fzrBr5G+jyqCiSdWbyUYHnpq9+W558sDzg5GDQcNPrWivV
	gzYSV1s5hDG5G/eQUxZYGIJTRWK+B34cUyKatD89Fi6BesHwNbDUfNAj57c3vRO7mTXtPh7TsMS
	INvbUiQn2/CBjq5IZWfMurwE=
X-Received: by 2002:a05:6a20:728a:b0:239:2bcd:a08c with SMTP id adf61e73a8af0-23d4911d9a1mr1338289637.28.1753233323455;
        Tue, 22 Jul 2025 18:15:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUBSPP+ROO9RM9bS0+8nEdLOV3A/pQo2EG6wnLY9GSisANA7WDQopkE/MSX/UjfWSmEnPJ1Q==
X-Received: by 2002:a05:6a20:728a:b0:239:2bcd:a08c with SMTP id adf61e73a8af0-23d4911d9a1mr1338223637.28.1753233322910;
        Tue, 22 Jul 2025 18:15:22 -0700 (PDT)
Received: from [10.133.33.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-75f24cea21fsm2154809b3a.32.2025.07.22.18.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 18:15:22 -0700 (PDT)
Message-ID: <99ae277e-6258-456a-8953-3420f79d6e05@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 09:15:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 04/10] coresight: ctcu: enable byte-cntr for TMC
 ETR devices
To: Mike Leach <mike.leach@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
 <20250714063109.591-5-jie.gan@oss.qualcomm.com>
 <CAJ9a7VhEDMSz6TWvhFOwcdGYbtM-4LnRpPH-7eab8Cdq8r616g@mail.gmail.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <CAJ9a7VhEDMSz6TWvhFOwcdGYbtM-4LnRpPH-7eab8Cdq8r616g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=688037ac cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=1wL8XiW1idBJ4pQLfm8A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAwOCBTYWx0ZWRfX9WtiiG4pP6Bd
 tLV8hiv5yCacoDXcoP/dpU7iDc2PwaC2IfGP6/Hcu+ZW52GIxacmdQGAmn02pNCTmpj2nAdT+18
 LmOm8TKrCzIgZdSUwNPOa+y8dm2feoH2FNwRPBRHs5ae60IcWTvXb3rbCQjzaBp1Eu/Bjm+Qeu1
 p0uA3M5oa30jSIxTp5kEhatfPOCJ+6i6dj+oghCTr5RW3Zsh9uPtJFt/ghk9oxocPPK6AIpdwPP
 HyEUeb8oHv/owQhU8quFZLkugP770J7kISFb0ZqVZkUTc4J2Z3GBB2PXQ0ADx3cjHi3B2YMpRZO
 7xczXfZbmzMap8Ckip3sJgb1+r6vjNp25idXkm5CNUIKaOiR/5fgV5pHhwq0yo662bcDPChyLY2
 CKdrM/VtY5Ca06+08+9oidJt9Qi+sPqlaThxPOVfmN7ptu8Hc5JcnbftPPYuqp9T+jZaoy4w
X-Proofpoint-ORIG-GUID: X-LMv_GPx7xWZ_2s0_rV_ptiaN90jDT4
X-Proofpoint-GUID: X-LMv_GPx7xWZ_2s0_rV_ptiaN90jDT4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_04,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230008



On 7/22/2025 11:23 PM, Mike Leach wrote:
> Hi,
> 
> There are some parameters in the new structure that are unused in this patch.
> 
> please only introduce fields when they start to be used to make review easier.
> 

Sure, will check carefully in future.

Thanks,
Jie

> Regards
> 
> Mike
> 
> On Mon, 14 Jul 2025 at 07:31, Jie Gan <jie.gan@oss.qualcomm.com> wrote:
>>
>> The byte-cntr function provided by the CTCU device is used to transfer data
>> from the ETR buffer to the userspace. An interrupt is triggered if the data
>> size exceeds the threshold set in the BYTECNTRVAL register. The interrupt
>> handler counts the number of triggered interruptions and the read function
>> will read the data from the ETR buffer.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../testing/sysfs-bus-coresight-devices-ctcu  |   5 +
>>   drivers/hwtracing/coresight/Makefile          |   2 +-
>>   .../coresight/coresight-ctcu-byte-cntr.c      | 102 ++++++++++++++++++
>>   .../hwtracing/coresight/coresight-ctcu-core.c |  94 +++++++++++++++-
>>   drivers/hwtracing/coresight/coresight-ctcu.h  |  49 ++++++++-
>>   5 files changed, 246 insertions(+), 6 deletions(-)
>>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>> new file mode 100644
>> index 000000000000..e21f5bcb8097
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>> @@ -0,0 +1,5 @@
>> +What:           /sys/bus/coresight/devices/<ctcu-name>/irq_val
>> +Date:           June 2025
>> +KernelVersion:  6.16
>> +Contact:        Tingwei Zhang (QUIC) <quic_tingweiz@quicinc.com>; Jinlong Mao (QUIC) <quic_jinlmao@quicinc.com>; Jie Gan <jie.gan@oss.qualcomm.com>
>> +Description:    (RW) Configure the IRQ value for byte-cntr register.
>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
>> index 4e7cc3c5bf99..3568d9768567 100644
>> --- a/drivers/hwtracing/coresight/Makefile
>> +++ b/drivers/hwtracing/coresight/Makefile
>> @@ -54,5 +54,5 @@ coresight-cti-y := coresight-cti-core.o       coresight-cti-platform.o \
>>   obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>>   obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>>   obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
>> -coresight-ctcu-y := coresight-ctcu-core.o
>> +coresight-ctcu-y := coresight-ctcu-core.o coresight-ctcu-byte-cntr.o
>>   obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>> new file mode 100644
>> index 000000000000..d3b6eb7a89fb
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>> @@ -0,0 +1,102 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/coresight.h>
>> +#include <linux/device.h>
>> +#include <linux/fs.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/uaccess.h>
>> +
>> +#include "coresight-ctcu.h"
>> +#include "coresight-priv.h"
>> +#include "coresight-tmc.h"
>> +
>> +static irqreturn_t byte_cntr_handler(int irq, void *data)
>> +{
>> +       struct ctcu_byte_cntr *byte_cntr_data = (struct ctcu_byte_cntr *)data;
>> +
>> +       atomic_inc(&byte_cntr_data->irq_cnt);
>> +       wake_up(&byte_cntr_data->wq);
>> +
>> +       byte_cntr_data->irq_num++;
>> +
> 
> These two - irq_num & irq_cnt appear to count the same thing. Do not
> understand why one has to be atomic and the other does not.
> 
>> +       return IRQ_HANDLED;
>> +}
>> +
>> +/* Start the byte-cntr function when the path is enabled. */
>> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path)
>> +{
>> +       struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> +       struct coresight_device *sink = coresight_get_sink(path);
>> +       struct ctcu_byte_cntr *byte_cntr_data;
>> +       int port_num;
>> +
>> +       if (!sink)
>> +               return;
>> +
>> +       port_num = coresight_get_port_helper(sink, csdev);
>> +       if (port_num < 0)
>> +               return;
>> +
>> +       byte_cntr_data = &drvdata->byte_cntr_data[port_num];
>> +       /* Don't start byte-cntr function when threshold is not set. */
>> +       if (!byte_cntr_data->thresh_val || byte_cntr_data->enable)
>> +               return;
>> +
>> +       guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
>> +       byte_cntr_data->enable = true;
>> +       byte_cntr_data->reading_buf = false;
>> +}
>> +
>> +/* Stop the byte-cntr function when the path is disabled. */
>> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path)
>> +{
>> +       struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> +       struct coresight_device *sink = coresight_get_sink(path);
>> +       struct ctcu_byte_cntr *byte_cntr_data;
>> +       int port_num;
>> +
>> +       if (!sink || coresight_get_mode(sink) == CS_MODE_SYSFS)
>> +               return;
>> +
>> +       port_num = coresight_get_port_helper(sink, csdev);
>> +       if (port_num < 0)
>> +               return;
>> +
>> +       byte_cntr_data = &drvdata->byte_cntr_data[port_num];
>> +       guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
>> +       byte_cntr_data->enable = false;
>> +}
>> +
>> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int etr_num)
>> +{
>> +       struct ctcu_byte_cntr *byte_cntr_data;
>> +       struct device_node *nd = dev->of_node;
>> +       int byte_cntr_irq, ret, i;
>> +
>> +       for (i = 0; i < etr_num; i++) {
>> +               byte_cntr_data = &drvdata->byte_cntr_data[i];
>> +               byte_cntr_irq = of_irq_get_byname(nd, byte_cntr_data->irq_name);
>> +               if (byte_cntr_irq < 0) {
>> +                       dev_err(dev, "Failed to get IRQ from DT for %s\n",
>> +                               byte_cntr_data->irq_name);
>> +                       continue;
>> +               }
>> +
>> +               ret = devm_request_irq(dev, byte_cntr_irq, byte_cntr_handler,
>> +                                      IRQF_TRIGGER_RISING | IRQF_SHARED,
>> +                                      dev_name(dev), byte_cntr_data);
>> +               if (ret) {
>> +                       dev_err(dev, "Failed to register IRQ for %s\n",
>> +                               byte_cntr_data->irq_name);
>> +                       continue;
>> +               }
>> +
>> +               byte_cntr_data->byte_cntr_irq = byte_cntr_irq;
>> +               disable_irq(byte_cntr_data->byte_cntr_irq);
>> +               init_waitqueue_head(&byte_cntr_data->wq);
>> +       }
>> +}
>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> index 28ea4a216345..721836d42523 100644
>> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> @@ -15,6 +15,7 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/slab.h>
>> +#include <linux/sizes.h>
>>
>>   #include "coresight-ctcu.h"
>>   #include "coresight-priv.h"
>> @@ -45,17 +46,23 @@ DEFINE_CORESIGHT_DEVLIST(ctcu_devs, "ctcu");
>>
>>   #define CTCU_ATID_REG_BIT(traceid)     (traceid % 32)
>>   #define CTCU_ATID_REG_SIZE             0x10
>> +#define CTCU_ETR0_IRQCTRL               0x6c
>> +#define CTCU_ETR1_IRQCTRL               0x70
>>   #define CTCU_ETR0_ATID0                        0xf8
>>   #define CTCU_ETR1_ATID0                        0x108
>>
>>   static const struct ctcu_etr_config sa8775p_etr_cfgs[] = {
>>          {
>> -               .atid_offset    = CTCU_ETR0_ATID0,
>> -               .port_num       = 0,
>> +               .atid_offset            = CTCU_ETR0_ATID0,
>> +               .irq_ctrl_offset        = CTCU_ETR0_IRQCTRL,
>> +               .irq_name               = "etr0",
>> +               .port_num               = 0,
>>          },
>>          {
>> -               .atid_offset    = CTCU_ETR1_ATID0,
>> -               .port_num       = 1,
>> +               .atid_offset            = CTCU_ETR1_ATID0,
>> +               .irq_ctrl_offset        = CTCU_ETR1_IRQCTRL,
>> +               .irq_name               = "etr1",
>> +               .port_num               = 1,
>>          },
>>   };
>>
>> @@ -64,6 +71,76 @@ static const struct ctcu_config sa8775p_cfgs = {
>>          .num_etr_config = ARRAY_SIZE(sa8775p_etr_cfgs),
>>   };
>>
>> +static void ctcu_program_register(struct ctcu_drvdata *drvdata, u32 val, u32 offset)
>> +{
>> +       CS_UNLOCK(drvdata->base);
>> +       ctcu_writel(drvdata, val, offset);
>> +       CS_LOCK(drvdata->base);
>> +}
>> +
>> +static ssize_t irq_val_show(struct device *dev, struct device_attribute *attr,
>> +                           char *buf)
>> +{
>> +       struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +       int i, len = 0;
>> +
>> +       for (i = 0; i < ETR_MAX_NUM; i++) {
>> +               if (drvdata->byte_cntr_data[i].irq_ctrl_offset)
>> +                       len += scnprintf(buf + len, PAGE_SIZE - len, "%u ",
>> +                                        drvdata->byte_cntr_data[i].thresh_val);
>> +       }
>> +
>> +       len += scnprintf(buf + len, PAGE_SIZE - len, "\n");
>> +
>> +       return len;
>> +}
>> +
>> +/* Program a valid value into IRQCTRL register will enable byte-cntr interrupt */
>> +static ssize_t irq_val_store(struct device *dev, struct device_attribute *attr,
>> +                            const char *buf, size_t size)
>> +{
>> +       struct ctcu_drvdata *drvdata = dev_get_drvdata(dev->parent);
>> +       u32 thresh_vals[ETR_MAX_NUM] = { 0 };
>> +       u32 irq_ctrl_offset;
>> +       int num, i;
>> +
>> +       num = sscanf(buf, "%i %i", &thresh_vals[0], &thresh_vals[1]);
>> +       if (num <= 0 || num > ETR_MAX_NUM)
>> +               return -EINVAL;
>> +
>> +       /* Threshold 0 disables the interruption. */
>> +       guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
>> +       for (i = 0; i < num; i++) {
>> +               /* A small threshold will result in a large number of interruptions */
>> +               if (thresh_vals[i] && thresh_vals[i] < SZ_4K)
>> +                       return -EINVAL;
>> +
>> +               if (drvdata->byte_cntr_data[i].irq_ctrl_offset) {
>> +                       drvdata->byte_cntr_data[i].thresh_val = thresh_vals[i];
>> +                       irq_ctrl_offset = drvdata->byte_cntr_data[i].irq_ctrl_offset;
>> +                       /* A one value for IRQCTRL register represents 8 bytes */
>> +                       ctcu_program_register(drvdata, thresh_vals[i] / 8, irq_ctrl_offset);
>> +               }
>> +       }
>> +
>> +       return size;
>> +}
>> +static DEVICE_ATTR_RW(irq_val);
>> +
> 
> I think it may make more sense to call this something with "threshold"
> - as it is thresholds that are being set.
> 
>> +static struct attribute *ctcu_attrs[] = {
>> +       &dev_attr_irq_val.attr,
>> +       NULL,
>> +};
>> +
>> +static struct attribute_group ctcu_attr_grp = {
>> +       .attrs = ctcu_attrs,
>> +};
>> +
>> +static const struct attribute_group *ctcu_attr_grps[] = {
>> +       &ctcu_attr_grp,
>> +       NULL,
>> +};
>> +
>>   static void ctcu_program_atid_register(struct ctcu_drvdata *drvdata, u32 reg_offset,
>>                                         u8 bit, bool enable)
>>   {
>> @@ -143,6 +220,8 @@ static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode, void *
>>   {
>>          struct coresight_path *path = (struct coresight_path *)data;
>>
>> +       ctcu_byte_cntr_start(csdev, path);
>> +
>>          return ctcu_set_etr_traceid(csdev, path, true);
>>   }
>>
>> @@ -150,6 +229,8 @@ static int ctcu_disable(struct coresight_device *csdev, void *data)
>>   {
>>          struct coresight_path *path = (struct coresight_path *)data;
>>
>> +       ctcu_byte_cntr_stop(csdev, path);
>> +
>>          return ctcu_set_etr_traceid(csdev, path, false);
>>   }
>>
>> @@ -200,7 +281,11 @@ static int ctcu_probe(struct platform_device *pdev)
>>                          for (i = 0; i < cfgs->num_etr_config; i++) {
>>                                  etr_cfg = &cfgs->etr_cfgs[i];
>>                                  drvdata->atid_offset[i] = etr_cfg->atid_offset;
>> +                               drvdata->byte_cntr_data[i].irq_name = etr_cfg->irq_name;
>> +                               drvdata->byte_cntr_data[i].irq_ctrl_offset =
>> +                                       etr_cfg->irq_ctrl_offset;
>>                          }
>> +                       ctcu_byte_cntr_init(dev, drvdata, cfgs->num_etr_config);
>>                  }
>>          }
>>
>> @@ -212,6 +297,7 @@ static int ctcu_probe(struct platform_device *pdev)
>>          desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU;
>>          desc.pdata = pdata;
>>          desc.dev = dev;
>> +       desc.groups = ctcu_attr_grps;
>>          desc.ops = &ctcu_ops;
>>          desc.access = CSDEV_ACCESS_IOMEM(base);
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
>> index e9594c38dd91..71266371591b 100644
>> --- a/drivers/hwtracing/coresight/coresight-ctcu.h
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu.h
>> @@ -5,19 +5,27 @@
>>
>>   #ifndef _CORESIGHT_CTCU_H
>>   #define _CORESIGHT_CTCU_H
>> +
>> +#include <linux/time.h>
>>   #include "coresight-trace-id.h"
>>
>>   /* Maximum number of supported ETR devices for a single CTCU. */
>>   #define ETR_MAX_NUM    2
>>
>> +#define BYTE_CNTR_TIMEOUT      (5 * HZ)
>> +
>>   /**
>>    * struct ctcu_etr_config
>>    * @atid_offset:       offset to the ATID0 Register.
>> - * @port_num:          in-port number of CTCU device that connected to ETR.
>> + * @port_num:          in-port number of the CTCU device that connected to ETR.
>> + * @irq_ctrl_offset:    offset to the BYTECNTRVAL register.
>> + * @irq_name:           IRQ name in dt node.
>>    */
>>   struct ctcu_etr_config {
>>          const u32 atid_offset;
>>          const u32 port_num;
>> +       const u32 irq_ctrl_offset;
>> +       const char *irq_name;
>>   };
>>
>>   struct ctcu_config {
>> @@ -25,15 +33,54 @@ struct ctcu_config {
>>          int num_etr_config;
>>   };
>>
>> +/**
>> + * struct ctcu_byte_cntr
>> + * @enable:            indicates that byte_cntr function is enabled or not.
>> + * @reading:           indicates that its byte-cntr reading.
>> + * @reading_buf:       indicates that byte-cntr is reading buffer.
>> + * @thresh_val:                threshold to trigger a interruption.
>> + * @total_size:                total size of transferred data.
>> + * @byte_cntr_irq:     IRQ number.
>> + * @irq_cnt:           IRQ count.
>> + * @irq_num:           number of the byte_cntr IRQ for one session.
> 
> the difference between byte_cntr_irg and irq_cnt is not clear.
> 
>> + * @wq:                        workqueue of reading ETR data.
>> + * @read_work:         work of reading ETR data.
>> + * @spin_lock:         spinlock of byte cntr data.
>> + *                     the byte cntr is stopped.
>> + * @irq_ctrl_offset:   offset to the BYTECNTVAL Register.
>> + * @irq_name:          IRQ name in DT.
>> + */
>> +struct ctcu_byte_cntr {
>> +       bool                    enable;
>> +       bool                    reading;
> 
> This parameter is unused in this patch
> 
>> +       bool                    reading_buf;
>> +       u32                     thresh_val;
>> +       u64                     total_size;
> 
> parameter unused in this patch
> 
>> +       int                     byte_cntr_irq;
>> +       atomic_t                irq_cnt;
>> +       int                     irq_num;
>> +       wait_queue_head_t       wq;
>> +       struct work_struct      read_work;
>> +       raw_spinlock_t          spin_lock;
>> +       u32                     irq_ctrl_offset;
>> +       const char              *irq_name;
>> +};
>> +
>>   struct ctcu_drvdata {
>>          void __iomem            *base;
>>          struct clk              *apb_clk;
>>          struct device           *dev;
>>          struct coresight_device *csdev;
>> +       struct ctcu_byte_cntr   byte_cntr_data[ETR_MAX_NUM];
>>          raw_spinlock_t          spin_lock;
>>          u32                     atid_offset[ETR_MAX_NUM];
>>          /* refcnt for each traceid of each sink */
>>          u8                      traceid_refcnt[ETR_MAX_NUM][CORESIGHT_TRACE_ID_RES_TOP];
>>   };
>>
>> +/* Byte-cntr functions */
>> +void ctcu_byte_cntr_start(struct coresight_device *csdev, struct coresight_path *path);
>> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path);
>> +void ctcu_byte_cntr_init(struct device *dev, struct ctcu_drvdata *drvdata, int port_num);
>> +
>>   #endif
>> --
>> 2.34.1
>>
> 
> 


