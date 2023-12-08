Return-Path: <linux-arm-msm+bounces-3865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46368809C61
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 07:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 775731C20C76
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 06:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91FF16105;
	Fri,  8 Dec 2023 06:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dGUwH2oH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7B08C6;
	Thu,  7 Dec 2023 22:32:54 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B85KFXV011564;
	Fri, 8 Dec 2023 06:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iCkKyaxiYdxzfg/WwZHBxHNJPERVT37Zd6iR0xmfKus=;
 b=dGUwH2oHTjHJoccjkkQT0XK+DUPBQ0Z2jhP9UW8rKYqEFjFe5BmVeWVns6ymQ0PkV3GH
 xbOfQnxyH+tatJvzYIDcUwl0GW4WT/12EqN84dJNc4O3C4CjhPZ63gFXW37I/jGBiC+C
 QOWDBeYak+oZcVZK84My9R1xXqGcqMXdHw/r65S7SalXWTfcggOhlVDpGSyek65NSXtr
 GJdh8VAqGBw+cwfw3ii5VHqMXv7owgLbBEhoaqPD+97E0K9u6SF6ngfTzdhi+xD/x2k7
 aAJHAi7EXdAAHFKhHDXF4AF78CSVv4AV67SlPgv7oN8AVzv70UjGbF6XcJ73McnhnIGB nQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uuu2089t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 06:32:36 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B86WZjY000662
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Dec 2023 06:32:35 GMT
Received: from [10.216.0.250] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 7 Dec
 2023 22:28:30 -0800
Message-ID: <dd585977-50c4-40a4-a664-0ecb5a84807a@quicinc.com>
Date: Fri, 8 Dec 2023 11:58:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: Add sysfs nodes for
 qcom ethqos
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
CC: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu
	<joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>,
        <andersson@kernel.org>
References: <20231204084854.31543-1-quic_snehshah@quicinc.com>
 <3e4a1b9c-ed0f-466e-ba11-fc5b7ef308a1@lunn.ch>
 <5d5f3955-fc30-428c-99f4-42f9b7580a84@quicinc.com>
 <0c966845-2bbc-4196-806d-6a33e435bf7d@lunn.ch>
From: Sneh Shah <quic_snehshah@quicinc.com>
In-Reply-To: <0c966845-2bbc-4196-806d-6a33e435bf7d@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: B99xYamoXjrVNY8d7lbmhBPPKShxHT9-
X-Proofpoint-ORIG-GUID: B99xYamoXjrVNY8d7lbmhBPPKShxHT9-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=948
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080051



On 12/6/2023 7:22 PM, Andrew Lunn wrote:
> On Wed, Dec 06, 2023 at 05:17:25PM +0530, Sneh Shah wrote:
>>
>>
>> On 12/5/2023 8:38 PM, Andrew Lunn wrote:
>>> On Mon, Dec 04, 2023 at 02:18:54PM +0530, Sneh Shah wrote:
>>>> Add sysfs nodes to conifigure routing of specific vlan id to GVM queue.
>>>> GVM queue is not exposed to PVM stmmac, so TC ops can't configure routing.
>>>
>>> Adding files in /sysfs has ~0 chance of being accepted.
>>>
>>> As requested, please explain what all these different hardware blocks
>>> are, and what you are trying to achieve. We can then recommend the
>>> correct interface.
>>>
>>>     Andrew
>>>
>>> ---
>>> pw-bot: cr
>>
> 
>> We have multiVM Architecture here. PVM will have stmmac running with
>> 4 Rx Tx queues. stmmac in PVM is responsible to configure whole
>> ethernet HW MAC/DMA/MTL ( including clocks, regulators and other
>> core bsp elements).
> 
> Please remember that stmmac is mostly used in embedded systems. People
> used to embedded systems generally don't know virtual machine
> terminology. So please spell out what PBM, GVM, etc mean.
> 
>> In GVM we have thin Ethernet driver, which is responsible to
>> configure and manage only 1 Rx/TX queue, i.e 5th Rx/Tx ethernet
>> queue. GVM can't access any other resisters apart from this 5th
>> queue specific MTL and DMA registers.
>  
>> We need to route vlan traffic of a specific Priority to GVM Queue
>> (Ethernet queue 5) via programming a MAC register. The MAC register
>> is not accessible in GVM and has to be programmed from PVM. stmmac
>> already has TC OPS to program this routing via vlan
>> priority. However, as PVM has only 4 queues enabled, TC tool will
>> not take 5th queue as input. Hence, these nodes were added to
>> conifure the MAC register to route specific vlan packets to 5th
>> queue in GVM.
>  
>> Note: The queues mentioned above are HW MTL Queues and DMA
>> Channels. The routing can be done in the HW itself based on vlan pcp
>> before the packets reach to driver.
> 
> Is the normal way you would do this is like this:
> 
> tc qdisc add dev eth1 parent root handle 100 \
> mqprio num_tc 4 \
> map 0 1 2 3 0 0 0 0 0 0 0 0 0 0 0 0 \
> queues 1@0 1@1 1@2 1@3 \
> hw 1
> 
> But you are saying that you cannot extend this to 5 queues?
> 
>     Andrew

Yes this can't extend to 5 queues. Because, stmmac in primary virtual machine will only have 4 netdev queues. So TC won't take input for 5th queue.

