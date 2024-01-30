Return-Path: <linux-arm-msm+bounces-9055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4498428BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 17:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 045B0B273D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 16:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8656286ADC;
	Tue, 30 Jan 2024 16:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R10HlOMP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDA47F7CF;
	Tue, 30 Jan 2024 16:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706630717; cv=none; b=NbXov3j5wv6EdaiorvJKuYV258L6yvpgiTDX+fSwvyTgWUMXULNSIqY59bUtrEiPWcZyo8XXmzIPS48e+k5l+FKvjGyIdST5IC1fNR/jIfIl+sFqM0U9D7LVT1pd0GiX3DzArKNzemAS5hXrmyX7skHT8z1E6rtUwHs1qIum3DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706630717; c=relaxed/simple;
	bh=BZ8JtjWH10t0sEg0/vuGfNmzZGWVPUHR/fGt79wyKJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IpYIGP/aPWEJTDA16H+Z7KIjP07PVlRpzB2lwtf496CGAU/psWcWa9H6QlMoe6lhU+Yn3Gx7BTdZFyjHMEQJRcDY2UYGHPSpWKrxf5hCyII8sDsbq81P2WWEltW0eO9h9Mm/F5DWXgtvAbXPMp+4AbqXkzz9AY0dvhAswse9gqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R10HlOMP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40U9Sgj0013639;
	Tue, 30 Jan 2024 16:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=stfUhhoXEJ83Uc7cEU93PsVCwTX9veCXNlBP7fdmPZo=; b=R1
	0HlOMPUbBMsgM+r/+AhdgAisiPHEaW40DfvQ410K64wduZdzlKbUKEAp42MZ7ej0
	BDOWaJMXMysvfMDVt/k7YZ1BXPadL/d2rhevqK/js41mOC7lPTJfHoSwI/qx7UdH
	O6TXzwi1mpE/6wKYwkbkDquKJjzQXCFjiI7CFEkPT54ygT8EaBdFZnrGvV7vmqK7
	xZc2lL0CiPv4ciFSHxvdvtRI3CgHU2r22W+Hob5Yu7i9y7sKgdMGRTavhzYEeHz4
	81y/IaHx1KfhYm1T4cFVr4l2TsxjJYjk9aEKrBAt92LERYVXJXyQWwSR6DlwqFj7
	rwMvDrUbkLr1ck1eqyFA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxwynh1ba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 16:05:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40UG57U1017424
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 16:05:07 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 30 Jan
 2024 08:05:07 -0800
Message-ID: <6966f6a7-9fb0-0766-3b69-af82c723d349@quicinc.com>
Date: Tue, 30 Jan 2024 09:05:06 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] bus: mhi: host: Read PK HASH dynamically
Content-Language: en-US
To: Manivannan Sadhasivam <mani@kernel.org>
CC: <quic_pkanojiy@quicinc.com>, <quic_carlv@quicinc.com>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>
References: <20231208165938.1340587-1-quic_jhugo@quicinc.com>
 <20240130082138.GL32821@thinkpad>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240130082138.GL32821@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2P7bo05FKudKAO10soc6V_LC5d8qEzbx
X-Proofpoint-GUID: 2P7bo05FKudKAO10soc6V_LC5d8qEzbx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_07,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 mlxlogscore=962 malwarescore=0
 suspectscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300118

On 1/30/2024 1:21 AM, Manivannan Sadhasivam wrote:
> On Fri, Dec 08, 2023 at 09:59:38AM -0700, Jeffrey Hugo wrote:
>> The OEM PK HASH registers in the BHI region are read once during firmware
>> load (boot), cached, and displayed on demand via sysfs. This has a few
>> problems - if firmware load is skipped, the registers will not be read and
>> if the register values change over the life of the device the local cache
>> will be out of sync.
>>
>> Qualcomm Cloud AI 100 can expose both these problems. It is possible for
>> mhi_async_power_up() to be invoked while the device is in AMSS EE, which
>> would bypass firmware loading. Also, Qualcomm Cloud AI 100 has 5 PK HASH
>> slots which can be dynamically provisioned while the device is active,
>> which would result in the values changing and users may want to know what
>> keys are active.
>>
>> Address these concerns by reading the PK HASH registers on-demand during
>> the sysfs read. This will result in showing the most current information.
>>
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> Applied to mhi-next!
> 
> - Mani

I hope you applied v2 since this is a reply to v1.  I don't see mhi-next 
with this change published yet, so I can't check.

-Jeff

