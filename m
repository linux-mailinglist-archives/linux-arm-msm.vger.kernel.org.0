Return-Path: <linux-arm-msm+bounces-3190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C1B802D9F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 09:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76298B20AC0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 08:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD26EFBF2;
	Mon,  4 Dec 2023 08:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lK8uDfOn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB6FA5;
	Mon,  4 Dec 2023 00:53:34 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B46sMRR027299;
	Mon, 4 Dec 2023 08:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=DNPW1/ETFxKq/RnXD14axskSrLhfYGFY6SaSrdF8b0A=;
 b=lK8uDfOn8N0dBdSaCmHVYByTU9F/KjqRMJKTmeBf7lX4SWs78+vliwV6l6yLOR6VwjkD
 SHDvTDxlZ5naPzvbRJAcLz0EdFsucBwOIhEYG0pBYE+KqjSw0skSzN9489J+VDdAibwH
 C+EaxQT5CTsdtjmFY2DLvgNwq1YbDh71XYDGQq1908RpYFF7s3Ljx4mSzeNhL5Iw8ChK
 s5qpJe3gslZfsC+mSUgnphsoxoZ4PZqO3tQ3W3BEr6ZQ2jntNgNxk08YGbne1LVafjLM
 iB//ASKZmSD7q6oHM0i8VzuSqq7vJiuxTxi6M7fe2wpHBX5LeNKxzYS66A2LeQZZz84d 0w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uqwrvuahm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 08:53:17 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B48rGCN029415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Dec 2023 08:53:16 GMT
Received: from [10.253.9.254] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 4 Dec
 2023 00:53:12 -0800
Message-ID: <312f2ea7-e0a5-4f0e-884d-85c3450e1ce3@quicinc.com>
Date: Mon, 4 Dec 2023 16:53:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] net: mdio: ipq4019: Enable GPIO reset for ipq5332
 platform
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
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <dd2c3cfa-f7ee-4abb-9eff-2aac04fa914f@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uil2KWJSHYT_R_mIUcPECDgqjouLWb4y
X-Proofpoint-GUID: uil2KWJSHYT_R_mIUcPECDgqjouLWb4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_06,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=812
 suspectscore=0 priorityscore=1501 mlxscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312040066



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

Hi Andrew,
If i put the GPIO reset in the PHY device tree node, the PHY probe
function will be postponed to be called instead of being called
during the MDIO bus register, which leads to the PCS can't be
created correctly because of reading PHY capability failed before
the PHY probe function called.

my device tree nodes are as below.

ethernet_device {
	phy-handle = <&phy3>;
	phy-mode = "2500base-x";
	...
};

mdio@90000 {
	phy3: ethernet-phy@3 {
		compatible = "ethernet-phy-id004d.d180";
		reg = <4>;
		reset-gpios = <&tlmm 51 GPIO_ACTIVE_LOW>;
		reset-assert-us = <100000>;
		reset-deassert-us = <100000>;
		clocks = <...>;
		clock-names = "...";
	};
};

Since the PHY probe function of phy3 is postponed instead of
called during the MDIO bus driver register, and the initialization
of qca8084 is not called when the ethernet_device driver is called
to create PCS, where the phy3 capability is checked, which is failed
since the qca8084 PHY probe is not called.

Any idea to resolve this call sequence issue?
Thanks.


