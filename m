Return-Path: <linux-arm-msm+bounces-53459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A90A7F2AF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 04:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F220E7A4AC6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 02:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B194F1A7045;
	Tue,  8 Apr 2025 02:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SIAaWqhZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87008F77;
	Tue,  8 Apr 2025 02:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744079618; cv=none; b=qsrJpP7VXJEckAlfkn8egG5InM8td/7W/rvU/BAlJ2i2bb8kzHXpAnIg72o9YMbn58kcEMPGF4dvYjckzSBzzwyxK3CzPCpZ6i273ic5gGCnDpGamOyLlvLj/RUgvjRM16a/4aOCrqehyaUTSAkNxZEoiAE2l4WRDscP8dQ+dfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744079618; c=relaxed/simple;
	bh=vSBnwvoM1GwONMhi4Pk2sXk0SrZulUpa7dTpzQ9opg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n3pzZjdtp3xtk10AVNHoXTgWueP/6eKV4dgA5VTG4/j8/K98r5JBX6pJWJBE6EH8MnocolGir2R40MEq68OOwFo3aO3JuEfDUR2E5G3DA6Vu3HyP8jgP+6lxrL+eeCHXqf5rmZAYatfTzN41H6dKLfzvEVRM/r/830VIZRHXvmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SIAaWqhZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GPej019664;
	Tue, 8 Apr 2025 02:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8tkLU/q9k4bzXOFaIPnKaXKZ9vxRAORbRLbV0GT2sj4=; b=SIAaWqhZKCRyXT5b
	LPOPvCKqjpkCu4mwv6zyomN6MHZkgmlw0so8HPOIgFTvYq9Cf0A5r6JjZrxaZXeX
	OvSmKVyc0wqaJiV6Ici0LY8qoLGCe9CFuvsFTbncuBBYcapvFSp6QRA+NlhNZBMA
	YZracMLeBdI3rOiAtyyfMvzSSgrV9iS26Q/4pRmCEW59Rb+JkDisEovKEPAZMAHx
	8G92RknUmauD2coG9zoNEIUFGGyckGXdiK/JEne37Ai79LhaYsRwU7OyUnl9SneG
	MYCt2UZ2tEpMAw3SRTBU9KAAYZ8jF8DTs4J/VIldsAvFodejUY9NvJbK+gTiWQSq
	pD0VDg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3e566-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 02:32:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5382WtF9000584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 02:32:55 GMT
Received: from [10.110.75.38] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Apr 2025
 19:32:54 -0700
Message-ID: <73499d82-e7e5-b88a-41a4-160529efc988@quicinc.com>
Date: Mon, 7 Apr 2025 19:32:53 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Melody Olvera
	<quic_molvera@quicinc.com>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com>
 <20250324-sm8750_usb_master-v3-6-13e096dc88fd@quicinc.com>
 <kj5dyy7bclmkft7x4hdpzpo7n35cu5nkpksj47phb7jt5lceab@7fb5i6gluqwz>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <kj5dyy7bclmkft7x4hdpzpo7n35cu5nkpksj47phb7jt5lceab@7fb5i6gluqwz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 21XJomGnkL8m6ur2pvtTBprBrwIZ3tQc
X-Proofpoint-ORIG-GUID: 21XJomGnkL8m6ur2pvtTBprBrwIZ3tQc
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f48ad8 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=IJHOkPr1J-CqusO2T_sA:9 a=QEXdDO2ut3YA:10
 a=RVmHIydaz68A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_07,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080016

Hi Dmitry,

On 3/26/2025 7:33 AM, Dmitry Baryshkov wrote:
> On Mon, Mar 24, 2025 at 01:18:34PM -0700, Melody Olvera wrote:
>> From: Wesley Cheng <quic_wcheng@quicinc.com>
>>
>> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
>> sequences to bring it out of reset and into an operational state.  This
>> differs to the M31 USB driver, in that the M31 eUSB2 driver will
>> require a connection to an eUSB2 repeater.  This PHY driver will handle
>> the initialization of the associated eUSB2 repeater when required.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>   drivers/phy/qualcomm/Kconfig              |  10 +
>>   drivers/phy/qualcomm/Makefile             |   1 +
>>   drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 297 ++++++++++++++++++++++++++++++
>>   3 files changed, 308 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..b18aab968122683e2e87287a4b570321d376870a
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
>> @@ -0,0 +1,297 @@
>> +// SPDX-License-Identifier: GPL-2.0+
> 
> GPL-2.0-only
> 

Will fix.

>> +/*
>> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
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
>> +#include <linux/regulator/consumer.h>
>> +
>> +#define USB_PHY_UTMI_CTRL0		(0x3c)
>> +
>> +#define USB_PHY_UTMI_CTRL5		(0x50)
>> +
>> +#define USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
>> +#define FSEL				GENMASK(6, 4)
>> +#define FSEL_38_4_MHZ_VAL		(0x6)
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
> 
> I suppose, we can not expect to have #defines for all used bitfields?
> 

Added the bitfields as requested.

>> +};
>> +
> 
> [...]
> 
>> +
>> +static const struct phy_ops m31eusb2_phy_gen_ops = {
>> +	.init	= m31eusb2_phy_init,
>> +	.exit	= m31eusb2_phy_exit,
> 
> I think, you have a missing .set_mode callback here.
> 

Added this to properly set the mode on the repeater as well.

>> +	.owner	= THIS_MODULE,
>> +};
>> +
>> +static int m31eusb2_phy_probe(struct platform_device *pdev)
>> +{
>> +	struct phy_provider *phy_provider;
>> +	const struct m31_eusb2_priv_data *data;
>> +	struct device *dev = &pdev->dev;
>> +	struct m31eusb2_phy *phy;
>> +	int ret;
>> +
>> +	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
>> +	if (!phy)
>> +		return -ENOMEM;
>> +
>> +	data = of_device_get_match_data(dev);
> 
> device_get_match_data()
> 

Done.

Thanks
Wesley Cheng

