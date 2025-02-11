Return-Path: <linux-arm-msm+bounces-47569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD3DA30BE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23D663A9B8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 12:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E24206F02;
	Tue, 11 Feb 2025 12:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LFEZNeQU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D28204873;
	Tue, 11 Feb 2025 12:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739277476; cv=none; b=iNnvynZG3Ua4fuPWhsizv1HrM18rB7Mj9hqd4LUxy1NJnxhOXUK2Y00tJmaFXiem4LAFTdKhxJ627oG4V2lcJFeJ4MA/+ZbXvIVI8cAsVVZ4hn8H8porbIDQsP9C03DYEhRaGRh+yI+oArqmaAxBZi5I9/oZO12SR6kLM8r/PbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739277476; c=relaxed/simple;
	bh=9FFcc2GB0jSxjG8mkUaYtqfXPHpoxeLtabpNTGFeG4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nWH5y8FyjjXnDbtPKZa+9o5Vxpqu084keGD36LRHMTP21DB7Bo0xW4WjWo3PKPTRWDwkPap0VuR+2PyvClRtXeUyU4cJLZTPH9RImH3QpZtUHLgqeTMLIrCjgRNGxyMzlwbm4/j0dlge63sVV8yQEg2CBMFnstvqnafaSaKLSCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LFEZNeQU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B94jQp008337;
	Tue, 11 Feb 2025 12:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ShQz5N2nxj49mik6Xuy9nBMQQOaIIynX9b3fSGhxsg=; b=LFEZNeQUlwmQ7HAZ
	8Wyar+uSmq+UpgF3Ih6JZuM1oS8lZYmL40/ekviaI1v2aF3kzTW4Y15UdIBlliSr
	PRPNAY0GPPbOSDSXx6QYj5e2RwbMaHPcPoLylvra5o4sCp3eGQmxQAGtLfuphxG0
	j6pYLu2YSUcTfk+eKdIhWW2/2QOyk7Z41B49I0EmbqVKIDjxJUx2IISfmWUMdype
	teialJ/uHKeYJhnOAOLfuK2Bn/TRmk6qlYz3u6hPYBfaTIg5fxZLZJrfq/xMUsVP
	afKApbCNstTFFsIvzrr3kIfQYFaTyFPpY7jG1sl/XdKa9H6jv4oCfTfV/8eneqTR
	1M6ehw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewh41bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 12:37:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51BCbXSP004532
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 12:37:33 GMT
Received: from [10.253.72.242] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Feb
 2025 04:37:26 -0800
Message-ID: <387fbaa0-4210-4e75-aa15-003866c7735f@quicinc.com>
Date: Tue, 11 Feb 2025 20:36:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 02/14] docs: networking: Add PPE driver
 documentation for Qualcomm IPQ9574 SoC
To: Bagas Sanjaya <bagasdotme@gmail.com>, Luo Jie <quic_luoj@quicinc.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo
 Abeni" <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suruchi
 Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, "Simon Horman" <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees
 Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Philipp Zabel" <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-2-453ea18d3271@quicinc.com>
 <Z6lhPB1y3BBFI4ux@archie.me>
Content-Language: en-US
From: Lei Wei <quic_leiwei@quicinc.com>
In-Reply-To: <Z6lhPB1y3BBFI4ux@archie.me>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JSPcQpJY_klIsepDx3cn02vvpTQmds5h
X-Proofpoint-GUID: JSPcQpJY_klIsepDx3cn02vvpTQmds5h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_05,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110081



On 2/10/2025 10:15 AM, Bagas Sanjaya wrote:
> On Sun, Feb 09, 2025 at 10:29:36PM +0800, Luo Jie wrote:
>> +The Ethernet functionality in the PPE (Packet Process Engine) is comprised of three
>> +components: the switch core, port wrapper and Ethernet DMA.
>> +
>> +The Switch core in the IPQ9574 PPE has maximum of 6 front panel ports and two FIFO
>> +interfaces. One of the two FIFO interfaces is used for Ethernet port to host CPU
>> +communication using Ethernet DMA. The other is used communicating to the EIP engine
>                                      "The other one is used ..."

OK, I will fix here in next update.

>> +which is used for IPsec offload. On the IPQ9574, the PPE includes 6 GMAC/XGMACs that
>> +can be connected with external Ethernet PHY. Switch core also includes BM (Buffer
>> +Management), QM (Queue Management) and SCH (Scheduler) modules for supporting the
>> +packet processing.
>> +
>> <snipped>...
>> +The PPE driver files in drivers/net/ethernet/qualcomm/ppe/ are listed as below:
>> +
>> +- Makefile
>> +- ppe.c
>> +- ppe.h
>> +- ppe_config.c
>> +- ppe_config.h
>> +- ppe_debugfs.c
>> +- ppe_debugfs.h
>> +- ppe_regs.h
> 
> If somehow new source files were added, should the list above be updated to
> keep up?
> 

Yes, the list will be updated when new files added in the following PPE 
MAC and EDMA patch series.

>> +Enabling the Driver
>> +===================
>> +
>> +The driver is located in the menu structure at:
>> +
>> +  -> Device Drivers
>> +    -> Network device support (NETDEVICES [=y])
>> +      -> Ethernet driver support
>> +        -> Qualcomm devices
>> +          -> Qualcomm Technologies, Inc. PPE Ethernet support
> 
> Literal code block should format above nicer, but plain paragraph is fine.
> 

OK, I will use Literal code block by using "at::" to replace "at:" here. 
hope it is fine.

>> +
>> +If this driver is built as a module, we can use below commands to install and remove it:
>> +
>> +- insmod qcom-ppe.ko
>> +- rmmod qcom-ppe.ko
> 
> "If the driver is built as a module, the module will be called qcom-ppe."
> (I assume that readers know how to insert/remove modules).
> 

OK, I will modify this sentence in next update.

> Thanks.
> 


