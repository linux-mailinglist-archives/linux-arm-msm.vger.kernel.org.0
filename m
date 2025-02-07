Return-Path: <linux-arm-msm+bounces-47142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81769A2C22A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 13:04:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C04F188C9AE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 12:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716521DED6D;
	Fri,  7 Feb 2025 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PF15bsqf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5CB2417C7;
	Fri,  7 Feb 2025 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738929855; cv=none; b=DfxoNJjEiqHRVSmR7FimFMQl3e+M574dcHqsOSP9tH/Jvs9s11+IPfdTEaAaG/fk436cuJe/NaMRhXWpFR73GDisj3UIClbGZJTwo8yRvniaxX17AQskkHnwjArKELfQXZmyMl8wZgvSuWKCMUcd7ftmsPbzHLCHML28VACS6FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738929855; c=relaxed/simple;
	bh=eV7tMJVytyUxIcZurc6c0Q65P7Pdgv4oJs8jZQy8ys8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mKE0pecHz4h2AHqg4hZUyQnhtpxcXHbaVRw2lX83bnkKbrYNFj2tBOMQTsM0OlWFNPQ7cpLqgo9yINSVwlyt9vaJAwnMuz+upTXbSxrOsmMzQHVvCoZhJGBrusTjsgUKSCq6Ht5s0jPmz0BOh2ohRncQQaMLoOe2D75zdEgarQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PF15bsqf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51770g2H010561;
	Fri, 7 Feb 2025 12:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xb0Fk194/o+0vAtidy7rog9Cr53FI997NW6/N01sDqw=; b=PF15bsqfBOlVRlu1
	9Frk7enbUAf3pzfaz0l/Cc7ukJltCkcquu8Vc7FiZ4F5LyjcMUfFv47ifU4/FfWL
	VrT3iVL/q3IMRwa0TpfR8u7qqw3XbGKAGEG7CUkX57ssAi+T/mczPf+SiUv78SY+
	wEtWwuYr6gDLXb9WrWFS369Xf3l/L5HhDrRZAh97J/o1Qz6LYOnmWfz96aKDoLRE
	eQrWWvLvty8MzYIXI1EURyVQ6Ml0iEHs7NVyY65yAz/2hvf519igq4OEM2Ba0qoG
	kCvVcbfFocnxL0wAHGxXSO9wFtqw4WpJ7wVfMNvg2BaXqjdNNVOl3umr3Kp2w31i
	lRMF5w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nddkgrsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 12:04:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 517C45Qk026308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 12:04:05 GMT
Received: from [10.216.49.103] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Feb 2025
 04:04:00 -0800
Message-ID: <e5cad9d0-e602-442f-b216-2f655a9526e3@quicinc.com>
Date: Fri, 7 Feb 2025 17:33:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] i3c: master: Add Qualcomm I3C master controller
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <jarkko.nikula@linux.intel.com>, <linux-i3c@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-3-quic_msavaliy@quicinc.com>
 <fec85cd8-4c56-4b48-a15f-e7ae08352cc2@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <fec85cd8-4c56-4b48-a15f-e7ae08352cc2@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fywepgVddZ14BEOgl_jbwFY1mercsLtK
X-Proofpoint-ORIG-GUID: fywepgVddZ14BEOgl_jbwFY1mercsLtK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_05,2025-02-07_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070093



On 2/5/2025 8:16 PM, Krzysztof Kozlowski wrote:
> On 05/02/2025 15:31, Mukesh Kumar Savaliya wrote:
>> Add support for the Qualcomm I3C master controller, which implements
>> I3C master functionality as defined in the MIPI Alliance Specification
>> for I3C, Version 1.0. The driver supports the master role in SDR mode
>> only. Unlike some other I3C master controllers, this implementation
>> does not support In-Band Interrupts (IBI) and Hot-join requests.
>>
>> Key features of the Qualcomm I3C master controller driver:
>> - Supports I3C master functionality in SDR mode in PIO mode.
>> - Does not support IBI and Hot-join requests.
>> - Compatible with the MIPI I3C v1.0 specification @
>>    https://www.mipi.org/mipi-i3c-basic-download-1.0
>>
>> This addition enhances the I3C subsystem by providing support for
>> Qualcomm's hardware supported I3C master controller.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   drivers/i3c/master/Kconfig           |   12 +
>>   drivers/i3c/master/Makefile          |    1 +
>>   drivers/i3c/master/qcom-i3c-master.c | 1190 ++++++++++++++++++++++++++
>>   3 files changed, 1203 insertions(+)
>>   create mode 100644 drivers/i3c/master/qcom-i3c-master.c
>>
>> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
>> index 77da199c7413..5370cadfe236 100644
>> --- a/drivers/i3c/master/Kconfig
>> +++ b/drivers/i3c/master/Kconfig
>> @@ -44,6 +44,18 @@ config SVC_I3C_MASTER
>>   	help
>>   	  Support for Silvaco I3C Dual-Role Master Controller.
>>   
>> +config QCOM_I3C_MASTER
>> +	tristate "Qualcomm Technologies Inc.'s I3C Master controller driver"
>> +	depends on I3C
>> +	help
>> +	This driver supports QUPV3 GENI based I3C controller in master
>> +	mode on the Qualcomm Technologies Inc.s SoCs. If you say yes to
>> +	this option, support will be included for the built-in I3C interface
>> +	on the Qualcomm Technologies Inc.s SoCs.
>> +
>> +	This driver can also be built as a module.  If so, the module
>> +	will be called qcom-i3c-master.
>> +
>>   config MIPI_I3C_HCI
>>   	tristate "MIPI I3C Host Controller Interface driver (EXPERIMENTAL)"
>>   	depends on I3C
>> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
>> index 3e97960160bc..f6670a63b34f 100644
>> --- a/drivers/i3c/master/Makefile
>> +++ b/drivers/i3c/master/Makefile
>> @@ -4,3 +4,4 @@ obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
>>   obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
>>   obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
>>   obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci/
>> +obj-$(CONFIG_QCOM_I3C_MASTER)		+= qcom-i3c-master.o
>> diff --git a/drivers/i3c/master/qcom-i3c-master.c b/drivers/i3c/master/qcom-i3c-master.c
>> new file mode 100644
>> index 000000000000..40566e388386
>> --- /dev/null
>> +++ b/drivers/i3c/master/qcom-i3c-master.c
>> @@ -0,0 +1,1190 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> +
>> +#include <linux/clk.h>
>> +#include <linux/err.h>
>> +#include <linux/i3c/master.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/slab.h>
>> +#include <linux/soc/qcom/geni-se.h>
>> +
>> +#define SE_I3C_SCL_HIGH                 0x268
>> +#define SE_I3C_TX_TRANS_LEN             0x26C
>> +#define SE_I3C_RX_TRANS_LEN             0x270
>> +#define SE_I3C_DELAY_COUNTER            0x274
>> +#define SE_I2C_SCL_COUNTERS             0x278
>> +#define SE_I3C_SCL_CYCLE                0x27C
>> +#define SE_GENI_HW_IRQ_EN               0x920
>> +#define SE_GENI_HW_IRQ_IGNORE_ON_ACTIVE 0x924
>> +#define SE_GENI_HW_IRQ_CMD_PARAM_0      0x930
>> +
>> +/* SE_GENI_M_CLK_CFG field shifts */
>> +#define CLK_DEV_VALUE_SHFT 4
>> +#define SER_CLK_EN_SHFT 0
>> +
>> +/* SE_GENI_HW_IRQ_CMD_PARAM_0 field shifts */
>> +#define M_IBI_IRQ_PARAM_7E_SHFT 0
>> +#define M_IBI_IRQ_PARAM_STOP_STALL_SHFT 1
>> +
>> +/* SE_I2C_SCL_COUNTERS field shifts */
>> +#define I2C_SCL_HIGH_COUNTER_SHFT  20
>> +#define I2C_SCL_LOW_COUNTER_SHFT   10
>> +
>> +#define SE_I3C_ERR  (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE_EN |\
>> +	M_CMD_ABORT_EN | M_GP_IRQ_0_EN | M_GP_IRQ_1_EN | M_GP_IRQ_2_EN | \
>> +	M_GP_IRQ_3_EN | M_GP_IRQ_4_EN)
>> +
>> +/* M_CMD OP codes for I2C/I3C */
>> +#define I3C_READ_IBI_HW          0
>> +#define I2C_WRITE                1
>> +#define I2C_READ                 2
>> +#define I2C_WRITE_READ           3
>> +#define I2C_ADDR_ONLY            4
>> +#define I3C_INBAND_RESET         5
>> +#define I2C_BUS_CLEAR            6
>> +#define I2C_STOP_ON_BUS          7
>> +#define I3C_HDR_DDR_EXIT         8
>> +#define I3C_PRIVATE_WRITE        9
>> +#define I3C_PRIVATE_READ         10
>> +#define I3C_HDR_DDR_WRITE        11
>> +#define I3C_HDR_DDR_READ         12
>> +#define I3C_DIRECT_CCC_ADDR_ONLY 13
>> +#define I3C_BCAST_CCC_ADDR_ONLY  14
>> +#define I3C_READ_IBI             15
>> +#define I3C_BCAST_CCC_WRITE      16
>> +#define I3C_DIRECT_CCC_WRITE     17
>> +#define I3C_DIRECT_CCC_READ      18
>> +
>> +/* M_CMD params for I3C */
>> +#define PRE_CMD_DELAY          BIT(0)
>> +#define TIMESTAMP_BEFORE       BIT(1)
>> +#define STOP_STRETCH           BIT(2)
>> +#define TIMESTAMP_AFTER        BIT(3)
>> +#define POST_COMMAND_DELAY     BIT(4)
>> +#define IGNORE_ADD_NACK        BIT(6)
>> +#define READ_FINISHED_WITH_ACK BIT(7)
>> +#define CONTINUOUS_MODE_DAA    BIT(8)
>> +#define SLV_ADDR_MSK           GENMASK(15, 9)
>> +#define SLV_ADDR_SHFT          9
>> +#define CCC_HDR_CMD_MSK        GENMASK(23, 16)
>> +#define CCC_HDR_CMD_SHFT       16
>> +#define IBI_NACK_TBL_CTRL      BIT(24)
>> +#define USE_7E                 BIT(25)
>> +#define BYPASS_ADDR_PHASE      BIT(26)
>> +
>> +/* GSI callback error fields */
>> +#define GP_IRQ0	0
>> +#define GP_IRQ1	1
>> +#define GP_IRQ2	2
>> +#define GP_IRQ3	3
>> +#define GP_IRQ4	4
>> +#define GP_IRQ5	5
>> +#define DM_I3C_CB_ERR   ((BIT(GP_IRQ0) | BIT(GP_IRQ1) | BIT(GP_IRQ2) | \
>> +			  BIT(GP_IRQ3) | BIT(GP_IRQ4) | BIT(GP_IRQ5)) << 5)
>> +
>> +#define I3C_AUTO_SUSPEND_DELAY  250
>> +#define KHZ(freq)               (1000 * (freq))
>> +#define PACKING_BYTES_PW        4
>> +#define XFER_TIMEOUT            250
>> +#define DFS_INDEX_MAX           7
>> +
>> +#define I3C_ADDR_MASK 0x7f
>> +
>> +enum geni_i3c_err_code {
>> +	RD_TERM,
>> +	NACK,
>> +	CRC_ERR,
>> +	BUS_PROTO,
>> +	NACK_7E,
>> +	NACK_IBI,
>> +	GENI_OVERRUN,
>> +	GENI_ILLEGAL_CMD,
>> +	GENI_ABORT_DONE,
>> +	GENI_TIMEOUT,
>> +};
>> +
>> +enum i3c_trans_dir {
>> +	WRITE_TRANSACTION = 0,
>> +	READ_TRANSACTION = 1
>> +};
>> +
>> +enum i3c_bus_phase {
>> +	OPEN_DRAIN_MODE  = 0,
>> +	PUSH_PULL_MODE   = 1
>> +};
>> +
>> +struct geni_i3c_dev {
>> +	struct geni_se se;
>> +	unsigned int tx_wm;
>> +	int irq;
>> +	int err;
>> +	struct i3c_master_controller ctrlr;
>> +	struct completion done;
>> +	/* Used inside get_mutex_lock()/unlock() - To manage per device CCC/tranxfer */
> 
> Do not say where it is used - we see. Instead, say what is being protected.
> 
Done.
>> +	struct mutex lock;
>> +	/* Per device protection between process and IRQ context */
>> +	spinlock_t spinlock;
>> +	u32 clk_src_freq;
>> +	u32 dfs_idx;
>> +	u8 *cur_buf;
>> +	enum i3c_trans_dir cur_rnw;
>> +	int cur_len;
>> +	int cur_idx;
>> +	unsigned long newaddrslots[(I3C_ADDR_MASK + 1) / BITS_PER_LONG];
>> +	const struct geni_i3c_clk_fld *clk_fld;
>> +	const struct geni_i3c_clk_fld *clk_od_fld;
>> +};
>> +
>> +struct geni_i3c_i2c_dev_data {
>> +	u32 ibi_keeping;  /* Plan to save IBI information, keep as dummy for now */
>> +};
>> +
>> +struct geni_i3c_xfer_params {
>> +	enum geni_se_xfer_mode mode;
>> +	u32 m_cmd;
>> +	u32 m_param;
>> +};
>> +
>> +static inline struct geni_i3c_dev *to_geni_i3c_master(struct i3c_master_controller
>> +							*master)
>> +{
>> +	return container_of(master, struct geni_i3c_dev, ctrlr);
>> +}
>> +
>> +struct geni_i3c_err_log {
>> +	int err;
>> +	const char *msg;
>> +};
>> +
>> +static struct geni_i3c_err_log gi3c_log[] = {
> 
> Not const? Why?
> 
defined as const, done.
>> +	[RD_TERM] = { -EINVAL, "I3C slave early read termination" },
>> +	[NACK] = { -ENOTCONN, "NACK: slave unresponsive, check power/reset" },
>> +	[CRC_ERR] = { -EINVAL, "CRC or parity error" },
>> +	[BUS_PROTO] = { -EPROTO, "Bus proto Error, noisy/unexpected start/stop" },
>> +	[NACK_7E] = { -EBUSY, "NACK on 7E, unexpected protocol error" },
>> +	[NACK_IBI] = { -EINVAL, "NACK on IBI" },
>> +	[GENI_OVERRUN] = { -EIO, "Cmd overrun, check GENI cmd-state machine" },
>> +	[GENI_ILLEGAL_CMD] = { -EILSEQ,
>> +				"Illegal cmd, check GENI cmd-state machine" },
>> +	[GENI_ABORT_DONE] = { -ETIMEDOUT, "Abort after timeout successful" },
>> +	[GENI_TIMEOUT] = { -ETIMEDOUT, "I3C transaction timed out" },
>> +};
>> +
> 
> 
> ...
> 
>> +
>> +static int i3c_geni_rsrcs_init(struct geni_i3c_dev *gi3c, struct platform_device *pdev)
>> +{
>> +	int ret;
>> +	struct resource *res;
>> +
>> +	/* Base register address */
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!res) {
>> +		dev_err(&pdev->dev, "Error getting IO region\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	gi3c->se.base = devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(gi3c->se.base))
>> +		return PTR_ERR(gi3c->se.base);
>> +
>> +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se-clk");
>> +	if (IS_ERR(gi3c->se.clk)) {
>> +		ret = PTR_ERR(gi3c->se.clk);
>> +		dev_err(&pdev->dev, "Error getting SE Core clk %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = device_property_read_u32(&pdev->dev, "se-clock-frequency", &gi3c->clk_src_freq);
> 
> You never tested your DTS or this code... Drop
> 
I have tested on SM8550 MTP only. Below entry in my internal/local DTSI.
Do you mean to say i should add this property in yaml too ?
se-clock-frequency = <100000000>;
> 
>> +	if (ret) {
>> +		dev_info(&pdev->dev, "SE clk freq not specified, default to 100 MHz.\n");
>> +		gi3c->clk_src_freq = 100000000;
>> +	}
>> +
>> +	ret = geni_icc_get(&gi3c->se, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Set the bus quota to a reasonable value for register access */
>> +	gi3c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
>> +	gi3c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
>> +	ret = geni_icc_set_bw(&gi3c->se);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "%s: icc set bw failed ret:%d\n", __func__, ret);
>> +		return ret;
>> +	}
>> +	dev_dbg(&pdev->dev, "%s: GENI_TO_CORE:%d CPU_TO_GENI:%d\n", __func__,
>> +		gi3c->se.icc_paths[GENI_TO_CORE].avg_bw, gi3c->se.icc_paths[CPU_TO_GENI].avg_bw);
>> +
>> +	ret = device_property_read_u32(&pdev->dev, "dfs-index", &gi3c->dfs_idx);
> 
> The same. You cannot send us hidden ABI.
> 
> This code does not look like ready for upstream. Are you sure it was
> internally reviewed?
> 
yes, we have taken 2 rounds internally.
Are you saying i should add this into yaml ?  what do you mean by 
hiddern ABI ?
>> +	if (ret)
>> +		gi3c->dfs_idx = 0xf;
>> +
>> +	return 0;
>> +}
>> +
>> +static int geni_i3c_probe(struct platform_device *pdev)
>> +{
>> +	u32 proto, tx_depth, fifo_disable;
>> +	struct geni_i3c_dev *gi3c;
>> +	int ret;
>> +
>> +	gi3c = devm_kzalloc(&pdev->dev, sizeof(*gi3c), GFP_KERNEL);
>> +	if (!gi3c)
>> +		return -ENOMEM;
>> +
>> +	gi3c->se.dev = &pdev->dev;
>> +	gi3c->se.wrapper = dev_get_drvdata(pdev->dev.parent);
>> +
>> +	ret = i3c_geni_rsrcs_init(gi3c, pdev);
>> +	if (ret) {
>> +		dev_info(&pdev->dev, "Error:%d i3c_geni_rsrcs_init\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	gi3c->irq = platform_get_irq(pdev, 0);
>> +	if (gi3c->irq < 0) {
>> +		dev_err(&pdev->dev, "Error=%d getting IRQ for i3c-master-geni\n", ret);
>> +		return gi3c->irq;
>> +	}
>> +
>> +	init_completion(&gi3c->done);
>> +	mutex_init(&gi3c->lock);
>> +	spin_lock_init(&gi3c->spinlock);
>> +	platform_set_drvdata(pdev, gi3c);
>> +
>> +	ret = devm_request_irq(&pdev->dev, gi3c->irq, geni_i3c_irq,
>> +			       IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN, dev_name(&pdev->dev), gi3c);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Request_irq failed:%d: Error:%d\n",
>> +			gi3c->irq, ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = geni_se_resources_on(&gi3c->se);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Error turning on resources %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	proto = geni_se_read_proto(&gi3c->se);
>> +	if (proto != GENI_SE_I3C) {
>> +		dev_err(&pdev->dev, "Invalid proto %d\n", proto);
>> +		geni_se_resources_off(&gi3c->se);
>> +		return -ENXIO;
>> +	}
>> +
>> +	fifo_disable = readl_relaxed(gi3c->se.base + GENI_IF_DISABLE_RO);
>> +	if (fifo_disable) {
>> +		dev_err_probe(&pdev->dev, -ENXIO, "GPI DMA mode not supported\n");
> 
> Syntax is always: return dev_err_probe
> 
Done
>> +		geni_se_resources_off(&gi3c->se);
>> +		return -ENXIO;
>> +	}
>> +
>> +	tx_depth = geni_se_get_tx_fifo_depth(&gi3c->se);
>> +	gi3c->tx_wm = tx_depth - 1;
>> +	geni_se_init(&gi3c->se, gi3c->tx_wm, tx_depth);
>> +	geni_se_config_packing(&gi3c->se, BITS_PER_BYTE, PACKING_BYTES_PW, true, true, true);
>> +	geni_se_resources_off(&gi3c->se);
>> +	dev_dbg(&pdev->dev, "i3c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
>> +
>> +	pm_runtime_set_suspended(gi3c->se.dev);
>> +	pm_runtime_set_autosuspend_delay(gi3c->se.dev, I3C_AUTO_SUSPEND_DELAY);
>> +	pm_runtime_use_autosuspend(gi3c->se.dev);
>> +	pm_runtime_enable(gi3c->se.dev);
>> +
>> +	ret = i3c_master_register(&gi3c->ctrlr, &pdev->dev, &geni_i3c_master_ops, false);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dev_dbg(&pdev->dev, "Geni I3C probed\n");
> 
> No, drop.
Sure, Done.
> 
>> +	return ret;
>> +}
>> +
>> +static void geni_i3c_remove(struct platform_device *pdev)
>> +{
>> +	struct geni_i3c_dev *gi3c = platform_get_drvdata(pdev);
>> +
>> +	pm_runtime_disable(gi3c->se.dev);
>> +	i3c_master_unregister(&gi3c->ctrlr);
>> +}
>> +
>> +#ifdef CONFIG_PM
>> +static int geni_i3c_runtime_suspend(struct device *dev)
>> +{
>> +	struct geni_i3c_dev *gi3c = dev_get_drvdata(dev);
>> +
>> +	disable_irq(gi3c->irq);
>> +	geni_se_resources_off(&gi3c->se);
>> +	return 0;
>> +}
>> +
>> +static int geni_i3c_runtime_resume(struct device *dev)
>> +{
>> +	int ret;
>> +	struct geni_i3c_dev *gi3c = dev_get_drvdata(dev);
>> +
>> +	ret = geni_se_resources_on(&gi3c->se);
>> +	if (ret)
>> +		return ret;
>> +	enable_irq(gi3c->irq);
>> +	return 0;
>> +}
>> +#else
> 
> Entire else is not necessary. Use proper wrappers for this case. See
> other drivers.
> 
I see no other drivers using CONFIG_PM around runtime PM. Checked with 
I2C and I3C. hence removing this check and else condition too.
> 
>> +static int geni_i3c_runtime_suspend(struct device *dev)
>> +{
>> +	return 0;
>> +}
>> +
>> +static int geni_i3c_runtime_resume(struct device *dev)
>> +{
>> +	return 0;
>> +}
>> +#endif
>> +
>> +static const struct dev_pm_ops geni_i3c_pm_ops = {
>> +SET_RUNTIME_PM_OPS(geni_i3c_runtime_suspend, geni_i3c_runtime_resume, NULL)
>> +};
>> +
>> +static const struct of_device_id geni_i3c_dt_match[] = {
>> +	{ .compatible = "qcom,geni-i3c" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, geni_i3c_dt_match);
>> +
>> +static struct platform_driver geni_i3c_master = {
>> +	.probe  = geni_i3c_probe,
>> +	.remove = geni_i3c_remove,
>> +	.driver = {
>> +		.name = "geni_i3c_master",
>> +		.pm = &geni_i3c_pm_ops,
>> +		.of_match_table = geni_i3c_dt_match,
>> +	},
>> +};
>> +
>> +module_platform_driver(geni_i3c_master);
>> +
>> +MODULE_AUTHOR("Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>");
>> +MODULE_DESCRIPTION("Qualcomm I3C Controller Driver for GENI based QUP cores");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:geni_i3c_master");
> 
> Drop alias
> 
Sure, Done.
> 
> Best regards,
> Krzysztof


