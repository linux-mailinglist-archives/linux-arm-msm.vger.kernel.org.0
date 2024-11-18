Return-Path: <linux-arm-msm+bounces-38253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDA29D18F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 20:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 468F81F222D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 19:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E74C1E572F;
	Mon, 18 Nov 2024 19:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lL684pmW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FC917BBF;
	Mon, 18 Nov 2024 19:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731958369; cv=none; b=UURKmKmxF9ke6fdzG8aWUylxYUqikmz4LESa94zvKYdrBCQQlJ7I5NGTraeBqp/60jJjqxCwyPmuYRG+IMHNpxK5GrQaPrQYxQ/HHKeqVp4UhgwtnCd26R974XXL5ZqWVoqc5uCAcPwDw6i3K+wVI+ijUL0K6on3IxFG2I6OU0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731958369; c=relaxed/simple;
	bh=bP1URl5nKrZExSKFJ41Ci/Pz7V0c2saZOgAFc/C90IU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WaBEYVwYsqfHtgY6gmdBgSZ47Jw385c5ibij8W80Z1G+YOTdSFKPEUe117D6wXi8WymzsQwsVrD46T3qON9MuG9pNvxDEZOHC53bawIfhL37IyiOa8v9EiG51nJ+yNYqyEt5dURw4fmHOMYs9aSZi9QMyBgSf9VyirFeOXEj0Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lL684pmW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGGppi030145;
	Mon, 18 Nov 2024 19:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+HAJEdoM3MeaolcFlpfhJDfsb1O8wvRG1r5/khyoe0M=; b=lL684pmWq1NO0lB1
	6GdUzBjy7afR686IXklleZVSnPS5J+wUhl+8ZrS9g4zmeA8jagoxBUNLaQI7x08w
	G83rf51AjRB3WS183Ptv/QD5ENJfa1obNw1PpAQAIvHe3PWwNnm1/xYvRFXy1N+Q
	8jRGPCizyPevKW/RpzMpJTDH8MuKpQwH4qsuVub8VXVZrCS44f/2UuK6DGiv8MuQ
	gb2mLo85bP/dhCxLg/80SE2x5W3cs0p1vaUI5o7ELBUKeomJ3JXEJa+lYVS2SfR1
	U94Kt8kD8r/Xx0qlQubcI+VzBM1rXLdzOiM0KBxIPn95dyklrfV/SWo93ZrIDMyC
	c9BLLw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y68f01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 19:32:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AIJWgkB018501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 19:32:42 GMT
Received: from [10.71.108.63] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 18 Nov
 2024 11:30:58 -0800
Message-ID: <f2bf7790-7387-4eb6-8e1e-e555a20a717b@quicinc.com>
Date: Mon, 18 Nov 2024 11:30:58 -0800
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
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <n4h4jvxrsyahgmxedfsifhgmarw4rzn2cbg5pcvzo4ll3edziq@vgpvjco5hyb4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6YKrk9oTcMu71sE_CN3jL0DZZP4-7rMU
X-Proofpoint-GUID: 6YKrk9oTcMu71sE_CN3jL0DZZP4-7rMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180161



On 11/15/2024 7:34 AM, Dmitry Baryshkov wrote:
> On Mon, Nov 11, 2024 at 04:28:05PM -0800, Melody Olvera wrote:
>> From: Taniya Das <quic_tdas@quicinc.com>
>>
>> Add support for GCC Clock Controller for SM8750 platform.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>   drivers/clk/qcom/Kconfig      |    9 +
>>   drivers/clk/qcom/Makefile     |    1 +
>>   drivers/clk/qcom/gcc-sm8750.c | 3274 +++++++++++++++++++++++++++++++++
>>   3 files changed, 3284 insertions(+)
>>   create mode 100644 drivers/clk/qcom/gcc-sm8750.c
>>
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index ef89d686cbc4..26bfb607235b 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -1130,6 +1130,15 @@ config SM_GCC_8650
>>   	  Say Y if you want to use peripheral devices such as UART,
>>   	  SPI, I2C, USB, SD/UFS, PCIe etc.
>>   
>> +config SM_GCC_8750
>> +	tristate "SM8750 Global Clock Controller"
>> +	depends on ARM64 || COMPILE_TEST
>> +	select QCOM_GDSC
>> +	help
>> +	  Support for the global clock controller on SM8750 devices.
>> +	  Say Y if you want to use peripheral devices such as UART,
>> +	  SPI, I2C, USB, SD/UFS, PCIe etc.
>> +
>>   config SM_GPUCC_4450
>>   	tristate "SM4450 Graphics Clock Controller"
>>   	depends on ARM64 || COMPILE_TEST
>> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
>> index b09dbdc210eb..1875018d1100 100644
>> --- a/drivers/clk/qcom/Makefile
>> +++ b/drivers/clk/qcom/Makefile
>> @@ -143,6 +143,7 @@ obj-$(CONFIG_SM_GCC_8350) += gcc-sm8350.o
>>   obj-$(CONFIG_SM_GCC_8450) += gcc-sm8450.o
>>   obj-$(CONFIG_SM_GCC_8550) += gcc-sm8550.o
>>   obj-$(CONFIG_SM_GCC_8650) += gcc-sm8650.o
>> +obj-$(CONFIG_SM_GCC_8750) += gcc-sm8750.o
>>   obj-$(CONFIG_SM_GPUCC_4450) += gpucc-sm4450.o
>>   obj-$(CONFIG_SM_GPUCC_6115) += gpucc-sm6115.o
>>   obj-$(CONFIG_SM_GPUCC_6125) += gpucc-sm6125.o
>> diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
>> new file mode 100644
>> index 000000000000..faaefa42a039
>> --- /dev/null
>> +++ b/drivers/clk/qcom/gcc-sm8750.c
>> @@ -0,0 +1,3274 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +/*
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/clock/qcom,sm8750-gcc.h>
>> +
>> +#include "clk-alpha-pll.h"
>> +#include "clk-branch.h"
>> +#include "clk-pll.h"
>> +#include "clk-rcg.h"
>> +#include "clk-regmap.h"
>> +#include "clk-regmap-divider.h"
>> +#include "clk-regmap-mux.h"
>> +#include "clk-regmap-phy-mux.h"
>> +#include "common.h"
>> +#include "gdsc.h"
>> +#include "reset.h"
>> +
>> +enum {
>> +	DT_BI_TCXO,
>> +	DT_BI_TCXO_AO,
>> +	DT_PCIE_0_PIPE_CLK,
>> +	DT_SLEEP_CLK,
>> +	DT_UFS_PHY_RX_SYMBOL_0_CLK,
>> +	DT_UFS_PHY_RX_SYMBOL_1_CLK,
>> +	DT_UFS_PHY_TX_SYMBOL_0_CLK,
>> +	DT_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK,
> This doesn't match Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml

Hmmm I see what seems to have happened here. You're correct; this 
doesn't match the bindings
in sm8650-gcc. The v1 patchset had a new bindings file which matched the 
sm8650 bindings, but also
didn't match the driver; however we only seemed to catch that the two 
bindings matched and not the
fact that they didn't match the drivers.

In terms of remedy I see two options. I'm fairly certain the driver here 
is correct, so we can either
add the sm8750 bindings file back and remove the two lines about the 
PCIE 1 clocks or adjust the
sm8650 binding to encompass both sm8650 and sm8750. It's unclear to me 
how precedented the latter
is; certainly having a single bindings file encompass both chips is 
feasible, but I think I'm currently
leaning towards bringing back the original bindings file as that seems 
more precedented. Lmk
your thoughts.

Thanks,
Melody

>> +};
>> +


