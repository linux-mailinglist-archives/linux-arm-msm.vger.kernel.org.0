Return-Path: <linux-arm-msm+bounces-887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 362667EEF9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 11:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 659851C20B30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1317618039;
	Fri, 17 Nov 2023 10:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AyVKdcVo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C53284;
	Fri, 17 Nov 2023 02:00:13 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH9KDIL002157;
	Fri, 17 Nov 2023 09:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=q3iC62ynP/mZpKHk8fWgTSo66zEj7Zi2/0wjFcoZTGQ=;
 b=AyVKdcVov8hJCEoszwR2yzPg3FtYQpFAdLCOUa7IkkAHIW3yLfu/cIFgnXe3kisPG/C8
 HN/xE3WgmimYrTZERjSsijSfrXapuGaJ63qIH2VmgysX59q0O2CRzDOLoVA42l2OFayr
 nGbMKGoa4zWinQUTgJFC9IOQegFjvaYkIB6dKQluAmVsSKABJT8ylxHD3sutd45uoK4F
 Snd9P7WBL1JKyZoNk3QcIUa5tf4RfBcBUGUGP3NDHNazMwv09Fu1WbDLiaDxq8Z1+V9X
 jPCgEO3FWKlEIKDzZeDnTtIXv3gjyM3GwJ4TtJ+ADkrTvRcUrnxOEtFYZeFERAFJY3/8 1A== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ue5exr2hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 09:59:59 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AH9xvmZ009296
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 09:59:57 GMT
Received: from [10.253.8.81] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 17 Nov
 2023 01:59:53 -0800
Message-ID: <7e856fc9-25c7-489f-8a42-759ed126ae68@quicinc.com>
Date: Fri, 17 Nov 2023 17:59:51 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] net: mdio: ipq4019: Enable GPIO reset for ipq5332
 platform
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
CC: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
        <robert.marko@sartura.hr>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
 <20231115032515.4249-4-quic_luoj@quicinc.com>
 <e740a206-37af-49b1-a6b6-baa3c99165c0@lunn.ch>
 <33246b49-2579-4889-9fcb-babec5003a88@quicinc.com>
 <dd2c3cfa-f7ee-4abb-9eff-2aac04fa914f@lunn.ch>
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <dd2c3cfa-f7ee-4abb-9eff-2aac04fa914f@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M_yXy1nGjp7G9GwYZKFTPx6kEDNQjrct
X-Proofpoint-ORIG-GUID: M_yXy1nGjp7G9GwYZKFTPx6kEDNQjrct
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_07,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0
 mlxlogscore=774 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170073



On 11/17/2023 1:20 AM, Andrew Lunn wrote:
>> FYI, here is the sequence to bring up qca8084.
>> a. enable clock output to qca8084.
>> b. do gpio reset of qca8084.
>> c. customize MDIO address and initialization configurations.
>> d. the PHY ID can be acquired.
> 
> This all sounds like it is specific to the qca8084, so it should be in
> the driver for the qca8084.
> 
> Its been pointed out you can get the driver to load by using the PHY
> ID in the compatible. You want the SoC clock driver to export a CCF
> clock, which the PHY driver can use. The PHY driver should also be
> able to get the GPIO. So i think the PHY driver can do all this.
> 
>       Andrew

Yes, Andrew, that is feasible, i will update the patches to move the
initialized clock configs in the PHY probe function.

