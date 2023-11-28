Return-Path: <linux-arm-msm+bounces-2194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 773B77FB255
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 08:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3C73B20C10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 07:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4312811C97;
	Tue, 28 Nov 2023 07:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZWvhmU/h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E95A1AE;
	Mon, 27 Nov 2023 23:07:57 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AS5ExcH007156;
	Tue, 28 Nov 2023 07:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=EHSnQ1K6dOFn8dhTgForb72oyvuW7hJGJHFHf26W7IA=;
 b=ZWvhmU/hu+6MkblFm+8eVWkq670vBKQaSKNHi68Rk3YChBy9hWx5hcPxNUe3fovwy55A
 O0+DmomHAoV0dN+avl3euKEXL3T6OiEBK/s5/Skc4x4pBedsGu+UW4uQpQ0sMR7r2HSx
 pRCGiYlfR4htiJvVD14cK5JJiBH5gcVr2TyRmcDV9Ipht8q23SAmXp2eKZ90bZmQsxm+
 RBV+J0tqxaI/HJs/qDAFgl7pw0LiUjyV7wrAPckUMYMmhQAkBYqWu8tpXgT1bOWoEGWB
 Wb+6NPAnDyqs7UgqCEvOAXbrBDyr98uOjWIWC4VB8m2sdONAe3Bw5YY1RYjsVuFsyRHh pQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3un04bhfna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 07:07:26 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AS77Put030220
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 07:07:25 GMT
Received: from [10.253.72.234] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 27 Nov
 2023 23:07:21 -0800
Message-ID: <16265061-3850-483b-9040-3540a6a173d8@quicinc.com>
Date: Tue, 28 Nov 2023 15:07:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] net: mdio: ipq4019: Enable the clocks for ipq5332
 platform
Content-Language: en-US
To: Simon Horman <horms@kernel.org>
CC: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <robert.marko@sartura.hr>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
 <20231115032515.4249-3-quic_luoj@quicinc.com>
 <20231127093759.GD84723@kernel.org>
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <20231127093759.GD84723@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wUKUtMUGFT-K7jnix_TdLAopXa9GVf3c
X-Proofpoint-GUID: wUKUtMUGFT-K7jnix_TdLAopXa9GVf3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_05,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280053



On 11/27/2023 5:37 PM, Simon Horman wrote:
> On Wed, Nov 15, 2023 at 11:25:08AM +0800, Luo Jie wrote:
>> For the platform ipq5332, the related GCC clocks need to be enabled
>> to make the GPIO reset of the MDIO slave devices taking effect.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>   drivers/net/mdio/mdio-ipq4019.c | 67 +++++++++++++++++++++++++++++----
>>   1 file changed, 60 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/net/mdio/mdio-ipq4019.c b/drivers/net/mdio/mdio-ipq4019.c
>> index 9d444f5f7efb..a77982a1a1e1 100644
>> --- a/drivers/net/mdio/mdio-ipq4019.c
>> +++ b/drivers/net/mdio/mdio-ipq4019.c
> 
> ...
> 
>> +const char *const mdio_clk_name[] = {
>> +	"gcc_mdio_ahb_clk",
>> +	"gcc_uniphy0_ahb_clk",
>> +	"gcc_uniphy0_sys_clk",
>> +	"gcc_uniphy1_ahb_clk",
>> +	"gcc_uniphy1_sys_clk"
>>   };
> 
> Hi Luo Jie,
> 
> A minor nit from my side: It appears that mdio_clk_name is only
> used in this file. If so it should be declared as static.
> 
> ...

Hi Simon,
The mdio_clk_name is only used in this file, will update to use
static, thanks.

