Return-Path: <linux-arm-msm+bounces-31076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2361896EE61
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 10:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB47F28489B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 08:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3B1158216;
	Fri,  6 Sep 2024 08:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZtaargOL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD9142C0B;
	Fri,  6 Sep 2024 08:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725612042; cv=none; b=nva+/BlLNraU4Pd5rx5xPeCJq6wCMAddAIvejw8kbw59+/WHv1BOWoqgnQujyGVXCitw2bUAocGAyJTekGS7ONxma9pStk6xF5dDNS4OPxHpLqGoK/NAvIZak6CxlSkiGXGELmw66FyZoCiIhfz1JiewOUumeOwaa+DvfARpgZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725612042; c=relaxed/simple;
	bh=3dU7y5W4UNQ9ImZOTxWvjuJy6KkWaXrNx9unIoW9SZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tXTHHtRcF3JBC2f2+eZ3dJEDKWD3Myvs3h9iutMZUEM72+JdCdB11c3SBeMgplsgVJjL4ZcZdw2ajFQPBbK+NXZ/4OHa6JSkSm9ei7dAMmUyBPatg+VZW4MNGplQ/nDxC2icArPPG0MzXA6rcsWgtlkCCPQwgy9i3gFlFTaJFws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZtaargOL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4868bXDT019827;
	Fri, 6 Sep 2024 08:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ghlw4Kf/YZdwFx4jN6wzWomVsBvEYUqY+Dmgy8yNDxw=; b=ZtaargOLw1Cf5nnq
	dKUSOSpFpkUu5xLzex7nsW8f4qjMicS+1LfPYe11C5fj63iM227jeNjcY6kac8rV
	KY6+f0qNhnl8lQbUtiwt95JSnhpYTCXNw/dMHjir0oBRdzWi1fMUuRzwDRhNaMPG
	GsfTg0yiSWOSyE+lIuoOiYPhKl2Xlc8qmMP3CbSq07Ap6la6lx8XRK6qy+ezgGpD
	x0NrJGUwDtqL0NJnPsxVwux1FTfmGO0gjeCDjE/wb+CkDKav16rh3jCnfQRdzTT/
	G03KMlEFgMFdqCEDp33YIr5pGTdkix4Os+6TlfBXVIwl5zw1Qu/b9euupuelVi3b
	ooqFtQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu1n4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 08:40:27 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4868eN6m008396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Sep 2024 08:40:23 GMT
Received: from [10.239.133.118] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Sep 2024
 01:40:20 -0700
Message-ID: <237865a2-61fb-4d05-a57d-261710aad821@quicinc.com>
Date: Fri, 6 Sep 2024 16:40:18 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] phy: add NXP PTN3222 eUSB2 to USB2 redriver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Neil
 Armstrong <neil.armstrong@linaro.org>
References: <20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org>
 <20240830-nxp-ptn3222-v2-2-4c6d8535cf6c@linaro.org>
 <6fcaa893-70a4-44f4-afc0-853799e30774@quicinc.com>
 <CAA8EJpoTb_-HtBPv2=FecHvtHYQD4ipqfq3C98ky=qXEXB=_6Q@mail.gmail.com>
Content-Language: en-US
From: Song Xue <quic_songxue@quicinc.com>
In-Reply-To: <CAA8EJpoTb_-HtBPv2=FecHvtHYQD4ipqfq3C98ky=qXEXB=_6Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: C6EUPLbKsna7x83NeOFbSGOvCCvR56nu
X-Proofpoint-GUID: C6EUPLbKsna7x83NeOFbSGOvCCvR56nu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=987 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060061



On 8/31/2024 7:45 AM, Dmitry Baryshkov wrote:
> On Sat, 31 Aug 2024 at 02:13, Song Xue <quic_songxue@quicinc.com> wrote:
>> On 8/30/2024 4:20 PM, Dmitry Baryshkov wrote:
>>> The NXP PTN3222 is the single-port eUSB2 to USB2 redriver that performs
>>> translation between eUSB2 and USB2 signalling schemes. It supports all
>>> three data rates: Low Speed, Full Speed and High Speed.
>>>
>>> The reset state enables autonegotiation of the PHY role and of the data
>>> rate, so no additional programming is required.
>>>
>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> Tested-by: Konrad Dybcio <konradybcio@kernel.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/phy/Kconfig           |  11 ++++
>>>    drivers/phy/Makefile          |   1 +
>>>    drivers/phy/phy-nxp-ptn3222.c | 123 ++++++++++++++++++++++++++++++++++++++++++
>>>    3 files changed, 135 insertions(+)
> 
> [trimmed]
> 
>>> +
>>> +MODULE_DESCRIPTION("NXP PTN3222 eUSB2 Redriver driver");
>>> +MODULE_LICENSE("GPL");
>>>
>> The I2C driver just realizes the function on reset and PWR. What about
>> other I2C driver function like I2C interface operations,
> 
> I don't quite understand what you mean by this. Could you please clarify?
> 
>>   auto-suspend,
> 
> I think you mean pm_runtime here. It's a valid case, but granted that
> it should stay enabled when USB controller is enabled, the gain should
> be pretty limited. I'll consider a followup patch implementing
> pm_runtime for the sake of being able to disable I2C host if DWC3
> controller disables the PHY.
> 
>> remote wakeup,
> 
> Not supported by design. PTN3222 doesn't have IRQ pins to report
> events to the host.
> 
>> memory maps etc.
> 
> huh?
> 
>>   Who will enable these? I think it is not
>> incomplete I2C driver, if on someday, ptn3222 is used as I2C device.
> 
> Well, I'm using it as an I2C device.
> 
Sorry for the delayed response.
The functions I listed, such as auto-suspend and wake-up, are just 
examples. My main point is that a basic I2C driver should include 
fundamental functions like setting up the I2C bus, configuring the 
clock, and setting the SDA (data line) and SCL (clock line). A basic I2C 
driver shouldn’t be limited to enabling the power supply and reset pin, 
as these features can be handled by other drivers as well.
If you implement these fundamental functions, I think it will be sufficient.

Regards,
Song Xue



