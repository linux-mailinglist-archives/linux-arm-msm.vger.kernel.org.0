Return-Path: <linux-arm-msm+bounces-49559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD9CA46C42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 21:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7033518827B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 20:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3CA215076;
	Wed, 26 Feb 2025 20:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XSaxc3cd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE20921CC42;
	Wed, 26 Feb 2025 20:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740601434; cv=none; b=Dpp2VwPjsF+ctHw//IrJAQAMkjqYbLqSLcuqTAHqLBsVdcZQVQrX16Itoo+CdFIPb/d9pTCr7+448j8jTEHkSZk9Uth0pCato1i04RU1K3kTp0HhMo0EcS60O8ylfhhnzexwtYqL6V0RbgSw4yc9tdUNXMS9zz3RO6sYQX3CvKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740601434; c=relaxed/simple;
	bh=hm/wgxxi0lHL/QH2ap0QFgsHLbP9pJSlJM6pGPzTN+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aPxcbMaWyqEptc09OlDjWlRlk9sX4PQrJSEu4A8Hl5+yJy+0OADbRuHFfCZiLw/hmrDsGnH+1EeqAQ9LUUjTNMiefbLd1nY+aXMhz1Bf+4i/i9lSYQkGIfWi+UwBP2SjbIVwe5Pt25jcQaaG+gvR4Gkr3FUttctvsqS4WYthz5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XSaxc3cd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QK58ud015362;
	Wed, 26 Feb 2025 20:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	paKREfFwbHcqbZjvwNKBMo99QStMmHRBvEVzzuo6WgI=; b=XSaxc3cdzmzdP5Fi
	SKm722C1Er0lXPLTpmtRyIkFXAH9iF1oj3iIjI++A8KX9BTAvVl6tXEVZLdVqOdY
	jF5NHV2QkO/F5h31DdggNAif9laaArjkAG21mzVu7C6v/AE1nSWtBXRdexFSXRKG
	EH0V88n5WYSCdjrTeOx2GvHW4KcukFFFcVH0ZnkhlCfyG12xYu8k6qZXAdkq+7vZ
	n/StJIrfELoEl9RmmXhtE9vGeQEyu9W6I1G7YdMk/hmg3PEx93j3A/J6oDNHZdF3
	VChXX5PWe7/LxRiM0h834N1TG6Quedd8W1xLrEqymqR7al7zX6nnM5XwGMsNJq32
	5PuqGQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prnk7u8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 20:23:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QKNa6k023169
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 20:23:36 GMT
Received: from [10.110.48.1] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Feb
 2025 12:23:34 -0800
Message-ID: <92b42216-c409-4e21-a33e-54c29fa5f8a0@quicinc.com>
Date: Wed, 26 Feb 2025 12:23:34 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] phy: qcom: Add M31 based eUSB2 PHY driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-5-09afe1dc2524@quicinc.com>
 <rpwm6gimdb4zyvyusovfbfaw4uxrossm6elayebvt2gusb7zwk@67w7672qpcto>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <rpwm6gimdb4zyvyusovfbfaw4uxrossm6elayebvt2gusb7zwk@67w7672qpcto>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0QGtOvo9xVU4Chq5LxxVUDyTndPOpUeC
X-Proofpoint-ORIG-GUID: 0QGtOvo9xVU4Chq5LxxVUDyTndPOpUeC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_06,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260160



On 1/14/2025 2:34 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 13, 2025 at 01:52:11PM -0800, Melody Olvera wrote:
>> From: Wesley Cheng <quic_wcheng@quicinc.com>
>>
>> On SM8750, the eUSB2 PHY used is M31 based. Add the initialization
>> sequences to bring it out of reset, and to initialize the associated eUSB2
>> repeater as well.
> 
> What does M31 mean? What is the relationship between the eUSB and USB
> M31 PHYs?
> 

M31 is the vendor.  I'll reword this to make it a bit clearer.  There's no
relationship between eUSB2 and USB2 PHY drivers, as the eUSB2 based driver
would require some additional components such as a USB repeater.

>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>  drivers/phy/qualcomm/Kconfig              |  12 +-
>>  drivers/phy/qualcomm/Makefile             |   1 +
>>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 269 ++++++++++++++++++++++++++++++
>>  3 files changed, 281 insertions(+), 1 deletion(-)
> 
> Please run the patch through checkpatch.pl --strict
> 
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..e15529673e358db914936a60fa605c872cd2511a
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
>> @@ -0,0 +1,269 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset.h>
>> +#include <linux/slab.h>
>> +
>> +#define USB_PHY_UTMI_CTRL0		(0x3c)
>> +
>> +#define USB_PHY_UTMI_CTRL5		(0x50)
>> +
>> +#define USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
>> +#define FSEL				(0x7 << 4)
> 
> GENMASK()
> 
>> +#define FSEL_38_4_MHZ_VAL		(0x6 << 4)
> 
> FIELD_PREP
> 
>> +
>> +#define USB_PHY_HS_PHY_CTRL2		(0x64)
>> +
>> +#define USB_PHY_CFG0			(0x94)
>> +#define USB_PHY_CFG1			(0x154)
>> +
>> +#define USB_PHY_FSEL_SEL		(0xb8)
>> +
>> +#define USB_PHY_XCFGI_39_32		(0x16c)
>> +#define USB_PHY_XCFGI_71_64		(0x17c)
>> +#define USB_PHY_XCFGI_31_24		(0x168)
>> +#define USB_PHY_XCFGI_7_0		(0x15c)
>> +
>> +#define M31_EUSB_PHY_INIT_CFG(o, b, v)	\
>> +{				\
>> +	.off = o,		\
>> +	.mask = b,		\
>> +	.val = v,		\
>> +}
>> +
>> +struct m31_phy_tbl_entry {
>> +	u32 off;
>> +	u32 mask;
>> +	u32 val;
>> +};
>> +
>> +struct m31_eusb2_priv_data {
>> +	const struct m31_phy_tbl_entry	*setup_seq;
>> +	unsigned int			setup_seq_nregs;
>> +	const struct m31_phy_tbl_entry	*override_seq;
>> +	unsigned int			override_seq_nregs;
>> +	const struct m31_phy_tbl_entry	*reset_seq;
>> +	unsigned int			reset_seq_nregs;
>> +	unsigned int			fsel;
>> +};
>> +
>> +static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, BIT(1), 1),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, BIT(1), 1),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG1, BIT(0), 1),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_FSEL_SEL, BIT(0), 1),
>> +};
>> +
>> +static const struct m31_phy_tbl_entry m31_eusb_phy_override_tbl[] = {
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_39_32, GENMASK(3, 2), 0),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_71_64, GENMASK(3, 0), 7),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_31_24, GENMASK(2, 0), 0),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_7_0, GENMASK(1, 0), 0),
>> +};
>> +
>> +static const struct m31_phy_tbl_entry m31_eusb_phy_reset_tbl[] = {
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(3), 1),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(2), 1),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL0, BIT(0), 1),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, BIT(1), 1),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, BIT(2), 0),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, BIT(1), 0),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(3), 0),
>> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, BIT(1), 0),
>> +};
>> +
>> +struct m31eusb2_phy {
>> +	struct phy			*phy;
>> +	void __iomem			*base;
>> +	const struct m31_eusb2_priv_data	*data;
>> +
>> +	struct regulator		*vreg;
>> +	struct clk			*clk;
>> +	struct reset_control		*reset;
>> +
>> +	struct phy *repeater;
>> +};
>> +
>> +static void msm_m31_eusb2_write_readback(void __iomem *base, u32 offset,
>> +					const u32 mask, u32 val)
>> +{
>> +	u32 write_val, tmp = readl_relaxed(base + offset);
>> +
>> +	tmp &= ~mask;
>> +	write_val = tmp | val;
>> +
>> +	writel_relaxed(write_val, base + offset);
>> +
>> +	tmp = readl_relaxed(base + offset);
>> +	tmp &= mask;
>> +
>> +	if (tmp != val)
>> +		pr_err("write: %x to offset: %x FAILED\n", val, offset);
>> +}
>> +
>> +static void m31eusb2_phy_write_sequence(struct m31eusb2_phy *phy,
>> +					const struct m31_phy_tbl_entry *tbl,
>> +					int num)
>> +{
>> +	int i;
>> +
>> +	for (i = 0 ; i < num; i++, tbl++) {
>> +		dev_dbg(&phy->phy->dev, "Offset:%x BitMask:%x Value:%x",
>> +					tbl->off, tbl->mask, tbl->val);
>> +
>> +		msm_m31_eusb2_write_readback(phy->base,
>> +					tbl->off, tbl->mask,
>> +					tbl->val << __ffs(tbl->mask));
> 
> could you please check, what actually gets written? I suspect there
> should be a -1 here.
> 

The __ffs  uses the ctz/ctzl built in, which counts leading zeros, so the
-1 should already be accounted for.  FIELD_PREP uses the ffs builtin
directly, which would require the -1.  Confirmed that the writes are being
done as expected from the programming tables above.

Thanks
Wesley Cheng

