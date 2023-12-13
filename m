Return-Path: <linux-arm-msm+bounces-4507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A40A4810C0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 09:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4510BB20A7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 08:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACE11CF8C;
	Wed, 13 Dec 2023 08:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mRM1Lsxh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF60DC;
	Wed, 13 Dec 2023 00:10:25 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BD7SKZ7024094;
	Wed, 13 Dec 2023 08:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=gvSnVn+LDgma7p84JhK3TqLX+SbuVfd4ulOdi+AG5ls=; b=mR
	M1Lsxha8xoStNL56pDQdJTMm61pw5LvotZ4bfCfFOk4MjufmVlwJMRtD+8aPwsko
	qsP3UODWYHZ6kCs3DDhWFqY46Jy59KZZM6r5jZr4VujSVcBwYGfCKgd/UtlvyIYM
	2U5gMI2gdb5LaRjZBr2cn+tdjXQ1MHOLioUchIZkM8WbVzqSxTvYvNw2nWWSXC1t
	rtvMA10mFBW4mLn5hXDVPn6Ta03qZCcX3lNsGx9EVX+xmYYhWtu1I3irOqLBJGaT
	eEqcIGa9f0B7L9PwHK5t0eZszZFwSwtUUzM12B0yZ+WYo8hFFjQ5lz52lzn9BAxi
	AHB/ZcIx+gRqK10RwkUw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxkc833gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 08:10:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BD8A1Ml022698
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 08:10:01 GMT
Received: from [10.253.13.71] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Dec
 2023 00:09:55 -0800
Message-ID: <b7b0ab99-7277-4618-9037-a878d7b899a9@quicinc.com>
Date: Wed, 13 Dec 2023 16:09:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] net: mdio: ipq4019: configure CMN PLL clock for
 ipq5332
Content-Language: en-US
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
CC: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <robert.marko@sartura.hr>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>
References: <20231212115151.20016-1-quic_luoj@quicinc.com>
 <20231212115151.20016-4-quic_luoj@quicinc.com>
 <20231212135417.67ece4d0@device.home>
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <20231212135417.67ece4d0@device.home>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4n-DhV8VrtmRKksbV9Qioh9e0CRFd6OV
X-Proofpoint-ORIG-GUID: 4n-DhV8VrtmRKksbV9Qioh9e0CRFd6OV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 mlxscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130058



On 12/12/2023 8:54 PM, Maxime Chevallier wrote:
> Hello,
> 
> I have some more minor comments for yoi :)
> 
> On Tue, 12 Dec 2023 19:51:48 +0800
> Luo Jie <quic_luoj@quicinc.com> wrote:
> 
>> The reference clock of CMN PLL block is selectable, the internal
>> 48MHZ is used by default.
>>
>> The output clock of CMN PLL block is for providing the clock
>> source of ethernet device(such as qca8084), there are 1 * 25MHZ
>> and 3 * 50MHZ output clocks available for the ethernet devices.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
> 
> [...]
> 
>> +/* For the CMN PLL block, the reference clock can be configured according to
>> + * the device tree property "cmn-reference-clock", the internal 48MHZ is used
>> + * by default on the ipq533 platform.
>> + *
>> + * The output clock of CMN PLL block is provided to the ethernet devices,
>> + * threre are 4 CMN PLL output clocks (1*25MHZ + 3*50MHZ) enabled by default.
>> + *
>> + * Such as the output 50M clock for the qca8084 ethernet PHY.
>> + */
>> +static int ipq_cmn_clock_config(struct mii_bus *bus)
>> +{
>> +	int ret;
>> +	u32 reg_val, src_sel, ref_clk;
>> +	struct ipq4019_mdio_data *priv;
> 
> Here you should also use reverse christmas-tree notation

Ok, will correct this, thanks.

> 
> [...]
> 
>> @@ -317,6 +441,17 @@ static int ipq4019_mdio_probe(struct platform_device *pdev)
>>   		}
>>   	}
>>   
>> +	/* The CMN block resource is for providing clock source to ethernet,
>> +	 * which can be optionally configured on the platform ipq9574 and
>> +	 * ipq5332.
>> +	 */
>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cmn_blk");
>> +	if (res) {
>> +		priv->cmn_membase = devm_ioremap_resource(&pdev->dev, res);
>> +		if (IS_ERR(priv->cmn_membase))
>> +			return PTR_ERR(priv->cmn_membase);
>> +	}
>> +
> 
> And here you can simplify a bit by using
> devm_platform_ioremap_resource_byname()
> 
> Thanks,
> 
> Maxime
> 
As Russell mentioned, since this resource is optional,
so devm_platform_ioremap_resource_byname can't be used here.


