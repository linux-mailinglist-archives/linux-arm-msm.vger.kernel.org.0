Return-Path: <linux-arm-msm+bounces-80087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3A2C2B518
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 12:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25B293A87A7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 11:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6773019BF;
	Mon,  3 Nov 2025 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BwZuNa4R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZwnyiR07"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9830927E04C
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 11:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762169168; cv=none; b=YNzJVkCQ9X/ARiFdJ0P9x8NSRR2oww5la0ZF0uyf8HrR201GvPdSCqQ0lQdgaKpDKKLcyRx3V/yEBa310Uns84RM59c3AeagOXukCifROG0igTwe4QLlyQo5gDk+smTMUkbIk6/Bar2De55GBqq8avzguhZ4nYylsNL9b2sVu8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762169168; c=relaxed/simple;
	bh=X+Wzpjq8bqDhL2M17VMZ5rZ61KInyU7x6Qam/IxdXI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M25IEkIN27UGXlMCJnNChDYzM/XraecXZR93F/TQd/z80yxYz/Zs2KFm21zVJlOGvXHcscBQuAguscYc4S7WABaQ6JJUKpF3QMEOSKAhU2AZ4PY3dDS0nkG+oVfFD+TrKW+5LullkLWYEaX52ZaQXUWZysexLgQ6/+lOZV3EIK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BwZuNa4R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZwnyiR07; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A382kDu695100
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 11:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngol7nW2zl45ucWLm4lh9GvYwHuCK1cA2zGx0XGYp6Y=; b=BwZuNa4Rd9cHddtZ
	0W6kJ2aLGQylfVRUBGJjW+hdk7SghMAiJgN/aU4t7dEf5BBE436LISEDKw2OBeLA
	QQb8iGvFN3NS+zIruVLY8YJhE4Dq4A+PFVypZdzcj4y3v4tQJKJV6r0SGf5BxCdI
	LUIoUyogRbuDqxur//fNlu+MvBmwci8KglgiCP2L3y4GKUcKYpNiLj+cp9337UOZ
	T6d3kQavaVaYPQxs2ClO97iDFKocVsk2Xr/FQ9woJAMovUl/fyPGC3DrQE00agK/
	s4pDVVnhrbkPL45tSZXNMsrGc73CV0fd4xB0aIAmW+6vQ2KGcZKvAdFYAjLOEDWw
	vZTgag==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ak8mf3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 11:26:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b9939dc50e7so946005a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 03:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762169163; x=1762773963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngol7nW2zl45ucWLm4lh9GvYwHuCK1cA2zGx0XGYp6Y=;
        b=ZwnyiR07LfcJhFPB4umvrbvcY4A2xCyT5zBcis6Uh3wsVi3qXeIsiu8ob4fB7XU8aU
         pBX+zlhbrb+WkQ0gZFohthq0AOAj9lfRaCSDhYniRs56DP601vLc9TrivucW1rqszQJL
         coFsDh8FCSZJ8TZoX3J0fPBOahAbN9fCP+DDx2iG2aDgbzKzkl1OIFpboCjfCu26+0Fz
         i7chFw9QlMbFuK1g3wMTANJzjA7KNaw/wKwzQX8kWL20OW8QlIVbT0c94zFnHG0MUiKK
         ViOvqdgcc5xUSQgeRoaIQre+SHkdgjptCDqgJP0GGbbd2ufdLclY2watqvb6fSRMaJDc
         YhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762169163; x=1762773963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ngol7nW2zl45ucWLm4lh9GvYwHuCK1cA2zGx0XGYp6Y=;
        b=qv4g5f760vMbzPnS5AGsJKro38BR5sNAt/vRRyccSZOMdYD2K3n2pYsZ0+2uwmXYJN
         08kNdUxnVDPdldB5eX/jUxDCUzWLMHZ0uLtFoRHxla5kCVRfzYgrUwCHjHvWmHyyS4BT
         +k3vt9/rjU4ea7vpyFpjuon/ehjByDzHFNBuAtaw9K5cWY6RdZza+wlk+cNWH1SHUD6+
         +LQ77AtUckSiZKJCxOIGGPoGLrSRh1CF3QxJYsiqd136n9OK0GVopR1WfbX3GdG5jz0Q
         ZEd9kGgRJEQ0TGoCeyG6Pd2DoasSa2xpH1BfH8k08DjEJ7U3eGlV4GL9HE3h76MH8TCK
         ZiMw==
X-Forwarded-Encrypted: i=1; AJvYcCW0U8n8IMGILm6pG2LpCt9bg5Q9bt6yXR5ElfqGpFvi8imTWZJh3zFrmZ4xFPpgR5OQB+1MxfBrbijxrCyf@vger.kernel.org
X-Gm-Message-State: AOJu0YwaUlffqlvN8CdzplRvE4et5tAbOpYElYb3BBncjKO9mxuaSUn5
	5rrDdVOnYIVDcGHi2NQrW7cm4hjWKchnM/jdbJCM+k1mMWo9CFFCVrLu5hBKs4EAuQrp1btO2aL
	9R4UCx0Bmrgg2b+4ASYC9Dg5udM/JPUmsdTEfyWi7m01t584LdYC9tgL5eo9vDiLj6KoJCuuaf4
	QJ
X-Gm-Gg: ASbGncsBL0gR72ZLnqC6QuAck66Xv2H6QEWRCpDjJ+ZxxNfras7FXBeklGiYIt3lXif
	Jf2nw5wLgeGIg6dR0j5HsKlYZZLzHl1yKUugUGFMBWNrjGdCAJRWPXC8dD0p5eCNXCaDBWp3oe0
	07Y8fT6G1hHKr6e5xnY93SyUhT0x/hZ4F7YGY0tlyptwtjpBSAIlvhL8GupnMlFYIooC8dpVAjo
	qPzCwd8UqVnCl+dOYzSrAx0hM2rYlSeOdyChGY3it3jK1Gr68O664sy43I5Af7NzKC7lIwyGqW6
	JOEtFYSb2N7wjXZYv4wBVC7xgJnjQ2N+uQN2GBxjyIwbFUriAvZGsP/m9+Y58OEa8rcvcYpMq5S
	lC4f/gOXmVGa8m5gKWy96qs8FeOZll5lQOnWps3jirgi39BfKnXTq+M0BlYFHK/L7Jcdms+2PsZ
	NhnQwJeCuvE1+chcZ1vgj4cg==
X-Received: by 2002:a17:903:24f:b0:295:24ab:fb06 with SMTP id d9443c01a7336-29524abfc57mr121683135ad.22.1762169163009;
        Mon, 03 Nov 2025 03:26:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFE7t0jqVg1tiuYdV1bX5xFP5hFkfm7TGhPRUycHIv0d9nowitbwt86ODQdNV+hxVgNrhnkEw==
X-Received: by 2002:a17:903:24f:b0:295:24ab:fb06 with SMTP id d9443c01a7336-29524abfc57mr121682935ad.22.1762169162343;
        Mon, 03 Nov 2025 03:26:02 -0800 (PST)
Received: from [10.190.211.199] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952e9a399csm110408665ad.33.2025.11.03.03.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 03:26:01 -0800 (PST)
Message-ID: <244146c5-5e60-4a39-ace4-395a0d203123@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 16:55:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] watchdog: Add driver for Gunyah Watchdog
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-2-7abb1ee11315@oss.qualcomm.com>
 <4bxoananq55f7u4kckqjof37or6fflppmbyyc3j6noodzr75nt@vtfxbnhrcgzy>
Content-Language: en-US
From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
In-Reply-To: <4bxoananq55f7u4kckqjof37or6fflppmbyyc3j6noodzr75nt@vtfxbnhrcgzy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jeweXBkCDt7rcPcXdqca4VUEqBU3u9Vu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEwNCBTYWx0ZWRfX2z65dNPrnC3D
 5CKFELBWUFvFI3meIC6IIj30ZVz4ORbMyjIa6wTtyk9/8XdZ0LiJZh5YOLktIfF6zwDR9Ll5nVi
 KOCal/opp62GMA9fMNRroeTRmWsBx7mBhMZDcUML80WATMcBGrctiEhJKj+fi6XRW6C5mWqR2Nh
 1I8dqSVun922r/bCAbJoEnkYxuEvGKsA6Z0ts96SqAw967E2cpg8nXFFqzZEcN46BycoHyDLpQq
 dmhUPScKY9uqE8sbzgAYyMYlQTtd4zA7UQZqJFTuVe85cegxQNO/qETiQ9jPNRuF4Lll9WPe3FE
 /hKZzVUJQ2LvL1baPjAqHssUmkhylxJJMcFxLcOt/hHadFxM865oZDGhyWcRK6MXo9Mn27eqCxc
 jyismw5snhQWNr8aKGiGvjqaaELBig==
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=6908914c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=O96TITwDLVoE2LCyXrwA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: jeweXBkCDt7rcPcXdqca4VUEqBU3u9Vu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030104


On 10/31/2025 8:06 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 31, 2025 at 10:18:14AM +0000, Hrishabh Rajput via B4 Relay wrote:
>> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>>
>> On Qualcomm SoCs running under the Gunyah hypervisor, access to watchdog
>> through MMIO is not available on all platforms. Depending on the
>> hypervisor configuration, the watchdog is either fully emulated or
>> exposed via ARM's SMC Calling Conventions (SMCCC) through the Vendor
>> Specific Hypervisor Service Calls space.
>>
>> Add driver to support the SMC-based watchdog provided by the Gunyah
>> Hypervisor. Device registration is done in the SMEM driver after checks
>> to restrict the watchdog initialization to Qualcomm devices.
>> module_exit() is intentionally not implemented as this driver is
>> intended to be a persistent module.
>>
>> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                   |   1 +
>>   drivers/watchdog/Kconfig      |  14 +++
>>   drivers/watchdog/Makefile     |   1 +
>>   drivers/watchdog/gunyah_wdt.c | 249 ++++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 265 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c0b444e5fd5a..56dbd0d3e31b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3083,6 +3083,7 @@ F:	arch/arm64/boot/dts/qcom/
>>   F:	drivers/bus/qcom*
>>   F:	drivers/firmware/qcom/
>>   F:	drivers/soc/qcom/
>> +F:	drivers/watchdog/gunyah_wdt.c
>>   F:	include/dt-bindings/arm/qcom,ids.h
>>   F:	include/dt-bindings/firmware/qcom,scm.h
>>   F:	include/dt-bindings/soc/qcom*
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index 0c25b2ed44eb..f0dee04b3650 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -2343,4 +2343,18 @@ config KEEMBAY_WATCHDOG
>>   	  To compile this driver as a module, choose M here: the
>>   	  module will be called keembay_wdt.
>>   
>> +config GUNYAH_WATCHDOG
>> +	tristate "Qualcomm Gunyah Watchdog"
>> +	depends on ARCH_QCOM || COMPILE_TEST
>> +	depends on HAVE_ARM_SMCCC
>> +	depends on OF
>> +	select WATCHDOG_CORE
>> +	help
>> +	  Say Y here to include support for watchdog timer provided by the
>> +	  Gunyah hypervisor. The driver uses ARM SMC Calling Convention (SMCCC)
>> +	  to interact with Gunyah Watchdog.
>> +
>> +	  To compile this driver as a module, choose M here: the
>> +	  module will be called gunyah_wdt.
>> +
>>   endif # WATCHDOG
>> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
>> index bbd4d62d2cc3..308379782bc3 100644
>> --- a/drivers/watchdog/Makefile
>> +++ b/drivers/watchdog/Makefile
>> @@ -102,6 +102,7 @@ obj-$(CONFIG_MSC313E_WATCHDOG) += msc313e_wdt.o
>>   obj-$(CONFIG_APPLE_WATCHDOG) += apple_wdt.o
>>   obj-$(CONFIG_SUNPLUS_WATCHDOG) += sunplus_wdt.o
>>   obj-$(CONFIG_MARVELL_GTI_WDT) += marvell_gti_wdt.o
>> +obj-$(CONFIG_GUNYAH_WATCHDOG) += gunyah_wdt.o
>>   
>>   # X86 (i386 + ia64 + x86_64) Architecture
>>   obj-$(CONFIG_ACQUIRE_WDT) += acquirewdt.o
>> diff --git a/drivers/watchdog/gunyah_wdt.c b/drivers/watchdog/gunyah_wdt.c
>> new file mode 100644
>> index 000000000000..bfe8b656d674
>> --- /dev/null
>> +++ b/drivers/watchdog/gunyah_wdt.c
>> @@ -0,0 +1,249 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/arm-smccc.h>
>> +#include <linux/delay.h>
>> +#include <linux/errno.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
> Is this header used here?


Ah, you're right. of_find_compatible_node() logic has moved to the SMEM 
driver. This is no longer needed here. I will remove it in the next 
patch version.

>> +#include <linux/platform_device.h>
>> +#include <linux/watchdog.h>
>> +
>> +#define GUNYAH_WDT_SMCCC_CALL_VAL(func_id) \
>> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32,\
>> +			   ARM_SMCCC_OWNER_VENDOR_HYP, func_id)
>> +
>> +/* SMCCC function IDs for watchdog operations */
>> +#define GUNYAH_WDT_CONTROL   GUNYAH_WDT_SMCCC_CALL_VAL(0x0005)
>> +#define GUNYAH_WDT_STATUS    GUNYAH_WDT_SMCCC_CALL_VAL(0x0006)
>> +#define GUNYAH_WDT_PING      GUNYAH_WDT_SMCCC_CALL_VAL(0x0007)
>> +#define GUNYAH_WDT_SET_TIME  GUNYAH_WDT_SMCCC_CALL_VAL(0x0008)
> What about calls 0-4?


The calls 5-8 are the all the calls available for Gunyah watchdog. Calls 
0-4 do not concern with this driver, hence I have not included them here.

>> +
>> +/*
>> + * Control values for GUNYAH_WDT_CONTROL.
>> + * Bit 0 is used to enable or disable the watchdog. If this bit is set,
>> + * then the watchdog is enabled and vice versa.
>> + * Bit 1 should always be set to 1 as this bit is reserved in Gunyah and
>> + * it's expected to be 1.
>> + */
>> +#define WDT_CTRL_ENABLE  (BIT(1) | BIT(0))
>> +#define WDT_CTRL_DISABLE BIT(1)
>> +
>> +enum gunyah_error {
>> +	GUNYAH_ERROR_OK				= 0,
>> +	GUNYAH_ERROR_UNIMPLEMENTED		= -1,
>> +	GUNYAH_ERROR_ARG_INVAL			= 1,
>> +};
>> +
>> +/**
>> + * gunyah_error_remap() - Remap Gunyah hypervisor errors into a Linux error code
>> + * @gunyah_error: Gunyah hypercall return value
>> + */
>> +static inline int gunyah_error_remap(enum gunyah_error gunyah_error)
>> +{
>> +	switch (gunyah_error) {
>> +	case GUNYAH_ERROR_OK:
>> +		return 0;
>> +	case GUNYAH_ERROR_UNIMPLEMENTED:
>> +		return -EOPNOTSUPP;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
>> +
>> +static int gunyah_wdt_call(unsigned long func_id, unsigned long arg1,
>> +			   unsigned long arg2, struct arm_smccc_res *res)
>> +{
> 	struct arm_smccc_res res;
>
> There is no need to pass it through arguments.
>
>> +	arm_smccc_1_1_smc(func_id, arg1, arg2, res);
>> +	return gunyah_error_remap(res->a0);
>> +}
>> +
>> +static int gunyah_wdt_start(struct watchdog_device *wdd)
>> +{
>> +	struct arm_smccc_res res;
>> +	unsigned int timeout_ms;
>> +	struct device *dev = wdd->parent;
>> +	int ret;
>> +
>> +	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0, &res);
>> +	if (ret && watchdog_active(wdd)) {
>> +		dev_err(dev, "%s: Failed to stop gunyah wdt %d\n", __func__, ret);
>> +		return ret;
>> +	}
>> +
>> +	timeout_ms = wdd->timeout * 1000;
>> +	ret = gunyah_wdt_call(GUNYAH_WDT_SET_TIME,
>> +			      timeout_ms, timeout_ms, &res);
>> +	if (ret) {
>> +		dev_err(dev, "%s: Failed to set timeout for gunyah wdt %d\n",
>> +			__func__, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0, &res);
>> +	if (ret)
>> +		dev_err(dev, "%s: Failed to start gunyah wdt %d\n", __func__, ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int gunyah_wdt_stop(struct watchdog_device *wdd)
>> +{
>> +	struct arm_smccc_res res;
>> +
>> +	return gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_DISABLE, 0, &res);
>> +}
>> +
>> +static int gunyah_wdt_ping(struct watchdog_device *wdd)
>> +{
>> +	struct arm_smccc_res res;
>> +
>> +	return gunyah_wdt_call(GUNYAH_WDT_PING, 0, 0, &res);
>> +}
>> +
>> +static int gunyah_wdt_set_timeout(struct watchdog_device *wdd,
>> +				  unsigned int timeout_sec)
>> +{
>> +	wdd->timeout = timeout_sec;
>> +
>> +	if (watchdog_active(wdd))
>> +		return gunyah_wdt_start(wdd);
>> +
>> +	return 0;
>> +}
>> +
>> +static unsigned int gunyah_wdt_get_timeleft(struct watchdog_device *wdd)
>> +{
>> +	struct arm_smccc_res res;
>> +	unsigned int seconds_since_last_ping;
>> +	int ret;
>> +
>> +	ret = gunyah_wdt_call(GUNYAH_WDT_STATUS, 0, 0, &res);
>> +	if (ret)
>> +		return 0;
> This is the only place which passes something back in res. Please wrap
> it separately and return int value.


Thank you for the suggestion. This makes sense.

I will create a wrapper, say `gunyah_wdt_get_time_since_last_ping()` 
which makes the SMC call, calculates and returns the value in seconds as 
int and will also make the appropriate fixes in gunyah_wdt_call() as 
suggested above.

>> +
>> +	seconds_since_last_ping = res.a2 / 1000;
>> +	if (seconds_since_last_ping > wdd->timeout)
>> +		return 0;
>> +
>> +	return wdd->timeout - seconds_since_last_ping;
>> +}
>> +
>> +static int gunyah_wdt_restart(struct watchdog_device *wdd,
>> +			      unsigned long action, void *data)
>> +{
>> +	struct arm_smccc_res res;
>> +
>> +	/* Set timeout to 1ms and send a ping */
>> +	gunyah_wdt_call(GUNYAH_WDT_CONTROL, WDT_CTRL_ENABLE, 0, &res);
>> +	gunyah_wdt_call(GUNYAH_WDT_SET_TIME, 1, 1, &res);
>> +	gunyah_wdt_call(GUNYAH_WDT_PING, 0, 0, &res);
>> +
>> +	/* Wait to make sure reset occurs */
>> +	mdelay(100);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct watchdog_info gunyah_wdt_info = {
>> +	.identity = "Gunyah Watchdog",
>> +	.firmware_version = 0,
> =0 is default and can be omited


Ok, will remove this in the next patch version.

>> +	.options = WDIOF_SETTIMEOUT
>> +		 | WDIOF_KEEPALIVEPING
>> +		 | WDIOF_MAGICCLOSE,
>> +};
>> +
>> +static const struct watchdog_ops gunyah_wdt_ops = {
>> +	.owner = THIS_MODULE,
>> +	.start = gunyah_wdt_start,
>> +	.stop = gunyah_wdt_stop,
>> +	.ping = gunyah_wdt_ping,
>> +	.set_timeout = gunyah_wdt_set_timeout,
>> +	.get_timeleft = gunyah_wdt_get_timeleft,
>> +	.restart = gunyah_wdt_restart
>> +};
>> +
>> +static int gunyah_wdt_probe(struct platform_device *pdev)
>> +{
>> +	struct arm_smccc_res res;
>> +	struct watchdog_device *wdd;
>> +	struct device *dev = &pdev->dev;
>> +	int ret;
>> +
>> +	ret = gunyah_wdt_call(GUNYAH_WDT_STATUS, 0, 0, &res);
>> +	if (ret) {
>> +		dev_dbg(dev, "Watchdog interface status check failed with %d\n", ret);
> dev_err
>
>> +		return -ENODEV;
>> +	}
>> +
>> +	wdd = devm_kzalloc(dev, sizeof(*wdd), GFP_KERNEL);
>> +	if (!wdd)
>> +		return -ENOMEM;
>> +
>> +	wdd->info = &gunyah_wdt_info;
>> +	wdd->ops = &gunyah_wdt_ops;
>> +	wdd->parent = dev;
>> +
>> +	/*
>> +	 * Although Gunyah expects 16-bit unsigned int values as timeout values
>> +	 * in milliseconds, values above 0x8000 are reserved. This limits the
>> +	 * max timeout value to 32 seconds.
>> +	 */
>> +	wdd->max_timeout = 32; /* seconds */
>> +	wdd->min_timeout = 1; /* seconds */
>> +	wdd->timeout = wdd->max_timeout;
>> +
>> +	gunyah_wdt_stop(wdd);
>> +	platform_set_drvdata(pdev, wdd);
>> +	watchdog_set_restart_priority(wdd, 0);
>> +
>> +	ret = devm_watchdog_register_device(dev, wdd);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to register watchdog device");
>> +
>> +	dev_dbg(dev, "Gunyah watchdog registered\n");
>> +	return 0;
> return devm_watchdog_register_device(); No need for extra processing
> here.


Thank you for suggesting this, will fix this in the next patch version.

>> +}
>> +
>> +static int __maybe_unused gunyah_wdt_suspend(struct device *dev)
>> +{
>> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
>> +
>> +	if (watchdog_active(wdd))
>> +		gunyah_wdt_stop(wdd);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused gunyah_wdt_resume(struct device *dev)
>> +{
>> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
>> +
>> +	if (watchdog_active(wdd))
>> +		gunyah_wdt_start(wdd);
>> +
>> +	return 0;
>> +}
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(gunyah_wdt_pm_ops, gunyah_wdt_suspend, gunyah_wdt_resume);
>> +
>> +static struct platform_driver gunyah_wdt_driver = {
>> +	.probe = gunyah_wdt_probe,
>> +	.driver = {
>> +		.name = "gunyah-wdt",
> Missing platform_device_id, MODULE_DEVICE_TABLE.

Thanks for pointing this out. I will include it in the next version.

>> +		.pm = pm_sleep_ptr(&gunyah_wdt_pm_ops),
>> +	},
>> +};
>> +
>> +static int __init gunyah_wdt_init(void)
>> +{
>> +	return platform_driver_register(&gunyah_wdt_driver);
>> +}
>> +
>> +module_init(gunyah_wdt_init);
> module_platform_driver();


We will be making this change as this is suggested by multiple people.


Thanks a lot for the review.


Thanks,

Hrishabh


