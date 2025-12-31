Return-Path: <linux-arm-msm+bounces-87059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB81FCEB58F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 07:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40E3D30090A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 06:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3FFC1D9A5F;
	Wed, 31 Dec 2025 06:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L6fNTd4t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z7XF/GPK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A132BAF4
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 06:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767162789; cv=none; b=ewJpvuxrexGb45EKe1ijjgbw19DqGMqAWyYC4XbcXNeaa/WpanviuI4vDI4IgO/2KX+rfDxxivqKaK72DMg6QeMbAdTlYRIGDRs7Z02yuQzXHhUWTdutdpPWUYRxSQcjjxdDBcrq8wPUy/wzeNIUVtg4bWOfNNE9z/bRsa/X2wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767162789; c=relaxed/simple;
	bh=ZEWYEWDDeP6gdb3lEeXP/y3oqDzSpocoNta5So617vI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mydbwa9JGYeTLFPEDIBciIseCBjttkeAVksya/p06IDHJKQqfLQRnMr/ZMUeESogtIeSqV89VuM2CeLoi9uXS1HYb6usAA7imGe/Hzyxljf2ze2e0MeopsU7V+cK5eMvdCQ2WaqQy7LNsnHIze/qCCTuxFA+enFD11Rei4sMh6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L6fNTd4t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z7XF/GPK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BULPIqZ2551611
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 06:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YCEYYsq4ZhM7LuwiDr23e+07qSBlBDIgToQnNungY7c=; b=L6fNTd4tGD5pp/UE
	xUto/mn0m8s4mFfKVDvVb4I5rGnQ79nrGgyPhxU3QCBxQqmkcsA+7/tK/15JY0jY
	b47YmsrIj6Gpd0KTdGMkZToQtJ9/mxULrXtItLP8ejeaTn8vucJW65Ld/2nb/AcV
	V+HvtAAO8NxvhooQDXgnMXoW8InEWxDIXfomrBhToJGCynavDlgYpAoSZl4qNl2a
	Y6BfZdSQCDwZe+GOUOZ8ALlH9ilCN4oUjFJtfF4lG/EgZHcZyO/EH+cUamfTOJb1
	kI8uIuYl23oPWzjNSLkuiF+XTIQfg4aErSjLln1uARa4Bkwh6gSa9juOFU3xSk+R
	iMOolg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0skkq3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 06:33:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed74ab4172so248620261cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 22:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767162786; x=1767767586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YCEYYsq4ZhM7LuwiDr23e+07qSBlBDIgToQnNungY7c=;
        b=Z7XF/GPKOCu1cEdpTELqbezLIyBLzIoyL/iZN5p8mdJnw5wEcaN6w35Tjr+lK1Ypiv
         Ak2KxvSY3eG/xo5hOMcjNwWcpBRHhd2NwmMuQsE/o+VGMf0qPDCeFAuE4JZVJfFWIvH6
         q05QHNkyyo9we2HIpaBdOKbSV/8/xIpfpTwxCd0iDYzBUI721I7kZCjt6xOcfKuryqBh
         mbYreZcjo3k/IY3++ghdK1b6ZMLsXjjYIKQ6wgYRY6zEMyW1PGgaECqhCP4BM6LrBADl
         OK5Wj4TQr1Qcd6tD4hk5PpsMFW1J+MqIKV5tIjBCrEvm6NrpM3XjBBKn7ypP6idokglC
         xpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767162786; x=1767767586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YCEYYsq4ZhM7LuwiDr23e+07qSBlBDIgToQnNungY7c=;
        b=Pqe+7D12Fs2Cyftc9Ks7J0ToDWeooEheLtUs77+D6dM1/vhB3Ys8uxTxYYgO7BYhQo
         4cOf+60zvAHjSNJbgMGqPuhSmM8OjEbT4iiAcQm4mBYi7einI2VjjyC4DCxu1s/oW9bq
         hEU2Sk+wfVdVRUz939LC3lM7JtXUzK1pYv5S9gWXxBDosXS2r7B0NcLiE7GQeoUWxfyp
         EQh/BXzHqF26DDNkoivuwJ64gmvBAPRAyYx8o7HNAmgTds0Ba0AKKgQX1zihuvfeHsQg
         Xupv2ckYoM+VnMHfMI94Mzk1rJfcdxmNcLqNSPR28dxoqhS2Oj20WwqqCmRjJRstVBk0
         UVoA==
X-Forwarded-Encrypted: i=1; AJvYcCWN10Kgvv5F2UhVHGpMfez2saGBc0I8h3j0I9/Vr0k+3Di1TIJ62ea4n4womq8DPCAVI6qetY9NkPR6PJuM@vger.kernel.org
X-Gm-Message-State: AOJu0YwsrZq7FzYrZBzeAM3y9PJ3vPMOXlKWqkkO9rWiHgL8EL15qWWM
	1p9KmK1GxGZujAEBxKRh8s9Mf3Oiztj7NIkRcF3sKonuuZtBsBksG/VVFFR56JtztQ2xyf9yLiz
	htcYIu6i1dSV3HUCus+KeTRWP0moqp6jK3w2x6ih2QFecfa52EzPRjyAN9C9NfXO2u49QvmXnCv
	WI
X-Gm-Gg: AY/fxX6ibCa4sCx5hzC6l2k/ziRVWGjmRKwBuzyHa2dF32Sr2zIU9njiR52STzYih5r
	lE1xXyT2uqhMuWfHl2WSKcsxLV7ACqWlJuBhZrkBg9uTQrjCTFmknbgEvjfNbVKw22CicY0YJBh
	U8NXFEmQM94qe38wykPaC5P3cKLPp2VTjfB4GbYtkv7X5P39Fpq2unyCDvyuf/eR1j7KPaHOEie
	IRgaKczV7nS4m/8XeLILmRazuUp/UM0L2ROysjlbG3dcllkV/VFPUyDxL2xQ7uQDK77GtE0cnBy
	UoePBAOfe1patJAxVvNfjc6fMVuoiq/A5lI3hlZNL21udp016v8Fk7n8OFn3rlc96q3nixuALjp
	q/4i5dDfG+nmMJ4GebRvVecYvMfYS7IACc0BRq5q1KU0jo+ERvVpyjDVIrbuZZeYz98hovMCq3u
	0oNIy+O0k1XaC6
X-Received: by 2002:a05:622a:344:b0:4f3:4ec0:9032 with SMTP id d75a77b69052e-4f4abdd5bb4mr517512561cf.72.1767162786074;
        Tue, 30 Dec 2025 22:33:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbVVPiUu9/9xOzV2d3JboY1CL5Me1rW7KZn5Lm58vJXyZqGKFcOFoYJsTxMJLmrEadLtIiZQ==
X-Received: by 2002:a05:622a:344:b0:4f3:4ec0:9032 with SMTP id d75a77b69052e-4f4abdd5bb4mr517512361cf.72.1767162785537;
        Tue, 30 Dec 2025 22:33:05 -0800 (PST)
Received: from ?IPV6:2001:14ba:a073:af00::4c9? (2001-14ba-a073-af00--4c9.rev.dnainternet.fi. [2001:14ba:a073:af00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5eccsm10862767e87.14.2025.12.30.22.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 22:33:04 -0800 (PST)
Message-ID: <68d70a3d-4443-4596-842a-e8a700b276eb@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 08:33:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/8] thermal: qcom: add qmi-cooling driver
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        konradybcio@kernel.org, amitk@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
 <20251223123227.1317244-5-gaurav.kohli@oss.qualcomm.com>
 <gp5alhoqcty3nqj5jgm33nzytjtqp35pq6ycefxyvubqoggjqk@ndip4esdd6oi>
 <f3013c96-673f-4a7c-8296-d4d7d0ec2a44@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <f3013c96-673f-4a7c-8296-d4d7d0ec2a44@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA1NSBTYWx0ZWRfX4K0axp8dHzaA
 REHx2QNg1lGH80Nc9JXdU42ZIBHqms/4S3JiqFMeUDRqRl0dyzCwz8IA0d7NsymkaGC0SlNzzKD
 B4PLib3wOut9/cIVaoFxC7gEVFNEBwo+OTZTRZCmOt5Xs3yUTrBvII3bwBR68/e7k6JuCiFVN+s
 Qr3SXwZDmYnNpXyllk+xNbvRdNYXDjCMoUBILqO/CQenlGLH+4ZdoLMzlCxI2t/bwa5WkE0p/5Y
 Bew7KTlqn4s/bils/ordqkIsf+qDDuQTPISlYqctGTff+uMDrN2XBW2YnxSbYOou4Odthb7UVuJ
 eyz2rkBFbXfQbBYEE962hVofiY8DX7fZbt0AP2Kc4gsDxdNkpzvKsYAR3y15sFk/GlNjuJeCpXN
 befzJmats+2/gJ1mrbPi3shKzjALpF+xD2m+wKY2Q31Ep8r+3/fFSUq4sPLI7VSFbb0Svx+pH9U
 U4XmFbuz1U57BKxyQhQ==
X-Proofpoint-ORIG-GUID: g5gjACG-8no0EBsBNU-Ht6SWHAGd91eu
X-Proofpoint-GUID: g5gjACG-8no0EBsBNU-Ht6SWHAGd91eu
X-Authority-Analysis: v=2.4 cv=FJ0WBuos c=1 sm=1 tr=0 ts=6954c3a2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=LQj-z2CNEsGdv2HSHM8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310055

On 31/12/2025 08:28, Gaurav Kohli wrote:
> 
> On 12/24/2025 1:19 AM, Dmitry Baryshkov wrote:
>> On Tue, Dec 23, 2025 at 06:02:23PM +0530, Gaurav Kohli wrote:
>>> From: Casey Connolly <casey.connolly@linaro.org>
>>>
>>> The Thermal Mitigation Device (TMD) service exposes various platform
>>> specific thermal mitigations available on remote subsystems (ie the
>>> modem and cdsp). The service is exposed via the QMI messaging
>>> interface, usually over the QRTR transport.
>>>
>>> Qualcomm QMI-based TMD cooling devices are used to mitigate thermal
>>> conditions across multiple remote subsystems. These devices operate
>>> based on junction temperature sensors (TSENS) associated with thermal
>>> zones for each subsystem.
>>>
>>> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>>> ---
>>>   drivers/soc/qcom/Kconfig           |  13 +
>>>   drivers/soc/qcom/Makefile          |   1 +
>>>   drivers/soc/qcom/qmi-cooling.c     | 498 +++++++++++++++++++++++++++++
>>>   drivers/soc/qcom/qmi-cooling.h     | 428 +++++++++++++++++++++++++
>>>   drivers/thermal/qcom/qmi-cooling.h | 428 +++++++++++++++++++++++++
>>>   5 files changed, 1368 insertions(+)
>>>   create mode 100644 drivers/soc/qcom/qmi-cooling.c
>>>   create mode 100644 drivers/soc/qcom/qmi-cooling.h
>>>   create mode 100644 drivers/thermal/qcom/qmi-cooling.h
>>>
>>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>>> index 2caadbbcf830..905a24b42fe6 100644
>>> --- a/drivers/soc/qcom/Kconfig
>>> +++ b/drivers/soc/qcom/Kconfig
>>> @@ -124,6 +124,19 @@ config QCOM_PMIC_GLINK
>>>         Say yes here to support USB-C and battery status on modern 
>>> Qualcomm
>>>         platforms.
>>> +config QCOM_QMI_COOLING
>>> +    tristate "Qualcomm QMI cooling drivers"
>>> +    depends on QCOM_RPROC_COMMON
>>> +    depends on ARCH_QCOM || COMPILE_TEST
>>> +    select QCOM_QMI_HELPERS
>>> +    help
>>> +       This enables the remote subsystem cooling devices. These cooling
>>> +       devices will be used by Qualcomm chipset to place various remote
>>> +       subsystem mitigations like remote processor passive mitigation,
>>> +       remote subsystem voltage restriction at low temperatures etc.
>>> +       The QMI cooling device will interface with remote subsystem
>>> +       using Qualcomm remoteproc interface.
>>> +
>>>   config QCOM_QMI_HELPERS
>>>       tristate
>>>       depends on NET
>>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>>> index b7f1d2a57367..b6728f54944b 100644
>>> --- a/drivers/soc/qcom/Makefile
>>> +++ b/drivers/soc/qcom/Makefile
>>> @@ -14,6 +14,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)    += pmic_glink.o
>>>   obj-$(CONFIG_QCOM_PMIC_GLINK)    += pmic_glink_altmode.o
>>>   obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)    += pmic_pdcharger_ulog.o
>>>   CFLAGS_pmic_pdcharger_ulog.o    :=  -I$(src)
>>> +obj-$(CONFIG_QCOM_QMI_COOLING) += qmi-cooling.o
>>>   obj-$(CONFIG_QCOM_QMI_HELPERS)    += qmi_helpers.o
>>>   qmi_helpers-y    += qmi_encdec.o qmi_interface.o
>>>   obj-$(CONFIG_QCOM_RAMP_CTRL)    += ramp_controller.o
>>> diff --git a/drivers/soc/qcom/qmi-cooling.c b/drivers/soc/qcom/qmi- 
>>> cooling.c
>>> new file mode 100644
>>> index 000000000000..1a6afcb96bf6
>>> --- /dev/null
>>> +++ b/drivers/soc/qcom/qmi-cooling.c
>>> @@ -0,0 +1,498 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (c) 2017, The Linux Foundation
>>> + * Copyright (c) 2025, Linaro Limited
>>> + *
>>> + * QMI Thermal Mitigation Device (TMD) client driver.
>>> + * This driver provides an in-kernel client to handle hot and cold 
>>> thermal
>>> + * mitigations for remote subsystems (modem and DSPs) running the 
>>> TMD service.
>>> + * It doesn't implement any handling of reports from remote subsystems.
>>> + */
>>> +
>>> +#include <linux/cleanup.h>
>>> +#include <linux/err.h>
>>> +#include <linux/module.h>
>>> +#include <linux/net.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/remoteproc/qcom_rproc.h>
>>> +#include <linux/remoteproc_cooling.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/soc/qcom/qmi.h>
>>> +#include <linux/thermal.h>
>>> +
>>> +#include "qmi-cooling.h"
>>> +
>>> +#define MODEM0_INSTANCE_ID    0x0
>>> +#define ADSP_INSTANCE_ID    0x1
>>> +#define CDSP_INSTANCE_ID    0x43
>> Will CDSP1 also use instance ID? What are instance IDs for GPDSP?
> 
> 
> In Leman's there are two different cdsp subsytem, i will add new 
> instance id for that also.
> 
> What is GPdsp, you mean gpu ?
> 

No, I mean general purpose DSP aka GPDSP aka GDSP.

-- 
With best wishes
Dmitry

