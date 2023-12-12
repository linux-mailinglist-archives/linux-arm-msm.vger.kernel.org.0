Return-Path: <linux-arm-msm+bounces-4363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB8980E70A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 10:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9289B20F25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 09:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2245811B;
	Tue, 12 Dec 2023 09:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UrUyO1dS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B141DB7;
	Tue, 12 Dec 2023 01:05:46 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BC8MkCN030740;
	Tue, 12 Dec 2023 09:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=vTaIVL5D9hnj5+PLSksyPQHPqHoQLKDiz9pZXK/8CEQ=; b=Ur
	UyO1dSmkQPdVwzBzLcyhgMJ7NmOuBtqrbpp7cwIhFM3VtTSA6ldP3NRjsgaLKD5m
	KyJOdlEPedpxg/psyaa2ZvOnA5aGhbAznzJaZTl7VdhMQs1hW4XsDCyP1IWfj78+
	uwnze+SwjhTyzDortIh/yrRnBzifob2KHN/ZJrqC0secuQGojPEI2tehHsxhNP9s
	pz8L8nKP1EhOw2uvtUCdplpN4M2syThlIZXjkGlj9dHgKZlu88fh0RZogF/Xyd2c
	7Za6VRgVVwwUzNHRkel9OZGZfIXMsjDISBrgMZdDhXVaTobxANHn22tuLImexrgF
	VyXEiuI5DZRU837jhKuQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxkxfg2uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 09:05:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BC95dHZ008945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 09:05:39 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Dec
 2023 01:05:33 -0800
Message-ID: <45afda4b-853f-bf97-f323-1b06040697bc@quicinc.com>
Date: Tue, 12 Dec 2023 14:35:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V3 2/4] clk: qcom: Add Global Clock controller (GCC)
 driver for X1E80100
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
        <conor+dt@kernel.org>, <quic_tdas@quicinc.com>,
        <quic_rjendra@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <neil.armstrong@linaro.org>,
        <abel.vesa@linaro.org>, <quic_tsoni@quicinc.com>
References: <20231205061002.30759-1-quic_sibis@quicinc.com>
 <20231205061002.30759-3-quic_sibis@quicinc.com>
 <CAL_Jsq+UhWuFdd=o=W_5iaHpLqQxQ13YOGBjnPAm46LO90hGqA@mail.gmail.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <CAL_Jsq+UhWuFdd=o=W_5iaHpLqQxQ13YOGBjnPAm46LO90hGqA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4PyfQ2ZOKH9kczFIz3YuEgm3COzsxbg5
X-Proofpoint-ORIG-GUID: 4PyfQ2ZOKH9kczFIz3YuEgm3COzsxbg5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312120071



On 12/11/23 22:10, Rob Herring wrote:
> On Tue, Dec 5, 2023 at 12:11 AM Sibi Sankar <quic_sibis@quicinc.com> wrote:
>>
>> From: Rajendra Nayak <quic_rjendra@quicinc.com>
>>
>> Add support for the global clock controller found on X1E80100
>> based devices.
>>
>> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
>> Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>
>> v3:
>> * Rename gcc config to CLK_X1E80100_GCC [Krzysztof/Abel/Bryan]
>> * Pickup Rbs.
>>
>>   drivers/clk/qcom/Kconfig        |   10 +
>>   drivers/clk/qcom/Makefile       |    1 +
>>   drivers/clk/qcom/gcc-x1e80100.c | 6807 +++++++++++++++++++++++++++++++
>>   3 files changed, 6818 insertions(+)
>>   create mode 100644 drivers/clk/qcom/gcc-x1e80100.c
>>
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index ad1acd9b7426..a9bb50da4de5 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -20,6 +20,16 @@ menuconfig COMMON_CLK_QCOM
>>
>>   if COMMON_CLK_QCOM
>>
>> +config CLK_X1E80100_GCC
>> +       tristate "X1E80100 Global Clock Controller"
>> +       depends on ARM64 || COMPILE_TEST
>> +       select QCOM_GDSC
>> +       help
>> +         Support for the global clock controller on Qualcomm Technologies, Inc
>> +         X1E80100 devices.
>> +         Say Y if you want to use peripheral devices such as UART, SPI, I2C,
>> +         USB, UFS, SD/eMMC, PCIe, etc.
>> +
>>   config QCOM_A53PLL
>>          tristate "MSM8916 A53 PLL"
>>          help
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index 17edd73f9839..a8498ee3595e 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -21,6 +21,7 @@ clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
>>   obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
>>   obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
>>   obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
>> +obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
>>   obj-$(CONFIG_IPQ_APSS_PLL) += apss-ipq-pll.o
>>   obj-$(CONFIG_IPQ_APSS_6018) += apss-ipq6018.o
>>   obj-$(CONFIG_IPQ_GCC_4019) += gcc-ipq4019.o
>> diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
>> new file mode 100644
>> index 000000000000..74db7fef237b
>> --- /dev/null
>> +++ b/drivers/clk/qcom/gcc-x1e80100.c
>> @@ -0,0 +1,6807 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
> 
> Probably not a header you need as reported for linux-next. You need
> platform_device.h and either of.h or mod_devicetable.h.

Thanks, Stephen already sent out a fix for the same.

> 
> Rob
> 
>> --
>> 2.17.1
>>

