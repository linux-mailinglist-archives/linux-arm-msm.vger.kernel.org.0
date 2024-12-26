Return-Path: <linux-arm-msm+bounces-43329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC1F9FC7C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 04:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D873B1625FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 03:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC0C45016;
	Thu, 26 Dec 2024 03:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b+K2GNc0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF040139E;
	Thu, 26 Dec 2024 03:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735182446; cv=none; b=k2QPq/GVjAAHJIEjATjw/8Pgs9EIkGN5aYQdupa//txvUhNlO/gjA/HKjz2lHDTHsy4AERQxri3CAcL5oMgGnSno7PIVLdUR11pK09ZQsUw5KYFDhsiZB4w3BmLSJSuMrjtQgI2/K88q6+YdcqnryPvZutUbg/75aIec61EW3c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735182446; c=relaxed/simple;
	bh=oUjAAUtfJzJMEP634W6reWV6TQiuS9pIeV4GVApL9Z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PxIBGxTcLUO3XNKbcOuHg6+lIjQSNzvMvinXiLRlSezgEmm8NU50xqP/jV/Wf6UIFAzP4Q7UFz2F/cJbmc4seV8vs43iTsbX8baan0fG3IzXp7MmH0vRW2mLHbOnrHOpDVlm+Qi9O06QadX5laICMGU9UkVcoB5ThaZbBtKnbMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b+K2GNc0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BPNSuvJ014378;
	Thu, 26 Dec 2024 03:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2BlyQlB8pk/3M5PIzpsR1wJKOX8inruSQe6WtELhoos=; b=b+K2GNc0TmYVOO2t
	NuSRFG/ttrH4a9qzp6DqeEB4QMfX3QkEk9JT4rZbVKckb/ImFoAbAuceK9OexkEA
	4R+boVcziUeINfZgNB0U2dM88WrFk34mdI5dLJ0iNmq2E4MVQvS/cp4YpuGWdWk4
	+aNYk/X0MBH1hHbOXWCBZOSp//uSqeIchUP7BO63ATf79YjcVbHd6+Qy3ucxFPG/
	Joy5MoG6JokXXiczIbnixL6sJNkzePQEDT0xsO/amuWxpRzYB99Igmn2B+T0BZrZ
	mYDNCNxo6D/1+UTzTeEL51g+bAOX5ENvdovS/1RztqzXb7MY8ldKM/YZz4KXkyzb
	yCP2Wg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43rmamsvuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 03:06:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQ36v4h002066
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 03:06:57 GMT
Received: from [10.253.74.39] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Dec
 2024 19:06:51 -0800
Message-ID: <2aa2c6dd-e3f2-4b9b-8572-20b801edef81@quicinc.com>
Date: Thu, 26 Dec 2024 11:06:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Support tuning the RX sampling swap of the MAC.
To: Andrew Lunn <andrew@lunn.ch>
CC: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David
 S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <6dcfdb0b-c1ec-49f7-927e-531b20264d68@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <6dcfdb0b-c1ec-49f7-927e-531b20264d68@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aT-qbS5--U28yytijSEuIIvt2WmkGe8Z
X-Proofpoint-GUID: aT-qbS5--U28yytijSEuIIvt2WmkGe8Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=527 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260025



On 2024-12-26 01:49, Andrew Lunn wrote:
> On Wed, Dec 25, 2024 at 06:04:44PM +0800, Yijie Yang wrote:
>> The Ethernet MAC requires precise sampling times at Rx, but signals on the
>> Rx side after transmission on the board may vary due to different hardware
>> layouts. The RGMII_CONFIG2_RX_PROG_SWAP can be used to switch the sampling
>> occasion between the rising edge and falling edge of the clock to meet the
>> sampling requirements.
> 
> The RGMII specification says that RD[3:0] pins are sampled on the
> rising edge for bits 3:0 and falling edge for bits 7:4.
> 
> Given this is part of the standard, why would you want to do anything
> else?
> 
> Is this maybe another symptom of having the RGMII delays messed up?
> 
> Anyway, i don't see a need for this property, unless you are working
> with a PHY which breaks the RGMII standard, and has its clock
> reversed?

Please correct me if there are any errors. As described in the Intel and 
TI design guidelines, Dual Data Rate (DDR), which samples at both edges 
of the clock, is primarily used for 1Gbps speeds. For 100Mbps and 10Mbps 
speeds, Single Data Rate (SDR), which samples at the rising edge of the 
clock, is typically adopted.
This patch set introduces such a flag mainly for 100M/10M speeds, as 
described in the cover letter.

> 
> 	Andrew

-- 
Best Regards,
Yijie


