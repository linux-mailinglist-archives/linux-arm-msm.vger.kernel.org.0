Return-Path: <linux-arm-msm+bounces-39143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 278939D8E31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 22:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D606B2EEE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 21:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5276C1BE86E;
	Mon, 25 Nov 2024 21:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FdjJDigJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9811B85EC;
	Mon, 25 Nov 2024 21:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732570331; cv=none; b=dbbnvRctZT47SZFI8g8ITTd2Eif2B2SzP9AFJJ5zehx1vukmhPGrDInGZEZ21K1q+I5P/lwtRosJCurtsWQJppZd9wpdyA9Bc5hkd/hS1oM0wK0O8tqQNUaohly3TZARZTtW9PnCLCb9nVXhmTqyJ02zChDRcDQxPPibjxR/pw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732570331; c=relaxed/simple;
	bh=GPCAMd3TfLnxHRss3bbCCKtehW/uyMInYMpMNWYIi4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=o/S7kCjktdVw2d5MIRF6/HE7WgI2PjRhhJyO7KQL35W7nEX00igOSZAkqSkivS4GaWG7gz980KRX926RwkaV3dLrQsx5z4eYJ0IlFN4hA2ezoM5pCCMwP7TiUYsi1KfyXU0RmW6bA96PD+z51rCJbW9gAi7AqG/BRgr7XuOSIww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FdjJDigJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APK3kUs017784;
	Mon, 25 Nov 2024 21:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BB37u5M57i2z42YMFE7SFFWnWbXMXcugCE1MiPFv4Z4=; b=FdjJDigJLyB+0IiV
	uat9o22d/w+8DZT2H95DMfCxfnJjFTnfdU3TTHbmFQKwdf464+p6nOMdvw1der2b
	PhUGRcMApCrYQY0x7caLrC876K0sVp1K+571AYBAdJaIXMhJGPk58h9SqiFRzNIW
	BIKc7+Q/XW63Lb6uA64K5sdRblo61JS+c846mwRZA2m0aYiKqC+g4Oi7Npwcgy63
	5H9LYKnHBRDIKVTFN5UrUyuIobFOT2VDHQoJAOrg9BxglfoBKQhQiQWSUrcLRj0Z
	TZIYwGwZXRD7e8eitXMEdMJ84ejdFxKjVPX/sNNSZpEMcc/LNizFcJvcC7czQh3n
	EGujLw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 433dny5gpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 21:31:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4APLVxEG014067
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 21:31:59 GMT
Received: from [10.71.111.113] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 25 Nov
 2024 13:31:58 -0800
Message-ID: <3d9d3d18-9028-4dbc-8e72-3ed70edc97f4@quicinc.com>
Date: Mon, 25 Nov 2024 13:31:58 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] clk: qcom: Add support for GCC clock controller on
 SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241112002807.2804021-1-quic_molvera@quicinc.com>
 <20241112002807.2804021-6-quic_molvera@quicinc.com>
 <n4h4jvxrsyahgmxedfsifhgmarw4rzn2cbg5pcvzo4ll3edziq@vgpvjco5hyb4>
 <f2bf7790-7387-4eb6-8e1e-e555a20a717b@quicinc.com>
 <xjfdqtiauxzmes3hwtgknjglu5rkp4mnyktsaxqtb7xmzsa2zx@phlkamgm47x4>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <xjfdqtiauxzmes3hwtgknjglu5rkp4mnyktsaxqtb7xmzsa2zx@phlkamgm47x4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u84ly2cQOz28e0ZxANsHhkMfFhqz4kIs
X-Proofpoint-ORIG-GUID: u84ly2cQOz28e0ZxANsHhkMfFhqz4kIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250179



On 11/18/2024 5:59 PM, Dmitry Baryshkov wrote:
> On Mon, Nov 18, 2024 at 11:30:58AM -0800, Melody Olvera wrote:
>>
>> On 11/15/2024 7:34 AM, Dmitry Baryshkov wrote:
>>> On Mon, Nov 11, 2024 at 04:28:05PM -0800, Melody Olvera wrote:
>>>> From: Taniya Das <quic_tdas@quicinc.com>
>>>>
>>>> Add support for GCC Clock Controller for SM8750 platform.
>>>>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>>>> ---
>>>>    drivers/clk/qcom/Kconfig      |    9 +
>>>>    drivers/clk/qcom/Makefile     |    1 +
>>>>    drivers/clk/qcom/gcc-sm8750.c | 3274 +++++++++++++++++++++++++++++++++
>>>>    3 files changed, 3284 insertions(+)
>>>>    create mode 100644 drivers/clk/qcom/gcc-sm8750.c
>>>>
>>>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>>>> index ef89d686cbc4..26bfb607235b 100644
>>>> --- a/drivers/clk/qcom/Kconfig
>>>> +++ b/drivers/clk/qcom/Kconfig
>>>> @@ -1130,6 +1130,15 @@ config SM_GCC_8650
>>>>    	  Say Y if you want to use peripheral devices such as UART,
>>>>    	  SPI, I2C, USB, SD/UFS, PCIe etc.
>>>> +config SM_GCC_8750
>>>> +	tristate "SM8750 Global Clock Controller"
>>>> +	depends on ARM64 || COMPILE_TEST
>>>> +	select QCOM_GDSC
>>>> +	help
>>>> +	  Support for the global clock controller on SM8750 devices.
>>>> +	  Say Y if you want to use peripheral devices such as UART,
>>>> +	  SPI, I2C, USB, SD/UFS, PCIe etc.
>>>> +
>>>>    config SM_GPUCC_4450
>>>>    	tristate "SM4450 Graphics Clock Controller"
>>>>    	depends on ARM64 || COMPILE_TEST
>>>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>>>> index b09dbdc210eb..1875018d1100 100644
>>>> --- a/drivers/clk/qcom/Makefile
>>>> +++ b/drivers/clk/qcom/Makefile
>>>> @@ -143,6 +143,7 @@ obj-$(CONFIG_SM_GCC_8350) += gcc-sm8350.o
>>>>    obj-$(CONFIG_SM_GCC_8450) += gcc-sm8450.o
>>>>    obj-$(CONFIG_SM_GCC_8550) += gcc-sm8550.o
>>>>    obj-$(CONFIG_SM_GCC_8650) += gcc-sm8650.o
>>>> +obj-$(CONFIG_SM_GCC_8750) += gcc-sm8750.o
>>>>    obj-$(CONFIG_SM_GPUCC_4450) += gpucc-sm4450.o
>>>>    obj-$(CONFIG_SM_GPUCC_6115) += gpucc-sm6115.o
>>>>    obj-$(CONFIG_SM_GPUCC_6125) += gpucc-sm6125.o
>>>> diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
>>>> new file mode 100644
>>>> index 000000000000..faaefa42a039
>>>> --- /dev/null
>>>> +++ b/drivers/clk/qcom/gcc-sm8750.c
>>>> @@ -0,0 +1,3274 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +/*
>>>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + */
>>>> +
>>>> +#include <linux/clk-provider.h>
>>>> +#include <linux/mod_devicetable.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/regmap.h>
>>>> +
>>>> +#include <dt-bindings/clock/qcom,sm8750-gcc.h>
>>>> +
>>>> +#include "clk-alpha-pll.h"
>>>> +#include "clk-branch.h"
>>>> +#include "clk-pll.h"
>>>> +#include "clk-rcg.h"
>>>> +#include "clk-regmap.h"
>>>> +#include "clk-regmap-divider.h"
>>>> +#include "clk-regmap-mux.h"
>>>> +#include "clk-regmap-phy-mux.h"
>>>> +#include "common.h"
>>>> +#include "gdsc.h"
>>>> +#include "reset.h"
>>>> +
>>>> +enum {
>>>> +	DT_BI_TCXO,
>>>> +	DT_BI_TCXO_AO,
>>>> +	DT_PCIE_0_PIPE_CLK,
>>>> +	DT_SLEEP_CLK,
>>>> +	DT_UFS_PHY_RX_SYMBOL_0_CLK,
>>>> +	DT_UFS_PHY_RX_SYMBOL_1_CLK,
>>>> +	DT_UFS_PHY_TX_SYMBOL_0_CLK,
>>>> +	DT_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK,
>>> This doesn't match Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
>> Hmmm I see what seems to have happened here. You're correct; this doesn't
>> match the bindings
>> in sm8650-gcc. The v1 patchset had a new bindings file which matched the
>> sm8650 bindings, but also
>> didn't match the driver; however we only seemed to catch that the two
>> bindings matched and not the
>> fact that they didn't match the drivers.
> I don't see v1. Please bring bindings back.

Will do.

>
>> In terms of remedy I see two options. I'm fairly certain the driver here is
>> correct, so we can either
>> add the sm8750 bindings file back and remove the two lines about the PCIE 1
>> clocks or adjust the
>> sm8650 binding to encompass both sm8650 and sm8750. It's unclear to me how
>> precedented the latter
>> is; certainly having a single bindings file encompass both chips is
>> feasible, but I think I'm currently
>> leaning towards bringing back the original bindings file as that seems more
>> precedented. Lmk
>> your thoughts.
> How are you thinking to change SM8650 bindings without breaking the ABI
> / backwards compatibility?


Giant if-then (read: poorly).

Thanks,
Melody

