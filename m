Return-Path: <linux-arm-msm+bounces-71122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BF737B39DAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 14:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0F6B1BA62FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 12:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C90F30DD25;
	Thu, 28 Aug 2025 12:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mvZG5Skc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C3320C001
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756385296; cv=none; b=OLrA9W6iPg918icetBof+3cQ/EYl9vOeDKUbCj9i44GYtWdmiVzgHxcC7wcVw1liD6pHkmvuA6haQXeMC2encmEmrQpy+2WQBH85bwVzieYR4dcPJVjWFkLRFQZKQTsoDUQ4q0X4+h153fzPxAU3So/eRE3cQiGDsUtJHZ3SSnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756385296; c=relaxed/simple;
	bh=Owfm0CJrT1iAedPfq2rJLj3nWv1TXfRzAWNZQDIKb2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gVjOqp7spsHNV8pAzjMjj/hSvT4JczB6g6DM69G6GwIgtlf1FzV1deI/G/5083/LlLspIbbz/kHm/+xGCvi1YyZgD5L1epoguEXmJR3gba0DfuZad6oYmNtMI7+fFWncOOCH1Oh3luAAJzDCilmn6U0zOB5E3vvTph1GSfI3FYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mvZG5Skc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S5usY2008214
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i87CC0NQ8ljKifsSJ/fr5hhuM2RlxUBqXPRTdtaFTIk=; b=mvZG5SkcuDOmK9uC
	xaFPnb3I2JKoyaYgx2vWZoNlZHw+FSxNRujiGpKaHbmKkCsFAOlKqm0Zid8HxXgU
	lL3uoPKa7bWax65wfXJiSalPPGGk/B17OtqE3TqMOXsQq7Wg6+d+1GSoyNZW5Uuk
	4eI0SX+ZqpOEZnQSKsVzl5UEFBZkF950ZuJCzzCnfO0qhIVaZQjAsX6pMWJLeAnL
	Bhg0RErSE0wwV8bxOuGPmhkNioIg3d46kX13Jx0KMJQsgBRej2kp+UO0gAgDnxH7
	rWrDPFZ/9RiTPUZlnjRXc4xjrFyMV8RWqPJBhuLc4yOmaEik6RghWy2+PRI5DqqB
	4pvfZA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48sh8apgb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:48:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458274406so18406125ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 05:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756385293; x=1756990093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i87CC0NQ8ljKifsSJ/fr5hhuM2RlxUBqXPRTdtaFTIk=;
        b=n9NiKPCVKfHFA3UyXzlgzss5d1pc444g3pu5uQrTL261Cmtn0IwxjQ+uErTcc5Y2yC
         YHeFqiwdcMXVz/7N38RoleiXbLmCFXSDpqdQUcD5ODJX5zVEFcsM3cDNMJqrvKz+2DZ0
         KN9KxBVipeOg6IvY4LIqGk1t6CwA9kZpGZfWFl3ZNAepxZaADexudGGKDMANT9uLQchV
         mP5cTvdnMWr1Ln4kQyZ030GPEaJ7+k8d2Ms9DvdBVUexffZjRs3r+dmzrki53zZnCgba
         LIFsjjPfXIBR7/GjSaGDC9oSAZjdfECnLCxS3xzMgoN9IZx4VqKnuvtRQBPLN4WNhSd6
         5iyw==
X-Forwarded-Encrypted: i=1; AJvYcCWlBzXE4kVgklsUrC5UTrDqpIklkviFIaj61v92KwFe88ETSxepPj2GJVllwW7FlIGLRQQY08oRdZdLO3me@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/1vfNHLOiRw99jgdM5XAfG78JfPDIOXkfRHh2dY3bRztZg3Fx
	g2I3UFiZGWPmd+ujWP1ACrwsdOelaKOn8NwpXPtF1rrPepU6KZiNt2JwYasnrxFgPaUXOUvQR2C
	obMZrrciTIXLsuvb7sU+wnSmn1jF5j7rMm3hhFy8NHpSIPTtQ2suRTJyD3a/nO4OhWhBU40rJFM
	s2
X-Gm-Gg: ASbGncv/R8HUgs9ZfMB5NQKm0Rb3WIX2fE51VCDqdXv7As+mKY1k8Duk16vski+68vw
	vDAZvcI5VAzWhL93rx9AAVnhByPa0wd/keVSACI8N6uvHLrJkDEA8nwMH0/lz0+y4EhgYjtCiC1
	L70hCTPVO3c7spIJTeYH8vyc/+/aW03HWtJkR75q3TBPid/rdeKjY9zTRHDncc1UUhBIkG1kQJa
	PPXYhR7KpWr2LH/CI7d5fid2RyM7I+8CKSxJy+BvxeVakkpWitLZywc8fHSlJDbuk/mD+s70a94
	qoNq15oIu83q0BwqRt2fkGrk7HNH4h6RRXgoD5AQiGuE5fGJBWaDY0gjVZ0Sw/hdpgmeoReg7Q=
	=
X-Received: by 2002:a17:903:24f:b0:224:23be:c569 with SMTP id d9443c01a7336-2462ee573f8mr271549835ad.22.1756385292851;
        Thu, 28 Aug 2025 05:48:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGepW8wZgN/qlOIhXV5/X4Je5OWw4AN6A15PaaIbRKmqTAcB5TIyCKURkdgTEsmJ1o4Oz9RxQ==
X-Received: by 2002:a17:903:24f:b0:224:23be:c569 with SMTP id d9443c01a7336-2462ee573f8mr271549505ad.22.1756385292317;
        Thu, 28 Aug 2025 05:48:12 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771f7fe29b0sm7961461b3a.9.2025.08.28.05.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 05:48:12 -0700 (PDT)
Message-ID: <33c77d3d-0d0b-4e61-b90c-ea69214237ed@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 18:18:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/12] drivers: soc: qcom: Add support for Qualcomm QDU
 device.
To: Bjorn Andersson <andersson@kernel.org>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-7-kishore.batta@oss.qualcomm.com>
 <et4b6ijowhuins5xibpne4jf7v2cus4i3sqk3cm7aqasc6v6w4@psiej5eq4ftx>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <et4b6ijowhuins5xibpne4jf7v2cus4i3sqk3cm7aqasc6v6w4@psiej5eq4ftx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cLDgskeN c=1 sm=1 tr=0 ts=68b0500e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=1yD4IUB2qnYqGipxwh8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDE1MyBTYWx0ZWRfX4pO/3gYdLWXB
 PV27LyMvVHtJ0zpFr3yS2p4Lf+vCe8fsBf9M5UcI6AnHWOMx1SkAuFJjEfb13v59rmDkGD/sHUY
 Q9jXxksYErjP1/Ey2uGJ38H9mAK+3K4oX1d1Vwqd50U80KbdrNId31XuLYOkItvLXH2diUrpHbT
 +tK26LfCTgds95O8H2x0O++A4DIFt5KDyn2Ab44Vob8MdD6Tsk/5tpmWv/loQjGTF9C4m29R+oi
 YkTR8+kVgSduwtWY5VsaNJPwebgIGLGyPYK9DLKjIi9evz7ZhoNZmYwmRav53BTrndBVE3j3CUJ
 pkILSas6Jpk+akgKdo3ZgDu4CVsoMQxvBTGchRS9reFP2mtQuezqoAsLI4AGWFnDL6uQ+Q3P80M
 1HGaans5
X-Proofpoint-GUID: qofunZQ6riv-1IoC3tphvCKGPuryUSAW
X-Proofpoint-ORIG-GUID: qofunZQ6riv-1IoC3tphvCKGPuryUSAW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260153


On 8/26/2025 4:54 AM, Bjorn Andersson wrote:
> On Mon, Aug 25, 2025 at 03:49:20PM +0530, Kishore Batta wrote:
>> Add support for the Qualcomm QDU device. The Qualcomm QDU driver acts
>> as a client driver to the Sahara protocol, including the QDU100-specific
>> image table and registering it during device initialization.
> "including the QDU100-specific image table"? That's not "including" it's
> the only thing it does.
>
>> The
>> registration of the image table is required to transfer the QDU100
>> specific firmware back to the device using Sahara protocol packets.
> Compare above 5-6 lines with:
>
> "The QDU device is flash-less and uses Sahara to load its firmware,
> provide the table of firmware files."
>
>> The
>> MHI driver exposes a new channel name for the Qualcomm QDU100 device in
>> the pci_generic.c file, and the same channel support is added in the
>> Sahara driver.
> Which MHI driver exposes a new channel name? Please rephrase this and
> perhaps split it into a separate patch?
>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/Kconfig         | 14 ++++++
>>   drivers/soc/qcom/Makefile        |  1 +
>>   drivers/soc/qcom/qdu.c           | 85 ++++++++++++++++++++++++++++++++
>>   drivers/soc/qcom/sahara/sahara.c |  1 +
>>   4 files changed, 101 insertions(+)
>>   create mode 100644 drivers/soc/qcom/qdu.c
>>
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index 7ea4cff9a679..ffaaf6261c35 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -303,6 +303,20 @@ config QCOM_UBWC_CONFIG
>>   	  with coherent configuration data. This module functions as a single
>>   	  source of truth for that information.
>>   
>> +config QCOM_QDU
>> +	tristate "Qualcomm QDU driver"
>> +	select QCOM_SAHARA_PROTOCOL
>> +	help
>> +	  This is a client driver which registers the device specific operations
>> +	  with sahara protocol which is used to download firmware to Qualcomm
>> +	  distributed unit device.
>> +	  The Qualcomm QDU driver facilitates the registration of device
>> +	  specific operations with the sahara protocol, enabling firmware
>> +	  download to the QDU device.
> This makes it sound like there's a bunch going on in this driver, is
> more of this coming?
>
>> +
>> +	  To compile this driver as a module, choose M here: the module will be
>> +	  called qdu.
>> +
>>   source "drivers/soc/qcom/sahara/Kconfig"
>>   
>>   endmenu
>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> index 99e490e3174e..8d036edf304a 100644
>> --- a/drivers/soc/qcom/Makefile
>> +++ b/drivers/soc/qcom/Makefile
>> @@ -41,3 +41,4 @@ obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
>>   obj-$(CONFIG_QCOM_PBS) +=	qcom-pbs.o
>>   obj-$(CONFIG_QCOM_UBWC_CONFIG) += ubwc_config.o
>>   obj-$(CONFIG_QCOM_SAHARA_PROTOCOL) += sahara/
>> +obj-$(CONFIG_QCOM_QDU) += qdu.o
> This list was somewhat an approximation of being in alphabetical
> order...
>
>> diff --git a/drivers/soc/qcom/qdu.c b/drivers/soc/qcom/qdu.c
>> new file mode 100644
>> index 000000000000..afd8011793fa
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qdu.c
>> @@ -0,0 +1,85 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
> Look at other drivers in drivers/soc/qcom...they don't format this
> comment like this.
>
>> +
>> +#include <linux/init.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/sahara_image_table_ops.h>
>> +
>> +static const char * const qdu100_image_table[] = {
>> +	[5] = "qcom/qdu100/uefi.elf",
>> +	[8] = "qcom/qdu100/qdsp6sw.mbn",
>> +	[16] = "qcom/qdu100/efs1.bin",
>> +	[17] = "qcom/qdu100/efs2.bin",
>> +	[20] = "qcom/qdu100/efs3.bin",
>> +	[23] = "qcom/qdu100/aop.mbn",
>> +	[25] = "qcom/qdu100/tz.mbn",
>> +	[29] = "qcom/qdu100/zeros_1sector.bin",
>> +	[33] = "qcom/qdu100/hypvm.mbn",
>> +	[34] = "qcom/qdu100/mdmddr.mbn",
>> +	[36] = "qcom/qdu100/multi_image_qti.mbn",
>> +	[37] = "qcom/qdu100/multi_image.mbn",
>> +	[38] = "qcom/qdu100/xbl_config.elf",
>> +	[39] = "qcom/qdu100/abl_userdebug.elf",
>> +	[40] = "qcom/qdu100/zeros_1sector.bin",
>> +	[41] = "qcom/qdu100/devcfg.mbn",
>> +	[42] = "qcom/qdu100/zeros_1sector.bin",
>> +	[43] = "qcom/qdu100/kernel_boot.elf",
>> +	[45] = "qcom/qdu100/tools_l.elf",
>> +	[46] = "qcom/qdu100/Quantum.elf",
>> +	[47] = "qcom/qdu100/quest.elf",
>> +	[48] = "qcom/qdu100/xbl_ramdump.elf",
>> +	[49] = "qcom/qdu100/shrm.elf",
>> +	[50] = "qcom/qdu100/cpucp.elf",
>> +	[51] = "qcom/qdu100/aop_devcfg.mbn",
>> +	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
>> +	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
>> +	[54] = "qcom/qdu100/qupv3fw.elf",
>> +};
>> +
>> +static struct sahara_image_table_provider qdu100_provider = {
>> +	.image_table = qdu100_image_table,
>> +	.image_table_size = ARRAY_SIZE(qdu100_image_table),
>> +	.dev_name = "qcom-qdu100",
>> +	.fw_folder_name = "qdu100",
>> +	.list = LIST_HEAD_INIT(qdu100_provider.list)
>> +};
>> +
>> +static struct sahara_image_table_provider *qdu_providers[] = {
>> +	&qdu100_provider,
>> +};
>> +
>> +static int __init qdu_init(void)
> So patch 2, 3, and 4 just laid the groundwork, so that you could add a
> new "driver" with the only purpose of carrying an array of firmware
> names and the extra code to register it with the Sahara driver.
>
> Why don't you just put the qdu100_image_table[] array in sahara.c and
> save us a whole bunch of changes?

Hi Bjorn,

I thought that embedding the QDU100 image table directly into sahara driver
would risk coupling it too tightly to a specific device, which goes against
the goal of keeping Sahara generic and protocol focused.

To address this, I have restructured the patch to introduce minimal MHI 
client driver(drivers/bus/mhi/qdu.c)
that solely registers the QDU100 image table using sahara registration 
APIs introduced earlier
in the series. This keeps sahara clean and device agnostic while still 
enabling firmware loading
for QDU and AIC devices.

The new driver is conditionally compiled using CONFIG_MHI_QDU and it 
follows the same pattern as AIC module
firmware registration mechanism.

Please let me know if this direction looks good to you, and I'll include 
the updated patch in the next version.


Thanks,

- Kishore.

>
>> +{
>> +	int ret;
>> +
>> +	for (int i = 0; i < ARRAY_SIZE(qdu_providers); i++) {
> Future proof! Please don't.
>
> Regards,
> Bjorn
>
>> +		ret = sahara_register_image_table_provider(qdu_providers[i]);
>> +		if (ret) {
>> +			pr_err("qdu: Failed to register image table %d\n", ret);
>> +
>> +			/* Rollback previously registered providers */
>> +			while (--i >= 0)
>> +				sahara_unregister_image_table_provider(qdu_providers[i]);
>> +			return ret;
>> +		}
>> +	}
>> +	return 0;
>> +}
>> +module_init(qdu_init);
>> +
>> +static void __exit qdu_exit(void)
>> +{
>> +	int ret;
>> +
>> +	for (int i = 0; i < ARRAY_SIZE(qdu_providers); i++) {
>> +		ret = sahara_unregister_image_table_provider(qdu_providers[i]);
>> +		if (ret)
>> +			pr_err("qdu: Failed to unregister image table %d\n", ret);
>> +	}
>> +}
>> +module_exit(qdu_exit);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Qualcomm distributed unit driver");
>> diff --git a/drivers/soc/qcom/sahara/sahara.c b/drivers/soc/qcom/sahara/sahara.c
>> index 5e17d71a2d34..b07f6bd0e19f 100644
>> --- a/drivers/soc/qcom/sahara/sahara.c
>> +++ b/drivers/soc/qcom/sahara/sahara.c
>> @@ -795,6 +795,7 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
>>   
>>   static const struct mhi_device_id sahara_mhi_match_table[] = {
>>   	{ .chan = "QAIC_SAHARA", },
>> +	{ .chan = "SAHARA", },
>>   	{},
>>   };
>>   
>> -- 
>> 2.34.1
>>

