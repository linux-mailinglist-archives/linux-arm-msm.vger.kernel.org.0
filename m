Return-Path: <linux-arm-msm+bounces-44596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C03A078FA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 15:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C7E87A114D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE18219A86;
	Thu,  9 Jan 2025 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="So6wUWxo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33515290F;
	Thu,  9 Jan 2025 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736432321; cv=none; b=qbeutBIgf6/d5WZCRA3sPaKynW0BV1epPsCg4ErGh2sP1Ri2mO+Q7ZCKCQFXdB501+gVyqSiB9ZeOtZgHFZAWhA/Qj6jyv6Wq8cp1T/3u8rkHOMFU5dBDvxu47c7/fXjyhmwwNV9WdxNWPxNLKtngRdk4RdGPJb0NJLX0TzXaJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736432321; c=relaxed/simple;
	bh=YfAm5GzIjdbz4owa5xnWV9gtpuvmrM2mW6eQhbKiSt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bgmtE/Rqq3aK2T437HihmAjX+VTowRW6cHmi4yjfL5zotRwX5wx5cZrWVjazhJHMIP/uZqTz2Emm/LOqroLYG7vvosXwtgQAELxkfz5+C/4e6zzojHN8JD9P6Y+kF2/Q5ynpTyRuf2y85bjJJbczQMUaxWXn+jx9PWPk3QKaPPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=So6wUWxo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5096hk55022415;
	Thu, 9 Jan 2025 14:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/2s/dlH3acuxpVLW+nsSRc87IEUOplUi45AC4Nv79ps=; b=So6wUWxoVKMlvaYL
	v4h3W39kWv41GLRwa2qJaLfr+fN5xVGQczlg4sdGFkUxvs4cR6o8W9wDIuDv3hIt
	UV18KpxS+L3zXQY+Rz3sugoYpDpH5DfuxoCo9WMHny+r23E0X2T5JZOKdbbmgFhq
	uIBBtj6VDsOKhtdj4wdzQiqOKMgPB3qB9c005e+nn++BDkG0FwbItgAqtsmjpiLS
	ryFDtzNpOgVORWBAtKO6tPqS/j6Fie88EmuopnwoG2HQplgJCJqLAt8h4KYZfcGU
	H68A8iy0T/7m/vp3sR6JqNELNgf94esK4QlYbwQCxnZ/qZsM8jT5SkoYcD2J/uXm
	kz60Jw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4429eph2ga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 14:18:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509EIMfI028063
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 14:18:22 GMT
Received: from [10.253.12.10] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 Jan 2025
 06:18:16 -0800
Message-ID: <6a980f4f-d27f-40a5-99f1-6f7c90949b6a@quicinc.com>
Date: Thu, 9 Jan 2025 22:18:13 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 03/14] net: ethernet: qualcomm: Add PPE driver
 for IPQ9574 SoC
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei
	<quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R.
 Silva" <gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
 <20250108-qcom_ipq_ppe-v2-3-7394dbda7199@quicinc.com>
 <29e742c9-82f5-41d5-a06f-70f010a3f39e@wanadoo.fr>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <29e742c9-82f5-41d5-a06f-70f010a3f39e@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8M9rqI-1R3Ky2R0AyHoR0hbZDhjrBXzM
X-Proofpoint-ORIG-GUID: 8M9rqI-1R3Ky2R0AyHoR0hbZDhjrBXzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090115



On 1/9/2025 3:19 AM, Christophe JAILLET wrote:
> Le 08/01/2025 à 14:47, Luo Jie a écrit :
>> The PPE (Packet Process Engine) hardware block is available
>> on Qualcomm IPQ SoC that support PPE architecture, such as
>> IPQ9574.
>>
>> The PPE in IPQ9574 includes six integrated ethernet MAC
>> (for 6 PPE ports), buffer management, queue management and
>> scheduler functions. The MACs can connect with the external
>> PHY or switch devices using the UNIPHY PCS block available
>> in the SoC.
>>
>> The PPE also includes various packet processing offload
>> capabilities such as L3 routing and L2 bridging, VLAN and
>> tunnel processing offload. It also includes Ethernet DMA
>> function for transferring packets between ARM cores and
>> PPE ethernet ports.
>>
>> This patch adds the base source files and Makefiles for
>> the PPE driver such as platform driver registration,
>> clock initialization, and PPE reset routines.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
> 
> ...
> 
>> +static int qcom_ppe_probe(struct platform_device *pdev)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct ppe_device *ppe_dev;
>> +    void __iomem *base;
>> +    int ret, num_icc;
>> +
>> +    num_icc = ARRAY_SIZE(ppe_icc_data);
>> +    ppe_dev = devm_kzalloc(dev, struct_size(ppe_dev, icc_paths, 
>> num_icc),
>> +                   GFP_KERNEL);
>> +    if (!ppe_dev)
>> +        return dev_err_probe(dev, -ENOMEM, "PPE alloc memory failed\n");
> 
> Usually, no error message in logged in case of devm_kzalloc().
> It is already loud enough.
> 

OK. Will remove.

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
>> +    {},
> 
> The ending comma after a terminator like that is not needed.

Will remove it.

> 
>> +};
> 
> ...
> 
> CJ
> 


