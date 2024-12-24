Return-Path: <linux-arm-msm+bounces-43211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C3A9FBB09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:17:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 290EA1885944
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 09:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397CF1B0F09;
	Tue, 24 Dec 2024 09:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SDiO5VY2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBD417B502;
	Tue, 24 Dec 2024 09:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735031845; cv=none; b=n1YK3BCJKKA0URfV7ZK1m93rgo/Nh9NNctVbVSm2Uh4eoMJ8mwXyLpiAnNgmyV1tdRMEhnYFCObtlWL50n022igpys964YNuMHKT7Bl+QI2QWrY2umXF7kLcpmbVCLkGTcqCp/z5wkM6t6vZAQa39HMXofZv+OxoPg/Km5GLcvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735031845; c=relaxed/simple;
	bh=r3LnchZt5jiUFC/pRAo2XnQFUmzjbmH3/bh/08GwTGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MpMgg0zpPUrohHUL6BJ89VNIB0pTQfkLQEoBgyAICATyl6slEGJToiVokZrlIQmy2WDrh2xR8LRJC06dQh7qF2R+wrmWMiVKxGq2Vehd4jzumtPkk4TMQm+nIBujReI1GolGlekxRtBUnW04XkGfxz78PiDuRh1glb6/M75aFUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SDiO5VY2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNJt0SX029914;
	Tue, 24 Dec 2024 09:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4aMx8dzF99zpwMjEq3djGBe4XE2DbTVdqlX8oyPwli8=; b=SDiO5VY2wTSxGHwJ
	xgPMITu7vyRMj+KPTOmJnIu3Ew9lu8SL6cOQo7+yxIMuG84siCrrRU6wmftKDmHt
	qw6TxDP4Imjd2iavX8MWcBeF2M/LXN6/o2KChdhFyE/6aBSUWEFVbKlbwQigdv77
	4yqJswTXxVEO2ka9J0QDXmUpq5hnyBrnVgdniYifKSUZ76OAC1gGle27Q7AF2+kW
	pvLEoAi7v14JF3vk5SapiUUunzDWGtia3jxyQLbROWYlb4woI3vGDKPG/trOMtTD
	pNZeVhSsQUE0LSZvJiWz9sK6N/Dbs/17CLQbdcCwE5LH3RN4jCIvNaZJpu2sl+EJ
	e/medQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qee0j8f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 09:17:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BO9H4m1014212
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 09:17:04 GMT
Received: from [10.152.195.140] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Dec
 2024 01:16:55 -0800
Message-ID: <db61cf6e-24a9-4b99-b4f0-4871f7fefae8@quicinc.com>
Date: Tue, 24 Dec 2024 14:46:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 3/5] net: pcs: qcom-ipq9574: Add PCS
 instantiation and phylink operations
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Lei Wei <quic_leiwei@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit
	<hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_luoj@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <vsmuthu@qti.qualcomm.com>, <john@phrozen.org>
References: <20241216-ipq_pcs_6-13_rc1-v3-0-3abefda0fc48@quicinc.com>
 <20241216-ipq_pcs_6-13_rc1-v3-3-3abefda0fc48@quicinc.com>
 <d278ad9a-5d23-4cb8-9de7-5a51d838ba5d@quicinc.com>
 <yfh7kghxy5hjblnzlapcpzj54chep45pjkgpvelzbp4ijuq7ci@e6te6c36mkxc>
Content-Language: en-US
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
In-Reply-To: <yfh7kghxy5hjblnzlapcpzj54chep45pjkgpvelzbp4ijuq7ci@e6te6c36mkxc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 37VCoxNVgZKIElLSVId1cePEXBARo0vS
X-Proofpoint-GUID: 37VCoxNVgZKIElLSVId1cePEXBARo0vS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=686 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412240078



On 12/24/2024 12:45 PM, Dmitry Baryshkov wrote:
> On Tue, Dec 24, 2024 at 12:29:56PM +0530, Manikanta Mylavarapu wrote:
>>
>>
>> On 12/16/2024 7:10 PM, Lei Wei wrote:
>>> This patch adds the following PCS functionality for the PCS driver
>>> for IPQ9574 SoC:
>>>
>>> a.) Parses PCS MII DT nodes and instantiate each MII PCS instance.
>>> b.) Exports PCS instance get and put APIs. The network driver calls
>>> the PCS get API to get and associate the PCS instance with the port
>>> MAC.
>>> c.) PCS phylink operations for SGMII/QSGMII interface modes.
>>>
>>> Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
>>> ---
>>>  drivers/net/pcs/pcs-qcom-ipq9574.c   | 463 +++++++++++++++++++++++++++++++++++
>>>  include/linux/pcs/pcs-qcom-ipq9574.h |  16 ++
>>>  2 files changed, 479 insertions(+)
>>>
> 
>>> +
>>> +/* Parse the PCS MII DT nodes which are child nodes of the PCS node,
>>> + * and instantiate each MII PCS instance.
>>> + */
>>> +static int ipq_pcs_create_miis(struct ipq_pcs *qpcs)
>>> +{
>>> +	struct device *dev = qpcs->dev;
>>> +	struct ipq_pcs_mii *qpcs_mii;
>>> +	struct device_node *mii_np;
>>> +	u32 index;
>>> +	int ret;
>>> +
>>> +	for_each_available_child_of_node(dev->of_node, mii_np) {
>>> +		ret = of_property_read_u32(mii_np, "reg", &index);
>>> +		if (ret) {
>>> +			dev_err(dev, "Failed to read MII index\n");
>>> +			of_node_put(mii_np);
>>
>> Assume, the second child node failed here.
>> Returning without calling the first child node of_node_put().
>>
>> Please clear the previous child nodes resources before return.
> 
> s/clear child nodes/put OF nodes/
> 
> Note, for_each_available_child_of_node() handles refcounting for
> the nodes that we looped through. So, I don't think the comment is
> valid. If I missed something, please expand your comment.
> 

Yes, you are correct. for_each_available_child_of_node() handles the
refcount. I am dropping my comment.

> P.S. Please also trim your messages. There is no need to resend the
> whole patch if you are commenting a single function.
> 

Got it. Thank you for your input.

Thanks & Regards,
Manikanta.

