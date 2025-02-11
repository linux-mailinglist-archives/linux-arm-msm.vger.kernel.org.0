Return-Path: <linux-arm-msm+bounces-47595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7A4A30D81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2D0D3A41B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0335724C66B;
	Tue, 11 Feb 2025 13:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j2l1xfFn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F78230D0E;
	Tue, 11 Feb 2025 13:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282328; cv=none; b=M1qkOy46OWP8/x0I5+kW6dN2XYBQ1xMjFMcNx4L3f2XxFj1SkoXGbM5xYcM2YhRT4P1lZUXR90qXIhUFODkAJE0KKp11ASn6358y74eLmcIVYZ8/eiAiq2VmgnZwSDVE33PTgpXZJfx/NlUP/lVVM/TUMb4pTs1c5qV2GfC8Wg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282328; c=relaxed/simple;
	bh=hXDWyrUxxlVluBLQjzPISIGXWjZtzAeLnpTxqyO6AO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dFurUk/EpOBTNmabq6EltvMrP5ocLXCq24sMYfqrLdMxgVe4ODdVt19U4iIanZHr/+XYxh+81h0rM22V0dGOSO63uhZCunWCkT0clidn9s5H7+OkR4kZ8QwmwqB74jzxieSCHdMmhVviS7p6eUJGJJhROFIrqvwmEaXzg1ewIN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j2l1xfFn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BAvFbN031911;
	Tue, 11 Feb 2025 13:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hbU0vHYLWBxsiGVp8WiSzxVW5SL6glLxDc8K82144pg=; b=j2l1xfFnn+9XE98c
	VIsIcl9MU0c7+rRsnY9aLG86QTUia30/sA6dQ9YrRkrrtYGfvdNDmpzFSFPbPub3
	onp4s8zzLN2JtOSrwWkqx6vSpRUxZn5CXarHsd4oqgajbissVJ/OVU26x4LpYSHz
	0lcA7s/aZ3dyIprsZgjNnJSQJHq/NG50a0IKwqg3WabAVSzsEkdnn+FodNuJoHE6
	DnXEv0jYEzAeenf6uAdLFB/sgd2+3RzSE8ahkFESCLX4hTe2DIRPiGAjcyIBWIOJ
	6IP4wHdva2XUwVoTQLnH0Luv1/EYo+ySV2lxU0PLSAniWCOORJGy0az8zRujhpkt
	OvmZzw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qgtk3v6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 13:58:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51BDwRDd020186
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 13:58:28 GMT
Received: from [10.253.10.118] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Feb
 2025 05:58:22 -0800
Message-ID: <63f1d25c-087a-46dd-9053-60334a0095d5@quicinc.com>
Date: Tue, 11 Feb 2025 21:58:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 03/14] net: ethernet: qualcomm: Add PPE driver
 for IPQ9574 SoC
To: Jie Gan <jie.gan@oss.qualcomm.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Lei Wei <quic_leiwei@quicinc.com>,
        "Suruchi
 Agarwal" <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook
	<kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-3-453ea18d3271@quicinc.com>
 <58e05149-abc2-4cf4-a6e8-35380823d94a@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <58e05149-abc2-4cf4-a6e8-35380823d94a@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _lFZo8511gjvZFjnbbPkXbLJ9LdnYphr
X-Proofpoint-ORIG-GUID: _lFZo8511gjvZFjnbbPkXbLJ9LdnYphr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110093



On 2/10/2025 10:12 AM, Jie Gan wrote:
>> +static int ppe_clock_init_and_reset(struct ppe_device *ppe_dev)
>> +{
>> +    unsigned long ppe_rate = ppe_dev->clk_rate;
>> +    struct device *dev = ppe_dev->dev;
>> +    struct reset_control *rstc;
>> +    struct clk_bulk_data *clks;
>> +    struct clk *clk;
>> +    int ret, i;
>> +
>> +    for (i = 0; i < ppe_dev->num_icc_paths; i++) {
>> +        ppe_dev->icc_paths[i].name = ppe_icc_data[i].name;
>> +        ppe_dev->icc_paths[i].avg_bw = ppe_icc_data[i].avg_bw ? :
>> +                           Bps_to_icc(ppe_rate);
> it's ppe_dev->icc_paths[i].avg_bw = ppe_icc_data[i].avg_bw ? 
> ppe_icc_data[i].avg_bw : Bps_to_icc(ppe_rate);  ?

I feel the above used notation is also fine for readability, and is
shorter and simpler.

> 
> 
>> +        ppe_dev->icc_paths[i].peak_bw = ppe_icc_data[i].peak_bw ? :
>> +                        Bps_to_icc(ppe_rate);
> Same with previous one?

Same response as for the previous comment is applicable here as well.

> 
>> +    }
>> +
>> +    ret = devm_of_icc_bulk_get(dev, ppe_dev->num_icc_paths,
>> +                   ppe_dev->icc_paths);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = icc_bulk_set_bw(ppe_dev->num_icc_paths, ppe_dev->icc_paths);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* The PPE clocks have a common parent clock. Setting the clock
> Should be:
> /*
>   * The PPE clocks have a common parent clock. Setting the clock
>   * rate of "ppe" ensures the clock rate of all PPE clocks is
>   * configured to the same rate.
>   */
> 

I think for drivers/net, the above format follows the recommended
commenting style. Pls see: https://www.kernel.org/doc/html/v6.10/
process/coding-style.html

For files in net/ and drivers/net/ the preferred style for long
(multi-line) comments is a little different.

> BTW, it's better wrapped with ~75 characters per line.

Yes, the comments should be wrapped to ~75 characters.

> 
>> +     * rate of "ppe" ensures the clock rate of all PPE clocks is
>> +     * configured to the same rate.
>> +     */
>> +    clk = devm_clk_get(dev, "ppe");
>> +    if (IS_ERR(clk))
>> +        return PTR_ERR(clk);
>> +
>> +    ret = clk_set_rate(clk, ppe_rate);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = devm_clk_bulk_get_all_enabled(dev, &clks);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    /* Reset the PPE. */
>> +    rstc = devm_reset_control_get_exclusive(dev, NULL);
>> +    if (IS_ERR(rstc))
>> +        return PTR_ERR(rstc);
>> +
>> +    ret = reset_control_assert(rstc);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* The delay 10 ms of assert is necessary for resetting PPE. */
>> +    usleep_range(10000, 11000);
>> +
>> +    return reset_control_deassert(rstc);
>> +}
>> +
>> +static int qcom_ppe_probe(struct platform_device *pdev)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct ppe_device *ppe_dev;
>> +    void __iomem *base;
>> +    int ret, num_icc;
> I think it's better with:
>      int num_icc = ARRAY_SIZE(ppe_icc_data);

This will impact the “reverse xmas tree” rule for local variable
definitions. Also, the num_icc will vary as per the different SoC,
so we will need to initialize the num_icc in a separate statement.

(Note: This driver will be extended to support different SoC in
the future.)

> 
>> +
>> +    num_icc = ARRAY_SIZE(ppe_icc_data);
>> +    ppe_dev = devm_kzalloc(dev, struct_size(ppe_dev, icc_paths, 
>> num_icc),
>> +                   GFP_KERNEL);
>> +    if (!ppe_dev)
>> +        return -ENOMEM;
>> +
>> +    base = devm_platform_ioremap_resource(pdev, 0);
>> +    if (IS_ERR(base))
>> +        return dev_err_probe(dev, PTR_ERR(base), "PPE ioremap 
>> failed\n");
>> +
>> +    ppe_dev->regmap = devm_regmap_init_mmio(dev, base, 
>> &regmap_config_ipq9574);
>> +    if (IS_ERR(ppe_dev->regmap))
>> +        return dev_err_probe(dev, PTR_ERR(ppe_dev->regmap),
>> +                     "PPE initialize regmap failed\n");
>> +    ppe_dev->dev = dev;
>> +    ppe_dev->clk_rate = PPE_CLK_RATE;
>> +    ppe_dev->num_ports = PPE_PORT_MAX;
>> +    ppe_dev->num_icc_paths = num_icc;
>> +
>> +    ret = ppe_clock_init_and_reset(ppe_dev);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret, "PPE clock config failed\n");
>> +
>> +    platform_set_drvdata(pdev, ppe_dev);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct of_device_id qcom_ppe_of_match[] = {
>> +    { .compatible = "qcom,ipq9574-ppe" },
>> +    {}
>> +};
>> +MODULE_DEVICE_TABLE(of, qcom_ppe_of_match);
>> +
>> +static struct platform_driver qcom_ppe_driver = {
>> +    .driver = {
>> +        .name = "qcom_ppe",
>> +        .of_match_table = qcom_ppe_of_match,
>> +    },
>> +    .probe    = qcom_ppe_probe,
>> +};
>> +module_platform_driver(qcom_ppe_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. IPQ PPE driver");
>> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe.h b/drivers/net/ 
>> ethernet/qualcomm/ppe/ppe.h
>> new file mode 100644
>> index 000000000000..cc6767b7c2b8
>> --- /dev/null
>> +++ b/drivers/net/ethernet/qualcomm/ppe/ppe.h
>> @@ -0,0 +1,36 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only
>> + *
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + */
>> +
>> +#ifndef __PPE_H__
>> +#define __PPE_H__
>> +
>> +#include <linux/compiler.h>
>> +#include <linux/interconnect.h>
>> +
>> +struct device;
> #include <linux/device.h> ?
> 
>> +struct regmap;
> Same with previous one, include it's header file?

The driver only need to reference these structures but don't
need their full definitions. So it should be fine to declare
the existence of these structures here.

> 
>> +
>> +/**
>> + * struct ppe_device - PPE device private data.
>> + * @dev: PPE device structure.
>> + * @regmap: PPE register map.
>> + * @clk_rate: PPE clock rate.
>> + * @num_ports: Number of PPE ports.
>> + * @num_icc_paths: Number of interconnect paths.
>> + * @icc_paths: Interconnect path array.
>> + *
>> + * PPE device is the instance of PPE hardware, which is used to
>> + * configure PPE packet process modules such as BM (buffer management),
>> + * QM (queue management), and scheduler.
>> + */
>> +struct ppe_device {
>> +    struct device *dev;
>> +    struct regmap *regmap;
>> +    unsigned long clk_rate;
>> +    unsigned int num_ports;
>> +    unsigned int num_icc_paths;
>> +    struct icc_bulk_data icc_paths[] __counted_by(num_icc_paths);
>> +};
>> +#endif
>>
> 
> Thanks,
> Jie


