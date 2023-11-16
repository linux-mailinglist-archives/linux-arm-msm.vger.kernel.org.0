Return-Path: <linux-arm-msm+bounces-781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F08FA7EDECD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 11:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26B161C2083D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 10:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9072523750;
	Thu, 16 Nov 2023 10:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zz8aZ6XB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498DD1B9;
	Thu, 16 Nov 2023 02:47:28 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AG5WYOD025542;
	Thu, 16 Nov 2023 10:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Cn8olFKDeTEapbVBkb5b5dpQq6Q1s+C8jvBPvhu2nwk=;
 b=Zz8aZ6XBdfoilriznxGtigllxZjBTofXbDWLkV4uqRDoZyxDWJGNQAhoMC2AED7p0v5a
 iE5Xb/16AW3VLrEcQ3jtUyRBfQHL7dSrvJJw1XdoQyT/FQdxS6FaWnhBXi7KDxte4iV9
 Np76W45ZIRBFaGMoQ41roZ5eelNc01Qy9z1yckyMzagjcGUloRROJcf2XZ0ZLyZ5lCRq
 lkAryD/c5CjDiH3WhipkqD6XL38IogNF/kKwfCSQPf2r64hB+vLGszK2aEFflYbLkcVg
 h7OwrjVq0G69ZXwPAJ7NxzXU17hlOQCaH5iIOn6O6yqjLyVA5CZsetUbCI7Z9U8Bx9se 7g== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ud7b8s9ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 10:47:15 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AGAlE0n003126
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 10:47:14 GMT
Received: from [10.253.72.184] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 16 Nov
 2023 02:47:10 -0800
Message-ID: <2ca3c6eb-93da-4e44-aa6b-c426b8baecb9@quicinc.com>
Date: Thu, 16 Nov 2023 18:47:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] net: mdio: ipq4019: add qca8084 configurations
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
 <20231115032515.4249-9-quic_luoj@quicinc.com>
 <a1954855-f82d-434b-afd1-aa05c7a1b39b@lunn.ch>
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <a1954855-f82d-434b-afd1-aa05c7a1b39b@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: u9bHEkF3KW_0JlAYEr0OswZ0jgLDQGfJ
X-Proofpoint-GUID: u9bHEkF3KW_0JlAYEr0OswZ0jgLDQGfJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_09,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxlogscore=694 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311160086



On 11/16/2023 12:20 AM, Andrew Lunn wrote:
> On Wed, Nov 15, 2023 at 11:25:14AM +0800, Luo Jie wrote:
>> The PHY & PCS clocks need to be enabled and the reset
>> sequence needs to be completed to make qca8084 PHY
>> probeable by MDIO bus.
> 
> Is all this guaranteed to be the same between different boards? Can
> the board be wired differently and need a different configuration?
> 
>      Andrew

Hi Andrew,
This configuration sequence is specified to the qca8084 chip,
not related with the platform(such as ipq5332).

All these configured registers are located in qca8084 chip, we need
to complete these configurations to make MDIO bus being able to
scan the qca8084 PHY(PHY registers can be accessed).

