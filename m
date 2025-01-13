Return-Path: <linux-arm-msm+bounces-44888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F37A0B714
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 13:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E92941671FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 12:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B1D122A4CB;
	Mon, 13 Jan 2025 12:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n0s7Aun4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE24115667D;
	Mon, 13 Jan 2025 12:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771923; cv=none; b=CFCC5hQU7O62DYl9oMbpnliebbV/e5dWyMJQNvasQFWZDuUSWxc/8khTllg5ay+Krs5oCURC07DNYVJC5yyrFcPlF8TFbP/kdZpF+AifVroxP+IrDd0PC6gFGfgbToZKKJE/kdKr9xPZH71/oZPoKnycnQP2v7jjtkm04VETzGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771923; c=relaxed/simple;
	bh=tjqMiNiQbn1nzZHkqLUV+mgpgwbFs0hkK4i43iXFpx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pA+C0rEr/1Zt2QtzK2VHGWB3ql679rjem3NB4fhKTnZwieZcWNQ4C3n3gB4m6RE8yvVg5WVUd917Mlq3gs8CPo8ErNQWLyPkc7JfrgtW07XTPYHfE+kCb9Z996D4p4TYObFzO6COSsYjrXk2v5ree8S/d1OcdLECYuInqTnbv1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n0s7Aun4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DAieLc015594;
	Mon, 13 Jan 2025 12:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+1jxtuHqGrt+7AWlzi82hXADTE/630O73IYS0ye7sk=; b=n0s7Aun4PDfBPVXr
	AWYwWbzFUlR4trS2jG3kWCZmlSVmGp8goNX1VWmmeDRnjMyLJWOLdscF9iAS84Hl
	qyDe5OxUp++IQDCXD7EW80RgKYLMt4SzQ56mq+wO9CiO0WgJ7L/JgyzcoDz3lxAC
	lySTQHTgG4s3muJMbYfFHmpi3zVRMNTX5+e1zbBubNH89yihAUeUBAVJCYGBLwyb
	wx9GWRdAhzMe/UfbgRxdyvDRAitod9Uqp42+sUnLgf5G+6WdD9HvR4XEFLo/CvEW
	dj9vVGoxdI1frDFDRN5MDTCgQ8redEecmXwLMN/sOhBSxdYzBlCZxE6EJlpM1PxD
	xyFmKQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444f5bjfwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 12:38:38 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DCcchq006178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 12:38:38 GMT
Received: from [10.216.33.75] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 04:38:35 -0800
Message-ID: <d7d68648-6356-43da-b13a-1a6b2cf976de@quicinc.com>
Date: Mon, 13 Jan 2025 18:08:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: qcs9100: Update memory map
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250113-sa8775p-iot-memory-map-v2-0-aa2bb544706e@quicinc.com>
 <20250113-sa8775p-iot-memory-map-v2-2-aa2bb544706e@quicinc.com>
 <5cd4e2aa-be24-4298-a23d-352e82e9c1e1@kernel.org>
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <5cd4e2aa-be24-4298-a23d-352e82e9c1e1@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HJLEaqTUabMjFN37hE2FHOmxnqXCYD8J
X-Proofpoint-ORIG-GUID: HJLEaqTUabMjFN37hE2FHOmxnqXCYD8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 mlxlogscore=586 malwarescore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130106


On 1/13/2025 5:50 PM, Krzysztof Kozlowski wrote:
> On 13/01/2025 13:13, Pratyush Brahma wrote:
>> Update the iot specific memory map for qcs9100* boards.
> Why?
>
> Every single time. Don't say what, we see it easily. Say why.
I assumed incorrectly it would be perhaps enough to have mentioned
this in patch 1 of this series and the cover letter, so didn't mention here.

Can you please review the memory map changes in patch 1 as well?
Once the strategy for the dts changes are baked in internally with the
current reviews, I will send out another series incorporating the comments
with the memory map changes.
>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts | 2 ++
>>   arch/arm64/boot/dts/qcom/qcs9100-ride.dts    | 2 ++
>>   2 files changed, 4 insertions(+)
>>
> Best regards,
> Krzysztof

-- 
Thanks and Regards
Pratyush Brahma


