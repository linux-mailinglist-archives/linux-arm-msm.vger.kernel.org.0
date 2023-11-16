Return-Path: <linux-arm-msm+bounces-787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8177EDF6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 12:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47E72280E1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 11:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40212DF97;
	Thu, 16 Nov 2023 11:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YkOUP86y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C38CD4B;
	Thu, 16 Nov 2023 03:17:29 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AG93IT7012664;
	Thu, 16 Nov 2023 11:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SyAr0+834frsHXJosNimVgW4YH4JIr7IPM5AnqXeAGI=;
 b=YkOUP86yQ+BItnCcdr5Yl4EKM59qpaRaiubWxF0b1fnGdPa3wryuvTcis4cjXJjGDSdK
 0sgXPwEqPj4m2F+fd/E6SnHj7sRC/PIQw+53WRHTELo1AG+KbUt7vcon1aZd+tPbZB8t
 HPyyYmEXlBBJbxfhE2Aq5fKryM24VW9rBzEVeic2onQ32AJH53oS/4Lp/205FumO5Ny5
 0vxrnoyu6MM1vdHCsLa9BmaWxvQ62EEEMlXqsoybm9LrUIYFzbBHPpEY0PMWrH0MVaR+
 sBBOR5sIMNxKqC2Q/l9ubhwZF0fk2WZkQryBtXx5kk8E8bK0XdHFbKblKkLZ8LpGwnHe Iw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ucu27u58x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 11:17:13 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AGBHC1Z031871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 11:17:12 GMT
Received: from [10.253.72.184] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 16 Nov
 2023 03:17:07 -0800
Message-ID: <272ce8f7-9c57-4d5f-a609-52c098b63227@quicinc.com>
Date: Thu, 16 Nov 2023 19:17:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] net: mdio: ipq4019: program phy address when "fixup"
 defined
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
 <20231115032515.4249-8-quic_luoj@quicinc.com>
 <2cf175d7-d96b-4f51-9dd7-2ce8229ca212@lunn.ch>
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <2cf175d7-d96b-4f51-9dd7-2ce8229ca212@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: D4tc1U-T_wSHTygZBBDfZ6JOmujM6fLc
X-Proofpoint-ORIG-GUID: D4tc1U-T_wSHTygZBBDfZ6JOmujM6fLc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_09,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0
 mlxlogscore=635 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311160090



On 11/16/2023 12:17 AM, Andrew Lunn wrote:
> On Wed, Nov 15, 2023 at 11:25:13AM +0800, Luo Jie wrote:
>> The PHY/PCS MDIO address can be programed when the property
>> "fixup" of phy node is defined.
>>
>> The qca8084 PHY/PCS address configuration register is accessed
>> by MDIO bus with the special MDIO sequence.
>>
>> The PHY address configuration register of IPQ5018 is accessed
>> by local bus.
>>
>> Add the function ipq_mdio_preinit, which should be called before
>> the PHY device scanned and registered.
> 
> I'm not convinced this belongs in the MDIO bus driver. Its really a
> PHY property, so i think all this should be in the PHY driver. If you
> specify the PHY ID in the compatible string, you can get the driver
> loaded and the probe function called. You can then set the PHY
> address.
> 
> 	Andrew

I will try to do the initialization configs in the PHY probe function,
Thanks Andrew for the suggestions.

