Return-Path: <linux-arm-msm+bounces-40654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3DE9E648C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 04:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD1F9282312
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 03:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D15017C220;
	Fri,  6 Dec 2024 03:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hSyvHbil"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12AC13BAD7;
	Fri,  6 Dec 2024 03:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733454353; cv=none; b=UbVPICYNhjRnpfC1Jvy1ZJQltVK4rk1Y15/rg066/cbkdDQ6wCT2CABn1mSHN/CzNg63ZWz69tCpLCs8JLrwIDriZeAnK4HzvOOeHSbEJht362hwcCVe0lPi1JxE4z5c6SPfD51dCkB4PoY28f6CyGMBUV1Erh9AcaWfXa8v4Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733454353; c=relaxed/simple;
	bh=T3Xp1XR0Rvuk7KkbeJY7LtxZGM37BBn58zWdvMvVWzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EZFTPR+aM+xnqZ/DIs/Vs9fJUALAR8ztPJYJ2x06nGkIQ3wJKOvVBg06veQ/mAmJovM1i+ZVD417r0c4/U0Ay6OeHMLU+r2xF0AotYWKXcyPRrJsPRUX3D8ms7Dl2U6bSPM6RfSlKjk42K6TVDh4nrXeZna7PYN7FbLieL2WR3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hSyvHbil; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaNSh004670;
	Fri, 6 Dec 2024 03:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G62fD+phPOCoyUH42U8j3fZ5sthvA0+ukhlZ8F/WfTs=; b=hSyvHbilDf8pZ7yu
	5EnAcKjn82Q7VvHwjYglqJUBPaKLm29uxXRD+TUjYbNRinxLN2xyVA0EbTNWuUvh
	pwPtWkexz9zcMQCDhYs+pTjt5SPfzyORfZcE4EWvbq58JXKgescNUrk4tEjxFWpL
	E3xAsKaU3qsZZwQrqZ/2XNzI8aRZt8JSWQESQgtfOQT8IrksSdC/WBoKKUAnm69K
	jjMKs1UWPQVmVn4JTPdmUa8XRZ12QvG+kJhrziVPLFzUqoHNKIIWS0ExLOUpYPzX
	6NbXbc42knmqHEFElcZPOZKdaSeB4y5F3y8gm738ictcu+I9CNeZQYg+EqJGcShC
	HLA1sg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba142dad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 03:05:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B635jjY002901
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 03:05:45 GMT
Received: from [10.239.28.113] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 19:05:40 -0800
Message-ID: <938ffc54-4a5e-458c-afda-b2ffda6fe3ad@quicinc.com>
Date: Fri, 6 Dec 2024 11:05:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: net: bluetooth: qca: Expand
 firmware-name property
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
 <20241205102213.1281865-2-quic_chejiang@quicinc.com>
 <21ba63be-9a43-479f-93f8-ce1553135e15@kernel.org>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <21ba63be-9a43-479f-93f8-ce1553135e15@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wqS1beicbnvSJjHAk7h-dGGF2WnxARt7
X-Proofpoint-ORIG-GUID: wqS1beicbnvSJjHAk7h-dGGF2WnxARt7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060021

Hi Krzysztof,

On 12/5/2024 10:36 PM, Krzysztof Kozlowski wrote:
> On 05/12/2024 11:22, Cheng Jiang wrote:
>> Expand the firmware-name property to specify the names of NVM and
>> rampatch firmware to load. This update will support loading specific
>> firmware (nvm and rampatch) for certain chips, like the QCA6698
>> Bluetooth chip, which shares the same IP core as the WCN6855 but has
>> different RF components and RAM sizes, requiring new firmware files.
>>
>> We might use different connectivity boards on the same platform. For
>> example, QCA6698-based boards can support either a two-antenna or
>> three-antenna solution, both of which work on the sa8775p-ride platform.
>> Due to differences in connectivity boards and variations in RF
>> performance from different foundries, different NVM configurations are
>> used based on the board ID.
>>
>> So In firmware-name, if the NVM file has an extension, the NVM file will
>> be used. Otherwise, the system will first try the .bNN (board ID) file,
>> and if that fails, it will fall back to the .bin file.
>>
>> Possible configurations:
>> firmware-name = "QCA6698/hpnv21.bin", "QCA6698/hpbtfw21.tlv";
>> firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
>> firmware-name = "QCA6698/hpnv21.bin";
> This configuration will fail tests. Please test the binding and DTS
> before v4.
> 
Ack.
> Best regards,
> Krzysztof


