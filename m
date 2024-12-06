Return-Path: <linux-arm-msm+bounces-40650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A80489E645A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 03:42:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6870F2849FE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 02:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB2B1741D2;
	Fri,  6 Dec 2024 02:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BpMpiTDE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8EE13B79F;
	Fri,  6 Dec 2024 02:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733452959; cv=none; b=s6U9JwgZSD6/KSYQ+gtGw2luUi+8iNIT835wrVeMqCeMjIVJ1RB3FLKhqgVVzIzWDXgTU0vc88YPYvQUfB2hfq7nQklmtY8yXReSbLQ+R8qVLej0AmuI1sRWwijUiEIpZEOevcWaQPPQurQPMOHW2KxpOcNJzWiyhvq0idu03rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733452959; c=relaxed/simple;
	bh=oC2bG85aiCBjlKZSmgmEVRxZxOGzCsaTbkfo5G40xm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pGi9WEihkRkeuiR0H1FTvuU5xzXB6lCgwbPRBO5VQWQSktxc2Utzr2c4ywE1dYIPBL1I6OUKTjKK7kPKxuZbuiD0AY0cMBxw2h6ryiS5OfGTP3p/EUJPj/xo3CgkOwNHZCTJYuwyLuQWYEA1oOOF75LSOChzjZv6rsRTogdOcRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BpMpiTDE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaMOg015782;
	Fri, 6 Dec 2024 02:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7mhBVUP/sAwpgVvgJMuXKHJqQpydxz/f3X3B33Og2E=; b=BpMpiTDEgA6oXh96
	iZk+m9CAhpH5ZvLmLvQ0PkLdQJhHYmHE2vvKpr0U3WVOmhl6x0bcYksQidVK8n1k
	gV4Q+QMZxxBOvISTHEH+XFDhmXT8oy9aG4eoXosCGiSkH2CYZqYxz8+gLSXDalks
	NHaWYowmNMl4v3Ht9OHgbExRJat1I37dI0NclyhVBCQUY+th8vUDSg376sTGbOaN
	wl4VyuUTf451FGfjZlo2KDNATnFTRw6oVLA8mq69rdck/HMoE9lCEWFxaeNmDG5h
	zubiid8yPGD3giLNP1g9Oy6hyWSEH9L0z5mMsmeMAgLU7c5XG77h3wc/LdPwzhMj
	j7b3jA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnmj28p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 02:42:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B62gVr0008486
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 02:42:31 GMT
Received: from [10.233.22.158] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 18:42:26 -0800
Message-ID: <0176828a-56c5-4a26-9014-4e9efd2d5efd@quicinc.com>
Date: Fri, 6 Dec 2024 10:42:24 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] Bluetooth: qca: Expand firmware-name to load
 specific nvm and rampatch
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Marcel Holtmann
	<marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Balakrishna Godavarthi
	<quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
CC: <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_jiaymao@quicinc.com>, <quic_shuaz@quicinc.com>,
        <quic_zijuhu@quicinc.com>, <quic_mohamull@quicinc.com>
References: <20241205102213.1281865-1-quic_chejiang@quicinc.com>
 <20241205102213.1281865-3-quic_chejiang@quicinc.com>
 <ce3237d3-e281-4534-ae40-f6762d25a690@kernel.org>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <ce3237d3-e281-4534-ae40-f6762d25a690@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SFaYgMsPMiYegXGpdYWn6fAPlqd6Z7fl
X-Proofpoint-GUID: SFaYgMsPMiYegXGpdYWn6fAPlqd6Z7fl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060018

Hi Krzysztof,

On 12/5/2024 10:37 PM, Krzysztof Kozlowski wrote:
> On 05/12/2024 11:22, Cheng Jiang wrote:
>> @@ -2309,8 +2322,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>>  	qcadev->serdev_hu.serdev = serdev;
>>  	data = device_get_match_data(&serdev->dev);
>>  	serdev_device_set_drvdata(serdev, qcadev);
>> -	device_property_read_string(&serdev->dev, "firmware-name",
>> -					 &qcadev->firmware_name);
>> +	of_property_read_string_index(serdev->dev.of_node, "firmware-name",
>> +					 0, &qcadev->firmware_name);
>> +	of_property_read_string_index(serdev->dev.of_node, "firmware-name",
>> +					 1, &qcadev->rampatch_name);
> No, that's entirely different API. You are not supposed to drop here
> device-API and revert to OF. It is not a related change, either.
> 
Ack, Will change this in next version.
> 
> Best regards,
> Krzysztof


