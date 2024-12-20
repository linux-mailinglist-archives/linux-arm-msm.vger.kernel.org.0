Return-Path: <linux-arm-msm+bounces-42976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B849F91AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 12:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25C371895F56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 11:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC1D1C4A34;
	Fri, 20 Dec 2024 11:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CT9dBA7+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B301C75F2;
	Fri, 20 Dec 2024 11:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734695475; cv=none; b=c47DmPcGLv0bIXAdUql7xKGe9aABQuyboYf6cT89RlWvnU5ACyQXOmYh62QYwam6ysbXun1FTS4hjNPPTWBSVox2/eGCLmYWEdFNQYD0dbCT+f3qmoBqpF+417Riy4+j6a62dS2ZWhxNJxTTor3bTiTU9zCCTXBAYIS1heZtGl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734695475; c=relaxed/simple;
	bh=kk0D1HDgN+uzz+al8DmKwAUPHEcunuEhRDRu8uKa2W8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bDf3hzm/ah269zCbtyRiHxLQ8MKbPfGnRZRa16sJvQ4Lho6KRN9GWVVuuvPkCvk5oPWZPdkaOoQGpjfl0sSWMYzHuWt5V96a+9jWAVisUK1bLHa2XogJso8+47lixOgLLtS3L+lo0imd7YMErbN00RPPU8ECR+dZj/+N3tW33Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CT9dBA7+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK7Lmui028186;
	Fri, 20 Dec 2024 11:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jbule/aC8PTf5qGg5Ul+prOAU51iCS9OFJMIQUQUwPc=; b=CT9dBA7+6qtu2BVm
	vifmBWLyt4bhKvoMdIHFXMdkyG6xrIvGIUsR8SKytuTcWZwULBag07ezIOrzQEgz
	TXZX2LB60eH12GMzZU7mHREXZvOMx5vSLYhoaVBUuSJFdJyrPpB9EQSEuPssCrxN
	Kf4mb2ZiW/xImKgyevJELK/FV7K5PGz3sgy8jfxRLUKxIRK99p/Nz2sMTmWs+fHZ
	40Ia//OuH9jP3labxrEelvmDO6YQi57f9tz0bQeK0l3e0hT1uel0DhGF6WtGd0KM
	5pWT1WV1TLc71ojX4ERgBy6IGXR1diZh9cdyOtCEWbNrZTHX+kxUmFAFjPDUVl8j
	GkxuAA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n44ggpn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 11:50:53 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BKBoqoK012016
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 11:50:52 GMT
Received: from [10.239.132.150] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Dec
 2024 03:50:48 -0800
Message-ID: <9d0324de-e42a-43b8-bdcc-0d0885434b25@quicinc.com>
Date: Fri, 20 Dec 2024 19:50:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] platform: arm64: Add driver for EC found in most
 X1E laptops
To: Maya Matuszczyk <maccraft123mc@gmail.com>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
CC: Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>,
        Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
	<alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Andreas
 Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        <rust-for-linux@vger.kernel.org>
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
 <20241219200821.8328-2-maccraft123mc@gmail.com>
 <a2310cf8-5e00-4233-8c56-f04d3f692b13@linaro.org>
 <CAO_MupK8GYwNep9k-C28=Ly8wgn1T6LLiYnFcbKg0spRNXbkYw@mail.gmail.com>
From: "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
Content-Language: en-US
In-Reply-To: <CAO_MupK8GYwNep9k-C28=Ly8wgn1T6LLiYnFcbKg0spRNXbkYw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bG1p-lHjGMXSeB2YzjpZbwVnHBvKYQX-
X-Proofpoint-GUID: bG1p-lHjGMXSeB2YzjpZbwVnHBvKYQX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1011 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200097

On 12/20/2024 4:58 AM, Maya Matuszczyk wrote:
> czw., 19 gru 2024 o 21:43 Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> napisał(a):
>>
>> On 19/12/2024 20:08, Maya Matuszczyk wrote:
>>> Currently it features only reporting that the AP is going to suspend,
>>> which results in keyboard backlight turning off and the power LED
>>> slowly blinking on the Lenovo Yoga Slim 7x.
>>>
>>> Honor Magicbook Art 14 and Lenovo Yoga Slim 7x are known to have
>>> firmware with extensions which would need appropriate handling.
>>> For reverse engineering the firmware on them I have written a Rust
>>> utility:
>>>
>>> https://github.com/Maccraft123/it8987-qcom-tool.git
>>>
>>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>> ---
>>>   MAINTAINERS                              |   6 +
>>>   drivers/platform/arm64/Kconfig           |   8 ++
>>>   drivers/platform/arm64/Makefile          |   1 +
>>>   drivers/platform/arm64/qcom-x1e-it8987.c | 158 +++++++++++++++++++++++
>>>   4 files changed, 173 insertions(+)
>>>   create mode 100644 drivers/platform/arm64/qcom-x1e-it8987.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index b878ddc99f94..08d170e2e1e3 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -12890,6 +12890,12 @@ S:   Maintained
>>>   W:  http://legousb.sourceforge.net/
>>>   F:  drivers/usb/misc/legousbtower.c
>>>
>>> +QCOM IT8987 EC DRIVER
>>> +M:   Maya Matuszczyk <maccraft123mc@gmail.com>
>>> +S:   Maintained
>>> +F:   Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml

Actually, the IT8987 is from ITE Tech. As far as I know, there are other
platforms besides x1e that use this. So if this driver can be also
applied for all ITE it8987, it might be better to say 'ITE IT8987'
instead of 'QCOM IT8987'. This also applies to the file name and function.
>>> +F:   drivers/platform/arm64/qcom-x1e-it8987.c
>>> +
>>>   LETSKETCH HID TABLET DRIVER
>>>   M:  Hans de Goede <hdegoede@redhat.com>
>>>   L:  linux-input@vger.kernel.org
>>> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
>>> index f88395ea3376..ebb7b4f70ca0 100644
>>> --- a/drivers/platform/arm64/Kconfig
>>> +++ b/drivers/platform/arm64/Kconfig
>>> @@ -49,4 +49,12 @@ config EC_LENOVO_YOGA_C630
>>>
>>>         Say M or Y here to include this support.
>>>
>>> +config EC_QCOM_X1E_IT8987
>>> +     tristate "Embedded Controller driver for most X1E80100 laptops"
>>> +     depends on ARCH_QCOM || COMPILE_TEST
>>> +     depends on I2C
>>> +     help
>>> +       This driver currently supports reporting device suspend to the EC so it
>>> +       can take appropriate actions.
>>> +
>>>   endif # ARM64_PLATFORM_DEVICES
>>> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
>>> index b2ae9114fdd8..b9aa195bc1e6 100644
>>> --- a/drivers/platform/arm64/Makefile
>>> +++ b/drivers/platform/arm64/Makefile
>>> @@ -7,3 +7,4 @@
>>>
>>>   obj-$(CONFIG_EC_ACER_ASPIRE1)       += acer-aspire1-ec.o
>>>   obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
>>> +obj-$(CONFIG_EC_QCOM_X1E_IT8987) += qcom-x1e-it8987.o
>>> diff --git a/drivers/platform/arm64/qcom-x1e-it8987.c b/drivers/platform/arm64/qcom-x1e-it8987.c
>>> new file mode 100644
>>> index 000000000000..d27067d6326a
>>> --- /dev/null
>>> +++ b/drivers/platform/arm64/qcom-x1e-it8987.c
>>> @@ -0,0 +1,158 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
>>> + */
>>> +#include <linux/i2c.h>
>>> +#include <linux/module.h>
>>> +#include <linux/input.h>
>>> +#include <linux/input/sparse-keymap.h>
>>
>> Your includes should be alphabetised.
>>
>>> +
>>> +#define EC_IRQ_REASON_REG 0x05
>>> +#define EC_SUSPEND_RESUME_REG 0x23
>>> +#define EC_IRQ_ENABLE_REG 0x35
>>> +
>>> +#define EC_NOTIFY_SUSPEND_ENTER 0x01
>>> +#define EC_NOTIFY_SUSPEND_EXIT 0x00
>>> +#define EC_NOTIFY_SCREEN_OFF 0x03
>>> +#define EC_NOTIFY_SCREEN_ON 0x04
>>> +
>>> +#define EC_IRQ_MICMUTE_BUTTON 0x04
>>> +#define EC_IRQ_FAN1_STATUS_CHANGE 0x30
>>> +#define EC_IRQ_FAN2_STATUS_CHANGE 0x31
>>> +#define EC_IRQ_FAN1_SPEED_CHANGE 0x32
>>> +#define EC_IRQ_FAN2_SPEED_CHANGE 0x33
>>> +#define EC_IRQ_COMPLETED_LUT_UPDATE 0x34
>>> +#define EC_IRQ_COMPLETED_FAN_PROFILE_SWITCH 0x35
>>> +#define EC_IRQ_THERMISTOR_1_TEMP_THRESHOLD_CROSS 0x36
>>> +#define EC_IRQ_THERMISTOR_2_TEMP_THRESHOLD_CROSS 0x37
>>> +#define EC_IRQ_THERMISTOR_3_TEMP_THRESHOLD_CROSS 0x38
>>> +#define EC_IRQ_THERMISTOR_4_TEMP_THRESHOLD_CROSS 0x39
>>> +#define EC_IRQ_THERMISTOR_5_TEMP_THRESHOLD_CROSS 0x3a
>>> +#define EC_IRQ_THERMISTOR_6_TEMP_THRESHOLD_CROSS 0x3b
>>> +#define EC_IRQ_THERMISTOR_7_TEMP_THRESHOLD_CROSS 0x3c
>>> +#define EC_IRQ_RECOVERED_FROM_RESET 0x3d

Could you provide more details or any document references for the IRQ
reasons defined above? It seems incomplete to me.
By the way, I noticed this is a V2, but I couldn't find V1. Perhaps
including a cover letter next time would be helpful.
>>> +
>>> +struct qcom_x1e_it8987_ec {
>>> +     struct i2c_client *client;
>>> +     struct input_dev *idev;
>>> +     struct mutex lock;
>>> +};
>>> +
>>> +static irqreturn_t qcom_x1e_it8987_ec_irq(int irq, void *data)
>>> +{
>>> +     struct qcom_x1e_it8987_ec *ec = data;
>>> +     struct device *dev = &ec->client->dev;
>>> +     int val;
>>> +
>>> +     guard(mutex)(&ec->lock);
>>
>> What's the thing that can execute at the same time as this procedure -
>> there doesn't appear to be any concurrent candidate in this patch.
> The user could suspend the laptop and the EC could fire an IRQ at the same
> time... I'll need to add mutex locking to suspend/resume functions
> 

Using a mutex lock inside an IRQ handler is not advisable. Additionally,
since this IRQ appears to be only for logging purposes, is it really
necessary for it to be triggered during suspend and resume?
> 
>>> +
>>> +     val = i2c_smbus_read_byte_data(ec->client, EC_IRQ_REASON_REG);
>>> +     if (val < 0) {
>>> +             dev_err(dev, "Failed to get EC IRQ reason: %d\n", val);
>>> +             return IRQ_HANDLED;
>>> +     }
>>> +
>>> +     dev_info(dev, "Unhandled EC IRQ reason: %d\n", val);
>>
>> Should an unhandled IRQ be an info or an err ?
> I don't know, it's "unimplemented but doesn't really matter"
> 
>>
>>> +
>>> +     return IRQ_HANDLED;
>>> +}
>>> +
>>> +static int qcom_x1e_it8987_ec_probe(struct i2c_client *client)
>>> +{
>>> +     struct device *dev = &client->dev;
>>> +     struct qcom_x1e_it8987_ec *ec;
>>> +     int ret;
>>> +
>>> +     ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
>>> +     if (!ec)
>>> +             return -ENOMEM;
>>> +
>>> +     mutex_init(&ec->lock);
>>> +     ec->client = client;
>>> +
>>> +     ret = devm_request_threaded_irq(dev, client->irq,
>>> +                                     NULL, qcom_x1e_it8987_ec_irq,
>>> +                                     IRQF_ONESHOT, "qcom_x1e_it8987_ec", ec);
>>> +     if (ret < 0)
>>> +             return dev_err_probe(dev, ret, "Unable to request irq\n");
>>> +
>>> +     ret = i2c_smbus_write_byte_data(client, EC_IRQ_ENABLE_REG, 0x01);
>>> +     if (ret < 0)
>>> +             return dev_err_probe(dev, ret, "Failed to enable interrupts\n");
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static void qcom_x1e_it8987_ec_remove(struct i2c_client *client)
>>> +{
>>> +     struct device *dev = &client->dev;
>>> +     int ret;
>>> +
>>> +     ret = i2c_smbus_write_byte_data(client, EC_IRQ_ENABLE_REG, 0x00);
>>> +     if (ret < 0)
>>> +             dev_err(dev, "Failed to disable interrupts: %d\n", ret);
>>> +}
>>> +
>>> +static int qcom_x1e_it8987_ec_suspend(struct device *dev)
>>> +{
>>> +     struct i2c_client *client = to_i2c_client(dev);
>>> +     int ret;
>>> +
>>> +     ret = i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG, EC_NOTIFY_SCREEN_OFF);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ret = i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG, EC_NOTIFY_SUSPEND_ENTER);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int qcom_x1e_it8987_ec_resume(struct device *dev)
>>> +{
>>> +     struct i2c_client *client = to_i2c_client(dev);
>>> +     int ret;
>>> +
>>> +     ret = i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG, EC_NOTIFY_SUSPEND_EXIT);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ret = i2c_smbus_write_byte_data(client, EC_SUSPEND_RESUME_REG, EC_NOTIFY_SCREEN_ON);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static const struct of_device_id qcom_x1e_it8987_ec_of_match[] = {
>>> +     { .compatible = "lenovo,yoga-slim7x-ec" },
>>> +     { .compatible = "qcom,x1e-it9897-ec" },
>>> +     {}
>>> +};
>>> +MODULE_DEVICE_TABLE(of, qcom_x1e_it8987_ec_of_match);
>>> +
>>> +static const struct i2c_device_id qcom_x1e_it8987_ec_i2c_id_table[] = {
>>> +     { "qcom-x1e-it8987-ec", },
>>> +     {}
>>> +};
>>> +MODULE_DEVICE_TABLE(i2c, qcom_x1e_it8987_ec_i2c_id_table);
>>> +
>>> +static DEFINE_SIMPLE_DEV_PM_OPS(qcom_x1e_it8987_ec_pm_ops,
>>> +             qcom_x1e_it8987_ec_suspend,
>>> +             qcom_x1e_it8987_ec_resume);
>>> +
>>> +static struct i2c_driver qcom_x1e_it8987_ec_i2c_driver = {
>>> +     .driver = {
>>> +             .name = "yoga-slim7x-ec",
>>> +             .of_match_table = qcom_x1e_it8987_ec_of_match,
>>> +             .pm = &qcom_x1e_it8987_ec_pm_ops
>>> +     },
>>> +     .probe = qcom_x1e_it8987_ec_probe,
>>> +     .remove = qcom_x1e_it8987_ec_remove,
>>> +     .id_table = qcom_x1e_it8987_ec_i2c_id_table,
>>> +};
>>> +module_i2c_driver(qcom_x1e_it8987_ec_i2c_driver);
>>> +
>>> +MODULE_DESCRIPTION("Lenovo Yoga Slim 7x Embedded Controller");
>>> +MODULE_LICENSE("GPL");
>>
>> Otherwise looks pretty good to me, nice hacking :)
>>
>> ---
>> bod
>>


-- 
Thx and BRs,
Aiqun(Maria) Yu

