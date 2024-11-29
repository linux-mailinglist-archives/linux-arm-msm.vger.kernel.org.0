Return-Path: <linux-arm-msm+bounces-39505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E049DBE57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 02:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BAB02B2194A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 01:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E122BA4B;
	Fri, 29 Nov 2024 01:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pAYYoRn8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4827F4690;
	Fri, 29 Nov 2024 01:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732843229; cv=none; b=vEhXL8KNC/hIuI+02WVo56+wzBpmj6OOXjEwcrNkJDdwXVnyqL4FowTmAib9qoO+5KGSxoOnb95aTT70qvadSAcX5I2VCGwZfWxay1bHvVcl9s59H+2LRPUcacdzqmwEbg0/gpVyDavKOLkHd0bh6RYrHilECtuueQS8DN9hdQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732843229; c=relaxed/simple;
	bh=Pi14oBIs+FdlcwUNGZtXERqfv1KXwuiKhi6hnXhcuGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L2oHHF+LUo1T067I6YdDLLdiNG0d3E1byCqoQ9x8+MzhQyuQGYdSb4/EA8y6LbT532SpjGXZ490h6U/4v7/pQQ7w8JZTJ/mN6GTbMTFx+OdQ/51MI2q/tBAbAOGfHOudmeIHxR9rsMvg3/Heol8nNSJIV1ymnhdt3s/Ew6wEJHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pAYYoRn8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASNVOif005357;
	Fri, 29 Nov 2024 01:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AyKVX32spuT6dCqo7y5TcfVXCW5BX3tzaSBLiE0fFp0=; b=pAYYoRn8PhYpKJMA
	DZuG7bBu1OPSN5AKnvzAe1ynE6KJXt8Y0xII6iD8MixXdVk6FeTQ5pxIqDlnaAMr
	8EMpJkvzFNV8SXELpxnSh9Gw24CDV2zBvQvgVTRuyQiGM7RJvKBg/CUIffwB2rrO
	hWCQWVtvNJEsQu81Q2v4MVVdsrg2aSCB7zxBta7ab5iVzd2Ed2CG3BKtwx24dqtX
	pNncaA8C23O832MbYwkRRcZuYpuCpQhH4XYU3UFM+02RMuBLXwWy5SxmcjlEvno7
	lUdPKp2VOrAWlVH4KiJ39vQ0/dpa8yTEcdTrq4u4rjmRtWkPjoUzdN7owCWg51/n
	a3otTA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 436h2mjsk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 01:20:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT1KIg7029089
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 01:20:18 GMT
Received: from [10.231.216.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 17:20:14 -0800
Message-ID: <ee799d44-36aa-45ae-90bb-78c53682c45f@quicinc.com>
Date: Fri, 29 Nov 2024 09:20:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] bluetooth: qca: Add QCA6698 Bluetooth chip
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Balakrishna
 Godavarthi" <quic_bgodavar@quicinc.com>,
        Rocky Liao
	<quic_rjliao@quicinc.com>,
        <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bt@quicinc.com>
References: <20241128120922.3518582-1-quic_chejiang@quicinc.com>
 <2qhdqirb6yin3fro6kckqwrbexmi6j5gwl4qfntgo6ctcfc3jj@727464znj2r6>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <2qhdqirb6yin3fro6kckqwrbexmi6j5gwl4qfntgo6ctcfc3jj@727464znj2r6>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WBcwZ3zEPiFUlH11QQo6d8F0F3I7A3rc
X-Proofpoint-ORIG-GUID: WBcwZ3zEPiFUlH11QQo6d8F0F3I7A3rc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290009



On 11/28/2024 8:57 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 28, 2024 at 08:09:19PM +0800, Cheng Jiang wrote:
>> QCA6698 chipset shares the same IP core as the WCN6855. However,
>> it has different RF components and RAM sizes, so new firmware
>> is needed.
>>
>> This change allows driver to distinguish it from the WCN6855
>> and load the specific firmware. As the RF performance of
>> QCA6698 chip from different foundries may vary. Therefore use
>> different NVM to configure them based on board ID.
>>
>> Cheng Jiang (3):
>>   arm64: dts: qcom: sa8775p-ride: Change the BT node
>>   dt-bindings: net: Add QCA6698 Bluetooth
>>   Bluetooth: btqca: Add QCA6698 support
> 
> Order is totally incorrect:
> - dt bindings
> - driver changes
> - DTS
> 
Ack, will follow this order later
>>
>>  .../net/bluetooth/qualcomm-bluetooth.yaml     |  2 +
>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi    |  2 +-
>>  drivers/bluetooth/btqca.c                     | 47 ++++++++++++++++++-
>>  drivers/bluetooth/btqca.h                     |  1 +
>>  drivers/bluetooth/hci_qca.c                   | 36 +++++++++++++-
>>  5 files changed, 84 insertions(+), 4 deletions(-)
>>
>>
>> base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
>> --
>> 2.25.1
>>
> 


