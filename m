Return-Path: <linux-arm-msm+bounces-47677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B305A31BA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 02:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC67B7A2A99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 01:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52501482F2;
	Wed, 12 Feb 2025 01:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vc758I9Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F9A86347
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 01:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739325546; cv=none; b=oUxosveiVmGCWZ2zwOep/9fVfYqV4xAx0hS/DbJuTnYXVlIlYy4E9KQnbe5H2HB6aBOwwLc6z1SU7xWuY1RaR3Q5dtOEOiMD0+9GHwitolJy3vlSmd+QDlT+x77EJoXGgDJ2Fi1FJLrYPNFQVUk3N3JuIE2isy5mzm7xL4LLhbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739325546; c=relaxed/simple;
	bh=TgTFzIfKCXEPT/O7ObTgjTQk9DcHKZ5vxqv1bmZnltI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTCVfb56XUHkDzxpmUvAm3Q2muZxLYCofRjuX7EHa1XPP7MRX8B22PwITeVXOXiP9XxHUQrcNyMrh2Lw4GLBEjNFmU4ZXYkrJva6KUE63tOXdOxP55dyWgnU1HgsK/WQxJLbRLroa+2xHZI21hNyW8fVIsG6QtdZSRVv2kFZwOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vc758I9Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C0b9in030244
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 01:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	awv0rGxstM311fFi4Sv24BEaC0+mwddjoTpetAR3/s4=; b=Vc758I9ZNeYjWDTN
	b8yxc7Os7WRcFZt7zsZAAiVHzTCLuno8/YYdiJwQM5/SSdBgxQtc+Kl9jObDLRah
	KrWwiyO37+5viWIJyMOCB5qJUiIFWdJjHnhaQ2nnoJhlFTJW5kGhh2nnQcXpIDfr
	08wS/bKMX9c1DWHzbRDHjn7RYuPUSvfRoLgL8jpWXZtjAYOgWFgH0Fh2yde3abms
	q+sn50VIuHwThLKAPIMsScI50Aef6zOsBYvYcBzISlKwVWT9zm00URsLhze9j0RM
	Hyqsme00ExNKBE0ruyNFgoISmthPmVPFJ4aYChmPKMIw6XCPfBSgqd7cs52Rm0E1
	J3pHNw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxg9ka51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 01:59:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fa57c42965so7320186a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 17:59:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739325542; x=1739930342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=awv0rGxstM311fFi4Sv24BEaC0+mwddjoTpetAR3/s4=;
        b=mvjEEQJs0JXOalt83WUqXUvLhg1xQ7EGnDz0/j2QW3jig4OqbcWR7XhVltwIVEwv/B
         nJQf+QW4noJH/cGTKEWksqlmLB1C7QRllUc4kUneLuGfgp9KWf/jQtEA7UEczpVTSqaV
         aS+T0YPBmOgmw6C7sq2TSt7PqWZtcfG6uP/J49HUaM/7nV7YwbMKIEQMGOm/7UWn5YBO
         KZho4yY7pPWxYRxTEiSSpxSMrWVBc9i8WAttPxEE4CPixvnvT5iFYBAo59OkAdkoXs/S
         oTYcnYAj+z4r9Nn++KsNvhL5isD6AG6Q/h2admSMSX+cRvqZ3Xqaeq1ogP4oxL6EC8Yl
         1IDQ==
X-Gm-Message-State: AOJu0YxNLhGCkyjVbmFooKsParQ1voyXmMgCho8ymNAXpibcyheNOd+E
	rWdGx3h+nWTRndfP5aBVahACkYjDVoKJlL7G2tJ4KV1deUxw6vg4l7IKbUAUUbzE2FmwKo4zJle
	2ZGOZa/fqFHQuICGU3oWFa7ntovyEkWBY7LIaaty4bON5e2aDyzHzoGLUsmJOOfUA
X-Gm-Gg: ASbGncs1x5sJTiYzOw05MjJykrdrNlekm3pOD62UlMuUT/ljoDcxkEqFRQBlwcg1dnf
	lvMXxg+VWDS/99syOCw0nzoyNeQ80IALwrAt385HLNLoh7T5R8xYqSjLNcZ3STGPFY8V7oc3w/T
	7sHiC86L9Y68dUoeBN0f7rJxEQpDg1Sc1YU0+C7r1nzVg7YW/mRXEIL9vauvOJYdzD+A/SMEj3A
	TLUXAe1ocYxVKtxRkO2bjEfDDbqkGXbVI/sAgS2kpwtrcqda/5rssCQcgQT6tsurMrc5BGrHs0w
	4x/uJ+CWCJJhB2scWZeZV6BDlo+rKObTjI+6VRmV4yQtlFsz7Cq6EiyRxjVT56z+
X-Received: by 2002:a05:6a20:918e:b0:1ee:49ca:759a with SMTP id adf61e73a8af0-1ee5c73340amr3109483637.2.1739325542302;
        Tue, 11 Feb 2025 17:59:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9Ozamvj+FZMPdOC0mLlHyPulDXC1bHtTkbyAiVj5wsepcMbBLe+J/zsOKEgvKiq2TwNTNew==
X-Received: by 2002:a05:6a20:918e:b0:1ee:49ca:759a with SMTP id adf61e73a8af0-1ee5c73340amr3109438637.2.1739325541866;
        Tue, 11 Feb 2025 17:59:01 -0800 (PST)
Received: from [10.133.33.12] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73087d8dc08sm4990517b3a.128.2025.02.11.17.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 17:59:01 -0800 (PST)
Message-ID: <1882f5dd-4e46-40b9-977d-dc3570975738@oss.qualcomm.com>
Date: Wed, 12 Feb 2025 09:58:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 03/14] net: ethernet: qualcomm: Add PPE driver
 for IPQ9574 SoC
To: Jie Luo <quic_luoj@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
        john@phrozen.org
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-3-453ea18d3271@quicinc.com>
 <58e05149-abc2-4cf4-a6e8-35380823d94a@oss.qualcomm.com>
 <63f1d25c-087a-46dd-9053-60334a0095d5@quicinc.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <63f1d25c-087a-46dd-9053-60334a0095d5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sLeXXe7rGuEOgrCkOXyUND5aN35k1xmg
X-Proofpoint-GUID: sLeXXe7rGuEOgrCkOXyUND5aN35k1xmg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_10,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120014



On 2/11/2025 9:58 PM, Jie Luo wrote:
> 
> 
> On 2/10/2025 10:12 AM, Jie Gan wrote:
>>> +static int ppe_clock_init_and_reset(struct ppe_device *ppe_dev)
>>> +{
>>> +    unsigned long ppe_rate = ppe_dev->clk_rate;
>>> +    struct device *dev = ppe_dev->dev;
>>> +    struct reset_control *rstc;
>>> +    struct clk_bulk_data *clks;
>>> +    struct clk *clk;
>>> +    int ret, i;
>>> +
>>> +    for (i = 0; i < ppe_dev->num_icc_paths; i++) {
>>> +        ppe_dev->icc_paths[i].name = ppe_icc_data[i].name;
>>> +        ppe_dev->icc_paths[i].avg_bw = ppe_icc_data[i].avg_bw ? :
>>> +                           Bps_to_icc(ppe_rate);
>> it's ppe_dev->icc_paths[i].avg_bw = ppe_icc_data[i].avg_bw ? 
>> ppe_icc_data[i].avg_bw : Bps_to_icc(ppe_rate);  ?
> 
> I feel the above used notation is also fine for readability, and is
> shorter and simpler.
> 
>>
>>
>>> +        ppe_dev->icc_paths[i].peak_bw = ppe_icc_data[i].peak_bw ? :
>>> +                        Bps_to_icc(ppe_rate);
>> Same with previous one?
> 
> Same response as for the previous comment is applicable here as well.
> 
>>
>>> +    }
>>> +
>>> +    ret = devm_of_icc_bulk_get(dev, ppe_dev->num_icc_paths,
>>> +                   ppe_dev->icc_paths);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = icc_bulk_set_bw(ppe_dev->num_icc_paths, ppe_dev->icc_paths);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    /* The PPE clocks have a common parent clock. Setting the clock
>> Should be:
>> /*
>>   * The PPE clocks have a common parent clock. Setting the clock
>>   * rate of "ppe" ensures the clock rate of all PPE clocks is
>>   * configured to the same rate.
>>   */
>>
> 
> I think for drivers/net, the above format follows the recommended
> commenting style. Pls see: https://www.kernel.org/doc/html/v6.10/
> process/coding-style.html
> 
> For files in net/ and drivers/net/ the preferred style for long
> (multi-line) comments is a little different.
> 
>> BTW, it's better wrapped with ~75 characters per line.
> 
> Yes, the comments should be wrapped to ~75 characters.
> 
>>
>>> +     * rate of "ppe" ensures the clock rate of all PPE clocks is
>>> +     * configured to the same rate.
>>> +     */
>>> +    clk = devm_clk_get(dev, "ppe");
>>> +    if (IS_ERR(clk))
>>> +        return PTR_ERR(clk);
>>> +
>>> +    ret = clk_set_rate(clk, ppe_rate);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = devm_clk_bulk_get_all_enabled(dev, &clks);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    /* Reset the PPE. */
>>> +    rstc = devm_reset_control_get_exclusive(dev, NULL);
>>> +    if (IS_ERR(rstc))
>>> +        return PTR_ERR(rstc);
>>> +
>>> +    ret = reset_control_assert(rstc);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    /* The delay 10 ms of assert is necessary for resetting PPE. */
>>> +    usleep_range(10000, 11000);
>>> +
>>> +    return reset_control_deassert(rstc);
>>> +}
>>> +
>>> +static int qcom_ppe_probe(struct platform_device *pdev)
>>> +{
>>> +    struct device *dev = &pdev->dev;
>>> +    struct ppe_device *ppe_dev;
>>> +    void __iomem *base;
>>> +    int ret, num_icc;
>> I think it's better with:
>>      int num_icc = ARRAY_SIZE(ppe_icc_data);
> 
> This will impact the “reverse xmas tree” rule for local variable
> definitions. Also, the num_icc will vary as per the different SoC,
> so we will need to initialize the num_icc in a separate statement.
> 
> (Note: This driver will be extended to support different SoC in
> the future.)
> 
Got your point here. So there may have multiple definitions like 
ppe_icc_data here, right? But the num_icc here is hardcoded.
Maybe it would be better defined within the ppe_icc_data, if possible?
Then just directly use ppe_icc_data->num_icc?

Never mind, that's just my thought on the flexibility.

Jie
>>
>>> +
>>> +    num_icc = ARRAY_SIZE(ppe_icc_data);
>>> +    ppe_dev = devm_kzalloc(dev, struct_size(ppe_dev, icc_paths, 
>>> num_icc),
>>> +                   GFP_KERNEL);
>>> +    if (!ppe_dev)
>>> +        return -ENOMEM;
>>> +
>>> +    base = devm_platform_ioremap_resource(pdev, 0);
>>> +    if (IS_ERR(base))
>>> +        return dev_err_probe(dev, PTR_ERR(base), "PPE ioremap 
>>> failed\n");
>>> +
>>> +    ppe_dev->regmap = devm_regmap_init_mmio(dev, base, 
>>> &regmap_config_ipq9574);
>>> +    if (IS_ERR(ppe_dev->regmap))
>>> +        return dev_err_probe(dev, PTR_ERR(ppe_dev->regmap),
>>> +                     "PPE initialize regmap failed\n");
>>> +    ppe_dev->dev = dev;
>>> +    ppe_dev->clk_rate = PPE_CLK_RATE;
>>> +    ppe_dev->num_ports = PPE_PORT_MAX;
>>> +    ppe_dev->num_icc_paths = num_icc;
>>> +
>>> +    ret = ppe_clock_init_and_reset(ppe_dev);
>>> +    if (ret)
>>> +        return dev_err_probe(dev, ret, "PPE clock config failed\n");
>>> +
>>> +    platform_set_drvdata(pdev, ppe_dev);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct of_device_id qcom_ppe_of_match[] = {
>>> +    { .compatible = "qcom,ipq9574-ppe" },
>>> +    {}
>>> +};
>>> +MODULE_DEVICE_TABLE(of, qcom_ppe_of_match);
>>> +
>>> +static struct platform_driver qcom_ppe_driver = {
>>> +    .driver = {
>>> +        .name = "qcom_ppe",
>>> +        .of_match_table = qcom_ppe_of_match,
>>> +    },
>>> +    .probe    = qcom_ppe_probe,
>>> +};
>>> +module_platform_driver(qcom_ppe_driver);
>>> +
>>> +MODULE_LICENSE("GPL");
>>> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. IPQ PPE driver");
>>> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe.h b/drivers/net/ 
>>> ethernet/qualcomm/ppe/ppe.h
>>> new file mode 100644
>>> index 000000000000..cc6767b7c2b8
>>> --- /dev/null
>>> +++ b/drivers/net/ethernet/qualcomm/ppe/ppe.h
>>> @@ -0,0 +1,36 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only
>>> + *
>>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights 
>>> reserved.
>>> + */
>>> +
>>> +#ifndef __PPE_H__
>>> +#define __PPE_H__
>>> +
>>> +#include <linux/compiler.h>
>>> +#include <linux/interconnect.h>
>>> +
>>> +struct device;
>> #include <linux/device.h> ?
>>
>>> +struct regmap;
>> Same with previous one, include it's header file?
> 
> The driver only need to reference these structures but don't
> need their full definitions. So it should be fine to declare
> the existence of these structures here.
> 
>>
>>> +
>>> +/**
>>> + * struct ppe_device - PPE device private data.
>>> + * @dev: PPE device structure.
>>> + * @regmap: PPE register map.
>>> + * @clk_rate: PPE clock rate.
>>> + * @num_ports: Number of PPE ports.
>>> + * @num_icc_paths: Number of interconnect paths.
>>> + * @icc_paths: Interconnect path array.
>>> + *
>>> + * PPE device is the instance of PPE hardware, which is used to
>>> + * configure PPE packet process modules such as BM (buffer management),
>>> + * QM (queue management), and scheduler.
>>> + */
>>> +struct ppe_device {
>>> +    struct device *dev;
>>> +    struct regmap *regmap;
>>> +    unsigned long clk_rate;
>>> +    unsigned int num_ports;
>>> +    unsigned int num_icc_paths;
>>> +    struct icc_bulk_data icc_paths[] __counted_by(num_icc_paths);
>>> +};
>>> +#endif
>>>
>>
>> Thanks,
>> Jie
> 


